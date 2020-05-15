<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="AssignmentNew.Views.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="../Content/Our_Styling/super-panel.css" rel="stylesheet" />
    <link href="../Content/Our_Styling/Product.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script src="../Scripts/super-panel.js"></script>
    <link href="../Content/Our_Styling/accordion-menu.css" rel="stylesheet" />
    <script src="../Scripts/accordion-menu.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />


    <title></title>
</head>
<body onload="initializePage()">
    <form id="form1" runat="server" method="get">

        <header class="shadow p-3 mb-5 bg-white rounded">
            <span data-panel="panel1" id="pan-button" class="panel-button"></span>

        </header>


        <div>
            <span onclick="document.getElementById('id01').style.display='block'"><a style="margin-top: -3vh; right: 1vh; position: fixed; font-size: medium; cursor: pointer; text-decoration: none; color: black;">Account</a></span>
            <span><a style="margin-top: -3vh; right: 12vh; position: fixed; font-size: medium; cursor: pointer; text-decoration: none; color: black; border-right: 1px solid; padding-right: 3.5px"
                href="Logout.aspx">Logout</a></span>
            <span onclick="OpenSidePanel()"><a style="margin-top: -3vh; right: 22vh; position: fixed; font-size: medium; cursor: pointer; border-right: 1px solid; padding-right: 2.5px">Cart <i class="fa fa-shopping-cart" style="font-size: 24px"></i>
            </a>
                <span id="lblCartCount" style="margin-top: -3.3vh; right: 22.6vh; position: fixed;">0</span>
            </span>
        </div>


        <div id="panel1" style="background-color: white">
            <asp:TextBox ID="searchBar" runat="server" type="text" name="search" placeholder="Search.."></asp:TextBox>
            <button runat="server" id="SearchButton" type="submit"><i class="fa fa-search"></i></button>
            <h1 style="margin-top: 3vh; margin-left: 1vh; display: inline-block">In Cart</h1>
            <div id="accordion" style="margin-left: 1vh; margin-right: 1vh">
                <ul class="CartItems" id="AllListSide" style="pointer-events: none; margin-top: 1vh">
                </ul>
            </div>
            <div onclick="buildUpdatedList()" class="text" style="width: 40%; font-size: smaller; margin-top: 1vh; margin-left: 1vh; position: absolute;">
                Save Cart
            </div>
        </div>

        <div id="AllProductDisplay" style="margin-top: 2%; margin-left: 5%; width: 90%; height: 100%; display: grid; grid-template-columns: auto auto auto auto;">
        </div>

        <div id="id01" class="w3-modal w3-container w3-card-4 w3-light-grey" style="left: 25%; top: 25%; height: auto; width: 50%;">
            <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>

            <h2>Update Your Info</h2>

            <br />
            <label>First Name</label>
            <asp:TextBox ID="UpdateFirstName" CssClass="w3-input w3-border w3-round" runat="server"></asp:TextBox>
            <br />
            <label>Last Name</label>
            <asp:TextBox ID="UpdateLastName" CssClass="w3-input w3-border w3-round" runat="server"></asp:TextBox>
            <br />
            <label>Mobile Number</label>
            <asp:TextBox ID="UpdateMobileNumber" CssClass="w3-input w3-border w3-round" runat="server"></asp:TextBox>

            <asp:Button ID="UpdateButton" runat="server" Text="Update Info" OnClick="UpdateButton_Click" CssClass="UpdateButton" />
        </div>


    </form>

</body>
<script>
    function incrementCart(ItemName, ItemId) {
        document.getElementById("lblCartCount").innerHTML = parseInt(document.getElementById("lblCartCount").innerHTML) + 1;
        document.getElementById("ProductId" + ItemId).innerHTML = "Remove From cart";
        document.getElementById("ProductId" + ItemId).setAttribute('onclick', 'decrementCart("' + ItemName + '" ,"' + ItemId + '")');

        document.getElementById("AllListSide").innerHTML += "<li id= \"" + ItemId + "\" class= 'top'> <a>" + ItemName + "</a></li>";
    }

    function decrementCart(ItemName, ItemId) {
        document.getElementById(ItemId).remove();
        document.getElementById("ProductId" + ItemId).innerHTML = "Add To cart";
        document.getElementById("ProductId" + ItemId).setAttribute('onclick', 'incrementCart( "' + ItemName + '" ,"' + ItemId + '")');

        document.getElementById("lblCartCount").innerHTML = parseInt(document.getElementById("lblCartCount").innerHTML) - 1;
    }

    function OpenSidePanel() {
        document.getElementById("pan-button").click();
    }

    function initializePage() {
        document.getElementById("AllProductDisplay").innerHTML = '<%= Session["Products"].ToString()%>';
        document.getElementById("AllListSide").innerHTML = '<%= Session["ProductListInCart"].ToString()%>';

        getCount();
    }

    function getCount() {
        document.getElementById("lblCartCount").innerHTML = document.getElementsByClassName('top').length;
    }

    function buildUpdatedList() {
        var arr = [];
        var ItemsInCart = document.getElementsByClassName('top');

        for (var i = 0; i < ItemsInCart.length; i++) {
            arr.push(parseInt(ItemsInCart[i].id));
        }

        var myJson = JSON.stringify(arr);
        window.location = "Products.aspx?UpdatedVal=" + myJson;

    }
</script>
</html>
