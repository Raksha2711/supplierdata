using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupplierData.Master
{
    public partial class UserRights : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string BindUser()
        {
            string result = "";
            try
            {
                //connection.con();
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("BindUser", cn);
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
        public static string BindForms(string Id)
        {
            string result = "";
            try
            {
                //connection.con();
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    //SqlCommand cmd = new SqlCommand("BindForms", cn);
                    //cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.AddWithValue("@UserId", Id);
                    //SqlDataAdapter da = new SqlDataAdapter(cmd); // pass command in to the adapter
                    //DataSet ds = new DataSet();
                    //da.Fill(ds);
                    //result = JsonConvert.SerializeObject(ds.Tables[0]);
                   
                    SqlCommand cmd = new SqlCommand("SL_UserRights", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", Id);
                    cmd.Parameters.AddWithValue("@FormId", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Type", 'S');
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
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
        //[System.Web.Services.WebMethod]
        //public static string BindUserForms(string Id)
        //{
        //    string result = "";
        //    try
        //    {
        //        ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
        //        using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
        //        {
        //            cn.Open();
        //            SqlCommand cmd = new SqlCommand("SL_UserRights", cn);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@UserId", Id);
        //            cmd.Parameters.AddWithValue("@FormId", DBNull.Value);
        //            cmd.Parameters.AddWithValue("@Type",'S');
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            DataSet ds = new DataSet();
        //            da.Fill(ds);
        //            result = JsonConvert.SerializeObject(ds.Tables[0]);
        //            cn.Close();
        //        }
        //    }
        //    catch (Exception e)
        //    {
               
        //    }
        //    return result;

        //}
        [System.Web.Services.WebMethod]
        public static string UpdateData(string Edit,string UserId)
        {
            string result = "";
            try
            {
                ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["SilverConnection"];
                using (SqlConnection cn = new SqlConnection(conn.ConnectionString))
                {
                    cn.Open();
                    //DELETE FORM RIGHTS
                    SqlCommand cmd1 = new SqlCommand("SL_UserRights", cn);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@UserId", UserId);
                    cmd1.Parameters.AddWithValue("@FormId", DBNull.Value);
                    cmd1.Parameters.AddWithValue("@Type", 'D');
                    try
                    {
                        cmd1.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {}
                    //END DELETE
                    int e = Edit.Length;
                    //string[] num = new  string[e];
                    string ue = Edit.Substring(2, e - 4);
                    string[] uredit = ue.Split('"');
                    if (uredit.Length != 0)         //if(uredit.Length >1)
                    {
                        for (int i = 0; i < uredit.Length; i = i + 2)
                        {
                            string fedit = uredit[i];
                            if (fedit != " " && fedit != null)
                            {
                                //string[] ed1 = fedit.Split('>');
                                SqlCommand cmd = new SqlCommand("SL_UserRights", cn);
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@UserId", UserId);
                                cmd.Parameters.AddWithValue("@FormId", fedit);
                                cmd.Parameters.AddWithValue("@Type", 'I');
                                try
                                {
                                    cmd.ExecuteNonQuery();
                                    result = "1";
                                }
                                catch (Exception ex)
                                {
                                   // st = "0";
                                }
                                //e1 = st;
                            }
                        }
                    }
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