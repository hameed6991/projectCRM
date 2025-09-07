<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterList.aspx.cs" Inherits="apa_pack.Master.MasterList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    

        <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>      
    <script src="http://someothersite.com/external.js"></script>
    <link href="../css/home.css" rel="stylesheet" />
    <link href="css/Masterlist.css" rel="stylesheet" />
    <link href="../css/CommonStyles.css" rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" >



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
        /*justify-content:center;*/
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
       /* justify-content:center;*/
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
        /*justify-content:center;*/
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
        /*justify-content:center;*/
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
        /*justify-content:center;*/
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
        /*justify-content:center;*/
        font-size: small;
        line-height: 1.9;
    }
 

    /* Set Image */
.icon {
    width: 30px;
    height: 30px;
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center;
    border: none;
    background-color: transparent;
    cursor: pointer;
    transition: transform 0.2s ease;
}

/* Default background images */
.detail-btn {
    background-image: url("images/DetailMaster.svg");
}

.add-btn {
    background-image: url("images/AddMaster.svg");
}

/* Hover background images */
.detail-btn:hover {
    background-image: url("images/DetailMasterhover.svg");
    transform: scale(1.1);
}

.add-btn:hover {
    background-image: url("images/AddMasterhover.svg");
    transform: scale(1.1);
}

/* Hover on .master-box affects button inside */
.master-box:hover .detail-btn {
  background-image: url("images/DetailMasterhover.svg");
}

.master-box:hover .add-btn {
  background-image: url("images/AddMasterhover.svg");
}





 

