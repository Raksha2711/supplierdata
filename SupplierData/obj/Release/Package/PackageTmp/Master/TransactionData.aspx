<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TransactionData.aspx.cs" Inherits="SupplierData.Master.TransactionData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .multiselect-container {
            height: 220px;
            overflow-x: hidden;
            overflow-y: scroll;
        }
        </style>
    <script type="text/javascript">

        function fnneutral()
        {
            //if (typeof ($('.CancelClick').html()) != "undefined") {
            //    var ID = $('.CancelClick').parent().attr("href").split("'")[1];
            //    CancelRecord(ID);
            //}
        }
        $(function () {
            $('.multi').multiselect({
                includeSelectAllOption: true,
                enableFiltering: true,
                enableCaseInsensitiveFiltering: true,
                onSelectAll: function () {
                    // alert('a');
                }
            });
        });

        function BindCategoryName() {
             $.ajax({
                 type: "POST",
                 url: "TransactionData.aspx/BindCategoryName",
                 data: "{}",
                 contentType: "application/json; charset=utf-8",
                 global: false,
                 async: false,
                 dataType: "json",
                 success: function (data) {
                    var obj =  jQuery.parseJSON(data.d);
                     var html = "";
                     $('#CName').empty();
                     html += '<option id="optcname" value="">Select</option>';
                     $.each(obj, function (key, value) {
                         html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                     });
                     $('#CName').append(html);
                 }
             });
        }
        function BindItemName(CId) {
            $.ajax({
                type: "POST",
                url: "TransactionData.aspx/BindItemName",
                data: "{CId :'" + CId +"'}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    $('#IName').empty();
                    html += '<option id="optcname" value="">Select</option>';
                    $.each(obj, function (key, value) {
                        html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                    });
                    $('#IName').append(html);
                }
            });
        }
        function BindBrandName() {
            $.ajax({
                type: "POST",
                url: "TransactionData.aspx/BindBrandName",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    $('#BName').empty();
                    //html += '<option id="optcname" value="">Select</option>';
                    $.each(obj, function (key, value) {
                        html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                    });
                    $('#BName').append(html);
                    $('#BName').multiselect('rebuild');
                }
            });
        }
        function BindSupplierName() {
            $.ajax({
                type: "POST",
                url: "TransactionData.aspx/BindSupplierName",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    $('#SName').empty();
                    html += '<option id="optcname" value="">Select</option>';
                    $.each(obj, function (key, value) {
                        html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + ',' + value.Type + '</option>';
                    });
                    $('#SName').append(html);
                }
            });
        }
        function SaveTransactionData() {
            //var ItemId = $("#IName").val();
            //var CategoryId = $("#CName").val();
            //var BrandId = $("#BName").val();
            //var SupplierId = $("#SName").val();
            debugger
            var ItemId = $("#IName option:selected").html();
            var CategoryId = $("#CName option:selected").html();
            var BrandId = $('#BName option:selected').toArray().map(item => item.text);
            var SupplierId = $("#SName option:selected").html();
            var SupplierName = SupplierId.split(',')[0];
            var SupplierType = SupplierId.split(',')[1];
            //if (ItemId != "" && CategoryId != "" && BrandId != "" && SupplierId != "" ) {
            SupplierId = SupplierId.replace("&amp;", "&");
            CategoryId = CategoryId.replace("&amp;", "&");
            SupplierType = SupplierType.replace("&amp;", "&");
            if (ItemId != "" && CategoryId != "" && BrandId != "" && SupplierId != "" ) {
                $.ajax({
                    type: "POST",
                    url: "TransactionData.aspx/TransactionInsert",
                    data: "{ItemId:'" + ItemId + "',CategoryId:'" + CategoryId + "',BrandId:'" + BrandId + "',SupplierId:'" + SupplierName + "',SupplierType:'" + SupplierType +"'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == 1) {
                            Lobibox.notify('error', {
                                delay: 1000,
                                size: 'mini',
                                icon: false,
                                msg: 'Data is already Inserted.'
                            });
                        }
                        else if (data.d == 0) {
                            Lobibox.notify('success', {
                                delay: 1000,
                                size: 'mini',
                                icon: false,
                                msg: 'Data Inserted Succesfully.'
                            });
                            GetTransactionData();
                        }
                        else {
                            Lobibox.notify('error', {
                                delay: 1000,
                                size: 'mini',
                                icon: false,
                                msg: 'Data is not Inserted Succesfully.'
                            });
                        }
                       // SelectData();

                        //document.getElementById('item').value = "";
                        $("#CName").val('');
                        $("#BName").val('');
                        $("#SName").val('');
                        $("#IName").val('');
                        
                    }
                });

            }
        }
        function GetTransactionData() {
            $.ajax({
                type: "POST",
                url: "TransactionData.aspx/TransactionSelect",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var List = jQuery.parseJSON(data.d);
                    $("#divid").empty();
                    $("#divid").append('<table id="tblTransactionData" class="datatable table table-bordered">' +
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    $("#tblTransactionData thead").append("<tr><th><a class='white' data-toggle='tooltip' title='ItemName'>ItemName</a></th><th><a  class='white' data-toggle='tooltip' title='Category Name'>Category Name</a></th><th><a  class='white' data-toggle='tooltip' title='Brand Name'>Brand Name</a></th><th><a class='white' data-toggle='tooltip' title='Contact Person'>Contact Person</a></th><th><a class='white' data-toggle='tooltip' title='Contact No'>Contact No</a></th><th><a class='white' data-toggle='tooltip' title='Website'>Website</a></th><th><a class='white' data-toggle='tooltip' title='Supplier Name'>Supplier Name</a></th><th><a class='white' data-toggle='tooltip' title='Supplier Type'>Supplier Type</a></th><th class='hidden'><a  class='white' data-toggle='tooltip' title='Status'>Status</a></th><th class='bgimgnone hidden'><a  class='white' data-toggle='tooltip' title='Action' >Action</a></th></tr>");
                    for (var i = 0; i < List.length; i++) {

                        if (List[i].Status == "Active") {
                            $("#tblTransactionData tbody").append("<tr><td id='ItemName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].ItemName + "'>" + List[i].ItemName + "</a></td><td id='CategoryName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].CategoryName + "'>" + List[i].CategoryName + "</a></td><td id='BrandName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].BrandName + "'>" + List[i].BrandName + "</a></td><td id='ContactPerson" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].ContactPerson + "'>" + List[i].ContactPerson + "</a></td><td id='ContactNo" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].ContactNo + "'>" + List[i].ContactNo + "</a></td><td id='Website" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].Website + "'>" + List[i].Website + "</a></td><td id='SupplierName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].SupplierName + "'>" + List[i].SupplierName + "</a></td><td id='SupplierType" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].SupplierType + "'>" + List[i].SupplierType + "</a></td><td class='hidden' id='Status" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].Status + "'>" + List[i].Status + "</a></td><td class='hidden' id='button" + List[i].Id + "'><a href='javascript:EditRecord(&apos;" + List[i].Id + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'  /></a>&nbsp;<a id='deleteanchor" + List[i].Id + "' href='javascript:Delete(&apos;" + List[i].Id + "&apos;)' data-toggle='tooltip' title='Delete' ><img src='../images/close.png' />&nbsp;</a></td></tr>");

                        }
                        else {
                            $("#tblTransactionData tbody").append("<tr><td id='ItemName" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].ItemName + "'>" + List[i].ItemName + "</a></td><td id='CategoryName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].CategoryName + "'>" + List[i].CategoryName + "</a></td><td id='BrandName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].BrandName + "'>" + List[i].BrandName + "</a></td><td id='ContactPerson" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].ContactPerson + "'>" + List[i].ContactPerson + "</a></td><td id='ContactNo" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].ContactNo + "'>" + List[i].ContactNo + "</a></td><td id='Website" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].Website + "'>" + List[i].Website + "</a></td><td id='SupplierName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].SupplierName + "'>" + List[i].SupplierName + "</a></td><td id='SupplierType" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].SupplierType + "'>" + List[i].SupplierType + "</a></td><td class='hidden'  id='Status" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].Status + "'>" + List[i].Status + "</a></td><td class='hidden' id='button" + List[i].Id + "'><a href='javascript:EditRecord(&apos;" + List[i].Id + "&apos;)'  data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'  /></a>&nbsp;<a id='deleteanchor" + List[i].Id + "' >&nbsp;</a></td></tr>");
                        }
                    }
                    $('#tblTransactionData').DataTable(
                        {
                            language: {
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
                    <div class="page-title"><b>Transaction Data</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Transaction Data</li>
                </ol>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
			
			<!--BEGIN CONTENT-->
            <div class="page-content">
				<div id="form-layouts">
                    <!-- Search Form -->
					<div class="row bg-aliceblue pdb15" id="search">
						<form id="userregi" name="userregi">
							<%--<div class="col-lg-offset-3 col-lg-1 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Month</label>
								<input type="text" id="efrom" name="bonusfrom" data-date-format="dd/mm/yyyy" placeholder="dd/mm/yyyy" class="date-append1 form-control" readonly />
							</div>--%>
                            <div class="col-lg-3 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Supplier : </label>
                                <select class="form-control" name="SName" id="SName">
										
									</select>

							</div>
                            <div class="col-lg-3 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Category : </label>
                                <select class="form-control" name="CName" id="CName">
										
									</select>

							</div>
							<div class="col-lg-3 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Items : </label>
                                <select class="form-control" name="IName" id="IName">
										
									</select>

							</div>
                            	
                            	<div class="col-lg-2 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Brand : </label>
                                <select class="form-control  multi"  multiple="multiple" " name="BName" id="BName" >
										
									</select>

							</div>
                            	
							<!-- Button -->
							<div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
								<button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveTransactionData();">ADD</button>
								
							</div>
							<!-- /Button -->
						</form>
					</div>
					<!-- /Search Form -->
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
    <script type="text/javascript">


                
        $(document).ready(function () {
                $("#CName").change(function () {
                    var CId = $(this).val();
                    BindItemName(CId);
                });
            BindSupplierName();
                BindBrandName();
                BindCategoryName();
                GetTransactionData();
            });
        </script>
</asp:Content>
