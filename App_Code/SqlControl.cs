using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class SqlControl : System.Web.UI.UserControl
{
    public SqlControl()
    {
    }

    protected override void OnUnload(EventArgs e)
    {
        if (_sqlConn != null && !ExistingConnection)
        {
            _sqlConn.Close();
            _sqlConn.Dispose();
        }

        base.OnUnload(e);
    }


    protected SqlConnection GetSqlConn()
    {
        if (_sqlConn == null)
        { _sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString); }

        if (_sqlConn.State != ConnectionState.Open)
        { _sqlConn.Open(); }

        return _sqlConn;
    }

    protected void SetSqlConn(SqlConnection conn)
    {
        _sqlConn = conn;
        ExistingConnection = true;
    }

    protected SqlConnection _sqlConn;
    private bool ExistingConnection = false;
}
