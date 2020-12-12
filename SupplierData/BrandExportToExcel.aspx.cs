
using System;
using System.IO;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;
using OfficeOpenXml;


namespace SupplierData
{
    public partial class BrandExportToExcel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.Params["From"] != null)
            //{
            //    TotalData = Request.Params["From"].ToString();
            //}

            //string[] values = TotalData.Split(',');
            //if (values.Length > 1)
            //{
            //    for (int i = 0; i < values.Length; i++)
            //    {
            //        From = values[0].Trim();
            //        To = values[1].Trim();
            //        Type = values[2].Trim();
            //    }
            //}

        }
        [System.Web.Services.WebMethod]
        public static string GetBrandData(string UserName)
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
                    cmd.Parameters.AddWithValue("@EntryAgent", DBNull.Value);
                    cmd.Parameters.AddWithValue("@EmpId", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ContactPerson", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ContactNo", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Website", DBNull.Value);
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


    }

}