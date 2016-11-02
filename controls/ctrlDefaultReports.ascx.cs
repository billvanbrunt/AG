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
        string lUserId = HttpContext.Current.User.Identity.Name.ToString();
        SqlStr = "usp_GetDropDownInfo";

        SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@UserId", lUserId));
        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter();

        da.SelectCommand = cmd;
        da.Fill(ds, "myData");

        ddlReportNames.Items.Add(new ListItem("", "0"));
        ddlReadingLOS.Items.Add(new ListItem("", ""));
        ddlMathLOS.Items.Add(new ListItem("", ""));
        ddlSCILOS.Items.Add(new ListItem("", ""));
        ddlSSLOS.Items.Add(new ListItem("", ""));
        
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
            string lStoredProc;
            SqlStr = "select storedProcName from ReportsToPrint where ReportId=" + lWhatReport;
            
            SqlCommand cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());

            lStoredProc = cmd.ExecuteScalar().ToString();
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
            string vGrades = "";

            if (ddlSites.SelectedValue != "")
            {
                vSite = " SiteId in (";
                string newSites = "'";
                string lInValue = ddlSites.SelectedValue.ToString();
                string[] values = lInValue.Split(',');
 
                for (int i = 0; i < values.Length; i++)
                {
                    if (newSites != "'")
                    {
                        newSites = newSites + "','" + values[i];
                    }
                    else
                    {
                        newSites = newSites + values[i];
                    }
                    vSite = vSite + newSites + "')";
                }

            }
            else
            {
                vSite = "SiteId LIKE '%' ";
            }
            lStoredProc = lStoredProc + vSite;

            if (cboGrade.SelectedValue != "")
            {
               lStoredProc = lStoredProc + " and cs.GradeLevel in (";
               string newGrades = "'";
               string lInValue = cboGrade.SelectedValue.ToString();
               string[] values = lInValue.Split(',');
                
                for (int i = 0; i < values.Length; i++)
                {
                    if(newGrades != "'")
                    { 
                        newGrades = newGrades + "','" + values[i];
                    }
                    else
                    {
                        newGrades = newGrades +  values[i];
                    }
                }
                newGrades = newGrades + "'";
                lStoredProc = lStoredProc + newGrades +  ")";
            }
            if (ddlGender.SelectedValue != "0")
            {
                vGender = ddlGender.SelectedValue;
                lStoredProc = lStoredProc + " and cs.Gender = '" + vGender + "' ";
            }
            if (cboEthnicity.SelectedValue != "")
            {
                vEthincity = cboEthnicity.SelectedValue;
                lStoredProc = lStoredProc + " and ce.Eth_Cde in (";
                string newGrades = "'";
                string lInValue = cboEthnicity.SelectedValue.ToString();
                string[] values = lInValue.Split(',');

                for (int i = 0; i < values.Length; i++)
                {
                    if (newGrades != "'")
                    {
                        newGrades = newGrades + "','" + values[i];
                    }
                    else
                    {
                        newGrades = newGrades + values[i];
                    }
                }
                newGrades = newGrades + "'";
                lStoredProc = lStoredProc + newGrades + ")";
            }
            if (ddlReadingLOS.SelectedValue != "")
            {
                vReadingService = ddlReadingLOS.SelectedValue;
                lStoredProc = lStoredProc + " AND 	lsi.Reading = '" + vReadingService + "' ";
            }
            if(ddlMathLOS.SelectedValue != "")
            {
                vMathService = ddlMathLOS.SelectedValue;
                lStoredProc = lStoredProc + " AND 	lsi.Math = '" + vMathService + "' ";
            }

           if (ddlSCILOS.SelectedValue != "")
            {
                vScienceService = ddlSCILOS.SelectedValue;
                lStoredProc = lStoredProc + " AND lsi.Science =' " + vScienceService + "' ";
            }            
            if (ddlSSLOS.SelectedValue != "")
            {
                vHistoryService = ddlSSLOS.SelectedValue;
                lStoredProc = lStoredProc + " AND lsi.SocialStudies = '" + vHistoryService + "' ";
            }
            if (ddlDecision.SelectedValue != "")
            {
                string NewValue = ddlDecision.SelectedValue;
                if (NewValue == "All Eligible")
                {
                    vDecision = " and si.decision IN (8,9,10,11)";
                }
                else
                { 
                    vDecision = " and si.decision IN (" + ddlDecision.SelectedValue + ")";
                }
            }

            lStoredProc = lStoredProc + vDecision;
            lStoredProc = lStoredProc + " and  RTRIM(LTRIM(Homeroom)) <> ''  order by SiteId, cs.GradeLevel, lastName, FirstName ";
            SqlStr = lStoredProc;

            cmd = new SqlCommand(SqlStr, sQl.GetSqlConn());
            cmd.CommandType = CommandType.Text;
            
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