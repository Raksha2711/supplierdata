<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SupplierData.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         function DisplayMenu1() {
             alert("display");
             debugger
             var FormID = '<%= Session["FormID"] %>';  //Give Form Id & Form Type ID
              var FormName = '<%= Session["FormName"] %>'; //Form Name & Form Link  alert("FormID" + FormID);alert("FormName" + FormName);     
              var fname = FormName.split(',');
               // var BookingName = '<%= Session["Booking"] %>';
              //var BName = BookingName.split(',');

             for (var i = 0; i < (fname.length - 1); i++) {
                  var formtype = fname[i].split('^');
                  var fType = formtype[1].split('$');
                  var flink = fType[1].split('@');
                  var FormName = formtype[0];
                  var FormLink = fType[0];
                  if (FormType == "1") { // Master
                      $("#master").append('<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 pdt10"><img src="<%=ConfigurationManager.AppSettings["url"] %>' + FormImag + '" alt="' + FormName + '" class="flleft" /><a href="<%=ConfigurationManager.AppSettings["url"] %>' + FormLink + '"><h4 class="flleft mrgt0 mrgl10"><b>' + FormName + '</b></h4></a></div>'));
                    }
                    else if (FormType == "2") { //Report
                        $("#master").append('<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 pdt10"><img src="<%=ConfigurationManager.AppSettings["url"] %>' + FormImag + '" alt="' + FormName + '" class="flleft" /><a href="<%=ConfigurationManager.AppSettings["url"] %>' + FormLink + '"><h4 class="flleft mrgt0 mrgl10"><b>' + FormName + '</b></h4></a></div>'));
                    }
                    else { //Mapping
                        $("#master").append('<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 pdt10"><img src="<%=ConfigurationManager.AppSettings["url"] %>' + FormImag + '" alt="' + FormName + '" class="flleft" /><a href="<%=ConfigurationManager.AppSettings["url"] %>' + FormLink + '"><h4 class="flleft mrgt0 mrgl10"><b>' + FormName + '</b></h4></a></div>'));
                 }
             }
         }

        </script>
     <script type="text/javascript">

         $(document).ready(function () {
             DisplayMenu1();
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="page-wrapper">
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
            <div class="page-header pull-left">
                <div class="page-title"><b>Master</b></div>
            </div>
            <ol class="breadcrumb page-breadcrumb pull-right">
               <%-- <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>FrmProfitProfile.aspx">Home</a></li>--%>
            </ol>
            <div class="clearfix"></div>
        </div>
        <!--END TITLE & BREADCRUMB PAGE-->

        <!--BEGIN CONTENT-->
        <div class="page-content">
            <div id="form-layouts" class="row">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-6 flright">
                            <input id="txtSearch" type="text" class="form-control" placeholder="Search Here.." onkeyup="SearchLink();" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="row" id="master">
                    </div>
                </div>
            </div>
        </div>
        <!--END PAGE-CONTENT-->
    </div>
</asp:Content>
