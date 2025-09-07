<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportList.aspx.cs" Inherits="apa_pack.Reports.ReportList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    

        <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>      
    <script src="http://someothersite.com/external.js"></script>
    <link href="../css/home.css" rel="stylesheet" />


     <style type="text/css">
 
    #AccAddicon{
       /* font-size: 25px;
        padding:0px;
        margin-left: -30px;*/
       letter-spacing: 05px;
    }
    #AccAddBun{
        height:25px;
        width: 100px;
        padding:0px;
        margin-top: 10px;
        margin-left:80px;
        text-indent: -2px;
        border-radius:3px;
        font-size: small;
        transition:transform 0.2s ease;
    }
    #AccAddBun:active{
        transform:scale(0.96);
    } 
  

    #main{
        /*align-items:center;
        align-content:center;
        align-self:center;*/
        vertical-align: middle;
    }





    #main_sub2_div {
        height: 42px;
        background-color: white;
        margin-top: 00px;
    }

    #main_sub2_div h4 {
        color: #0b132b;
        font-family: fantasy;
        text-align: center;
        margin-top: 10px;
        letter-spacing: 0px;
    }




    #tablecontainerdiv1
    {
        display:flex;
        background-color:white;
        padding:10px;
    }
    #tablecontainerdiv2
    {
        display:flex;
        background-color:white;
        padding:10px;
    }
    #tablecontainerdiv3
    {
        display:flex;
        background-color:white;
        padding:10px;
    }
 
    .chaildContainerlogo 
    {
        margin:5px;
        height:200px;
        /*width:220px;*/
        flex-basis:15%;
        background-color:white;
        display:flex;
        padding:10px;
        flex-direction:column;
        color:black;
        flex-wrap:wrap;
        text-align:right;
        justify-content:center;
        align-items: end;
        flex-grow:0;
        /*word-spacing: 10px;*/
       

 
    }
    .chaildContainerlogo img{
        margin:5px;
    }
      
    .chaildContainerlink 
    {
        margin:5px;
        height:200px;
        /*width:250px;*/
        flex-basis:15%;
        background-color:white;
        display:flex;
        padding:10px;
        flex-direction:column;
        color:black;
        flex-wrap:wrap;
        text-align:left;
        justify-content:center;
        font-size: small;
        line-height: 1.9;

    }
    .chaildContainerexp{

         margin:5px;
        height:200px;
        /*width:450px;*/
        flex-basis:20%;
        background-color:white;
        display:flex;
        padding:10px;
        flex-direction:column;
        color:black;
        flex-wrap:wrap;
        text-align:left;
        justify-content:center;
        font-size: small;
        line-height: 1.9;
    }
    .chaildContainerrightlogo
    {
        margin:5px;
        height:200px;
        /*width:120px;*/
        flex-basis:5%;
        background-color:white;
        display:flex;
        padding:10px;
        flex-direction:column;
        color:black;
        flex-wrap:wrap;
        text-align:right;
        justify-content:center;
        align-items: end;
        flex-grow:0;

    }
    .chaildContainerrightlogo img{
        margin:5px;
    }
    .chaildContainerrightlink 
    {
        margin:5px;
        height:200px;
        /*width:250px;*/
        flex-basis:15%;
        background-color:white;
        display:flex;
        padding:10px;
        flex-direction:column;
        color:black;
        flex-wrap:wrap;
        text-align:left;
        justify-content:center;
        font-size: small;
        line-height: 1.9;
    }
    .chaildContainerrightexp{

         margin:5px;
        height:200px;
        /*width:450px;*/
        flex-basis:30%;
        background-color:white;
        display:flex;
        padding:10px;
        flex-direction:column;
        color:black;
        flex-wrap:wrap;
        text-align:left;
        justify-content:center;
        font-size: small;
        line-height: 1.9;
    }
 

</style>



<script type="text/javascript">


    function CallPage() {

        Retvals = window.open("../Reports/AddNewProduct.aspx?", null, "width=800,height=500");

        Retvals.moveTo((window.screen.width / 2) - (700 / 2), (window.screen.height / 2) - (500 / 2));
    }


