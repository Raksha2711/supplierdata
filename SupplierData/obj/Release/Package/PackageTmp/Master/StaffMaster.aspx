<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StaffMaster.aspx.cs" Inherits="SupplierData.Master.StaffMaster" %>
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
        GetStaff();
    };
        function GetStaff() {
        var html = "";
        $.ajax({
            type: "POST",
            url: "StaffMaster.aspx/GetstaffData",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                debugger
                var BrandList = jQuery.parseJSON(data.d);
               // alert(BrandList);
                $("#divid").empty();
                $("#divid").append('<table id="tblStaffMaster" class="datatable table table-bordered">' +
                    '<thead></thead>' +
                    '<tbody></tbody>' +
                    '</table>');
                var html = "";
                $("#tblStaffMaster thead").append('<tr>' +
                    '<th><a class="white" data-toggle="tooltip" title="Name"> Name</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Contact">Contact No</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Email">Email</a></th>' +
                    '<th data-orderable="false" class="hidden"><a class="white" data-toggle="tooltip" title="Status">Status</a></th>' +
                    '<th data-orderable="false" ><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
                    '</tr>');
                for (var i = 0; i < BrandList.length; i++) {
                    html += ("<tr><td id='Name" + BrandList[i].Id + "'><a  data-toggle='tooltip' title='" + BrandList[i].Name + "'>" + BrandList[i].Name + "</a></td><td id='ContactNo" + BrandList[i].Id + "'><a  data-toggle='tooltip' title='" + BrandList[i].ContactNo + "'>" + BrandList[i].ContactNo + "</a></td> <td id='Email" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].Email + "'>" + BrandList[i].Email + "</a></td> <td class='hidden' id='Status" + BrandList[i].Id + "'><a  data-toggle='tooltip' title='" + BrandList[i].Status + "'>" + BrandList[i].Status + "</a></td><td   id='button" + BrandList[i].Id + "'><a href='javascript:EditRecord(&apos;" + BrandList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + BrandList[i].Id + "' href='javascript:Delete(&apos;" + BrandList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></tr>");
                }
                
                $("#tblStaffMaster tbody").append(html);
                $('#tblStaffMaster').dataTable({
                    language:
                    {
                        searchPlaceholder: "Search"
                    }
                });

            }
           
        });
    }
    function SaveStaffData() {
        debugger
        var error = "";
        var Name = $("#name").val();
        if (Name == "") {
            error +="Enter  Name</br>"
        }
        var ContactNo = $("#contactno").val();
        if (ContactNo == "") {
            error += "Enter Contact No</br>"
        }
        var Email = $("#email").val();
        if (Email == "") {
            error += "Enter Email </br>"
        }
        var EmpId = '<%= Session["EmpId"] %>';
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
                url: "StaffMaster.aspx/StaffInsert",
                data: "{Name:'" + Name + "',ContactNo:'" + ContactNo + "',Email:'" + Email + "',CreatedBy:'" + EmpId + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == 1) {
                        Lobibox.notify('error', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data  already Inserted.'
                        });
                    }
                    else if (data.d == 0) {
                        Lobibox.notify('success', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data Inserted Succesfully.'
                        });
                        GetStaff();
                    }
                    else {
                        Lobibox.notify('error', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data not Inserted Succesfully.'
                        });
                    }
                    document.getElementById('name').value = "";
                    document.getElementById('contactno').value = "";
                    document.getElementById('email').value = "";
                }
            });
        }
        }
    function OpenExcel() {
        window.open("ExportToExcel.aspx?Type=STAFF", '_blank');
    }
      
   
    var PervID = "";
    function EditRecord(Id) {
        if (PervID != "") {
            try {
                var Name = document.getElementById('SPName').innerHTML;
                var ContactNo = document.getElementById('SPcontactno').innerHTML;
                var Email = document.getElementById('SPEmail').innerHTML;
            }
            catch (ex) {
                var Name = document.getElementById('Name' + PervID).childNodes[0].innerHTML;
                var ContactNo = document.getElementById('ContactNo' + PervID).childNodes[0].innerHTML;
                var Email = document.getElementById('Email' + PervID).childNodes[0].innerHTML;
            }
            document.getElementById('Name' + PervID).childNodes[0].innerHTML = Name;
            document.getElementById('ContactNo' + PervID).childNodes[0].innerHTML = ContactNo;
            document.getElementById('Email' + PervID).childNodes[0].innerHTML = Email;
            document.getElementById('button' + PervID).innerHTML = "<a href='javascript:EditRecord(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + PervID + "' href='javascript:Delete(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
        }
        var html = "";
        var Name = document.getElementById('Name' + Id).childNodes[0].innerHTML;
        var ContactNo = document.getElementById('ContactNo' + Id).childNodes[0].innerHTML;
        var Email = document.getElementById('Email' + Id).childNodes[0].innerHTML;
        document.getElementById('Name' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InName" + Id + "'   value='" + Name + "' /><span class='none' id='SPName'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
        document.getElementById('ContactNo' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InContactNo" + Id + "'   value='" + ContactNo + "' /><span class='none' id='SPContactNo'>" + ContactNo + "</span>";
        document.getElementById('Email' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InEmail" + Id + "'   value='" + Email + "'   /><span class='none' id='SPEmail'>" + Email + "</span>";
        document.getElementById('button' + Id).innerHTML = "<a href='javascript:UpdateRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Update' ><img src='../images/right.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:CancelRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Cancel'><img src='../images/cancel.png' class='CancelClick'/>&nbsp;</a>";
        PervID = Id;
    }
    function CancelRecord(Id) {
        var Name = document.getElementById('SPName').innerHTML;
        var ContactNo = document.getElementById('SPContactNo').innerHTML;
        var Email = document.getElementById('SPEmail').innerHTML;
        document.getElementById('Name' + Id).childNodes[0].innerHTML = Name;
        document.getElementById('ContactNo' + Id).childNodes[0].innerHTML = ContactNo;
        document.getElementById('Email' + Id).childNodes[0].innerHTML = Email;
        document.getElementById('button' + Id).innerHTML = "<a href='javascript:EditRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:Delete(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
        PervID = "";
    }
    function UpdateRecord(Id) {
        var error = "";
        var Name = $("#InName" + Id).val();
        var ContactNo = $("#InContactNo" + Id).val();
        var Email = $("#InEmail" + Id).val();
        if (Name == "") {
            error += "Please Enter Name.</br>";
        }
        if (ContactNo == "") {
            error += "Please Enter ContactNo.</br>";
        }
        if (Email == "") {
            error += "Please Enter Email.</br>";
        }
        var EmpId = '<%= Session["EmpId"] %>';
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
                url: "StaffMaster.aspx/UpdateRecord",
                data: "{Id: '" + Id + "',Name: '" + Name + "',ContactNo: '" + ContactNo + "',Email:'" + Email + "',ModifiedBy:'" + EmpId + "'}",
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
                        GetStaff();
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
                url: "StaffMaster.aspx/DeleteRecord",
                data: "{Id: '" + Id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == Id) {
                        //document.getElementById('Flag' + CompId).innerHTML = "<a data-toggle='tooltip' title='" + Flag + "'>" + Flag + "</a>";
                        //document.getElementById('button' + CompId).innerHTML = "<a href='javascript:EditRecord(&apos;" + CompId + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;<a id='deleteanchor" + CompId + "' >&nbsp;</a>";
                        Lobibox.notify('success', {
                            delay: 3000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data deleted Succesfully.'
                        });
                        GetStaff();
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
            url: "StaffMaster.aspx/ImportInsert",
            data: "{data:'" + JSON.stringify(jsondata) + "',CreatedBy:'" + EmpId + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d > 0) {
                    GetStaff();
                    Lobibox.notify('success', {
                        delay: 2000,
                        size: 'mini',
                        icon: false,
                        msg: 'Data added successfully.'
                    });
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
      <div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title"><b>Person Master</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Person Master</li>
                </ol>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
			
			<!--BEGIN CONTENT-->
            <div class="page-content">
				<div id="form-layouts">
                    <!-- Search Form -->
					<div class="row bg-aliceblue pdb15" id="search">
						<form id="userregi" name="userregi" method="post">
							
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Name</label>
								<input type="text" id="name" name="name"  placeholder="Name" class=" form-control"  required/>
							</div>
                              <%--<div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7 ">
								<label>Contact Person</label>
								<input type="text" id="person" name="person"  placeholder="CONTACT NAME" class=" form-control"  />
							</div>

                              <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Contact No</label>
								<input type="text" id="contactno" name="contactno"  placeholder="CONTACTNO" class=" form-control"  />
							</div>--%>

                              <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Contact</label>
								<input type="text" id="contactno" name="contactno"  placeholder="Contact" class=" form-control"  required/>
							</div>
                              <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Email</label>
								<input type="text" id="email" name="email"  placeholder="Email" class=" form-control"  />
							</div>
                            	
							<!-- Button -->
							<div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
								<button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveStaffData();">ADD</button>
								<a href="#"><img src="<%=ConfigurationManager.AppSettings["url"] %>images/excel.png" class="mrgr7" data-toggle="tooltip" title="Export To Excel" onclick="OpenExcel();" /></a> 
                                </div>
                                <div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">  
                               <input type="file" id="excelfile" />  
                                    </div>
                             <div class="col-lg-2 col-md-3 col-sm-2 col-xs-6  mrgt30">  
   <%--<input type="button" id="viewfile" value="Import" onclick="ExportToTable()" />  --%>
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
</asp:Content>
