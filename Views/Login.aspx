<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AssignmentNew.Views.Login" %>

<!DOCTYPE html>
<link href="../Content/Our_Styling/Login_Register.css" rel="stylesheet" />
<link href="../Content/Our_Styling/MontserratFont.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="../Scripts/jquery-3.4.1.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: black; font-family: 'Montserrat'" onload="ToastOnload();">
    <form id="form1" method="post" runat="server">
        <div class="backgroundDiv backgroundDiv_Animate">
            <h2 style="color: white; padding-left: 4%; padding-top: 3%; font-size:3vh;">Don't have an account? </h2>
            <p style="color: white; padding-left: 4%; font-size:2.5vh;">Sign up <a href="Register.aspx" style="text-decoration: none; color: orangered">here </a></p>

        </div>
        <div>
            <h1 style="padding-left: 5%; padding-top: 3%; color: orangered;">LOGIN</h1>

            <div class="seperateInputs">
                <asp:TextBox ID="UserName" type="text" placeholder="Username" runat="server"></asp:TextBox>
            </div>

            <div class="seperateInputs">
                <asp:TextBox ID="UserPassword" type="Password" placeholder="password" runat="server"></asp:TextBox>
            </div>

            <input class="SubmitButton" style="vertical-align: middle" id="Submit1" type="submit" value="submit" />
        </div>
  <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" ControlToValidate="UserName" ClientValidationFunction="validate" runat="server" Display="None" ErrorMessage="Username"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserPassword" ControlToValidate="UserPassword" ClientValidationFunction="validate" runat="server" Display="None" ErrorMessage="Password"></asp:RequiredFieldValidator>

    </form>

        <div class="toast__container" id="ToastContainer" style="position: absolute;">
        <div class="toast__cell">
            <div class="toast toast--red">
                <div class="toast__icon">
                    <i class="fa fa-close" style="font-size: 24px; color: white; margin-left: -2px; margin-top: -4px;"></i>
                </div>
                <div class="toast__content">
                    <p class="toast__type" id="type"></p>
                    <p class="toast__message" id="msg"></p>
                </div>
                <div class="toast__close">
                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15.642 15.642" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 15.642 15.642">
                        <path fill-rule="evenodd" d="M8.882,7.821l6.541-6.541c0.293-0.293,0.293-0.768,0-1.061  c-0.293-0.293-0.768-0.293-1.061,0L7.821,6.76L1.28,0.22c-0.293-0.293-0.768-0.293-1.061,0c-0.293,0.293-0.293,0.768,0,1.061  l6.541,6.541L0.22,14.362c-0.293,0.293-0.293,0.768,0,1.061c0.147,0.146,0.338,0.22,0.53,0.22s0.384-0.073,0.53-0.22l6.541-6.541  l6.541,6.541c0.147,0.146,0.338,0.22,0.53,0.22c0.192,0,0.384-0.073,0.53-0.22c0.293-0.293,0.293-0.768,0-1.061L8.882,7.821z"></path>
                    </svg>
                </div>
            </div>

        </div>
    </div>
   
</body>
     <script>

     jQuery(document).ready(function () {
            jQuery('.toast__close').click(function (e) {
                e.preventDefault();
                $(".toast__container").removeClass("toastAppear");
                $(".toast__container").addClass("toastDisappear");
             
            });

              if ('<%= Request.Cookies["PagePostedBack"].Value%>' == 'True') {
                $(".backgroundDiv").removeClass("backgroundDiv_Animate");
                $(".backgroundDiv").addClass("backgroundDiv_FailedLogin");
            }
            else {
                  $(".backgroundDiv").removeClass("backgroundDiv_FailedLogin");
                $(".backgroundDiv").addClass("backgroundDiv_Animate");
            }});

         function ToastOnload(error = '<%= Request.Cookies["LoginError"].Value%>',header = 'Login Failed',msg = '<%= Request.Cookies["LoginErrorMessage"].Value%>') {
            if(error == 'True'){                 
                $(".toast__container").removeClass("toastDisappear");
                    $(".toast__container").addClass("toastAppear");
                    document.getElementById("type").innerHTML = header;
                    document.getElementById("msg").innerHTML = msg;
                }
            else{
                $(".toast__container").removeClass("toastDisappear");
                $(".toast__container").removeClass("toastAppear");

            }
          }

    </script>
</html>
