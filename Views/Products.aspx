<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="AssignmentNew.Views.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="../Content/Our_Styling/super-panel.css" rel="stylesheet" />
    <link href="../Content/Our_Styling/Product.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script src="../Scripts/super-panel.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <header class="shadow p-3 mb-5 bg-white rounded">
            <span data-panel="panel1" id="pan-button" class="panel-button"></span>
        </header>

        <div id="panel1">
            <div id="accordion">
                <ul class="AllMembers" id="AllListSide" style="pointer-events: none"></ul>
            </div>
        </div>
        <div id="AllProductDisplay" style="margin-top: 2%; margin-left: 5%; width: 90%; height: 100%; display: grid; grid-template-columns: auto auto auto auto;">
        </div>


    </form>
</body>
<script>
    document.getElementById("AllProductDisplay").innerHTML = '<%= Session["Products"].ToString()%>';
</script>
</html>
