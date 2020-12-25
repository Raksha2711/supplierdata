<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DesignationMaster.aspx.cs" Inherits="SupplierData.Master.DesignationMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">

          function fnneutral() {
          }
    window.onload = function () {
        GetDesignation();
    };

       function GetDesignation() {
        var html = "";
       

        $.ajax({
            type: "POST",
            url: "DesignationMaster.aspx/GetDesignationData",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var DList = jQuery.parseJSON(data.d);
               // alert(BrandList);
                $("#divid").empty();
                $("#divid").append('<table id="tblDesignationMaster" class="datatable table table-bordered">' +
                    '<thead></thead>' +
                    '<tbody></tbody>' +
                    '</table>');
                var html = "";
                $("#tblDesignationMaster thead").append('<tr>' +
                    '<th><a class="white" data-toggle="tooltip" title="Designation">Designation</a></th>' +
                    '<th data-orderable="false" ><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
                    '</tr>');

                for (var i = 0; i < DList.length; i++) {
                   // if (data.d[i].Status == "Active") {
                        html += ("<tr><td id='Name" + DList[i].Id + "'><a  data-toggle='tooltip' title='" + DList[i].Name + "'>" + DList[i].Name + "</a></td><td  id='button" + DList[i].Id + "'><a href='javascript:EditRecord(&apos;" + DList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + DList[i].Id + "' href='javascript:Delete(&apos;" + DList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></tr>");
                    //}
                    //else {
                    //    html += ("<tr><td id='Name" + DList[i].Id + "'><a  data-toggle='tooltip' title='" + DList[i].Name + "'>" + DList[i].Name + "</a></td><td class='hidden' id='Status" + DList[i].Id + "'><a  data-toggle='tooltip' title='" + DList[i].Status + "'>" + DList[i].Status + "</a></td><td  class='hidden' id='button" + DList[i].Id + "'><a href='javascript:EditRecord(&apos;" + DList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + DList[i].Id + "' />&nbsp;</a></td></tr>");
                    //}
                }
                
                $("#tblDesignationMaster tbody").append(html);
                $('#tblDesignationMaster').dataTable({
                    language:
                    {
                        searchPlaceholder: "Search"
                    }
                });

            }
           
        });
    }


    function SaveDesignationData() {
        debugger
        var DesignationyName = $("#designation").val();
        var EmpId = '<%= Session["EmpId"] %>';
        var error = "";
        if (DesignationyName == "") {
            error += "Please Enter Name.</br>";
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
                url: "DesignationMaster.aspx/DesignationInsert",
                data: "{Name:'" + DesignationyName + "',CreatedBy:'" + EmpId + "'}",
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
                        GetDesignation();
                    }
                    else {
                        Lobibox.notify('error', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data not uploaded Succesfully.'
                        });
                    }
                    document.getElementById('designation').value = "";

                }
            });

        }
          }
          function OpenExcel() {
              window.open("ExportToExcel.aspx?Type=DESIGNATION", '_blank');
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
                  error += "Please Enter Name.</br>";
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
                      url: "DesignationMaster.aspx/UpdateRecord",
                      data: "{Id: '" + Id + "',Name: '" + Name + "',ModifiedBy:'" + EmpId +"'}",
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
                              GetDesignation();
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
                  url: "DesignationMaster.aspx/DeleteRecord",
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
                          GetDesignation();
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
                  url: "DesignationMaster.aspx/ImportInsert",
                  data: "{data:'" + JSON.stringify(jsondata) + "',CreatedBy:'" + EmpId  + "'}",
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
                          GetDesignation();
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
                    <div class="page-title"><b>Designation Master</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Designation Master</li>
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
								<label>Designation : </label>
								<input type="text" id="designation" name="designation"  placeholder="DESIGNATION" class=" form-control"  />
							</div>
                              

                           
                            	
							<!-- Button -->
							<div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
								<button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveDesignationData();">ADD</button>
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
        <!--END PAGE WRAPPER-->

</asp:Content>
