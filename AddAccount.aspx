<%@ Page Title="Add Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="apa_pack.AddAccount"  %>

<%--<%@ MasterType VirtualPath="~/Site.Master" %>--%>
 <%--font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif--%>

 
<%--In order to remove a Master Page from one of your pages, you must do the following (if they apply):

stop : 1  Remove the [MasterPageFile] attribute form your Page directive.
stop : 2  Remove the [MasterType] directive.
stop : 3  Remove any [<asp:Content>] tags you have on the page.
stop : 4  Remove any references to the [Master]  property in your code behind (and rebuild!)

Also, any dependencies that exist in your Master Page will need to be moved down to your Page, such as a --%>
 
 

 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <%--boostrap icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />

     <%-- --- FOR FONT FAMILY --%>

    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

    <%-- --- --%>

    <link rel="stylesheet" href="css/home.css" />
    <link href="css/CommonStyles.css" rel="stylesheet" />

    <style type="text/css">

        body {
            font-family: 'Calibri','Gill Sans', 'Gill Sans MT', 'Trebuchet MS', sans-serif;
            font-size: medium;
            /*font-weight:bold;*/
        }

        .form-group{
            padding-top:2px;
            
        }

    </style>




    <script type="text/javascript">


        function FunValidation() {


            /* Account info */
            if (document.all.ContentPlaceHolder1_txtAccount.value == "") {
                alert("Account Can\'t be Empty")
                ContentPlaceHolder1_txtAccount.focus();
                return false;
            }

            if (document.all.ContentPlaceHolder1_DDAccountType.value == "") {
                alert("Account Type Can\'t be Empty")
                ContentPlaceHolder1_DDAccountType.focus();
                return false;
            }

            if (document.all.ContentPlaceHolder1_DDIndustry.value == "") {
                alert("Industry Can\'t be Empty")
                ContentPlaceHolder1_DDIndustry.focus();
                return false;
            }

            if (document.all.ContentPlaceHolder1_txtComments.value == "") {
                alert("Comments Can\'t be Empty")
                ContentPlaceHolder1_txtComments.focus();
                return false;
            }

            /* Address info */
            if (document.all.ContentPlaceHolder1_txtAddress.value == "") {
                alert("Address Can\'t be Empty")
                ContentPlaceHolder1_txtAddress.focus();
                return false;
            }

            if (document.all.ContentPlaceHolder1_txtPincode.value == "") {
                alert("Pincode Can\'t be Empty")
                ContentPlaceHolder1_txtPincode.focus();
                return false;
            }

            if (document.all.ContentPlaceHolder1_txtCity.value == "") {
                alert("City Can\'t be Empty")
                ContentPlaceHolder1_txtCity.focus();
                return false;
            }

            if (document.all.ContentPlaceHolder1_DDState.value == "") {
                alert("State Can\'t be Empty")
                ContentPlaceHolder1_DDState.focus();
                return false;
            }

            /* Area info */

            if (document.all.ContentPlaceHolder1_txtRegion.value == "") {
                alert("Region Can\'t be Empty")
                ContentPlaceHolder1_txtRegion.focus();
                return false;
            }

            if (document.all.ContentPlaceHolder1_txtLocation.value == "") {
                alert("Location Can\'t be Empty")
                ContentPlaceHolder1_txtLocation.focus();
                return false;
            }

             

        }



        function FunReset() {

            document.all.ContentPlaceHolder1_txtAccount.value = "";
            document.all.ContentPlaceHolder1_txtSite.value = "";
            document.all.ContentPlaceHolder1_txtSiteID.value = "";
            document.all.ContentPlaceHolder1_DDAccountType.value = "";
            document.all.ContentPlaceHolder1_DDIndustry.value = "";
            document.all.ContentPlaceHolder1_txtSGSTIN.value = "";
            document.all.ContentPlaceHolder1_txtStartDate.value = "";
            document.all.ContentPlaceHolder1_DDCustomerType.value = "";
            document.all.ContentPlaceHolder1_txtComments.value = "";
            document.all.ContentPlaceHolder1_txtSynonyms.value = "";
            document.all.ContentPlaceHolder1_txtContactNo.value = "";


            document.all.ContentPlaceHolder1_txtAddress.value = "";
            document.all.ContentPlaceHolder1_txtPincode.value = "";
            document.all.ContentPlaceHolder1_txtCity.value = "";
            document.all.ContentPlaceHolder1_DDState.value = "";
            document.all.ContentPlaceHolder1_txtArea.value = "";


            document.all.ContentPlaceHolder1_txtRegion.value = "";
            document.all.ContentPlaceHolder1_txtLocation.value = "";
            document.all.ContentPlaceHolder1_txtGropLeader.value = "";
            document.all.ContentPlaceHolder1_txtAccessibility.value = "";
            document.all.ContentPlaceHolder1_txtAccessibilityTimeFrom.value = "";
            document.all.ContentPlaceHolder1_txtAccessibilityTimeTo.value = "";
            
 
            return false;
        }

        function CallBackPage() {

            var URL = "../Account.aspx";
            window.location = URL;
        }

        function Closefun(msg) {

            alert(msg);

            
            var URL = "../Account.aspx";
            window.location = URL;
            //window.parent.location.reload();
        }



    </script>

 


   </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body onload="load()">
       <%-- style="width: fit-content;"--%>

        <div style="background-color: #eceeef; padding: 0px;"> 
            <div id="main" class="col-md-12">


                <%-- script manager for grid updatepanel --%>
                <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>--%>

                <%--HEADER ROW--%>




                <fieldset style="border: solid 0px red;">



                    <div class="row border-bottom" style="padding: 10px 10px;">
                        <div id="main_sub2_div" class="col-md-12 bg-light">


                            <div class="col-4 BarObjactsLeft">
                                <span>
                                    <a href="#" onclick="CallBackPage()">
                                        <img src="../images/Back.svg" style="cursor: pointer;" />
                                    </a>
                                </span>
                                Account
                            </div>

                            <div class="col-8 BarObjactsRight">

                                <span>
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



                    <%--                <nav class="navbar navbar-light">
                    <div class="container-fluid" style="background-color: #FFDB7A; border-bottom: solid 1px lightgray; color: #78350f; border-radius: 5px;">
                        <a class="navbar-brand" style="color: #78350f; font-family: Calibri; font-size: medium;" href="#">Account info</a>
                    </div>
                </nav>--%>


                    <%--MAIN ROW--%>





                    <%-- <legend style="color:red;"> </legend>
    <legend style="color:red;"> </legend>--%>


                    <%------------- Account Info--%>


                    <div class="scrollable-content" style="background: #fff!important;">

                        <div class="container-fluid">


                            <div class="container-fluid">

                                <%------------- Account Info--%>
                                <div class="accordion" id="accordionExample">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingOne">
                                            <button class="accordion-button fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                Account info
                                            </button>
                                        </h2>
                                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample1">
                                            <div class="accordion-body">


                                                <div class="container-fluid">



                                                    <div class="form-group row">

                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">* </span>Account </div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="txtAccount" runat="server" class="formcontrol form-control-sm" />
                                                        </div>
                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right">Site</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="txtSite" runat="server" class="formcontrol form-control-sm" />
                                                        </div>
                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right">Site ID</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="txtSiteID" runat="server" class="formcontrol form-control-sm" />
                                                        </div>

                                                    </div>

                                                    <div class="form-group row">

                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">* </span>Account Type </div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <asp:DropDownList ID="DDAccountType" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                        </div>
                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">* </span>Industry</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <asp:DropDownList ID="DDIndustry" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                        </div>
                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"></span>SGST</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="txtSGSTIN" runat="server" class="formcontrol form-control-sm" />
                                                        </div>

                                                    </div>

                                                    <div class="form-group row">

                                                        <div class="col-sm-2 col-md-8 col-lg-8">

                                                            <div class="row">

                                                                <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: red"></span>Start Date </div>
                                                                <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                                    <input placeholder="Select date" type="date" id="txtStartDate" runat="server" class="formcontrol form-control-sm" />
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: red"></span>Customer Type</div>
                                                                <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                                    <asp:DropDownList ID="DDCustomerType" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                                </div>

                                                                <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: red"></span>Synonyms </div>
                                                                <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                                    <input type="text" id="txtSynonyms" runat="server" class="formcontrol form-control-sm" />
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: red"></span>Contact No</div>
                                                                <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                                    <input type="text" id="txtContactNo" runat="server" class="formcontrol form-control-sm" />
                                                                </div>

                                                            </div>

                                                        </div>

                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">* </span>Comments</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <textarea id="txtComments" rows="3" runat="server" class="formcontrol_Area form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                                        </div>

                                                    </div>




                                                </div>


                                            </div>
                                        </div>

                                        <%------------- Address Info--%>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwo">
                                                <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                    Address Info
                                                </button>
                                            </h2>
                                            <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample2">
                                                <div class="accordion-body">


                                                    <div class="container-fluid">


                                                        <div class="form-group row">

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">*</span> Address</div>
                                                            <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                                <input type="text" id="txtAddress" runat="server" class="formcontrol form-control-sm" />
                                                            </div>

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">*</span> Pincode </div>
                                                            <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                                <input type="text" id="txtPincode" runat="server" class="formcontrol form-control-sm" />
                                                            </div>

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">*</span> City</div>
                                                            <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                                <input type="text" id="txtCity" runat="server" class="formcontrol form-control-sm" />
                                                            </div>


                                                        </div>


                                                        <div class="form-group row">

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">*</span> State</div>
                                                            <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                                <asp:DropDownList ID="DDState" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                            </div>

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"></span>Area </div>
                                                            <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                                <input type="text" id="txtArea" runat="server" class="formcontrol form-control-sm" />
                                                            </div>

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"></span></div>
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
                                                <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                    Area Info
                                                </button>
                                            </h2>
                                            <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample3">
                                                <div class="accordion-body">


                                                    <div class="container-fluid">

                                                        <div class="form-group row">

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">* </span>Region</div>
                                                            <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                                <input type="text" id="txtRegion" runat="server" class="formcontrol form-control-sm" />
                                                            </div>

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">*</span> Location </div>
                                                            <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                                <input type="text" id="txtLocation" runat="server" class="formcontrol form-control-sm" />
                                                            </div>

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"></span>Grop Leader</div>
                                                            <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                                <input type="text" id="txtGropLeader" runat="server" class="formcontrol form-control-sm" />
                                                            </div>


                                                        </div>


                                                        <div class="form-group row">

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right">Accessibility</div>
                                                            <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                                <input type="text" id="txtAccessibility" runat="server" class="formcontrol form-control-sm" />
                                                            </div>

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"></span>Accessibility Time From </div>
                                                            <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                                <input type="text" id="txtAccessibilityTimeFrom" runat="server" class="formcontrol form-control-sm" />
                                                            </div>

                                                            <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"></span>Accessibility Time To</div>
                                                            <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                                <input type="text" id="txtAccessibilityTimeTo" runat="server" class="formcontrol form-control-sm" />
                                                            </div>

                                                        </div>





                                                    </div>




                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                                <%--MAIN ROW--%>

                                <div class="row">



                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-12" style="color: black;" align="right">
                                            <br />
                                        </div>
                                        <div class="col-sm-2 col-md-12" style="color: black;" align="right">

                                            <asp:Button ID="btnReset" runat="server" OnClientClick="return FunReset();" value="Reset" class="btn btn-dark CancelButton" Text="Reset" />

                                            &nbsp;&nbsp;&nbsp;
                                           <asp:Button ID="btnSubmit1" runat="server" OnClientClick="return FunValidation();" value="Submit" OnClick="btnSubmit1_Click" class="btn btn-warning SubmitButton" Text="Submit" />

                                        </div>

                                        <div class="col-sm-2 col-md-12" style="color: black;" align="right">

                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
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

                <%--HIDDEN FIELD--%>
                <asp:HiddenField ID="hdnAccCode" runat="server" />



            </div>
        </div>


    </body>

 
</asp:Content>





