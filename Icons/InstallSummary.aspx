<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstallSummary.aspx.cs" Inherits="apa_pack.InstallSummary" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Instalation Summary</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <%--boostrap icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />

    <link rel="stylesheet" href="css/homes.css" />



    <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://someothersite.com/external.js"></script>

    <%--For Select Date--%>
    <script type="text/javascript" src="js/SearchCalender.js"></script>
    <link href="css/Calender.css" rel="stylesheet" />

     

    <%--For Attachment--%>
    <link href="css/Attachment.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery_3_1_1.min.js"></script>
    <script  src="js/jquery.carouFredSel-6.2.1-packed.js"></script>
    



    <style type="text/css">
        body {
            font-family: 'Calibri','Gill Sans', 'Gill Sans MT', 'Trebuchet MS', sans-serif;
            font-size: medium;
            /*font-weight:bold;*/
        }


        .form-group {
            padding-top: 2px;
        }



        .grid_background {
            background-color: #dfe7f7;
            border-bottom: 1px solid #c5e2f3;
            height: 22px;
            FONT-WEIGHT: normal;
            FONT-SIZE: 11px;
            COLOR: #000000;
            FONT-FAMILY: Tahoma;
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
            FONT-FAMILY: Tahoma;
            TEXT-DECORATION: none;
            padding-left: 5px;
        }

        #btnEditIns {
            position: absolute;
            height: 25px;
            padding: 0px;
            top: 40px;
            left: 1050px;
            text-indent: 00px;
            border-radius: 3px;
            font-size: small;
            transition: transform 0.2s ease;
        }

            #btnEditIns:active {
                transform: scale(0.96);
            }

        #butAddAttach {
            position: relative;
            height: 25px;
            padding: 0px;
            background-color: white;
            text-indent: 00px;
            border-radius: 3px;
            font-size: small;
            transition: transform 0.2s ease;
            color: #1e2f97;
        }

            #butAddAttach:active {
                transform: scale(0.96);
            }

        #btnCopyIns {
            position: absolute;
            height: 25px;
            padding: 0px;
            top: 40px;
            left: 975px;
            text-indent: 00px;
            border-radius: 3px;
            font-size: small;
            transition: transform 0.2s ease;
        }

            #btnCopyIns:active {
                transform: scale(0.96);
            }

        .disabled {
            opacity: 0.6;
            cursor: not-allowed;
        }


        /* -------------------------------------------- For Upload file and Attachment     */

        /* Hide the actual file input */
        input[type="file"] {
            display: none;
        }

        /* Style the label to look like a button */
        .custom-file-upload {
            display: inline-block;
            background: white;
            color: gray;
            padding: 0px;
            width: 200px;
            border-radius: 5px;
            /*border-style: dashed;*/
            border: dashed 1px #000;
            border-color: gray;
            text-align: center;
        }

        /* -------------------------------------------- For Upload file and Attachment     */
    </style>





    <script type="text/javascript">





    RowCount = 0;
    ContRowCount = 0;

    aWarType = new Array(100);
    aMonth = new Array(100);
    aNoofVisit = new Array(100);
    aModule = new Array(100);
    aWarStartDate = new Array(100);
    aWarEndDate = new Array(100);




    function load() {

        RowCount = 0;
        ContRowCount = 0;
        rtnvalues = document.all.hdnWarrantyInfo.value;

        if (rtnvalues != "") {
            lhlpvalues1 = rtnvalues.split("#");


            for (i = 0; i < lhlpvalues1.length; i++) {
                TempVal = lhlpvalues1[i].split("~");

                aWarType[RowCount] = TempVal[0];
                aMonth[RowCount] = TempVal[1];
                aNoofVisit[RowCount] = TempVal[2];
                aModule[RowCount] = "Update";
                aWarStartDate[RowCount] = TempVal[3];
                aWarEndDate[RowCount] = TempVal[4];
                RowCount++;
            }
        }
        RebuildTable();





        document.getElementById('FileAttach').addEventListener('change', function () {

            var fileName = this.value.split('\\').pop(); // Extract the file name from the full path
            //alert(fileName)
            var maskedFileName = maskString(fileName);
            document.getElementById('ChooseFile').innerText = "" + maskedFileName;
        });

        function maskString(value) {
            //alert(value + "...." + value.length)
            if (value.length <= 20) {
                return value;
            } else {

                return value.slice(0, 20) + '...';
            }
        }






    }



    function ChangeTab(Tab) {



        if (Tab == "InstallTab") {


            document.getElementById("InstallInfo").style.display = "block";
            document.getElementById("SLAInfo").style.display = "none";
            document.getElementById("ComponentsInfo").style.display = "none";
            document.getElementById("AttachmentInfo").style.display = "none";

        }


        if (Tab == "AttachmentTab") {


            document.getElementById("InstallInfo").style.display = "none";
            document.getElementById("SLAInfo").style.display = "none";
            document.getElementById("ComponentsInfo").style.display = "none";
            document.getElementById("AttachmentInfo").style.display = "block";

        }

    }





    function EditInstallation(From) {


        //Retvals = window.open("../EditAccount.aspx?AccCode=" + AccCode, null, "width=1300,height=700");
        //Retvals.moveTo((window.screen.width / 2) - (1200 / 2), (window.screen.height / 2) - (600 / 2));

        //alert(document.all.hdnInstallCode.value + "...." + document.all.hdnUname.value);
        var URL = "../EditInstallation.aspx?InstallCode=" + document.all.hdnInstallCode.value + "&From=InsallSummary&Uname=" + document.all.hdnUname.value;

        window.location = URL;

        return false;

    }


    // ----------------------------------------------   RebuildTable Start

    function RebuildTable() {

        var output = "";
        var header = "";
        var footer = "";
        var footer1 = "";
        var counter = 1;
        var clr;


        clr = "grid_background";

        //alert(RowCount)

        for (var j = 0; j < RowCount; j++) {


            if (aWarType[j] != "") {


                if (clr == "grid_background1")
                    clr = "grid_background";
                else
                    clr = "grid_background1";


                output += "<tr valign='middle' style='height:30px' align='center' class=" + clr + " >"
                output += "<td align='center' class=" + clr + ">" + counter + "</td>";
                output += "<td align='center' class=" + clr + ">" + aWarType[j] + "</td>";
                output += "<td align='center' class=" + clr + ">" + aMonth[j] + "</td>";
                output += "<td align='center' class=" + clr + ">" + aNoofVisit[j] + "</td>";
                output += "<td align='center' class=" + clr + ">" + aWarStartDate[j] + "</td>";
                output += "<td align='center' class=" + clr + ">" + aWarEndDate[j] + "</td>";

                output += "<td align='center' valign='middle' class=" + clr + " ><img src='../images/delete-but.png' width='16' height='16' onClick='RemoveFromList(" + j + ")'  ></td>"
                output += "</tr>";


                counter += 1;
                countdsds = counter;
            }
        }

        header += "<tr style='background-color:#dfe7f7;height:30px'>"
        header += "<th width='5%' align='center' valign='middle'  class='gadget_heading_txt' style='text-align:center;'>S.No.</th>";
        header += "<th width='20%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>Type</th>";
        header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>Month</th>";
        header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>No of Visit</th>";
        header += "<th width='20%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'> WarStartDate </th>";
        header += "<th width='20%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>WarEndDate </th>";
        header += "<th width='10%'  align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>Remove</th>";
        header += "</tr>";


        if (output != "") {

            output = "<table width='98%' align='center'  border='0' class='TD_border' cellpadding='0' cellspacing='1' id='DispTable'>" + header + output + footer + "</table>";
        }
        else {
            output = "<table>" + footer1 + "</table>";
        }
        if (output != "") {

            document.getElementById('WarrantyList').innerHTML = output;
        }
        else {
            document.getElementById("WarrantyList").innerHTML = "";
        }
        countdsds = counter;



    }


    function RemoveFromList(removeid) {

        /*For Summary screen so false */
        return false;

        aMonth[removeid] = "";
        aWarType[removeid] = "";
        aWarStartDate[removeid] = "";
        aWarEndDate[removeid] = "";
        aNoofVisit[removeid] = "";
        countdsds = countdsds + 1;


        //RebuildValue(); //RebuildTable() called inside RebuildValue
        RebuildTable();
        return false;
    }






        function AttachValidation() {


            var FileAttach = document.getElementById("FileAttach").value;
            if (FileAttach == "" || FileAttach == null) {
                alert('Please Select the File.. ');
                return false;
            }
 
        }





    function Closefun(msg) {


        alert(msg);
        window.parent.location.reload();
    }






    </script>

    
   




