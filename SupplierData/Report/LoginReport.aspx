<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginReport.aspx.cs" Inherits="SupplierData.Report.LoginReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    window.onload = function () {
        GetLoginData();
    };

        function GetLoginData() {
        var html = "";
        $.ajax({
            type: "POST",
            url: "LoginReport.aspx/GetLoginData",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var UserList = jQuery.parseJSON(data.d);
               // alert(BrandList);
                $("#divid").empty();
                $("#divid").append('<table id="tblLoginMaster" class="datatable table table-bordered">' +
                    '<thead></thead>' +
                    '<tbody></tbody>' +
                    '</table>');
                var html = "";
                $("#tblLoginMaster thead").append('<tr>' +
                    '<th><a class="white" data-toggle="tooltip" title="User">User</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="LoginDate">LoginDate</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="IPAddress">IPAddress</a></th>' +
                    '</tr>');

                for (var i = 0; i < UserList.length; i++) {
                   // if (data.d[i].Status == "Active") {
                    html += ("<tr><td id='UserName" + UserList[i].Id + "'><a  data-toggle='tooltip' title='" + UserList[i].UserName + "'>" + UserList[i].UserName + "</a></td>" +
                        "<td id='LoginDateTime" + UserList[i].Id + "'><a  data-toggle='tooltip' title='" + UserList[i].LoginDateTime + "'>" + UserList[i].LoginDateTime + "</a></td>" +
                        "<td id='IpAddress" + UserList[i].Id + "'><a  data-toggle='tooltip' title='" + UserList[i].IpAddress + "'>" + UserList[i].IpAddress + "</a></td></tr>");
                    //}
                    //else {
                    //    html += ("<tr><td id='Name" + CategoryList[i].Id + "'><a  data-toggle='tooltip' title='" + CategoryList[i].Name + "'>" + CategoryList[i].Name + "</a></td><td class='hidden' id='Status" + CategoryList[i].Id + "'><a  data-toggle='tooltip' title='" + CategoryList[i].Status + "'>" + CategoryList[i].Status + "</a></td><td  class='hidden' id='button" + CategoryList[i].Id + "'><a href='javascript:EditRecord(&apos;" + CategoryList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;<a id='deleteanchor" + CategoryList[i].Id + "' />&nbsp;</a></td></tr>");
                    //}
                }
                
                $("#tblLoginMaster tbody").append(html);
                $('#tblLoginMaster').dataTable({
                    language:
                    {
                        searchPlaceholder: "Search"
                    }
                });

            }
           
        });
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!--BEGIN PAGE WRAPPER-->
        <div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title"><b>Login Data</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Login Data</li>
                </ol>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
			
			<!--BEGIN CONTENT-->
            <div class="page-content">
				<div id="form-layouts">
                   
                    <!-- BEGIN DATATABLE -->
					<div class="row mrgt30">
						<div class="col-lg-12 col-xs-12 overflowauto" id="divid">
							
						</div>
					</div>
					<!-- END DATATABLE -->
					
                    
                </div>
				<!-- /Form Layouts -->
			</div>
			<!--END PAGE-CONTENT-->
		</div>
     <!--END PAGE WRAPPER-->
</asp:Content>
