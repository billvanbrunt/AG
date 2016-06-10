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
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Data.OleDb;

public class Utilities
{
    public Utilities()
    {
    }

    #region General

    public static string FormatPhoneNumber(string phonenumber)
    {
        if (Regex.IsMatch(phonenumber, @"\A\d\d\d\d\d\d\d\d\d\d\Z"))
        {
            return "(" + phonenumber.Substring(0, 3) + ") " + phonenumber.Substring(3, 3) + "-" + phonenumber.Substring(6);
        }
        else
        {
            return phonenumber;
        }
    }

    public static string FormatSSN(string ssn)
    {
        if (Regex.IsMatch(ssn, @"\A\d\d\d\d\d\d\d\d\d\Z"))
        {
            return ssn.Substring(0, 3) + "-" + ssn.Substring(3, 2) + "-" + ssn.Substring(5);
        }
        else
        {
            return ssn;
        }
    }

    public static string ParsePhoneNumber(string phonenumber)
    {
        string result = phonenumber;

        result = result.Replace("(", String.Empty);
        result = result.Replace(")", String.Empty);
        result = result.Replace("-", String.Empty);

        return result;
    }

    public static string PrepareParameter(string parameter)
    {
        string returnval = parameter;

        returnval = returnval.Replace("'", "''");

        return returnval;
    }

    public static string GetDisplaySchoolYear(int year)
    {
        return (year - 1).ToString() + "-" + year.ToString();
    }

    public string CorrectWords(string parameter)
    {
        string PreviousChar = null;
        string ccSchool = "";
        int x = 1;
        for (x = 1; (x <= parameter.Length); x++)
        {
            if ((x == 1))
            {
                ccSchool = parameter.Substring(0, 1).ToUpper();
                PreviousChar = ccSchool;
            }
            else if ((PreviousChar == " "))
            {
                ccSchool = (ccSchool + parameter.Substring((x - 1), 1).ToUpper());
                PreviousChar = parameter.Substring((x - 1), 1);
            }
            else
            {
                ccSchool = (ccSchool + parameter.Substring((x - 1), 1).ToLower());
                PreviousChar = parameter.Substring((x - 1), 1);
            }
        }
        return ccSchool;
    }

    #endregion

    #region Database

    public static DataSet GetDataSet(SqlCommand cmd)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);

        return ds;
    }

    public static DataSet GetDataSet(OleDbCommand cmd)
    {
        DataSet ds = new DataSet();
        OleDbDataAdapter da = new OleDbDataAdapter(cmd);
        da.Fill(ds);

        return ds;
    }

    public static string GetSettingValue(string settingcode)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        conn.Open();

        string returnval = GetSettingValue(settingcode, conn);

        conn.Close();
        conn.Dispose();

        return returnval;
    }

    public static string GetSettingValue(string settingcode, SqlConnection conn)
    {
        string returnval = String.Empty;

        SqlCommand sqlcmd = new SqlCommand("SELECT SettingValue FROM Settings WHERE SettingCode = @SettingCode", conn);
        sqlcmd.Parameters.AddWithValue("@SettingCode", settingcode);

        returnval = Convert.ToString(sqlcmd.ExecuteScalar());

        return returnval;
    }

    public static void SetSettingValue(string settingcode, string settingvalue)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        conn.Open();

        SetSettingValue(settingcode, settingvalue, conn);

        conn.Close();
        conn.Dispose();
    }

    public static void SetSettingValue(string settingcode, string settingvalue, SqlConnection conn)
    {
        SqlCommand sqlcmd = new SqlCommand("UPDATE Settings SET SettingValue = @SettingValue WHERE SettingCode = @SettingCode", conn);
        sqlcmd.Parameters.AddWithValue("@SettingCode", settingcode);
        sqlcmd.Parameters.AddWithValue("@SettingValue", settingvalue);
        sqlcmd.ExecuteNonQuery();
    }

    #endregion
    


    #region Encryption

    public static string Encrypt(string key, string data)
    {
        string result = String.Empty;

        if (!String.IsNullOrEmpty(data))
        {
            Byte[] m_Key = new Byte[8];
            Byte[] m_IV = new Byte[8];

            InitKey(key, ref m_Key, ref m_IV);

            DESCryptoServiceProvider csprov = new DESCryptoServiceProvider();
            MemoryStream memstream = new MemoryStream();
            CryptoStream crstream = new CryptoStream(memstream, csprov.CreateEncryptor(m_Key, m_IV), CryptoStreamMode.Write);
            StreamWriter sw = new StreamWriter(crstream);

            sw.Write(data);
            sw.Flush();
            crstream.FlushFinalBlock();
            memstream.Flush();

            result = Convert.ToBase64String(memstream.GetBuffer(), 0, Convert.ToInt32(memstream.Length));

            sw.Close();
            crstream.Close();
            memstream.Close();
        }

        return result;
    }

    public static string Decrypt(string key, string data)
    {
        string result = String.Empty;

        if (!String.IsNullOrEmpty(data))
        {
            Byte[] m_Key = new Byte[8];
            Byte[] m_IV = new Byte[8];

            InitKey(key, ref m_Key, ref m_IV);

            DESCryptoServiceProvider csprov = new DESCryptoServiceProvider();
            MemoryStream memstream = new MemoryStream(Convert.FromBase64String(data));
            CryptoStream crstream = new CryptoStream(memstream, csprov.CreateDecryptor(m_Key, m_IV), CryptoStreamMode.Read);
            StreamReader sr = new StreamReader(crstream);

            result = sr.ReadToEnd();

            sr.Close();
            memstream.Close();
            crstream.Close();
        }

        return result;
    }

    private static bool InitKey(String strKey, ref Byte[] m_Key, ref Byte[] m_IV)
    {
        try
        {
            // Convert Key to byte array
            byte[] bp = new byte[strKey.Length];
            ASCIIEncoding aEnc = new ASCIIEncoding();
            aEnc.GetBytes(strKey, 0, strKey.Length, bp, 0);

            //Hash the key using SHA1
            SHA1CryptoServiceProvider sha = new SHA1CryptoServiceProvider();
            byte[] bpHash = sha.ComputeHash(bp);

            int i;
            // use the low 64-bits for the key value
            for (i = 0; i < 8; i++)
                m_Key[i] = bpHash[i];

            for (i = 8; i < 16; i++)
                m_IV[i - 8] = bpHash[i];

            return true;
        }
        catch (Exception)
        {
            //Error Performing Operations
            return false;
        }
    }

    #endregion
}

public class GlobalVariables
{
    private string lgRate;
    public string Rate
    {
        get{return lgRate;}
        set{lgRate = value;}
    }

    private string lgAdmin;
    public string Admin
    {
        get{return lgAdmin;}
        set{lgAdmin = value;}
    }
   
    private string lgFedLastApprover;
    public string FedLastApprover
    {
        get { return lgFedLastApprover; }
        set { lgFedLastApprover = value; }
    }
    private string lgBudgetCode;
    public string BudgetCode
    {
        get { return lgBudgetCode; }
        set { lgBudgetCode = value; }
    }
    private string lLastSubmittableDay;
    public string LastSubmittableDay
    {
        get { return lLastSubmittableDay; }
        set { lLastSubmittableDay = value; }

    }
}