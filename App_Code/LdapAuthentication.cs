using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using System.Collections;
using System.DirectoryServices;
using System.Data.OleDb;

/// <summary>
/// Summary description for LdapAuthentication
/// </summary>
public class LdapAuthentication
{
	public LdapAuthentication()
	{
	}

    public LdapAuthentication(string path)
    {
        _path = path;
    }

    private string _path;
    private string _filterAttribute;
    private string _userid;

    public bool IsAuthenticated(string domain, string username, string pwd)
    {
        string domainAndUsername = domain + @"\" + username;
        _userid = username;
        DirectoryEntry entry = new DirectoryEntry(_path, domainAndUsername, pwd);

        try
        {
            // Bind to the native AdsObject to force authentication.
            Object obj = entry.NativeObject;
            DirectorySearcher search = new DirectorySearcher(entry);
            search.Filter = "(SAMAccountName=" + username + ")";
            search.PropertiesToLoad.Add("cn");
            SearchResult result = search.FindOne();
            if (null == result)
            {
                return false;
            }
            // Update the new path to the user in the directory
            _path = result.Path;
            _filterAttribute = (String)result.Properties["cn"][0];
        }
        catch (Exception ex)
        {
            throw new Exception("Error authenticating user. " + ex.Message);
        }
        return true;
    }

    public string GetGroups()
    {
        StringBuilder groupNames = new StringBuilder();

        string path = ConfigurationSettings.AppSettings["DefaultActiveDirectoryServer"];

        OleDbCommand olecmd = new OleDbCommand();
        olecmd.Connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["LDAPCONN"].ConnectionString);
        olecmd.CommandText = "SELECT memberOf FROM '" + path + "' WHERE SAMAccountName='" + _userid + "'";

        try
        {
            olecmd.Connection.Open();
            OleDbDataReader dr = olecmd.ExecuteReader();
            if (dr.Read())
            {
                int equalsIndex = 0;
                int commaIndex = 0;
                string dn = String.Empty;
                foreach (object group in (object[])dr["memberOf"])
                {
                    dn = group.ToString();

                    equalsIndex = dn.IndexOf("=", 1);
                    commaIndex = dn.IndexOf(",", 1);
                    if (-1 == equalsIndex)
                    {
                        return null;
                    }
                    groupNames.Append(dn.Substring((equalsIndex + 1), (commaIndex - equalsIndex) - 1));
                    groupNames.Append("|");
                }
            }
            dr.Close();
            olecmd.Connection.Close();
            olecmd.Dispose();
        }
        catch (Exception ex)
        {
            throw new Exception("Error obtaining group names. " + ex.Message);
        }

        return groupNames.ToString();
    }

    public static void LogOut()
    {
        FormsAuthentication.SignOut();
        HttpCookie rolecookie = HttpContext.Current.Request.Cookies["gcsroles"];
        if (rolecookie != null)
        {
            rolecookie.Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Cookies.Add(rolecookie);
        }

        HttpContext.Current.Response.Redirect("/");
    }
}
