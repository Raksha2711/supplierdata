using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Globalization;
using System.IO;

namespace SupplierData
{
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