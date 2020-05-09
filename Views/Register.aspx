<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AssignmentNew.Views.Register" %>

<!DOCTYPE html>
<link href="../Content/Our_Styling/Login_Register.css" rel="stylesheet" />
<link href="../Content/Our_Styling/MontserratFont.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="../Scripts/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: black; font-family: 'Montserrat'">
    <form id="form1" method="post" runat="server">

        <div class="backgroundDiv backgroundDiv_Animate">
            <h2 style="color: white; padding-left: 4%; padding-top: 3%; font-size:1vw;">Already have an account? </h2>
            <p style="color: white; padding-left: 4%;font-size:1vw;">Click <a href="login.aspx" style="text-decoration:none; color: orangered">here </a> to login </p>

        </div>

        <h1 style="padding-left: 5%; padding-top: 3%; color: orangered;">REGISTER</h1>


        <div id="RegistrationForm1" style="position: absolute; width: 100%; height: 70%;">
            <div class="seperateInputs">
                <asp:TextBox ID="UserName" type="text" placeholder="Username" runat="server"></asp:TextBox>
            </div>

            <div class="seperateInputs">
                <input id="Password1" type="password" name="UserPassword" placeholder="Password" />
            </div>
          
            <input class="SubmitButton" id="Button1" onclick="SwipeDiv('RegistrationForm1', 'RegistrationForm2')" type="button" value="Next" />
        </div>

        <div id="RegistrationForm2" style="position: absolute; width: 100%; height: 70%;">
            <div class="seperateInputs">
                <asp:TextBox ID="FirstName" type="text" placeholder="First Name" runat="server"></asp:TextBox>
            </div>

            <div class="seperateInputs">
                <asp:TextBox ID="LastName" type="text" placeholder="Last Name" runat="server"></asp:TextBox>
            </div>
              <i onclick="SwipeBackDiv('RegistrationForm1', 'RegistrationForm2')" class="fa fa-angle-double-left" style="  font-size: 41px;
    margin-left: 8%;
    cursor: pointer;
        position: ABSOLUTE;
    color: orangered;
    bottom: 12%;"></i>

            <input class="SubmitButton" id="Button2" onclick="SwipeDiv('RegistrationForm2', 'RegistrationForm3')" type="button" value="Next" />
        </div>

        <div id="RegistrationForm3" style="position: absolute; width: 100%; height: 70%;">
            <div class="seperateInputs">
                <asp:TextBox ID="Email" type="text" placeholder="Email" runat="server"></asp:TextBox>
            </div>

            <div class="seperateInputs">
                <asp:TextBox ID="Number" type="text" placeholder="Mobile Number" runat="server"></asp:TextBox>
            </div>

            <i onclick="SwipeBackDiv('RegistrationForm2', 'RegistrationForm3')" class="fa fa-angle-double-left" style="  font-size: 41px;
    margin-left: 8%;
    cursor: pointer;
position: ABSOLUTE;
    color: orangered;
    bottom: 12%;"></i>
            <input class="SubmitButton" id="Button3" onclick="SwipeDiv('RegistrationForm3', 'RegistrationForm4')" type="button" value="Next" />

        </div>

        <div id="RegistrationForm4" style="position: absolute; width: 100%; height: 70%;">
            <div id="RadioButtonGender" style="margin-left: 5%; margin-top: -5%">
                <h3 style="margin-bottom: 3%">Gender: </h3>
                <asp:RadioButtonList ID="RadioButtonList1" RepeatDirection="Horizontal" CssClass="spaceOutButtons" runat="server">
                    <asp:ListItem Selected="False" Value="m">Male</asp:ListItem>
                    <asp:ListItem Selected="True" Value="f">Female</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div id="OccupationDropDown" style="margin-left: 5%; margin-top: 8%">
                <h3 style="margin-bottom: 3%">Occupation: </h3>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="1" Selected="True">Student</asp:ListItem>
                    <asp:ListItem Value="2">Working Professional</asp:ListItem>
                    <asp:ListItem Value="3">Self - Employed</asp:ListItem>
                    <asp:ListItem Value="4">Retired</asp:ListItem>
                </asp:DropDownList>
            </div>
                     <i onclick="SwipeBackDiv('RegistrationForm3', 'RegistrationForm4')" class="fa fa-angle-double-left" style="  font-size: 41px;
    margin-left: 8%;
    cursor: pointer;
position: ABSOLUTE;
    color: orangered;
    bottom: 12%;"></i>
            <input class="SubmitButton" style="vertical-align: middle" id="Subdmit1" type="submit" value="submit" />
        </div>
    </form>


        <script>
        $(document).ready(function () {
            $("#RegistrationForm2").hide();
            $("#RegistrationForm3").hide();
            $("#RegistrationForm4").hide();
        })

            function SwipeBackDiv(DivToHide, DivToShow) {
  $("#" + DivToHide).show('slide', { direction: 'left' }, 1000);
                $("#" + DivToShow).hide('slide', { direction: 'right' }, 1000);
            }

        function SwipeDiv(DivToHide, DivToShow) {
            $("#" + DivToHide).hide('slide', { direction: 'left' }, 1000);
            $("#" + DivToShow).show('slide', { direction: 'right' }, 1000);
        }
    </script>
</body>

</html>
