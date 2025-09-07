<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeBehind="SampleRequests.aspx.cs" Inherits="apa_pack.SampleDesign.SampleRequests" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


     <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <%--boostrap icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"/>

     <%-- --- FOR FONT FAMILY --%>

    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

    <%-- --- --%>

    <link rel="stylesheet" href="../css/homes.css"/>
    <link href="../css/CommonStyles.css" rel="stylesheet" />


    <%--For Select Date--%>
    <script type="text/javascript" src="../js/SearchCalender.js"></script>
    <link href="../css/Calender.css" rel="stylesheet" />



 
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



        .grid_background {
            background-color: #F3F3F3;
            border-bottom: 1px solid #DDD;
            height: 22px;
            FONT-WEIGHT: normal;
            FONT-SIZE: 11px;
            COLOR: #000000;
            FONT-FAMILY: poppins;
            TEXT-DECORATION: none;
            padding-left: 5px;
        }


        .grid_background1 {
            background-color: #FFFFFF;
            border-bottom: 1px solid #d6d6d6;
            height: 22px;
            FONT-WEIGHT: normal;
            FONT-SIZE: 11px;
            COLOR: #000000;
            FONT-FAMILY: poppins;
            TEXT-DECORATION: none;
            padding-left: 5px;
        }


        table#DispTable {
            border-radius: 8px;
            overflow: hidden;
        }

        /*Grid Style*/

        table#ContentPlaceHolder1_gvPaperCombination {
            overflow: hidden;
            border-radius: 8px;
        }
        table#ContentPlaceHolder1_gvPaperCombination th{
            background-color:#FFEEC0;
        }

        .GridBtn{
            color:#FFFFFF;
            font-size:11px;
        }

    </style>


    <script type="text/javascript">

 

        function load() {
 

        
            
        }


        
        function CalculateSize() {



            var Length = parseFloat(document.all.ContentPlaceHolder1_txtLength.value) || 0;
            var Width = parseFloat(document.all.ContentPlaceHolder1_txtWidth.value) || 0;
            var Height = parseFloat(document.all.ContentPlaceHolder1_txtHeight.value) || 0;
            
            if (Length > 0 && Width > 0 && Height > 0) {

                var Trimming = 20;
                var Ups = 4;
                var Flap = 40;


                var ReelSize = ((Width + Height) * Ups) + Trimming;
                var CuttingSize = ((Length + Width) * 2) + Flap;

                document.all.ContentPlaceHolder1_txtReelSize.value = ReelSize;
                document.all.ContentPlaceHolder1_txtCuttingSize.value = CuttingSize;


            }
            else {

                var Trimming = 0;
                var Ups = 0;
                var Flap = 0;

                var ReelSize = ((Width + Height) * Ups) + Trimming;
                var CuttingSize = ((Length + Width) * 0) + Flap;

                document.all.ContentPlaceHolder1_txtReelSize.value = ReelSize;
                document.all.ContentPlaceHolder1_txtCuttingSize.value = CuttingSize;
            }

            
        }
         
 


         


        function Validation() {
            
           
            //--------------------------------------------- Sample box info
            if (document.all.ContentPlaceHolder1_txtCustomerName.value == "") {
                alert("Customer Name Can't be Empty")
                ContentPlaceHolder1_txtCustomerName.focus();
                return false;
            }
             
             
            if (document.all.ContentPlaceHolder1_txtRequestDate1.value == "") {
                alert("Request Date Can't be Empty")
                ContentPlaceHolder1_txtRequestDate1.focus();
                return false;
            }
            
             
            if (document.all.ContentPlaceHolder1_DDSalesExecutive.value == "") {
                alert("Please Select Sales Executive")
                ContentPlaceHolder1_DDSalesExecutive.focus();
                return false;
            }
            
            if (document.all.ContentPlaceHolder1_DDSampleRequestType.value == "") {
                alert("Sample Request Type Can't be Empty")
                ContentPlaceHolder1_DDSampleRequestType.focus();
                return false;
            }
  
            //--------------------------------------------- Item info

            
            //if (document.all.ContentPlaceHolder1_txtLength.value == "") {
            //    alert("Length Can't be Empty")
            //    ContentPlaceHolder1_txtLength.focus();
            //    return false;
            //}

            //if (document.all.ContentPlaceHolder1_txtWidth.value == "") {
            //    alert("Width Can't be Empty")
            //    ContentPlaceHolder1_txtWidth.focus();
            //    return false;
            //}

            //if (document.all.ContentPlaceHolder1_txtHeight.value == "") {
            //    alert("Height Can't be Empty")
            //    ContentPlaceHolder1_txtHeight.focus();
            //    return false;
            //}

            if (document.all.ContentPlaceHolder1_DDPly.value == "") {
                alert("Please Select Ply")
                ContentPlaceHolder1_DDPly.focus();
                return false;
            }

            if (document.all.ContentPlaceHolder1_DDDesignType.value == "") {
                alert("Please select Design Type")
                ContentPlaceHolder1_DDDesignType.focus();
                return false;
            }
            
            if (document.all.ContentPlaceHolder1_txtRequestQuantity.value == "") {
                alert("Request Quantity Can't be Empty")
                ContentPlaceHolder1_txtRequestQuantity.focus();
                return false;
            }
            
      
             
        }

        function Closefun(msg) {

            
            alert("Sample Created successfully");
            //window.parent.location.reload();
            //var URL = "../successfully.aspx?Code=" + msg +"&From=SampleRequest";
            //window.location = URL;


            var URL = "../SampleDesign/Samples.aspx";
            window.location = URL;

            
        }

    </script>





    <script type="text/javascript">

        function funReset() {

            <%------------- Installatoin Info--%>
           
            
 
            document.all.ContentPlaceHolder1_txtCustomerName.value = "";
            document.all.ContentPlaceHolder1_txtRequestDate1.value = "";
            
            document.all.ContentPlaceHolder1_txtContactPerson.value = "";
            document.all.ContentPlaceHolder1_DDSalesExecutive.value = "";
            document.all.ContentPlaceHolder1_txtComments.value = "";

            document.all.ContentPlaceHolder1_DDSampleRequestType.value = "";
            document.all.ContentPlaceHolder1_DDPriority.value = "";
     
            
            document.all.ContentPlaceHolder1_txtLength.value = "";
            document.all.ContentPlaceHolder1_txtWidth.value = "";
            document.all.ContentPlaceHolder1_txtHeight.value = "";
            document.all.ContentPlaceHolder1_txtReelSize.value = "";
            document.all.ContentPlaceHolder1_txtCuttingSize.value = "";
            document.all.ContentPlaceHolder1_DDPly.value = "";
            document.all.ContentPlaceHolder1_txtSampleDescription.value = "";
            document.all.ContentPlaceHolder1_DDDesignType.value = "";
            document.all.ContentPlaceHolder1_txtRequestQuantity.value = "";

        }


        function CallBackPage() {

            var URL = "../SampleDesign/Samples.aspx";
            window.location = URL;
        }

    </script>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



     <body onload="load()">




        <%--MAIN--%>
        <div class="row border-bottom" style="padding: 10px 10px 10px 35px; background: white;">
            <div id="main_sub2_div" class="col-md-12 bg-light">


                <div class="col-4 BarObjactsLeft">
                    <span>
                        <a href="#" onclick="CallBackPage()">
                            <img src="../images/Back.svg" style="cursor: pointer;" />
                        </a>
                    </span>
                    Sample Request
                </div>

                <div class="col-8 BarObjactsRight">
                     <span>
                        <img src="../images/Sample_Size_caculator.png" style="cursor: pointer;height:25px;width:25px;" /></span>
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


        <div class="scrollable-content" style="background: #fff!important;">

            <div class="container-fluid">
                <%-- <fod="form_logout" runat="server">--%>

                <%-- scrmanager for grid updatepanel --%>
                <%-- <asriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>--%>

                 

 
                <%--Sample Box Detail--%>
                <field style="border: solid 0px red;">

                    <div class="container-fluid">

                        <%------------- Installatoin Info--%>
                        <div class="accordion" id="accordionExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button fw-bold BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Sample Info
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample1">
                                    <div class="accordion-body">


                                        <div class="container-fluid">



                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" style="width: 200px;" align="right"><span style="color: red">* </span>Customer Name </div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <div class="input-group">
                                                        <input type="text" id="txtCustomerName" name="txtCustomerName" runat="server" class="formcontrol form-control-sm" />
                                                        
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">*</span> Request Date</div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    
                                                        <div class="datecontainer">
                                                            <div class="row">
                                                                <div class="col-sm-10 col-md-10 col-lg-10 form-text" style="padding-right: 0px;" align="left">
                                                                    <input type="text" id="txtRequestDate1" runat="server" class="formcontrol form-control-sm" />
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 col-lg-2 form-text" align="center" style="padding: 0px;">
                                                                    <img border="0" src="../images/calender.svg" style="cursor: pointer;" align="middle" onclick="showCal(document.all.ContentPlaceHolder1_txtRequestDate1,0)" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                
                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">*</span> Sample ID / Code</div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <input type="text" id="txtSampleCode" placeholder="Auto" runat="server" class="formcontrol_Read form-control-sm" readonly="true" value="Auto" />
                                                </div>

                                            </div>

                                             


 

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-8 col-lg-8">

                                                    <div class="row">

                                                        <div class="col-sm-2 col-md-2 col-lg-3 form-lable" style="width: 200px;" align="right"> Contact Person </div>
                                                        <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                            <input type="text" id="txtContactPerson" name="txtContactPerson" runat="server" class="formcontrol form-control-sm" />
                                                        </div>

                                                        <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"> <span style="color: red">*</span> Sales Executive </div>
                                                        <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                             <asp:DropDownList ID="DDSalesExecutive" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                        </div>


                                                        <div class="col-sm-2 col-md-2 col-lg-3 form-lable" style="width: 200px;" align="right">
                                                            <span style="color: red">*</span> Sample Request Type
                                                        </div> 
                                                        <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                            <asp:DropDownList ID="DDSampleRequestType" runat="server" class="formcontrol form-control-sm" ></asp:DropDownList>
                                                             
                                                        </div>
                                                        <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: blue"> </span> Priority </div>
                                                        <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                         
                                                            <asp:DropDownList ID="DDPriority" runat="server" class="formcontrol form-control-sm"  ></asp:DropDownList>
                                                        </div>

                                                    </div>

                                                </div>

                                                <div class="col-sm-2 col-md-2 col-lg-2 form-lable" style="width: 200px;" align="right">Comments</div>
                                                <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                    <textarea id="txtComments" rows="3" runat="server" class="form-control form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                                </div>

                                            </div>




                                        </div>


                                    </div>
                                </div>

                                <%------------- Item Info--%>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo">
                                        <button class="accordion-button collapsed fw-bold BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Item Info  
                                        </button>
                                    </h2>
                                    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample2">
                                        <div class="accordion-body">




                                            <div class="container-fluid">



                                                <div class="form-group row">

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" style="width: 200px;" align="right"><span style="color: red"> </span> Length (MM) </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                       <input type="text" id="txtLength" name="txtLength" runat="server" class="formcontrol form-control-sm"  onblur="CalculateSize()" />
                                                    </div>
                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"> </span> Width (MM) </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtWidth" name="txtWidth" runat="server" class="formcontrol form-control-sm" onblur="CalculateSize()" />
                                                    </div>
                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"> </span>  Height (MM) </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtHeight" name="txtHeight" runat="server" class="formcontrol form-control-sm" onblur="CalculateSize()" />
                                                    </div>

                                                </div>

                                                 <div class="form-group row">

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" style="width: 200px;" align="right"><span style="color: blue">* </span> Reel Size (MM) </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                       <input type="text" id="txtReelSize" name="txtReelSize" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>
                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: blue">*</span> Cutting Size (MM) </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <input type="text" id="txtCuttingSize" name="txtCuttingSize" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" />
                                                    </div>
                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">*</span>  Ply </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <asp:DropDownList ID="DDPly" runat="server" class="formcontrol form-control-sm" OnSelectedIndexChanged="DDPly_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                    </div>

                                                </div>



                                                <div class="form-group row">

                                                    <div class="col-sm-2 col-md-2 col-lg-2 form-lable" style="width: 200px;" align="right"> Sample Description </div>
                                                    <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                        <textarea id="txtSampleDescription" rows="3" runat="server" class="form-control form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                                    </div>

                                                    <div class="col-sm-2 col-md-8 col-lg-8">

                                                        <div class="row">
                                                             
                                                            <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: red">*</span> Design Type </div>
                                                            <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
 
                                                                <asp:DropDownList ID="DDDesignType" runat="server" class="formcontrol form-control-sm"  ></asp:DropDownList>
                                                            </div>

                                                            <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: red">*</span> Request Quantity </div>
                                                            <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                                <input type="text" id="txtRequestQuantity" name="txtRequestQuantity" runat="server" class="formcontrol form-control-sm" />
                                                            </div>

                                                            <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right">
                                                                <span style="color: blue"> * </span> Expected Order Date
                                                            </div>
                                                            <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                                 <input type="text" id="txtExpectedOrderDate" name="txtExpectedOrderDate" runat="server" class="formcontrol_Read form-control-sm" placeholder="Getting One Month" readonly="readonly" />
                                                            </div>
                                                            <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: blue"></span>  </div>
                                                            <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                                 
                                                            </div>

                                                        </div>

                                                    </div>

                                                    

                                                </div>




                                                <div class="form-group row">

                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>



                                                            <br />
                                                            <br />

                                                            <asp:GridView ID="gvPaperCombination" runat="server" AutoGenerateColumns="False"
                                                                CssClass="table table-bordered" OnRowCommand="gvPaperCombination_RowCommand" OnRowDataBound="gvPaperCombination_RowDataBound"
                                                                DataKeyNames="SrNo">
                                                                <Columns>
                                                                    <asp:BoundField DataField="SrNo" HeaderText="Sr No" ReadOnly="true" />
                                                                    <asp:BoundField DataField="Ply" HeaderText="Ply" ReadOnly="true" />

                                                                    <asp:TemplateField HeaderText="Flute">
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList ID="ddlFlute" runat="server" CssClass="formcontrol form-control-sm"  >
                                                                               
                                                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                                <asp:ListItem Text="B Flute" Value="B"></asp:ListItem>
                                                                                <asp:ListItem Text="C Flute" Value="C"></asp:ListItem>
                                                                                <asp:ListItem Text="E Flute" Value="E"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="GSM">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox CssClass="formcontrol form-control-sm" ID="txtGSM" runat="server" Text='<%# Eval("GSM") %>' Value='<%# Eval("GSM") %>' ></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="BF">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox CssClass="formcontrol form-control-sm" ID="txtBF" runat="server" Text='<%# Eval("BF") %>' Value='<%# Eval("BF") %>' ></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Shade">
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList CssClass="formcontrol form-control-sm" ID="ddlShade"  runat="server" >
                                                                                <asp:ListItem Text="White" Value="White"></asp:ListItem>
                                                                                <asp:ListItem Text="Brown" Value="Brown"></asp:ListItem>
                                                                                <asp:ListItem Text="Kraft" Value="Kraft"></asp:ListItem>
                                                                                <asp:ListItem Text="Natural" Value="Natural"></asp:ListItem>
                                                                                <asp:ListItem Text="Goldan Yellow" Value="Golden Yellow"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:BoundField DataField="Size" HeaderText="Size" ReadOnly="true"  />

                                                                    <asp:BoundField DataField="Size(Inches)" HeaderText="Size(Inches)" ReadOnly="true" />

                                                                    <asp:BoundField DataField="Weight" HeaderText="Weight" ReadOnly="true" />

                                                                    <asp:TemplateField HeaderText="Copy">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="btnCopy" runat="server" CommandName="CopyRow"
                                                                                CommandArgument='<%# ((GridViewRow) Container).RowIndex %>'
                                                                                Text="Copy" CssClass="btn btn-info btn-sm GridBtn"  />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Paste">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="btnPaste" runat="server" CommandName="PasteRow"
                                                                                CommandArgument='<%# ((GridViewRow) Container).RowIndex %>'
                                                                                Text="Paste" CssClass="btn btn-success btn-sm GridBtn" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>

                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>


                                                </div>




                                                 


                                            </div>

                                             
                                        </div>

                                    </div>


                                </div>



                     



                                
                                    <%--MAIN ROW    --%>

                                    <div class="row">



                                        <div class="form-group row">

                                            <div class="col-sm-2 col-md-12"  style="color: black;" align="right">
                                                <%--<br />--%>
                                            </div>
                                            <div class="col-sm-2 col-md-12" style="color: black;padding: 20px 150px;" align="right">


                                                <button type="submit" runat="server" id="btnreset" onclick="funReset()" class="btn btn-dark CancelButton">Reset</button>
                                                &nbsp;&nbsp;&nbsp;
                                          
                                                            <asp:Button ID="btnsubmitIns" runat="server" OnClientClick="return Validation();" value="Submit" OnClick="btnsubmitIns_Click" class="btn btn-warning SubmitButton" Text="Submit " />
                                            </div>

                                            <div class="col-sm-2 col-md-12" style="color: black;" align="right">
                                            </div>

                                        </div>

                                    </div>

                                <br />
                                <br />


 
                                <%--FOOTOW--%>

                                <%--<divss="row">
                <div id="food" class="col-md-12 border">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>--%>

                                <%--HIDDIELD--%>







                                <%--Hiddield--%>

                                <asp:HiddenField ID="hdnAccCode" runat="server" />
                                <asp:HiddenField ID="hdnFrom" runat="server" />

                                <input type="hidden" name="hdnWarrantyInfo" id="hdnWarrantyInfo" runat="server" />
                                <input type="hidden" name="hdnComponentInfo" id="hdnComponentInfo" runat="server" />

                                <input type="hidden" name="hdnContcode" id="hdnContcode" runat="server" />

                                <input type="hidden" name="hdnGridPaperCombinationData" id="hdnGridPaperCombinationData" runat="server" />

                                <%--</form>--%>
                            </div>


                        </div>

                    </div>

                </field>
            </div>
        </div>


    </body>



</asp:Content>

