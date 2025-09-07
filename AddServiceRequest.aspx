<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddServiceRequest.aspx.cs" Inherits="apa_pack.AddServiceRequest" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <%--boostrap icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"/>

    <link rel="stylesheet" href="css/homes.css"/>
    <link href="css/CommonStyles.css" rel="stylesheet" />

 
            <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>      
    <script src="http://someothersite.com/external.js"></script>


    <%-- For Auto complete text Start --%>

      <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <link rel="Stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/redmond/jquery-ui.css" />
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>

    <%-- For Auto complete text End --%>

    <style type="text/css">

        html {
            overflow-x: hidden;
        }

        body {
            font-family: poppins;
            font-size: medium;
            /*font-weight:bold;*/
        }


        .form-group{
            padding-top:2px;
            
        }



        .grid_background {
            background-color: #dfe7f7;
            border-bottom: 1px solid #c5e2f3;
            height: 22px;
            FONT-WEIGHT: normal;
            FONT-SIZE: 11px;
            COLOR: #000000;
            FONT-FAMILY: Poppins;
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


        

    </style>

    <script type="text/javascript">



        $(function () {

            var selectedAccount = "";
            var selectedWarrantyStatus = "";

            $("#ContentPlaceHolder1_txtSerialNo").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "AddServiceRequest.aspx/GetSerialNo",
                        data: JSON.stringify({ pre: request.term }),
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            var resultArray = [];
                            var items = data.d;

                            // Process every 3 items (Account, ~, WarrantyStatus)
                            for (var i = 0; i < items.length; i += 5) {
                                resultArray.push({
                                    label: items[i + 0],         // Serial No
                                    value: items[i + 0],         // What appears in textbox
                                    AccountName: items[i + 2],
                                    warranty: items[i + 4]   // Warranty status
                                });
                            }

                            response(resultArray);
                        },
                        error: function (xhr, status, error) {
                            alert("Error: " + status);
                        }
                    });
                },
                select: function (event, ui) {

                    // Set text in textbox
                    $("#ContentPlaceHolder1_txtSerialNo").val(ui.item.label);

                 
                    selectedAccount = ui.item.AccountName;
                    selectedWarrantyStatus = ui.item.warranty;
                      
                    document.all.LblAccountName.innerHTML = selectedAccount;
                    document.all.LblWarrantyStatus.innerHTML = selectedWarrantyStatus;
                    

                    return false;
                },
                minLength: 1
            });
        });
    </script>

<%--<script type="text/javascript">
    var selectedAccCode = ""; // Variable to store the selected code

    $(function () {
        $("#ContentPlaceHolder1_txtSerialNo").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "AddServiceRequest.aspx/GetSerialNo",
                    data: JSON.stringify({ pre: request.term }),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var resultArray = [];
                        var items = data.d;

                        for (var i = 0; i < items.length; i += 3) {
                            resultArray.push({
                                label: items[i + 2], // Account name
                                value: items[i + 2], // What shows in textbox
                                code: items[i]       // AccCode
                            });
                        }

                        response(resultArray);
                    },
                    error: function (xhr, status, error) {
                        alert("Error: " + status);
                    }
                });
            },
            select: function (event, ui) {
                // Set text in textbox
                $("#ContentPlaceHolder1_txtSerialNo").val(ui.item.label);

                // Save code to JS variable
                selectedAccCode = ui.item.code;
                //alert(selectedAccCode)
                // Optional: store in hidden field
                $("#LblAccountName").val(ui.item.code);
                document.all.LblAccountName.innerHTML = selectedAccCode;

                return false;
            },
            minLength: 1
        });
    });
