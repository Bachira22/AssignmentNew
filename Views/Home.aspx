<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AssignmentNew.Views.Home" %>


<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="../Content/Our_Styling/animations.css" rel="stylesheet" />
    <link href="../Content/Our_Styling/style.css" rel="stylesheet" />
    <link href="../Content/Our_Styling/MediaStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

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

            <div class="nav-links" id="NavBarShortCuts">
             
            </div>
        </div>
        <div id="HomeTitle" style="color:white">
            <h1 style="    font-size: 8vh;
    margin-left: 4%;
    margin-top: 4%">Express Medical Supply
            <i class="fa fa-plus-square" style="font-size:60%;color:red"></i>
            </h1>

            </div>
        <div id="WelcomeDiv">
            <div id="WelcomeText" style="position: relative">
            We are currently living through some extraordinary times, where all of us are experiencing significant changes to our everyday lives. But even in the face of such extraordinary times, we can make a conscious choice to make the most of this situation – especially for those of us privileged enough to safely stay indoors at a place we can call home. Take advantage of this time to do some much-delayed house cleaning, expand your culinary mastery, or just bank more quality time with yourself or your loved ones. 
                <br/>
                <br/>
As it becomes even clearer just how infectious COVID-19 is, some shoppers have opted for the online orders. In this purpose, we have created this website in order to facilitate the lives of people. There’s no need to queue up to enter the medical stores and by just one click, your product reaches your doorstep.
<%--                  <br/><button onclick="changePage()" id="welcomeButton" class="fill AboutMe" ></button>--%>

            </div>
        </div>

    </form>

   <script type="text/javascript">

       jQuery(document).ready(function () {
           if ('<%= Session["IsUserLoggedIn"].ToString()%>' == 'False') {
               document.getElementById("NavBarShortCuts").innerHTML = '<a href="Register.aspx">Register</a> <a href="login.aspx">Login</a>';


           } else {
               document.getElementById("NavBarShortCuts").innerHTML = '<a href="Products.aspx">View Products</a><a href="Logout.aspx">Logout</a>';

           }
       });


        </script>

</body>
</html>
