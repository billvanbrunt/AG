using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class ctrlDefaultAppData : System.Web.UI.UserControl
{
    public SqlConnection con;
    public SqlDataReader dr;
    public String SqlStr;
    public string lStudentId;
    SqlPage sQl = new SqlPage();
    GlobalVariables g = new GlobalVariables();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsCallback)
        {
            getTestData("1");
            SetAsyncTrigger();
        }
    }

    protected void btnAchievementTest_Click(object sender, EventArgs e)
    {
        getTestData("1");
    }
    protected void btnAdditionalAchievement_Click(object sender, EventArgs e)
    {
        getTestData("2");
    }
    protected void btnAptitudeTest_Click(object sender, EventArgs e)
    {
        getTestData("3");
    }
    protected void btnAdditionalAptitudeTest_Click(object sender, EventArgs e)
    {
        getTestData("4");
    }


   private void getTestData(String vTestType)
    {
        SqlStr = "usp_GetTests";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@TestType", "1"));

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");

        grdInactiveTests.DataSource = ds.Tables[0];
        grdInactiveTests.DataBind();

        grdActiveTests.DataSource = ds.Tables[1];
        grdActiveTests.DataBind();

        UpdatePanel1.Update();

    }

    private void SetAsyncTrigger()
    {
        
        // Add async postback trigger
        AsyncPostBackTrigger ap = new AsyncPostBackTrigger();
        ap.ControlID = btnAchievementTest.UniqueID;
        ap.EventName = "Click";
        UpdatePanel1.Triggers.Add(ap);
  
        // Add async postback trigger
        ap = new AsyncPostBackTrigger();
        ap.ControlID = btnAdditionalAchievement.UniqueID;
        ap.EventName = "Click";
        UpdatePanel1.Triggers.Add(ap);
    
        // Add async postback trigger
        ap = new AsyncPostBackTrigger();
        ap.ControlID = btnAptitudeTest.UniqueID;
        ap.EventName = "Click";
        UpdatePanel1.Triggers.Add(ap);
   
        // Add async postback trigger
        ap = new AsyncPostBackTrigger();
        ap.ControlID = btnAdditionalAptitudeTest.UniqueID;
        ap.EventName = "Click";
        UpdatePanel1.Triggers.Add(ap);
    }

    protected void btnUpdatePanel_Click(object sender, EventArgs e)
    {
        UpdatePanel1.Update();
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



        //diaEditTest.Close();
    }
}