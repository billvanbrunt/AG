using System;
using System.Web;
using System.Web.Security;
using System.Security.Principal;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Text;
using System.Web.Configuration;
using System.Text.RegularExpressions;

namespace WebApplication
{
    public partial class Global : System.Web.HttpApplication
    {
        GlobalVariables g = new GlobalVariables();
        public Global()
        {
           
        }

        protected void Application_Start(object sender, EventArgs e)
        {
            //Make sure the connection string is encrypted when the web service is started.
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~");
            ConfigurationSection connectionStrings = config.GetSection("connectionStrings");

            //If the section is not protected by encryption, encrypt the section.
            if (connectionStrings.SectionInformation.IsProtected == false)
            {
                connectionStrings.SectionInformation.ProtectSection("DataProtectionConfigurationProvider");
                config.Save(); //Save the settings
               
            }
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            // Extract the forms authentication cookie
            string cookieName = FormsAuthentication.FormsCookieName;
            HttpCookie authCookie = Context.Request.Cookies[cookieName];

            if (null == authCookie)
            {
                // There is no authentication cookie.
                return;
            }

            //Extract and ecrypt authentication ticket
            FormsAuthenticationTicket authTicket = null;
            try
            {
                authTicket = FormsAuthentication.Decrypt(authCookie.Value);
            }
            catch (Exception ex)
            {
                // Log exception details (omitted for simplicity)
                return;
            }

            if (null == authTicket)
            {
                // Cookie failed to decrypt.
                return;
            }

            // When the ticket was created, the UserData property was assigned a
            // pipe delimited string of group names.
            String groups = authTicket.UserData;

            // Create an Identity object
            GenericIdentity id = new GenericIdentity(authTicket.Name, "LdapAuthentication");
            
            //Get the users roles
            String[] roles;
            string rolestring = String.Empty;
            HttpCookie rolecookie = HttpContext.Current.Request.Cookies["gcsroles"];
            if (rolecookie == null)
            {
                // if the cookie doesn't exist get roles from the DB and create cookie
                rolestring = GetUserRoles(id.Name, groups);
                CreateRoleCookie(id.Name, rolestring, groups);
            }
            else if (Convert.ToString(rolecookie.Values["userid"]) != id.Name)
            {
                //If logged in as a different user get new roles and create cookie
                rolestring = GetUserRoles(id.Name, groups);
                CreateRoleCookie(id.Name, rolestring, groups);
            }
            else
            {
                //get roles from the cookie
                rolestring = Utilities.Decrypt(rolecookie.Values["userid"], rolecookie.Values["roles"]);
            }
            //Get the users security rights for the site
            roles = rolestring.Split('|');

            // This principal will flow throughout the request.
            GenericPrincipal principal = new GenericPrincipal(id, roles);
            // Attach the new principal object to the current HttpContext object
            Context.User = principal;

            //Response.Write("Groups: " + authTicket.UserData + "<br>");
        }

        private void CreateRoleCookie(string userid, string roles, string groups)
        {
            HttpCookie rolecookie = new HttpCookie("gcsroles");
            rolecookie.Values["roles"] = Utilities.Encrypt(userid, roles);
            rolecookie.Values["groups"] = groups;
            rolecookie.Values["userid"] = userid;
            HttpContext.Current.Response.Cookies.Add(rolecookie);
        }

        private string GetUserRoles(string userid, string grouplist)
        {
            String[] groups = grouplist.Split(new char[] { '|' });

            string rolelist = String.Empty;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            try
            {
                conn.Open();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = conn;
                sqlcmd.Parameters.AddWithValue("@UserID", userid);

                // Build a where string for the user's active directory groups
                string rolewhere = String.Empty;
                int roleindex = 0;
                string roleparam = String.Empty;
                if (groups.Length > 0)
                {
                    foreach (string group in groups)
                    {
                        roleparam = "@Group" + roleindex.ToString();
                        rolewhere += "MemberSource.MemberID = " + roleparam + " OR ";
                        sqlcmd.Parameters.AddWithValue(roleparam, group);
                        roleindex++;
                    }

                    rolewhere = " OR (MemberSource.MemberType = 'A' AND (" + rolewhere.Remove(rolewhere.LastIndexOf(" OR ")) + "))";
                }

                sqlcmd.CommandText = @"SELECT RoleID
                                    FROM
                                        (
                                            SELECT
	                                            Security.RoleMembership.RoleID,
	                                            MemberSource.MemberType,
	                                            MemberSource.MemberID
                                            FROM
	                                            Security.RoleMembership
	                                            INNER JOIN Security.GroupMembership AS MemberSource
		                                            ON Security.RoleMembership.MemberID = MemberSource.GroupID
		                                            AND Security.RoleMembership.MemberType = 'G'
                                            WHERE (MemberSource.MemberType = 'U' AND MemberSource.MemberID = @UserID)" + rolewhere;
                sqlcmd.CommandText += @"      UNION ALL
                                            SELECT
	                                            RoleID,
	                                            MemberType,
	                                            MemberID
                                            FROM
	                                            Security.RoleMembership AS MemberSource
                                            WHERE (MemberSource.MemberType = 'U' AND MemberSource.MemberID = @UserID)" + rolewhere;
                sqlcmd.CommandText += @" ) RoleList
                                    GROUP BY RoleID";

                //build a comma seperated string of the roles
                SqlDataReader dr = sqlcmd.ExecuteReader();
                while (dr.Read())
                {
                    rolelist += dr["RoleID"].ToString() + "|";
                }
                dr.Close();

                conn.Close();
                conn.Dispose();
            }
            catch (Exception ex)
            {
                conn.Close();
                conn.Dispose();

                throw (ex);
            }

            rolelist = rolelist.TrimEnd(',');

            return rolelist;
        }
    }
}