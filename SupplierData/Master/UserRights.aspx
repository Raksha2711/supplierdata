<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserRights.aspx.cs" Inherits="SupplierData.Master.UserRights" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fnneutral() {
        }
    window.onload = function () {
        BindUser();
        };
        function BindUser() {
            $.ajax({
                type: "POST",
                url: "UserRights.aspx/BindUser",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                   
                        $('#UserName').empty();
                        html += '<option id="optcname" value="">Select</option>';
                        $.each(obj, function (key, value) {
                            html += '<option id=optcname' + value.Id + ' value=' + value.Id + '>' + value.UserName + '</option>';
                        });
                        $('#UserName').append(html);
                    
                }
            });
        }
        function DisplayData() {
            var Id = $("#UserName").val();
            var error = "";
            if (Id == "" || Id == "Select") {
                Lobibox.notify('error', {
                    delay: 1000,
                    size: 'mini',
                    icon: false,
                    msg: 'Select User'
                });
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "UserRights.aspx/BindForms",
                    data: "{Id:'" + Id + "'}",
                    contentType: "application/json; charset=utf-8",
                    global: false,
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        var FormList = jQuery.parseJSON(data.d);
                        var Counter = 0;
                        $("#DivPageName").empty();
                        $("#DivPageName").append('<table id="tblPageName" class="table table-bordered">' +
                            '<thead></thead>' +
                            '<tbody></tbody>' +
                            '</table>');
                        $("#tblPageName thead").append('<tr><th data-orderable="false">ID</th>' +
                            '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Form Name">Form-Name</th>' +
                            //'<th data-orderable="false"><a class="white" data-toggle="tooltip" title="FormLink">FormLink</a></th>'  +
                            '<th data-orderable="false"><a class="white" data-toggle="tooltip" title="Rights">Rights</a></th>');
                        var j = 1;
                        for (var i = 0; i < FormList.length; i++) {
                            $("#tblPageName tbody").append('<tr><td id="FormId' + j + '" > ' + FormList[i].FormId + '</td > ' +
                                '<td id="FormName' + j + '"><a data-toggle="tooltip" title="' + FormList[i].FormName + '">' + FormList[i].FormName + '</a></td>' +
                                //'<td id="FormLink' + j + '"><a data-toggle="tooltip" title="' + FormList[i].Formlink + '">' + FormList[i].Formlink + '</a></td>' +
                                '<td><input type="checkbox" name="checkbox1" id="Edit' + j + '" /></td>' +
                                '</tr>');
                            if (FormList[i].UREdit == 1) {
                               // Counter++;
                                document.getElementById('Edit' + j).checked = true;
                            }
                            j++;

                        }
                        $('#tblPageName').DataTable({
                            language: {
                                searchPlaceholder: "Search"
                            },
                            "sorting": false,
                           // "scrollY": "550px",
                            "bPaginate": false, //Pagging not display
                            "bFilter": false
                        });
                        $("#update").removeClass("hidden");
                    }
                });
            }
        }
        function UpdateUserRight() {
            var Id = $("#UserName").val();
            var FID, Fname = "";
           
            var FormArray1 = new Array();
            debugger
            var j = 0;
            var FrmId = document.getElementById('tblPageName');
            for (var i = 1; i < FrmId.rows.length; i++) {
                if (document.getElementById('Edit' + i).checked == true) {
                    FID = FrmId.rows[i].cells[0].innerHTML;
                    Fname = FrmId.rows[i].cells[1].childNodes[0].innerHTML;
                    FormArray1[j] = FID;
                    j++;
                }
                else {
                    continue
                }
            }
            var testjsondept = JSON.stringify(FormArray1);
            $.ajax({
                type: "POST",
                url: "UserRights.aspx/UpdateData",
                data: "{Edit:'" + testjsondept + "',UserId:'"+ Id +"'}",
                contentType: "application/json; charset=utf-8",
                global: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    if (data.d == "1") {
                        Lobibox.notify('success', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data save successfully'
                        });}
                    else {
                        Lobibox.notify('error', {
                            delay: 2000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data not saved'
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
                    <div class="page-title"><b>User Rights</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">User Rights</li>
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
								<label>User Name</label>
								  <select class="form-control" name="UserName" id="UserName">
									</select>
							</div>

                              <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">

								<button type="button" class="btn btn-save" data-toggle="tooltip" title="display" id="display" onclick="DisplayData();">SEARCH</button>
							</div>
						
					
							<!-- /Button -->
						</form>
					</div>
					<!-- /Search Form -->
                    <!-- BEGIN DATATABLE -->
					<%--<div class="row mrgt30">
						<div class="col-lg-12 col-xs-12 overflowauto" id="divid">
							
						</div>
					</div>--%>
					<!-- END DATATABLE -->
					<!-- BEGIN ALERT ON_CLICK DELETE -->
                    
<div class="row mrgt30">		
						<div class="col-lg-6 col-lg-offset-3 col-xs-12 overflowauto" id="DivPageName"></div>                                          
                    
                </div>
                    <div  class="row mrgt30">
							<button type="button" class="btn btn-save hidden" data-toggle="tooltip" title="Update" id="update" onclick="UpdateUserRight();">UPDATE</button>
						</div>
				<!-- /Form Layouts -->
			</div>
			<!--END PAGE-CONTENT-->
		</div>
          </div>
</asp:Content>
