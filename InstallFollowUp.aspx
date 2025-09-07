<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstallFollowUp.aspx.cs" Inherits="apa_pack.InstallFollowUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Follow Up</title>

     <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <%--boostrap icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />

   
     
     <%-- --- FOR FONT FAMILY --%>

    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

    <%-- --- --%>




    <%--For Select Date--%>
    <script type="text/javascript" src="js/SearchCalender.js"></script>
    <link href="css/Calender.css" rel="stylesheet" />
    <%--For Select Date--%>


    <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://someothersite.com/external.js"></script>


    <%-- --- FOR Date Time Picker --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">

    <%-- --- FOR Date Time Picker --%>



    <link rel="stylesheet" href="css/homes.css" />
    <link href="css/CommonStyles.css" rel="stylesheet" />



    



    <style type="text/css">

        .accordion{
            border:0px solid lightgray;
            border-radius:3px;
        }
        .accordion-item{
            background-color:white!important;
            border: none;
        }
        .accordion-header{
             border-bottom:1px solid lightgray;
        }
        .accordion-button:focus {
            border-color:none!important;
            box-shadow: none!important;
            background-color: white!important;

        }
        .accordion-button:not(.collapsed) {
            background-color: white!important;
            box-shadow: 0!important;
            border-color:none!important;

        }


        .form-group{
            padding-top:3px;
            
        }
        #main{
            height:300px;
        }

        .form-group {
            margin-bottom: 0px;
        }

        .accordion-button {
            font-size: 14px;
        }
         
    </style>



    <script type="text/javascript">

        function FunOnload() {

            $(function () {
                //$('#datetimepicker1').datetimepicker({
                //    format: 'HH:mm'
                //});

                //$('#datetimepicker2').datetimepicker({
                //    format: 'MM/DD/YYYY HH:mm'
                //});
                $('#datetimepicker3').datetimepicker({
                    format: 'hh:mm A',
                });
            });




           
            var checkbox = document.getElementById("ChkNextVisit");

            checkbox.addEventListener("change", function () {

                var isChecked = checkbox.checked;
                

                if (isChecked == true) {
                    
                    document.getElementById("NextActivitySection").style = "display:";
                } else {
                     
                    document.getElementById("NextActivitySection").style = "display:none";
                }


            });




        }



        function Validation() {


            if (document.all.DDActivityType.value == "") {
                alert("Activity Type Can't be Empty")
                DDActivityType.focus();
                return false;
            }


            if (document.all.texActivityDate1.value == "") {
                alert("Activity Date Can't be Empty")
                texActivityDate1.focus();
                return false;
            }

            if (document.all.txtHoursSpend.value == "") {
                alert("Hours Spend Can't be Empty")
                txtHoursSpend.focus();
                return false;
            }

            if (document.all.DDSubStatus.value == "") {
                alert("Hours Spend Can't be Empty")
                DDSubStatus.focus();
                return false;
            }


            if (document.all.txtComments11.value == "") {
                alert("Comments Can't be Empty")
                txtComments11.focus();
                return false;
            }

            
            var checkbox1 = document.getElementById("ChkNextVisit");



            var isChecked = checkbox1.checked;

            if (isChecked == true) {

                if (document.all.txtNextVisitDate.value == "") {
                    alert("Next Visit Date Can't be Empty")
                    txtNextVisitDate.focus();
                    return false;
                }
            }





        }

        

    </script>

