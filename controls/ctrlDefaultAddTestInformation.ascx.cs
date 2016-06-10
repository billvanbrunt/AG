using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class controls_ctrlDefaultAddTestInformation : System.Web.UI.UserControl
{

    public SqlConnection con;
    public SqlDataReader dr;
    public String SqlStr;
    public string lStudentId;
    SqlPage sQl = new SqlPage();
    GlobalVariables g = new GlobalVariables();
    protected void Page_Load(object sender, EventArgs e)
    {
        lStudentId = Request.QueryString["id"];
        LoadStudentInfo(lStudentId);
    }
    protected void LoadTestInfo(string vStudentId)
    {
        SqlStr = "usp_GetStudentTestInfo";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@StudentId", vStudentId));

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");

        grdActiveData.DataSource = ds.Tables[0];
        grdActiveData.DataBind();

        grdAptitudeData.DataSource = ds.Tables[1];
       grdAptitudeData.DataBind();
       
        grdTeacherInput.DataSource = ds.Tables[2];
        grdTeacherInput.DataBind();
    }
    protected void LoadStudentInfo(string vStudentId)
    {
        SqlStr = "usp_GetNewStudentInfo";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@StudentId", vStudentId));

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");
        if (ds.Tables.Count >= 1)
        {
            txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
            txtStudentId.Text = vStudentId;
            txtSchoolName.Text = ds.Tables[0].Rows[0]["School"].ToString();
        }
    }
    protected void EligibilityInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("/DefaultEligibilityInfo.aspx?id=" + lStudentId);
    }
    
    protected void ShowSearchWindowAgain_Click(object sender, EventArgs e)
    {
        Response.Redirect("/default.aspx");
    }
    protected void btnStudentInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("/defaultAddStudent.aspx?id=" + lStudentId);

    }

    protected void btnStudentEligibilityRecord_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/DefaultAddStudentEligibilityRecord.aspx?id=" + lStudentId);
    }
}

 