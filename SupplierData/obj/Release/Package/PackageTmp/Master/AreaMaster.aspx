<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AreaMaster.aspx.cs" Inherits="SupplierData.Master.AreaMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script  type="text/javascript">
          function fnneutral() {
          }
          window.onload = function () {
        GetArea(null);
        BindState(null);
          };
          function BindState(Id) {
              try {
                  $.ajax({
                      type: "POST",
                      url: "AreaMaster.aspx/BindStateData",
                      data: "{}",
                      contentType: "application/json; charset=utf-8",
                      global: false,
                      async: false,
                      dataType: "json",
                      success: function (data) {
                          var obj = jQuery.parseJSON(data.d);
                          var html = "";
                          if (Id == null || Id == "") {
                              $('#SName').empty();
                              html += '<option id="optcname" value="">Select</option>';
                              $.each(obj, function (key, value) {
                                  html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                              });
                              $('#SName').append(html);
                          }
                          else {
                              $('#InState' + Id).empty();
                              html += '<option id="optcname" value="">Select</option>';
                              $.each(obj, function (key, value) {
                                  html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.Name + '</option>';
                              });
                              $('#InState' + Id).append(html);
                          }
                      }
                  });
              }
              catch (ex) { alert(ex); }
          }
          function GetArea() {
              var html = "";
              $.ajax({
                  type: "POST",
                  url: "AreaMaster.aspx/GetAreaData",
                  data: "{}",
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (data) {
                      debugger
                      var AreaList = jQuery.parseJSON(data.d);
                      $("#divid").empty();
                      $("#divid").append('<table id="tblAreaMaster" class="datatable table table-bordered">' +
                          '<thead></thead>' +
                          '<tbody></tbody>' +
                          '</table>');
                      var html = "";
                      $("#tblAreaMaster thead").append('<tr>' +
                          '<th><a class="white" data-toggle="tooltip" title="Name">State</a></th>' +
                          '<th><a class="white" data-toggle="tooltip" title="Area">Area</a></th>' +
                          '<th data-orderable="false" class="hidden"><a class="white" data-toggle="tooltip" title="Status">Status</a></th>' +
                          '<th data-orderable="false" ><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
                          '</tr>');

                      for (var i = 0; i < AreaList.length; i++) {
                         // if (AreaList[i].Status == "Active") {
                          html += ("<tr><td id='State" + AreaList[i].Id + "'><a  data-toggle='tooltip' title='" + AreaList[i].State + "'>" + AreaList[i].State + "</a></td><td id='Name" + AreaList[i].Id + "'><a  data-toggle='tooltip' title='" + AreaList[i].Name + "'>" + AreaList[i].Name + "</a></td><td class='hidden' id='Status" + AreaList[i].Id + "'><a  data-toggle='tooltip' title='" + AreaList[i].Status + "'>" + AreaList[i].Status + "</a></td><td  id='button" + AreaList[i].Id + "'><a href='javascript:EditRecord(&apos;" + AreaList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + AreaList[i].Id + "' href='javascript:Delete(&apos;" + AreaList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></tr>");
                          //}
                          //else {
                          //    html += ("<tr><td id='State" + AreaList[i].Id + "'><a  data-toggle='tooltip' title='" + AreaList[i].State + "'>" + AreaList[i].State + "</a></td><td id='Name" + AreaList[i].Id + "'><a  data-toggle='tooltip' title='" + AreaList[i].Name + "'>" + AreaList[i].Name + "</a></td><td class='hidden' id='Status" + AreaList[i].Id + "'><a  data-toggle='tooltip' title='" + AreaList[i].Status + "'>" + AreaList[i].Status + "</a></td><td  class='hidden' id='button" + AreaList[i].Id + "'><a href='javascript:EditRecord(&apos;" + AreaList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;<a id='deleteanchor" + AreaList[i].Id + "' />&nbsp;</a></td></tr>");
                          //}
                      }

                      $("#tblAreaMaster tbody").append(html);
                      $('#tblAreaMaster').dataTable({
                          language:
                          {
                              searchPlaceholder: "Search"
                          }
                      });

                  }

              });
          }


    function SaveAreaData() {
        debugger
        var error = "";
        var Name = $("#area").val();
        var StateId = $("#SName").val();
        Name = Name.replace("&amp;", "&");
        if (Name == "") {
            error += "Please Enter Name.</br>";
        }
        if (StateId == "") {
            error += "Please Enter State.</br>";
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
        //if (Name != "" ) {
            $.ajax({
                type: "POST",
                url: "AreaMaster.aspx/AreaInsert",
                data: "{Name:'" + Name + "',StateId:'" + StateId+"'}",
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
                        GetArea();
                    }
                    else {
                        Lobibox.notify('error', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data is not Inserted Succesfully.'
                        });
                    }
                    document.getElementById('area').value = "";
                    $("#SName").val('');

                }
            });

        }
          }
       
          function OpenExcel() {
              window.open("ExportToExcel.aspx?Type=AREA", '_blank');
          }
          var PervID = "";
          function EditRecord(Id) {
              if (PervID != "") {
                  try {
                      var State = document.getElementById('SPState').innerHTML;
                      var Name = document.getElementById('SPName').innerHTML;
                  }
                  catch (ex) {
                      var State = document.getElementById('State' + PervID).childNodes[0].innerHTML;
                      var Name = document.getElementById('Name' + PervID).childNodes[0].innerHTML;
                  }
                  document.getElementById('State' + PervID).childNodes[0].innerHTML = State;
                  document.getElementById('Name' + PervID).childNodes[0].innerHTML = Name;
                  document.getElementById('button' + PervID).innerHTML = "<a href='javascript:EditRecord(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + PervID + "' href='javascript:Delete(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
              }
              var html = "";
              var State = document.getElementById('State' + Id).childNodes[0].innerHTML;
              var Name = document.getElementById('Name' + Id).childNodes[0].innerHTML;

              document.getElementById('State' + Id).childNodes[0].innerHTML = "<select id='InState" + Id + "'  class='form-control' ><option>" + State + "</option></select><span class='none' id='SPState'>" + State + "</span>";  //onkeypress='return isCharacter(event)'
              document.getElementById('Name' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InName" + Id + "'   value='" + Name + "' /><span class='none' id='SPName'>" + Name + "</span>";  //onkeypress='return isCharacter(event)'
              document.getElementById('button' + Id).innerHTML = "<a href='javascript:UpdateRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Update' ><img src='../images/right.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:CancelRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Cancel'><img src='../images/cancel.png' class='CancelClick'/>&nbsp;</a>";
              BindState(Id);
              var ddlstate = document.getElementById('InState' + Id);
              for (var j = 0; j < ddlstate.length; j++) {
                  var strUser = ddlstate.options[j].innerHTML;
                  if (strUser.trim() == State.trim()) {
                      ddlstate.options[j].selected = true;
                      break;
                  }
              }
            
              PervID = Id;
          }
          function CancelRecord(Id) {
              GetArea();
              PervID = "";
          }

          function UpdateRecord(Id) {
              var error = "";
              var Name = $("#InName" + Id).val();
              var StateId = $("#InState" + Id).val();
              Name = Name.replace("&amp;", "&");
              if (Name == "") {
                  error += "Please Enter Name.</br>";
              }
              if (StateId == "") {
                  error += "Please Enter State.</br>";
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
                      url: "AreaMaster.aspx/UpdateRecord",
                      data: "{Id: '" + Id + "',Name: '" + Name + "',StateId: '" + StateId + "'}",
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
                              GetArea();
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
                  url: "AreaMaster.aspx/DeleteRecord",
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
                          GetArea();
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
                    <div class="page-title"><b>Area Master</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Area Master</li>
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
                                <label>State : </label>
                                <select class="form-control" name="SName" id="SName">
									</select>
							</div>
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Area</label>
								<input type="text" id="area" name="area"  placeholder="AREA" class=" form-control"  />
							</div>
                              
                            	
							<!-- Button -->
							<div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
								<button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveAreaData();">ADD</button>
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
</asp:Content>
