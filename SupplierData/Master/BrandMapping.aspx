<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BrandMapping.aspx.cs" Inherits="SupplierData.Master.BrandMapping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fnneutral() {
        }
        window.onload = function () {
         
            BindBrandName();
            BindSubCategoryName();
            GetBrandMapping();
       
        };
        function BindBrandName() {
            
            debugger
            $.ajax({
                type: "POST",
                url: "BrandMapping.aspx/BindBrandName",
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
                    //$('#BName').multiselect('rebuild');
                }
            });
        }
        function BindSubCategoryName(Id, Name) {
            $.ajax({
                type: "POST",
                url: "BrandMapping.aspx/BindSubCategoryName",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
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
        function GetBrandMapping() {
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
                $("#divid").empty();
                $("#divid").append('<table id="tblItemMaster" class="datatable table table-bordered">' +
                    '<thead></thead>' +
                    '<tbody></tbody>' +
                    '</table>');
                var html = "";
                $("#tblItemMaster thead").append('<tr>' +
                    '<th><a class="white" data-toggle="tooltip" title="Brand">Brand</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Name">Sub Category Name</a></th>' +
                    
                    '<th class="hidden"><a class="white" data-toggle="tooltip" title="Status">Status</a></th>' +
                    '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
                    '</tr>');

                for (var i = 0; i < ItemList.length; i++) {
                    // if (ItemList[i].Status == "Active") {
                    html += ("<tr><td id='Brand" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Brand + "'>" + ItemList[i].Brand + "</a></td><td id='Name" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Name + "'>" + ItemList[i].Name + "</a></td>" +
                           
                            "<td class='hidden' id='Status" + ItemList[i].Id + "'><a  data-toggle='tooltip' title='" + ItemList[i].Status + "'>" + ItemList[i].Status + "</a></td><td   id='button" + ItemList[i].Id + "'><a href='javascript:EditRecord(&apos;" + ItemList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + ItemList[i].Id + "' href='javascript:Delete(&apos;" + ItemList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></tr>");
                    //}
                    //else {
                    //    html += ("<tr><td id='Brand" + ItemList[i].Id + "'><a  data-toggle='tooltip' title='" + ItemList[i].Brand + "'>" + ItemList[i].Brand + "</a></td><td id='Name" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Name + "'>" + ItemList[i].Name + "</a></td>" +
                           
                    //        "<td  class='hidden' id='Status" + ItemList[i].Id + "'><a  data-toggle='tooltip' title='" + ItemList[i].Status + "'>" + ItemList[i].Status + "</a></td><td  class='hidden' id='button" + ItemList[i].Id + "'><a href='javascript:EditRecord(&apos;" + ItemList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;<a id='deleteanchor" + ItemList[i].Id + "' />&nbsp;</a></td></tr>");
                    //}
                }
                
                $("#tblItemMaster tbody").append(html);
                $('#tblItemMaster').dataTable({
                    language:
                    {
                        searchPlaceholder: "Search"
                    }
                });

            }
           
        });
    }


    function SaveItemData() {
        debugger
        var ItemName = $("#CName").val();
        //var CId = $("#CName").val();
        var Brand = $("#BName").val();
       

        if (ItemName != "" &&  Brand != "Select" && Brand != "" ) {
            $.ajax({
                type: "POST",
                url: "BrandMapping.aspx/ItemInsert",
                data: "{ItemName:'" + ItemName + "',Brand:'" + Brand + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == 1) {
                        Lobibox.notify('error', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data is already Inserted.'
                        });
                    }
                    else if (data.d == 0) {
                        Lobibox.notify('success', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data Inserted Succesfully.'
                        });
                        GetBrandMapping();
                    }
                    else {
                        Lobibox.notify('error', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data is not Inserted Succesfully.'
                        });
                    }
                   
                   
                    $("#CName").val('');
                    $("#BName").val('');

                }
            });

        }
    }
        function OpenExcel() {
            window.open("ExportToExcel.aspx?Type=BRANDMAPPING", '_blank');
        }
        function EditBindBrandName(Id) {
            debugger
            $.ajax({
                type: "POST",
                url: "BrandMapping.aspx/BindBrandName",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    $('#InBrand' + Id).empty();
                    html += '<option id="optcname" value="">Select</option>';
                    $.each(obj, function (key, value) {
                        if (Id == value.Id) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + ' selected>' + value.Name + '</option>';
                        }
                        else {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        }
                    });
                    $('#InBrand' + Id).append(html);
                    //$('#BName').multiselect('rebuild');
                }
            });
        }
        function EditBindSubCategoryName(Id) {
            $.ajax({
                type: "POST",
                url: "BrandMapping.aspx/BindSubCategoryName",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    $('#InName' + Id).empty();
                    html += '<option id="optcname" value="">Select</option>';
                    $.each(obj, function (key, value) {
                        html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                    });
                    $('#InName' + Id).append(html);
                }
            });
        }
        var PervID = "";
        function EditRecord(Id) {
            if (PervID != "") {
                try {
                    var Name = document.getElementById('SPName').innerHTML;
                    var Brand = document.getElementById('SPBrand').innerHTML;
                }
                catch (ex) {
                    var Name = document.getElementById('Name' + PervID).childNodes[0].innerHTML;
                    var Brand = document.getElementById('Brand' + PervID).childNodes[0].innerHTML;
                }
                document.getElementById('Name' + PervID).childNodes[0].innerHTML = Name;
                document.getElementById('Brand' + PervID).childNodes[0].innerHTML = Brand;
                document.getElementById('button' + PervID).innerHTML = "<a href='javascript:EditRecord(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + PervID + "' href='javascript:Delete(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
            }
            var html = "";
            var Name = document.getElementById('Name' + Id).childNodes[0].innerHTML;
            var Brand = document.getElementById('Brand' + Id).childNodes[0].innerHTML;
            
            document.getElementById('Name' + Id).childNodes[0].innerHTML = "<select id='InName" + Id + "'  class='form-control' ><option>" + Name + "</option></select><span class='none' id='SPName'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('Brand' + Id).childNodes[0].innerHTML = "<select id='InBrand" + Id + "' class='form-control'><option>" + Brand + "</option></select> <span class='none' id='SPBrand'>" + Brand + "</span>";
            document.getElementById('button' + Id).innerHTML = "<a href='javascript:UpdateRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Update' ><img src='../images/right.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:CancelRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Cancel'><img src='../images/cancel.png' class='CancelClick'/>&nbsp;</a>";
            EditBindBrandName(Id);
            EditBindSubCategoryName(Id);
            var ddlname = document.getElementById('InBrand' + Id);
            for (var j = 0; j < ddlname.length; j++) {
                var strUser = ddlname.options[j].innerHTML;
                if (strUser.trim() == Brand.trim()) {
                    ddlname.options[j].selected = true;
                    break;
                }
            }
            var ddlbrand = document.getElementById('InName' + Id);
            for (var j = 0; j < ddlbrand.length; j++) {
                var strUser = ddlbrand.options[j].innerHTML;
                if (strUser.trim() == Name.trim()) {
                    ddlbrand.options[j].selected = true;
                    break;
                }
            }
            PervID = Id;
        }
        function CancelRecord(Id) {
            GetBrandMapping();
            PervID = "";
        }

        function UpdateRecord(Id) {
            var error = "";
            var Name = $("#InName" + Id).val();
            var Brand = $("#InBrand" + Id).val();
            if (Name == "") {
                error += "Please Enter Name.</br>";
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
                    url: "BrandMapping.aspx/UpdateRecord",
                    data: "{Id: '" + Id + "',Name: '" + Name + "',Brand: '" + Brand + "'}",
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
                            GetBrandMapping();
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
                url: "BrandMapping.aspx/DeleteRecord",
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
                        GetBrandMapping();
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
      <div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title"><b>Brand SubCategory Mapping</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Brand SubCategory Mapping</li>
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
								<label>Brand</label>
								  <select class="form-control" name="BName" id="BName">
									</select>
							</div>
                              <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Sub Category Name</label>
								  <select class="form-control" name="CName" id="CName">
									</select>
							</div>
                            
                           <%-- <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Sub Category Name</label>
								<input type="text" id="item" name="item"  placeholder="ITEM NAME" class=" form-control"  />
							</div>--%>
                          
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
							
                            	
							<!-- Button -->
							<div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
								<button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveItemData();">ADD</button>
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
                    
                </div>
				<!-- /Form Layouts -->
			</div>
			<!--END PAGE-CONTENT-->
		</div>
</asp:Content>
