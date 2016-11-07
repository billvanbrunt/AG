using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using Obout.Grid;



public partial class controls_ctrlDefault : System.Web.UI.UserControl
{
    public SqlConnection con;
    public SqlDataReader dr;
    public String SqlStr;
    SqlPage sQl = new SqlPage();
    public String gSites;
    GlobalVariables g = new GlobalVariables();
    public String gGroup;
    protected void Page_Load(object sender, EventArgs e)
    {

        gSites = GetCookieSites();
        if(gGroup != "ADMIN" && gSites == "")
        {
            Response.Redirect("/defaultError.aspx");
        }
    }
    protected void doStudentSearch()
    {
        var lLastName = "%";
        var lFirstName = "%";
        var lStudentId = "%";
        string lSites = "";

      
        if (gSites != "")
        {
            lSites = gSites;
        }

        if (txtLastName.Text != "")
        {
            lLastName = ("%" + txtLastName.Text + "%");
        }

        if (txtFirstName.Text != "")
        {
            lFirstName = ("%" + txtFirstName.Text + "%");
        }
        if (txtStudentId.Text != "")
        {
            lStudentId = txtStudentId.Text;
        }
        
        if( gGroup == "ADMIN")
        {
            SqlStr = "usp_GetAllStudentsAdmin";
        }
        else
        {
            SqlStr = "usp_GetAllStudentsTest";
        }

    
        if (gGroup == "ADMIN")
        {
            SqlStr = "usp_GetAllStudentsAdmin";
        }
        else
        {
            SqlStr = "usp_GetAllStudentsTest";
        }

        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@LastName", lLastName));
        cmd.Parameters.Add(new SqlParameter("@FirstNAme", lFirstName));
        cmd.Parameters.Add(new SqlParameter("@StudentId", lStudentId));
        if (gGroup != "ADMIN")
        {
            cmd.Parameters.Add(new SqlParameter("@SiteId", lSites));
           
         }

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");

        divSearchResults.Style.Add("display", "block");
        divSearchEntry.Style.Add("display", "none");
        grdActiveStudents.DataSource = ds.Tables[0];
        grdActiveStudents.DataBind();

        grdSearchResultInactive.DataSource = ds.Tables[1];
        grdSearchResultInactive.DataBind();

        grdSearchResultProspective.DataSource = ds.Tables[2];
        grdSearchResultProspective.DataBind();

        da.Dispose();
        cmd.Cancel();
        txtLastName.Text = "";
        txtStudentId.Text = "";
        txtStudentId.Text = "";
    }
    protected string GetCookieSites()
    {
        string lSiteId = "";
        HttpCookie _userInfoCookie = Request.Cookies["GCSAGApp"];
        if (_userInfoCookie != null)
        {
            lSiteId = _userInfoCookie["Sites"];
            gGroup = _userInfoCookie["GroupId"];
        }
        return lSiteId;
    }
    protected void btnAddNewStudent_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/defaultAddStudent.aspx");
    }
    protected void btnReports_Click(object sender, EventArgs e)
    {

    }
    protected void btnAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/defaultAdmin.aspx");
    }
    protected void btnSearchServer_Click(object sender, EventArgs e)
    {
        doStudentSearch();
    }
    protected void OpenStudentData(object sender, Obout.Grid.GridRecordEventArgs e)
    {
        string lStudentId = "";
        if (grdActiveStudents.SelectedRecords != null)
        {
            foreach (Hashtable oRecord in grdActiveStudents.SelectedRecords)
            {
                lStudentId = oRecord["StudentId"].ToString();
            }

            Response.Redirect("/defaultstudent.aspx?ID=" + lStudentId );
        }
    }
    protected void OpenProspectiveStudentData(object sender, Obout.Grid.GridRecordEventArgs e)
    {
        string lStudentId = "";
        if (grdSearchResultProspective.SelectedRecords != null)
        {
            foreach (Hashtable oRecord in grdSearchResultProspective.SelectedRecords)
            {
                lStudentId = oRecord["StudentId"].ToString();
            }

            Response.Redirect("/DefaultAddStudent.aspx?ID=" + lStudentId);
        }
    }
}