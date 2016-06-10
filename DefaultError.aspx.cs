using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DefaultError : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "OpenMsg();", true);
        
    }
    protected void GoToMainPage(object sender, EventArgs e)
    {
       Response.Redirect("/Login/login.aspx");
    }
}