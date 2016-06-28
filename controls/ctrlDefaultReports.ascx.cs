using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using GcsExportTools;
using Obout.ComboBox;



public partial class controls_ctrlDefaultReports : System.Web.UI.UserControl
{

    public SqlConnection con;
    public SqlDataReader dr;
    public String SqlStr;
    public string lStudentId;
    SqlPage sQl = new SqlPage();
    GlobalVariables g = new GlobalVariables();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadDropDowns();
        }

    }
    protected void loadDropDowns()
    {
        SqlStr = "usp_GetDropDownInfo";
        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        da.Fill(ds, "myData");

        ddlReportNames.Items.Add(new ListItem("", "0"));
        ddlReadingLOS.Items.Add(new ListItem("", ""));
        ddlMathLOS.Items.Add(new ListItem("", ""));
        ddlSCILOS.Items.Add(new ListItem("", ""));
        ddlSSLOS.Items.Add(new ListItem("", ""));
        ddlSites.Items.Add(new ListItem("", "0"));

        ddlReportNames.DataSource = ds.Tables[0];
        ddlReportNames.DataBind();

        ddlDecision.DataSource = ds.Tables[1];
        ddlDecision.DataBind();

        ddlSites.DataSource = ds.Tables[2];
        ddlSites.DataBind();

        ddlReadingLOS.DataSource = ds.Tables[3];
        ddlReadingLOS.DataBind();

        ddlMathLOS.DataSource = ds.Tables[3];
        ddlMathLOS.DataBind();

        ddlSCILOS.DataSource = ds.Tables[3];
        ddlSCILOS.DataBind();

        ddlSSLOS.DataSource = ds.Tables[3];
        ddlSSLOS.DataBind();

        cboEthnicity.DataSource = ds.Tables[4];
        cboEthnicity.DataBind();

    }
    protected void PrintReports()
    {
        //string lWhatReport =  hfSelectedReport.Text;
        string lWhatReport = ddlReportNames.SelectedValue.ToString();
        if (lWhatReport != "")
        {
            string lStoredProcName;
            SqlStr = "select storedProcName from ReportsToPrint where ReportId=" + lWhatReport;
            SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());

            lStoredProcName = cmd.ExecuteScalar().ToString();
            cmd.Cancel();
            cmd.Dispose();
            string details="";
            int lCounter = 0;
            bool hasSelectedItems = false;


          

            string vStudentId = "1";
            string vSite = "";
            string vDecision = "";
            string vGrade = "";
            string vGender = "";
            string vEthincity = "";
            string vReadingService = "";
            string vMathService = "";
            string vScienceService = "";
            string vHistoryService = "";

            if (ddlSites.SelectedValue != "0")
            {
                vSite = ddlSites.SelectedValue;
            }

            if(ddlDecision.SelectedValue != "0")
            {
                vDecision = ddlDecision.SelectedValue;
            }
            if (cboGrade.SelectedValue != "0")
            {
                vGrade = cboGrade.SelectedValue;
            }
            if(ddlGender.SelectedValue != "0")
            {
                vGender = ddlGender.SelectedValue;
            }
            if(cboEthnicity.SelectedValue != "0")
            {
                vEthincity = cboEthnicity.SelectedValue;
            }
            if (ddlReadingLOS.SelectedValue != "0")
            {
                vReadingService = ddlReadingLOS.SelectedValue;
            }
            if(ddlMathLOS.SelectedValue != "")
            {
                vMathService = ddlMathLOS.SelectedValue;
            }

           if (ddlSCILOS.SelectedValue != "0")
            {
                vScienceService = ddlSCILOS.SelectedValue;
            }            
            if (ddlSSLOS.SelectedValue != "0")
            {
                vHistoryService = ddlSSLOS.SelectedValue;
            }
             
           if(vDecision == "")
            {
                SqlStr = lStoredProcName + "WODec";
            }   
           else
            {
                SqlStr = lStoredProcName;
            } 
            
            cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Site", vSite + "%"));
            cmd.Parameters.Add(new SqlParameter("@Decision", vDecision));
            cmd.Parameters.Add(new SqlParameter("@Grade", vGrade + "%"));
            cmd.Parameters.Add(new SqlParameter("@Gender", vGender + "%"));
            cmd.Parameters.Add(new SqlParameter("@Ethincity", vEthincity + "%"));
            cmd.Parameters.Add(new SqlParameter("@ReadingService", vReadingService + "%"));
            cmd.Parameters.Add(new SqlParameter("@MathService", vMathService + "%"));
            cmd.Parameters.Add(new SqlParameter("@ScienceService", vScienceService + "%"));
            cmd.Parameters.Add(new SqlParameter("@HistoryService", vHistoryService + "%"));
            try
            {
                DataSet ds = Utilities.GetDataSet(cmd);
                var dsCount = ds.Tables[0].Rows.Count;

                if (dsCount >= 1)
                {
                    string filename = "AGReport.xml";
                    string filepath = Server.MapPath("/exportFiles/AGReport.xml");

                    ExportExcel.ExportXML(ds.Tables[0], filepath, "Results");
                    ExportUtilities.DownloadFile(filepath, filename);

                }
                else
                {

                    divErrorMsg.InnerHtml = "No data has been found using your criteria. <br /> Click <font color='#295b8b'<b>ok</b></font>, change the criteria and try again. <br/> If the problem persists please contact department lead.";

                    diaMessage.Title = "No Data Found";
                    diaMessage.Width = 400;
                    diaMessage.Height = 175;
                    diaMessage.VisibleOnLoad = true;
                    diaMessage.IsDraggable = true;

                }
            }
            catch (Exception ex)
            {
                if (lWhatReport == "2" && ex.Message.ToString() == "")
                {
                    var lala = ex.Message.ToString();
                }
            }

        }
    }
    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        PrintReports();
    }
}