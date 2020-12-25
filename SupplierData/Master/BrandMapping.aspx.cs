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


namespace SupplierData.Master
{
    public partial class BrandMapping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static string BindBrandName()
        {
            string result = "";
            try
            {
                //connection.con();
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("BindBrandName", cn);
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
                // ErrorLog.CreateLog("FrmAdminMailData.aspx.cs", ex.Message + " " + "Line No. 45. Please contact to Administrator.", DateTime.Now, "");
            }
            finally
            {
                //connection.cn.Close();
            }
            return result;
        }
        [System.Web.Services.WebMethod]
        public static string GetItemData()
        {
            string result = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_BrandMapping", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'S');
                    cmd.Parameters.AddWithValue("@Id", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Name", DBNull.Value);
                   // cmd.Parameters.AddWithValue("@CId", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Brand", DBNull.Value);
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
        public static string ItemInsert(string ItemName,string Brand,string CreatedBy)
        {
            string i = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_BrandMapping", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'I');
                    cmd.Parameters.AddWithValue("@Id", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Name", ItemName);
                 //   cmd.Parameters.AddWithValue("@CId", CId);
                    cmd.Parameters.AddWithValue("@Brand", Brand);
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
        public static string BindSubCategoryName()
        {
            string result = "";
            try
            {
                //connection.con();
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("BindSubCategoryName", cn);
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
        public static string UpdateRecord(string Id, string Name, string Brand,string ModifiedBy)
        {
            string i = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_BrandMapping", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'U');
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Brand", Brand);
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
                    SqlCommand cmd = new SqlCommand("SL_BrandMapping", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'D');
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@Name", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Brand", DBNull.Value);
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
    }
}