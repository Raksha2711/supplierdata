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

namespace SupplierData.Master
{
    public class User
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Id { get; set; }
        public string Status { get; set; }
    }
    public partial class UserMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        [System.Web.Services.WebMethod]
        public static User[] GetUserData()
        {
            string result = "";
            List<User> list = new List<User>();
            //EncryptDecrypt e = new EncryptDecrypt();
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_UserMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'S');
                    cmd.Parameters.AddWithValue("@UserName", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Password", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Id", DBNull.Value);
                    cmd.Parameters.AddWithValue("@CreatedBy", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ModifiedBy", DBNull.Value);

                    SqlParameter parm3 = cmd.Parameters.Add("@check", SqlDbType.VarChar);
                    parm3.Size = 50;
                    parm3.Direction = ParameterDirection.Output;
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        User _user = new User();
                        _user.Id = reader[0].ToString();
                        _user.Status = reader[3].ToString();
                        _user.UserName = reader[1].ToString();
                        _user.Password = Decrypt(reader[2].ToString());
                        list.Add(_user);
                    }
                    reader.Close();
                    cn.Close();
                }
            }
            catch (Exception ex)
            {
                //  ErrorLog.CreateLog("FrmAdminKeyMaster.aspx.cs", ex.Message + " " + "Line No. 43. Please contact to Administrator.", DateTime.Now, EntryAgent);
            }
            return list.ToArray(); ;

        }
        
        [System.Web.Services.WebMethod]
        public static string UserInsert(string UserName,string Password,string CreatedBy)
        {
            string i = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_UserMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'I');
                    cmd.Parameters.AddWithValue("@Id", DBNull.Value);
                    cmd.Parameters.AddWithValue("@UserName", UserName);
                    cmd.Parameters.AddWithValue("@Password",Encrypt(Password));
                    cmd.Parameters.AddWithValue("@CreatedBy", CreatedBy);
                    cmd.Parameters.AddWithValue("@ModifiedBy", CreatedBy);

                    SqlParameter parm3 = cmd.Parameters.Add("@check", SqlDbType.VarChar);
                    parm3.Size = 50;
                    parm3.Direction = ParameterDirection.Output;
                    int result = cmd.ExecuteNonQuery();
                    i = parm3.Value.ToString();
                    cn.Close();
                }
            }
            catch (Exception e)
            {
                //i = e.Message + " Line No 170";
                //SendMailError.SendMail("FrmCarHireSupplierMaster.aspx.cs", e.Message + " " + "Line No. 171", UserName);
            }
            return i;
        }

        [System.Web.Services.WebMethod]
        public static string UpdateRecord(string Id, string UserName,string Password,string ModifiedBy)
        {
            string i = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_UserMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'U');
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@UserName", UserName);
                    cmd.Parameters.AddWithValue("@Password", Encrypt(Password));
                    cmd.Parameters.AddWithValue("@CreatedBy", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);

                    SqlParameter parm3 = cmd.Parameters.Add("@check", SqlDbType.VarChar);
                    parm3.Size = 50;
                    parm3.Direction = ParameterDirection.Output;
                    int result = cmd.ExecuteNonQuery();
                    i = parm3.Value.ToString();
                    cn.Close();
                }
            }
            catch (Exception e)
            {
                //i = e.Message + " Line No 170";
                //SendMailError.SendMail("FrmCarHireSupplierMaster.aspx.cs", e.Message + " " + "Line No. 171", UserName);
            }
            return i;
        }
        [System.Web.Services.WebMethod]
        public static string DeleteRecord(string Id)
        {
            string i = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_UserMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'D');
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@UserName", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Password", DBNull.Value);
                    cmd.Parameters.AddWithValue("@CreatedBy", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ModifiedBy", DBNull.Value);
                    SqlParameter parm3 = cmd.Parameters.Add("@check", SqlDbType.VarChar);
                    parm3.Size = 50;
                    parm3.Direction = ParameterDirection.Output;
                    int result = cmd.ExecuteNonQuery();
                    i = parm3.Value.ToString();
                    cn.Close();
                    i = Id;
                    cn.Close();
                }
            }
            catch (Exception ex)
            {
                i = ex.Message;
                //ErrorLog.CreateLog("FrmCompanyMaster.aspx.cs", ex.Message + " " + "Line No. 141", UserName);
            }
            finally
            {
                //connection.cn.Close();
            }
            return (i);
        }
        public static string Decrypt(string cryptTxt)
        {
            string EncryptionKey = "Silverline";
            cryptTxt = cryptTxt.Replace(" ", "+");
            byte[] bytesBuff = Convert.FromBase64String(cryptTxt);
            using (Aes aes = Aes.Create())
            {
                Rfc2898DeriveBytes crypto = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                aes.Key = crypto.GetBytes(32);
                aes.IV = crypto.GetBytes(16);
                using (MemoryStream mStream = new MemoryStream())
                {
                    using (CryptoStream cStream = new CryptoStream(mStream, aes.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cStream.Write(bytesBuff, 0, bytesBuff.Length);
                        cStream.Close();
                    }
                    cryptTxt = Encoding.Unicode.GetString(mStream.ToArray());
                }
            }
            return cryptTxt;
        }
        public static string Encrypt(string clearText)
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
    }
}