<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Successfully.aspx.cs" Inherits="apa_pack.Successfully" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    

        <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>      
    <script src="http://someothersite.com/external.js"></script>

    <%-- --- FOR FONT FAMILY --%>

    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

    <%-- --- --%>

    <link href="css/home.css" rel="stylesheet" />
    <link href="css/CommonStyles.css" rel="stylesheet" />

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body class="bg-gray-100 justify-center min-h-screen" style="background:#fff;">




        <div class="row border-bottom" style="padding: 10px 10px;">
            <div id="main_sub2_div" class="col-md-12 bg-light">

                <div class="col-md-1 BarTitle">
                    Account
                </div>

                <div class="col-md-3 BarObjactsLeft">
                   <%-- <span>
                        <img src="../images/SwitchFull.svg" style="cursor: pointer;" /></span>--%>
                  <%--  <span>
                        <img src="../images/FilterNew.svg" style="cursor: pointer;" /></span>--%>
                </div>

                <div class="col-md-8 BarObjactsRight">
                     
                    <span>
                        <img src="../images/ShortCut.svg" style="cursor: pointer;" /></span>

                    <span>
                        <img src="../images/Refresh.svg" runat="server" style="cursor: pointer;" /></span>
                </div>


            </div>
        </div>



        <div class="bg-white rounded-2xl text-center" style="padding: 10rem 45rem;"> 

            <div class="flex justify-center mb-4">
                <div class="bg-yellow-100 p-1 rounded-full">
                    <img src="../images/SuccessTick.svg" height="80" width="80" runat="server" style="cursor: pointer;" />
                </div>
            </div>

            <h2 class="text-2xl font-semibold text-gray-800 mb-2">Successfully!</h2>
            <p class="text-gray-600 mb-4">The Ticket has been Created</p>
            <p class="text-gray-800 font-medium text-lg mb-6">
                Docket No: <span class="text-blue-600 font-bold">260225/104</span>
            </p>

            <div class="grid grid-cols-1 sm:grid-cols-3 gap-3 mb-4">
                <button class="bg-yellow-400 hover:bg-yellow-500 text-white font-semibold py-2 px-4 rounded-md">
                    Create New Request
                </button>
                <button class="bg-yellow-400 hover:bg-yellow-500 text-white font-semibold py-2 px-4 rounded-md">
                    Add Follow Up
                </button>
                <button class="bg-yellow-400 hover:bg-yellow-500 text-white font-semibold py-2 px-4 rounded-md">
                    Close Activity
                </button>
            </div>

            <button class="bg-red-400 hover:bg-red-500 text-white font-semibold py-2 px-4 rounded-md">
                Exit Window
            </button>

        </div>



        <%--Hidden Field--%>

        <asp:HiddenField ID="hdnCode" runat="server" />

    </body>


</asp:Content>
