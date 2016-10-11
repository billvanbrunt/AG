using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class controls_ctrlDefaultEligibilityInfo : System.Web.UI.UserControl
{
    public SqlConnection con;
    public SqlDataReader dr;
    public String SqlStr;
    public string lStudentId;
    SqlPage sQl = new SqlPage();
  
    
    protected void Page_Load(object sender, EventArgs e)
    {
        lStudentId = Request.QueryString["id"];

        if (!IsPostBack)
        {
            LoadLevelofService();
            LoadDecisions();
            OpenStudentInformation(lStudentId);
        }
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
    protected void LoadLevelofService() {

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
    protected void OpenStudentInformation(string vStudentId)
    {
        SqlStr = "usp_GetNewStudentInfo";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@StudentId", vStudentId));

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");
        txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
        txtStudentId.Text = ds.Tables[0].Rows[0]["StudentId"].ToString();
        txtSchoolName.Text = ds.Tables[0].Rows[0]["School"].ToString();


    }
    protected void ShowSearchWindowAgain_Click(object sender, EventArgs e)
    {
        Response.Redirect("/default.aspx");
    }
    protected void btnTest_Click(object sender, EventArgs e)
    {
        Response.Redirect("/defaultTestInformation.aspx?id=" + lStudentId);
    }
    protected void btnCancelSaveData_Click(object sender, EventArgs e)
    {
        Response.Redirect("/defaultAddStudent.aspx?id=" + lStudentId);

    }
    protected void btnServerSaveData_Click(object sender, EventArgs e)
    {
        string lUserId = HttpContext.Current.User.Identity.Name.ToString();
        string lDecision =  ddlDecision.SelectedValue.Trim();
        string lTraditional = ddlTraditional.SelectedValue.Trim();
        string lNonTrasitional = ddlNontraditional.SelectedValue.Trim();
        string lReading = ddlReading.SelectedValue.Trim();
        string lMath = ddlMath.SelectedValue.Trim();
        string lScience = ddlScience.SelectedValue.Trim();
        string lSocialStudies = ddlSocialStudies.SelectedValue.Trim();
        string lSPIDate="1900/01/01";
        string lSPrDate="1900/01/01";
       
        string lInitialScreeningDate = Request.Form["txtInitialScreeningDate"];
        
            if (chkSupportPlanStart.Checked == true)
            {
                lSPIDate = Request.Form["txtSupportPlasnStart"];
            }
       
        if(chkSupportPlanResolved.Checked == true)
            {
                lSPrDate = Request.Form["txtSupportPlanResolved"];
            }

        SqlStr = "usp_SaveNewStudent";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        //var x = hftxtInitalScreeningDate.Value;
        //var y = hftxtSupportStartDate.Value;
        //var z = hftxtSupportEndDate.Value;

        DateTime lt1 = DateTime.Parse(lSPIDate);
        DateTime lt2 = DateTime.Parse(lSPrDate);
        DateTime lt3 = DateTime.Parse(lInitialScreeningDate);

        cmd.Parameters.Add(new SqlParameter("@StudentId", lStudentId));
        cmd.Parameters.Add(new SqlParameter("@Decision", lDecision));
        cmd.Parameters.Add(new SqlParameter("@Traditional", lTraditional));
        cmd.Parameters.Add(new SqlParameter("@NonTrasitional", lNonTrasitional));
        cmd.Parameters.Add(new SqlParameter("@Reading", lReading));
        cmd.Parameters.Add(new SqlParameter("@Math", lMath));
        cmd.Parameters.Add(new SqlParameter("@Science", lScience));
        cmd.Parameters.Add(new SqlParameter("@SocialStudies", lSocialStudies));
        cmd.Parameters.Add(new SqlParameter("@PortfolioSubmitted", lt3));
        cmd.Parameters.Add(new SqlParameter("@LastModifiedBy", lUserId));
        cmd.Parameters.Add(new SqlParameter("@SPIDate", lt1 ));
        cmd.Parameters.Add(new SqlParameter("@SPrDate", lt2));


        cmd.ExecuteNonQuery();

        Response.Redirect("/DefaultTestInformation.aspx?id=" + lStudentId);
        
    }
}
 


