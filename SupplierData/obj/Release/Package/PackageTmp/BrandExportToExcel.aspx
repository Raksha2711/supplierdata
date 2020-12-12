<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrandExportToExcel.aspx.cs" Inherits="SupplierData.BrandExportToExcel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css" rel="stylesheet" />


    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

    <script>
        $(document).ready(function () {
            GetBrand();
            $('#example').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
        function GetBrand() {
            var UserName = "Raksha";
            debugger
            $.ajax({
                type: "POST",
                url: "BrandExportToExcel.aspx/GetBrandData",
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
                        '<th><a class="white" data-toggle="tooltip" title="Status">Website</a></th></tr>');

                    for (var i = 0; i < BrandList.length; i++) {

                        html += ("<tr><td id='Name" + BrandList[i].Id + "'><a  data-toggle='tooltip' title='" + BrandList[i].Name + "'>" + BrandList[i].Name + "</a></td> <td id='Website" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].Website + "'>" + BrandList[i].Website + "</a></td></tr>");
                    }

                    $("#example tbody").append(html);


                }

            });
        }


        //var no = "";
        //var date = "";
        //var profit = "";
        //var amdProfit = "";
        //var amdAgent = "";
        //var ptotal = 0;
        //var atotal = 0;
        //var ntotal = 0;

        //var FullList = [];
        //function test() {
        //    $.ajax({
        //        type: "POST",
        //        url: "test.aspx/DisplayAllData",
        //        data: "{}", //,SuedoName:'"+ SuedoName +"'
        //        global: false,
        //        async: false,
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (data) {
        //            debugger
        //            var response = data.d;
        //            var obj = jQuery.parseJSON(response);
        //            FullList = obj;
        //            if (data.d.length > 0) {
        //                $("#example").empty();
        //                $("#example").append(
        //                    '<thead></thead>' +
        //                    '<tbody></tbody>' +
        //                    '<tfoot></tfoot>'
        //                );
        //                if (obj[0].type == 4) {
        //                    $("#example thead").append('<tr>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Reference No">Reference No</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Amd. Ref. No">Amd. Ref. No</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Date">Date</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Amd Date">Amd Date</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Customer Name">Customer Name</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Profit">Profit</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Amd. Profit">Amd. Profit</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Net Profit">Net Profit</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Agent">Agent</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Amd. Agent">Amd. Agent</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Status">Status</a></th>' +
        //                        '</tr>');
        //                    for (var i = 0; i < obj.length; i++) {
        //                        if (obj[i].AmendmentId == null) {
        //                            no = '';
        //                        }
        //                        else {
        //                            no = obj[i].AmendmentId;
        //                        }
        //                        if (obj[i].AmendmentDate == null) {
        //                            date = '';
        //                        }
        //                        else {
        //                            date = moment(obj[i].AmendmentDate).format('DD-MM-YYYY');
        //                        }
        //                        if (obj[i].profit == null) {
        //                            profit = '';
        //                        }
        //                        else {
        //                            profit = obj[i].profit;
        //                            ptotal = parseFloat(ptotal) + parseFloat(obj[i].profit);

        //                        }
        //                        if (obj[i].AProfit == null) {
        //                            amdProfit = '';
        //                        }
        //                        else {
        //                            amdProfit = obj[i].AProfit;
        //                            atotal = parseFloat(atotal) + parseFloat(obj[i].amdProfit);;

        //                        }
        //                        if (obj[i].AmdAgent == null) {
        //                            amdAgent = '';
        //                        }
        //                        else {
        //                            amdAgent = obj[i].AmdAgent;
        //                        }
        //                        $("#example tbody").append('<tr>' +
        //                            '<td id="ContactId' + obj[i].ContactId + '"><a  data-toggle="tooltip" title="' + obj[i].ContactId + '">' + obj[i].ContactId + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].AmendmentId + '"><a  data-toggle="tooltip" title="' + obj[i].AmendmentId + '">' + no + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].Date + '"><a  data-toggle="tooltip" title="' + obj[i].Date + '">' + moment(obj[i].Date).format('DD-MM-YYYY') + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].AmendmentDate + '"><a  data-toggle="tooltip" title="' + obj[i].AmendmentDate + '">' + date + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].CustomerName + '"><a  data-toggle="tooltip" title="' + obj[i].CustomerName + '">' + obj[i].CustomerName + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].profit + '"><a  data-toggle="tooltip" title="' + obj[i].profit + '">' + profit + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].AProfit + '"><a  data-toggle="tooltip" title="' + obj[i].AProfit + '">' + amdProfit + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].NProfit + '"><a  data-toggle="tooltip" title="' + obj[i].NProfit + '">' + obj[i].NProfit + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].Agent + '"><a  data-toggle="tooltip" title="' + obj[i].Agent + '">' + obj[i].Agent + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].AmdAgent + '"><a  data-toggle="tooltip" title="' + obj[i].AmdAgent + '">' + amdAgent + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].Status + '"><a  data-toggle="tooltip" title="' + obj[i].Status + '">' + obj[i].Status + '</a></td>' +
        //                            '</tr>');
        //                    }
        //                    $("#example tbody").append('<tr>' +
        //                        '<td>Total</td>' +
        //                        '<td></td>' +
        //                        '<td></td>' +
        //                        '<td></td>' +
        //                        '<td></td>' +
        //                        '<td>' + parseFloat(ptotal).toFixed(2) + '</td>' +
        //                        '<td>' + parseFloat(atotal).toFixed(2) + '</td>' +
        //                        '<td></td>' +
        //                        '<td></td>' +
        //                        '<td></td>' +
        //                        '<td></td>' +
        //                        '</tr>');
        //                }
        //                else if (obj[0].type == 2) {
        //                    $("#example thead").append('<tr>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Reference No">Reference No</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Date">Date</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Amd Date">Amd Date</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Customer Name">Customer Name</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Profit">Profit</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Agent">Agent</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Status">Status</a></th>' +
        //                        '</tr>');
        //                    for (var i = 0; i < obj.length; i++) {
        //                        ptotal = parseFloat(ptotal) + parseFloat(obj[i].profit);
        //                        $("#example tbody").append('<tr>' +
        //                            '<td id="ContactId' + obj[i].ContactId + '"><a  data-toggle="tooltip" title="' + obj[i].ContactId + '">' + obj[i].ContactId + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].Date + '"><a  data-toggle="tooltip" title="' + obj[i].Date + '">' + moment(obj[i].Date).format('DD-MM-YYYY') + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].AmendmentDate + '"><a  data-toggle="tooltip" title="' + obj[i].AmendmentDate + '">' + moment(obj[i].AmendmentDate).format('DD-MM-YYYY') + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].CustomerName + '"><a  data-toggle="tooltip" title="' + obj[i].CustomerName + '">' + obj[i].CustomerName + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].profit + '"><a  data-toggle="tooltip" title="' + obj[i].profit + '">' + obj[i].profit + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].Agent + '"><a  data-toggle="tooltip" title="' + obj[i].Agent + '">' + obj[i].Agent + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].Status + '"><a  data-toggle="tooltip" title="' + obj[i].Status + '">' + obj[i].Status + '</a></td>' +
        //                            '</tr>');
        //                    }
        //                    $("#example tbody").append('<tr>' +
        //                        '<td>Total</td>' +
        //                        '<td></td>' +
        //                        '<td></td>' +
        //                        '<td></td>' +
        //                        '<td>' + parseFloat(ptotal).toFixed(2) + '</td>' +
        //                        '<td></td>' +
        //                        '<td></td>' +
        //                        '</tr>');
        //                }
        //                else if (obj[0].type == 1) {

        //                    $("#example thead").append('<tr>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Reference No">Reference No</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Date">Date</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Customer Name">Customer Name</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Profit">Profit</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Agent">Agent</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Status">Status</a></th>' +
        //                        '</tr>');
        //                    for (var i = 0; i < obj.length; i++) {
        //                        ptotal = parseFloat(ptotal) + parseFloat(obj[i].profit);
        //                        $("#example tbody").append('<tr>' +
        //                            '<td id="ContactId' + obj[i].ContactId + '"><a  data-toggle="tooltip" title="' + obj[i].ContactId + '">' + obj[i].ContactId + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].Date + '"><a  data-toggle="tooltip" title="' + obj[i].Date + '">' + moment(obj[i].Date).format('DD-MM-YYYY') + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].CustomerName + '"><a  data-toggle="tooltip" title="' + obj[i].CustomerName + '">' + obj[i].CustomerName + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].profit + '"><a  data-toggle="tooltip" title="' + obj[i].profit + '">' + obj[i].profit + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].Agent + '"><a  data-toggle="tooltip" title="' + obj[i].Agent + '">' + obj[i].Agent + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].Status + '"><a  data-toggle="tooltip" title="' + obj[i].Status + '">' + obj[i].Status + '</a></td>' +
        //                            '</tr>');
        //                    }
        //                    $("#example tbody").append('<tr>' +
        //                        '<td>Total</td>' +
        //                        '<td></td>' +
        //                        '<td></td>' +
        //                        '<td>' + parseFloat(ptotal).toFixed(2) + '</td>' +
        //                        '<td></td>' +
        //                        '<td></td>' +

        //                        '</tr>');
        //                }
        //                else {

        //                    $("#example thead").append('<tr>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Reference No">Reference No</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Date">Date</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Profit">Profit</a></th>' +
        //                        '<th><a class="white" data-toggle="tooltip" title="Agent">Agent</a></th>' +
        //                        '</tr>');
        //                    for (var i = 0; i < obj.length; i++) {
        //                        ptotal = parseFloat(ptotal) + parseFloat(obj[i].profit);
        //                        $("#example tbody").append('<tr>' +
        //                            '<td id="ContactId' + obj[i].ContactId + '"><a  data-toggle="tooltip" title="' + obj[i].ContactId + '">' + obj[i].ContactId + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].Date + '"><a  data-toggle="tooltip" title="' + obj[i].Date + '">' + moment(obj[i].Date).format('DD-MM-YYYY') + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].profit + '"><a  data-toggle="tooltip" title="' + obj[i].profit + '">' + obj[i].profit + '</a></td>' +
        //                            '<td id="ContactId' + obj[i].Agent + '"><a  data-toggle="tooltip" title="' + obj[i].Agent + '">' + obj[i].Agent + '</a></td>' +
        //                            '</tr>');
        //                    }
        //                    $("#example tbody").append('<tr>' +
        //                        '<td>Total</td>' +
        //                        '<td></td>' +
        //                        '<td>' + parseFloat(ptotal).toFixed(2) + '</td>' +
        //                        '<td></td>' +
        //                        '</tr>');
        //                }
        //            }
        //            else {
        //                $("#example").empty();
        //                $("#example").append(
        //                    '<thead></thead>' +
        //                    '<tbody></tbody>' +
        //                    '<tfoot></tfoot>'
        //                );
        //                $("#example thead").append('<tr>' +
        //                    '<th><a class="white" data-toggle="tooltip" title="Voucher No">No Records Found.</a></th>' +
        //                    '</tr>');

        //            }
        //        }

        //    })
        //}



    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="example" class="display nowrap" style="width: 100%">
            </table>
        </div>
    </form>

</body>

</html>
