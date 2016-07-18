using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using log4net;
using log4net.Config;

public partial class ctrlDefaultAppData : System.Web.UI.UserControl
{
    public SqlConnection con;
    public SqlDataReader dr;
    public String SqlStr;
    public string lStudentId;
    SqlPage sQl = new SqlPage();
    GlobalVariables g = new GlobalVariables();
    private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            getTestData("1");
            SetAsyncTrigger();
            loadDropdown();
        }
    }
    protected void btnAchievementTest_Click(object sender, EventArgs e)
    {
        gTestType.Text = "1";
        getTestData("1");
    }
    protected void btnAdditionalAchievement_Click(object sender, EventArgs e)
    {
        gTestType.Text = "3";
        getTestData("3");
    }
    protected void btnAptitudeTest_Click(object sender, EventArgs e)
    {
        gTestType.Text = "2";
        getTestData("2");
    }
    protected void btnAdditionalAptitudeTest_Click(object sender, EventArgs e)
    {
        gTestType.Text = "4";
        getTestData("4");
    }
    protected void btnAddNewTest_Click(object sender, EventArgs e)
    {

    }
    protected void loadDropdown()
    {
        ddTestTypeNew.Items.Add(new ListItem(" ", " "));
        SqlStr = "usp_GetTestTypes";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;

        dr = cmd.ExecuteReader();
        ddTestTypeNew.DataSource = dr;
        ddTestTypeNew.DataBind();
        dr.Close();
        cmd.Cancel();
     }
    private void getTestData(String vTestType)
    {

        SqlStr = "usp_GetTests";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@TestType", vTestType));

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");

        grdInactiveTests.DataSource = ds.Tables[0];
        grdInactiveTests.DataBind();

        grdActiveTests.DataSource = ds.Tables[1];
        grdActiveTests.DataBind();

        //UpdatePanel1.Update();

    }
    private void SetAsyncTrigger()
    {
        
        //// Add async postback trigger
        //AsyncPostBackTrigger ap = new AsyncPostBackTrigger();
        //ap.ControlID = btnAchievementTest.UniqueID;
        //ap.EventName = "Click";
        //UpdatePanel1.Triggers.Add(ap);
  
        //// Add async postback trigger
        //ap = new AsyncPostBackTrigger();
        //ap.ControlID = btnAdditionalAchievement.UniqueID;
        //ap.EventName = "Click";
        //UpdatePanel1.Triggers.Add(ap);
    
        //// Add async postback trigger
        //ap = new AsyncPostBackTrigger();
        //ap.ControlID = btnAptitudeTest.UniqueID;
        //ap.EventName = "Click";
        //UpdatePanel1.Triggers.Add(ap);
   
        //// Add async postback trigger
        //ap = new AsyncPostBackTrigger();
        //ap.ControlID = btnAdditionalAptitudeTest.UniqueID;
        //ap.EventName = "Click";
        //UpdatePanel1.Triggers.Add(ap);
    }
    protected void btnUpdatePanel_Click(object sender, EventArgs e)
    {
        //UpdatePanel1.Update();
    }
    protected override void CreateChildControls()
    {
        if (IsPostBack)
        {
          
            SetAsyncTrigger();
        }

        base.CreateChildControls();
    }
    protected void btnServerSaveEditTest_Click(object sender, EventArgs e)
    {
        var lTestId = gTestId.Text;
        var lTestName = txtTestName.Text;
        var lDescription = txtDescription.Text;
        var lActive = ddActive.SelectedValue.ToString();
        var lTestType = gTestType.Text;
        SqlStr = "usp_UpdateTest";
       SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@TestId", lTestId));
        cmd.Parameters.Add(new SqlParameter("@TestName", lTestName));
        cmd.Parameters.Add(new SqlParameter("@Description", lDescription));
        cmd.Parameters.Add(new SqlParameter("@Active", lActive));
        try
        {
            cmd.ExecuteNonQuery();
            getTestData(lTestType);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "resetScreen();", true);
        }
        catch(Exception ex)
        {
            log.Error("Data was not saved TestId = " + lTestId + "  TestName = " + lTestName + ", description = " + lDescription + ", Active = " + lActive );
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "DidNotSAveUpdate();", true);
        }
       
    }
    protected void btnServerSaveNewTest_Click(object sender, EventArgs e)
    {
        var lTestName = txtTestNameNew.Text;
        var lDescription = txtTestDescriptionNew.Text;
        var lTestTypeNew = ddTestTypeNew.SelectedValue.ToString();
        SqlStr = "usp_SaveNewTest";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@TestName", lTestName));
        cmd.Parameters.Add(new SqlParameter("@Description", lDescription));
        cmd.Parameters.Add(new SqlParameter("@TestType", lTestTypeNew));
        SetAsyncTrigger();
        try
        {
            cmd.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "resetScreen();", true);
        }
        catch (Exception ex)
        {
            log.Error("Data was not saved new test " + ex);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "DidNotSAveNew();", true);
        }
    }
}