</script>--%>

    <script type="text/javascript">

        function TestMessage(mgs){

            alert(mgs);
        }

        RowCount = 0;
        ContRowCount = 0;

        aWarType = new Array(100);
        aMonth = new Array(100);
        aNoofVisit = new Array(100);
        aModule = new Array(100);
        aWarStartDate = new Array(100);
        aWarEndDate = new Array(100);




        function load() {


             

        }



        function ChangeTab(From) {




        }


        function GetProductDetail() {


            //alert(document.all.DDProduct.value)

            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (document.all.DDProduct.value != "") {
                var sURL = "WebService.asmx/GetProductDetails"
                xml.open("POST", sURL, false);

                xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var str = "ProdCode=" + document.all.DDProduct.value;
                xml.send(str)
                //alert(str)
                lsval = xml.responseText;
                //alert(lsval)
                //ContactComboBox.ClearItems();
                //ContactComboBox.AddItem("<-Select->", "", 0);


                if (lsval != "") {
                    arReceived = lsval.split(";");
                    //alert(arReceived.length)
                    for (i = 0; i < arReceived.length - 1; i++) {
                        //arToBind = arReceived[i].split("||");

                        document.all.txtProductDec.value = arReceived[0]
                        document.all.txtPrincipal.value = arReceived[1];

                        //Static.PerformCallback();

                    }



                }

            }


        }



        function EditAccountscreen(From) {


            //Retvals = window.open("../EditAccount.aspx?AccCode=" + AccCode, null, "width=1300,height=700");
            //Retvals.moveTo((window.screen.width / 2) - (1200 / 2), (window.screen.height / 2) - (600 / 2));

            var URL = "../EditAccount.aspx?AccCode=" + document.all.hdnAccCode.value + "&From=" + From;
            window.location = URL;


        }
        function ContAddscreen(From) {


            var URL = "../AddContack.aspx?AccCode=" + document.all.hdnAccCode.value + "&From=" + From;
            window.location = URL;


        }

        function EditCont(ContCode) {

            var URL = "../AddContack.aspx?AccCode=" + document.all.hdnAccCode.value + "&ContCode=" + ContCode + "&From=EditCont";
            window.location = URL;

        }



        // ----------------------------------------------  Install Date Validation Start

        function FunWarrantyStartDate(Id) {

            var year, month, day, jsDate, WARStartDate, WAREndmyDate;

            if (document.all.txtInstallDsate.value != "") {

                //alert(document.all.txtInstallDsate.value)
                if (Id == "txtInstallDsate") {


                    frmv = rtndateonly1(document.all.txtInstallDsate, "Install Date");
                    //alert(frmv)
                    if (frmv == false) {

                        return false;
                    }
                    else {

                        var from = $("#txtInstallDsate").val().split("-");
                        //alert(from[2])
                        var jsDate = new Date(from[0], from[1] - 1, from[2]);
                        //alert(jsDate)
                        year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
                        month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
                        day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

                        //  WARStartDate = new Date(from[2], from[1], from[0]);
                        //WAREndmyDate = new Date(from[2], from[1]-1, from[0]- 1);

                        //year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
                        //month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
                        //day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)


                        WARStartDate = new Date(year, month, day);
                        WAREndmyDate = new Date(year, month, day - 1);

                        //  WARStartDate = day + '/' + month + '/' + year;
                        //   WAREndmyDate = day - 1 + '/' + month + '/' + year;
                        WARStartDate = convertDate(WARStartDate)
                        WAREndmyDate = convertDate(WAREndmyDate)
                        //alert(WARStartDate)
                        initstartdate = WAREndmyDate;
                        startdate = WARStartDate;
                        enddate = WAREndmyDate;
                        prevenddate = WAREndmyDate;
                        //alert(WARStartDate)
                        document.all.txtWSD.value = WARStartDate;
                        //alert(document.all.txtWSD.value)

                    }

                }
                else if (Id == "txtMonth") {

                    //alert(Id)
                    var from = $("#txtWSD").val().split("-");
                    var jsDate = new Date(from[0], from[1] - 1, from[2]);
                    year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
                    month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
                    day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

                    WARStartDate = new Date(year, month, day);

                    //alert(WARStartDate)
                    WARStartDate = convertDate(WARStartDate);
                    WAREndmyDate = convertDate(WARStartDate);

                    initstartdate = WAREndmyDate;

                    //document.all.txtWED.value = WAREndmyDate;

                    recalculateDate(Id, document.all.DDWarrantyType.value, document.all.txtMonth.value);

                    //RebuildValue();
                }
                //else {
                //    alert("else")
                //    recalculateDate(id, aWarType[id], aMonth[id]);
                //}
            }



        }



        function rtndateonly1(inobj, inmessage) {


            var slashcount, input, dd, mm, yy, l, i;
            var retdd, retmm, retyyyy;
            var message;
            var datearr = new Array();
            message = inmessage;

            //alert(inobj.value)
            input = inobj.value;

            if (input == "") {
                return true;
            }
            slashcount = 0;
            l = input.length;
            //alert(l)
            for (i = 0; i < l; i++) {
                //alert(input.charAt(i))
                if (input.charAt(i) == "-") {
                    slashcount++;
                }
            }
            //alert(input.charAt(3))

            if (slashcount != 2) {

                alert(message + "   Not A Valid Date \n  Format : DD/MM/YYYY  ");
                //inobj.focus();
                return false;
            }

            datearr = input.split("-")
            //alert(datearr)
            dd = datearr[2];
            mm = datearr[1];
            yy = datearr[0];

            if (yy.length > 4) {
                alert(message + "   Not A Valid Date \n  Format : DD/MM/YYYY  ");
                //inobj.focus();
                return false;
            }
            //alert(dd)

            if (dd == "" || isNaN(dd) || dd.length == 0 || dd.length > 2) {
                alert(" Invalid Day value in " + message)
                //inobj.focus();
                return false;
            }
            //alert(mm)
            if (mm == "" || isNaN(mm) || mm.length == 0 || mm.length > 2) {
                alert(" Invalid Month value in " + message)
                //inobj.focus();
                return false;
            }
            //alert(yy)
            if (yy == "" || isNaN(yy) || yy.length == 0 || yy.length == 1 || yy.length == 3) {
                alert(" Invalid Year value in " + message)
                //inobj.focus();
                return false;
            }
            //alert(yy.length)
            if (yy.length == 2) {
                retyyyy = twodigits(yy);
                //alert(retyyyy)
                if (retyyyy >= "00" && retyyyy <= "50") {
                    retyyyy = "20" + retyyyy;
                }
                else {
                    retyyyy = "19" + retyyyy;
                }
            }
            else {
                //alert(yy.charAt(0) + "........." + yy.charAt(1) + "..." + yy.charAt(2) + "...." + yy.charAt(3))

                retyyyy = twodigits(yy.charAt(0) + yy.charAt(1))
                //alert(retyyyy)
                retyyyy = retyyyy + twodigits(yy.charAt(2) + yy.charAt(3))
                //alert(retyyyy)
            }

            retdd = twodigits(dd)
            retmm = twodigits(mm)
            //alert(retmm)
            if (retdd <= "00" || retdd > "31") {
                alert("Invalid Day value in " + message);
                //inobj.focus();
                return false;
            }
            if (retmm <= "00" || retmm > "12") {
                alert("Invalid month value in " + message);
                //inobj.focus();
                return false;
            }
            if (retyyyy <= "0000") {
                alert("Invalid year value in " + message);
                //inobj.focus();
                return false;
            }
            if (retmm == "02" && retdd > "29") {
                alert("Invalid Day value for the Month in " + message);
                //inobj.focus();
                return false;
            }


            if ((retmm == "04" || retmm == "06" || retmm == "09" || retmm == "11") && retdd > "30") {
                alert("Invalid Day value for the Month in " + message);
                //inobj.focus();
                return false;
            }

            if (retmm == "02" && retdd > "28") {
                if ((parseInt(yy, 10) % 4) == 0) {
                    if (parseInt(yy, 10) % 100 == 0) {
                        if (parseInt(yy, 10) % 400 != 0) {
                            alert("Invalid Day value for the Month in " + message);
                            //inobj.focus();
                            return false;
                        }
                    }
                }
                if ((parseInt(yy, 10) % 4) != 0) {

                    alert("Invalid Day value for the Month in " + message);
                    //inobj.focus();
                    //return false;
                }
            }
            //End of Changes  

            //inobj.value = retdd + "/" + retmm + "/" + retyyyy;
            inobj.value = retyyyy + "-" + retmm + "-" + retdd;

            // alert(inobj.value)
            //alert("End")
            return true;
        }


        function twodigits(inval) {
            //alert(inval)
            var ret;
            if (inval.length == 1) // if single digit 
            {
                if (issingledigit(inval.charAt(0))) {
                    ret = "0" + inval;
                }
            }
            else				 //  if two digit
            {
                if (issingledigit(inval.charAt(0))) {
                    ret = inval.charAt(0);
                    if (issingledigit(inval.charAt(1))) {
                        ret = inval;
                    }
                    else {
                        ret = "0" + ret;
                    }
                }
                else {
                    if (issingledigit(inval.charAt(1)))
                        ret = "0" + inval.charAt(1);
                }
            }
            return ret;
        }




        function issingledigit(val) {
            if (val >= "0" && val <= "9") {
                return true;
            }
            else return false;
        }



        function convertDate(inputFormat) {

            function pad(s) { return (s < 10) ? '0' + s : s; }
            var d = new Date(inputFormat);
            //return [pad(d.getDate()), pad(d.getMonth() + 1), d.getFullYear()].join('-');
            return [d.getFullYear(), pad(d.getMonth() + 1), pad(d.getDate())].join('-');
        }


        function recalculateDate(id, WarType, currmonth) {

            //alert(id + "..." + WarType + "..." + currmonth);
            var totalmonth = 0;

            for (var j = 0; j < 0 + 1; j++) {
                //alert(currmonth)
                if (aWarType[j] != "")
                    totalmonth = parseInt(totalmonth) + parseInt(currmonth);

            }

            //alert(totalmonth);
            currmonth = totalmonth;
            if (WarType != "") {
                var WARStartDate, WAREndmyDate;

                //  jsDate = txtInstallDate.GetDate();

                var from = $("#txtInstallDsate").val().split("-"); // get install date value and split by '/'
                var jsDate = new Date(from[0], from[1] - 1, from[2]); // -1 month 

                //alert(jsDate)

                year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
                month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
                day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

                //alert(currmonth)
                var tmonths, actual, ret;
                tmonths = parseInt(month) + parseInt(currmonth);

                if (parseInt(tmonths) > 11) {
                    actual = parseInt(tmonths) % 12;
                }
                else {
                    actual = parseInt(tmonths);
                }

                WARStartDate = new Date(year, month, day);
                WAREndmyDate = new Date(year, parseInt(month) + parseInt(currmonth), day);

                //alert(WAREndmyDate)

                //   WARStartDate = convertDate(WARStartDate)
                //   WAREndmyDate = convertDate(WAREndmyDate)

                year2 = WAREndmyDate.getFullYear(); // where getFullYear returns the year (four digits)
                month2 = WAREndmyDate.getMonth(); // where getMonth returns the month (from 0-11)
                day2 = WAREndmyDate.getDate();
                minus = 1;

                if (month2 > actual) {

                    day2 = 1;
                    minus = 1;
                }
                else {
                    if (month == "3" || month == "5" || month == "8" || month == "10") {

                        minus = 1;
                        if (day == "30") {

                            if (month2 == "3" || month2 == "5" || month2 == "8" || month2 == "10") {
                                day2 = 30;
                                minus = 0;
                            }
                            else if (month2 == "0" || month2 == "2" || month2 == "4" || month2 == "6" || month2 == "7" || month2 == "9" || month2 == "11") {
                                day2 = 31;
                                minus = 0;
                            }

                        }
                    }
                    else if (month == "1") {
                        if (year % 4 == "0") {
                            if (day == "29") {
                                if (month2 == "3" || month2 == "5" || month2 == "8" || month2 == "10") {
                                    day2 = 30;
                                    minus = 0;
                                }
                                else if (month2 == "0" || month2 == "2" || month2 == "4" || month2 == "6" || month2 == "7" || month2 == "9" || month2 == "11") {
                                    day2 = 31;
                                    minus = 0;
                                }
                            }
                        }
                        else {
                            if (day == "28") {
                                if (month2 == "3" || month2 == "5" || month2 == "8" || month2 == "10") {
                                    day2 = 30;
                                    minus = 0;
                                }
                                else if (month2 == "0" || month2 == "2" || month2 == "4" || month2 == "6" || month2 == "7" || month2 == "9" || month2 == "11") {
                                    day2 = 31;
                                    minus = 0;
                                }
                            }
                        }
                    }
                }

                WAREndmyDate = new Date(year2, month2, parseInt(day2) - parseInt(minus));

                WAREndmyDate = convertDate(WAREndmyDate)  ///convert date format dd/mm/yyyy 
                //aWarStartDate[id] = WARStartDate;
                // txtWarrantyEnd.SetText(WAREndmyDate);

                document.all.txtWED.value = WAREndmyDate;
                //aWarEndDate[id] = WAREndmyDate;

            }

            /*
            
            
            if (id == '0')
            {
                enddate = initstartdate; 
            }
            if (WarType != "")
            {
                startdate = enddate;
        
                var Totday = 1;
                var jsDate = startdate;
                year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
                month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
                day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)
        
                var tmonths, actual, ret;
                tmonths = parseInt(month) + parseInt(currmonth);
                if (parseInt(tmonths) > 11)
                {
                    actual = parseInt(tmonths) % 12;
                }
                else
                {
                    actual = parseInt(tmonths);
                }
                var WARStartDate, WAREndmyDate;
                WARStartDate = new Date(year, month, parseInt(day) + Totday);
                WAREndmyDate = new Date(year, parseInt(month) + parseInt(currmonth), parseInt(day) + Totday - 1);
                ret = WAREndmyDate.getMonth();
        
                if (ret > actual)
                {
                    year = WAREndmyDate.getFullYear(); // where getFullYear returns the year (four digits)
                    month = WAREndmyDate.getMonth(); // where getMonth returns the month (from 0-11)
                    // day = WAREndmyDate.getDate();   // where getDate returns the day of the month (from 1-31)
                    day = 1;
        
                    WAREndmyDate = new Date(year, ret, parseInt(day) - 1);
                    prevenddate = WAREndmyDate;
                    previous = "yes";
                }
        
                aWarStartDate[id] = WARStartDate; 
                txtWarrantyEnd.SetText(WAREndmyDate);
                aWarEndDate[id] = WAREndmyDate; 
                enddate = WAREndmyDate; 
                  
            }
            */
        }


        // ----------------------------------------------   Install Date Validation End


        // ----------------------------------------------   AddToList Start


        function AddToList() {


            if (document.all.txtInstallDsate.value == "") {
                alert("Install Date Can\'t be Empty")
                txtInstallDsate.focus();
                return false;
            }


            // For Install Date validation
            frmv = rtndateonly1(document.all.txtInstallDsate, "Install Date");
            if (frmv == false) {
                // document.all.txtInstallDsate.value = "";
                return false;
            }

            if (document.all.DDWarrantyType.value == null || document.all.DDWarrantyType.value == "") {
                alert("Please select the Warranty Type");
                DDWarrantyType.focus();
                return false;
            }
            //else {
            //    document.all.hdnWarantyType.value = document.all.DDWarrantyType.value;
            //}



            if (document.all.txtMonth.value == "") {
                alert("Please Enter the Month");
                txtMonth.focus();
                return false;
            }

            //else {
            //    document.all.hdnMonth.value = Month;

            //}

            //if (document.all.txtNumberOfVisit.value == "") {
            //    alert("Please Enter the No of Visit");
            //    document.all.txtNumberOfVisit.focus();
            //    return false;
            //}



            for (var i = 0; i < RowCount; i++) {
                if (aWarType[i] != '' && aWarType[i] == document.getElementById('DDWarrantyType').value) {
                    alert('Warranty added already!')
                    return false;
                }
            }



            // Assigned values to Rebuild table

            aWarType[RowCount] = document.getElementById('DDWarrantyType').value;
            aMonth[RowCount] = document.getElementById("txtMonth").value;
            aNoofVisit[RowCount] = document.getElementById("txtNumberOfVisit").value
            aModule[RowCount] = "Insert";
            aWarStartDate[RowCount] = document.all.txtWSD.value;
            aWarEndDate[RowCount] = document.all.txtWED.value;


            RowCount = RowCount + 1;

            //prodTable = prodTable + 1;


            RebuildTable();

            document.getElementById('DDWarrantyType').value = '';
            document.getElementById("txtMonth").value = '';
            document.getElementById("txtNumberOfVisit").value = '';
            document.getElementById('txtWED').value = '';





            // Add Warranty info

            for (var i = 0; i < RowCount; i++) {
                if (aWarType[i] != "") {
                    document.getElementById("hdnWarrantyInfo").value += aWarType[i] + "~" + aMonth[i] + "~" + aNoofVisit[i] + "~" + aModule[i] + "~" + aWarStartDate[i] + "~" + aWarEndDate[i] + "#";
                }
                //alert(document.getElementById("hdnWarrantyInfo").value)
            }



            return true;
        }

        // ----------------------------------------------   AddToList Validation End
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

                    output += "<td align='center' valign='middle' class=" + clr + " ><img src='../images/delete-but.png' style='cursor:pointer;' width='16' height='16' onClick='RemoveFromList(" + j + ")' ></td>"
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
            //alert(removeid)
            aMonth[removeid] = "";
            aWarType[removeid] = "";
            aWarStartDate[removeid] = "";
            aWarEndDate[removeid] = "";
            aNoofVisit[removeid] = "";
            countdsds = countdsds + 1;

            //prodTable = prodTable - 1;

            //RebuildValue(); //RebuildTable() called inside RebuildValue
            RebuildTable();
            return false;
        }


        // ----------------------------------------------   RebuildTable End
        // ----------------------------------------------   Get Account Details Start

        function GetAccountDetail() {




            //alert(document.all.DDAccount.value)

            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (document.all.DDAccount.value != "") {
                var sURL = "WebService.asmx/GetAccountDetails"
                xml.open("POST", sURL, false);

                xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var str = "AccCode=" + document.all.DDAccount.value;
                xml.send(str)
                //alert(str)
                lsval = xml.responseText;
                //alert(lsval)
                //ContactComboBox.ClearItems();
                //ContactComboBox.AddItem("<-Select->", "", 0);


                if (lsval != "") {
                    arReceived = lsval.split(";");
                    //alert(arReceived.length)
                    for (i = 0; i < arReceived.length - 1; i++) {
                        //arToBind = arReceived[i].split("||");

                        document.all.hdnAccCode.value = arReceived[0];
                        document.all.txtAddress.value = arReceived[1];
                        document.all.txtIndustry.value = arReceived[2];
                        document.all.txtSite.value = arReceived[3];
                        document.all.txtCity.value = arReceived[4];
                        document.all.DDState.value = arReceived[5];
                        document.all.txtPinCode.value = arReceived[6];

                        //Static.PerformCallback();
                        //alert(document.all.hdnAccCode.value);

                        getcontactBind();
                    }



                }

            }




        }


        function getcontactBind() {


            // debugger;
            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (document.all.hdnAccCode.value != "") {
                var sURL = "WebService.asmx/GetContact"
                xml.open("POST", sURL, false);

                xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var str = "AccCode=" + document.all.hdnAccCode.value;
                xml.send(str)
                //alert(str)
                lsval = xml.responseText;
                //alert(lsval)
                //DDContact.ClearItems();
                //DDContact.AddItem("<-Select->", "", 0);


                if (lsval != "") {
                    arReceived = lsval.split("^^^");

                    // For clear dropdown
                    $("#DDContact").find('option').remove();

                    // For default select value
                    $("#DDContact").append($("<option>", {

                        value: '',
                        text: '<-Select->'

                    }));

                    // For dropdown bind values
                    for (i = 0; i < arReceived.length - 1; i++) {
                        arToBind = arReceived[i].split("|");
                        //alert(arToBind[2])

                        $("#DDContact").append($("<option>", {

                            value: arToBind[0],
                            text: arToBind[1]

                        }));

                    }


                }
                else {

                    $("#DDContact").find('option').remove();

                    $("#DDContact").append($("<option>", {

                        value: '',
                        text: '<-Select->'

                    }));

                }


            }
        }



        function GetContactDetails() {



            //alert(document.all.DDContact.value)

            document.all.hdnContcode.value = document.all.DDContact.value;

            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (document.all.DDContact.value != "") {
                var sURL = "WebService.asmx/GetContactDetail"
                xml.open("POST", sURL, false);

                xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var str = "ContCode=" + document.all.DDContact.value;
                xml.send(str)
                //alert(str)
                lsval = xml.responseText;
                //alert(lsval)
                //ContactComboBox.ClearItems();
                //ContactComboBox.AddItem("<-Select->", "", 0);


                if (lsval != "") {
                    arReceived = lsval.split(";");
                    //alert(arReceived.length)
                    for (i = 0; i < arReceived.length - 1; i++) {
                        //arToBind = arReceived[i].split("||");

                        document.all.txtMobile.value = arReceived[1]
                        document.all.txtDepartment.value = arReceived[2];


                        //Static.PerformCallback();
                        //alert(document.all.hdnAccCode.value);

                        getcontactData();
                    }



                }

            }


        }




        // ----------------------------------------------   Get Account Details End



        function Validation() {


            //--------------------------------------------- product info
            if (document.all.DDProduct.value == "") {
                alert("Model No Can't be Empty")
                DDProduct.focus();
                return false;
            }


            if (document.all.DDFieldUpdate.value == "") {
                alert("Field Update Can't be Empty")
                DDFieldUpdate.focus();
                return false;
            }


            if (document.all.txtPo.value == "") {
                alert("PO No Can't be Empty")
                txtPo.focus();
                return false;
            }

            if (document.all.txtPODate.value == "") {
                alert("PO Date Can't be Empty")
                txtPODate.focus();
                return false;
            }

            if (document.all.txtInvoiceNo.value == "") {
                alert("Invoice No Can't be Empty")
                txtInvoiceNo.focus();
                return false;
            }

            if (document.all.txtInvoiceDate.value == "") {
                alert("Invoice Date Can't be Empty")
                txtInvoiceDate.focus();
                return false;
            }
            //--------------------------------------------- Warranty info


            //alert(document.getElementById("hdnWarrantyInfo").value)
            if (document.getElementById("hdnWarrantyInfo").value == "") {
                alert("Warranty Details Can't be Empty ");
                return false;
            }


            //--------------------------------------------- Account info

            if (document.all.DDAccount.value == "" || document.all.DDAccount.value == "None") {
                alert("Please select Account")
                DDAccount.focus();
                return false;
            }

            if (document.all.DDContact.value == "" || document.all.DDContact.value == "None") {
                alert("Please select Contact")
                DDContact.focus();
                return false;
            }



            //--------------------------------------------- Allocation info




            //alert(document.getElementById("hdnWarrantyInfo").value)
            //return false;

        }

        function Closefun(msg) {


            alert(msg);
            window.parent.location.reload();

        }

    </script>





    <script type="text/javascript">


        function CallBackPage() {

            var URL = "../ServiceRequest.aspx";
            window.location = URL;
        }

        function funReset() {

            <%------------- Installatoin Info--%>
            document.all.DDProduct.value = "";
            document.all.txtProductDec.value = "";
            document.all.ContentPlaceHolder1_txtSerialNo.value = "";
            document.all.txtSalesOrder.value = "";
            document.all.txtSODate.value = "";
            
            document.all.txtPo.value = "";
            document.all.txtPODate.value = "";
            document.all.DDSoftware.value = "";
            document.all.txtInvoiceNo.value = "";
            document.all.txtInvoiceDate.value = "";
            document.all.txtTradeUpSID.value = "";
            document.all.txtPrincipal.value = "";
            document.all.txtDistentService.value = "";
            document.all.txtComments.value = "";


            <%------------- Warranty Info--%>

            document.all.txtInstallDsate.value = "";
            document.all.txtWSD.value = "";
            document.all.txtWED.value = "";
            document.all.DDWarrantyType.value = "";
            document.all.txtMonth.value = "";
            document.all.txtNumberOfVisit.value = "";


            <%-- ----------- Account and Contact Info--%>


            document.all.DDAccount.value = "";
            document.all.txtIndustry.value = "";
            document.all.txtAddress.value = "";
            document.all.txtSite.value = "";
            document.all.txtCity.value = "";
            document.all.DDState.value = "";
            document.all.txtPinCode.value = "";
            document.all.DDContact.value = "";
            document.all.txtMobile.value = "";
            document.all.txtDepartment.value = "";


            <%-- ----------- Allocation Info--%>

            document.all.DDEngineer1.value = "";
            document.all.DDEngineer2.value = "";
            document.all.DDSubStatus.value = "";


        }

    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <body onload="load()">
 
        <div style="background-color: #eceeef; padding: 0px;">
            <div id="main" class="col-md-12">

                



                    <%--HEADER ROW--%>


                    <%--Installatoin Detail--%>
                    <fieldset style="border: solid 0px red;">



                        <div class="row border-bottom" style="padding: 10px 10px;">
                            <div id="main_sub2_div" class="col-md-12 bg-light">


                                <div class="col-4 BarObjactsLeft">
                                    <span>
                                        <a href="#" onclick="CallBackPage()">
                                            <img src="../images/Back.svg" style="cursor: pointer;" />
                                        </a>
                                    </span>
                                    Service Request
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



                        <div class="container-fluid">

                            
                            <div class="container-fluid">

                                <div class="accordion" id="accordionExample">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingOne">
                                            <button class="accordion-button fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                Call Info
                                            </button>
                                        </h2>
                                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                            <div class="accordion-body">


                                                <div class="container-fluid">


                                                    <%------------- Installatoin Info--%>


                                                    <div class="form-group row">

                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right">Ticket No </div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="txtSalesOrder" name="txtSalesOrder" runat="server" class="formcontrol_Read form-control-sm" readonly="readonly" placeholder="Auto" />
                                                        </div>
                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right">Source</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <asp:DropDownList ID="DDSource" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                        </div>
                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">* </span>Call Date</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input placeholder="Select date" type="date" id="txtSODate" runat="server" class="formcontrol form-control-sm" />
                                                        </div>

                                                    </div>

                                                    <div class="form-group row">

                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">*</span> Serial No </div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <asp:TextBox ID="txtSerialNo" runat="server" CssClass="formcontrol form-control-sm" OnTextChanged="txtSerialNo_TextChanged" />
                                                        </div>
                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"></span> Product</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="Text1" name="txtPo" runat="server" class="formcontrol_Read form-control-sm" />
                                                        </div>
                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"></span>Priority</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <asp:DropDownList ID="DDPriority" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                        </div>

                                                    </div>

                                                    <div class="form-group row">

                                                        <div class="col-sm-2 col-md-8 col-lg-8">

                                                            <div class="row">

                                                                <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: red">*</span> Call Type </div>
                                                                <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                                    <asp:DropDownList ID="DDCallType" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: red">*</span> Sub Call Type</div>
                                                                <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                                    <asp:DropDownList ID="DDSubCallType" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                                </div>
                                                                
                                                                <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: red">*</span> Sub Status </div>
                                                                <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                                    <asp:DropDownList ID="DDSubstatus" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 col-lg-3 form-lable" align="right"><span style="color: red">*</span> Ref No</div>
                                                                <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                                                                    <input type="text" id="Text4" name="txtAccount" runat="server" class="formcontrol form-control-sm" />
                                                                </div>

                                                            </div>

                                                        </div>

                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right">Nature Of Problem</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <textarea id="txtComments" rows="3" runat="server" class="formcontrol_Area form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" ></textarea>
                                                        </div>

                                                    </div>


                                                    <div class="form-group row">

                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right">Engineer 1</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="Text6" runat="server" class="formcontrol form-control-sm" />
                                                        </div>

                                                         <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">*</span> Engineer 2 </div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="Text7" runat="server" class="formcontrol form-control-sm" />
                                                        </div>

                                                         <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">*</span> Schedule Date</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input placeholder="Select date" type="date" id="Date5" runat="server" class="formcontrol form-control-sm" />
                                                        </div>
                                                        

                                                    </div>


                                                    <div class="form-group row">
                                                         
                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right">Target Response Time</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="Text2" name="txtAccount" runat="server" class="formcontrol_Read form-control-sm" />
                                                        </div>

                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"></span> Target Resolution Time </div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="Text9" name="txtAccount" runat="server" class="formcontrol_Read form-control-sm" />
                                                        </div>

                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red"></span> Billable</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input class="formcontrol-input" type="checkbox" value="" id="flexCheckDefault">
                                                        </div>

                                                    </div>


                                                    <div class="form-group row">
                                                         
                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right"><span style="color: red">*</span> Contact</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="Text3" name="txtAccount" runat="server" class="formcontrol form-control-sm" />
                                                        </div>
                                                        <div class="col-sm-2 col-md-2 col-lg-2 form-lable" align="right">Mobile No</div>
                                                        <div class="col-sm-10 col-md-2 col-lg-2 form-text" align="left">
                                                            <input type="text" id="Text10" runat="server" class="formcontrol form-control-sm"/>
                                                        </div>

                                                    </div>


                                                    <br />




                                                </div>


                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwo">
                                                <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                    Site Info
                                                </button>
                                            </h2>
                                            <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">


                                                    <div class="container-fluid">


                                                        <%------------- Installatoin Info--%>


                                                        <!-- Details Info Section -->
                                                        <div class="card mb-4 shadow-sm rounded-3">
                                                            <div class="card-body">
                                                                <%--<h6 class="card-title fw-bold mb-3">Site Info</h6>--%>
                                                                <div class="row g-3">
                                                                    <div class="col-md-2">
                                                                        <label class="ContainerHeader">Account Name</label><br />
                                                                        <label class="ContainerValue" id="LblAccountName">--</label>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <label class="ContainerHeader">Warranty Status</label><br />
                                                                        <label class="ContainerValue" id="LblWarrantyStatus">--</label> 
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <label class="ContainerHeader">Open Call</label><br />
                                                                        <label class="ContainerValue">--</label>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <label class="ContainerHeader">Repeated Call</label><br />
                                                                        <label class="ContainerValue">--</label>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <label class="ContainerHeader">Pending Payments</label><br />
                                                                        <label class="ContainerValue">--</label>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <label class="ContainerHeader">PM Pending</label><br />
                                                                        <label class="ContainerValue">--</label>
                                                                    </div>
                                                                </div>
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


                                    <%--onclick="return Validation();"--%>

                                    <div class="form-group row">
                                        <div class="col-sm-2 col-md-12" style="color: black;" align="right">
                                        </div>
                                        <div class="col-sm-2 col-md-12" style="color: black;" align="right">
                                            <br />
                                            <button type="submit" runat="server" id="Button2" onclick="funReset()" class="btn btn-dark CancelButton">Reset</button>
                                            <asp:Button ID="Button1" runat="server" OnClientClick="return Validation();" value="Submit" OnClick="btnsubmitIns_Click" class="btn btn-warning SubmitButton" Text="Submit" />

                                        </div>

                                        <div class="col-sm-2 col-md-12" style="color: black;" align="right">

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


                

                    <%--Hidden Field--%>

                    <asp:HiddenField ID="hdnAccCode" runat="server" />
                    <asp:HiddenField ID="hdnFrom" runat="server" />

                    <input type="hidden" name="hdnWarrantyInfo" id="hdnWarrantyInfo" runat="server" />
                    <input type="hidden" name="hdnComponentInfo" id="hdnComponentInfo" runat="server" />

                    <input type="hidden" name="hdnContcode" id="hdnContcode" runat="server" />




                </div>

            </div>
        

    </body>


</asp:Content>