</script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="background-color:white;">
        <div id="main" class="col-md-12">

            <%--MAIN--%>
            <div class="row border-bottom">
                <div id="main_sub2_div" class="col-md-12 bg-light">

                    <h4>Reports </h4>

                </div>
            </div>

            <div class="row border-bottom">
                <div id="container_div" class="col-md-12" style="background-color: white;">

                    <div id="tablecontainerdiv" style="display: flex;">
                        <table class="table table-borderless" style="text-align: center;">
                       
                            <tbody>
                                <tr>
                                    <%--  <th scope="row">1</th>--%>
                                    <td style="text-align: left; width: 300px; background-color: white;"></td>
                                    <td style="text-align: left; width: 300px; background-color: white;"></td>
                                    <td style="text-align: left; width: 300px; background-color: white;"></td>
                                </tr>

                            </tbody>
                        </table>
                        <table class="table table-borderless" style="text-align: center;">
                      
                            <tbody>
                                <tr>
                                    <%--  <th scope="row">1</th>--%>
                                    <td style="text-align: left; width: 300px; background-color: white;"></td>
                                    <td style="text-align: left; width: 300px; background-color: white;"></td>
                                    <td style="text-align: left; width: 300px; background-color: white;"></td>
                                </tr>

                            </tbody>
                        </table>
                        <table class="table table-borderless" style="text-align: center;">
                             
                            <tbody>
                                <tr>
                                    <%--  <th scope="row">1</th>--%>
                                    <td style="text-align: left; width: 300px; background-color: white;"></td>
                                    <td style="text-align: left; width: 300px; background-color: white;"></td>
                                    <td style="text-align: left; width: 300px; background-color: white;"></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
 

            <%--User Access Masters--%>

             <div class="row border-bottom">
                    <div id="container_div1" class="col-md-12" style="background-color:white;">

                        <div id="tablecontainerdiv1">

                            <div class="chaildContainerlogo">
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/support.png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/production.png" width="15" height="15" />
                                  
                            </div>
                            <div class="chaildContainerlink">

                                 <a href="#" onclick="CallPage()" >Login Master</a>
                                 <a href="#">Engineer Master</a>
                                 <a href="#">Customer Login Master </a>
                                <a href="#">User Privilege Master </a>
                                <a href="#">Customer Login Master </a>
                                <a href="#">User Privilege Master </a>
                                

                            </div>
                            <div class="chaildContainerexp">

                                <span>Creating logins for users</span>
                                 <span>Create Engineer details</span>
                                 <span>Create and manage the Customer Logins </span>
                                <span>User Privilege Master </span>
                                <span>Customer Login Master </span>
                                <span>User Privilege Master </span>

                            </div>
                             <div class="chaildContainerrightlogo">
                               <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/support.png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/production.png" width="15" height="15" />
                            </div>

                            <div class="chaildContainerrightlink">
                                <a href="#">Principal Master</a>
                                 <a href="#">Product Master</a>
                                 <a href="#">Parts Master </a>
                                <a href="#">Status / Sub Status Master </a>
                                <a href="#">One Line Master </a>
                                <a href="#">Sub Status Group Master </a>
                            </div>

                            <div class="chaildContainerrightexp">
                                <span>Create New Principal</span>
                                 <span>Create and manage Product details</span>
                                 <span>Create and manage the Part Masters </span>
                                <span>Configure Substatus depends on status </span>
                                <span>Create and Manage [Key] fields. </span>
                                <span>Create Sub Status Group Master</span>
                            </div>
                         
                        </div>

                    </div>
                </div>





             <div class="row border-bottom">
                    <div id="container_div2" class="col-md-12" style="background-color:white;">

                         <div id="tablecontainerdiv2">

                            <div class="chaildContainerlogo">
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/support.png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/production.png" width="15" height="15" />
                                  
                            </div>
                            <div class="chaildContainerlink">

                                 <a href="#">Login Master</a>
                                 <a href="#">Engineer Master</a>
                                 <a href="#">Customer Login Master </a>
                                <a href="#">User Privilege Master </a>
                                <a href="#">Customer Login Master </a>
                                <a href="#">User Privilege Master </a>
                                

                            </div>
                            <div class="chaildContainerexp">

                                <span>Login Master</span>
                                 <span>Engineer Master</span>
                                 <span>Customer Login Master </span>
                                <span>User Privilege Master </span>
                                <span>Customer Login Master </span>
                                <span>User Privilege Master </span>

                            </div>
                             <div class="chaildContainerrightlogo">
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/support.png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/production.png" width="15" height="15" />
                            </div>

                            <div class="chaildContainerrightlink">
                                <a href="#">Login Master</a>
                                 <a href="#">Engineer Master</a>
                                 <a href="#">Customer Login Master </a>
                                <a href="#">User Privilege Master </a>
                                <a href="#">Customer Login Master </a>
                                <a href="#">User Privilege Master </a>
                            </div>

                            <div class="chaildContainerrightexp">
                                <span>Login Master</span>
                                 <span>Engineer Master</span>
                                 <span>Customer Login Master </span>
                                <span>User Privilege Master </span>
                                <span>Customer Login Master </span>
                                <span>User Privilege Master </span>
                            </div>
                         
                        </div>

                    </div>
                </div>




            <div class="row border-bottom">
                     <div id="tablecontainerdiv3">

                            <div class="chaildContainerlogo">
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/support.png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/production.png" width="15" height="15" />
                                  
                            </div>
                            <div class="chaildContainerlink">

                                 <a href="#">Login Master</a>
                                 <a href="#">Engineer Master</a>
                                 <a href="#">Customer Login Master </a>
                                <a href="#">User Privilege Master </a>
                                <a href="#">Customer Login Master </a>
                                <a href="#">User Privilege Master </a>
                                

                            </div>
                            <div class="chaildContainerexp">

                                <span>Login Master</span>
                                 <span>Engineer Master</span>
                                 <span>Customer Login Master </span>
                                <span>User Privilege Master </span>
                                <span>Customer Login Master </span>
                                <span>User Privilege Master </span>

                            </div>
                             <div class="chaildContainerrightlogo">
                                 <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/support.png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/production.png" width="15" height="15" />
                            </div>

                            <div class="chaildContainerrightlink">
                                <a href="#">Login Master</a>
                                 <a href="#">Engineer Master</a>
                                 <a href="#">Customer Login Master </a>
                                <a href="#">User Privilege Master </a>
                                <a href="#">Customer Login Master </a>
                                <a href="#">User Privilege Master </a>
                            </div>

                            <div class="chaildContainerrightexp">
                                <span>Login Master</span>
                                 <span>Engineer Master</span>
                                 <span>Customer Login Master </span>
                                <span>User Privilege Master </span>
                                <span>Customer Login Master </span>
                                <span>User Privilege Master </span>
                            </div>
                         
                        </div>
                </div>
         
             
  



        </div>
    </div>

      
     <%--HIDDEN FIELD--%>
    <%-- <asp:HiddenField id="hdnAccCode" runat="server" />--%>

     <input type="hidden" id="hdnAccCode"  />


</asp:Content>
