<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SupplierType.aspx.cs" Inherits="SupplierData.Master.SupplierType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script  type="text/javascript">
    window.onload = function () {
        GetSupplierType();
        };
        function fnneutral() {
        }
        function GetSupplierType() {
        var html = "";
        $.ajax({
            type: "POST",
            url: "SupplierType.aspx/GetSupplierTypeData",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var SList = jQuery.parseJSON(data.d);
                $("#divid").empty();
                $("#divid").append('<table id="tblSupplierTypeMaster" class="datatable table table-bordered">' +
                    '<thead></thead>' +
                    '<tbody></tbody>' +
                    '</table>');
                var html = "";
                $("#tblSupplierTypeMaster thead").append('<tr>' +
                    '<th><a class="white" data-toggle="tooltip" title="SUPPLIER TYPE">SUPPLIER TYPE</a></th>' +
                    '<th data-orderable="false" class="hidden"><a class="white" data-toggle="tooltip" title="Status">Status</a></th>' +
                    '<th data-orderable="false" ><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
                    '</tr>');

                for (var i = 0; i < SList.length; i++) {
                    //if (data.d[i].Status == "Active") {
                    html += ("<tr><td id='Name" + SList[i].Id + "'><a  data-toggle='tooltip' title='" + SList[i].Name + "'>" + SList[i].Name + "</a></td><td class='hidden' id='Status" + SList[i].Id + "'><a  data-toggle='tooltip' title='" + SList[i].Status + "'>" + SList[i].Status + "</a></td><td   id='button" + SList[i].Id + "'><a href='javascript:EditRecord(&apos;" + SList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + SList[i].Id + "' href='javascript:Delete(&apos;" + SList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></tr>");
                    //}
                    //else {
                    //    html += ("<tr><td id='Name" + SList[i].Id + "'><a  data-toggle='tooltip' title='" + SList[i].Name + "'>" + SList[i].Name + "</a></td><td class='hidden' id='Status" + SList[i].Id + "'><a  data-toggle='tooltip' title='" + SList[i].Status + "'>" + SList[i].Status + "</a></td><td  class='hidden' id='button" + SList[i].Id + "'><a href='javascript:EditRecord(&apos;" + SList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;<a id='deleteanchor" + SList[i].Id + "' />&nbsp;</a></td></tr>");
                    //}
                }
                
                $("#tblSupplierTypeMaster tbody").append(html);
                $('#tblSupplierTypeMaster').dataTable({
                    language:
                    {
                        searchPlaceholder: "Search"
                    }
                });

            }
           
        });
    }


    function SaveSupplierTypeData() {
        debugger
        var Name = $("#suppliertype").val();
        Name = Name.replace("&amp;", "&");
        if (Name != "") {
            $.ajax({
                type: "POST",
                url: "SupplierType.aspx/SupplierTypeInsert",
                data: "{Name:'" + Name + "'}",
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
                        GetSupplierType();
                    }
                    else {
                        Lobibox.notify('error', {
                            delay: 1000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data is not Inserted Succesfully.'
                        });
                    }
                    document.getElementById('supplier').value = "";
                    $("#SType").val('');

                }
            });

        }
        else {
            Lobibox.notify('error', {
                delay: 3000,
                size: 'mini',
                icon: false,
                msg: "Enter Supplier Type"
            });
        }
        }
        function OpenExcel() {
            window.open("ExportToExcel.aspx?Type=SUPPLIERTYPE", '_blank');
        }
        var PervID = "";
        function EditRecord(Id) {
            if (PervID != "") {
                try {
                    var Name = document.getElementById('SPName').innerHTML;
                }
                catch (ex) {
                    var Name = document.getElementById('Name' + PervID).childNodes[0].innerHTML;
                }
                document.getElementById('Name' + PervID).childNodes[0].innerHTML = Name;
                document.getElementById('button' + PervID).innerHTML = "<a href='javascript:EditRecord(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + PervID + "' href='javascript:Delete(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
            }
            var html = "";
            var Name = document.getElementById('Name' + Id).childNodes[0].innerHTML;
            document.getElementById('Name' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InName" + Id + "'   value='" + Name + "' /><span class='none' id='SPName'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('button' + Id).innerHTML = "<a href='javascript:UpdateRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Update' ><img src='../images/right.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:CancelRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Cancel'><img src='../images/cancel.png' class='CancelClick'/>&nbsp;</a>";
            PervID = Id;
        }
        function CancelRecord(Id) {
            var Name = document.getElementById('SPName').innerHTML;
            document.getElementById('Name' + Id).childNodes[0].innerHTML = Name;
            document.getElementById('button' + Id).innerHTML = "<a href='javascript:EditRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:Delete(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
            PervID = "";
        }

        function UpdateRecord(Id) {
            var error = "";
            var Name = $("#InName" + Id).val();
            if (Name == "") {
                error += "Enter Supplier Type.</br>";
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
                    url: "SupplierType.aspx/UpdateRecord",
                    data: "{Id: '" + Id + "',Name: '" + Name + "'}",
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
                            GetSupplierType();
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
                url: "SupplierType.aspx/DeleteRecord",
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
                        GetSupplierType();
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
								<label>Supplier Type</label>
								<input type="text" id="suppliertype" name="suppliertype"  placeholder="SUPPLIER TYPE" class=" form-control"  />
							</div>
                              
                            	
							<!-- Button -->
							<div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
								<button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveSupplierTypeData();">ADD</button>
								 <a href="#"><img src="<%=ConfigurationManager.AppSettings["url"] %>images/excel.png" class="mrgr7" data-toggle="tooltip" title="Export To Excel" onclick="OpenExcel();" /></a> 
								
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
