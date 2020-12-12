<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SupplierData.Other.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log In</title>
     <script src="<%=ConfigurationManager.AppSettings["url"] %>js/jquery.1.11.min.js" type="text/javascript"></script>
     <!-- Notification JS -->
	<script src="<%=ConfigurationManager.AppSettings["url"] %>js/notification/lobibox.min.js" type="text/javascript"></script>
    
     <!-- Notification style -->
	<link rel="stylesheet" href="css/notification.min.css"/>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="vendors/bootstrap/css/bootstrap.min.css" />
    <!--Loading style-->
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <link type="text/css" rel="stylesheet" href="css/style-responsive.css" />
    <link rel="shortcut icon" href="images/favicon.ico" />
   <%-- <script type="text/ecmascript"></script>--%>


    <script type="text/javascript">


        $("#txtPassword").keyup(function (event) {
            if (event.keyCode == 13) {
                $("#btnSubmit").click();
            }
        });


        window.onload = function () {
            document.getElementById("txtUserName").focus();
        };
        function LoginClick() {
            
            debugger
            var UserName = document.getElementById('txtUserName').value;
            var Password = document.getElementById('txtPassword').value;
            // var year = document.getElementById('ddlYear').value;
            //if (UserName != "" && Password != "") {
                $.ajax({
                    type: "POST",
                    url: "WebService1.asmx/LoginCheck",
                    data: "{UserName: '" + UserName + "',Password: '" + Password + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    global: false,
                    async: false,
                    success: function (data) {
                        debugger
                        if (data.d != "") {
                            getFormRights();
                            window.location = "Report/DataReport.aspx";
                        }
                        else {
                            Lobibox.notify('error', {
                                delay: 2000,
                                size: 'mini',
                                icon: false,
                                msg: 'Invalid UserName or Password.'
                            });
                        }
                    }

                });
           // }
        }
        function getFormRights() {

            //  var EmpID = '<%= Session["EmpId"] %>';
            //  var UserName = '<%= Session["txtUserName"] %>';

            $.ajax({
                type: "POST",
                url: "WebService1.asmx/FetchFormRights",
                // data: "{EmpID:'" + EmpID + "',UserName:'" + UserName + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                global: false,
                async: false,
                success: function (data) {

                }
            });
        }

        </script>
</head>
<%--<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>--%>
    <body class="loginbg">
    <div class="page-form">
    <form class="form" id="userregi" name="userregi">
        <div class="header-content"><%--<img src="images/logo.png">--%></div>
        <div class="body-content">
            <div class="form-group mrgt5">
                <div class="input-icon right"><i class="fa fa-user"></i>
					<input type="text" placeholder="USER"  class="form-control" name="user" id="txtUserName" />
				</div>
            </div>
			
            <div class="form-group mrgt30">
                <div class="input-icon right"><i class="fa fa-key"></i>
          
					<input type="password" placeholder="*********" class="form-control" name="password" id="txtPassword"  style="-webkit-text-security: square;" onkeydown="if (event.keyCode == 13) document.getElementById('btnSubmit').click()"/>
				</div>
            </div>

            <%--<div class="form-group mrgt30">
				<select class="form-control loginselect" id="ddlY">
					<option>2016</option>
					<option>2017</option>
				</select>
			</div>--%>
			
           <%-- <div class="forget-password mrgt23">
				<a class='btn-forgot-pwd' onclick="redirecttoother();">Forgot Password ?</a>
			</div>--%>
			
			<!-- Buttons -->
            <!-- Buttons -->
			<div class="row mrgt23 pdr0">
				<div class="col-lg-8">
					<a class='btn-forgot-pwd' onclick="redirecttoother();">Forgot Password ?</a>
				</div>
			
				<div class="col-lg-4">
					<button type="button" class="btn btn-save" id="btnSubmit" onclick="LoginClick();" >Log In
						&nbsp;<i class="fa fa-chevron-circle-right"></i>
					</button>
				</div>
			</div>
			<!-- /Buttons -->
			<div class="col-lg-11 txtcenter mrgt30 pdr0">
				<label>&copy; Supplier Services  &nbsp;2020 &nbsp;Version &nbsp;1.0</label>
			</div>
            <%--<div class="col-lg-12 mrgt30 pdr0">
				<div class="form-group pull-right">
					<button type="button" class="btn btn-save" id="btnSubmit" onclick="LoginClick();">Log In
						&nbsp;<i class="fa fa-chevron-circle-right"></i>
					</button>
				</div>
			</div>--%>
			<!-- /Buttons -->
		</div>
    </form>
</div>
	<!-- Validation JS -->
	<script src="<%=ConfigurationManager.AppSettings["url"] %>js/jquery.validate.js"></script>
	
		<!-- Validation -->
		<script>
		    $(document).ready(function () {
                //$('#btnSubmit').click(function () {
                //    LoginClick();
                //});
		        $("#userregi").validate({
		            rules: {
		                user: {
		                    required: true
		                },
		                password: {
		                    required: true
		                }
		            },
		            messages: {
		                user: {
		                    required: "Enter Username"
		                },
		                password: {
		                    required: "Enter Password"
		                }
		            }
		        });
		        $('#btnSubmit').click(function () {
		            $("#userregi").valid();
		        });
		    });
        </script>
		<!-- End of Validation -->

</body>
</html>
