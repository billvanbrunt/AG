using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class controls_DefaultStudentEligibilityRecord : System.Web.UI.UserControl
{
    public SqlConnection con;
    public SqlDataReader dr;
    public String SqlStr;
    SqlPage sQl = new SqlPage();
    GlobalVariables g = new GlobalVariables();
    public string lStudentId;

    protected void Page_Load(object sender, EventArgs e)
    {
        lStudentId = Request.QueryString["id"];
        OpenStudentInformation(lStudentId);
        //OpenTestInformation(lStudentId);
    }
    protected void OpenStudentInformation(string vStudentId)
    {
        SqlStr = "usp_GetAGStudentInfo";
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
        txtHomePhone.Text = ds.Tables[0].Rows[0]["HomePhone"].ToString();

        var ldob = ds.Tables[0].Rows[0]["BirthDate"].ToString();
        txtDOB.Text = ldob.Substring(4, 2) + "/" + ldob.Substring(6, 2) + "/" + ldob.Substring(0, 4);

        var lGender = ds.Tables[0].Rows[0]["Gender"].ToString();
        if (lGender == "F")
        {
            lGender = "Female";
        }
        else if (lGender == "M")
        {
            lGender = "Male";
        }
        txtEthnicity.Text = ds.Tables[0].Rows[0]["Ethnicity"].ToString() + "/" + lGender;
        txtGrade.Text = ds.Tables[0].Rows[0]["Grade"].ToString();
        txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
        txtAppartmentNo.Text = ds.Tables[0].Rows[0]["Apartment"].ToString();
        txtPOBox.Text = ds.Tables[0].Rows[0]["POBox"].ToString();
        txtCityStateZip.Text = ds.Tables[0].Rows[0]["City"].ToString() + ", " + ds.Tables[0].Rows[0]["State"].ToString() + ". " + ds.Tables[0].Rows[0]["zip"].ToString();
        var x = 0;
        foreach (var row in ds.Tables[1].Rows)
        {
            var lSubject = ds.Tables[1].Rows[x]["Subject"].ToString();
            if (lSubject == "Achievement")
            {
                txtTestNameACH.Text = ds.Tables[1].Rows[x]["TestName"].ToString();
                txtTestDateACH.Text = ds.Tables[1].Rows[x]["TestDate"].ToString();
                txtTestScoreACH.Text = ds.Tables[1].Rows[x]["TestScore"].ToString();
            }
            if (lSubject == "Math")
            {
                txtTestNameMath.Text = ds.Tables[1].Rows[x]["TestName"].ToString();
                txtTestDateMath.Text = ds.Tables[1].Rows[x]["TestDate"].ToString();
                txtTestScoreMath.Text = ds.Tables[1].Rows[x]["TestScore"].ToString();
            }
            if (lSubject == "Reading")
            {
                txtTestNameRead.Text = ds.Tables[1].Rows[x]["TestName"].ToString();
                txtTestDateRead.Text = ds.Tables[1].Rows[x]["TestDate"].ToString();
                txtTestScoreRead.Text = ds.Tables[1].Rows[x]["TestScore"].ToString();
            }
            if (lSubject == "Science")
            {
                txtTestNameSCI.Text = ds.Tables[1].Rows[x]["TestName"].ToString();
                txtTestDateSCI.Text = ds.Tables[1].Rows[x]["TestDate"].ToString();
                txtTestScoreSCI.Text = ds.Tables[1].Rows[x]["TestScore"].ToString();
            }
            if (lSubject == "Scoial")
            {
                txtTestNameSS.Text = ds.Tables[1].Rows[x]["TestName"].ToString();
                txtTestDateSS.Text = ds.Tables[1].Rows[x]["TestDate"].ToString();
                txtTestScoreSS.Text = ds.Tables[1].Rows[x]["TestScore"].ToString();
            }
            if (lSubject == "Aptitude")
            {
                txtTestNameAPT.Text = ds.Tables[1].Rows[x]["TestName"].ToString();
                txtTestDateAPT.Text = ds.Tables[1].Rows[x]["TestDate"].ToString();
                txtTestScoreAPT.Text = ds.Tables[1].Rows[x]["TestScore"].ToString();
            }
            if (lSubject == "Proformance")
            {
                txtTestNamePT.Text = ds.Tables[1].Rows[x]["TestName"].ToString();
                txtTestDatePT.Text = ds.Tables[1].Rows[x]["TestDate"].ToString();
                txtTestScorePT.Text = ds.Tables[1].Rows[x]["TestScore"].ToString();
            }
            x = x + 1;
        }

       var lReading =  ds.Tables[2].Rows[0]["Reading"].ToString();
       var lMath = ds.Tables[2].Rows[0]["Math"].ToString();
       var lScience = ds.Tables[2].Rows[0]["Science"].ToString();
       //var lScoial = ds.Tables[2].Rows[0]["Social"].ToString();

        if (lReading == "NE" && lMath == "NE")
        {
            cbAGNE.Checked = true;
        }
        else if (lReading == "AG" && lMath == "NE")
            {
                 cbAGRM.Checked = true;
                if (lReading == "NE" && lMath == "AG")
                {
                    cbAGM.Checked = true;
                }
                else
                {
                    cbAGR.Checked = true;
                }
            }
        if(lReading == "AC" || lMath =="AC")
        {
            cbSEOREGAC.Checked = true;
        }
        if( lMath == "IG" || lReading == "IG")
        {
            cbIG.Checked = true;
        }

        if(lMath=="VS" || lReading == "VS")
        {
            cbSEOREGVS.Checked = true;
        }
        

        }
    protected void enTestInformation(string vStudentId)
    {


    }
}