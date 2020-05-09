<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AssignmentNew.Views.Login" %>

<!DOCTYPE html>
<link href="../Content/Our_Styling/Login_Register.css" rel="stylesheet" />
<link href="../Content/Our_Styling/MontserratFont.css" rel="stylesheet" />
<script src="../Scripts/jquery-3.4.1.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: black; font-family: 'Montserrat'">
    <form id="form1" method="post" runat="server">
        <div class="backgroundDiv backgroundDiv_Animate">
            <h2 style="color: white; padding-left: 4%; padding-top: 3%;">Don't have an account? </h2>
            <p style="color: white; padding-left: 4%;">Sign up <a href="Register.aspx" style="text-decoration:none; color: orangered">here </a> </p>

        </div>
        <div>
            <h1 style="padding-left: 5%; padding-top: 3%; color: orangered;">LOGIN</h1>

            <div class="seperateInputs">
                <asp:TextBox ID="UserName" CausesValidation="true" type="text" placeholder="Username" runat="server" ValidationGroup="LoginFrame" ></asp:TextBox>
            </div>

            <div class="seperateInputs">
                <input id="Password1" type="password" name="UserPassword" placeholder="Password"  />
            </div>

            <input class="SubmitButton" style="vertical-align: middle" id="Submit1" type="submit" value="submit" ValidationGroup="LoginFrame"  />
        </div>
<asp:requiredfieldvalidator Display="Dynamic" SetFocusOnError="true" runat="server" errormessage="" ControlToValidate="UserName" ValidationGroup="LoginFrame"  ></asp:requiredfieldvalidator>

    </form>



    <script>
        $(document).ready(function () {
            if ('<%= Request.Cookies["PagePostedBack"].Value%>' == 'True') {
                $(".backgroundDiv").removeClass("backgroundDiv_Animate");
                $(".backgroundDiv").addClass("backgroundDiv_FailedLogin");
            }
            else {
                  $(".backgroundDiv").removeClass("backgroundDiv_FailedLogin");
                $(".backgroundDiv").addClass("backgroundDiv_Animate");
            }
        });
    </script>
</body>

</html>