</style>

    <script type="text/javascript">

        function CallPage() {
 
            Retvals = window.open("../Master/AddNewProduct.aspx?", null, "width=800,height=500");
 
            Retvals.moveTo((window.screen.width / 2) - (700 / 2), (window.screen.height / 2) - (500 / 2));
        }
 
        function OpenpopupModal(AccCode) {


        }


        function AddLogin(From) {
           
            var URL = "../Master/AddNewProduct.aspx?" + "From="+From;

            $('#objDetailsView').attr("src", URL);
            $('#DetailsModal').modal('show');
            
        }

        function DetailLogin(From) {
           
            var URL = "../Master/AddNewProduct.aspx?" + "From="+From;

            $('#objDetailsView').attr("src", URL);
            $('#DetailsModal').modal('show');

        }


        function AddEngineer(From) {
             
            if (From == "Add") {

                var URL = "../Master/AddEngineer.aspx?" + "From=" + From;

                $('#objDetailsView').attr("src", URL);
                $('#DetailsModal').modal('show');
            }
            else {

                var URL = "../Master/AddEngineer.aspx?" + "From=" + From;

                $('#objDetailsView').attr("src", URL);
                $('#DetailsModal').modal('show');
            }
            

        }


        function Closepopup(ReturnValue) {

            $('#objDetailsView').attr("src", "");
            $('#DetailsModal').modal('hide');
        }

    </script> 

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


       <div style="background-color:white;">
        <div id="main" class="col-md-12">

            <%--MAIN--%>
            <%--<div class="row border-bottom">
                <div id="main_sub2_div" class="col-md-12 bg-light">

                    <h4>Admin </h4>

                </div>
            </div>--%>

            <%--MAIN--%>
            <div class="row border-bottom" style="padding:10px 10px;">
                <div id="main_sub2_div" class="col-md-12 bg-light">

                    <div class="col-md-1 BarTitle">
                        Admin 
                    </div>

                    <div class="col-md-3 BarObjactsLeft">
                        
                    </div>

                    <div class="col-md-8 BarObjactsRight">
                        <span>
                             
                        </span>
                        <span>
                            <img src="../images/ShortCut.svg" style="cursor: pointer;" /></span>

                        <span>
                            <img src="../images/Refresh.svg" style="cursor: pointer;" /></span>
                    </div>



                </div>
            </div>
             

            <div class="scrollable-content">
            <div class="containers py-0">

                <!-- Entity Masters -->
                <div class="section-box">
                    <div class="section-title">Entity Masters</div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box">
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/RegionMaster.svg" />
                                    </div>
                                    <div class="master-name">Region Master</div>
                                </div>
                                <div class="icon-group">
                                    <button class="icon detail-btn"></button>
                                    <button class="icon add-btn"></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box">
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/VendorMaster.svg" /></div>
                                    <div class="master-name">Vendor Master</div>
                                </div>
                                <div class="icon-group">
                                    <button class="icon detail-btn"></button>
                                    <button class="icon add-btn"></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box">
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/GroupLeaderMaster.svg" /></div>
                                    <div class="master-name">Group Leader Master</div>
                                </div>
                                <div class="icon-group">
                                    <button class="icon detail-btn"></button>
                                    <button class="icon add-btn"></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box"> 
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/EngineerMaster.svg" /></div>
                                    <div class="master-name">Engineer Master</div>
                                </div>
                                <div class="icon-group">
                                    <button class="icon detail-btn" onclick="AddEngineer('Details');return false;"></button>
                                    <button class="icon add-btn" onclick="AddEngineer('Add');return false;"></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box">
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/DinamicFieldMaster.svg" /></div>
                                    <div class="master-name">Dynamic Fields Master <%--<span class="badge-count">488</span>--%></div>
                                </div>
                                <div class="icon-group">
                                    <button class="icon detail-btn"></button>
                                    <button class="icon add-btn"></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box">
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/LocationMaster.svg" /></div>
                                    <div class="master-name">Location Master</div>
                                </div>
                                <div class="icon-group">
                                    <button class="icon detail-btn"></button>
                                    <button class="icon add-btn"></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box">
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/ColumnMaster.svg" /></div>
                                    <div class="master-name">Column Master (Search Engine)</div>
                                </div>
                                <div class="icon-group">
                                    <button class="icon detail-btn"></button>
                                    <button class="icon add-btn"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Account Masters -->
                <div class="section-box">
                    <div class="section-title">Account Masters</div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box">
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/AccountMaster.svg" /></div>
                                    <div class="master-name">Account Group Master</div>
                                </div>
                                <div class="icon-group">
                                    <button class="icon detail-btn"></button>
                                    <button class="icon add-btn"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- User Access Masters -->
                <div class="section-box">
                    <div class="section-title">User Access Masters</div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box">
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/LoginMaster.svg" />
                                    </div>
                                    <div class="master-name">Login Master </div>
                                </div>
                                <div class="icon-group">
                                    <button class="icon detail-btn" onclick="DetailLogin('Details');return false;"></button>
                                    <button class="icon add-btn" onclick="AddLogin('Add');return false;"  ></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box">
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/CustomerLoginMaster.svg" /></div>
                                    <div class="master-name">Customer Login Master</div>
                                </div>
                                <div class="icon-group">
                                    <button class="icon detail-btn"></button>
                                    <button class="icon add-btn"></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box">
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/UserPrivilegeMaster.svg" /></div>
                                    <div class="master-name">User Privilege Master</div>
                                </div>
                                <div class="icon-group">
                                   <button class="icon detail-btn"></button>
                                    <button class="icon add-btn"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Service Access Masters -->
                <div class="section-box">
                    <div class="section-title">Service Access Masters</div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="master-box">
                                <div class="Contant-group">
                                    <div class="master-Icon">
                                        <img src="images/ServiceAccessMaster.svg" /></div>
                                    <div class="master-name">Service Code Master</div>
                                </div>
                                <div class="icon-group">
                                    <button class="icon detail-btn"></button>
                                    <button class="icon add-btn"></button>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6">
                        <div class="master-box">
                            <div class="Contant-group">
                                <div class="master-Icon">
                                    <img src="images/UserPrivilegeMaster.svg" />
                                </div>
                                <div class="master-name">Product Master</div>
                            </div>
                            <div class="icon-group">
                                <button class="icon detail-btn"></button>
                                <button class="icon add-btn"  onclick="AddLogin();return false;"></button>
                            </div>
                        </div>
                    </div>

                    </div>
                     

                </div>



            </div>


                <div style="display:none;">
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

                    <%--    <div id="containerheaddiv1" style="color:black;"> <h1>Login</h1></div>--%>

                        <div id="tablecontainerdiv1">

                            <div class="chaildContainerlogo">
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/support.png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/Privilage.png" width="15" height="15" />
                                
                                  
                            </div>
                            <div class="chaildContainerlink">

                                 <a href="#">Login Master</a>
                                 <a href="#">Engineer Master</a>
                                 <a href="#">Customer Login Master </a>
                                <a href="#">User Privilege Master </a>
                              

                            </div>
                            <div class="chaildContainerexp">

                                <span>Creating logins for users</span>
                                 <span>Create Engineer details</span>
                                 <span>Create and manage the Customer Logins </span>
                                <span>User Privilege Master </span>
                                

                            </div>
                             <div class="chaildContainerrightlogo">
                               <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/product.png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/engineer (2).png" width="15" height="15" />
                                <img src="../images/Arrowhead.png" width="15" height="15" />
                                <img src="../images/production.png" width="15" height="15" />
                            </div>

                            <div class="chaildContainerrightlink">
                                <a href="#">Principal Master</a>
                                 <a href="" onclick="CallPage()">Product Master</a>
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
                                <img src="../images/newspaper.png" width="15" height="15" />
                                <img src="../images/mail-caution.png" width="15" height="15" />
                                <img src="../images/mail.png" width="15" height="15" />
                               
                                  
                            </div>
                            <div class="chaildContainerlink">

                                 <a href="#">Flash News Master</a>
                                 <a href="#">Alerts Master</a>
                                 <a href="#">Periodic Escalation Config </a>
                                
                                

                            </div>
                            <div class="chaildContainerexp">

                                <span>Configure Flash News Master</span>
                                 <span>Configure the settings for Email sending</span>
                                 <span>Configure the settings for sending escalation on periodic basis.</span>
                                 

                            </div>
                             <div class="chaildContainerrightlogo">
                                 <img src="../images/online Support.png" width="15" height="15" />
                                
                            </div>

                            <div class="chaildContainerrightlink">
                                <a href="#">Support Task Master</a>
                                
                            </div>

                            <div class="chaildContainerrightexp">
                                <span>Support Task</span>
                                
                            </div>
                         
                        </div>
                </div>

                    </div>
         
             </div>
   

        </div>
    </div>




    <%--Modal popup--%>


     <!-- Modal -->
            <div class="modal fade" id="DetailsModal" role="dialog"  >
       
                <div class="modal-dialog Details-content" style="width: 90%;">
 
                    <!-- Modal content-->
                    <div class="modal-content Details-content" style="width:1300px; height:700px;margin-left: -400px;margin-top: 100px;border: 3px solid #78350f;border-radius: 5px; ">
                        <div class="modal-body Details-body">
                            <div style="text-align: right;">
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="border:none;background-color:white; height:25px;width:25px;" >
                                 <img src="../images/Cancel.png" width="25" height="25" style="margin-left: -10px;" />
                            </button>
                                </div>

                            
                             
                            <iframe id="objDetailsView" src="" style="width: 100%; border-width: 0px; height: 90%;display:block;margin-top:2px;overflow:scroll;" >Your browser doesn’t support the object tag. 
                            </iframe>

                        </div>
                    </div>

                </div>
            </div>


      
     <%--HIDDEN FIELD--%>
    <%-- <asp:HiddenField id="hdnAccCode" runat="server" />--%>

     <input type="hidden" id="hdnAccCode"  />

</asp:Content>
