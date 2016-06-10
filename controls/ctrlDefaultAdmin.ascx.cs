using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;





public partial class controls_ctrlDefaultAdmin : System.Web.UI.UserControl
{
    public SqlConnection con;
    public SqlDataReader dr;
    public String SqlStr;
    public string lStudentId;
    SqlPage sQl = new SqlPage();
    GlobalVariables g = new GlobalVariables();
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadGrid();
    }
    protected void LoadGrid()
    {
        SqlStr = "usp_GetUsersAssignments";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");

        grdActiveMembers.DataSource = ds.Tables[0];
        grdActiveMembers.DataBind();
        grdAddSchool.DataSource = ds.Tables[1];
        grdAddSchool.DataBind();
    }
    protected void btnServerGetUserSearch_Click(object sender, EventArgs e)

    {
        LoadGridData();
    }
    protected void LoadGridData()
    {
        ddlGroups.Items.Clear();
        string lLastName = txtSearchName.Text + "%";
        SqlStr = "usp_GetStaff";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@LastName", lLastName ));
        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");

        grdEmployees.DataSource = ds.Tables[0];
        grdEmployees.DataBind();

        grdSchoolSelect.DataSource = ds.Tables[1];
        grdSchoolSelect.DataBind();

        ddlGroups.Items.Add(new ListItem(""));
        ddlGroups.DataSource = ds.Tables[2];
        ddlGroups.DataBind();

        cmd.Cancel();
        
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "OpenEmployeeDiv();", true);
    }
    protected void btnReturnToServer_Click(object sender, EventArgs e)
    {
        string lMemberId = "";
        string lSiteId = "";
        string lGroupId = "";
     

        foreach (Hashtable oRecord in grdActiveMembers.SelectedRecords)
        {
           lMemberId= oRecord["MemberId"].ToString();
           lSiteId = oRecord["SiteId"].ToString();
           lGroupId = oRecord["Groupid"].ToString();
     
        }

        SqlStr = "usp_DeleteUser";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@MemberId", lMemberId));
        cmd.Parameters.Add(new SqlParameter("@SiteId", lSiteId));
        cmd.Parameters.Add(new SqlParameter("@GroupId", lGroupId));
        cmd.ExecuteNonQuery();

        LoadGrid();
    }
    protected void btnServerSaveNewEmployee_Click(object sender, EventArgs e)
    {
        string lSiteId = "";
        string lMemberId = "";
        string lGroupId = "";
        string lSiteName = "";
        string lModifiedBy = HttpContext.Current.User.Identity.Name.ToString();
        lGroupId = ddlGroups.SelectedValue.ToString();

        if (lGroupId == "ADMIN")
        {
            foreach (Hashtable oRecord in grdEmployees.SelectedRecords)
            {

                lMemberId = oRecord["MemberId"].ToString();
                SqlStr = "usp_SaveEmployeeAdmin";
                SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@DomainId", lMemberId));
                cmd.Parameters.Add(new SqlParameter("@LastModifiedBy", lModifiedBy));
                cmd.ExecuteNonQuery();
            }
        }
        else //Not ADMIN USER
        {
            foreach (Hashtable oRecord in grdEmployees.SelectedRecords) //Used to save Group Information
            {

                lMemberId = oRecord["MemberId"].ToString();
                SqlStr = "usp_SaveUserOther";
                SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@DomainId", lMemberId));
                cmd.Parameters.Add(new SqlParameter("@LastModifiedBy", lModifiedBy));
                cmd.Parameters.Add(new SqlParameter("@GroupId", lGroupId));
                cmd.ExecuteNonQuery();
            }

            foreach (Hashtable oRecord in grdSchoolSelect.SelectedRecords) //Used to save schools 
            {
               
                    lSiteId =  oRecord["SiteId"].ToString();


                SqlStr = "usp_InsertSites";
                SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@DomainId", lMemberId));
                cmd.Parameters.Add(new SqlParameter("@LastModifiedBy", lModifiedBy));
                cmd.Parameters.Add(new SqlParameter("@SiteId", lSiteId));
                cmd.ExecuteNonQuery();
            }
           
        }
    }
    protected void btnServerAddSited_Click(object sender, EventArgs e)
    {
        string lSiteId = "";
        string lMemberId = "";
        string lUserId = HttpContext.Current.User.Identity.Name.ToString();

        foreach (Hashtable oRecord in grdActiveMembers.SelectedRecords)
        {
             lMemberId = oRecord["MemberId"].ToString();
        }
        foreach (Hashtable oRecord in grdAddSchool.SelectedRecords)
        {
           lSiteId = oRecord["SiteId"].ToString();
            SqlStr = "usp_InsertSites";
            SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@DomainId", lMemberId));
            cmd.Parameters.Add(new SqlParameter("@SiteId", lSiteId));
            cmd.Parameters.Add(new SqlParameter("@LastModifiedBy", lUserId));
            cmd.ExecuteNonQuery();

            LoadGrid();




        }
    }
    protected void btnReturnToMain_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }
}

