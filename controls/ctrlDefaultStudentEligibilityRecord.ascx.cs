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
        //txtTestNameACH.Text ="N/A";
        txtTestNameMath.Text ="N/A";
        txtTestNameRead.Text="N/A";
        txtTestNameSCI.Text ="N/A";
        txtTestNameSS.Text ="N/A";
        txtTestNameAPT.Text ="N/A";
        txtTestNamePT.Text ="N/A";
        txtTestNamePT1.Text = "N/A";
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
                //txtTestNameACH.Text = ds.Tables[1].Rows[x]["TestName"].ToString();
               // txtTestDateACH.Text = ds.Tables[1].Rows[x]["TestDate"].ToString();
              //  txtTestScoreACH.Text = ds.Tables[1].Rows[x]["TestScore"].ToString();
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
     
        var lEligCode =  ds.Tables[2].Rows[0]["DecisionCode"].ToString();
        var lTrid = ds.Tables[2].Rows[0]["TraditionalStudy"].ToString();
        var lNonTrid = ds.Tables[2].Rows[0]["NonTraditionalStudy"].ToString();
        int llReading = 0;
        int llMath = 0;
        var lReading = ds.Tables[2].Rows[0]["Reading"].ToString();
        var lMath = ds.Tables[2].Rows[0]["Math"].ToString();

        switch (lEligCode.Trim())
        {
            case "AG":
                switch (lTrid.Trim())
                {
                    case "Both":
                        cbAGRM.Checked = true;
                        break;
                    case "Reading only":
                        cbAGR.Checked = true;
                        break;
                    case "Math only":
                        cbAGM.Checked = true;
                        break;
                }
                switch (lNonTrid.Trim())
                {
                    case "Both":
                        cbAGRM.Checked = true;
                        break;
                    case "Reading only":
                        cbAGR.Checked = true;
                        break;
                    case "Math only":
                        cbAGM.Checked = true;
                        break;
                }
                break;
            case "IG":
                cbIG.Checked = true;
                break;
            case "NE":
                cbAGNE.Checked = true;
                break;
        }





        if (lReading.Trim() == "AG" || lReading.Trim() == "AC" || lMath.Trim() == "AR" || lMath.Trim() == "AM" || lMath.Trim() == "IG")
        {
            llReading = 1;
        }
        if (lMath.Trim() == "AG" || lMath.Trim() == "AC" || lMath.Trim() == "AC" || lMath.Trim() == "AR" || lMath.Trim() == "AM" || lMath.Trim() == "IG")
        {
            llMath = 1;
        }


        if (llReading == 0 && llMath == 0)
        {
            cbAGNE.Checked = true;
        }
        else if (llReading == 1 && llMath == 1)
        {
            cbAGRM.Checked = true;
        }
        else if (llReading == 0 && llMath == 1)
        {
            cbAGM.Checked = true;
        }
        else if (llReading == 1 && llMath == 0)
        {
            cbAGR.Checked = true;
        }
        if (lReading.Trim() == "AC" || lMath.Trim() == "Ac")
        {
            cbSEOREGAC.Checked = true;
        }

        if (lReading.Trim() == "AG" || lMath.Trim() == "AG")
        {
            cbSEOREGPO.Checked = true;
        }
        if( lMath.Trim() == "IG" || lReading.Trim() == "IG")
        {
            cbIG.Checked = true;
        }

        if(lMath.Trim() == "VS" || lReading.Trim() == "VS")
        {
            cbSEOREGVS.Checked = true;
        }


        var y = 0;
        txtGradeMathName.Text = "N/A";
        txtGradeReadingName.Text = "N/A";
        txtGradeSCIName.Text = "N/A";
        txtGradeSSName.Text = "N/A";
        foreach (var row in ds.Tables[3].Rows)
        {

            if (ds.Tables[3].Rows[y]["Subject"].ToString() == "Reading")
            {
                txtGradeReadingName.Text = ds.Tables[3].Rows[y]["TestName"].ToString() + "-" + ds.Tables[3].Rows[y]["Description"].ToString();
                txtGradeReadingDate .Text = ds.Tables[3].Rows[y]["TestDate"].ToString();
                txtGradeReadingGrade.Text = ds.Tables[3].Rows[y]["Score"].ToString();
            }
            if (ds.Tables[3].Rows[y]["Subject"].ToString() == "Math")
            {
                txtGradeMathName.Text = ds.Tables[3].Rows[y]["TestName"].ToString() + "-" + ds.Tables[3].Rows[y]["Description"].ToString();
                txtGradeMathDate.Text = ds.Tables[3].Rows[y]["TestDate"].ToString();
                txtGradeMathGrade.Text = ds.Tables[3].Rows[y]["Score"].ToString();
            }
            if (ds.Tables[3].Rows[y]["Subject"].ToString() == "Science")
            {
                txtGradeSCIName.Text = ds.Tables[3].Rows[y]["TestName"].ToString() + "-" + ds.Tables[3].Rows[y]["Description"].ToString();
                txtGradeSCIDate.Text = ds.Tables[3].Rows[y]["TestDate"].ToString();
                txtGradeSCIGrade.Text = ds.Tables[3].Rows[y]["Score"].ToString();
            }
            if (ds.Tables[3].Rows[y]["Subject"].ToString() == "Social Studies")
            {
                txtGradeMathName.Text = ds.Tables[3].Rows[y]["TestName"].ToString() + "-" + ds.Tables[3].Rows[y]["Description"].ToString();
                txtGradeSSDate.Text = ds.Tables[3].Rows[y]["TestDate"].ToString();
                txtGradeSSGrade.Text = ds.Tables[3].Rows[y]["Score"].ToString();
            }
            y++;
        }



    }
    protected void enTestInformation(string vStudentId)
    {


    }
}