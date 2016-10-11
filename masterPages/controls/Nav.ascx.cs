using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class masterPages_controls_Nav : System.Web.UI.UserControl
{
    public SqlConnection con;
    public SqlDataReader dr;
    public String SqlStr;
    SqlPage sQl = new SqlPage();
    GlobalVariables g = new GlobalVariables();
    string cGroupId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetCookie();
            AreYouAdmin();
        }
    }
    protected void SetCookie()
    {
        string lWhoAreYou = HttpContext.Current.User.Identity.Name.ToString();
        string  lGroupId = "";
        string lSites = GetSiteIdAssignments(lWhoAreYou);

        SqlStr = "usp_AreYouAdmin";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@DomainId", lWhoAreYou));

        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            lGroupId = dr["GroupId"].ToString();
        }
        dr.Close();
        cmd.Cancel();

        HttpCookie _userInfoCookie = new HttpCookie("GCSAGApp");
        _userInfoCookie["UserId"] = lWhoAreYou;
        _userInfoCookie["GroupId"] = lGroupId;
        _userInfoCookie["sites"] = lSites;
        Response.Cookies.Add(_userInfoCookie);
  }
    protected void AreYouAdmin()
    {
        Page lPageName = this.Page;

        HttpCookie _userInfoCookie = Request.Cookies["GCSAGApp"];
        if(_userInfoCookie != null)
            {
                cGroupId = _userInfoCookie["GroupId"];
            }
        if (cGroupId == "ADMIN")
        {
            if (lPageName.ToString() != "ASP.defaultadmin_aspx")
            {
                btnReturnToMain.Visible = false;
            }
            else
            {
                btnAdmin.Visible = false;
                btnAppData.Visible = false;
                btnReturnToMain.Visible = true;
            }
           
        }
        else
        {
            btnReturnToMain.Visible = false;
            btnAdmin.Visible = false;
        }
        if (cGroupId == "READ")
        {
            btnReturnToMain.Visible = false;
            btnReports.Visible = false;
        }
       
    }
    protected string GetSiteIdAssignments(string gWhoAreYou)
    {
        string lYourSites = "";
        SqlStr = "usp_getYourSites";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@DomainId", gWhoAreYou));
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {

            if (lYourSites.Trim() == "")
            {
                lYourSites =  dr["SiteId"].ToString() ;
            }
            else
            {
                lYourSites = lYourSites + "," + dr["SiteId"].ToString() ;
            }

       }
       
        dr.Close();
        cmd.Cancel();
        return lYourSites;

    }
    protected void btnAddNewStudent_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/defaultAddStudent.aspx");
    }
    protected void btnReports_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/DefaultReports.aspx");
    }
    protected void btnAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/defaultAdmin.aspx");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("/Login/login.aspx");
    }
    protected void btnReturnToMain_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }
    protected void btnAppData_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/DefaultAppData.aspx");
    }
}