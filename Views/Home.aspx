<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AssignmentNew.Views.Home" %>


<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="../Content/Our_Styling/animations.css" rel="stylesheet" />
    <link href="../Content/Our_Styling/style.css" rel="stylesheet" />
    <link href="../Content/Our_Styling/MediaStyle.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script type="text/javascript" src="JS/jquery-ui.js"> </script>

</head>
<body>
    <form id="Home" runat="server">

        <div class="nav HomeNav">
            <input type="checkbox" id="nav-check">
            <div class="nav-header">
                <div class="nav-title">
                    Home
                </div>
            </div>
            <div class="nav-btn">
                <label for="nav-check">
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
            </div>

            <div class="nav-links">
                <a class="Register" href="#">About Me</a>
                <a href="login.aspx">Login</a>
            </div>
        </div>
        <div id="WelcomeDiv">
            <div id="WelcomeText" style="position: relative">
                Hey There!
                <br />
                Login in <a href="login.aspx">here </a>to view our product
            </div>
        </div>

    </form>
</body>
</html>
