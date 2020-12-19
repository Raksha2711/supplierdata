using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;

namespace SupplierData.Report
{
    public partial class LoginReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string GetLoginData()
        {
            string result = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd1 = new SqlCommand("SL_LoginData", cn); // Procedure Call 
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@IPAddress", DBNull.Value);
                    cmd1.Parameters.AddWithValue("@UserName", DBNull.Value);
                    cmd1.Parameters.AddWithValue("@UserId", DBNull.Value);
                    cmd1.Parameters.AddWithValue("@Type", 'S');
                    SqlDataAdapter da = new SqlDataAdapter(cmd1);
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