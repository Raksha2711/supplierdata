<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SupplierMapping.aspx.cs" Inherits="SupplierData.Master.SupplierMapping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fnneutral() {
        }

    window.onload = function () {
        BindSupplierName(null);
        BindSupplierType(null);
        BindBrandName(null);
        GetSupplier();
        };
        function BindItemName(BId, Id) {
            if (Id != "" && Id != null) {
                var sel = document.getElementById('InBrand' + Id);
                BId = sel.options[sel.selectedIndex].value;
            }
            $.ajax({
                type: "POST",
                url: "SupplierMapping.aspx/BindItemName",
                data: "{BId :'" + BId + "'}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    if (Id == null) {
                        $('#IName').empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#IName').append(html);
                    }
                    else
                    {
                        $('#InSubCategory' + Id).empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#InSubCategory' + Id).append(html);
                    }
                }
            });
        }
        function BindSupplierName(Id) {
            debugger
            $.ajax({
                type: "POST",
                url: "SupplierMapping.aspx/BindSupplierName",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    if (Id == null) {
                        $('#SName').empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#SName').append(html);
                    }
                    else {
                       
                        $('#InName' + Id).empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#InName' + Id).append(html);
                    }
                }
            });
        }
        function BindBrandName(Id) {
            $.ajax({
                type: "POST",
                url: "SupplierMapping.aspx/BindBrandName",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    if (Id == null) {
                        $('#BName').empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#BName').append(html);
                    }
                    else {
                        debugger
                        $('#InBrand' + Id).empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#InBrand' + Id).append(html);
                    }
                }
            });
        }
        function BindSupplierType(Id) {
            try {
                $.ajax({
                    type: "POST",
                    url: "SupplierMapping.aspx/BindSupplierType",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    global: false,
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        var obj = jQuery.parseJSON(data.d);
                        var html = "";
                        if (Id == null) {
                            $('#SType').empty();
                            html += '<option id="optcname" value="">Select</option>';
                            $.each(obj, function (key, value) {
                                html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                            });
                            $('#SType').append(html);
                        }
                        else {
                            $('#InType' + Id).empty();
                            html += '<option id="optcname" value="">Select</option>';
                            $.each(obj, function (key, value) {
                                html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                            });
                            $('#InType' + Id).append(html);
                        }
                    }
                });
            }
            catch (ex) { alert(ex); }
        }
        function GetSupplier() {
        
        

        $.ajax({
            type: "POST",
            url: "SupplierMapping.aspx/GetSupplierData",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var BrandList = jQuery.parseJSON(data.d);
               // alert(BrandList);
                $("#divid").empty();
                $("#divid").append('<table id="tblSupplierMaster" class="datatable table table-bordered">' +
                    '<thead></thead>' +
                    '<tbody></tbody>' +
                    '</table>');
                var html = "";
                $("#tblSupplierMaster thead").append('<tr>' +
                    '<th><a class="white" data-toggle="tooltip" title="Name">Supplier Name</a></th>' +
                    
                    '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Brand">Brand</a></th>' +
                    '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Sub Category">Sub Category</a></th>' +
                    '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Type">Supplier Type</a></th>' +
                    '<th data-orderable="false" class="hidden"><a class="white" data-toggle="tooltip" title="Status">Status</a></th>' +
                    '<th data-orderable="false" ><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
                    '</tr>');

                for (var i = 0; i< BrandList.length; i++) {
                   // if (data.d[i].Status == "Active") {
                        html += ("<tr><td id='Name" + BrandList[i].Id + "'><a  data-toggle='tooltip' title='" + BrandList[i].Name + "'>" + BrandList[i].Name + "</a></td>" +
                           
                            "<td id='Brand" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].Brand + "'>" + BrandList[i].Brand + "</a></td>" +
                            "<td id='SubCategory" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].SubCategory + "'>" + BrandList[i].SubCategory + "</a><span class='hidden' id='SID" + BrandList[i].Id + "' > " + BrandList[i].SubCategoryId +"</span></td>" +
                            "<td id='Type" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].Type + "'>" + BrandList[i].Type + "</a></td>" +
                            "<td id='Status" + BrandList[i].Id + "' class='hidden'><a  data-toggle='tooltip' title='" + BrandList[i].Status + "'>" + BrandList[i].Status + "</a></td><td   id='button" + BrandList[i].Id + "'><a href='javascript:EditRecord(&apos;" + BrandList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + BrandList[i].Id + "' href='javascript:Delete(&apos;" + BrandList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></td></tr>");
                    //}
                    //else {
                    //    html += ("<tr><td id='Name" + BrandList[i].Id + "'><a  data-toggle='tooltip' title='" + BrandList[i].Name + "'>" + BrandList[i].Name + "</a></td>" +
                    //        "<td id='Brand" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].Brand + "'>" + BrandList[i].Brand + "</a></td>" +
                    //        "<td id='SubCategory" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].SubCategory + "'>" + BrandList[i].SubCategory + "</a><span class='hidden' id='SID" + BrandList[i].Id + "' > "+BrandList[i].SubCategoryId +"</span></td>" +
                    //        "<td id='Type" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].Type + "'>" + BrandList[i].Type + "</a></td>" +
                           
                    //        "<td id='Status" + BrandList[i].Id + "' class='hidden'><a  data-toggle='tooltip' title='" + BrandList[i].Status + "'>" + BrandList[i].Status + "</a></td><td   id='button" + BrandList[i].Id + "'><a href='javascript:EditRecord(&apos;" + BrandList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;<a id='deleteanchor" + BrandList[i].Id + "' />&nbsp;</a></td></tr>");
                    //}
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
        var Name = $("#SName").val();
        var SType = $("#SType").val();
        //var SType = $("#SType option:selected").html();
        var Brand = $("#BName").val();
        var SubCategory = $("#IName").val();
        var EmpId = '<%= Session["EmpId"] %>';
        SType = SType.replace("&amp;", "&");
        if (Name != "" && SType != ""  ) {
            $.ajax({
                type: "POST",
                url: "SupplierMapping.aspx/SupplierInsert",
                data: "{Name:'" + Name + "',Type:'" + SType + "',Brand:'" + Brand + "',SubCategory:'" + SubCategory + "',CreatedBy:'" + EmpId + "'}",
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
                        GetSupplier();
                    }
                    else {
                        Lobibox.notify('error', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data is not Inserted Succesfully.'
                        });
                    }
                    $("#SName").val('');
                    $("#SType").val('');
                    $("#BName").val('');
                    $("#IName").val('');

                }
            });

        }
    }
        function OpenExcel() {
            window.open("ExportToExcel.aspx?Type=SUPPLIERMAPPING", '_blank');
        }
        var PervID = "";
        function EditRecord(Id) {
            if (PervID != "") {
                try {
                    var Name = document.getElementById('SPName').innerHTML;
                    var Brand = document.getElementById('SPBrand').innerHTML;
                    var SubCategory = document.getElementById('SPSubCategory').innerHTML;
                    var Type = document.getElementById('SPType').innerHTML;
                }
                catch (ex) {
                    var Name = document.getElementById('Name' + PervID).childNodes[0].innerHTML;
                    var Brand = document.getElementById('Brand' + PervID).childNodes[0].innerHTML;
                    var SubCategory = document.getElementById('SubCategory' + PervID).childNodes[0].innerHTML;
                    var Type = document.getElementById('Type' + PervID).childNodes[0].innerHTML;
                }
                document.getElementById('Name' + PervID).childNodes[0].innerHTML = Name;
                document.getElementById('Brand' + PervID).childNodes[0].innerHTML = Brand;
                document.getElementById('SubCategory' + PervID).childNodes[0].innerHTML = SubCategory;
                document.getElementById('Type' + PervID).childNodes[0].innerHTML = Type;
                document.getElementById('button' + PervID).innerHTML = "<a href='javascript:EditRecord(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + PervID + "' href='javascript:Delete(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
            }
            var html = "";
            var Name = document.getElementById('Name' + Id).childNodes[0].innerHTML;
            var Brand = document.getElementById('Brand' + Id).childNodes[0].innerHTML;
            var SubCategory = document.getElementById('SubCategory' + Id).childNodes[0].innerHTML;
            var Type = document.getElementById('Type' + Id).childNodes[0].innerHTML;
            var SubCategoryId = $("#SID" + Id)[0].innerText;
            document.getElementById('Name' + Id).childNodes[0].innerHTML = "<select id='InName" + Id + "'  class='form-control' ><option>" + Name + "</option></select><span class='none' id='SPName'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('Brand' + Id).childNodes[0].innerHTML = "<select id='InBrand" + Id + "' class='form-control' onclick='BindItemName(" + this.value + "," + Id + ")'><option>" + Brand + "</option></select> <span class='none' id='SPBrand'>" + Brand + "</span>";
            document.getElementById('SubCategory' + Id).childNodes[0].innerHTML = "<select id='InSubCategory" + Id + "'  class='form-control' ><option value= " + SubCategoryId + ">" + SubCategory + "</option></select><span class='none' id='SPSubCategory'>" + SubCategory + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('Type' + Id).childNodes[0].innerHTML = "<select id='InType" + Id + "' class='form-control'><option>" + Type + "</option></select> <span class='none' id='SPType'>" + Type + "</span>";
            document.getElementById('button' + Id).innerHTML = "<a href='javascript:UpdateRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Update' ><img src='../images/right.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:CancelRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Cancel'><img src='../images/cancel.png' class='CancelClick'/>&nbsp;</a>";
            BindSupplierName(Id);
            BindSupplierType(Id);
            BindBrandName(Id);
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
            var ddlsubcategory = document.getElementById('InSubCategory' + Id);
            for (var j = 0; j < ddlsubcategory.length; j++) {
                var strUser = ddlsubcategory.options[j].innerHTML;
                if (strUser.trim() == SubCategory.trim()) {
                    ddlsubcategory.options[j].selected = true;
                    break;
                }
            }
            var ddltype = document.getElementById('InType' + Id);
            for (var j = 0; j < ddltype.length; j++) {
                for (var j = 0; j < ddltype.length; j++) {
                    var strUser = ddltype.options[j].innerHTML;
                    if (strUser.trim() == Type.trim()) {
                        ddltype.options[j].selected = true;
                        break;
                    }
                }
                PervID = Id;
            }
        }
            function CancelRecord(Id) {
            GetSupplier();
            //var Name = document.getElementById('SPName').innerHTML;
            //var Website = document.getElementById('SPWebsite').innerHTML;
            //document.getElementById('Name' + Id).childNodes[0].innerHTML = Name;
            //document.getElementById('Website' + Id).childNodes[0].innerHTML = Website;
            //document.getElementById('button' + Id).innerHTML = "<a href='javascript:EditRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:Delete(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
            //PervID = "";
        }

        function UpdateRecord(Id) {
            var error = "";
            var Name = $("#InName" + Id).val();
            var Brand = $("#InBrand" + Id).val();
            var SubCategory = $("#InSubCategory" + Id).val();
            var Type = $("#InType" + Id).val();
            var EmpId = '<%= Session["EmpId"] %>';
            if (Name == "") {
                error += "Please Enter Name.</br>";
            }
            if (Brand == "") {
                error += "Please Enter Brand.</br>";
            }   
            if (SubCategory == "") {
                error += "Please Enter SubCategory.</br>";

            }
            if (Type == "") {
                error += "Please Enter Type.</br>";
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
                    url: "SupplierMapping.aspx/UpdateRecord",
                    data: "{Id: '" + Id + "',Name: '" + Name + "',Brand: '" + Brand + "',SubCategory :'" + SubCategory + "',Type:'" + Type + "',ModifiedBy:'" + EmpId + "'}",
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
            debugger
            var Id = CurrentId;
            $.ajax({
                type: "POST",
                url: "SupplierMapping.aspx/DeleteRecord",
                data: "{Id: '" + Id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == 0) {
                        //document.getElementById('Flag' + CompId).innerHTML = "<a data-toggle='tooltip' title='" + Flag + "'>" + Flag + "</a>";
                        //document.getElementById('button' + CompId).innerHTML = "<a href='javascript:EditRecord(&apos;" + CompId + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;<a id='deleteanchor" + CompId + "' >&nbsp;</a>";
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
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!--BEGIN PAGE WRAPPER-->
        <div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title"><b>Supplier Mapping</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Supplier Mapping</li>
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
                                <label>Supplier Name : </label>
                                <select class="form-control" name="SName" id="SName">
										
									</select>
                                  </div>
                            <div class="col-lg-2 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Brand : </label>
                                <select class="form-control" name="BName" id="BName">
										
									</select>
                                  </div>
                            <div class="col-lg-2 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Sub Category : </label>
                                <select class="form-control" name="IName" id="IName">
										
									</select>
                                  </div>
                              <div class="col-lg-2 col-md-6 col-sm-3 col-xs-12 mrgt7">
                                <label>Supplier Type : </label>
                                <select class="form-control" name="SType" id="SType">
										
									</select>
                                  </div>
                            
							

                           
                            	
							<!-- Button -->
							<div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
								<button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveSupplierData();">ADD</button>
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
        <!--END PAGE WRAPPER-->
    <script type="text/javascript">



        $(document).ready(function () {
            $("#BName").change(function () {
                var BId = $(this).val();
                BindItemName(BId,null);
            });
            
        });
        </script>
</asp:Content>
