<%@ Page Title="Brand Master" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BrandMaster.aspx.cs" Inherits="SupplierData.Master.BrandMaster" %>
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
            GetBrand();
        };
        function GetBrand() {
            var html = "";
            $.ajax({
                type: "POST",
                url: "BrandMaster.aspx/GetBrandData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger
                    var BrandList = jQuery.parseJSON(data.d);
                    // alert(BrandList);
                    $("#divid").empty();
                    $("#divid").append('<table id="tblBrandMaster" class="datatable table table-bordered">' +
                        '<thead></thead>' +
                        '<tbody></tbody>' +
                        '</table>');
                    var html = "";
                    $("#tblBrandMaster thead").append('<tr>' +
                        '<th><a class="white" data-toggle="tooltip" title="Name">Brand Name</a></th>' +
                        '<th data-orderable="false" class="hidden"><a class="white" data-toggle="tooltip" title="Status">Contact Person</a></th>' +
                        '<th data-orderable="false" class="hidden"><a class="white" data-toggle="tooltip" title="Status">Contact No</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Status">Website</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Status">Remark</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Status">Toll Free No.</a></th>' +
                        '<th><a class="white" data-toggle="tooltip" title="Status">Logo</a></th>' +
                        '<th data-orderable="false" class="hidden"><a class="white" data-toggle="tooltip" title="Status">Status</a></th>' +
                        '<th data-orderable="false" ><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
                        '</tr>');
                    for (var i = 0; i < BrandList.length; i++) {
                        if (BrandList[i].ImageURL == "null") {
                            BrandList[i].ImageURL = "";
                        }
                        html += ("<tr><td id='Name" + BrandList[i].Id + "'><a  data-toggle='tooltip' title='" + BrandList[i].Name + "'>" + BrandList[i].Name + "</a></td><td class='hidden' id='ContactPerson" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].ContactPerson + "'>" + BrandList[i].ContactPerson + "</a></td><td class='hidden' id='ContactNo" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].ContactNo + "'>" + BrandList[i].ContactNo + "</a></td> <td id='Website" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].Website + "'>" + BrandList[i].Website + "</a></td><td id='Remark" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].Remark + "'>" + BrandList[i].Remark + "</a></td> <td id='TollFreeNo" + BrandList[i].Id + "'><a data-toggle='tooltip' title='" + BrandList[i].TollFreeNo + "'>" + BrandList[i].TollFreeNo + "</a></td><td id='tdImage" + BrandList[i].Id + "'> <input type='file' id='imgBrand" + BrandList[i].Id + "' name='imgBrand" + BrandList[i].Id + "' style='display:none;' /><img class='img-responsive' id='targetImg' src='https://b2bpotential.s3.ap-south-1.amazonaws.com/BrandImages/" + BrandList[i].ImageURL + "' width='30px' height='10px' title='" + BrandList[i].ImageURL + "'> <input type='hidden' Id='InOldImg" + BrandList[i].Id + "' value='" + BrandList[i].ImageURL + "' /></td ><td class='hidden' id='Status" + BrandList[i].Id + "'><a  data-toggle='tooltip' title='" + BrandList[i].Status + "'>" + BrandList[i].Status + "</a></td><td   id='button" + BrandList[i].Id + "'><a href='javascript:EditRecord(&apos;" + BrandList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + BrandList[i].Id + "' href='javascript:Delete(&apos;" + BrandList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></tr>");
                    }
                    
                    $("#tblBrandMaster tbody").append(html);
                    $('#tblBrandMaster').dataTable({
                        language:
                        {
                            searchPlaceholder: "Search"
                        }
                    });
                }
            });
        }
        function SaveBrandData() {
            debugger
            var error = "";
            var BrandName = $("#brand").val();
            if (BrandName == "") {
                error += "Enter Brand Name</br>"
            }
            var Website = $("#website").val();
            if (Website == "") {
                error += "Enter Website </br>"
            }
            var TollFreeNo = $("#tollfreeno").val();
            if (TollFreeNo == "") {
                error += "Enter TollFreeNo </br>"
            }
            var Remark = $("#remark").val();
            if (Remark == "") {
                error += "Enter Remark </br>"
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
                                url: "BrandMaster.aspx/BrandInsert",
                                data: "{BrandName:'" + BrandName + "',Website:'" + Website + "',TollFreeNo:'" + TollFreeNo + "',Remark:'" + Remark + "',CreatedBy:'" + EmpId + "',ImageURL:'" + ImageURL +"'}",
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
                                        GetBrand();
                                    }
                                    else {
                                        Lobibox.notify('error', {
                                            delay: 2000,
                                            size: 'mini',
                                            icon: false,
                                            msg: 'Data not Inserted Succesfully.'
                                        });
                                    }
                                    document.getElementById('brand').value = "";
                                    document.getElementById('website').value = "";
                                    document.getElementById('tollfreeno').value = "";
                                    document.getElementById('remark').value = "";
                                    
                                }
                            });
                        }
                        document.getElementById('brand').value = "";
                        document.getElementById('website').value = "";
                        document.getElementById('tollfreeno').value = "";
                        document.getElementById('remark').value = "";
                    }
                }
            });
        }
        function OpenExcel() {
            window.open("ExportToExcel.aspx?Type=BRAND", '_blank');
        }
        var PervID = "";
        function EditRecord(Id) {
            if (PervID != "") {
                try {
                    var Name = document.getElementById('SPName').innerHTML;
                    var Website = document.getElementById('SPWebsite').innerHTML;
                    var TollFreeNo = document.getElementById('SPTollFreeNo').innerHTML;
                    var Remark = document.getElementById('SPRemark').innerHTML;
                    
                }
                catch (ex) {
                    var Name = document.getElementById('Name' + PervID).childNodes[0].innerHTML;
                    var Website = document.getElementById('Website' + PervID).childNodes[0].innerHTML;
                    var TollFreeNo = document.getElementById('TollFreeNo' + PervID).childNodes[0].innerHTML;
                    var Remark = document.getElementById('Remark' + PervID).childNodes[0].innerHTML;
                }
                document.getElementById('Name' + PervID).childNodes[0].innerHTML = Name;
                document.getElementById('Website' + PervID).childNodes[0].innerHTML = Website;
                document.getElementById('TollFreeNo' + PervID).childNodes[0].innerHTML = TollFreeNo;
                document.getElementById('Remark' + PervID).childNodes[0].innerHTML = Remark;
                document.getElementById('tdImage' + PervID).childNodes[0].innerHTML = "<input type='file' id='imageBrowes" + PervID + "' name='imageBrowes" + PervID + "' /><div id='imgPreview" + PervID + "' class='thumbnail' style='display: none'><img class='img-responsive' id='targetImg" + PervID + "' /><div class='caption'><a href='#' onclick='ClearPreview1(" + PervID + ")'><i class='glyphicon glyphicon - trash'></i></a></div>";
                document.getElementById('button' + PervID).innerHTML = "<a href='javascript:EditRecord(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + PervID + "' href='javascript:Delete(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
            }
            var html = "";
            var Name = document.getElementById('Name' + Id).childNodes[0].innerHTML;
            var Website = document.getElementById('Website' + Id).childNodes[0].innerHTML;
            var TollFreeNo = document.getElementById('TollFreeNo' + Id).childNodes[0].innerHTML;
            var Remark = document.getElementById('Remark' + Id).childNodes[0].innerHTML;
            //var imgBrand = document.getElementById('imgBrand' + Id).childNodes[0].innerHTML;
            $("#imgBrand" + Id).removeAttr('style');
            document.getElementById('Name' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InName" + Id + "'   value='" + Name + "' /><span class='none' id='SPName'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
            document.getElementById('Website' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InWebsite" + Id + "'   value='" + Website + "' /><span class='none' id='SPWebsite'>" + Website + "</span>";
            document.getElementById('TollFreeNo' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InTollFreeNo" + Id + "'   value='" + TollFreeNo + "'   onkeypress='return isNumber(event);'  maxlength='11'/><span class='none' id='SPTollFreeNo'>" + TollFreeNo + "</span>";
            document.getElementById('Remark' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InRemark" + Id + "'   value='" + Remark + "' /><span class='none' id='SPRemark'>" + Remark + "</span>";
            document.getElementById('tdImage' + Id).childNodes[0].innerHTML = "<input type = 'file' id ='imageBrowes" + Id + "' name = 'imageBrowes" + Id + "' /> <div id='imgPreview" + Id + "' class='thumbnail' style='display: none'><img class='img-responsive' id='targetImg" + Id + "' /><div class='caption'><a href='#' onclick='ClearPreview1(" + Id + ")'><i class='glyphicon glyphicon - trash'></i></a></div>";
            document.getElementById('button' + Id).innerHTML = "<a href='javascript:UpdateRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Update' ><img src='../images/right.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:CancelRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Cancel'><img src='../images/cancel.png' class='CancelClick'/>&nbsp;</a>";
            PervID = Id;
        }
        function CancelRecord(Id) {
            GetBrand();
            //var Name = document.getElementById('SPName').innerHTML;
            //var Website = document.getElementById('SPWebsite').innerHTML;
            //var TollFreeNo = document.getElementById('SPTollFreeNo').innerHTML;
            //document.getElementById('Name' + Id).childNodes[0].innerHTML = Name;
            //document.getElementById('Website' + Id).childNodes[0].innerHTML = Website;
            //document.getElementById('TollFreeNo' + Id).childNodes[0].innerHTML = TollFreeNo;
            //document.getElementById('button' + Id).innerHTML = "<a href='javascript:EditRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:Delete(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
            PervID = "";
        }
        function UpdateRecord(Id) {
            debugger
            var MediaImage = "imageBrowes" + Id;
            var filename;
            var fileUpload = $("#imgBrand" + Id).get(0);
            debugger
            var myfile = document.getElementById('imgBrand' + Id).value;
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
                var Website = $("#InWebsite" + Id).val();
                var TollFreeNo = $("#InTollFreeNo" + Id).val();
                var Remark = $("#InRemark" + Id).val();

                if (Name == "") {
                    error += "Please Enter Name.</br>";
                }
                if (Website == "") {
                    error += "Please Enter Website.</br>";
                }
                if (TollFreeNo == "") {
                    error += "Please Enter TollFreeNo.</br>";
                }
                if (Remark == "") {
                    error += "Please Enter Remark.</br>";
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
                        url: "BrandMaster.aspx/UpdateRecord",
                        data: "{Id: '" + Id + "',Name: '" + Name + "',Website: '" + Website + "',TollFreeNo:'" + TollFreeNo + "',Remark:'" + Remark + "',ModifiedBy:'" + EmpId + "',ImageURL:'" + ImageURL + "'}",
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
                                GetBrand();
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
                        if (data == undefined) { data=""}
                        ImageURL = data;
                        var error = "";
                        var Name = $("#InName" + Id).val();
                        var Website = $("#InWebsite" + Id).val();
                        var TollFreeNo = $("#InTollFreeNo" + Id).val();
                        var Remark = $("#InRemark" + Id).val();

                        if (Name == "") {
                            error += "Please Enter Name.</br>";
                        }
                        if (Website == "") {
                            error += "Please Enter Website.</br>";
                        }
                        if (TollFreeNo == "") {
                            error += "Please Enter TollFreeNo.</br>";
                        }
                        if (Remark == "") {
                            error += "Please Enter Remark.</br>";
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
                                url: "BrandMaster.aspx/UpdateRecord",
                                data: "{Id: '" + Id + "',Name: '" + Name + "',Website: '" + Website + "',TollFreeNo:'" + TollFreeNo + "',Remark:'" + Remark + "',ModifiedBy:'" + EmpId + "',ImageURL:'" + ImageURL + "'}",
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
                                        GetBrand();
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
                url: "BrandMaster.aspx/DeleteRecord",
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
                        GetBrand();
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
                url: "BrandMaster.aspx/ImportInsert",
                data: "{data:'" + JSON.stringify(jsondata) + "',CreatedBy:'" + EmpId + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d > 0) {
                        GetBrand();
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--BEGIN PAGE WRAPPER-->
    <div id="page-wrapper">
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
            <div class="page-header pull-left">
                <div class="page-title"><b>Brand Master</b></div>
            </div>
            <ol class="breadcrumb page-breadcrumb pull-right">
                <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                <li class="active">Brand Master</li>
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
                            <label>Brand</label>
                            <input type="text" id="brand" name="brand" placeholder="BRAND" class=" form-control" required />
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
                            <label>Website</label>
                            <input type="text" id="website" name="website" placeholder="WEBSITE" class=" form-control" required />
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
                            <label>Toll Free Number</label>
                            <input type="text" id="tollfreeno" name="tollfreeno" placeholder="Toll Free Nunber " class=" form-control" onkeypress="return isNumber(event);" maxlength="11" required />
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
                            <label>Remark</label>
                            <input type="text" id="remark" name="remark" placeholder="REMARK" class=" form-control" required />
                        </div>
                         <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
                             <label>Logo</label>
                            <input type="file" id="imageBrowes" name="imageBrowes" />
                            <div id="imgPreview" class="thumbnail" style="display: none">
                                <img class="img-responsive"  id="targetImg" />
                                <div class="caption">
                                    <a href="#" onclick="ClearPreview()"><i class="glyphicon glyphicon-trash"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- Button -->
                        <div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
                            <button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveBrandData();">ADD</button>
                            <a href="#">
                                <img src="<%=ConfigurationManager.AppSettings["url"] %>images/excel.png" class="mrgr7" data-toggle="tooltip" title="Export To Excel" onclick="OpenExcel();" /></a>
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
        <!--END PAGE-CONTENT-->
    </div>
    <!--END PAGE WRAPPER-->
</asp:Content>
