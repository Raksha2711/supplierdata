<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SubCategoryMapping.aspx.cs" Inherits="SupplierData.Master.SubCategoryMapping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fnneutral() {
        }
    window.onload = function () {
        GetItem();
        BindBrandName(null);
        BindArea(null);
        BindDesignation(null);
        };
        function BindDesignation(Id) {
            $.ajax({
                type: "POST",
                url: "SubCategoryMapping.aspx/BindDesignation",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    if (Id == "" || Id == null) {
                        $('#DName').empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#DName').append(html);
                    }
                    else {
                        $('#InDesignation' + Id).empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#InDesignation' + Id).append(html);
                    }
                }
            });
        }
        function BindItemName(CId, Id) {
            debugger
            if (Id != "" && Id != null) {
                 CId = $("#InBrand" + Id).val();
            }
            $.ajax({
                type: "POST",
                url: "SubCategoryMapping.aspx/BindItemName",
                data: "{CId :'" + CId + "'}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    if (Id == ""  || Id == null) {
                        $('#IName').empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#IName').append(html);
                    }
                    else {
                        $('#InName' + Id).empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname1' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#InName' + Id).append(html);
                    }
                }
            });
        }
        function BindArea(Id) {
            try {
                $.ajax({
                    type: "POST",
                    url: "SubCategoryMapping.aspx/BindAreaData",
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
                            $('#InAreaName' + Id).empty();
                            html += '<option id="optcname" value="">Select</option>';
                            $.each(obj, function (key, value) {
                                html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + ' (' + value.StateName + ')' + ' </option>';
                            });
                            $('#InAreaName' + Id).append(html);
                        }
                    }
                });
            }
            catch (ex) { alert(ex); }
        }
        function BindBrandName(Id) {
            $.ajax({
                type: "POST",
                url: "SubCategoryMapping.aspx/BindBrandName",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    debugger
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
                            html += '<option id=optcname1' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                        });
                        $('#InBrand' + Id).append(html);
                    }
                    //$('#BName').multiselect('rebuild');
                }
            });
        }
       
        function GetItem() {
        var html = "";
       
        $.ajax({
            type: "POST",
            url: "SubCategoryMapping.aspx/GetItemData",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var ItemList = jQuery.parseJSON(data.d);
                $("#divid").empty();
                $("#divid").append('<table id="tblItemMaster" class="datatable table table-bordered">' +
                    '<thead></thead>' +
                    '<tbody></tbody>' +
                    '</table>');
                var html = "";
                $("#tblItemMaster thead").append('<tr>' +
                    '<th><a class="white" data-toggle="tooltip" title="Brand">Brand</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Name">Product Name</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Area">Area</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Executve Name">Executive Person</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Designation">Designation</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Contact No">Contact No</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Visible">Visible</a></th>' +
                    '<th class="hidden"><a class="white" data-toggle="tooltip" title="Status">Status</a></th>' +
                    '<th data-orderable="false" ><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
                    '</tr>');

                for (var i = 0; i < ItemList.length; i++) {
                    //if (ItemList[i].Status == "Active") {
                    html += ("<tr>" +
                        "<td id='Brand" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Brand + "'>" + ItemList[i].Brand + "</a></td><td id='Name" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Name + "'>" + ItemList[i].Name + "</a><span class='hidden' id='SID" + ItemList[i].Id + "' > " + ItemList[i].SubCategoryId + "</span></td>" +
                            "<td id='AreaName" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].AreaName + "'>" + ItemList[i].AreaName + "</a></td><td id='ContactPerson" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].ContactPerson + "'>" + ItemList[i].ContactPerson + "</a></td>" +
                            "<td id='Designation" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Designation + "'>" + ItemList[i].Designation + "</a></td>" +
                        "<td id='ContactNo" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].ContactNo + "'>" + ItemList[i].ContactNo + "</a></td>" +
                        "<td id='Visible" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Visible + "'>" + ItemList[i].Visible + "</a></td>" +
                        "<td class='hidden'  id='Status" + ItemList[i].Id + "'><a  data-toggle='tooltip' title='" + ItemList[i].Status + "'>" + ItemList[i].Status + "</a></td><td   id='button" + ItemList[i].Id + "'><a href='javascript:EditRecord(&apos;" + ItemList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + ItemList[i].Id + "' href='javascript:Delete(&apos;" + ItemList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></td></tr>");
                    //}
                    //else {
                    //    html += ("<tr>" +
                    //        //"<td id='Category" + ItemList[i].Id + "'><a  data-toggle='tooltip' title='" + ItemList[i].CategoryName + "'>" + ItemList[i].CategoryName + "</a></td>" +
                    //        "<td id='Brand" + ItemList[i].Id + "'><a  data-toggle='tooltip' title='" + ItemList[i].Brand + "'>" + ItemList[i].Brand + "</a></td><td id='Name" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Name + "'>" + ItemList[i].Name + "</a><span class='hidden' id='SID" + ItemList[i].Id + "' > " + ItemList[i].SubCategoryId + "</span></td>" +
                    //        "<td id='AreaName" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].AreaName + "'>" + ItemList[i].AreaName + "</a></td><td id='ContactPerson" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].ContactPerson + "'>" + ItemList[i].ContactPerson + "</a></td>" +
                    //        "<td id='Designation" + ItemList[i].Id + "'><a data-toggle='tooltip' title='" + ItemList[i].Designation + "'>" + ItemList[i].Designation + "</a></td>" +
                    //        "<td id='ContactNo" + ItemList[i].Id + "'> <a data-toggle='tooltip' title='" + ItemList[i].ContactNo + "'>" + ItemList[i].ContactNo + "</a></td > " +
                    //        "<td  class='hidden' id='Status" + ItemList[i].Id + "'><a  data-toggle='tooltip' title='" + ItemList[i].Status + "'>" + ItemList[i].Status + "</a></td><td   id='button" + ItemList[i].Id + "'><a href='javascript:EditRecord(&apos;" + ItemList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;<a id='deleteanchor" + ItemList[i].Id + "' />&nbsp;</a></td></tr>");
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
        var ItemName = $("#IName").val();
        var Designation = $("#DName").val();
        var Brand = $("#BName").val();
        var AreaName = $("#AreaName").val();
        var ContactPerson = $("#contactperson").val();
        var ContactNo = $("#contactno").val();
        var Visible = $("#visible").val();
        var EmpId = '<%= Session["EmpId"] %>';
        if (ItemName != "" && Brand != "Select" && Brand != "" && AreaName != "" && AreaName != "Select" && ContactPerson != "" && ContactNo != "" && Designation != "" && Visible != "" && Visible != "Select") {
            $.ajax({
                type: "POST",
                url: "SubCategoryMapping.aspx/ItemInsert",
                data: "{ItemName:'" + ItemName + "',Brand:'" + Brand + "',AreaName:'" + AreaName + "',ContactPerson:'" + ContactPerson + "',ContactNo:'" + ContactNo + "',Designation:'" + Designation + "',Visible:'" + Visible + "',CreatedBy:'" + EmpId + "'}",
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
                        GetItem();
                    }
                    else {
                        Lobibox.notify('error', {
                            delay: 1000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data is not Inserted Succesfully.'
                        });
                    }
                   // document.getElementById('item').value = "";
                   
                    document.getElementById('contactperson').value = "";
                    document.getElementById('contactno').value = "";
                    $("#AreaName").val('');
                    $("#DName").val('');
                    $("#BName").val('');
                    $("#IName").val('');
                    $("#visible").val('');
                }
            });

        }
        }
        function OpenExcel() {
            window.open("ExportToExcel.aspx?Type=SUBCATEGORYMAPPING", '_blank');
        }
        var PervID = "";
        function EditRecord(Id) {
            if (PervID != "") {
                try {
                    var Name = document.getElementById('SPBrand').innerHTML;
                    var SubCategoryName = document.getElementById('SPName').innerHTML;
                    var AreaName = document.getElementById('SPAreaName').innerHTML;
                    var ContactPerson = document.getElementById('SPContactPerson').innerHTML;
                    var Designation = document.getElementById('SPDesignation').innerHTML;
                    var ContactNo = document.getElementById('SPContactNo').innerHTML;
                    var Visible = document.getElementById('SPVisible').innerHTML;
                  //  var Status = document.getElementById('SPStatus').innerHTML;
                }
                catch (ex) {
                    var Brand = document.getElementById('Brand' + PervID).childNodes[0].innerHTML;
                    var Name = document.getElementById('Name' + PervID).childNodes[0].innerHTML;
                    var AreaName = document.getElementById('AreaName' + PervID).childNodes[0].innerHTML;
                    var ContactPerson = document.getElementById('ContactPerson' + PervID).childNodes[0].innerHTML;
                    var Designation = document.getElementById('Designation' + PervID).childNodes[0].innerHTML;
                    var ContactNo = document.getElementById('ContactNo' + PervID).childNodes[0].innerHTML;
                    var Visible = document.getElementById('Visible' + PervID).childNodes[0].innerHTML;
                }
                document.getElementById('Brand' + PervID).childNodes[0].innerHTML = Brand;
                document.getElementById('Name' + PervID).childNodes[0].innerHTML = Name;
                document.getElementById('AreaName' + PervID).childNodes[0].innerHTML = AreaName;
                document.getElementById('ContactPerson' + PervID).childNodes[0].innerHTML = ContactPerson;
                document.getElementById('Designation' + PervID).childNodes[0].innerHTML = Designation;
                document.getElementById('ContactNo' + PervID).childNodes[0].innerHTML = ContactNo;
                document.getElementById('Visible' + PervID).childNodes[0].innerHTML = Visible;
                document.getElementById('button' + PervID).innerHTML = "<a href='javascript:EditRecord(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + PervID + "' href='javascript:Delete(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
            }
            var html = "";
            var Brand = document.getElementById('Brand' + Id).childNodes[0].innerHTML;
            var Name = document.getElementById('Name' + Id).childNodes[0].innerHTML;
            var AreaName = document.getElementById('AreaName' + Id).childNodes[0].innerHTML;
            var ContactPerson = document.getElementById('ContactPerson' + Id).childNodes[0].innerHTML;
            var Designation = document.getElementById('Designation' + Id).childNodes[0].innerHTML;
            var ContactNo = document.getElementById('ContactNo' + Id).childNodes[0].innerHTML;
            var Visible = document.getElementById('Visible' + Id).childNodes[0].innerHTML;

            var SubCategoryId = $("#SID" + Id)[0].innerText;
            document.getElementById('Brand' + Id).childNodes[0].innerHTML = "<select id='InBrand" + Id + "'  class='form-control' onclick='BindItemName(null," + Id + ")'><option>" + Brand + "</option></select><span class='none' id='SPBrand'>" + Brand + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('Name' + Id).childNodes[0].innerHTML = "<select id='InName" + Id + "'  class='form-control' ><option value= " + SubCategoryId + ">" + Name + "</option></select><span class='none' id='SPName'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('AreaName' + Id).childNodes[0].innerHTML = "<select id='InAreaName" + Id + "' class='form-control' ><option>" + AreaName + "</option></select> <span class='none' id='SPAreaName'>" + AreaName + "</span>";
            document.getElementById('ContactPerson' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InContactPerson" + Id + "'   value='" + ContactPerson + "' /><span class='none' id='SPContactPerson'>" + ContactPerson + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('Designation' + Id).childNodes[0].innerHTML = "<select id='InDesignation" + Id + "' class='form-control'><option>" + Designation + "</option></select> <span class='none' id='SPDesignation'>" + Designation + "</span>";
            document.getElementById('ContactNo' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InContactNo" + Id + "'   value='" + ContactNo + "' /><span class='none' id='SPContactNo'>" + ContactNo + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('Visible' + Id).childNodes[0].innerHTML = "<select id='InVisible" + Id + "'  class='form-control' ><option value= ''>Select</option><option value= 'Y'>YES</option><option value= 'N'>NO</option></select><span class='none' id='SPName'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('button' + Id).innerHTML = "<a href='javascript:UpdateRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Update' ><img src='../images/right.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:CancelRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Cancel'><img src='../images/cancel.png' class='CancelClick'/>&nbsp;</a>";
            
            
            BindBrandName(Id);
            EditBindArea(Id);
            BindDesignation(Id);
            debugger
        
            var ddlbrand = document.getElementById('InBrand' + Id);
            for (var j = 0; j < ddlbrand.length; j++) {
                var strUser = ddlbrand.options[j].innerHTML;
                if (strUser.trim() == Brand.trim()) {
                    ddlbrand.options[j].selected = true;
                    break;
                }
            }
            var ddlvisible = document.getElementById('InVisible' + Id);
            for (var j = 0; j < ddlvisible.length; j++) {
                var strUser = ddlvisible.options[j].innerHTML;
                if (strUser.trim() == Visible.trim()) {
                    ddlvisible.options[j].selected = true;
                    break;
                }
            }
            BindItemName(null, Id);
            var ddlarea = document.getElementById('InAreaName' + Id);
            for (var j = 0; j < ddlarea.length; j++) {
                var strUser = ddlarea.options[j].innerHTML;
                if (strUser.trim() == AreaName.trim()) {
                    ddlarea.options[j].selected = true;
                    break;
                }
            }
            var ddltype = document.getElementById('InDesignation' + Id);
            for (var j = 0; j < ddltype.length; j++) {
                var strUser = ddltype.options[j].innerHTML;
                if (strUser.trim() == Designation.trim()) {
                    ddltype.options[j].selected = true;
                    break;
                }
            }
            var ddlsub = document.getElementById('InName' + Id);
            for (var j = 0; j < ddlsub.length; j++) {
                var strUser = ddlsub.options[j].innerHTML;
                if (strUser.trim() == Name.trim()) {
                    ddlsub.options[j].selected = true;
                    break;
                }
            }
            PervID = Id;
        }
        function CancelRecord(Id) {
            GetItem();
            //var Name = document.getElementById('SPName').innerHTML;
            //var Website = document.getElementById('SPWebsite').innerHTML;
            //document.getElementById('Name' + Id).childNodes[0].innerHTML = Name;
            //document.getElementById('Website' + Id).childNodes[0].innerHTML = Website;
            //document.getElementById('button' + Id).innerHTML = "<a href='javascript:EditRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:Delete(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
            //PervID = "";
        }
        function EditBindArea(Id) {
            try {
                $.ajax({
                    type: "POST",
                    url: "SubCategoryMapping.aspx/BindAreaData",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    global: false,
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        var obj = jQuery.parseJSON(data.d);
                        var html = "";
                        
                            $('#InAreaName' + Id).empty();
                            html += '<option id="optcname" value="">Select</option>';
                            $.each(obj, function (key, value) {
                                html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                            });
                        $('#InAreaName' + Id).append(html);
                        
                    }
                });
            }
            catch (ex) { alert(ex); }
        }
        function UpdateRecord(Id) {
            var error = "";
            var ItemName = $("#InName" + Id).val();
            var Designation = $("#InDesignation" + Id).val();
            var Brand = $("#InBrand" + Id).val();
            var AreaName = $("#InAreaName" + Id).val();
            var ContactPerson = $("#InContactPerson" + Id).val();
            var ContactNo = $("#InContactNo" + Id).val();
            var Visible = $("#InVisible" + Id).val();
            var EmpId = '<%= Session["EmpId"] %>';
            if (Visible == "" || Visible == "Select") {
                error += "Please select.</br>";
            }
            if (ItemName == "" ) {
                error += "Please Enter Name.</br>";
            }
            if (Designation == "") {
                error += "Please Enter Designation.</br>";
            }
            if (Brand == "") {
                error += "Please Enter Brand.</br>";

            }
            if (AreaName == "") {
                error += "Please Enter AreaName.</br>";
            }
            if (ContactPerson == "") {
                error += "Please Enter ContactPerson.</br>";
            }
            
            if (ContactNo == "") {
                error += "Please Enter ContactNo.</br>";
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
                    url: "SubCategoryMapping.aspx/UpdateRecord",
                    data: "{Id: '" + Id + "',ItemName:'" + ItemName + "',Brand:'" + Brand + "',AreaName:'" + AreaName + "',ContactPerson:'" + ContactPerson + "',ContactNo:'" + ContactNo + "',Designation:'" + Designation + "',Visible:'" + Visible + "',ModifiedDate:'" + EmpId + "'}",
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
                            GetItem();
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
                url: "SubCategoryMapping.aspx/DeleteRecord",
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
                        GetItem();
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
                    <div class="page-title"><b>Brand Person Mapping</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Brand Person Mapping</li>
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
							
                              <%--<div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Category</label>
								  <select class="form-control" name="CName" id="CName">
									</select>
							</div>--%>
                              
                              <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Brand</label>
								  <select class="form-control" name="BName" id="BName">
									</select>
							</div>
                              
                            
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Product Name</label>
								<select class="form-control" name="IName" id="IName">
									</select>
							</div>
                          
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Area</label>
								  <select class="form-control" name="AreaName" id="AreaName">
									</select>
							</div>
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Excutive Name</label>
								<input type="text" id="contactperson" name="contactperson"  placeholder="CONTACT" class=" form-control"  />
							</div>
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Designation</label>
								  <select class="form-control" name="DName" id="DName">
									</select>
							</div>
                              <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Contact No</label>
								<input type="text" id="contactno" name="contactno"  placeholder="CONTACT NO" class=" form-control"  />
							</div>
                             <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Visible</label>
								<%--<input type="text" id="visible" name="visible"  placeholder="visible" class=" form-control"  />--%>
                                  <select class="form-control" name="visible" id="visible">
                                      <option value="">Select</option>
                                      <option value="Y">YES</option>
                                      <option value="N">NO</option>
									</select>
							</div>
                            	
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
    <script type="text/javascript">



        $(document).ready(function () {
            $("#BName").change(function () {
                var BId = $(this).val();
                BindItemName(BId,null);
            });

        });
        </script>
            
</asp:Content>
