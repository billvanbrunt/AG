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
        
    }
}