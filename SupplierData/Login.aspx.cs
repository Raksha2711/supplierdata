using System;
using System.IO;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Xml.Linq;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Net;
using System.Globalization;
using SupplierData;
using System.Collections;
using System.Net.Mail;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Web.Configuration;
using System.Threading;
using System.Web.Services;
using System.Web.Script.Services;

namespace SupplierData.Other
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


       
    }
    //[System.Web.Services.WebMethod(EnableSession = true)]
    //public static string LoginCheck(string UserName, string Password)
    //{
    //    string result = "";
    //    try
    //    {
    //        ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
    //        using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
    //        {
    //            cn.Open();
    //            SqlCommand cmd = new SqlCommand("SL_LoginCheck", cn);
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.AddWithValue("@UserName", UserName);
    //            cmd.Parameters.AddWithValue("@Password", Encrypt(Password));
    //            SqlDataAdapter da = new SqlDataAdapter(cmd);
    //            DataSet ds1 = new DataSet();
    //            da.Fill(ds1);
    //            foreach (DataTable table in ds1.Tables)
    //            {
    //                if (ds1.Tables[0].Rows.Count > 0)
    //                {
    //                    //   HttpContext.Current.Session.Add("txtUserName", ds1.Tables[0].Rows[0][1].ToString());
    //                    //HttpContext.Current.Session["txtUserName"] = ds1.Tables[0].Rows[0][1].ToString();

    //                    //Session["UserId"] = ds1.Tables[0].Rows[0][0].ToString();

    //                }
    //            }
    //            cn.Close();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        //  ErrorLog.CreateLog("FrmAdminKeyMaster.aspx.cs", ex.Message + " " + "Line No. 43. Please contact to Administrator.", DateTime.Now, EntryAgent);
    //    }
    //    return result;

    //}

    //private static string Encrypt(string clearText)
    //{
    //    string EncryptionKey = "Silverline";
    //    byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
    //    using (Aes encryptor = Aes.Create())
    //    {
    //        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
    //        encryptor.Key = pdb.GetBytes(32);
    //        encryptor.IV = pdb.GetBytes(16);
    //        using (MemoryStream ms = new MemoryStream())
    //        {
    //            using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
    //            {
    //                cs.Write(clearBytes, 0, clearBytes.Length);
    //                cs.Close();
    //            }
    //            clearText = Convert.ToBase64String(ms.ToArray());
    //        }
    //    }
    //    return clearText;
    //}
}