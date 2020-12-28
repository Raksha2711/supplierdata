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

namespace SupplierData.Report
{
    public partial class DataReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string BindAreaData()
        {
            string result = "";
            try
            {
                //connection.con();
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("BindAreaName", cn);
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
        public static string BindSupplierType()
        {
            string result = "";
            try
            {
                //connection.con();
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("BindSupplierType", cn);
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
        public static string BindCategoryName()
        {
            string result = "";
            try
            {
                //connection.con();
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("BindCategoryName", cn);
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
        public static string BindItemName()
        {
            string result = "";
            try
            {
                //connection.con();
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("BindItemName", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd); // pass command in to the adapter
                    cmd.Parameters.AddWithValue("@CId", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Type",'B');
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
        public static string BindSupplierName()
        {
            string result = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("BindSupplierName", cn);
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
        public static string DisplayAllData(string ItemId, string BrandId, string SupplierId,string SupplierType,string AreaName)
        {
            string result = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_DataReport", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ItemId", ItemId);
                    cmd.Parameters.AddWithValue("@BrandId", BrandId);
                    cmd.Parameters.AddWithValue("@SupplierId", SupplierId);
                    cmd.Parameters.AddWithValue("@SupplierType", SupplierType);
                    cmd.Parameters.AddWithValue("@AreaName", AreaName);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    DataTable dt = ds.Tables[0];
                    result = JsonConvert.SerializeObject(dt);
                    cn.Close();
                }
            }
            catch (Exception e)
            {
                //i = e.Message + " Line No 170";
                //SendMailError.SendMail("FrmCarHireSupplierMaster.aspx.cs", e.Message + " " + "Line No. 171", UserName);
            }
            return result;
        }

    }
}