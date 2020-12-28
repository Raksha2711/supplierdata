using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;

namespace SupplierData
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public  string LoginCheck(string UserName, string Password)
        {
            string result = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_LoginCheck", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserName", UserName.ToUpper());
                    cmd.Parameters.AddWithValue("@Password", Encrypt(Password));
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds1 = new DataSet();
                    da.Fill(ds1);
                    foreach (DataTable table in ds1.Tables)
                    {
                        if (ds1.Tables[0].Rows.Count > 0)
                        {
                            // HttpContext.Current.Session.Add("txtUserName", ds1.Tables[0].Rows[0][1].ToString());
                            HttpContext.Current.Session["EmpId"] = ds1.Tables[0].Rows[0][0].ToString();
                            HttpContext.Current.Session["txtUserName"] = ds1.Tables[0].Rows[0][1].ToString();
                            result = "1";
                            //Session["UserId"] = ds1.Tables[0].Rows[0][0].ToString();

                        }
                    }
                    cn.Close();
                }
            }
            catch (Exception ex)
            {
                //  ErrorLog.CreateLog("FrmAdminKeyMaster.aspx.cs", ex.Message + " " + "Line No. 43. Please contact to Administrator.", DateTime.Now, EntryAgent);
            }
            return result;

        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public string FetchFormRights()
        {
            string EmpID = Session["EmpId"].ToString();
            string UserName = Session["txtUserName"].ToString();
            string error = "0";
            var formid = "";
            var formname = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();

                    SqlCommand cmd = new SqlCommand("SL_UserFormMapping", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", EmpID);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        for (var i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
  //                          1 - 1
  //3 - 2 4 - 3 
  //                              4-4
  //                          formid = formid + ds.Tables[0].Rows[i][0].ToString() + "^" + ds.Tables[0].Rows[i][1].ToString() + ",";
  //                          formname =  ds.Tables[0].Rows[i][2].ToString() + "$" + ds.Tables[0].Rows[i][1].ToString() + "@" + ds.Tables[0].Rows[i][3].ToString() + ",";

                            formid = formid + ds.Tables[0].Rows[i][0].ToString() + "^" + ds.Tables[0].Rows[i][1].ToString() + ",";
                            formname = formname + ds.Tables[0].Rows[i][2].ToString() + "^" + ds.Tables[0].Rows[i][3].ToString() + "$" + ds.Tables[0].Rows[i][1].ToString() + ",";


                        }
                        error = "1";
                    }

                    Session["FormID"] = formid;
                    Session["FormName"] = formname;

                    cn.Close();
                }
            }
            catch (Exception e)
            {
                error = e.Message + " Line No 101";
                //ErrorLog.CreateLog("FrmLogin.aspx.cs", error, DateTime.Now, UserName);
            }
            return error;
        }
        private static string Encrypt(string clearText)
        {
            string EncryptionKey = "Silverline";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public  int InsertLoginData(string UserName)
        {
            string EmpID = Session["EmpId"].ToString();
            ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];

            string IP4AddressArr = String.Empty;
            //string IP4Address = String.Empty;
            //IP4AddressArr = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            //if (!string.IsNullOrEmpty(IP4AddressArr))
            //{
            //    string[] ipRange = IP4AddressArr.Split(',');
            //    IP4Address = ipRange[0].Trim();
            //}
            //else
            //{
            //    foreach (System.Net.IPAddress IPA in Dns.GetHostAddresses(HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString()))
            //    {
            //        if (IPA.AddressFamily.ToString() == "InterNetwork")
            //        {
            //            IP4Address = IPA.ToString();
            //            break;
            //        }
            //    }

            //}
            string IP4Address = String.Empty;
            foreach (System.Net.IPAddress IPA in Dns.GetHostAddresses(Dns.GetHostName()))
            {
                if (IPA.AddressFamily.ToString() == "InterNetwork")
                {
                    IP4Address = IPA.ToString();
                    break;
                }
            }
            int result = 0;
            if (IP4Address != String.Empty)
            {
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd1 = new SqlCommand("SL_LoginData", cn); // Procedure Call
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@IPAddress", IP4Address.Trim());
                    cmd1.Parameters.AddWithValue("@UserName", UserName.Trim());
                    cmd1.Parameters.AddWithValue("@UserId", EmpID.Trim());
                    cmd1.Parameters.AddWithValue("@Type",'I');
                    result = cmd1.ExecuteNonQuery();
                }
                
            }
            return result;
        }
        [WebMethod(EnableSession = true)]
        public string CheckFormRight(string EmpId, string FormName, string UserName)
        {
            string result = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_CheckFormRights", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@EmpId", EmpId);
                    cmd.Parameters.AddWithValue("@FormName", FormName);
                    SqlParameter parm3 = cmd.Parameters.Add("@check", SqlDbType.VarChar);
                    parm3.Size = 50;
                    parm3.Direction = ParameterDirection.Output;
                    var result1 = cmd.ExecuteNonQuery();
                    result = Convert.ToInt32(parm3.Value).ToString();
                    cn.Close();

                }
            }
            catch (Exception e)
            {
            }
            return result;
        }
    }
}
