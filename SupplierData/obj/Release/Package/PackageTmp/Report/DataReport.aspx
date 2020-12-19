<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DataReport.aspx.cs" Inherits="SupplierData.Report.DataReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fnneutral() {
           
        }
        function BindArea() {
            try {
                $.ajax({
                    type: "POST",
                    url: "DataReport.aspx/BindAreaData",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    global: false,
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        var obj = jQuery.parseJSON(data.d);
                        var html = "";
                       
                            $('#AreaName').empty();
                            html += '<option id="optcname" value="">Select</option>';
                            $.each(obj, function (key, value) {
                                html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + ' (' + value.StateName + ')' + ' </option>';
                            });
                            $('#AreaName').append(html);
                       
                    }
                });
            }
            catch (ex) { alert(ex); }
        }
        function BindItemName() {
            $.ajax({
                type: "POST",
                url: "DataReport.aspx/BindItemName",
                data: "{}",
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
            debugger
            $.ajax({
                type: "POST",
                url: "DataReport.aspx/BindBrandName",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    $('#BName').empty();
                    html += '<option id="optcname" value="">Select</option>';
                    $.each(obj, function (key, value) {
                        html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                    });
                    $('#BName').append(html);
                }
            });
        }

        function BindSupplierName() {
            $.ajax({
                type: "POST",
                url: "DataReport.aspx/BindSupplierName",
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
                        html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                    });
                    $('#SName').append(html);
                }
            });
        }
        function BindSupplierType() {
            try {
                $.ajax({
                    type: "POST",
                    url: "DataReport.aspx/BindSupplierType",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    global: false,
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        var obj = jQuery.parseJSON(data.d);
                        var html = "";
                        $('#SType').empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#SType').append(html);
                    }
                });
            }
            catch (ex) { alert(ex); }
        }
        function DisplayAllData() {
            debugger
            var ItemId = $("#IName").val();
        
            var BrandId = $("#BName").val();
            var SupplierId = $("#SName").val();
            var SupplierType = $("#SType").val();
            var AreaName = $("#AreaName").val();
            
            ////SupplierId = SupplierId.replace("&amp;", "&");
            ////CategoryId = CategoryId.replace("&amp;", "&");
            ////SupplierType = SupplierType.replace("&amp;", "&");
            debugger
            if (ItemId == null) {
                ItemId = "";
            }
            $.ajax({
                type: "POST",
                url: "DataReport.aspx/DisplayAllData",
                data: "{ItemId:'" + ItemId + "',BrandId:'" + BrandId + "',SupplierId:'" + SupplierId + "',SupplierType:'" + SupplierType + "',AreaName:'" + AreaName +"'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var List = jQuery.parseJSON(data.d);
                    $("#divid").empty();
                    $("#divid").append('<table id="tblTransactionData" class="datatable table table-bordered">' +
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    $("#tblTransactionData thead").append("<tr>" +
                        "<th><a class='white' data-toggle='tooltip' title='Brand'>Brand</a></th>" +
                        "<th><a  class='white' data-toggle='tooltip' title='WebSite'>WebSite</a></th>" +
                        "<th><a  class='white' data-toggle='tooltip' title='TollFreeNo'>TollFreeNo</a></th>" +
                        "<th><a class='white' data-toggle='tooltip' title='Sub Category Name'>Sub Category Name</a></th>" +
                        "<th><a class='white' data-toggle='tooltip' title='Supplier Name'>Supplier Name</a></th>" +
                        "<th><a class='white' data-toggle='tooltip' title='Supplier Type'>Supplier Type</a></th>" +
                        "<th><a class='white' data-toggle='tooltip' title='Area'>Area</a></th>" +
                        "<th><a class='white' data-toggle='tooltip' title='Contact Person'>Contact Person</a></th>" +
                        "<th><a  class='white' data-toggle='tooltip' title='Contact No'>Contact No</a></th>" +
                        "<th><a  class='white' data-toggle='tooltip' title='Designation' >Designation</a></th></tr>");
                    for (var i = 0; i < List.length; i++) {

                      //  if (List[i].Status == "Active") {
                            $("#tblTransactionData tbody").append("<tr>" +
                                "<td id='BrandName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].BrandName + "'>" + List[i].BrandName + "</a></td>" +
                                "<td id='WebSite" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].Website + "'>" + List[i].Website + "</a></td>" +
                                "<td id='TollFreeNo" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].TollFreeNo + "'>" + List[i].TollFreeNo + "</a></td>" +
                                "<td id='SubCategoryName" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].SubCategoryName + "'>" + List[i].SubCategoryName + "</a></td>" +
                                "<td id='SupplierName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].SupplierName + "'>" + List[i].SupplierName + "</a></td>" +
                                "<td id='SupplierType" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].SupplierType + "'>" + List[i].SupplierType + "</a></td>" +
                                "<td id='Area" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].Area + "'>" + List[i].Area + "</a></td>" + 
                                "<td id='ContactPerson" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].ContactPerson + "'>" + List[i].ContactPerson + "</a></td>" + 
                                "<td id='ContactNo" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].ContactNo + "'>" + List[i].ContactNo + "</a></td>" + 
                                "<td id='Designation" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].Designation + "'>" + List[i].Designation + "</a></td>" + 
                                "<td class= 'hidden' id = 'button" + List[i].Id + "' > <a href='javascript:EditRecord(&apos;" + List[i].Id + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png' /></a> & nbsp; <a id='deleteanchor" + List[i].Id + "' href='javascript:Delete(&apos;" + List[i].Id + "&apos;)' data-toggle='tooltip' title='Delete' ><img src='../images/close.png' />&nbsp;</a></td ></tr > ");

                        //}
                        //else {
                        //    $("#tblTransactionData tbody").append("<tr><td id='ItemName" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].ItemName + "'>" + List[i].ItemName + "</a></td><td id='CategoryName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].CategoryName + "'>" + List[i].CategoryName + "</a></td><td id='BrandName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].BrandName + "'>" + List[i].BrandName + "</a></td><td id='ContactPerson" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].ContactPerson + "'>" + List[i].ContactPerson + "</a></td><td id='ContactNo" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].ContactNo + "'>" + List[i].ContactNo + "</a></td><td id='Website" + List[i].Id + "'><a data-toggle='tooltip' title='" + List[i].Website + "'>" + List[i].Website + "</a></td><td id='SupplierName" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].SupplierName + "'>" + List[i].SupplierName + "</a></td><td id='SupplierType" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].SupplierType + "'>" + List[i].SupplierType + "</a></td><td class='hidden'  id='Status" + List[i].Id + "'><a  data-toggle='tooltip' title='" + List[i].Status + "'>" + List[i].Status + "</a></td><td class='hidden' id='button" + List[i].Id + "'><a href='javascript:EditRecord(&apos;" + List[i].Id + "&apos;)'  data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'  /></a>&nbsp;<a id='deleteanchor" + List[i].Id + "' >&nbsp;</a></td></tr>");
                        //}
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
        function OpenExcel() {
            var ItemId = $("#IName").val();
            var BrandId = $("#BName").val();
            var SupplierId = $("#SName").val();
            var SupplierType = $("#SType").val();
            debugger
            if (ItemId == null) {
                ItemId = "";
            }
            //window.open("ExportToExcel.aspx?Type=DATAREPORT&BrandId=" + BrandId, '_blank');
        }
        //function Export() {
        //    var tab_text = "<table border='2px'><tr bgcolor='#87AFC6'>";
        //    var textRange; var j = 0;
        //    tab = document.getElementById('tblTransactionData'); // id of table
        //    // if (IsOpen > 0)
        //    //tab = document.getElementById('tbl' + CustomerNumber);

        //    for (j = 0; j < tab.rows.length; j++) {
        //        tab_text = tab_text + tab.rows[j].innerHTML + "</tr>";
        //        //tab_text=tab_text+"</tr>";
        //    }

        //    tab_text = tab_text + "</table>";
        //    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
        //    tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
        //    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

        //    var ua = window.navigator.userAgent;
        //    var msie = ua.indexOf("MSIE ");

        //    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
        //    {
        //        txtArea1.document.open("txt/html", "replace");
        //        txtArea1.document.write(tab_text);
        //        txtArea1.document.close();
        //        txtArea1.focus();
        //        sa = txtArea1.document.execCommand("SaveAs", true, "MediaQC.xls");
        //    }
        //    else                 //other browser not tested on IE 11
        //        sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));
        //    var table = $('#example');
        //    // if (IsOpen > 0)
        //    //  table = $('#tbl' + CustomerNumber);
        //    table.DataTable().destroy()
        //    tableOptions.bPaginate = true;
        //    table.DataTable(tableOptions);
        //    return (sa);


        //}
        //function fnExcelReport() {
        //    var table = $('#tblTransactionData');
        //    // if (IsOpen > 0)
        //    //  table = $('#tbl' + CustomerNumber);
        //    table.DataTable().destroy()
        //   // tableOptions.bPaginate = false;
        //    table.DataTable(tableOptions);
        //    Export();
        //}
        function fnExcelReport() {

            // alert("1");
            var tab_text = "<table border='2px'><tr bgcolor='#87AFC6'>";
            var textRange; var j = 0;
            tab = document.getElementById('tblTransactionData'); // id of table
            //if (IsOpen > 0)
            //    tab = document.getElementById('div' + CustomerNumber);


            for (j = 0; j < tab.rows.length; j++) {
                tab_text = tab_text + tab.rows[j].innerHTML + "</tr>";
                //tab_text=tab_text+"</tr>";
            }

            tab_text = tab_text + "</table>";
            tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
            tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
            tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");

            if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
            {
                txtArea1.document.open("txt/html", "replace");
                txtArea1.document.write(tab_text);
                txtArea1.document.close();
                txtArea1.focus();
                sa = txtArea1.document.execCommand("SaveAs", true, "DataReport.xls");
            }
            else                 //other browser not tested on IE 11
                sa = window.open('data:application/vnd.oasis.opendocument.spreadsheet,' + encodeURIComponent(tab_text)); //vnd.ms-excel

            return (sa);
            //window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('div[id$=aocqrtable]').html()));
            //e.preventDefault();
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--BEGIN PAGE WRAPPER-->
        <div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title"><b>Brand Data Report</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Brand Data Report</li>
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
                            <%--<div class="col-lg-2 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Category : </label>
                                <select class="form-control" name="CName" id="CName">
										
									</select>

							</div>--%>
                            	<div class="col-lg-2 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Brand : </label>
                                <select class="form-control" name="BName" id="BName" >
										
									</select>

							</div>
							<div class="col-lg-2 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Items : </label>
                                <select class="form-control" name="IName" id="IName">
										
									</select>

							</div>
                            	
                            
                            	<div class="col-lg-2 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Supplier : </label>
                                <select class="form-control" name="SName" id="SName">
										
									</select>

							</div>
                            <div class="col-lg-2 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Type : </label>
                                <select class="form-control" name="SType" id="SType">
										
									</select>

							</div>
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Area</label>
								  <select class="form-control" name="AreaName" id="AreaName">
									</select>
							</div>
							<!-- Button -->
							<div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
								<button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="DisplayAllData();">Search</button>
								<a class="hidden" href="#"><img src="<%=ConfigurationManager.AppSettings["url"] %>images/excel.png" class="mrgr7" data-toggle="tooltip" title="Export To Excel" onclick="OpenExcel();" /></a> 
							</div>
							
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

            BindBrandName();
            BindSupplierType();
            BindSupplierName();
            BindItemName();
            BindArea();
            //BindCategoryName();
            //BindItemName();


            $("#BName").change(function () {
                var BId = $(this).val();
                BindItemName(BId, null);
            });
        });
        </script>
</asp:Content>