</head>
<body onload="FunOnload()">
    <form id="form1" runat="server">
        <div>


            <div style="text-align: left;">
                <div class="container">
                    <h5 style="color:blueviolet;"></h5>
                </div>
            </div>


            <%--<div style="text-align: left;">
                <div class="container">

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="InstallInfotab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true" >Follow Up</button>
                        </li>
                    </ul>
 
                </div>
            </div>--%>


            <nav>
                <div class="container-fluid" style="background-color:#FFDB7A; border-bottom:solid 1px lightgray; border-radius:5px;">
                    <a class="BarTitle" style=" color:#000000;font-family:poppins;" href="#" >Follow up</a>
                </div>
            </nav>





            <div class="scrollable-content" style="background: #fff!important;padding: 0px;top: 55px;">

                <div class="container">

                    <div class="accordion" id="accordionPanelsStayOpenExample">

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                <button class="accordion-button BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                                    Installation Info
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
                                <div class="accordion-body">


                                    <div class="row">
                                        <div id="main" class="container-fluid">


                                            <%------------- Installatoin Info--%>

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Model No</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtModelNo" name="txtModelNo" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Product Dec</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtProductDec" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Searial No</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtSerialNo" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>

                                            </div>





                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Sales Order </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtSalesOrder" name="txtSalesOrder" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Sales Order Date</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtSalesOrderDate" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Field Update</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="texFieldUpdate" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>

                                            </div>

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Po </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtPN" name="txtPo" runat="server" class="formcontrol_Read form-control-sm" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Po Date</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtPDate" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Software</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="TxtSoftware" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>

                                            </div>

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Invoice No </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtInvoiceNo" name="txtAccount" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Invoice Date</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtInvoicDate" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Trade-Up SID</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtTradeUpSID" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>

                                            </div>



                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Principal</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtPrincipal" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Distent from Service Location</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="number" id="txtDistentService" runat="server" class="formcontrol_Read form-control-sm" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"></div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                </div>

                                            </div>

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Remarks </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <textarea id="txtComments" rows="3" runat="server" class="formcontrol_Area_Read" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"></div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"></div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                </div>
                                            </div>

                                        </div>


                                    </div>

                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>


                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                                <button class="accordion-button collapsed BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                    Activity Info
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingTwo">
                                <div class="accordion-body">


                                    <div class="row">
                                        <div id="main1" class="container-fluid">


                                            <%------------- Activity Info--%>

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Activity Type</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <asp:DropDownList ID="DDActivityType" ClientIDMode="Static" runat="server" class="formcontrol form-control-sm" onchange="GetProductDetail()"></asp:DropDownList>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Activity Date</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <div class="row">
                                                        <div class="col-sm-9 col-md-9 form-text" style="padding-right: 3px;">
                                                            <input type="text" id="texActivityDate1" runat="server" class="formcontrol form-control-sm" />
                                                        </div>
                                                        <div class="col-sm-3 col-md-3 form-text" style="padding: 0px;">
                                                            <img border="0" src="images/Calender.svg" style="cursor: pointer;" align="middle" onclick="showCal(document.all.texActivityDate1,1)" />
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Hours Spend</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">

                                                    <div class='input-group date' id='datetimepicker3'>
                                                        <input type='text' id="txtHoursSpend" class="form-control" />
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                    <%--                                            <input type="number" id="Number1" runat="server" class="formcontrol form-control-sm" />--%>
                                                </div>

                                            </div>





                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Sub Status </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <asp:DropDownList ID="DDSubStatus" runat="server" class="formcontrol form-control-sm" onchange="GetProductDetail()"></asp:DropDownList>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red"></span>Report No</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="Text1" runat="server" class="formcontrol form-control-sm" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red"></span>Field Update</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtComment" runat="server" class="formcontrol form-control-sm" />
                                                </div>

                                            </div>




                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Comments</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <textarea id="txtComments11" rows="3" runat="server" class="formcontrol_Area form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right">Customer Comments </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <textarea id="txtCustomerComments" rows="3" runat="server" class="formcontrol_Area form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right">Next Visit </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <asp:CheckBox ID="ChkNextVisit" ClientIDMode="Static" runat="server" />
                                                </div>
                                            </div>

                                            <div class="form-group row" id="NextActivitySection" style="display:none;">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Next Activity Date</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <div class="row">
                                                        <div class="col-sm-9 col-md-9 form-text" style="padding-right: 3px;">
                                                            <input type="text" id="txtNextVisitDate" runat="server" class="formcontrol form-control-sm" />
                                                        </div>
                                                        <div class="col-sm-3 col-md-3 form-text" style="padding: 0px;">
                                                            <img border="0" src="images/Calender.svg" style="cursor: pointer;" align="middle" onclick="showCal(document.all.txtNextVisitDate,1)" />
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red"></span>Comments</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <textarea id="txtNextVisitRemarks" rows="3" runat="server" class="formcontrol_Area form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                                </div>

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"></div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                </div>

                                            </div>


                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>


                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                <button class="accordion-button collapsed BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingThree">
                                <div class="accordion-body">

                                    <br />
                                    <div class="form-group row">
                                        <div class="col-sm-2 col-md-6" style="color: black;" align="right">
                                        </div>
                                        <div class="col-sm-2 col-md-6" style="color: black;" align="right">
                                            <button type="submit" runat="server" id="btnreset" onclick="funReset()" class="btn btn-dark CancelButton">Reset</button>
                                            &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnsubmitIns" runat="server" OnClientClick="return Validation();" value="Submit" class="btn btn-warning SubmitButton" Text="Submit" OnClick="btnsubmitIns_Click" />
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>



                    </div>

                </div>

            </div>






        </div>



        <%--hidden fields--%>
        <input type="hidden" id="hdnInstallCode" runat="server" />

    </form>
</body>
</html>
