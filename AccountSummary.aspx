<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccountSummary.aspx.cs" Inherits="apa_pack.AccountSummary" %>
 
 
 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <%--boostrap icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"/>

    <link rel="stylesheet" href="css/home.css"/>
     <link href="css/CommonStyles.css" rel="stylesheet" />

 
            <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>      
    <script src="http://someothersite.com/external.js"></script>




    <style type="text/css">


        body {
            font-family: poppins;
            font-size: medium;
            /*font-weight:bold;*/
        }


        .form-group{
            padding-top:2px;
            
        }

        .Actioncolumn {
            display: flex !important;
            color: #0d6efd;
            gap: 5px;
            text-align: center;
            vertical-align: middle;
            justify-content: center;
            cursor:pointer;
             
        }
         
        
        
    </style>


    <script type="text/javascript">

        function load() {

             //alert(document.getElementById("hdnFrom").value)
            
                
            
        }


 

        function EditAccountscreen(From) {

            //alert(document.all.hdnAccCode1.value)
     
            //Retvals = window.open("../EditAccount.aspx?AccCode=" + AccCode, null, "width=1300,height=700");
            //Retvals.moveTo((window.screen.width / 2) - (1200 / 2), (window.screen.height / 2) - (600 / 2));

            var URL = "../EditAccount.aspx?AccCode=" + document.all.ContentPlaceHolder1_hdnAccCode1.value + "&From=" + From;
            window.location = URL;

            
 

        }
        function ContAddscreen(From) {

             
            var URL = "../AddContack.aspx?AccCode=" + document.all.ContentPlaceHolder1_hdnAccCode1.value + "&From=" + From;
            //window.location = URL ;
            $('#objContactScreen').attr("src", URL);
            $('#objContactModal').modal('show');
 
        }

        function EditCont(ContCode) {


            var URL = "../AddContack.aspx?AccCode=" + document.all.ContentPlaceHolder1_hdnAccCode1.value + "&ContCode=" + ContCode + "&From=EditCont";
            //window.location = URL;

            $('#objContactScreen').attr("src", URL);
            $('#objContactModal').modal('show');
        }



        function CallBackPage() {

            var URL = "../Account.aspx";
            window.location = URL;
        }



    </script>

