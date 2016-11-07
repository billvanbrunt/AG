using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.IO;

public partial class controls_ctrlDefaultEligibilityInfo : System.Web.UI.UserControl
{
    public SqlConnection con;
    public SqlDataReader dr;
    public String SqlStr;
    public string lStudentId;
    SqlPage sQl = new SqlPage();
    public string gGroupId;

    protected void Page_Load(object sender, EventArgs e)
    {
        lStudentId = Request.QueryString["id"];
        if (!IsPostBack)
        {
            LoadLevelofService();
            LoadDecisions();
            OpenStudentInformation(lStudentId);
            LoadStudentHistory(lStudentId);
        }
        gGroupId = GetCookieGroup();
        setRights(gGroupId);
    }
    protected void setRights(string vGroupId)
    {
        if (vGroupId == "READ")
        {
            btnUpdate.Style["display"] = "none";
        }

    }
    protected string GetCookieGroup()
    {
        string lGroupId = "";
        HttpCookie _userInfoCookie = Request.Cookies["GCSAGApp"];
        if (_userInfoCookie != null)
        {
            lGroupId = _userInfoCookie["GroupId"];
        }
        return lGroupId;
    }
    protected void LoadDecisions()
    {
        ddlDecision.Items.Clear();
        ddlDecision.Items.Add(new ListItem("", ""));
        SqlStr = "usp_GetDecionTypes";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;

        dr = cmd.ExecuteReader();
        ddlDecision.DataSource = dr;
        ddlDecision.DataBind();
        dr.Close();
        cmd.Cancel();

    }
    protected void LoadLevelofService()
    {
        ddlReading.Items.Clear();
        ddlMath.Items.Clear();
        ddlScience.Items.Clear();
        ddlSocialStudies.Items.Clear();

        SqlStr = "usp_GetLevelofService";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");

        ddlReading.Items.Add(new ListItem("", ""));
        ddlMath.Items.Add(new ListItem("", ""));
        ddlScience.Items.Add(new ListItem("", ""));
        ddlSocialStudies.Items.Add(new ListItem("", ""));

        ddlReading.DataSource = ds;
        ddlReading.DataBind();
        ddlMath.DataSource = ds;
        ddlMath.DataBind();
        ddlScience.DataSource = ds;
        ddlScience.DataBind();
        ddlSocialStudies.DataSource = ds;
        ddlSocialStudies.DataBind();

        cmd.Cancel();
    }
    protected void LoadStudentHistory(string vStudentId)
    {
        grdHistory.ClearPreviousDataSource();
        grdHistory.DataSource = null;
        grdHistory.DataBind();

        SqlStr = "usp_GetStudentHistory";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@StudentId", vStudentId));
        dr = cmd.ExecuteReader();

        grdHistory.DataSource = dr;
        grdHistory.DataBind();
        dr.Close();
        cmd.Cancel();
    }
    protected void OpenStudentInformation(string vStudentId)
    {
        ClearForm();
        SqlStr = "usp_GetStudentEligibilityInfo";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@StudentId", vStudentId));

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");
        txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
        txtStudentId.Text = vStudentId;
        txtSchoolName.Text = ds.Tables[0].Rows[0]["School"].ToString();
        txtLastModificationInfo.Text = ds.Tables[0].Rows[0]["LastModifiedDate"].ToString() + "&nbsp;&nbsp;&nbsp;<b>By:</b> " + ds.Tables[0].Rows[0]["LastModifiedBy"].ToString();
        txtModificationType.Text = ds.Tables[0].Rows[0]["ChangeType"].ToString();
        
        string tempDate = ds.Tables[0].Rows[0]["PlacementDate"].ToString();
        int DOSpace = tempDate.IndexOf(' ');
        txtInitialScreeningDate.Text = tempDate.Substring(0, DOSpace);
        txtInitialScreeningDate2.Text = tempDate.Substring(0, DOSpace);
        
        string lTS = ds.Tables[0].Rows[0]["TraditionalStudy"].ToString();
        string lNTS = ds.Tables[0].Rows[0]["NonTraditionalStudy"].ToString();
        if (lTS != "0")
        {
            ddlTraditional.SelectedValue = lTS;
            txtTraditional.Text = ddlTraditional.SelectedItem.ToString();
        }
        if (lNTS != "0")
        {
            ddlNonTraditional.SelectedValue = lNTS;
            txtNonTraditional.Text = ddlNonTraditional.SelectedItem.ToString();
        }
        try
        {
            ddlDecision.SelectedValue = ds.Tables[0].Rows[0]["DecisionId"].ToString();
            txtDecision.Text = ds.Tables[0].Rows[0][4].ToString();
        }
        catch (Exception)
        {
            txtDecision.Text = ds.Tables[0].Rows[0]["3"].ToString();
            ddlDecision.SelectedItem.Value = ds.Tables[0].Rows[0]["DecisionId"].ToString();
        }
        try
        {
            ddlReading.SelectedValue = ds.Tables[0].Rows[0]["Reading"].ToString();
            ddlMath.SelectedValue = ds.Tables[0].Rows[0]["Math"].ToString();
            ddlScience.SelectedValue = ds.Tables[0].Rows[0]["Science"].ToString();
            ddlSocialStudies.SelectedValue = ds.Tables[0].Rows[0]["SocialStudies"].ToString();
        }
        catch (Exception) { }
        txtReading.Text = ds.Tables[0].Rows[0]["Reading"].ToString();
        txtMath.Text = ds.Tables[0].Rows[0]["Math"].ToString();
        txtScience.Text = ds.Tables[0].Rows[0]["Science"].ToString();
        txtSocialStudies.Text = ds.Tables[0].Rows[0]["SocialStudies"].ToString();

        string lSDS = ds.Tables[0].Rows[0]["SupportPlanStartDate"].ToString();
        string lSPRD = ds.Tables[0].Rows[0]["SupportPlanResolvedDate"].ToString();

        if (lSDS != "01/01/1900")
        {
            chkSupportPlanStartReadOnly.Checked = false;
            chkSupportPlanStartReadOnly.Enabled = false;
            chkSupportPlanStart.Checked = false;
            chkSupportPlanStart.Enabled = true;
            txtSupportPlanStartDateReadOnly.Text = lSDS;
        }
        if (lSPRD != "01/01/1900")
        {
            chkSupportPlanResolvedReadOnly.Checked = false;
            chkSupportPlanResolvedReadOnly.Enabled = false;
            chkSupportPlanResolved.Checked = false;
            chkSupportPlanResolved.Enabled = true;
            txtSupportPlanResolvedDateReadOnly.Text = lSPRD;
        }

        string lUserId = HttpContext.Current.User.Identity.Name.ToString();
        txtComments.Text = System.DateTime.Now.ToString() + "\r\nBy: " + lUserId + "\r\n\r\n\r\n" + ds.Tables[0].Rows[0]["Comments"].ToString();
        //txtCommentsEdit.Text = "";
    }
    protected void ShowSearchWindowAgain_Click(object sender, EventArgs e)
    {
        Response.Redirect("/default.aspx");
    }
    protected void btnTest_Click(object sender, EventArgs e)
    {
        Response.Redirect("/defaultTestInformation.aspx?id=" + lStudentId);
    }
    protected void btnStudentEligibilityRecord_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/DefaultStudentEligibilityRecord.aspx?id=" + lStudentId);
    }
    protected void btnServerSaveData_Click(object sender, EventArgs e)
    {
        string lUserId = HttpContext.Current.User.Identity.Name.ToString();
        int lDecision = Convert.ToInt16(ddlDecision.SelectedValue);
        string lTradit = ddlTraditional.SelectedValue.ToString();
        string lNTradit = ddlNonTraditional.SelectedValue.ToString();
        string lReading = ddlReading.SelectedValue.ToString();
        string lMath = ddlMath.SelectedValue.ToString();
        string lScience = ddlScience.SelectedValue.ToString();
        string lSocal = ddlSocialStudies.SelectedValue.ToString();
        DateTime lStartDate = DateTime.Parse("1900-01-01");
        DateTime lEndDate = DateTime.Parse("1900-01-01");

        
        string llDate = Request.Form["txtSupportPlasnStart"].ToString();

        if (llDate != "")
        {
            lStartDate = DateTime.Parse(llDate);
        }
        llDate = Request.Form["txtSupportPlanResolved"];

        if (llDate != "")
        {
            lEndDate = DateTime.Parse(llDate);
        }
        SqlStr = "usp_SaveNewEligibility";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;


        //cmd.Parameters.Add(new SqlParameter("@TripMonth", lTripMonth.ToString()));
        cmd.Parameters.Add(new SqlParameter("@StudentId", lStudentId));
        cmd.Parameters.Add(new SqlParameter("@EnterBy", lUserId));
        cmd.Parameters.Add(new SqlParameter("@Decision", lDecision));
        cmd.Parameters.Add(new SqlParameter("@TraditionalStudy", lTradit));
        cmd.Parameters.Add(new SqlParameter("@NonTraditionalStudy", lNTradit));
        cmd.Parameters.Add(new SqlParameter("@Reading", lReading));
        cmd.Parameters.Add(new SqlParameter("@Math", lMath));
        cmd.Parameters.Add(new SqlParameter("@Science", lScience));
        cmd.Parameters.Add(new SqlParameter("@SocialStudies", lSocal));
        cmd.Parameters.Add(new SqlParameter("@SupportPlanStartDate", lStartDate));
        cmd.Parameters.Add(new SqlParameter("@SupportPlanResolvedDate", lEndDate));
        //cmd.Parameters.Add(new SqlParameter("@Comments", lComments));

        cmd.ExecuteNonQuery();

        LoadLevelofService();
        LoadDecisions();
        OpenStudentInformation(lStudentId);
        LoadStudentHistory(lStudentId);

    }
    protected void btnServerSaveNotes_Click(object sender, EventArgs e)
    {
        string lComments = txtComments.Text;

        SqlStr = "usp_SaveComments";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@StudentId", lStudentId));
        cmd.Parameters.Add(new SqlParameter("@Comments", lComments));

        cmd.ExecuteNonQuery();
    }
    protected void ClearForm()
    {
        txtFullName.Text = "";
        txtStudentId.Text = "";
        txtSchoolName.Text = "";
        txtLastModificationInfo.Text = "";
        txtModificationType.Text = "";
        ddlTraditional.SelectedValue = "0";
        txtTraditional.Text = "";
        ddlNonTraditional.SelectedValue = "0";
        txtNonTraditional.Text ="";
      //  ddlDecision.SelectedValue ="0";
        txtDecision.Text = "";
        txtDecision.Text = "";
        ddlDecision.SelectedItem.Value = "0";
        ddlReading.SelectedValue = "";
        ddlMath.SelectedValue = "";
        ddlScience.SelectedValue = "";
        ddlSocialStudies.SelectedValue = "";
        txtReading.Text = "";
        txtMath.Text = "";
        txtScience.Text = "";
        txtSocialStudies.Text = "";


    }

}