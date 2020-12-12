<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportToExcel.aspx.cs" Inherits="SupplierData.Master.ExportToExcel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/buttons/1.6.5/css/buttons.dataTables.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
 <script src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
 <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.html5.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            var url = window.location.search;
            var getQuery = url.split('?')[1];
            var params = getQuery.split('=')[1];
            //alert(params);
            if (params == "BRAND") {
                GetBrand();
            }
            else if (params == "AREA") {
                GetArea();
            }
            else if (params == "SUPPLIERTYPE") {
                GetSupplierType();
            }
            else if (params == "CATEGORY") {
                GetCategory();
            }
            else if (params == "SUBCATEGORY")
            {
                GetSubCategory();
            }
            else if (params == "DESIGNATION")
            {
                GetDesignation();
            }
            else if (params == "SERVICE")
            {
                GetService();
            }
            else if (params == "BRANDMAPPING")
            {
                GetItem();
            }
            else if (params == "SUBCATEGORYMAPPING")
            {
                GetSubCategoryMapping();
            }
            else if (params == "SUPPLIERMAPPING") {
                GetSupplierMapping();
            }
            else if (params == "SUPPLIER")
            {
                GetSupplier();
            }
            else if (params == "DATAREPORT") {
                GetBrandDataReport();
            }
            else {
            }
        });
        function GetBrandDataReport() {
            debugger
            var ItemId = $("#IName").val();

            var BrandId = $("#BName").val();
            var SupplierId = $("#SName").val();
            var SupplierType = $("#SType").val();
            debugger
            if (ItemId == null) {
                ItemId = "";
            }
            $.ajax({
                type: "POST",
                url: "DataReport.aspx/DisplayAllData",
                data: "{ItemId:'" + ItemId + "',BrandId:'" + BrandId + "',SupplierId:'" + SupplierId + "',SupplierType:'" + SupplierType + "'}",
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
        function GetSupplier() {
            var html = "";


            $.ajax({
                type: "POST",
                url: "ExportToExcel.aspx/GetSupplierData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var SList = jQuery.parseJSON(data.d);
                    $("#example").empty();
                    $("#example").append(
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    var html = "";
                    $("#example thead").append('<tr>' +
                        '<th><a class="white" data-toggle="tooltip" title="Supplier Name">Supplier Name</a></th>' +
                        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Address</a></th>' +
                        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Pincode</a></th>' +
                        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Contact Person 1</a></th>' +
                        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Mobile No</a></th>' +
                        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Contact Person 2</a></th>' +
                        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Mobile No</a></th>' +
                        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Email </a></th>' +
                       
                        '</tr>');

                    for (var i = 0; i < SList.length; i++) {
                        html += ("<tr><td id='Name" + SList[i].Id + "'><a  data-toggle='tooltip' title='" + SList[i].Name + "'>" + SList[i].Name + "</a></td>" +
                            "<td id='Address" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].Address + "'>" + SList[i].Address + "</a></td>" +
                            "<td id='Pincode" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].Pincode + "'>" + SList[i].Pincode + "</a></td>" +
                            "<td id='ContactPerson1" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].ContactPerson1 + "'>" + SList[i].ContactPerson1 + "</a></td>" +
                            "<td id='Mobile1" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].Mobile1 + "'>" + SList[i].Mobile1 + "</a></td>" +
                            "<td id='ContactPerson2" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].ContactPerson2 + "'>" + SList[i].ContactPerson2 + "</a></td>" +
                            "<td id='Mobile2" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].Mobile2 + "'>" + SList[i].Mobile2 + "</a></td>" +
                            "<td id='EmailId" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].EmailId + "'>" + SList[i].EmailId + "</a></td></tr>"); 
                       
                    }
                    $("#example tbody").append(html);
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });
                }
            });
        }
        function GetBrand() {

            var UserName = "Raksha";
            debugger
            $.ajax({
                type: "POST",
                url: "ExportToExcel.aspx/GetBrandData",
                data: "{UserName: '" + UserName + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var BrandList = jQuery.parseJSON(data.d);
                    // alert(BrandList);
                    $("#example").empty();
                    $("#example").append(
                        '<thead></thead>' +
                        '<tbody></tbody>'
                    );
                    var html = "";
                    $("#example thead").append('<tr>' +
                        '<th><a class="white" data-toggle="tooltip" title="Name">Brand Name</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Status">Website</a></th>' + 
                        '<th><a class="white" data-toggle="tooltip" title="Status">Toll Free No</a></th></tr>');

                    for (var i = 0; i < BrandList.length; i++) {

                        html += ("<tr><td id='Name" + BrandList[i].Id + "'><a  data-toggle='tooltip' title='" + BrandList[i].Name + "'>" + BrandList[i].Name + "</a></td> <td id='Website" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].Website + "'>" + BrandList[i].Website + "</a></td><td id='TollFreeNo" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].TollFreeNo + "'>" + BrandList[i].TollFreeNo + "</a></td></tr>");
                    }

                    $("#example tbody").append(html);
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });

                }

            });
        }

        function GetArea() {
            debugger
            $.ajax({
                type: "POST",
                url: "ExportToExcel.aspx/GetAreaData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger
                    var AreaList = jQuery.parseJSON(data.d);
                    $("#example").empty();
                    $("#example").append(
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    var html = "";
                    $("#example thead").append('<tr>' +
                        '<th><a class="white" data-toggle="tooltip" title="Name">State</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Area">Area</a></th>' +
                        '</tr>');

                    for (var i = 0; i < AreaList.length; i++) {
                            html += ("<tr><td id='State" + AreaList[i].Id + "'><a  data-toggle='tooltip' title='" + AreaList[i].State + "'>" + AreaList[i].State + "</a></td><td id='Name" + AreaList[i].Id + "'><a  data-toggle='tooltip' title='" + AreaList[i].Name + "'>" + AreaList[i].Name + "</a></td><</tr>");
                    }
                    $("#example tbody").append(html);
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });

                }

            });
        }


        function GetSupplierType() {
            $.ajax({
                type: "POST",
                url: "ExportToExcel.aspx/GetSupplierTypeData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var SList = jQuery.parseJSON(data.d);
                    $("#example").empty();
                    $("#example").append(
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    var html = "";
                    $("#example thead").append('<tr>' +
                        '<th><a class="white" data-toggle="tooltip" title="SUPPLIER TYPE">SUPPLIER TYPE</a></th>' +
                        
                        '</tr>');

                    for (var i = 0; i < SList.length; i++) {
                       
                            html += ("<tr><td id='Name" + SList[i].Id + "'><a  data-toggle='tooltip' title='" + SList[i].Name + "'>" + SList[i].Name + "</a></td></tr>");
                       
                    }

                    $("#example tbody").append(html);
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });

                }

            });
        }

        function GetCategory() {
            $.ajax({
                type: "POST",
                url: "CategoryMaster.aspx/GetCategoryData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var CategoryList = jQuery.parseJSON(data.d);
                    // alert(BrandList);
                    $("#example").empty();
                    $("#example").append(
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    var html = "";
                    $("#example thead").append('<tr>' +
                        '<th><a class="white" data-toggle="tooltip" title="CATEGORY">CATEGORY</a></th></tr>');
                    for (var i = 0; i < CategoryList.length; i++) {
                        html += ("<tr><td id='Name" + CategoryList[i].Id + "'><a  data-toggle='tooltip' title='" + CategoryList[i].Name + "'>" + CategoryList[i].Name + "</a></td></tr>");
                    }
                    $("#example tbody").append(html);
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });

                }

            });
        }

        function GetSubCategory() {
           
            $.ajax({
                type: "POST",
                url: "SubCategoryMaster.aspx/GetSubCategoryData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var CategoryList = jQuery.parseJSON(data.d);
                    // alert(BrandList);
                    $("#example").empty();
                    $("#example").append(
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    var html = "";
                    $("#example thead").append('<tr>' +
                        '<th><a class="white" data-toggle="tooltip" title="Sub Category Name">Sub Category Name</a></th>' +
                        '</tr>');

                    for (var i = 0; i < CategoryList.length; i++) {
                        
                            html += ("<tr><td id='Name" + CategoryList[i].Id + "'><a  data-toggle='tooltip' title='" + CategoryList[i].Name + "'>" + CategoryList[i].Name + "</a></td></tr>");
                        
                    }

                    $("#example tbody").append(html);
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });


                }

            });
        }
        function GetDesignation() {
            var html = "";


            $.ajax({
                type: "POST",
                url: "DesignationMaster.aspx/GetDesignationData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var DList = jQuery.parseJSON(data.d);
                    // alert(BrandList);
                    $("#example").empty();
                    $("#example").append(
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    var html = "";
                    $("#example thead").append('<tr>' +
                        '<th><a class="white" data-toggle="tooltip" title="Designation">Designation</a></th>' +
                        '</tr>');

                    for (var i = 0; i < DList.length; i++) {
                       
                            html += ("<tr><td id='Name" + DList[i].Id + "'><a  data-toggle='tooltip' title='" + DList[i].Name + "'>" + DList[i].Name + "</a></td></tr>");
                        
                    }

                    $("#example tbody").append(html);
                    
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });

                }

            });
        }

        function GetService() {
            var html = "";
            $.ajax({
                type: "POST",
                url: "ExportToExcel.aspx/GetServiceData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger
                    var SList = jQuery.parseJSON(data.d);
                    $("#example").empty();
                    $("#example").append(
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    var html = "";
                    $("#example thead").append('<tr>' +
                        '<th><a class="white" data-toggle="tooltip" title="Brand">Brand</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Area">Area</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Name">Name</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Address">Address</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="ContactNo">ContactNo</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Email">Email</a></th></tr>');

                    for (var i = 0; i < SList.length; i++) {
                        html += ("<tr><td id = 'Brand" + SList[i].Id + "' > <a data-toggle='tooltip' title='" + SList[i].Brand + "'>" + SList[i].Brand + "</a></td>" +
                            "<td id='Name" + SList[i].Id + "'><a  data-toggle='tooltip' title='" + SList[i].Name + "'>" + SList[i].Name + "</a></td>" +
                            "<td id = 'Address" + SList[i].Id + "' > <a data-toggle='tooltip' title='" + SList[i].Address + "'>" + SList[i].Address + "</a></td>" +
                            "<td id='ContactNo" + SList[i].Id + "' > <a data-toggle='tooltip' title='" + SList[i].ContactNo + "'>" + SList[i].ContactNo + "</a></td>" +
                            "<td id='Email" + SList[i].Id + "' > <a data-toggle='tooltip' title='" + SList[i].Email + "'>" + SList[i].Email + "</a></td>" +
                            "<td id='Area" + SList[i].Id + "' > <a data-toggle='tooltip' title='" + SList[i].Area + "'>" + SList[i].Area + "</a></td></tr> ");
                    }
                    $("#example tbody").append(html);
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });
                }

            });
        }
        //BRAND MAPPING
        function GetItem() {
            var html = "";

            $.ajax({
                type: "POST",
                url: "BrandMapping.aspx/GetItemData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var ItemList = jQuery.parseJSON(data.d);
                    // alert(BrandList);
                    $("#example").empty();
                    $("#example").append(
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    var html = "";
                    $("#example thead").append('<tr>' +
                        //'<th><a class="white" data-toggle="tooltip" title="Category">Category</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Brand">Brand</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Name">Sub Category Name</a></th>' +
                        '</tr>');

                    for (var i = 0; i < ItemList.length; i++) {
                       
                            html += ("<tr><td id='Brand" + ItemList[i].Id + "'><a  data-toggle='tooltip' title='" + ItemList[i].Brand + "'>" + ItemList[i].Brand + "</a></td><td id='Name" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Name + "'>" + ItemList[i].Name + "</a></td>" +

                               "</tr>");
                        
                    }

                    $("#example tbody").append(html);
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });
                }

            });
        }
        function GetSubCategoryMapping() {

            $.ajax({
                type: "POST",
                url: "ExportToExcel.aspx/GetSubCategoryData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var ItemList = jQuery.parseJSON(data.d);
                    // alert(BrandList);
                    $("#example").empty();
                    $("#example").append(
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    var html = "";
                    $("#example thead").append('<tr>' +
                        '<th><a class="white" data-toggle="tooltip" title="Brand">Brand</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Name">Sub Category Name</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Area">Area</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Executve Name">Executve Name</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Designation">Designation</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Contact No">Contact No</a></th>' +
                        
                        '</tr>');

                    for (var i = 0; i < ItemList.length; i++) {
                        
                            html += ("<tr>" +
                                "<td id='Brand" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Brand + "'>" + ItemList[i].Brand + "</a></td><td id='Name" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Name + "'>" + ItemList[i].Name + "</a></td>" +
                                "<td id='AreaName" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].AreaName + "'>" + ItemList[i].AreaName + "</a></td><td id='ContactPerson" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].ContactPerson + "'>" + ItemList[i].ContactPerson + "</a></td>" +
                                "<td id='Designation" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Designation + "'>" + ItemList[i].Designation + "</a></td>" +
                                "<td id='ContactNo" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].ContactNo + "'>" + ItemList[i].ContactNo + "</a></td>" +
                               "</tr>");
                        
                    }

                    $("#example tbody").append(html);
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });

                }

            });
        }
        function GetSupplierMapping() {


            $.ajax({
                type: "POST",
                url: "ExportToExcel.aspx/GetSupplierMappingData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var BrandList = jQuery.parseJSON(data.d);

                    $("#example").empty();
                    $("#example").append(
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    var html = "";
                    $("#example thead").append('<tr>' +
                        '<th><a class="white" data-toggle="tooltip" title="Name">Supplier Name</a></th>' +

                        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Brand">Brand</a></th>' +
                        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Sub Category">Sub Category</a></th>' +
                        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Supplier Type</a></th>' +
                        '</tr>');

                    for (var i = 0; i < BrandList.length; i++) {
                        
                            html += ("<tr><td id='Name" + BrandList[i].Id + "'><a  data-toggle='tooltip' title='" + BrandList[i].Name + "'>" + BrandList[i].Name + "</a></td>" +
                                "<td id='Brand" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].Brand + "'>" + BrandList[i].Brand + "</a></td>" +
                                "<td id='SubCategory" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].SubCategory + "'>" + BrandList[i].SubCategory + "</a></td>" +
                                "<td id='Type" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].Type + "'>" + BrandList[i].Type + "</a></td>" +
                               "</tr>");
                    }
                    $("#example tbody").append(html);
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });
                }

            });
        }

        </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="example" class="display" style="width:100%">
      
    </table>
        </div>
    </form>
</body>
</html>
