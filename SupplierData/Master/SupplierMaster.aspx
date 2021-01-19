<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SupplierMaster.aspx.cs" Inherits="SupplierData.Master.SupplierMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
         function fnneutral() {
         }
         function isNumber(evt) { //put by dharinee
             var i = (evt.which) ? evt.which : event;
             if (i <= 57) {
                 if (i >= 48 || i == 8) {
                     return true;
                 }
             }
             return false;
         }
    window.onload = function () {
        GetSupplier();
    };

function GetSupplier() {
var html = "";
       

$.ajax({
type: "POST",
url: "SupplierMaster.aspx/GetSupplierData",
data: "{}",
contentType: "application/json; charset=utf-8",
dataType: "json",
success: function (data) {
    var SList = jQuery.parseJSON(data.d);
    // alert(BrandList);
    $("#divid").empty();
    $("#divid").append('<table id="tblSupplierMaster" class="datatable table table-bordered">' +
        '<thead></thead>' +
        '<tbody></tbody>' +
        '</table>');
    var html = "";
    $("#tblSupplierMaster thead").append('<tr>' +
        '<th><a class="white" data-toggle="tooltip" title="Supplier Name">Supplier Name</a></th>' +
        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Address</a></th>' +
        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Pincode</a></th>' +
        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Contact Person 1</a></th>' +
        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Mobile No</a></th>' +
        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Contact Person 2</a></th>' +
        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Mobile No</a></th>' +
        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Email </a></th>' +
        '<th><a class="white" data-toggle="tooltip" title="Type">Remarks </a></th>' +
        '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
        '</tr>');

    for (var i = 0; i < SList.length; i++) {
      //  if (data.d[i].Status == "Active") {
            html += ("<tr><td id='Name" + SList[i].Id + "'><a  data-toggle='tooltip' title='" + SList[i].Name + "'>" + SList[i].Name + "</a></td>" +
                "<td id='Address" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].Address + "'>" + SList[i].Address + "</a></td>" +
                "<td id='Pincode" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].Pincode + "'>" + SList[i].Pincode + "</a></td>" +
                "<td id='ContactPerson1" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].ContactPerson1 + "'>" + SList[i].ContactPerson1 + "</a></td>" +
                "<td id='Mobile1" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].Mobile1 + "'>" + SList[i].Mobile1 + "</a></td>" +
                "<td id='ContactPerson2" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].ContactPerson2 + "'>" + SList[i].ContactPerson2 + "</a></td>" +
                "<td id='Mobile2" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].Mobile2 + "'>" + SList[i].Mobile2 + "</a></td>" +
                "<td id='EmailId" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].EmailId + "'>" + SList[i].EmailId + "</a></td>" +
                "<td id='Remarks" + SList[i].Id + "'><a data-toggle='tooltip' title='" + SList[i].Remarks + "'>" + SList[i].Remarks + "</a></td>" +
                "<td id='button" + SList[i].Id + "'><a href='javascript:EditRecord(&apos;" + SList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + SList[i].Id + "' href='javascript:Delete(&apos;" + SList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></tr>");
        
    }
    $("#tblSupplierMaster tbody").append(html);
    $('#tblSupplierMaster').dataTable({
        language:
        {
            searchPlaceholder: "Search"
        }
    });
}
});
}
function SaveSupplierData() {
    debugger
    var error = "";
var Name = $("#name").val();
    var Address = $("#address").val();
    var Pincode = $("#pincode").val();
    var ContactPerson1 = $("#contactperson1").val();
    var Mobile1 = $("#mobile1").val();
    var Email = $("#email").val();
    var ContactPerson2 = $("#contactperson2").val();
    var Mobile2 = $("#mobile2").val();
    var Remarks = $("#remarks").val();
    var EmpId = '<%= Session["EmpId"] %>';
    if (Name == "") {
        error += "Please Enter Name.</br>";
    }
    if (Address == "") {
        error += "Please Enter Address.</br>";
    }
    if (Pincode == "") {
        error += "Please Enter Pincode.</br>";
    }
    if (ContactPerson1 == "") {
        error += "Please Enter ContactPerson1.</br>";
    }
    if (Mobile1 == "") {
        error += "Please Enter Mobile1.</br>";

    }
    if (Email != "") {
        if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(Email)) {

        }
        else {
            error += "Please Enter Valid EmailId.</br>";
        }
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
    url: "SupplierMaster.aspx/SupplierInsert",
    data: "{Name:'" + Name + "',Address:'" + Address + "',Pincode:'" + Pincode + "',ContactPerson1:'" + ContactPerson1 + "',Mobile1:'" + Mobile1 + "',ContactPerson2:'" + ContactPerson2 + "',Mobile2:'" + Mobile2 + "',Email:'" + Email + "',CreatedBy:'" + EmpId + "',Remarks:'" + Remarks + "'}",
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
            GetSupplier();
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
        document.getElementById('pincode').value = "";
        document.getElementById('contactperson1').value = "";
        document.getElementById('mobile1').value = "";
        document.getElementById('contactperson2').value = "";
        document.getElementById('mobile2').value = "";
        document.getElementById('email').value = "";
        document.getElementById('remarks').value = "";
    }
});

}
         }
         function OpenExcel() {
             window.open("ExportToExcel.aspx?Type=SUPPLIER", '_blank');
         }
         var PervID = "";
         function EditRecord(Id) {
             if (PervID != "") {
                 try {
                     var Name = document.getElementById('SPName').innerHTML;
                     var Address = document.getElementById('SPAddress').innerHTML;
                     var Pincode = document.getElementById('SPPincode').innerHTML;
                     var ContactPerson1 = document.getElementById('SPContactPerson1').innerHTML;
                     var Mobile1 = document.getElementById('SPMobile1').innerHTML;
                     var ContactPerson2 = document.getElementById('SPContactPerson2').innerHTML;
                     var Mobile2 = document.getElementById('SPMobile2').innerHTML;
                     var EmailId = document.getElementById('SPEmailId').innerHTML;
                     var Remarks = document.getElementById('SPRemarks').innerHTML;
                 }
                 catch (ex) {
                     var Name = document.getElementById('Name' + PervID).childNodes[0].innerHTML;
                     var Address = document.getElementById('Address' + PervID).childNodes[0].innerHTML;
                     var Pincode = document.getElementById('Pincode' + PervID).childNodes[0].innerHTML;
                     var ContactPerson1 = document.getElementById('ContactPerson1' + PervID).childNodes[0].innerHTML;
                     var Mobile1 = document.getElementById('Mobile1' + PervID).childNodes[0].innerHTML;
                     var ContactPerson2 = document.getElementById('ContactPerson2' + PervID).childNodes[0].innerHTML;
                     var Mobile2 = document.getElementById('Mobile2' + PervID).childNodes[0].innerHTML;
                     var EmailId = document.getElementById('EmailId' + PervID).childNodes[0].innerHTML;
                     var Remarks = document.getElementById('Remarks' + PervID).childNodes[0].innerHTML;
                 }


                 document.getElementById('Name' + PervID).childNodes[0].innerHTML = Name;
                 document.getElementById('Address' + PervID).childNodes[0].innerHTML = Address;
                 document.getElementById('Pincode' + PervID).childNodes[0].innerHTML = Pincode;
                 document.getElementById('ContactPerson1' + PervID).childNodes[0].innerHTML = ContactPerson1;
                 document.getElementById('Mobile1' + PervID).childNodes[0].innerHTML = Mobile1;
                 document.getElementById('ContactPerson2' + PervID).childNodes[0].innerHTML = ContactPerson2;
                 document.getElementById('Mobile2' + PervID).childNodes[0].innerHTML = Mobile2;
                 document.getElementById('EmailId' + PervID).childNodes[0].innerHTML = EmailId;
                 document.getElementById('Remarks' + PervID).childNodes[0].innerHTML = Remarks;
                 document.getElementById('button' + PervID).innerHTML = "<a href='javascript:EditRecord(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + PervID + "' href='javascript:Delete(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
             }
             var Name = document.getElementById('Name' + Id).childNodes[0].innerHTML;
             var Address = document.getElementById('Address' + Id).childNodes[0].innerHTML;
             var Pincode = document.getElementById('Pincode' + Id).childNodes[0].innerHTML;
             var ContactPerson1 = document.getElementById('ContactPerson1' + Id).childNodes[0].innerHTML;
             var Mobile1 = document.getElementById('Mobile1' + Id).childNodes[0].innerHTML;
             var ContactPerson2 = document.getElementById('ContactPerson2' + Id).childNodes[0].innerHTML;
             var Mobile2 = document.getElementById('Mobile2' + Id).childNodes[0].innerHTML;
             var EmailId = document.getElementById('EmailId' + Id).childNodes[0].innerHTML;
             var Remarks = document.getElementById('Remarks' + Id).childNodes[0].innerHTML;
             document.getElementById('Name' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InName" + Id + "'   value='" + Name + "' /><span class='none' id='SPName'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
             document.getElementById('Address' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InAddress" + Id + "'   value='" + Address + "' /><span class='none' id='SPAddress'>" + Address + "</span>";  //onkeypress='return isCharacter(event)'
             document.getElementById('Pincode' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InPincode" + Id + "'   value='" + Name + "' maxlength='6' /><span class='none' id='SPPincode'>" + Pincode + "</span>";  //onkeypress='return isCharacter(event)'
             document.getElementById('ContactPerson1' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InContactPerson1" + Id + "'   value='" + ContactPerson1 + "' /><span class='none' id='SPContactPerson1'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
             document.getElementById('Mobile1' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InMobile1" + Id + "'   value='" + Mobile1 + "'  maxlength='10' onkeypress='return isNumber(event);'/><span class='none' id='SPNMobile1'>" + Mobile1 + "</span>";  //onkeypress='return isCharacter(event)'
             document.getElementById('ContactPerson2' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InContactPerson2" + Id + "'   value='" + ContactPerson2 + "' /><span class='none' id='SPContactPerson2'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
             document.getElementById('Mobile2' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InMobile2" + Id + "'   value='" + Mobile2 + "'  maxlength='10' onkeypress='return isNumber(event);' /><span class='none' id='SPMobile2'>" + Mobile2 + "</span>";  //onkeypress='return isCharacter(event)'
             document.getElementById('EmailId' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InEmailId" + Id + "'   value='" + EmailId + "' /><span class='none' id='SPEmailId'>" + EmailId + "</span>";  //onkeypress='return isCharacter(event)'
             document.getElementById('Remarks' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InRemarks" + Id + "'   value='" + Remarks + "' /><span class='none' id='SPRemarks'>" + Remarks + "</span>";  //onkeypress='return isCharacter(event)'
             document.getElementById('button' + Id).innerHTML = "<a href='javascript:UpdateRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Update' ><img src='../images/right.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:CancelRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Cancel'><img src='../images/cancel.png' class='CancelClick'/>&nbsp;</a>";
             PervID = Id;
         }
         function CancelRecord(Id) {
             GetSupplier();
             //var Name = document.getElementById('SPName').innerHTML;
             //document.getElementById('Name' + Id).childNodes[0].innerHTML = Name;
             //document.getElementById('button' + Id).innerHTML = "<a href='javascript:EditRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:Delete(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
             //PervID = "";
         }

         function UpdateRecord(Id) {
             var error = "";
             var Name = $("#InName" + Id).val();
             var Address = $("#InAddress" + Id).val();
             var Pincode = $("#InPincode" + Id).val();
             var ContactPerson1 = $("#InContactPerson1" + Id).val();
             var Mobile1 = $("#InMobile1" + Id).val();
             var ContactPerson2 = $("#InContactPerson2" + Id).val();
             var Mobile1 = $("#InMobile1" + Id).val();
             var ContactPerson2 = $("#InContactPerson2" + Id).val();
             var Mobile2 = $("#InMobile2" + Id).val();
             var EmailId = $("#InEmailId" + Id).val();
             var Remarks = $("#InRemarks" + Id).val();
             var EmpId = '<%= Session["EmpId"] %>';
             if (Name == "") {
                 error += "Please Enter Name.</br>";
             }
             if (Address == "") {
                 error += "Please Enter Address.</br>";
             }
             if (Pincode == "") {
                 error += "Please Enter Pincode.</br>";
             }
             if (ContactPerson1 == "") {
                 error += "Please Enter ContactPerson1.</br>";
             }
             if (Mobile1 == "") {
                 error += "Please Enter Mobile1.</br>";

             }
             if (EmailId == "") {
                 error += "Please Enter EmailId.</br>";
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
                     url: "SupplierMaster.aspx/UpdateRecord",
                     data: "{Id:'" + Id + "',Name:'" + Name + "',Address:'" + Address + "',Pincode:'" + Pincode + "',ContactPerson1:'" + ContactPerson1 + "',Mobile1:'" + Mobile1 + "',ContactPerson2:'" + ContactPerson2 + "',Mobile2:'" + Mobile2 + "',Email:'" + EmailId + "',ModifiedBy:'" + EmpId + "',Remarks:'" + Remarks + "'}",
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
                             GetSupplier();
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

             var Id = CurrentId;
             $.ajax({
                 type: "POST",
                 url: "SupplierMaster.aspx/DeleteRecord",
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
                         GetSupplier();
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
                 url: "SupplierMaster.aspx/ImportInsert",
                 data: "{data:'" + JSON.stringify(jsondata) + "',CreatedBy:'" + EmpId + "'}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (data) {
                     if (data.d > 0) {
                         GetSupplier();
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
                    <div class="page-title"><b>Supplier Master</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Supplier Master</li>
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
							
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Supplier</label>
								<input type="text" id="name" name="name"  placeholder="Name" class=" form-control"  />
							</div>
                            
                                    <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Address</label>
								<input type="text" id="address" name="address"  placeholder="ADDRESS" class=" form-control"  />
							</div>
                                    <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Pincode</label>
								<input type="text" id="pincode" name="pincode"  placeholder="PINCODE" class=" form-control" maxlength="6" />
							</div>
                                    <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Contact Person 1</label>
								<input type="text" id="contactperson1" name="contactperson1"  placeholder="PERSON" class=" form-control"  />
							</div>
                                  
                                    <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Mobile</label>
								<input type="text" id="mobile1" name="mobile1"  placeholder="MOBILE" class=" form-control"  onkeypress='return isNumber(event);'  maxlength="10"/>
							</div>
                                  
                                   
                               <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Contact Person 2</label>
								<input type="text" id="contactperson2" name="contactperson2"  placeholder="PERSON" class=" form-control"  />
							</div>
                                     <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Mobile</label>
								<input type="text" id="mobile2" name="mobile2"  placeholder="MOBILE" class=" form-control" onkeypress='return isNumber(event);'   maxlength="10"/>
							</div>
                                  
                                    <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Email</label>
								<input type="text" id="email" name="email"  placeholder="EMAIL" class=" form-control"  />
							</div>
                            
                                    <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Remarks</label>
								<input type="text" id="remarks" name="remarks"  placeholder="Remarks" class=" form-control"  />
							</div>
							<!-- Button -->
							<div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
								<button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveSupplierData();">ADD</button>
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
                                            <!-- END ALERT ON_CLICK DELETE -->
                </div>
				<!-- /Form Layouts -->
			</div>
			<!--END PAGE-CONTENT-->
		</div>
        <!--END PAGE WRAPPER-->

</asp:Content>
