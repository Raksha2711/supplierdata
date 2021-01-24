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
using System.Configuration;
using Newtonsoft.Json;
using System.Text;
using System.Security.Cryptography;
using System.Globalization;

namespace SupplierData.Master
{
    public partial class AreaMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string BindStateData()
        {
            string result = "";
            try
            {
                //connection.con();
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("BindState", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd); // pass command in to the adapter
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    result = JsonConvert.SerializeObject(ds.Tables[0]);
                    cn.Close();
                }
            }
            catch (Exception ex)
            {
                //ErrorLog.CreateLog("FrmAdminMailData.aspx.cs", ex.Message + " " + "Line No. 45. Please contact to Administrator.", DateTime.Now, "");
            }
            finally
            {
                //connection.cn.Close();
            }
            return result;
        }
        [System.Web.Services.WebMethod]
        public static string GetAreaData()
        {
            string result = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_AreaMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'S');
                    cmd.Parameters.AddWithValue("@Id", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Name", DBNull.Value);
                    cmd.Parameters.AddWithValue("@StateId", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Remark", DBNull.Value);
                    cmd.Parameters.AddWithValue("@CreatedBy", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ModifiedBy", DBNull.Value);
                    SqlParameter parm3 = cmd.Parameters.Add("@check", SqlDbType.VarChar);
                    parm3.Size = 50;
                    parm3.Direction = ParameterDirection.Output;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    DataTable dt = ds.Tables[0];
                    result = JsonConvert.SerializeObject(dt);
                    cn.Close();
                }
            }
            catch (Exception ex)
            {
                //  ErrorLog.CreateLog("FrmAdminKeyMaster.aspx.cs", ex.Message + " " + "Line No. 43. Please contact to Administrator.", DateTime.Now, EntryAgent);
            }
            return result;

        }

        [System.Web.Services.WebMethod]
        public static string AreaInsert(string Name, string StateId, string Remark, string CreatedBy)
        {
            string i = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_AreaMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'I');
                    cmd.Parameters.AddWithValue("@Id", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@StateId", StateId);
                    cmd.Parameters.AddWithValue("@Remark", Remark);
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
        public static string UpdateRecord(string Id, string Name, string StateId, string Remark, string ModifiedBy)
        {
            string i = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_AreaMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'U');
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@StateId", StateId);
                    cmd.Parameters.AddWithValue("@Remark", Remark);
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
                    SqlCommand cmd = new SqlCommand("SL_AreaMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'D');
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@Name", DBNull.Value);
                    cmd.Parameters.AddWithValue("@StateId", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Remark", DBNull.Value);
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

        [System.Web.Services.WebMethod]
        public static string ImportInsert(string data,string CreatedBy)
        {
            string result = "";
            try
            {

                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_ImportArea", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@json ", data);
                    cmd.Parameters.AddWithValue("@CreatedBy ", CreatedBy);
                    result = cmd.ExecuteNonQuery().ToString();
                    cn.Close();
                }
            }
            catch (Exception ex)
            {
                  ErrorLog.CreateLog("AreaMaster.aspx.cs", ex.Message + " " + "Line No. 43. Please contact to Administrator.", DateTime.Now, CreatedBy);
            }
            return result;
        }

    }
    public class ErrorLog
    {
        public static void CreateLog(string FrmName, string ErrMsg, DateTime Currentdate, string UserName)
        {

            try
            {
                string Message = "";

                Message += "PageName : " + FrmName + "," + "Error : " + ErrMsg + "," + "Error Date : " + Currentdate + "UserName" + UserName;

                var currentdate = DateTime.Now.ToString("dd/MM/yyyy");
                // var currentdate = "09/08/2016";
                DateTime date = DateTime.ParseExact(currentdate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                string date1 = date.ToString("ddMMyyyy");
                string FileName = date1 + ".txt";


                using (StreamWriter w = new StreamWriter(System.Web.HttpContext.Current.Server.MapPath("~/ErrorLog/" + FileName), true))
                {
                    w.WriteLine(Message); // Write the text
                }

                //createFile();

                // i = "1";
            }
            catch (Exception e)
            {
                string Message = "";

                Message += "PageName : " + FrmName + "," + "Error : " + ErrMsg + "," + "Error Date : " + Currentdate;



                using (StreamWriter w = new StreamWriter(System.Web.HttpContext.Current.Server.MapPath("~/ErrorLog/data.txt"), true))
                {
                    w.WriteLine(Message); // Write the text
                }

            }
            //  return i;
        }



        internal static void CreateLog(string p, string p_2, string UserName)
        {
            throw new NotImplementedException();
        }

        internal static void CreateLog(string p, string p_2)
        {
            throw new NotImplementedException();
        }
    }
}