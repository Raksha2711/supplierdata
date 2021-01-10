<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="SupplierData.Master.Service" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fnneutral() {
        }
        function isNumber(evt) {
            var i = (evt.which) ? evt.which : event;
            if (i <= 57) {
                if (i >= 48 || i == 8) {
                    return true;
                }
            }
            return false;
        }
     window.onload = function () {
         EditBindArea(null);
         BindBrandName(null);
         GetService();
         BindArea();
        };
        function BindBrandName(Id) {
            $.ajax({
                type: "POST",
                url: "Service.aspx/BindBrandName",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    if (Id == "" || Id == null) {
                        $('#BName').empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#BName').append(html);
                    }
                    else {
                        $('#InBrand' + Id).empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#InBrand' + Id).append(html);
                    }
                    //$('#BName').multiselect('rebuild');
                }
            });
        }
     /*   function BindBrand() {
            try {
                $.ajax({
                    type: "POST",
                    url: "Service.aspx/BindAreaData",
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
        }*/
        function EditBindArea(Id) {
              try {
                  $.ajax({
                      type: "POST",
                      url: "Service.aspx/BindAreaData",
                      data: "{}",
                      contentType: "application/json; charset=utf-8",
                      global: false,
                      async: false,
                      dataType: "json",
                      success: function (data) {
                          var obj = jQuery.parseJSON(data.d);
                          var html = "";
                          if (Id == "" || Id == null) {
                              $('#AreaName').empty();
                              html += '<option id="optcname" value="">Select</option>';
                              $.each(obj, function (key, value) {
                                  html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + ' (' + value.StateName + ')' + ' </option>';
                              });
                              $('#AreaName').append(html);
                          }
                          else {
                              $('#InArea' + Id).empty();
                              html += '<option id="optcname" value="">Select</option>';
                              $.each(obj, function (key, value) {
                                  html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                              });
                              $('#InArea' + Id).append(html);
                          }
                      }
                  });
              }
              catch (ex) { alert(ex); }
        }
        function BindArea() {
            try {
                $.ajax({
                    type: "POST",
                    url: "Service.aspx/BindAreaData",
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
        function GetService() {
        var html = "";
        $.ajax({
            type: "POST",
            url: "Service.aspx/GetServiceData",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                debugger
                var SList = jQuery.parseJSON(data.d);
                $("#divid").empty();
                $("#divid").append('<table id="tblServieMaster" class="datatable table table-bordered">' +
                    '<thead></thead>' +
                    '<tbody></tbody>' +
                    '</table>');
                var html = "";
                $("#tblServieMaster thead").append('<tr>' +
                    '<th><a class="white" data-toggle="tooltip" title="Brand">Brand</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Area">Area</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Name">Name</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Address">Address</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="ContactNo">ContactNo</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Email">Email</a></th>' +
                    '<th data-orderable="false" class="hidden"><a class="white" data-toggle="tooltip" title="Status">Status</a></th>' +
                    '<th data-orderable="false" ><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
                    '</tr>');

                for (var i = 0; i < SList.length; i++) {
                  //  if (SList[i].Status == "Active") {
                        html += ("<tr><td id = 'Brand" + SList[i].Id + "' ><a data-toggle='tooltip' title='" + SList[i].Brand + "'>" + SList[i].Brand + "</a></td>" +
                            "<td id='Area" + SList[i].Id + "' ><a data-toggle='tooltip' title='" + SList[i].Area + "'>" + SList[i].Area + "</a></td>" +
                            "<td id = 'Name" + SList[i].Id + "' ><a data-toggle='tooltip' title='" + SList[i].Name + "'>" + SList[i].Name + "</a></td >" + 
                            "<td id = 'Address" + SList[i].Id + "' ><a data-toggle='tooltip' title='" + SList[i].Address + "'>" + SList[i].Address + "</a></td>" + 
                            "<td id='ContactNo" + SList[i].Id + "' ><a data-toggle='tooltip' title='" + SList[i].ContactNo + "'  onkeypress='return isNumber(event);'  maxlength='11'>" + SList[i].ContactNo + "</a></td>" +
                            "<td id='Email" + SList[i].Id + "' ><a data-toggle='tooltip' title='" + SList[i].Email + "'>" + SList[i].Email + "</a></td>" +
                            "<td class='hidden' id='Status" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].Status + "'>" + SList[i].Status + "</a></td>" + 
                            "<td  id='button" + SList[i].Id + "'><a href='javascript:EditRecord(&apos;" + SList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png' /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + SList[i].Id + "' href='javascript:Delete(&apos;" + SList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></tr > ");
                    //}
                    //else {
                    //    html += ("<tr><td id = 'Brand" + SList[i].Id + "' > <a data-toggle='tooltip' title='" + SList[i].Brand + "'>" + SList[i].Brand + "</a></td>" +
                    //        "<td id='Name" + SList[i].Id + "'><a  data-toggle='tooltip' title='" + SList[i].Name + "'>" + SList[i].Name + "</a></td>" +
                    //        "<td id = 'Address" + SList[i].Id + "' > <a data-toggle='tooltip' title='" + SList[i].Address + "'>" + SList[i].Address + "</a></td>" +
                    //        "<td id='ContactNo" + SList[i].Id + "' > <a data-toggle='tooltip' title='" + SList[i].ContactNo + "'>" + SList[i].ContactNo + "</a></td>" +
                    //        "<td id='Email" + SList[i].Id + "' > <a data-toggle='tooltip' title='" + SList[i].Email + "'>" + SList[i].Email + "</a></td>" +
                    //        "<td id='Area" + SList[i].Id + "' > <a data-toggle='tooltip' title='" + SList[i].Area + "'>" + SList[i].Area + "</a></td>" +
                    //        "<td class='hidden' id = 'Status" + SList[i].Id + "' > <a data-toggle='tooltip' title='" + SList[i].Status + "'>" + SList[i].Status + "</a></td > <td class='hidden' id='button" + SList[i].Id + "'><a href='javascript:EditRecord(&apos;" + SList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png' /></a>&nbsp;<a id='deleteanchor" + SList[i].Id + "' />&nbsp;</a></td ></tr > ");
                    //}
                }
                
                $("#tblServieMaster tbody").append(html);
                $('#tblServieMaster').dataTable({
                    language:
                    {
                        searchPlaceholder: "Search"
                    }
                });

            }
           
        });
    }
        function SaveServiceData() {
        debugger
            var Name = $("#name").val();
            var Address = $("#address").val();
            var Contact = $("#contact").val();
            var Email = $("#email").val();
            var Area = $("#AreaName").val();
            var Brand = $("#BName").val();
            var EmpId = '<%= Session["EmpId"] %>';
            Name = Name.replace("&amp;", "&");


            var error = "";
            if (Name == "") {
                error += "Please Enter Name.</br>";
            }
            if (Address == "") {
                error += "Please Enter Address.</br>";
            }
            if (Contact == "") {
                error += "Please Enter Contact.</br>";

            }
            //if (Email == "") {
            //    error += "Please Enter EmailId.</br>";
            //}
            if (Email != "") {
                if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(Email)) {

                }
                else {
                    error += "Please Enter Valid EmailId.</br>";
                }
            }
            if (Area == "") {
                error += "Please Enter Area.</br>";
            }

            if (Brand == "") {
                error += "Please Enter Brand.</br>";
            }
            if (error.trim() != "") {
                Lobibox.notify('error', {
                    delay: 3000,
                    size: 'mini',
                    icon: false,
                    msg: error
                });
            }
            else {

     //   if (Name != "" ) {
            $.ajax({
                type: "POST",
                url: "Service.aspx/ServiceInsert",
                data: "{Name:'" + Name + "',Address:'" + Address + "',ContactNo:'" + Contact + "',Email:'" + Email + "',Area:'" + Area + "',Brand:'" + Brand + "',CreatedBy:'" + EmpId + "'}",
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
                        GetService();
                    }
                    else {
                        Lobibox.notify('error', {
                            delay: 1000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data is not Inserted Succesfully.'
                        });
                    }
                    document.getElementById('name').value = "";
                    document.getElementById('address').value = "";
                    document.getElementById('contact').value = "";
                    document.getElementById('email').value = "";
                    $("#AreaName").val('');
                    $("#BName").val('');

                }
            });

        }
        }
        function OpenExcel() {
            window.open("ExportToExcel.aspx?Type=SERVICE", '_blank');
        }
        var PervID = "";
        function EditRecord(Id) {
            if (PervID != "") {
                try {
                    var Name = document.getElementById('SPBrand').innerHTML;
                    var Area = document.getElementById('SPArea').innerHTML;
                    var Name = document.getElementById('SPName').innerHTML;
                    var Address = document.getElementById('SPAddress').innerHTML;
                    var ContactNo = document.getElementById('SPContactNo').innerHTML;
                    var Email = document.getElementById('SPEmail').innerHTML;
                    //  var Status = document.getElementById('SPStatus').innerHTML;
                }
                catch (ex) {
                    var Brand = document.getElementById('Brand' + PervID).childNodes[0].innerHTML;
                    var Area = document.getElementById('Area' + PervID).childNodes[0].innerHTML;
                    var Name = document.getElementById('Name' + PervID).childNodes[0].innerHTML;
                    var Address = document.getElementById('Address' + PervID).childNodes[0].innerHTML;
                    var ContactNo = document.getElementById('ContactNo' + PervID).childNodes[0].innerHTML;
                    var Email = document.getElementById('Email' + PervID).childNodes[0].innerHTML;

                }
                document.getElementById('Brand' + PervID).childNodes[0].innerHTML = Brand;
                document.getElementById('Area' + PervID).childNodes[0].innerHTML = Area;
                document.getElementById('Name' + PervID).childNodes[0].innerHTML = Name;
                document.getElementById('Address' + PervID).childNodes[0].innerHTML = Address;
                document.getElementById('ContactNo' + PervID).childNodes[0].innerHTML = ContactNo;
                document.getElementById('Email' + PervID).childNodes[0].innerHTML = Email;
                document.getElementById('button' + PervID).innerHTML = "<a href='javascript:EditRecord(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + PervID + "' href='javascript:Delete(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
            }
            var html = "";
            var Brand = document.getElementById('Brand' + Id).childNodes[0].innerHTML;
            var Area = document.getElementById('Area' + Id).childNodes[0].innerHTML;
            var Name = document.getElementById('Name' + Id).childNodes[0].innerHTML;
            var Address = document.getElementById('Address' + Id).childNodes[0].innerHTML;
            var ContactNo = document.getElementById('ContactNo' + Id).childNodes[0].innerHTML;
            var Email = document.getElementById('Email' + Id).childNodes[0].innerHTML;

            document.getElementById('Brand' + Id).childNodes[0].innerHTML = "<select id='InBrand" + Id + "'  class='form-control' ><option>" + Brand + "</option></select><span class='none' id='SPBrand'>" + Brand + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('Area' + Id).childNodes[0].innerHTML = "<select id='InArea" + Id + "'  class='form-control' ><option>" + Area + "</option></select><span class='none' id='SPArea'>" + Area + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('Name' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InName" + Id + "'   value='" + Name + "' /><span class='none' id='SPName'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('Address' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InAddress" + Id + "'   value='" + Address + "' /><span class='none' id='SPAddress'>" + Address + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('ContactNo' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InContactNo" + Id + "'   value='" + ContactNo + "' /><span class='none' id='SPContactNo'>" + ContactNo + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('Email' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InEmail" + Id + "'   value='" + Email + "' /><span class='none' id='SPEmail'>" + Email + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('button' + Id).innerHTML = "<a href='javascript:UpdateRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Update' ><img src='../images/right.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:CancelRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Cancel'><img src='../images/cancel.png' class='CancelClick'/>&nbsp;</a>";
            BindBrandName(Id);
            EditBindArea(Id);
            var ddlbrand = document.getElementById('InBrand' + Id);
            for (var j = 0; j < ddlbrand.length; j++) {
                var strUser = ddlbrand.options[j].innerHTML;
                if (strUser.trim() == Brand.trim()) {
                    ddlbrand.options[j].selected = true;
                    break;
                }
            }
            var ddlsub = document.getElementById('InArea' + Id);
            for (var j = 0; j < ddlsub.length; j++) {
                var strUser = ddlsub.options[j].innerHTML;
                if (strUser.trim() == Area.trim()) {
                    ddlsub.options[j].selected = true;
                    break;
                }   
            }
           
            PervID = Id;
        }
        function CancelRecord(Id) {
            GetService();
            //var Name = document.getElementById('SPName').innerHTML;
            //var Website = document.getElementById('SPWebsite').innerHTML;
            //document.getElementById('Name' + Id).childNodes[0].innerHTML = Name;
            //document.getElementById('Website' + Id).childNodes[0].innerHTML = Website;
            //document.getElementById('button' + Id).innerHTML = "<a href='javascript:EditRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:Delete(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
            PervID = "";
        }

        function UpdateRecord(Id) {
            var error = "";
            var Name = $("#InName" + Id).val();
            var Address = $("#InAddress" + Id).val();
            var Contact = $("#InContactNo" + Id).val();
            var Email = $("#InEmail" + Id).val();
            var Area = $("#InArea" + Id).val();
            var Brand = $("#InBrand" + Id).val();
            var EmpId = '<%= Session["EmpId"] %>';
            Name = Name.replace("&amp;", "&");


            if (Name == "") {
                error += "Please Enter Name.</br>";
            }
            if (Address == "") {
                error += "Please Enter Address.</br>";
            }
            if (Contact == "") {
                error += "Please Enter Contact.</br>";

            }
            if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(Email)) {

            }
            else {
                error += "Please Enter Valid EmailId.</br>";
            }
            if (Area == "") {
                error += "Please Enter Area.</br>";
            }

            if (Brand == "") {
                error += "Please Enter Brand.</br>";
            }
            if (error.trim() != "") {
                Lobibox.notify('error', {
                    delay: 3000,
                    size: 'mini',
                    icon: false,
                    msg: error
                });
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "Service.aspx/UpdateRecord",
                    data: "{Id:'" + Id + "',Name:'" + Name + "',Address:'" + Address + "',ContactNo:'" + Contact + "',Email:'" + Email + "',Area:'" + Area + "',Brand:'" + Brand + "',ModifiedBy:'" + EmpId + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    global: false,
                    async: false,
                    success: function (data) {

                        if (data.d == 1) {
                            Lobibox.notify('error', {
                                delay: 3000,
                                size: 'mini',
                                icon: false,
                                msg: 'Name is already exists.'
                            });
                        }
                        else if (data.d == 0) {

                            Lobibox.notify('success', {
                                delay: 3000,
                                size: 'mini',
                                icon: false,
                                msg: 'Data saved Successfully.'
                            });
                            GetService();
                        }
                        else if (data.d == 2) {
                            Lobibox.notify('error', {
                                delay: 3000,
                                size: 'mini',
                                icon: false,
                                msg: 'Name is  already Exists.'
                            });
                        }
                        else if (data.d == "3") {
                            Lobibox.notify('error', {
                                delay: 1500,
                                size: 'mini',
                                icon: false,
                                msg: 'Enter Valid  Name'
                            });
                        }
                        else {
                            Lobibox.notify('error', {
                                delay: 3000,
                                size: 'mini',
                                icon: false,
                                msg: ' Name is not saved Succesfully.'
                            });
                        }
                    }
                });
            }
        }

        var CurrentId = "";

        function Delete(Id) {
            CurrentId = Id;
            $("#deleteanchor" + Id).attr("data-target", "#modal-delete");
            $("#deleteanchor" + Id).attr("data-toggle", "modal");
            document.getElementById('deleteanchor' + Id).click();
        }
        function DeleteRecord() {
            debugger
            var Id = CurrentId;
            $.ajax({
                type: "POST",
                url: "Service.aspx/DeleteRecord",
                data: "{Id: '" + Id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == Id) {
                        Lobibox.notify('success', {
                            delay: 3000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data deleted Succesfully.'
                        });
                        GetService();
                    }
                    else {
                        Lobibox.notify('error', {
                            delay: 3000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data is not deleted Succesfully.'
                        });
                    }
                }
            });
        }
        function ExportToTable() {
            debugger
            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xlsx|.xls)$/;
            /*Checks whether the file is a valid excel file*/
            if (regex.test($("#excelfile").val().toLowerCase())) {
                var xlsxflag = false; /*Flag for checking whether excel is .xls format or .xlsx format*/
                if ($("#excelfile").val().toLowerCase().indexOf(".xlsx") > 0) {
                    xlsxflag = true;
                }
                /*Checks whether the browser supports HTML5*/
                if (typeof (FileReader) != "undefined") {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var data = e.target.result;
                        /*Converts the excel data in to object*/
                        if (xlsxflag) {
                            var workbook = XLSX.read(data, { type: 'binary' });
                        }
                        else {
                            var workbook = XLS.read(data, { type: 'binary' });
                        }
                        /*Gets all the sheetnames of excel in to a variable*/
                        var sheet_name_list = workbook.SheetNames;

                        var cnt = 0; /*This is used for restricting the script to consider only first sheet of excel*/
                        sheet_name_list.forEach(function (y) { /*Iterate through all sheets*/
                            /*Convert the cell value to Json*/
                            if (xlsxflag) {
                                var exceljson = XLSX.utils.sheet_to_json(workbook.Sheets[y]);
                            }
                            else {
                                var exceljson = XLS.utils.sheet_to_row_object_array(workbook.Sheets[y]);
                            }
                            if (exceljson.length > 0 && cnt == 0) {
                                BindTable(exceljson);
                                cnt++;
                            }
                        });
                        // $('#exceltable').show();
                    }
                    if (xlsxflag) {/*If excel file is .xlsx extension than creates a Array Buffer from excel*/
                        reader.readAsArrayBuffer($("#excelfile")[0].files[0]);
                    }
                    else {
                        reader.readAsBinaryString($("#excelfile")[0].files[0]);
                    }
                }
                else {
                    alert("Sorry! Your browser does not support HTML5!");
                }
            }
            else {
                alert("Please upload a valid Excel file!");
            }
        }
        function BindTable(jsondata) {/*Function used to convert the JSON array to Html Table*/
            var EmpId = '<%= Session["EmpId"] %>';
            $.ajax({
                type: "POST",
                url: "Service.aspx/ImportInsert",
                data: "{data:'" + JSON.stringify(jsondata) + "',CreatedBy:'" + EmpId + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d > 0) {
                        GetService();
                    }
                    else {
                        Lobibox.notify('error', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data  already Inserted.'
                        });
                    }

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
                    <div class="page-title"><b>Service Center</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Service Center</li>
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
                                <div class="col-lg-2 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Brand : </label>
                                <select class="form-control" name="" id="BName">
									</select>
							</div>
                                <div class="col-lg-2 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Area : </label>
                                <select class="form-control" name="AreaName" id="AreaName">
									</select>
							</div>
							 <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Name</label>
								<input type="text" id="name" name="name"  placeholder="NAME" class=" form-control"  />
							</div>
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Address</label>
								<input type="text" id="address" name="address"  placeholder="ADDRESS" class=" form-control"  />
							</div>
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Contact</label>
								<input type="text" id="contact" name="contact"  placeholder="CONTACT" class=" form-control"  onkeypress='return isNumber(event);'  maxlength='11'/>
							</div>
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Email</label>
								<input type="text" id="email" name="email"  placeholder="na@na.com" class=" form-control"  />
							</div>

                            
                              
                            	
							<!-- Button -->
							<div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
								<button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveServiceData();">ADD</button>
								<a href="#"><img src="<%=ConfigurationManager.AppSettings["url"] %>images/excel.png" class="mrgr7" data-toggle="tooltip" title="Export To Excel" onclick="OpenExcel();" /></a> 
							</div>
                            <div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">  
                               <input type="file" id="excelfile" />  
                                    </div>
                             <div class="col-lg-2 col-md-3 col-sm-2 col-xs-6  mrgt30">  
  
                                 <button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="viewfile" id="viewfile" onclick="ExportToTable();">IMPORT</button>
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
					<!-- BEGIN ALERT ON_CLICK DELETE -->
                                            <div id="modal-delete" tabindex="-1" role="dialog" aria-hidden="true" class="modal fade">
                                                <div class="modal-dialog alertwidth">
                                                    <div class="modal-content">
                                                        <div class="modal-header brdrnone">
<button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
</div>
                                                        <div class="modal-body row">
<div class="col-lg-12"><b>Do You Want to Delete this Record?</b></div>
<div class="col-lg-12 txtright mrgt15">
<button type="button" data-dismiss="modal" class="btn btn-ok mrgr7" onclick="DeleteRecord();">Ok</button>
<button type="button" data-dismiss="modal" class="btn btn-cancel">Cancel</button>
</div>
</div>
                                                    </div>
                                                </div>
                                            </div>
                </div>
				<!-- /Form Layouts -->
			</div>
			<!--END PAGE-CONTENT-->
		</div>
        <!--END PAGE WRAPPER-->
</asp:Content>
