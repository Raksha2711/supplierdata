using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;

namespace SupplierData.Master
{
    public partial class SupplierMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string GetSupplierData()
        {
            string result = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_SupplierMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'S');
                    cmd.Parameters.AddWithValue("@Name", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Id", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Address", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Pincode", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ContactPerson1", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Mobile1", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Email", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ContactPerson2", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Mobile2", DBNull.Value);
                    
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
        public static string SupplierInsert(string Name, string Address, string Pincode, string ContactPerson1, string Mobile1, string ContactPerson2, string Mobile2, string Email)
        {
            string i = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("SL_SupplierMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'I');
                    cmd.Parameters.AddWithValue("@Id", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Address", Address);
                    cmd.Parameters.AddWithValue("@Pincode", Pincode);
                    cmd.Parameters.AddWithValue("@ContactPerson1", ContactPerson1);
                    cmd.Parameters.AddWithValue("@Mobile1", Mobile1);
                    cmd.Parameters.AddWithValue("@ContactPerson2", ContactPerson2);
                    cmd.Parameters.AddWithValue("@Mobile2",(Mobile2 == "") ? "0" : Mobile2);
                    cmd.Parameters.AddWithValue("@Email", Email);
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
        public static string UpdateRecord(string Id, string Name, string Address, string Pincode, string ContactPerson1, string Mobile1, string ContactPerson2, string Mobile2, string Email)
        {
            string i = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                   
                    SqlCommand cmd = new SqlCommand("SL_SupplierMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'U');
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Address", Address);
                    cmd.Parameters.AddWithValue("@Pincode", Pincode);
                    cmd.Parameters.AddWithValue("@ContactPerson1", ContactPerson1);
                    cmd.Parameters.AddWithValue("@Mobile1", Mobile1);
                    cmd.Parameters.AddWithValue("@ContactPerson2", ContactPerson2);
                    cmd.Parameters.AddWithValue("@Mobile2", Mobile2);
                    cmd.Parameters.AddWithValue("@Email", Email);

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
                    SqlCommand cmd = new SqlCommand("SL_SupplierMaster", cn); // Procedure Call 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Type", 'D');
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@Name", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Address", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Pincode", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ContactPerson1", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Mobile1", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ContactPerson2", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Mobile2", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Email", DBNull.Value);
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