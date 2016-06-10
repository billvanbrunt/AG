using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class controls_ctrlDefaultStudent : System.Web.UI.UserControl
{
    public SqlConnection con;
    public SqlDataReader dr;
    public String SqlStr;
    SqlPage sQl = new SqlPage();
    GlobalVariables g = new GlobalVariables();
    public string lStudentId;
    string cGroupId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
         lStudentId = Request.QueryString["id"];
        AreYouAdmin();
        OpenStudentInformation(lStudentId);

    }
    protected void AreYouAdmin()
    {
       
        HttpCookie _userInfoCookie = Request.Cookies["GCSAGApp"];
        if (_userInfoCookie != null)
        {
            cGroupId = _userInfoCookie["GroupId"];
        }
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
        txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString(); // +"   " + cGroupId;
        txtStudentId.Text = ds.Tables[0].Rows[0]["StudentId"].ToString();
        txtSchoolName.Text = ds.Tables[0].Rows[0]["School"].ToString();


        var ldob = ds.Tables[0].Rows[0]["BirthDate"].ToString();
        txtDOB.Text = ldob.Substring(4,2) + "/" + ldob.Substring(6,2) + "/" + ldob.Substring(0,4);
        txtEthnicity.Text = ds.Tables[0].Rows[0]["Ethnicity"].ToString();
        var lGender = ds.Tables[0].Rows[0]["Gender"].ToString();
        if (lGender == "F")
        {
            txtGender.Text = "Female";
        }
        else if (lGender =="M")
        {
            txtGender.Text = "Male";
        }
        
        txtGrade.Text = ds.Tables[0].Rows[0]["Grade"].ToString();
        txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
        txtAppartmentNo.Text = ds.Tables[0].Rows[0]["Apartment"].ToString();
        txtPOBox.Text = ds.Tables[0].Rows[0]["POBox"].ToString();
        txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
        txtState.Text = ds.Tables[0].Rows[0]["State"].ToString();
        txtZipCode.Text = ds.Tables[0].Rows[0]["zip"].ToString();
        txtHomePhone.Text = ds.Tables[0].Rows[0]["HomePhone"].ToString();
        txtLivesWith.Text = ds.Tables[0].Rows[0]["LivesWith"].ToString();
        txtMothersName.Text = ds.Tables[0].Rows[0]["Mom"].ToString();
        txtFathersName.Text = ds.Tables[0].Rows[0]["Dad"].ToString();
        txtMothersPhone.Text = ds.Tables[0].Rows[0]["MomPhone"].ToString();
        txtFathersPhone.Text = ds.Tables[0].Rows[0]["DadPhone"].ToString();
        txtECStatus.Text = ds.Tables[0].Rows[0]["ECStatus"].ToString();
    }
    protected void EligibilityInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("/DefaultEligibilityInfo.aspx?id=" + lStudentId);
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
}