</asp:Content>


    

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<body onload="load()">

 
    <div style="background-color: #eceeef; padding: 0px;">
        <div id="main" class="col-md-12">

            <div class="container-fluid">


                <div class="row border-bottom" style="padding: 10px 10px;">
                    <div id="main_sub2_div" class="col-md-12 bg-light">


                        <div class="col-4 BarObjactsLeft">
                            <span>
                                <a href="#" onclick="CallBackPage()">
                                    <img src="../images/Back.svg" style="cursor: pointer;" />
                                </a>
                            </span>
                            Account Summary
                        </div>

                        <div class="col-8 BarObjactsRight">

                            <span>
                                <button id="AccountEditBtn" class="btn btn-outline-dark CommonButton_Auto" type="button" onclick="EditAccountscreen('AccSummary')">
                                    <img src="../images/Edit.svg" style="cursor: pointer;" />
                                    Edit </button>
                            </span>
                            <span><%--letter-spacing: 05px;--%>
                                <button id="AddContBtn" class="btn btn-outline-warning CommonButton" type="button" onclick="ContAddscreen('AccSummary')">
                                    <img src="../images/Add.svg" style="cursor: pointer; color: #78350f" />
                                    Add Contact </button>
                                <%--<button class="btn btn-primary" type="button">
                                            <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
                                            <span class="visually-hidden" role="status">Loading...</span>
                                        </button>
                                        <button class="btn btn-primary" type="button">
                                            <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
                                            <span role="status">Loading...</span>
                                        </button>--%>
                            </span>
                            <span>
                                <img src="../images/ShortCut.svg" style="cursor: pointer;" /></span>

                            <span>
                                <img src="../images/Refresh.svg" style="cursor: pointer;" /></span>
                        </div>



                    </div>
                </div>


                <%-- script manager for grid updatepanel --%>
                <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>--%>



                <%--Account Detail--%>
                <fieldset id="AccinfoField" style="border: solid 0px red;">



                    <div class="scrollable-content" style="background:#fff;border:solid 0px red;">

                        <div class="accordion" id="accordionExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button fw-bold BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Account info
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample1">
                                    <div class="accordion-body">



                                        <div class="container-fluid">


                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">*</span> Account</div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <input type="text" id="txtAccount" name="txtAccount" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                </div>

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">*</span> Site </div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <input type="text" id="txtSite" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                </div>

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">*</span> Site ID</div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <input type="text" id="txtSiteID" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                </div>


                                            </div>


                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">*</span> Account Type</div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <input type="text" id="txtAccountType" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                </div>

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Industry </div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <input type="text" id="txtIndustry" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                </div>

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>SGST</div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <input type="text" id="txtSGSTIN" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                </div>

                                            </div>


                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">*</span> Start Date</div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <input type="text" id="txtStartDate" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                </div>

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Customer Type </div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <input type="text" id="txtCustomerType" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                </div>

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Synonyms</div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <input type="text" id="txtSynonyms" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                </div>

                                            </div>

                                            <div class="form-group row">



                                                <div class="col-sm-10 col-md-8 col-lg-8 form-text" align="left">

                                                    <div class="row">
                                                        <div class="col-sm-2 col-md-3 col-lg-3 form-lable" align="right"><span style="color: blue">*</span> Contact No</div>
                                                        <div class="col-sm-10 col-md-3 col-lg-3 form-text" align="left">
                                                            <input type="text" id="txtContactNo" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                        </div>

                                                        <div class="col-sm-2 col-md-3 col-lg-3 form-lable" align="right"><span style="color: blue"></span></div>
                                                        <div class="col-sm-10 col-md-3 col-lg-3 form-text" align="left">
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-2 col-md-3 col-lg-3 form-lable" align="right"><span style="color: blue"></span></div>
                                                        <div class="col-sm-10 col-md-3 col-lg-3 form-text" align="left">
                                                        </div>

                                                        <div class="col-sm-2 col-md-3 col-lg-3 form-lable" align="right"><span style="color: blue"></span></div>
                                                        <div class="col-sm-10 col-md-3 col-lg-3 form-text" align="left">
                                                        </div>
                                                    </div>


                                                </div>

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Comments </div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <textarea id="txtAComments" rows="3" runat="server" class="formcontrol_Area_Read form-control-sm" readonly="readonly"></textarea>
                                                </div>

                                            </div>





                                        </div>


                                    </div>
                                </div>

                                <%------------- Address Info--%>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo">
                                        <button class="accordion-button collapsed fw-bold BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Address Info
                                        </button>
                                    </h2>
                                    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample2">
                                        <div class="accordion-body">

                                            <div class="accordion-body">

                                                <div class="form-group row">

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Address</div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtAddress" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Pincode </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtPincode" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>City </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtCity" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>

                                                </div>


                                                <div class="form-group row">

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>State</div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtState" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Area </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtArea" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue"></span></div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <%-- ----------- Area Info--%>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingThree">
                                        <button class="accordion-button collapsed fw-bold BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            Area Info
                                        </button>
                                    </h2>
                                    <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample3">
                                        <div class="accordion-body">


                                            <div class="accordion-body">

                                                <div class="form-group row">

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Region </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtRegion" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Location </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtLocation" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Group Leader </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtGropLeader" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>

                                                </div>



                                                <div class="form-group row">

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Accessibility </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtAccessibility" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Accessibility Time From </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtAccessibilityTimeFrom" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">* </span>Accessibility Time To </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtAccessibilityTimeTo" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>



                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingFour">
                                        <button class="accordion-button collapsed fw-bold BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                            Contact Info
                                        </button>
                                    </h2>
                                    <div id="collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingFour" data-bs-parent="#accordionExample4">
                                        <div class="accordion-body">



                                            <div class="form-group row">


                                                <div class="col-sm-12 col-md-12 col-lg-12 form-text" align="center">

                                                    <div class="container-fluid">
                                                        <asp:GridView ID="GridViewContDetail" Style="" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover custom-grid" AutoGenerateColumns="false"
                                                            DataKeyNames="ContCode" EmptyDataText="There are no data records to display." HeaderStyle-BackColor="#FFDB7A" RowStyle-BackColor="#ffffff" AllowPaging="true" Height="0%">
                                                            <Columns>

                                                                <asp:TemplateField HeaderStyle-ForeColor="black" ControlStyle-CssClass="Actioncolumn" HeaderStyle-Font-Bold="true" HeaderText="">
                                                                    <ItemTemplate>

                                                                        <span><a runat="server" class="Actioncolumn" font-size="Small" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" text='Edit' navigateurl="#" onclick='<%# "javascript:EditCont(\"" +  Eval("ContCode")  +  "\");return false; " %>'>
                                                                            <img src="../images/EditCommon.svg" width="20" height="20" style="margin-top: -5px;" />
                                                                            Edit </a></span>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField HeaderText="Contact Name" HeaderStyle-ForeColor="black" ItemStyle-VerticalAlign="Middle" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" DataField="Name" ItemStyle-Width="200px" />
                                                                <asp:BoundField HeaderText="Department" HeaderStyle-ForeColor="black" ItemStyle-VerticalAlign="Middle" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" DataField="Department" />
                                                                <asp:BoundField HeaderText="Designation" HeaderStyle-ForeColor="black" ItemStyle-VerticalAlign="Middle" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" DataField="Designation" />
                                                                <asp:BoundField HeaderText="Mobile No" HeaderStyle-ForeColor="black" ItemStyle-VerticalAlign="Middle" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" DataField="MobileNo" />
                                                                <asp:BoundField HeaderText="Email" HeaderStyle-ForeColor="black" ItemStyle-VerticalAlign="Middle" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" DataField="Email" />
                                                                <asp:BoundField HeaderText="City" HeaderStyle-ForeColor="black" ItemStyle-VerticalAlign="Middle" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" DataField="City" />
                                                                <asp:BoundField HeaderText="State" HeaderStyle-ForeColor="black" ItemStyle-VerticalAlign="Middle" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" DataField="State" />

                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>

                                                </div>


                                            </div>


                                        </div>
                                    </div>
                                </div>




                            </div>

                        </div>

                    </div>



                </fieldset>















                <%--FOOTER ROW--%>

                <%--<div class="row">
                <div id="food" class="col-md-12 border">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>--%>



                <!-- Modal -->
                <div class="modal fade" id="objContactModal" role="dialog">

                    <div class="modal-dialog Contact-content" style="width: 90%;">

                        <!-- Modal content-->
                        <div class="modal-content Contact-content" style="min-width: 1300px; width: auto; height: 700px; margin-left: -400px; margin-top: 100px; border: 3px solid #78350f; border-radius: 5px;">
                            <div class="modal-body Contact-body">
                                <div style="text-align: right;">
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="border: none; background-color: white; height: 25px; width: 25px;">
                                        <img src="../images/Cancel.png" width="25" height="25" style="margin-left: -10px;" />
                                    </button>
                                </div>


                                <iframe id="objContactScreen" src="" style="width: 100%; border-width: 0px; height: 90%; display: block; margin-top: 2px;" scrolling="no">Your browser doesn’t support the object tag. 
                                </iframe>

                            </div>
                        </div>

                    </div>
                </div>
                <!-- Modal -->


                <%--Hidden Field--%>

                <asp:HiddenField ID="hdnAccCode1" runat="server" />
                <asp:HiddenField ID="hdnFrom" runat="server" />



            </div>


        </div>
    </div>

 
</body>

</asp:Content>


