
using System;
using System.IO;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;
using OfficeOpenXml;

namespace SupplierData.Master
{
    public partial class BrandMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
       
        [System.Web.Services.WebMethod]
        public static string GetBrandData()
        {
            string result = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_BrandMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'S');
                    cmd.Parameters.AddWithValue("@Id", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Name", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Website", DBNull.Value);
                    cmd.Parameters.AddWithValue("@TollFreeNo", DBNull.Value);
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
        public static string BrandInsert(string BrandName, string Website,string TollFreeNo,string CreatedBy)
        {
            string i = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_BrandMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'I');
                    cmd.Parameters.AddWithValue("@Id", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Name",BrandName);
                    cmd.Parameters.AddWithValue("@Website", Website);
                    cmd.Parameters.AddWithValue("@TollFreeNo", TollFreeNo);
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
        public static string UpdateRecord(string Id,string Name,string Website,string TollFreeNo,string ModifiedBy)
        {
            string i = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_BrandMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'U');
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Website", Website);
                    cmd.Parameters.AddWithValue("@TollFreeNo", TollFreeNo);
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
                    SqlCommand cmd = new SqlCommand("SL_BrandMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'D');
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@Name", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Website", DBNull.Value);
                    cmd.Parameters.AddWithValue("@TollFreeNo", DBNull.Value);
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
        public static string GetImport()
        {
            string result = "";
            string path = "E:/BrandMaster.xlsx";
            DataTable dtdata = new DataTable();
            FileInfo fileInfo = new FileInfo(path);

            ExcelPackage package = new ExcelPackage(fileInfo);
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            ExcelWorksheet worksheet = package.Workbook.Worksheets.FirstOrDefault();

            // get number of rows and columns in the sheet
            int rows = worksheet.Dimension.Rows; // 20
            int columns = worksheet.Dimension.Columns; // 7
            
            // loop through the worksheet rows and columns
            DataTable tbl = new DataTable();
            tbl.Columns.Add(new DataColumn("Id", typeof(int)));
            tbl.Columns.Add(new DataColumn("Name", typeof(string)));
            tbl.Columns.Add(new DataColumn("WebSite", typeof(string)));
            for (int i = 2; i <= rows; i++)
            {
                DataRow dr = tbl.NewRow();
                dr["Name"] = worksheet.Cells[i, 1].Value.ToString();
                dr["WebSite"] = worksheet.Cells[i, 2].Value.ToString();
                tbl.Rows.Add(dr);
            }

            
            ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
            using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
            {
                cn.Open();
                using (SqlBulkCopy copy = new SqlBulkCopy(cn))
                {
                    copy.ColumnMappings.Add(1, 1);
                    copy.ColumnMappings.Add(2, 2);
                    
                    copy.DestinationTableName = "[dbo].[BrandMaster]";
                    copy.WriteToServer(tbl);
                }
                cn.Close();
            }
            return "1";
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
                    SqlCommand cmd = new SqlCommand("SL_ImportBrand", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@json ", data);
                    cmd.Parameters.AddWithValue("@CreatedBy ", CreatedBy);
                    result = cmd.ExecuteNonQuery().ToString();
                    cn.Close();
                }
            }
            catch (Exception ex)
            {
                //  ErrorLog.CreateLog("FrmAdminKeyMaster.aspx.cs", ex.Message + " " + "Line No. 43. Please contact to Administrator.", DateTime.Now, EntryAgent);
            }
            return result;
        }
    }
}
