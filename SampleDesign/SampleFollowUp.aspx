<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="SampleFollowUp.aspx.cs" Inherits="apa_pack.SampleDesign.SampleFollowUp" %>


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
    <script type="text/javascript" src="../js/SearchCalender.js"></script>
    <link href="../css/Calender.css" rel="stylesheet" />
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



    <link rel="stylesheet" href="../css/homes.css" />
    <link href="../css/CommonStyles.css" rel="stylesheet" />



    



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
                $('#datetimepickerStartTime').datetimepicker({
                    format: 'hh:mm A',
                });

                $('#datetimepickerEndTime').datetimepicker({
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


            if (document.all.texActivityDate.value == "") {
                alert("Activity Date can't be empty");
                texActivityDate.focus();
                return false;
            } else {
                var dateStr = document.all.texActivityDate.value.trim();
                var parts = dateStr.split("/");

                if (parts.length === 3) {
                    var day = parseInt(parts[0], 10);
                    var month = parseInt(parts[1], 10) - 1; // months are 0-based
                    var year = parseInt(parts[2], 10);

                    var inputDate = new Date(year, month, day);
                    var today = new Date();

                    // Reset time to midnight
                    today.setHours(0, 0, 0, 0);
                    inputDate.setHours(0, 0, 0, 0);

                    if (inputDate > today) {
                        alert("Activity Date can't be a future date");
                        texActivityDate.focus();
                        return false;
                    }
                }
            }

            if (document.all.txtSampleBoardQuantity.value == "") {
                alert("Sample Board Quantity Can't be Empty")
                txtSampleBoardQuantity.focus();
                return false;
            }

             

            if (document.all.DDJoinType.value == "") {
                alert("Join Type Can't be Empty")
                DDJoinType.focus();
                return false;
            }

            if (document.all.txtSuccessQuantity.value == "") {
                alert("Success Quantity Can't be Empty")
                txtSuccessQuantity.focus();
                return false;
            }

            if (document.all.txtRejectionQuantity.value == "") {
                alert("Rejection Quantity Can't be Empty")
                txtRejectionQuantity.focus();
                return false;
            }

            if (document.all.txtStartTime.value == "") {
                alert("Start Time Can't be Empty")
                txtStartTime.focus();
                return false;
            }
            if (document.all.txtEndTime.value == "") {
                alert("End Time Can't be Empty")
                txtEndTime.focus();
                return false;
            }




        }





        function Closefun(msg) {


            alert("Sample Created successfully");
            //window.parent.location.reload();
            //var URL = "../successfully.aspx?Code=" + msg +"&From=SampleRequest";
            //window.location = URL;


            //var URL = "../SampleDesign/Samples.aspx";
            //window.location = URL;
            parent.CallSampleFollowUp('No Code', 'Close Sample Follow up');


        }




        function funReset() {

            document.all.DDActivityType.value = "";
            document.all.texActivityDate.value = "";
            document.all.txtSampleBoardQuantity.value = "";
            document.all.DDJoinType.value = "";
            document.all.txtSuccessQuantity.value = "";
            document.all.txtRejectionQuantity.value = "";
            document.all.txtStartTime.value = "";
            document.all.txtEndTime.value = "";
            document.all.txtComments1.value = "";

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
                                    Sample Info
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
                                <div class="accordion-body">


                                    <div class="row">
                                        <div id="main0" class="container-fluid">


                                            <%------------- Installatoin Info--%>

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Customer Name</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtCustomerName" name="txtModelNo" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Request Date</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtRequestDate" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Sample Code</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtSampleCode" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>

                                            </div>

 
                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Contact Person </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtContactPerson" name="txtSalesOrder" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Sales Executive</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtSalesExecutive" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Sample Request Type</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="texSampleRequestType" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>

                                            </div>

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Priority </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtPriority" name="txtPo" runat="server" class="formcontrol_Read form-control-sm"   readonly="readonly"/>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Sample Requested Quantity</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtSampleRequestedQuantity" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">* </span> Box Type </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtBoxType" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>

                                            </div>

                                             

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: blue">*</span> Comments </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <textarea id="txtComments" rows="3" runat="server" class="formcontrol_Area_Read" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"  readonly="readonly"></textarea>
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
                                                            <input type="text" id="texActivityDate" runat="server" class="formcontrol form-control-sm" />
                                                        </div>
                                                        <div class="col-sm-3 col-md-3 form-text" style="padding: 0px;">
                                                            <img border="0" src="../images/Calender.svg" style="cursor: pointer;" align="middle" onclick="showCal(document.all.texActivityDate,1)" />
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Sample Board Quantity</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">

                                                     <input type="text" id="txtSampleBoardQuantity" runat="server" class="formcontrol form-control-sm" />
                                                
                                                </div>

                                            </div>





                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Join Type </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <asp:DropDownList ID="DDJoinType" runat="server" class="formcontrol form-control-sm" onchange="GetProductDetail()"></asp:DropDownList>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Success Quantity</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtSuccessQuantity" runat="server" class="formcontrol form-control-sm" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Rejection Quantity </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtRejectionQuantity" runat="server" class="formcontrol form-control-sm" />
                                                </div>

                                            </div>


                                            <div class="form-group row">

                                                
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Start Time</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">

                                                    <div class='input-group date' id='datetimepickerStartTime'>
                                                        <input type='text' id="txtStartTime" class="form-control" runat="server" />
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                    
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> End Time</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">

                                                    <div class='input-group date' id='datetimepickerEndTime'>
                                                        <input type='text' id="txtEndTime" class="form-control" runat="server" />
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                    
                                                </div>

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red"> </span>   </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                   
                                                </div>

                                            </div>



                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red"> </span> Comments</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <textarea id="txtComments1" rows="3" runat="server" class="formcontrol_Area form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right">  </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" align="right">  </div>
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
                                    <asp:Button ID="btnsubmitSam" runat="server" OnClientClick="return Validation();" value="Submit" class="btn btn-warning SubmitButton" Text="Submit" OnClick="btnsubmitSam_Click" />
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
        <input type="hidden" id="hdnSampleCode" runat="server" />

    </form>
</body>
</html>