</head >







        <body onload="load()">


            <div class="container-fluid">
                <form id="form_logout" runat="server">

            <%-- script manager for grid updatepanel --%>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>

            <%--HEADER ROW--%>

                    <div style="text-align: left;">
                        <div class="container">
                            <h5 style="color: blueviolet;">Instalation Summary</h5>
                        </div>
                    </div>


                    <div style="text-align: left;">
                        <div class="container">

                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="InstallInfotab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true" onclick="ChangeTab('InstallTab')">Installatoin Info</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="SLAInfotab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false" onclick="ChangeTab('SLATab')">SLA info</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="ComponentsInfotab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false" onclick="ChangeTab('ComponentsTab')">Components info</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="AttachmentInfotab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false" onclick="ChangeTab('AttachmentTab')">Attachments</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link disabled" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">
                                        <img src="../images/Arrowhead.png" width="20" height="20" />
                                    </button>
                                </li>



                                <li class="nav-item" role="presentation">
                                    <asp:Button ID="btnCopyIns" runat="server" Style="width: 70px" OnClientClick="return Validation();" value="Copy" class="btn btn-primary btn-sm" Text="Copy" />
                                </li>
                                <li class="nav-item" role="presentation">
                                    <asp:Button ID="btnEditIns" runat="server" Style="width: 70px" OnClientClick="return EditInstallation();" value="Edit" class="btn btn-primary btn-sm" Text="Edit" />
                                </li>

                            </ul>

                        </div>
                    </div>


                    <br />

            <%--Installatoin Detail--%>
                    <fieldset style="border: solid 0px red;">

                <%--section 1--%>
                        <div id="InstallInfo" style="display: block;">

                            <nav class="navbar navbar-light">
                                <div class="container-fluid" style="background-color: #1e2f97; border-bottom: solid 1px lightgray; color: white; border-radius: 5px;">
                                    <a class="navbar-brand" style="color: white; font-family: Calibri; font-size: medium;" href="#">Installatoin Info</a>
                                </div>
                            </nav>


                    <%--MAIN ROW--%>

                            <div class="row">
                                <div id="main" class="container-fluid">


                            <%------------- Installatoin Info--%>

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: red">*</span> Model No</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtProduct" readonly="true" name="txtModelNo" style="width: 200px;" runat="server" class="form-control form-control-sm" />

                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: blue">*</span>Product Dec</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtProductDec" readonly="true" style="width: 200px;" runat="server" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: blue">*</span>Searial No</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtSerialNo" style="width: 200px;" runat="server" class="form-control form-control-sm" readonly="true" value="Auto" />
                                        </div>

                                    </div>





                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right">Sales Order </div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtSalesOrder" readonly="true" name="txtSalesOrder" style="width: 200px;" runat="server" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">Sales Order Date</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" readonly="true" style="width: 200px;" id="txtSODate" runat="server" class="form-control form-control-sm" />
                                    <%--<img border="0" src="images/calender_icon.png" style="cursor:pointer;" align="middle" onclick="showCal(document.all.txtSODate,1)"/>--%>
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: red">*</span>Field Update</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtFieldUpdate" readonly="true" name="txtPo" style="width: 200px;" runat="server" class="form-control form-control-sm" />
                                        </div>

                                    </div>

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: red">*</span> Po </div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtPo" readonly="true" name="txtPo" style="width: 200px;" runat="server" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: red">*</span>Po Date</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" readonly="true" style="width: 200px;" id="txtPODate1" runat="server" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: red"></span>Software</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <asp:DropDownList ID="DDSoftware" readonly="true" Style="width: 200px;" runat="server" class="form-control form-control-sm"></asp:DropDownList>
                                        </div>

                                    </div>

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: red">*</span> Invoice No </div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtInvoiceNo" readonly="true" name="txtAccount" style="width: 200px;" runat="server" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: red">*</span>Invoice Date</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input readonly="true" type="text" style="width: 200px;" id="txtInDate" runat="server" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">Trade-Up SID</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtTradeUpSID" style="width: 200px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>

                                    </div>

                                    <br />

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: blue">*</span>Principal</div>
                                        <div class="col-sm-10 col-md-4" align="left">
                                            <input type="text" id="txtPrincipal" style="width: 380px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">Distent from Service Location</div>
                                        <div class="col-sm-10 col-md-4" align="left">
                                            <input type="number" id="txtDistentService" readonly="true" style="width: 350px;" runat="server" class="form-control form-control-sm" />
                                        </div>

                                    </div>

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right">Remarks </div>
                                        <div class="col-sm-10 col-md-4" align="left">
                                            <textarea id="txtComments" style="width: 380px;" readonly="readonly" rows="3" runat="server" class="form-control form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"></div>
                                        <div class="col-sm-10 col-md-4" align="left">
                                        </div>

                                    </div>



                            <%------------- Warranty Info--%>


                                    <br />

                                    <nav class="navbar navbar-light">
                                        <div class="container-fluid" style="background-color: #1e2f97; border-bottom: solid 1px lightgray; color: white; border-radius: 5px;">
                                            <a class="navbar-brand" style="color: white; font-family: Calibri; font-size: medium;" href="#">Warranty Info</a>
                                        </div>
                                    </nav>

                                    <br />

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: red">*</span>Install Date</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" readonly="readonly" style="width: 200px;" id="txtInstallDate" runat="server" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: blue">*</span>Warranty Start</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" style="width: 200px;" id="txtWSDate" readonly="true" runat="server" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: blue">*</span>Warranty End</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" style="width: 200px;" id="txtWEDate" readonly="true" runat="server" class="form-control form-control-sm" />
                                        </div>

                                    </div>

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: red">*</span> Warranty Type</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtWarrantyType" readonly="readonly" style="width: 200px;" runat="server" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: red">*</span> Month</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="number" id="txtMonth" readonly="readonly" style="width: 200px;" runat="server" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">Number Of Visit</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="number" id="txtNumberOfVisit" readonly="readonly" style="width: 100px;" runat="server" class="form-control form-control-sm" />
                                        </div>

                                    </div>

                                    <br />

                                    <div class="form-group row">
                                        <div class="col-sm-2 col-md-12" style="color: black;" align="center">
                                            <button type="submit" runat="server" id="btnSubmit" readonly="readonly" style="width: 130px;" class="btn btn-primary btn-sm disabled" onclick="AddToList();return false;"><i style="letter-spacing: 08px;" class="bi bi-plus"></i>Add To List</button>
                                        </div>
                                    </div>


                                    <br />


                                    <div class="col-sm-2 col-md-12" style="color: black;" align="center">
                                        <div id="WarrantyList"></div>
                                    </div>



                            <%-- ----------- Account and Contact Info--%>


                                    <br />

                                    <nav class="navbar navbar-light">
                                        <div class="container-fluid" style="background-color: #1e2f97; border-bottom: solid 1px lightgray; color: white; border-radius: 5px;">
                                            <a class="navbar-brand" style="color: white; font-family: Calibri; font-size: medium;" href="#">Account and Contact Info</a>
                                        </div>
                                    </nav>

                                    <br />

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: red">*</span>Account</div>
                                        <div class="col-sm-10 col-md-6" align="left">
                                            <input type="text" id="txtAccount" style="width: 559px;" runat="server" class="form-control form-control-sm" readonly="true" />

                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 91px;" align="right"><span style="color: blue">*</span>Industry</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtIndustry" style="width: 200px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>

                                    </div>

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: blue">*</span>Address</div>
                                        <div class="col-sm-10 col-md-6" align="left">
                                            <input type="text" id="txtAddress" style="width: 559px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 91px;" align="right"><span style="color: blue">*</span>Site</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtSite" style="width: 200px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>

                                    </div>

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: blue">*</span>City</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtCity" name="txtAccount" style="width: 200px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: blue">*</span> State</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtstate" name="txtstate" style="width: 200px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: blue">*</span> Pin Code</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtPinCode" style="width: 200px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>

                                    </div>

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: red">*</span>Contact</div>
                                        <div class="col-sm-10 col-md-2" align="left">

                                            <input type="text" id="DDContact1" style="width: 200px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: blue">*</span> Mobile</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtMobile" style="width: 200px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: blue">*</span> Department</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtDepartment" style="width: 200px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>

                                    </div>

                                    <br />
                            <%-- ----------- Allocation Info--%>

                                    <nav class="navbar navbar-light">
                                        <div class="container-fluid" style="background-color: #1e2f97; border-bottom: solid 1px lightgray; color: white; border-radius: 5px;">
                                            <a class="navbar-brand" style="color: white; font-family: Calibri; font-size: medium;" href="#">Allocation Info</a>
                                        </div>
                                    </nav>

                                    <br />

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right">Engineer 1</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <asp:DropDownList ID="DDEngineer1" readonly="readonly" Style="width: 200px;" runat="server" class="form-control form-control-sm"></asp:DropDownList>
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">Engineer 2</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <asp:DropDownList ID="DDEngineer2" readonly="readonly" Style="width: 200px;" runat="server" class="form-control form-control-sm"></asp:DropDownList>
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">Sub Status</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" id="txtsubstatus" style="width: 200px;" runat="server" class="form-control form-control-sm" readonly="true" />
                                        </div>

                                    </div>


                                    <br />
                                    <br />
                                    <br />

                            <%--onclick="return Validation();"--%>

                                    <div class="form-group row">
                                        <div class="col-sm-2 col-md-6" style="color: black;" align="right">

                                    <%--<asp:Button ID="btnsubmitIns" runat="server" style="width:130px" OnClientClick="return Validation();" value="Submit" class="btn btn-primary btn-sm" Text="Submit" />--%>
                                        </div>
                                        <div class="col-sm-2 col-md-6" style="color: black;" align="left">
                                    <%--<button type="submit" runat="server" id="btnreset" style="width:130px" class="btn btn-primary btn-sm" >Reset</button>--%>
                                        </div>
                                    </div>



                                </div>
                            </div>


                        </div>

                <%--section 2--%>
                        <div id="SLAInfo" style="display: none;">

                            <nav class="navbar navbar-light">
                                <div class="container-fluid" style="background-color: #1e2f97; border-bottom: solid 1px lightgray; color: white; border-radius: 5px;">
                                    <a class="navbar-brand" style="color: white; font-family: Calibri; font-size: medium;" href="#">Installatoin Info</a>
                                </div>
                            </nav>


                        </div>


                <%--section 3--%>
                        <div id="ComponentsInfo" style="display: none;">

                            <nav class="navbar navbar-light">
                                <div class="container-fluid" style="background-color: #1e2f97; border-bottom: solid 1px lightgray; color: white; border-radius: 5px;">
                                    <a class="navbar-brand" style="color: white; font-family: Calibri; font-size: medium;" href="#">Installatoin Info</a>
                                </div>
                            </nav>


                        </div>


                <%--section 4--%>
                        <div id="AttachmentInfo" style="display: none;">


                            <nav class="navbar navbar-light">
                                <div class="container-fluid" style="background-color: #1e2f97; border-bottom: solid 1px lightgray; color: white; border-radius: 5px;">
                                    <a class="navbar-brand" style="color: white; font-family: Calibri; font-size: medium;" href="#">Attachments</a>
                                </div>
                            </nav>


                            <div class="row">
                                <div id="Attachcontainer" class="container-fluid" >


                            <%------------- Attachment Info--%>

                                    <br />

                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: red">*</span>Attachment</div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <label class="custom-file-upload">
                                                <asp:FileUpload ID="FileAttach" TabIndex="32" Style="padding: 4px;" Width="100%" Font-Size="12px" runat="server" />
                                                <img src="images/Icon feather-upload-cloud.png" style="vertical-align: middle; height: 15px; width: 15px; position: relative; top: 2px; left: 0px;" alt="In Progress" border="0" /><br />
                                                <span id="ChooseFile" style="font-size: 11px; position: relative; top: -5px; left: 0px;" runat="server">Choose File</span>

                                            </label>
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: blue">*</span> User Name </div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" readonly="true" style="width: 200px;" id="txtUserName" runat="server" class="form-control form-control-sm" />
                                        </div>

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: blue">*</span> Date </div>
                                        <div class="col-sm-10 col-md-2" align="left">
                                            <input type="text" readonly="true" style="width: 200px;" id="txtDate" runat="server" class="form-control form-control-sm" />
                                        </div>

                                    </div>

                                     
                                    <%--&nbsp;--%>
                                    <div class="form-group row">

                                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right">Comments </div>
                                        <div class="col-sm-10 col-md-4" align="left">
                                            <textarea id="txtComment" style="width: 560px;"  rows="3" runat="server" class="form-control form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                        </div>
                                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"></div>
                                        <div class="col-sm-10 col-md-4" align="left">
                                        </div>

                                    </div>
                                    <br />
                                    <div class="form-group row">

                                        <div>
                                            <center>
                                                <asp:Button ID="btnAttach" runat="server" Style="width: 130px" OnClientClick="return AttachValidation();" value="Save" class="btn btn-primary btn-sm" Text="Save" OnClick="btnAttach_Click" />
                                            </center>
                                        </div>
                                    </div>



                                    <br />
                                    <div class="panel-group" id="ProductInfoParent" role="tablist" aria-multiselectable="true" style="margin: 0px 10px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none;">
                                        <div class="panel" style="border-radius: 0px;">

                                    <%--class="panel-collapse collapse"--%>
                                            <div id="ProductInfoContainer"  role="tabpanel" aria-expanded="true" aria-labelledby="AccountInfoHeading"">
                                                <div class="panel-body">
                                                    <div class="container-fluid">
                                                    </div>



                                                    <!-- Slider Attachment hardcoded -->

                                                    <div id="NoAttachments" runat="server">
                                                    </div>

                                                    <div id="AttachedThumbnailslider">
                                                        <div class="list_carousel responsive" style="width: 80%; margin-left: 13%;">

                                                            <ul id='SRAttachments' style='width: 820px !important; height: 107.391px !important;' runat="server">
                                                            </ul>
                                                        </div>


                                                        <div class="clearfix"></div>
                                                        <div>
                                                            <a id="prev3" class="prev3" href="#">
                                                                <img src="images/Caoufred_leftarrow.png" style="padding-left: 9px; padding-right: 9px; padding-top: 100px; padding-bottom: 18px;" /></a>
                                                            <a id="next3" class="next3" href="#">
                                                                <img src="images/Caoufred_rightarrow.png" style="padding-left: 9px; padding-right: 9px; padding-top: 100px; padding-bottom: 18px;" /></a>
                                                        </div>
                                                    </div>

                                                    <center>
                                                        <div style="text-align: center; height: 30px; border: 1px solid orange; border-radius: 5px; color: black; width: 300px;">
                                                            <span>Count of Attachment : <asp:Label ID="LabAttachCount" runat="server" ></asp:Label> </span>
                                                        </div>
                                                    </center>


                                                </div>
                                            </div>
                                        </div>
                                    </div>










                            <%--onclick="return Validation();"--%>

                                    <div class="form-group row">
                                        <div class="col-sm-2 col-md-6" style="color: black;" align="right">

                                    <%--<asp:Button ID="btnsubmitIns" runat="server" style="width:130px" OnClientClick="return Validation();" value="Submit" class="btn btn-primary btn-sm" Text="Submit" />--%>
                                        </div>
                                        <div class="col-sm-2 col-md-6" style="color: black;" align="left">
                                    <%--<button type="submit" runat="server" id="btnreset" style="width:130px" class="btn btn-primary btn-sm" >Reset</button>--%>
                                        </div>
                                    </div>



                                </div>
                            </div>


                        </div>


                    </fieldset>



                    <!-- Modal -->
                    <div>

                        <!-- Modal -->
                        <div class="modal fade" id="AccountEditModal" role="dialog">

                            <div class="modal-dialog AccountSummary-content" style="width: 90%;">

                                <!-- Modal content-->
                                <div class="modal-content AccountSummary-content" style="width: 1300px; height: 700px; margin-left: -400px; margin-top: 100px; border: 3px solid #1e2f97; border-radius: 5px;">
                                    <div class="modal-body AccountSummary-body">
                                        <div style="text-align: right;">
                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="border: none; background-color: white; height: 25px; width: 25px;">
                                                <img src="../images/Cancel.png" width="25" height="25" style="margin-left: -10px;" />
                                            </button>
                                        </div>



                                        <iframe id="objAccountEditModal" src="" style="width: 100%; border-width: 0px; height: 90%; display: block; margin-top: 2px;" scrolling="no">Your browser doesn’t support the object tag.
                                        </iframe>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>


            <%--Empty Detail--%>
                    <fieldset id="ContinfoField" style="border: solid 0px red; display: block;">

                <%--<nav class="navbar navbar-light">
                    <div class="container-fluid" style="background-color: #1e2f97; border-bottom: solid 1px lightgray; color: white; border-radius: 5px;">
                        <a class="navbar-brand" style="color: white;font-family:Calibri;font-size:medium;" href="#">Contact info</a>
                    </div>
                </nav>


                <div class="grid-d" align="center">

                       <asp:GridView ID="GridViewContDetail" style="" runat="server" width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" 
                           DataKeyNames="ContCode" EmptyDataText="There are no data records to display." HeaderStyle-BackColor="#3AC0F2" RowStyle-BackColor="#ffffff" AllowPaging="true" >
                           <Columns>

                               <asp:TemplateField HeaderStyle-ForeColor="white" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="">
                                   <ItemTemplate>
                                       <img src="../images/edit-info.png" width="20" height="20" style="margin-top: -5px;" />
                                       <asp:HyperLink  runat="server" Font-Size="Small"  data-bs-toggle="modal" data-bs-target="#exampleModalCenter" Text='Edit' NavigateUrl="#" onclick='<%# "javascript:EditCont(\"" +  Eval("ContCode")  +  "\");return false; " %>' /> 
                                   </ItemTemplate>
                               </asp:TemplateField>
                               <asp:BoundField HeaderText="Contact Name" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="Name" ItemStyle-Width="200px" />
                               <asp:BoundField HeaderText="Department" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="Department" />
                               <asp:BoundField HeaderText="Designation" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="Designation" />
                               <asp:BoundField HeaderText="Mobile No" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="MobileNo" />
                               <asp:BoundField HeaderText="Email" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="Email" />
                               <asp:BoundField HeaderText="City" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="City" />
                               <asp:BoundField HeaderText="State" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="State" />

                           </Columns>
                       </asp:GridView>  
                </div>--%>
                    </fieldset>



            <%--FOOTER ROW--%>

                    <%--<div class="row">
                <div id="food" class="col-md-12 border">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>--%>

                    <%--HIDDEN FIELD--%>







                    <%--Hidden Field--%>

                    <asp:HiddenField ID="hdnAccCode" runat="server" />
                    <asp:HiddenField ID="hdnInstallCode" runat="server" />
                    <asp:HiddenField ID="hdnFrom" runat="server" />
                    <input type="hidden" name="hdnUname" id="hdnUname" runat="server" />
                    <input type="hidden" name="hdnWarrantyInfo" id="hdnWarrantyInfo" runat="server" />
                    <input type="hidden" name="hdnComponentInfo" id="hdnComponentInfo" runat="server" />

                    <input type="hidden" name="hdnContcode" id="hdnContcode" runat="server" />


                </form>
            </div>



        </body>



     
    <%----------------------------------------------  //  For attachments Start         --%>
    <script type="text/javascript">




        //For attachments Start
        if (document.getElementById('attachimg')) {
            //alert("test1")
        }
        else {
            //alert("test")
            document.getElementById('next3').style.display = 'none';
            document.getElementById('AttachedThumbnailslider').style.display = 'none';
            document.getElementById('NoAttachments').innerHTML = "<table class='bodytxt_black' cellspacing='0' cellpadding='4' rules='all' border='1'  style='width:100%;border-collapse:collapse;'><tbody><tr style='color:Red;'><td colspan='4'>No Records to Display</td></tr></tbody></table>";
        }

        $(function () {

            //	Responsive layout, resizing the items


            $('#SRAttachments').carouFredSel({
                responsive: true,
                auto: false,
                prev: '.prev3',
                next: '.next3',
                width: '100%',
                scroll: 1,
                items: {
                    width: 400,
                    height: '30%',	//	optionally resize item-height
                    visible: {
                        min: 1,
                        max: 1
                    }
                }
            });
        });

        //For attachments End

        $("#dotcomments").click(function () {
            $(this).remove();
            $("#SRAttachments li").attr("style", "height:auto!important");
        });






        function Attachfile(k) {
            filename = document.all("hdnFileName" + k).value
            actfilename = document.all("hdnActFileName" + k).value
            window.open("download.asp?file=" + filename + "&clientfile=" + actfilename + "&Mode=1");
            return false;
        }




    </script>

</html >
