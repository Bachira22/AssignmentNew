<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AssignmentNew.Views.Register" %>

<!DOCTYPE html>
<link href="../Content/Our_Styling/Login_Register.css" rel="stylesheet" />
<link href="../Content/Our_Styling/MontserratFont.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link href="../Content/Our_Styling/MontserratFont.css" rel="stylesheet" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: black; font-family: 'Montserrat'" onload="ToastOnload();">
    <form id="Registrationform" method="post" runat="server">

        <div class="RegisterbackgroundDiv RegisterbackgroundDiv_Animate">
            <h2 style="color: white; padding-left: 4%; padding-top: 3%; font-size: 1vw;">Already have an account? </h2>
            <p style="color: white; padding-left: 4%; font-size: 1vw;">Click <a href="login.aspx" style="text-decoration: none; color: orangered">here </a>to login </p>

        </div>

        <h1 style="padding-left: 1.5%; padding-top: 3%; color: orangered;">REGISTER</h1>


        <div style="width: 100%; height: 75%; display: grid; grid-template-columns: auto auto auto; grid-template-rows: 28% 28% 28% 16%;">
            <div style="border-right: 1px solid orangered;">
                <asp:TextBox ID="UserName" CssClass="RegistrationInputs" type="text" placeholder="Username*" runat="server"></asp:TextBox>

            </div>
            <div style="border-right: 1px solid orangered;">
                <asp:TextBox ID="UserPassword" CssClass="RegistrationInputs" type="Password" placeholder="Password*" runat="server"></asp:TextBox>

            </div>
            <div>
                <asp:TextBox ID="Email" CssClass="RegistrationInputs" type="text" placeholder="Email Address" runat="server"></asp:TextBox>

            </div>
            <div style="border-right: 1px solid orangered;">
                <asp:TextBox ID="FirstName" CssClass="RegistrationInputs" type="text" placeholder="First Name*" runat="server"></asp:TextBox>

            </div>
            <div style="border-right: 1px solid orangered;">
                <asp:TextBox ID="LastName" CssClass="RegistrationInputs" type="text" placeholder="Last Name*" runat="server"></asp:TextBox>

            </div>
            <div>
                <asp:TextBox ID="Address" CssClass="RegistrationInputs" type="text" placeholder="Address" runat="server"></asp:TextBox>

            </div>
            <div style="border-right: 1px solid orangered;">
                <asp:TextBox ID="MobileNumber" CssClass="RegistrationInputs" type="text" placeholder="Mobile Number" runat="server"></asp:TextBox>

            </div>
            <div style="border-right: 1px solid orangered;">
                <div id="RadioButtonGender" style="margin-left: 5%; margin-top: -5%">
                    <h3 style="margin-bottom: 3%">Gender: </h3>
                    <asp:RadioButtonList ID="SelectedRadioGender" RepeatDirection="Horizontal" CssClass="spaceOutButtons" runat="server">
                        <asp:ListItem Selected="False" Value="m">Male</asp:ListItem>
                        <asp:ListItem Selected="True" Value="f">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

            </div>
            
            <div>
                <div id="OccupationDropDown" style="margin-left: 5%; margin-top: -5%">
                    <h3 style="margin-bottom: 3%">Occupation: </h3>
                    <asp:DropDownList ID="SelectedDropDownOccupation" runat="server" CssClass="OccupationDropDown">
                        <asp:ListItem Value="1" Selected="True">Student</asp:ListItem>
                        <asp:ListItem Value="2">Working Professional</asp:ListItem>
                        <asp:ListItem Value="3">Self - Employed</asp:ListItem>
                        <asp:ListItem Value="4">Retired</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div></div>
            <div>
            </div>

            <div>
                <input class="RegisterSubmitButton" style="vertical-align: middle" id="Subdmit1" type="submit" value="submit" />
            </div>

        </div>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" ControlToValidate="UserName" ClientValidationFunction="validate" runat="server" Display="None" ErrorMessage="Username"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserPassword" ControlToValidate="UserPassword" ClientValidationFunction="validate" runat="server" Display="None" ErrorMessage="Password"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" ControlToValidate="FirstName" ClientValidationFunction="validate" runat="server" Display="None" ErrorMessage="FirstName"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" ControlToValidate="LastName" ClientValidationFunction="validate" runat="server" Display="None" ErrorMessage="LastName"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" ControlToValidate="Email" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" runat="server" Display="None" ErrorMessage="Invalid Email format"></asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobileNumber" ControlToValidate="MobileNumber" ValidationExpression="[0-9]{8}" runat="server" Display="None" ErrorMessage="Mobile Number needs to be 8 Numberic Characters"></asp:RegularExpressionValidator>
    </form>

    <!-- Toaster Html -->
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
  <script type="text/javascript">

        //remove Toast msg
         jQuery(document).ready(function () {
            jQuery('.toast__close').click(function (e) {
                e.preventDefault();
                $(".toast__container").removeClass("toastAppear");
                $(".toast__container").addClass("toastDisappear");
             
            });

       if ('<%= Request.Cookies["PagePostedBack"].Value%>' == 'True') {
                $(".RegisterbackgroundDiv").removeClass("RegisterbackgroundDiv_Animate");
                $(".RegisterbackgroundDiv").addClass("RegisterbackgroundDiv_FailedLogin");
            }
            else {
           $(".RegisterbackgroundDiv").removeClass("RegisterbackgroundDiv_FailedLogin");
           $(".RegisterbackgroundDiv").addClass("RegisterbackgroundDiv_Animate");
            }
        });

         function ToastOnload(error = '<%= Request.Cookies["LoginError"].Value%>',header = 'Register Failed',msg = '<%= Request.Cookies["LoginErrorMessage"].Value%>') {
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
