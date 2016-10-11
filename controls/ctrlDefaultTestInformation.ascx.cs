using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Obout.Grid;

public partial class controls_ctrlDefaultTestInformation : System.Web.UI.UserControl
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
        LoadTestInfo(lStudentId);
        CheckForReadOnly();
    }
    protected void CheckForReadOnly()
    {
        string lGroupid = GetCookies();
        if (lGroupid == "READ")
        {
            btnADDAdditionalAptitude.Visible = false;
            btnAddAdditionalAchievmentTest.Visible = false;
            btnAddAcheivmentTest.Visible = false;
            btnADDAptitude.Visible = false;
            btnAddTeacherInfo.Visible = false;
            btnAddStudentInfo.Visible = false;
        }
    }
    protected string GetCookies()
    {
        string lGroupId = "";
        HttpCookie _userInfoCookie = Request.Cookies["GCSAGApp"];
        if (_userInfoCookie != null)
        {
           // lSiteId = _userInfoCookie["Sites"];
            lGroupId = _userInfoCookie["GroupId"];
        }
        return lGroupId;
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

        grdStudentInput.DataSource = ds.Tables[3];
        grdStudentInput.DataBind();

        grdAddAdditionalAchievmentTest.DataSource = ds.Tables[5];
        grdAddAdditionalAchievmentTest.DataBind();

        grdAdditionalAptitudeData.DataSource = ds.Tables[4];
        grdAdditionalAptitudeData.DataBind();
        
        cmd.Cancel();
        da.Dispose();
        ds.Dispose();

    }
    protected void LoadStudentInfo(string vStudentId){
        SqlStr = "usp_GetStudentEligibilityInfo";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@StudentId", vStudentId));

        DataSet ds = new DataSet();
        
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");
        if (ds.Tables.Count>=1){
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
        Response.Redirect("/defaultStudent.aspx?id=" + lStudentId);
    }
    protected void clearAchData()
    {
        ddlTestName.SelectedIndex=-1;
        ddlSubject.SelectedIndex=-1;
        ddlUseForEligibility.SelectedIndex = -1;
    }
    protected void btnStudentInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("/defaultStudent.aspx?id=" + lStudentId);

    }
    protected void btnStudentEligibilityRecord_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/DefaultStudentEligibilityRecord.aspx?id=" + lStudentId);
    }
    protected void btnServerSaveAchevment_Click(object sender, EventArgs e)
    {
        string lUserId = HttpContext.Current.User.Identity.Name.ToString();
        string lTestName = ddlTestName.SelectedValue.ToString();
        string lSubject = ddlSubject.SelectedItem.ToString();
        string lTestDate = Request.Form["txtAchTestDate"];
        string lUseForEligibility = ddlUseForEligibility.SelectedValue.ToString();
        string lScore = Request.Form["txtAchScore"].ToString();
        string lScaleScore = Request.Form["txtAchScaleScore"].ToString();
        SqlStr = "usp_AddAcheivmentTest";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@StudentId", lStudentId));
        cmd.Parameters.Add(new SqlParameter("@Subject", lSubject));
        cmd.Parameters.Add(new SqlParameter("@TestName", lTestName));
        cmd.Parameters.Add(new SqlParameter("@TestDate", lTestDate));
        cmd.Parameters.Add(new SqlParameter("@Score",lScore));
        cmd.Parameters.Add(new SqlParameter("@ScaleScore", lScaleScore));
        cmd.Parameters.Add(new SqlParameter("@UseForEligibility", lUseForEligibility));
        cmd.Parameters.Add(new SqlParameter("@EnteredBy", lUserId));

        cmd.ExecuteNonQuery();
        LoadTestInfo(lStudentId);
        clearAchData();
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "OpenSaveSuccessful();", true);
        Response.Redirect("~/defaultTestInformation.aspx?id=" + lStudentId);

    }
    protected void btnServerSaveAptitude_Click(object sender, EventArgs e)
    {
        string lUserId = HttpContext.Current.User.Identity.Name.ToString();
        string lTestName = ddlAppTestName.SelectedValue.ToString();
        string lTestDate = Request.Form["txtAppTestDate"];
        string lScore = txtAppTestScore.Text;
        string lUserfor = ddlAddAdditionalApptestUseForEligibility.SelectedValue.ToString();
        SqlStr = "usp_AddAcheivmentTest";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@StudentId", lStudentId));
        cmd.Parameters.Add(new SqlParameter("@Subject", "Aptitude"));
        cmd.Parameters.Add(new SqlParameter("@TestName", lTestName));
        cmd.Parameters.Add(new SqlParameter("@TestDate", lTestDate));
        cmd.Parameters.Add(new SqlParameter("@Score", lScore));
        cmd.Parameters.Add(new SqlParameter("@UseForEligibility", lUserfor));
        cmd.Parameters.Add(new SqlParameter("@EnteredBy", lUserId));

        cmd.ExecuteNonQuery();
        LoadTestInfo(lStudentId);


        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "OpenSaveAPTSuccessful();", true);
        Response.Redirect("~/defaultTestInformation.aspx?id=" + lStudentId);

    }
    protected void btnServerSaveTeacherInfo_Click(object sender, EventArgs e)
    {
        string lUserId = HttpContext.Current.User.Identity.Name.ToString();
        string lTestName = ddlAppTestName.SelectedValue.ToString();
        string lTestDate = Request.Form["txtTeacherDate"];
        string lScore = txtTeacherScore.Text;
        int lUserfor = Int32.Parse(cboTeacherUsedFor.SelectedValue);


        SqlStr = "usp_SaveTeachersInput";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
       
        cmd.Parameters.Add(new SqlParameter("@StudentId", lStudentId));
        cmd.Parameters.Add(new SqlParameter("@Name", lTestName));
        cmd.Parameters.Add(new SqlParameter("@ModifiedBy", lUserId));
        //cmd.Parameters.Add(new SqlParameter("@ModifiedDate", lTestDate));
        cmd.Parameters.Add(new SqlParameter("@UseForEligibility", lUserfor));
        cmd.Parameters.Add(new SqlParameter("@Score", lScore));
        cmd.Parameters.Add(new SqlParameter("@RatingDate", lTestDate));


        cmd.ExecuteNonQuery();
        LoadTestInfo(lStudentId);


        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "OpenSaveTeacherSuccessful();", true);
        Response.Redirect("~/defaultTestInformation.aspx?id=" + lStudentId);
    }
    protected void btnServerSaveStudentInfo_Click(object sender, EventArgs e)
    {
        string lUserId = HttpContext.Current.User.Identity.Name.ToString();
        string lTestDate = Request.Form["txtStudentDate"];
        string lName = txtStudentInput.Text;
        string lScore = txtStudentrScore.Text;
        int lUserfor = Int32.Parse(cboStudentUsedFor.SelectedValue);

        SqlStr = "usp_SaveStudentInput";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@StudentId", lStudentId));
        cmd.Parameters.Add(new SqlParameter("@Name", lName));
        cmd.Parameters.Add(new SqlParameter("@ModifiedBy", lUserId));
        //cmd.Parameters.Add(new SqlParameter("@ModifiedDate", lTestDate));
        cmd.Parameters.Add(new SqlParameter("@UseForEligibility", lUserfor));
        cmd.Parameters.Add(new SqlParameter("@Score", lScore));
        cmd.Parameters.Add(new SqlParameter("@RatingDate", lTestDate));


        cmd.ExecuteNonQuery();
        LoadTestInfo(lStudentId);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "OpenStudentSaveSuccessful();", true);
        Response.Redirect("~/defaultTestInformation.aspx?id=" + lStudentId);
    }
    protected void btnServerSaveAdditionalAchievmentTest_Click(object sender, EventArgs e)
    {
        string lUserId = HttpContext.Current.User.Identity.Name.ToString();
        string lTestName = ddlAdditionalAchievmentTestName.SelectedValue.ToString();
        string lSubject = ddlAddAdditionalAchievementTestSubject.SelectedItem.ToString();
        string lTestDate = Request.Form["txtAddAdditionalAchievementTestDate"];
        string lUseForEligibility = ddlAddAdditionalAchievementUseForEligibility.SelectedValue.ToString();
        string lScore = Request.Form["txtAddAdditionalAchievementTestScore"];
        string lScaleScore = Request.Form["txtAddAdditionalAchievementTestScaleScore"];
        SqlStr = "usp_AddAcheivmentTest";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@StudentId", lStudentId));
        cmd.Parameters.Add(new SqlParameter("@Subject", lSubject));
        cmd.Parameters.Add(new SqlParameter("@TestName", lTestName));
        cmd.Parameters.Add(new SqlParameter("@TestDate", lTestDate));
        cmd.Parameters.Add(new SqlParameter("@Score", lScore));
        cmd.Parameters.Add(new SqlParameter("@ScaleScore", lScaleScore));
        cmd.Parameters.Add(new SqlParameter("@UseForEligibility", lUseForEligibility));
        cmd.Parameters.Add(new SqlParameter("@EnteredBy", lUserId));

        cmd.ExecuteNonQuery();
        LoadTestInfo(lStudentId);
        clearAchData();
       
        Response.Redirect("~/defaultTestInformation.aspx?id=" + lStudentId);
    }
    protected void btnServerSaveAdditionalAptitude_Click(object sender, EventArgs e)
    {
        string lUserId = HttpContext.Current.User.Identity.Name.ToString();
        string lTestName = ddlAdditionalAptTestName.SelectedValue.ToString();
        string lTestDate = Request.Form["txtAdditionalAptTestDate"].ToString();
        string lScore = txtAdditionalAptTestScore.Text;
        string lUserfor = ddlAddAdditionalApptestUseForEligibility.SelectedValue.ToString();
        SqlStr = "usp_AddAcheivmentTest";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@StudentId", lStudentId));
        cmd.Parameters.Add(new SqlParameter("@Subject", "Additional Aptitude"));
        cmd.Parameters.Add(new SqlParameter("@TestName", lTestName));
        cmd.Parameters.Add(new SqlParameter("@TestDate", lTestDate));
        cmd.Parameters.Add(new SqlParameter("@Score", lScore));
        cmd.Parameters.Add(new SqlParameter("@UseForEligibility", lUserfor));
        cmd.Parameters.Add(new SqlParameter("@EnteredBy", lUserId));

        cmd.ExecuteNonQuery();
        LoadTestInfo(lStudentId);

              
        Response.Redirect("~/defaultTestInformation.aspx?id=" + lStudentId);
    }
}
