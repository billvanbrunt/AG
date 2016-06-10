using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Data.OleDb;

/// <summary>
/// Summary description for SqlPage
/// </summary>
public class SqlPage : System.Web.UI.Page
{
	public SqlPage()
	{
	}

    public SqlConnection Con;

    protected override void OnUnload(EventArgs e)
    {
        if (_sqlConn != null)
        {
            _sqlConn.Close();
            _sqlConn.Dispose();
        }

        base.OnUnload(e);
    }


    protected SqlConnection _sqlConn;
     public SqlConnection GetSqlConn()
    {
        if (_sqlConn == null)
        { _sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString); }

        if (_sqlConn.State != ConnectionState.Open)
        { _sqlConn.Open(); }

        return _sqlConn;
    }

   
    public OleDbConnection DBCONNAS400;
    protected OleDbConnection _oleConn;
     public OleDbConnection GetASConn()
     {
         if (_oleConn == null)
         { _oleConn = new OleDbConnection(ConfigurationManager.ConnectionStrings["DBCONNAS400"].ConnectionString); }

         if (_oleConn.State != ConnectionState.Open)
         { _oleConn.Open(); }

         return _oleConn;
     }

}
