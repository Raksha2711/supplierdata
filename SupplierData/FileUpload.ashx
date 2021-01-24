            <%@ WebHandler Language="C#" Class="FileUpload" %>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web.SessionState;
using SupplierData;
using Amazon.S3;
using Amazon.S3.Model;
using Newtonsoft.Json;
public class FileUpload : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string value = context.Request["value"];

        //ErrorLog.CreateLog("FrmMediaMaster.cs ", "Value " + "  " + value + "  Line No. 57", DateTime.Now, "Handler");

        string folders = context.Request["Path"];
        value = value.Replace('"', ' ').Trim();
        value = value.Replace("\"", "/");
        value = value.Replace(" ", String.Empty);
        string[] myarray = value.Split('/');

        string Key = myarray[0];
        string Key1 = myarray[1];

        //ErrorLog.CreateLog("FrmMediaMaster.cs ", "Key: " + Key + "  " + "Key1: " + Key1 + " "+"  Line No. 57", DateTime.Now, "Handler");

        string uname = "";
        string targetPath1, str_image1 = "";
        string retValue = "";
        try
        {
            if (context.Request.Files.Count > 0)
            {
                try
                {
                    HttpFileCollection files = context.Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        HttpPostedFile file = files[i];
                        string fname = file.FileName;
                        //ErrorLog.CreateLog("FrmMediaMaster.cs ", "Foldertosave: "+FolderTosave + "  "+"Key: " + Key + "  Line No. 57", DateTime.Now, "Handler");
                        string dirFullPath = System.Web.HttpContext.Current.Server.MapPath("~/MCSFolder/");
                        foreach (string s in context.Request.Files)
                        {
                            file = context.Request.Files[s];
                            string fileName = file.FileName;
                            string fileExtension = file.ContentType;

                            //IAmazonS3 client;
                            ////using (client = AWSClientFactory.CreateAmazonS3Client(ConfigurationManager.AppSettings["AWSAccessKey"].ToString(), ConfigurationManager.AppSettings["AWSSecretKey"].ToString(), RegionEndpoint.EUCentral1))

                            //using (client = AWSClientFactory.CreateAmazonS3Client("AKIAJY6BVVXOFRENPEBA","T7+cSsQJTtWjrbaa3HOjyN4lmfBGqCH3X68mIXbY",Amazon.RegionEndpoint.APSouth1))
                            //{
                            //    var request = new PutObjectRequest
                            //    {
                            //        BucketName = "b2bpotential",
                            //        CannedACL = S3CannedACL.PublicRead,
                            //        Key = string.Format("home-banner/{0}", file.FileName),
                            //        InputStream = file.InputStream
                            //    };
                            //    var response = client.PutObject(request);
                            //    if (Convert.ToString(response.HttpStatusCode) == "OK")
                            //    {
                            //    }
                            //}
                            string imgNewName = Guid.NewGuid().ToString() + ".jpg";
                            var awsKey = "AKIA4G6EG37BCLLLNCKL";
                            var awsSecretKey = "nJjTmqSUEgmlKJbOHLCLIuV/ypwZ2pCtmVoZOg6+";
                            var bucketRegion = Amazon.RegionEndpoint.APSouth1;   // Your bucket region
                            var s3 = new AmazonS3Client(awsKey, awsSecretKey, bucketRegion);
                            var putRequest = new PutObjectRequest();
                            putRequest.BucketName = "b2bpotential";        // Your bucket name
                            putRequest.ContentType = "image/jpeg";
                            putRequest.InputStream = file.InputStream;//BrandImages/
                            // key will be the name of the image in your bucket
                            putRequest.Key = "BrandImages/"+ imgNewName;
                            PutObjectResponse putResponse = s3.PutObject(putRequest);
                            retValue = imgNewName;
                            context.Response.ContentType = "application/json";
                            string json = JsonConvert.SerializeObject(retValue);
                                //myAmazonS3Client.putResponse(new PutObjectRequest('some-grails-bucket',  'somePath/someKey.jpg', new    File('/Users/ben/Desktop/photo.jpg')).withCannedAcl(CannedAccessControlList.PublicRead))
                            context.Response.Write(json);
                        }
                    }
                    // context.Response.Write(retValue);
                }
                catch (Exception e1)
                {
                    context.Response.Write(retValue);
                }
            }

        }
        catch (Exception ac)
        {
            context.Response.Write(retValue);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}