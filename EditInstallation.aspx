 <%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EditInstallation.aspx.cs" Inherits="apa_pack.EditInstallation" EnableEventValidation="false"  %>

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

    <link rel="stylesheet" href="css/homes.css"/>
    <link href="css/CommonStyles.css" rel="stylesheet" />


 
            <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>   
    <script src="http://someothersite.com/external.js"></script>
     

    <%--For Select Date--%>
    <script type="text/javascript" src="js/SearchCalender.js"></script>
    <link href="css/Calender.css" rel="stylesheet" />


    <style type="text/css">


        

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



    </style>


    <script type="text/javascript">


       
        RowCount = 0;
        ContRowCount = 0;
        oneTimeRunContact = 0;

        aWarType = new Array(100);
        aMonth = new Array(100);
        aNoofVisit = new Array(100);
        aModule = new Array(100);
        aWarStartDate = new Array(100);
        aWarEndDate = new Array(100);


 

        function load() {


            /* ----------- Pageload default contact bind here ---------- */
            GetAccountDetail();
 
            /* ----------- End ---------- */



            /* ----------- Pageload default contact select here ---------- */
            //alert(document.all.hdnContcode.value)
            if (document.all.ContentPlaceHolder1_hdnContcode.value != "") {
                document.all.ContentPlaceHolder1_DDContact.value = document.all.ContentPlaceHolder1_hdnContcode.value;
            }
            /* ----------- End ---------- */

            //alert(document.all.hdnWarrantyInfo.value)
            rtnvalues = document.all.ContentPlaceHolder1_hdnWarrantyInfo.value;

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
            if (document.all.ContentPlaceHolder1_DDProduct.value != "") {
                var sURL = "WebService.asmx/GetProductDetails"
                xml.open("POST", sURL, false);
                 
                xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var str = "ProdCode=" + document.all.ContentPlaceHolder1_DDProduct.value;
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

                        document.all.ContentPlaceHolder1_txtProductDec.value = arReceived[0]
                        document.all.ContentPlaceHolder1_txtPrincipal.value = arReceived[1];
                         
                        //Static.PerformCallback();
        
                    }



                }

            }


        }



        //function EditAccountscreen(From) {

  
        //    //Retvals = window.open("../EditAccount.aspx?AccCode=" + AccCode, null, "width=1300,height=700");
        //    //Retvals.moveTo((window.screen.width / 2) - (1200 / 2), (window.screen.height / 2) - (600 / 2));

        //    var URL = "../EditAccount.aspx?AccCode=" + document.all.hdnAccCode.value + "&From=" + From;
        //    window.location = URL;
 

        //}
        //function ContAddscreen(From) {

             
        //    var URL = "../AddContack.aspx?AccCode=" + document.all.hdnAccCode.value + "&From=" + From;
        //    window.location = URL ;
 
 
        //}

        //function EditCont(ContCode) {
             
        //    var URL = "../AddContack.aspx?AccCode=" + document.all.hdnAccCode.value + "&ContCode=" + ContCode + "&From=EditCont";
        //    window.location = URL;

        //}



        // ----------------------------------------------  Install Date Validation Start

        function FunWarrantyStartDate(Id) {
 
            var year, month, day, jsDate, WARStartDate, WAREndmyDate;
 
            if (document.all.ContentPlaceHolder1_txtInstallDsate.value != "") {

                //alert(document.all.txtInstallDsate.value)
                if (Id == "txtInstallDsate") {

                   
                    frmv = rtndateonly1(document.all.ContentPlaceHolder1_txtInstallDsate, "Install Date");
                     //alert(frmv)
                    if (frmv == false) {
   
                        return false;
                    }
                    else
                    {

                        //alert(document.all.txtInstallDsate.value)
                        //var from = $("#txtInstallDsate").val().split("/");
                        var from = document.all.ContentPlaceHolder1_txtInstallDsate.value.split("/");
                         //alert(from)
                        var jsDate = new Date(from[2], from[1]-1 , from[0]);
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
                        //alert(WAREndmyDate)
                        //  WARStartDate = day + '/' + month + '/' + year;
                        //   WAREndmyDate = day - 1 + '/' + month + '/' + year;
                        WARStartDate = convertDate(WARStartDate)
                        WAREndmyDate = convertDate(WAREndmyDate)
                        //alert(WAREndmyDate)
                        initstartdate = WAREndmyDate;
                        startdate = WARStartDate;
                        enddate = WAREndmyDate;
                        prevenddate = WAREndmyDate;
                        //alert(WARStartDate)
                        document.all.ContentPlaceHolder1_txtWSD.value = WARStartDate;
                        //alert(document.all.txtWSD.value)
 
                    }
             
                }
                else if (Id == "txtMonth") {

                    //alert(Id)
                    //var from = $("#txtWSD").val().split("/");
                    var from = document.all.ContentPlaceHolder1_txtWSD.value.split("/");
                   //alert(from[0]-1)
                    var jsDate = new Date(from[1], from[0]-1, from[2]);
                     //alert(jsDate)
                    year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
                    //alert(year)
                    month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
                    day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

                    WARStartDate = new Date(year, month, day);

                    //alert(WARStartDate)
                    WARStartDate = convertDate(WARStartDate);
                    WAREndmyDate = convertDate(WARStartDate);
                     //alert(WAREndmyDate)
                    initstartdate = WAREndmyDate;
                     //alert(initstartdate)
                     //document.all.txtWEDa.value = WAREndmyDate;

                    recalculateDate(Id, document.all.ContentPlaceHolder1_DDWarrantyType.value, document.all.ContentPlaceHolder1_txtMonth.value);

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
                if (input.charAt(i) == "/") {
                    slashcount++;
                }
            }
            //alert(input.charAt(3))
            
            if (slashcount != 2) {
                 
                alert(message + "   Not A Valid Date \n  Format : DD/MM/YYYY  ");
                //inobj.focus();
                return false;
            }
            
            datearr = input.split("/")
            //alert(datearr)
            dd = datearr[0];
            mm = datearr[1];
            yy = datearr[2];
            
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
 
            inobj.value = retdd + "/" + retmm + "/" + retyyyy;
            //inobj.value = retyyyy + "-" + retmm + "-" + retdd;
             
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
            return [pad(d.getDate()), pad(d.getMonth() + 1), d.getFullYear()].join('/');
            //return [d.getFullYear(), pad(d.getMonth() + 1),pad(d.getDate())].join('/');
        }


        function recalculateDate(id, WarType, currmonth) {

               //alert(id + "..." + WarType + "..." + currmonth);
            var totalmonth = 0;

            for (var j = 0; j < 0 + 1; j++) {
                //alert(currmonth)
                if (WarType != "")
                    totalmonth = parseInt(totalmonth) + parseInt(currmonth);

            }

             //alert(totalmonth);
            currmonth = totalmonth;
            if (WarType != "") {
                var WARStartDate, WAREndmyDate;

                //  jsDate = txtInstallDate.GetDate();

                //var from = $("#txtInstallDsate").val().split("/"); // get install date value and split by '/'
                var from = document.all.ContentPlaceHolder1_txtInstallDsate.value.split("/");

                var jsDate = new Date(from[2], from[1]-1, from[0]); // -1 month 

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

                //WARStartDate = new Date(day, month, year);
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

                document.all.ContentPlaceHolder1_txtWEDa.value = WAREndmyDate;
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

       
            if (document.all.ContentPlaceHolder1_txtInstallDsate.value == "") {
                alert("Install Date Can\'t be Empty")
                ContentPlaceHolder1_txtInstallDsate.focus();
                return false;
            }


            // For Install Date validation
            frmv = rtndateonly1(document.all.ContentPlaceHolder1_txtInstallDsate, "Install Date");
            if (frmv == false) {
                // document.all.txtInstallDsate.value = "";
                return false;
            }
 
            if (document.all.ContentPlaceHolder1_DDWarrantyType.value == null || document.all.ContentPlaceHolder1_DDWarrantyType.value == "") {
                alert("Please select the Warranty Type");
                ContentPlaceHolder1_DDWarrantyType.focus();
                return false;
            }
            //else {
            //    document.all.hdnWarantyType.value = document.all.DDWarrantyType.value;
            //}

 
 
            if (document.all.ContentPlaceHolder1_txtMonth.value == "") {
                alert("Please Enter the Month");
                ContentPlaceHolder1_txtMonth.focus();
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
                if (aWarType[i] != '' && aWarType[i] == document.getElementById('ContentPlaceHolder1_DDWarrantyType').value) {
                    alert('Warranty added already!')
                    return false;
                }
            }



            // Assigned values to Rebuild table

            aWarType[RowCount] = document.getElementById('ContentPlaceHolder1_DDWarrantyType').value;
            aMonth[RowCount] = document.getElementById("ContentPlaceHolder1_txtMonth").value;
            aNoofVisit[RowCount] = document.getElementById("ContentPlaceHolder1_txtNumberOfVisit").value
            aModule[RowCount] = "Update";
            aWarStartDate[RowCount] = document.all.ContentPlaceHolder1_txtWSD.value;
            aWarEndDate[RowCount] = document.all.ContentPlaceHolder1_txtWEDa.value;


             RowCount = RowCount + 1;

            //prodTable = prodTable + 1;


            RebuildTable();

            document.getElementById('ContentPlaceHolder1_DDWarrantyType').value = '';
            document.getElementById("ContentPlaceHolder1_txtMonth").value = '';
            document.getElementById("ContentPlaceHolder1_txtNumberOfVisit").value = '';
            document.getElementById('ContentPlaceHolder1_txtWEDa').value = '';
        




            // Add Warranty info

            for (var i = 0; i < RowCount; i++) {
                if (aWarType[i] != "") {
                    document.getElementById("hdnWarrantyInfo").value = "";
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
            
            header += "<tr style='background-color:#FFEEC0;height:30px'>"
            header += "<th width='5%' align='center' valign='middle'  class='gadget_heading_txt' style='text-align:center;'>S.No.</th>";
            header += "<th width='20%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>Type</th>";
            header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>Month</th>";
            header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>No of Visit</th>";
            header += "<th width='20%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'> WarStartDate </th>";
            header += "<th width='20%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>WarEndDate </th>";
            header += "<th width='10%'  align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>Remove</th>";
            header += "</tr>";
            

            if (output != "") {
                 
                 output = "<table width='85%' align='center'  border='0' class='TD_border' cellpadding='0' cellspacing='1' id='DispTable'>" + header + output + footer + "</table>";
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
            if (document.all.ContentPlaceHolder1_DDAccount.value != "") {
                var sURL = "WebService.asmx/GetAccountDetails"
                xml.open("POST", sURL, false);

                xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var str = "AccCode=" + document.all.ContentPlaceHolder1_DDAccount.value;
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

                        document.all.ContentPlaceHolder1_hdnAccCode.value = arReceived[0];
                        document.all.ContentPlaceHolder1_txtAddress.value = arReceived[1];
                        document.all.ContentPlaceHolder1_txtIndustry.value = arReceived[2];
                        document.all.ContentPlaceHolder1_txtSite.value = arReceived[3];
                        document.all.ContentPlaceHolder1_txtCity.value = arReceived[4];
                        document.all.ContentPlaceHolder1_DDState.value = arReceived[5];
                        document.all.ContentPlaceHolder1_txtPinCode.value = arReceived[6];

                        //Static.PerformCallback();
                        //alert(document.all.hdnAccCode.value);
                      
                            getcontactBind();
                         
                        
                    }
 


                }
                 
            }




        }


        function getcontactBind() {
            
            //alert(document.all.hdnAccCode.value)
            // debugger;
            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (document.all.ContentPlaceHolder1_hdnAccCode.value != "") {
                var sURL = "WebService.asmx/GetContact"
                xml.open("POST", sURL, false);

                xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var str = "AccCode=" + document.all.ContentPlaceHolder1_hdnAccCode.value;
                xml.send(str)
                //alert(str)
                lsval = xml.responseText;
                 //alert(lsval)
                //DDContact.ClearItems();
                //DDContact.AddItem("<-Select->", "", 0);
                
                 
                if (lsval != "") {
                    
                    

                    arReceived = lsval.split("^^^");
                    //alert(arReceived)
                    // For clear dropdown
                    $("#ContentPlaceHolder1_DDContact").find('option').remove();
                     
                    // For default select value
                    $("#ContentPlaceHolder1_DDContact").append($("<option>", {

                        value: '',
                        text: '<-Select->'

                    }));
                     
                    // For dropdown bind values
                    for (i = 0; i < arReceived.length - 1; i++) {
                        arToBind = arReceived[i].split("|");

                        //alert(arToBind)
                        $("#ContentPlaceHolder1_DDContact").append($("<option>", {

                            
                            value: arToBind[0],
                            text: arToBind[1]
                       
                        }));
   
                    }
                    
                    
                }
                else {
                    
                    $("#ContentPlaceHolder1_DDContact").find('option').remove();

                    $("#ContentPlaceHolder1_DDContact").append($("<option>", {

                        value: '',
                        text: '<-Select->'

                    }));
                     
                }
                
                 
            }

            



        }



        function GetContactDetails() {


             
            //alert(document.all.DDContact.value)

            document.all.ContentPlaceHolder1_hdnContcode.value = document.all.ContentPlaceHolder1_DDContact.value;

            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (document.all.ContentPlaceHolder1_DDContact.value != "") {
                var sURL = "WebService.asmx/GetContactDetail"
                xml.open("POST", sURL, false);

                xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var str = "ContCode=" + document.all.ContentPlaceHolder1_DDContact.value;
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

                        document.all.ContentPlaceHolder1_txtMobile.value = arReceived[1]
                        document.all.ContentPlaceHolder1_txtDepartment.value = arReceived[2];
              

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
            if (document.all.ContentPlaceHolder1_DDProduct.value == "") {
                alert("Model No Can't be Empty")
                ContentPlaceHolder1_DDProduct.focus();
                return false;
            }
             
             
            if (document.all.ContentPlaceHolder1_DDFieldUpdate.value == "") {
                alert("Field Update Can't be Empty")
                ContentPlaceHolder1_DDFieldUpdate.focus();
                return false;
            }
            

            if (document.all.ContentPlaceHolder1_txtPo.value == "") {
                alert("PO No Can't be Empty")
                ContentPlaceHolder1_txtPo.focus();
                return false;
            }
        
            if (document.all.ContentPlaceHolder1_txtPODate.value == "") {
                alert("PO Date Can't be Empty")
                ContentPlaceHolder1_txtPODate.focus();
                return false;
            }
            
            if (document.all.ContentPlaceHolder1_txtInvoiceNo.value == "") {
                alert("Invoice No Can't be Empty")
                ContentPlaceHolder1_txtInvoiceNo.focus();
                return false;
            }
            
            if (document.all.ContentPlaceHolder1_txtInvoiceDate.value == "") {
                alert("Invoice Date Can't be Empty")
                ContentPlaceHolder1_txtInvoiceDate.focus();
                return false;
            }
            //--------------------------------------------- Warranty info


            //alert(document.getElementById("hdnWarrantyInfo").value)
            if (document.getElementById("ContentPlaceHolder1_hdnWarrantyInfo").value == "") {
                alert("Warranty Details Can't be Empty ");
                return false;
            }

      
            //--------------------------------------------- Account info

            if (document.all.ContentPlaceHolder1_DDAccount.value == "" || document.all.ContentPlaceHolder1_DDAccount.value == "None") {
                alert("Please select Account")
                ContentPlaceHolder1_DDAccount.focus();
                return false;
            }

            if (document.all.ContentPlaceHolder1_DDContact.value == "" || document.all.ContentPlaceHolder1_DDContact.value == "None") {
                alert("Please select Contact")
                ContentPlaceHolder1_DDContact.focus();
                return false;
            }
            
            

            //--------------------------------------------- Allocation info


            
            if (document.all.ContentPlaceHolder1_DDEngineer1.value == "" || document.all.ContentPlaceHolder1_DDEngineer1.value == "<-Select->") {
                alert("Please select Engineer")
                ContentPlaceHolder1_DDEngineer1.focus();
                return false;
            }


            if (document.all.ContentPlaceHolder1_DDEngineer1.value == document.all.ContentPlaceHolder1_DDEngineer2.value) {
                alert("Should be diffrent Engineer 1 and Engineer 2 ")
                ContentPlaceHolder1_DDEngineer2.focus();
                return false;

            }

            if (document.all.ContentPlaceHolder1_DDSubStatus.value == "" || document.all.ContentPlaceHolder1_DDSubStatus.value == "None") {
                alert("Please select SubStatus")
                ContentPlaceHolder1_DDSubStatus.focus();
                return false;
            }


            //alert(document.getElementById("hdnWarrantyInfo").value)
            return true;
             
        }

        function Closefun(msg) {

            
            alert(msg);
            window.parent.location.reload();
        }

    </script>


    <script type="text/javascript">

        function funReset() {
            
            <%------------- Installatoin Info--%>
            document.all.ContentPlaceHolder1_DDProduct.value = "";
            document.all.ContentPlaceHolder1_txtProductDec.value = "";
            document.all.ContentPlaceHolder1_txtSerialNo.value = "";
            document.all.ContentPlaceHolder1_txtSalesOrder.value = "";
            document.all.ContentPlaceHolder1_txtSODate.value = "";
            document.all.ContentPlaceHolder1_DDFieldUpdate.value = "";
            document.all.ContentPlaceHolder1_txtPo.value = "";
            document.all.ContentPlaceHolder1_txtPODate.value = "";
            document.all.ContentPlaceHolder1_DDSoftware.value = "";
            document.all.ContentPlaceHolder1_txtInvoiceNo.value = "";
            document.all.ContentPlaceHolder1_txtInvoiceDate.value = "";
            document.all.ContentPlaceHolder1_txtTradeUpSID.value = "";
            document.all.ContentPlaceHolder1_txtPrincipal.value = "";
            document.all.ContentPlaceHolder1_txtDistentService.value = "";
            document.all.ContentPlaceHolder1_txtComments.value = "";


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



        function CallBackPage() {

            var URL = "../InstallSummary.aspx?InstallCode=" + ContentPlaceHolder1_hdnInstallCode.Value + "&From=Installation";
            window.location = URL;
        }



    </script>



   
    
     

    <%-- for Jquery not working so down here --%>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</asp:Content>



    

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<body onload="load()">

 
    <div class="container-fluid">
        <%--<form id="myForm" runat="server">--%>

            <%-- script manager for grid updatepanel --%>
           <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>--%>

            <%--HEADER ROW--%>

        <%--MAIN--%>
        <div class="row border-bottom" style="padding: 10px 25px 10px 25px; background: white;">
            <div id="main_sub2_div" class="col-md-12 bg-light">


                <div class="col-4 BarObjactsLeft">
                    <span>
                        <a href="#" onclick="CallBackPage()">
                            <img src="../images/Back.svg" style="cursor: pointer;" />
                        </a>
                    </span>
                    Edit Installation
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



        <div class="scrollable-content" style="background: #fff!important;">

            <div style="text-align: left;">
                <div class="container1">

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="InstallInfotab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true" onclick="ChangeTab('AccTab')">Installatoin Info</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="SLAInfotab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false" onclick="ChangeTab('ContTab')">SLA info</button>
                        </li>
                         <li class="nav-item" role="presentation">
                            <button class="nav-link" id="ComponentsInfotab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false" onclick="ChangeTab('ContTab')">Components info</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link disabled" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false"> <img src="../images/Arrowhead.png" width="20" height="20" /> </button>
                        </li>
                    </ul>
 
                </div>
            </div>
 
            <%--Installatoin Detail--%>
            <fieldset style="border: solid 0px red;">
 

                <div class="accordion" id="accordionExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button fw-bold BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Installatoin Info
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample1">
                                    <div class="accordion-body">

                                        <div class="container-fluid">

                                            <%------------- Installatoin Info--%>

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black; width: 200px;" align="right"><span style="color: red">*</span> Model No</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <asp:DropDownList ID="DDProduct" runat="server" class="formcontrol form-control-sm" onchange="GetProductDetail()"></asp:DropDownList>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: blue">*</span> Product Dec</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtProductDec" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: blue">*</span> Searial No</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtSerialNo" runat="server" class="formcontrol_Read form-control-sm" readonly="true" value="Auto" />
                                                </div>

                                            </div>





                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black; width: 200px;" align="right">Sales Order </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtSalesOrder" name="txtSalesOrder" runat="server" class="formcontrol form-control-sm" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right">Sales Order Date</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <div class="datecontainer" style="background-color: white; width: 200px; height: 31px;">
                                                        <input type="text" style="width: 132%;" id="txtSODate" runat="server" class="formcontrol form-control-sm" />
                                                        <img border="0" src="images/calender.svg" style="cursor: pointer; position: relative; top: -37px; left: 270px;" align="middle" onclick="showCal(document.all.ContentPlaceHolder1_txtSODate,1)" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: red">*</span> Field Update</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <asp:DropDownList ID="DDFieldUpdate" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                </div>

                                            </div>

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black; width: 200px;" align="right"><span style="color: red">*</span> Po </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtPo" name="txtPo" runat="server" class="formcontrol form-control-sm" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: red">*</span> Po Date</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <div class="datecontainer" style="background-color: white; width: 200px; height: 31px;">
                                                        <%--ClientIDMode="Static" --%>
                                                        <input type="text" style="width: 132%;" id="txtPODate" name="txtPODate" runat="server" class="formcontrol form-control-sm" />
                                                        <img border="0" src="images/calender.svg" style="cursor: pointer; position: relative; top: -37px; left: 270px;" align="middle" onclick="showCal(document.all.ContentPlaceHolder1_txtPODate,1)" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: red"></span>Software</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <asp:DropDownList ID="DDSoftware" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                </div>

                                            </div>

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black; width: 200px;" align="right"><span style="color: red">*</span> Invoice No </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtInvoiceNo" name="txtAccount" runat="server" class="formcontrol form-control-sm" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: red">*</span> Invoice Date</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <div class="datecontainer" style="background-color: white; width: 200px; height: 31px;">
                                                        <input type="text" style="width: 132%;" id="txtInvoiceDate" runat="server" class="formcontrol form-control-sm" />
                                                        <img border="0" src="images/calender.svg" style="cursor: pointer; position: relative; top: -37px; left: 270px;" align="middle" onclick="showCal(document.all.ContentPlaceHolder1_txtInvoiceDate,1)" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right">Trade-Up SID</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtTradeUpSID" runat="server" class="formcontrol form-control-sm" readonly="true" />
                                                </div>

                                            </div>


                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black; width: 200px;" align="right"><span style="color: blue">*</span> Principal</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="text" id="txtPrincipal" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right">Distent from Service Location</div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <input type="number" id="txtDistentService" runat="server" class="formcontrol form-control-sm" />
                                                </div>

                                            </div>

                                            <div class="form-group row">

                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black; width: 200px;" align="right">Remarks </div>
                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                    <textarea id="txtComments" rows="3" runat="server" class="formcontrol_Area form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                                </div>
                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"></div>
                                                <div class="col-sm-10 col-md-4" align="left">
                                                </div>

                                            </div>


                                        </div>
 
                                    </div>
                                </div>

                                <%------------- Warranty Info--%>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo">
                                        <button class="accordion-button collapsed fw-bold BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Warranty Info    
                                        </button>
                                    </h2>
                                    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample2">
                                        <div class="accordion-body">

                                            <div class="container-fluid">

                                                <div class="form-group row">

                                                    <div class="col-sm-2 col-md-2 form-lable" style="color: black; width: 200px;" align="right"><span style="color: red">*</span> Install Date</div>
                                                    <div class="col-sm-10 col-md-2 form-text" align="left">
                                                        <div class="datecontainer" style="background-color: white; width: 200px; height: 31px;">
                                                            <input type="text" style="width: 132%;" id="txtInstallDsate" runat="server" class="formcontrol form-control-sm" onblur="FunWarrantyStartDate('txtInstallDsate')" />
                                                            <img border="0" src="images/calender.svg" style="cursor: pointer; position: relative; top: -37px; left: 270px;" align="middle" onclick="showCal(document.all.ContentPlaceHolder1_txtInstallDsate,1)" />
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: blue">*</span> Warranty Start</div>
                                                    <div class="col-sm-10 col-md-2 form-text" align="left">
                                                        <input type="text" id="txtWSD" readonly="true" runat="server" class="formcontrol_Read form-control-sm" />
                                                    </div>
                                                    <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: blue">*</span> Warranty End</div>
                                                    <div class="col-sm-10 col-md-2 form-text" align="left">
                                                        <input type="text" id="txtWEDa" readonly="true" runat="server" class="formcontrol_Read form-control-sm" />
                                                    </div>

                                                </div>

                                                <div class="form-group row">

                                                    <div class="col-sm-2 col-md-2 form-lable" style="color: black; width: 200px;" align="right"><span style="color: red">*</span> Warranty Type</div>
                                                    <div class="col-sm-10 col-md-2 form-text" align="left">
                                                        <asp:DropDownList ID="DDWarrantyType" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                    </div>
                                                    <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: red">*</span> Month</div>
                                                    <div class="col-sm-10 col-md-2 form-text" align="left">
                                                        <input type="number" id="txtMonth" runat="server" class="formcontrol form-control-sm" onblur="FunWarrantyStartDate('txtMonth')" />
                                                    </div>
                                                    <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right">Number Of Visit</div>
                                                    <div class="col-sm-10 col-md-2 form-text" align="left">
                                                        <div class="row">
                                                            <div class="col-sm-6 col-md-6 col-lg-6 form-lable" style="padding: 0px 15px;">
                                                                <input type="number" id="txtNumberOfVisit" runat="server" class="formcontrol form-control-sm" />
                                                            </div>
                                                            <div class="col-sm-6 col-md-6 col-lg-6 form-lable" style="padding: 0px 15px;">
                                                                <button type="submit" runat="server" id="btnSubmit" style="width: 130px; height: auto; vertical-align: middle;" class="CommonButton_Auto1 btn-sm" onclick="AddToList();return false;"><i style="letter-spacing: 08px;" class="bi bi-plus"></i>Add To List</button>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>

                                                <br />

                                                <div class="form-group row">
                                                    <div class="col-sm-2 col-md-12" style="color: black;" align="center">
                                                    </div>
                                                </div>


                                                <br />


                                                <div class="col-sm-2 col-md-12" style="color: black;" align="center">
                                                    <div id="WarrantyList"></div>
                                                </div>





                                            </div>
                                        
                                        </div>

                                    </div>


                                </div>



                                  <%-- ----------- Account and Contact Info--%>
                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="headingThree">
                                                    <button class="accordion-button collapsed fw-bold BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                        Account and Contact Info
                                                    </button>
                                                </h2>
                                                <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample3">
                                                    <div class="accordion-body">


                                                        <div class="container-fluid">

                                                            <div class="form-group row">

                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black; width: 200px;" align="right"><span style="color: red">*</span> Account</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <asp:DropDownList ID="DDAccount" runat="server" class="formcontrol form-control-sm" onchange="GetAccountDetail()"></asp:DropDownList>
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: blue">*</span> Industry</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <input type="text" id="txtIndustry" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: blue">*</span> Site</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <input type="text" id="txtSite" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">

                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black; width: 200px;" align="right"><span style="color: blue">*</span> Address</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <input type="text" id="txtAddress" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                                </div>
                                                                 <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: blue">*</span> City</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <input type="text" id="txtCity" name="txtAccount" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                                </div>
                                                                 
                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: blue">*</span> State</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <asp:DropDownList ID="DDState" runat="server" class="formcontrol_Read form-control-sm"></asp:DropDownList>
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">

                                                              
                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;width: 200px;" align="right"><span style="color: blue">*</span> Pin Code</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <input type="text" id="txtPinCode" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: red">*</span> Contact</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <asp:DropDownList ID="DDContact" runat="server" class="formcontrol form-control-sm" onchange="GetContactDetails()">
                                                                        <asp:ListItem Value="" Selected="true" Text="<-Select->" />
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: blue">*</span> Mobile</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <input type="text" id="txtMobile" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                 
                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;width: 200px;" align="right"><span style="color: blue">*</span> Department</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <input type="text" id="txtDepartment" runat="server" class="formcontrol_Read form-control-sm" readonly="true" />
                                                                </div>

                                                            </div>


                                                        </div>

                                                    </div>
                                                </div>
                                            </div>




                                            <%-- ----------- Allocation Info--%>
                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="headingFour">
                                                    <button class="accordion-button collapsed fw-bold BarTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                                        Allocation Info
                                                    </button>
                                                </h2>
                                                <div id="collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingFour" data-bs-parent="#accordionExample3">
                                                    <div class="accordion-body">


                                                        <div class="container-fluid">



                                                            <div class="form-group row">

                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black; width: 200px;" align="right"><span style="color: red">*</span> Engineer 1</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <asp:DropDownList ID="DDEngineer1" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right">Engineer 2</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <asp:DropDownList ID="DDEngineer2" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 form-lable" style="color: black;" align="right"><span style="color: red">*</span> Sub Status</div>
                                                                <div class="col-sm-10 col-md-2 form-text" align="left">
                                                                    <asp:DropDownList ID="DDSubStatus" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                                                </div>

                                                            </div>


                                                            <br />
                                                            <br />
                                                            <br />



                                                        </div>



                                                    </div>
                                                </div>
                                            </div>




                                
                                    <%--MAIN ROW    --%>

                                    <div class="row">
 
                                         
                                            <div class="form-group row">
                                                 
                                                <div class="col-sm-2 col-md-12" style="color: black;" align="right">
                                                    <button type="reset" runat="server" id="btnreset" style="width: 130px" class="CancelButton btn-sm" onclick="funReset()">Reset</button>
                                                    &nbsp;&nbsp;&nbsp;
                                          <asp:Button ID="btnSaveIns" runat="server" Style="width: 130px" OnClientClick="return Validation();" value="Save" OnClick="btnSaveIns_Click" class="SubmitButton btn-sm" Text="Save" />
                                                </div>

                                            </div>
                                        
                                    </div>

                                <br />
                                <br />

 

                                <%--HIDDIELD--%>






 
                            </div>


                        </div>




            

            </fieldset>



             <!-- Modal -->
            <div>
 
                <!-- Modal -->
            <div class="modal fade" id="AccountEditModal" role="dialog" >
       
                <div class="modal-dialog AccountSummary-content" style="width: 90%;">
 
                    <!-- Modal content-->
                    <div class="modal-content AccountSummary-content" style="width:1300px; height:700px;margin-left: -400px;margin-top: 100px;border: 3px solid #1e2f97;border-radius: 5px; ">
                        <div class="modal-body AccountSummary-body">
                            <div style="text-align: right;">
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="border:none;background-color:white; height:25px;width:25px;" >
                                 <img src="../images/Cancel.png" width="25" height="25" style="margin-left: -10px;" />
                            </button>
                                </div>

                            
                             
                            <iframe id="objAccountEditModal" src="" style="width: 100%; border-width: 0px; height: 90%;display:block;margin-top:2px;"  scrolling="no" >Your browser doesn’t support the object tag. 
                            </iframe>

                        </div>
                    </div>

                </div>
            </div>
 
            </div>


            <%--Contact Detail--%>
            <fieldset id="ContinfoField" style="border:solid 0px red;display:none;">

                <nav class="navbar navbar-light">
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
                </div>


            </fieldset>



         </div>
         






           <%--Hidden Field--%>

            <asp:HiddenField ID="hdnAccCode" runat="server" />
            <asp:HiddenField ID="hdnInstallCode" runat="server" />
            <asp:HiddenField ID="hdnFrom" runat="server" />
            

            <input type="hidden" name="hdnWarrantyInfo" id="hdnWarrantyInfo" runat="server" />
            <input type="hidden" name="hdnComponentInfo" id="hdnComponentInfo" runat="server" />

            <input type="hidden" name="hdnContcode" id="hdnContcode" runat="server" />

        <%--</form>--%>
    </div>


 
</body>

</asp:Content>

