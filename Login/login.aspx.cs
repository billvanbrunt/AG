using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.DirectoryServices;
using System.Data.OleDb;
using System.Runtime.InteropServices;
using System.Security.Principal;


public partial class login : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        txtLoginUserID.Focus();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       Boolean IsValid =false;
       if (txtLoginUserID.Text != "" && txtLoginPassword.Text != "") { IsValid = true; }
        
        if (IsValid)
        {
            HttpCookie roles = Request.Cookies["gcsroles"];
            if (roles != null)
            {
                roles.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(roles);
            }

            string adPath =  System.Configuration.ConfigurationManager.AppSettings["DefaultActiveDirectoryServer"];
            LdapAuthentication adAuth = new LdapAuthentication(adPath);

            try
            {
                if (true == adAuth.IsAuthenticated("gcs-domain", txtLoginUserID.Text, txtLoginPassword.Text))
                {
                    // Retrieve the user's groups
                    string groups = adAuth.GetGroups();
                    Session["theGroups"] = groups;
                    // Create the authetication ticket
                    FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, txtLoginUserID.Text, DateTime.Now, DateTime.Now.AddMinutes(60), false, groups);
                    // Now encrypt the ticket.
                    string encryptedTicket = FormsAuthentication.Encrypt(authTicket);
                    // Create a cookie and add the encrypted ticket to the
                    // cookie as data.
                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    // Add the cookie to the outgoing cookies collection.
                    Response.Cookies.Add(authCookie);

                    Page.Session["username"] = txtLoginUserID.Text;
                                           
                    // Redirect the user to the originally requested page
                    Response.Redirect("/default.aspx");
                }
                else
                {
                    lblError.Text = "Authentication failed, check username and password.";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error authenticating. " + ex.Message;
                lblError.Text += "<br/><br/><a href=/" + Request.QueryString + ">";
            }
        }
    }

    protected void LoginValid_ServerValidate(object sender, ServerValidateEventArgs e)
    {
        if (String.IsNullOrEmpty(txtLoginUserID.Text) || String.IsNullOrEmpty(txtLoginPassword.Text))
        {
            e.IsValid = false;
            lblError.Text = "You must enter a User ID and Password.";
        }
    }
}
