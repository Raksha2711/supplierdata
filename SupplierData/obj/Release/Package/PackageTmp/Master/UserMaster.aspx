<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserMaster.aspx.cs" Inherits="SupplierData.Master.UserMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript">
    window.onload = function () {
        GetUser();
    };

       function GetUser() {
        var html = "";
        $.ajax({
            type: "POST",
            url: "UserMaster.aspx/GetUserData",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var UserList = (data.d);
               // alert(BrandList);
                $("#divid").empty();
                $("#divid").append('<table id="tblUserMaster" class="datatable table table-bordered">' +
                    '<thead></thead>' +
                    '<tbody></tbody>' +
                    '</table>');
                var html = "";
                $("#tblUserMaster thead").append('<tr>' +
                    '<th><a class="white" data-toggle="tooltip" title="User">User</a></th>' +
                    '<th><a class="white" data-toggle="tooltip" title="Password">Password</a></th>' +
                    '<th data-orderable="false" ><a class="white" data-toggle="tooltip" title="Action">Action</a></th>' +
                    '</tr>');

                for (var i = 0; i < UserList.length; i++) {
                   // if (data.d[i].Status == "Active") {
                    html += ("<tr><td id='UserName" + UserList[i].Id + "'><a  data-toggle='tooltip' title='" + UserList[i].UserName + "'>" + UserList[i].UserName + "</a></td><td id='Password" + UserList[i].Id + "'><a  data-toggle='tooltip' title='" + UserList[i].Password + "'>" + UserList[i].Password + "</a></td><td   id='button" + UserList[i].Id + "'><a href='javascript:EditRecord(&apos;" + UserList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + UserList[i].Id + "' href='javascript:Delete(&apos;" + UserList[i].Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a></td></tr>");
                    //}
                    //else {
                    //    html += ("<tr><td id='Name" + CategoryList[i].Id + "'><a  data-toggle='tooltip' title='" + CategoryList[i].Name + "'>" + CategoryList[i].Name + "</a></td><td class='hidden' id='Status" + CategoryList[i].Id + "'><a  data-toggle='tooltip' title='" + CategoryList[i].Status + "'>" + CategoryList[i].Status + "</a></td><td  class='hidden' id='button" + CategoryList[i].Id + "'><a href='javascript:EditRecord(&apos;" + CategoryList[i].Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'  /></a>&nbsp;<a id='deleteanchor" + CategoryList[i].Id + "' />&nbsp;</a></td></tr>");
                    //}
                }
                
                $("#tblUserMaster tbody").append(html);
                $('#tblUserMaster').dataTable({
                    language:
                    {
                        searchPlaceholder: "Search"
                    }
                });

            }
           
        });
    }


    function SaveUserData() {
        debugger
        var UserName = $("#user").val();
        var Password = $("#password").val();
        var error = "";
        if (UserName == "") {
            error = "Enter User Name.<br />";
        }
        if (Password == "") {
            error += "Enter Password.";
        }
        if (error != "") {
            
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
                url: "UserMaster.aspx/UserInsert",
                data: "{UserName:'" + UserName + "',Password:'" + Password +"'}",
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
                        GetUser();
                    }
                    else {
                        Lobibox.notify('error', {
                            delay: 1000,
                            size: 'mini',
                            icon: false,
                            msg: 'Data  not Inserted Succesfully.'
                        });
                    }
                    document.getElementById('user').value = "";
                    document.getElementById('password').value = "";

                }
            });

        }
        
       }
       var PervID = "";
       function EditRecord(Id) {
           if (PervID != "") {
               try {
                   var UserName = document.getElementById('SPUserName').innerHTML;
                   var Password = document.getElementById('SPPassword').innerHTML;
               }
               catch (ex) {
                   var UserName = document.getElementById('UserName' + PervID).childNodes[0].innerHTML;
                   var Password = document.getElementById('Password' + PervID).childNodes[0].innerHTML;
               }
               document.getElementById('UserName' + PervID).childNodes[0].innerHTML = UserName;
               document.getElementById('Password' + PervID).childNodes[0].innerHTML = Password;
               document.getElementById('button' + PervID).innerHTML = "<a href='javascript:EditRecord(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Edit' ><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + PervID + "' href='javascript:Delete(&apos;" + PervID + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
           }
           var html = "";
           var UserName = document.getElementById('UserName' + Id).childNodes[0].innerHTML;
           var Password = document.getElementById('Password' + Id).childNodes[0].innerHTML;
           document.getElementById('UserName' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InUserName" + Id + "'   value='" + UserName + "' /><span class='none' id='SPUserName'>" + UserName + "</span>";  //onkeypress='return isCharacter(event)'
           document.getElementById('Password' + Id).childNodes[0].innerHTML = "<input type='text' class='form-control' id='InPassword" + Id + "'   value='" + Password + "' /><span class='none' id='SPPassword'>" + Password + "</span>";  //onkeypress='return isCharacter(event)'
           document.getElementById('button' + Id).innerHTML = "<a href='javascript:UpdateRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Update' ><img src='../images/right.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:CancelRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Cancel'><img src='../images/cancel.png' class='CancelClick'/>&nbsp;</a>";
           PervID = Id;
       }
       function CancelRecord(Id) {
           //var Name = document.getElementById('SPName').innerHTML;
           //document.getElementById('Name' + Id).childNodes[0].innerHTML = Name;
           //document.getElementById('button' + Id).innerHTML = "<a href='javascript:EditRecord(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Edit'><img src='../images/edit.png'/></a>&nbsp;&nbsp;&nbsp;<a id='deleteanchor" + Id + "' href='javascript:Delete(&apos;" + Id + "&apos;)' data-toggle='tooltip' title='Delete'><img src='../images/close.png' />&nbsp;</a>";
           //PervID = "";
           GetUser();
       }

       function UpdateRecord(Id) {
           var error = "";
           var UserName = $("#InUserName" + Id).val();
           var Password = $("#InPassword" + Id).val();
           if (UserName == "") {
               error += "Enter User Name.</br>";
           }
           if (Password == "") {
               error += "Enter Password.</br>";
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
                   url: "UserMaster.aspx/UpdateRecord",
                   data: "{Id: '" + Id + "',UserName: '" + UserName + "',Password:'"+ Password +"'}",
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
                           GetUser();
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
               url: "UserMaster.aspx/DeleteRecord",
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
                       GetUser();
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
                    <div class="page-title"><b>User Master</b></div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=ConfigurationManager.AppSettings["url"] %>Report/DataReport.aspx">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">User Master</li>
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
								<label>User</label>
								<input type="text" id="user" name="user"  placeholder="User" class=" form-control"  />
							</div>
                              
                            <div class="col-lg-2 col-md-4 col-sm-3 col-xs-6 mrgt7">
								<label>Password</label>
								<input type="password" id="password" name="password"  placeholder="*******" class=" form-control"  />
							</div>
                           
                            	
							<!-- Button -->
							<div class="col-lg-2 col-md-3 col-sm-2 col-xs-6 txtcenter mrgt30">
								<button type="button" class="btn btn-blue btn-square mrgr7" data-toggle="tooltip" title="Save" id="save" onclick="SaveUserData();">ADD</button>
								<%--<a href="#"><img src="<%=ConfigurationManager.AppSettings["url"] %>images/excel.png" class="mrgr7" data-toggle="tooltip" title="Export To Excel" onclick="OpenExcel();" /></a> --%>
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
