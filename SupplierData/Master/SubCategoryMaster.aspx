<%@ Page Title="Sub-Category Master" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SubCategoryMaster.aspx.cs" Inherits="SupplierData.Master.SubCategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #imgPreview {
            width: 120px;
            height: 120px;
        }
        #imgInp {
            display: none;
        }
    </style>
    <script src="jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        //$(document).ready(function () {
            function fnneutral() {
            }

            window.onload = function () {
                GetSubCategory();
            };

            function GetSubCategory() {
                var html = "";


                $.ajax({
                    type: "POST",
                    url: "SubCategoryMaster.aspx/GetSubCategoryData",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var CategoryList = jQuery.parseJSON(data.d);
                        // alert(BrandList);
                        $("#divid").empty();
                        $("#divid").append('<table id="tblSubCategoryMaster" class="datatable table table-bordered">' +
                            '<thead></thead>' +
                            '<tbody></tbody>' +
                            '</table>');
                        var html = "";
                        $("#tblSubCategoryMaster thead").append('<tr>' +
                            '<th><a class="white" data-toggle="tooltip" title="Product Name">Product Name</a></th>' +
                            '<th><a class="white" data-toggle="tooltip" title="Remark">Remark</a></th>' +
                            '<th><a class="white" data-toggle="tooltip" title="Status">Logo</a></th>' +
                            '<th data-orderable="false" ><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
                            '</tr>');

                        for (var i = 0; i < CategoryList.length; i++) {
                            debugger
                            if (CategoryList[i].Name == null) {
                                CategoryList[i].Name = "";
                            }
                            if (CategoryList[i].Remark == null) {
                                CategoryList[i].Remark = "";
                            }
                            if (CategoryList[i].ImageURL == null) {
                                CategoryList[i].ImageURL = "";
                            }
                            //if (data.d[i].Status == "Active") {
                            html += ("<tr><td id='Name" + CategoryList[i].Id + "'><a  data-toggle='tooltip' title='" + CategoryList[i].Name + "'>" + CategoryList[i].Name + "</a></td><td id='Remark" + CategoryList[i].Id + "'><a  data-toggle='tooltip' title='" + CategoryList[i].Remark + "'>" + CategoryList[i].Remark + "</a></td><td id='tdImage" + CategoryList[i].Id + "'> <input type='file' id='imgCategory" + CategoryList[i].Id + "' name='imgCategory" + CategoryList[i].Id + "' style='display:none;' /><img class='img-responsive' id='targetImg' src='https://b2bpotential.s3.ap-south-1.amazonaws.com/BrandImages/" + CategoryList[i].ImageURL + "' width='30px' height='10px' title='" + CategoryList[i].ImageURL + "'> <input type='hidden' Id='InOldImg" + CategoryList[i].Id + "' value='" + CategoryList[i].ImageURL + "' /></td ><td   id='button" + CategoryList[i].Id + "'><a href='javascript:EditRecord(&apos;" + CategoryList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + CategoryList[i].Id + "' href='javascript:Delete(&apos;" + CategoryList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></tr>");
                            //}
                            //else {
                            //  html += ("<tr><td id='Name" + CategoryList[i].Id + "'><a  data-toggle='tooltip' title='" + CategoryList[i].Name + "'>" + CategoryList[i].Name + "</a></td><td class='hidden' id='Status" + CategoryList[i].Id + "'><a  data-toggle='tooltip' title='" + CategoryList[i].Status + "'>" + CategoryList[i].Status + "</a></td><td   id='button" + CategoryList[i].Id + "'><a href='javascript:EditRecord(&apos;" + CategoryList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;<a id='deleteanchor" + CategoryList[i].Id + "' />&nbsp;</a></td></tr>");
                            // }
                        }

                        $("#tblSubCategoryMaster tbody").append(html);
                        $('#tblSubCategoryMaster').dataTable({
                            language:
                            {
                                searchPlaceholder: "Search"
                            }
                        });

                    }

                });
            }


            function SaveSubCategoryData() {
                debugger
                var error = "";
                var CategoryName = $("#category").val();
                var Remark = $("#remark").val();

                if (CategoryName == "") {
                    error += "Enter Category Name</br>"
                }

                var MediaImage = "imageBrowes";
                var filename;
                var fileUpload = $("#imageBrowes").get(0);
                debugger
                var myfile = document.getElementById('imageBrowes').value;
                if (myfile == "") {
                    myfile = '1';
                }
                var ext = myfile.substring(myfile.lastIndexOf('.') + 1);
                var files = fileUpload.files;
                var test = new FormData();
                for (var i = 0; i < files.length; i++) {
                    test.append(files[i].name, files[i]);
                    filename = files[i].name;
                }

                var EmpId = '<%= Session["EmpId"] %>';
                var ImageURL = "";
                $.ajax({
                    url: "../FileUpload.ashx?value=" + MediaImage + "/" + filename,
                    type: "POST",
                    contentType: false,
                    processData: false,
                    data: test,
                    dataType: "json",
                    success: function (data) {
                        if (data != "") {
                            debugger
                            ImageURL = data;
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
                                    url: "SubCategoryMaster.aspx/SubCategoryInsert",
                                    data: "{Name:'" + CategoryName + "',Remark:'" + Remark + "',ImageURL:'" + ImageURL + "',CreatedBy:'" + EmpId + "'}",
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
                                            GetSubCategory();
                                        }
                                        else {
                                            Lobibox.notify('error', {
                                                delay: 1000,
                                                size: 'mini',
                                                icon: false,
                                                msg: 'Data is not Inserted Succesfully.'
                                            });
                                        }
                                        document.getElementById('category').value = "";
                                        document.getElementById('remark').value = "";
                                        $('#targetImg').attr('src', '')
                                        $("#imgPreview").hide();

                                    }
                                });
                            }
                        }
                    }
                });
            }
            function OpenExcel() {
                window.open("ExportToExcel.aspx?Type=SUBCATEGORY", '_blank');
            }
            var PervID = "";
            function EditRecord(Id) {
                if (PervID != "") {
                    try {
                        var Name = document.getElementById('SPName').innerHTML;
                        var Remark = document.getElementById('SPRemark').innerHTML;

                    }
                    catch (ex) {
                        var Name = document.getElementById('Name' + PervID).childNodes[0].innerHTML;
                        var Remark = document.getElementById('Remark' + PervID).childNodes[0].innerHTML;

                    }
                    document.getElementById('Name' + PervID).childNodes[0].innerHTML = Name;
                    document.getElementById('Remark' + PervID).childNodes[0].innerHTML = Remark;
                    document.getElementById('tdImage' + PervID).childNodes[0].innerHTML = "<input type='file' id='imageBrowes" + PervID + "' name='imageBrowes" + PervID + "' /><div id='imgPreview" + PervID + "' class='thumbnail' style='display: none'><img class='img-responsive' id='targetImg" + PervID + "' /><div class='caption'><a href='#' onclick='ClearPreview1(" + PervID + ")'><i class='glyphicon glyphicon - trash'></i></a></div>";
                    document.getElementById('button' + PervID).innerHTML = "<a href='javascript:EditRecord(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + PervID + "' href='javascript:Delete(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
                }
                var html = "";
                var Name = document.getElementById('Name' + Id).childNodes[0].innerHTML;
                var Remark = document.getElementById('Remark' + Id).childNodes[0].innerHTML;
                $("#imgCategory" + Id).removeAttr('style');
                document.getElementById('Name' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InName" + Id + "'   value='" + Name + "' /><span class='none' id='SPName'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
                document.getElementById('Remark' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InRemark" + Id + "'   value='" + Remark + "' /><span class='none' id='SPRemark'>" + Remark + "</span>";
                document.getElementById('tdImage' + Id).childNodes[0].innerHTML = "<input type = 'file' id ='imageBrowes" + Id + "' name = 'imageBrowes" + Id + "' /> <div id='imgPreview" + Id + "' class='thumbnail' style='display: none'><img class='img-responsive' id='targetImg" + Id + "' /><div class='caption'><a href='#' onclick='ClearPreview1(" + Id + ")'><i class='glyphicon glyphicon - trash'></i></a></div>";
                document.getElementById('button' + Id).innerHTML = "<a href='javascript:UpdateRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Update' ><img src='../images/right.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:CancelRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Cancel'><img src='../images/cancel.png' class='CancelClick'/>&nbsp;</a>";
                PervID = Id;
            }
            function CancelRecord(Id) {
                //var Name = document.getElementById('SPName').innerHTML;
                //document.getElementById('Name' + Id).childNodes[0].innerHTML = Name;
                //document.getElementById('Remark' + Id).childNodes[0].innerHTML = Remark;
                //document.getElementById('button' + Id).innerHTML = "<a href='javascript:EditRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:Delete(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
                //PervID = "";
                GetSubCategory();
            }

            function UpdateRecord(Id) {
               
                var MediaImage = "imageBrowes" + Id;
                var filename;
                var fileUpload = $("#imgCategory" + Id).get(0);
                debugger
                var myfile = document.getElementById('imgCategory' + Id).value;
                if (myfile == "") {
                    myfile = '1';
                }
                var ext = myfile.substring(myfile.lastIndexOf('.') + 1);
                var files = fileUpload.files;
                var test = new FormData();
                for (var i = 0; i < files.length; i++) {
                    test.append(files[i].name, files[i]);
                    filename = files[i].name;
                }
                var EmpId = '<%= Session["EmpId"] %>';

                var ImageURL = "";
                var isFile = false;
                if (fileUpload.files.length > 0) {
                    isFile = true;
                }

                if (!isFile) {
                    var imgVal = $("#InOldImg" + Id).val();
                    if (imgVal == "null") { imgVal = "" }
                    if (imgVal == undefined) { imgVal = "" }
                    ImageURL = imgVal;

                    var error = "";
                    var Name = $("#InName" + Id).val();
                    if (Name == "") {
                        error += "Please Enter Name.</br>";
                    }
                    var Remark = $("#InRemark" + Id).val();
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
                            url: "SubCategoryMaster.aspx/UpdateRecord",
                            data: "{Id: '" + Id + "',Name: '" + Name + "',Remark: '" + Remark + "',ImageURL:'" + ImageURL + "',ModifiedBy:'" + EmpId + "'}",
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
                                    GetSubCategory();
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
                else {
                    $.ajax({
                        url: "../FileUpload.ashx?value=" + MediaImage + "/" + filename,
                        type: "POST",
                        contentType: false,
                        processData: false,
                        data: test,
                        dataType: "json",
                        success: function (data) {
                            //if (data != "") {
                            debugger
                            if (data == "null") { data = "" }
                            if (data == undefined) { data = "" }
                            ImageURL = data;
                            var error = "";
                            var error = "";
                            var Name = $("#InName" + Id).val();
                            if (Name == "") {
                                error += "Please Enter Name.</br>";
                            }
                            var Remark = $("#InRemark" + Id).val();
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
                                    url: "SubCategoryMaster.aspx/UpdateRecord",
                                    data: "{Id: '" + Id + "',Name: '" + Name + "',Remark: '" + Remark + "',ImageURL:'" + ImageURL + "',ModifiedBy:'" + EmpId + "'}",
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
                                            GetSubCategory();
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
                    url: "SubCategoryMaster.aspx/DeleteRecord",
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
                            GetSubCategory();
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
                    url: "SubCategoryMaster.aspx/ImportInsert",
                    data: "{data:'" + JSON.stringify(jsondata) + "',CreatedBy:'" + EmpId + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d > 0) {
                            Lobibox.notify('success', {
                                delay: 2000,
                                size: 'mini',
                                icon: false,
                                msg: 'Data added successfully.'
                            });
                            GetSubCategory();
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

            $(document).ready(function () {
                $("#imageBrowes").change(function () {
                    var File = this.files;
                    if (File && File[0]) {
                        ReadImage(File[0]);
                    }
                })
            });
            var ReadImage = function (file) {
                var reader = new FileReader;
                var image = new Image;
                reader.readAsDataURL(file);
                reader.onload = function (_file) {
                    image.src = _file.target.result;
                    image.onload = function () {
                        var height = this.height;
                        var width = this.width;
                        var type = file.type;
                        var size = ~~(file.size / 1024) + "KB";
                        $("#targetImg").attr('src', _file.target.result);
                        $("#description").text("Size:" + size + ", " + height + "X " + width + ", " + type + "");
                        $("#imgPreview").show();
                    }
                }
            }
            var ClearPreview = function () {
                $("#imageBrowes").val('');
                $("#description").text('');
                $("#imgPreview").hide();
            }
       // });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--BEGIN PAGE WRAPPER-->
    <div id="page-wrapper">
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
            <div class="page-header pull-left">
                <div class="page-title"><b>Product Master</b></div>
            </div>
            <ol class="breadcrumb page-breadcrumb pull-right">
                <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                <li class="active">Product Master</li>
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
                            <label>Name</label>
                            <input type="text" id="category" name="category" placeholder="Product Name" class=" form-control" />
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
                            <label>Remark</label>
                            <input type="text" id="remark" name="remark" placeholder="REMARK" class=" form-control" required />
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
                             <label>Logo</label>
                            <input type="file" id="imageBrowes" name="imageBrowes" />
                            <div id="imgPreview" class="thumbnail" style="display: none">
                                <img class="img-responsive" id="targetImg" />
                                <div class="caption">
                                    <a href="#" onclick="ClearPreview()"><i class="glyphicon glyphicon-trash"></i></a>
                                </div>
                            </div>
                        </div>


                        <!-- Button -->
                        <div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
                            <button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveSubCategoryData();">ADD</button>
                            <a href="#">
                                <img src="<%=ConfigurationManager.AppSettings["url"] %>images/excel.png" class="mrgr7" data-toggle="tooltip" title="Export To Excel" onclick="OpenExcel();" /></a>
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
    <!--END PAGE WRAPPER-->


</asp:Content>
