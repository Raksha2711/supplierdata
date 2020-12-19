using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SupplierData
{
    public static class ImportData
    {

        public static string ImportInsert(string data)
        {
            string result = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_ImportMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@json ", data);
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