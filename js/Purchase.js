
//R5_1_5 Changes Start
function OnComboBoxChangedEventHandler() {
    grdInstallAddress.GetGridView().PerformCallback();
}


function gridLookupInstallAddress_OnInit(s, e) {
    aspxELostFocus('grdInstallAddress_B');
    if (document.getElementById('grdInstallAddress_B-1'))
        document.getElementById('grdInstallAddress_B-1').setAttribute("onkeydown", "javascript:if(window.event.keyCode == 38 || window.event.keyCode == 40)return false;else if(window.event.keyCode == 9)return aspxDDCloseUp('grdInstallAddress');");
}
//R5_1_5 Changes End

function TextBoxKeyDown(s, e) {
    if (!((e.htmlEvent.keyCode >= 48 && e.htmlEvent.keyCode <= 57) || (e.htmlEvent.keyCode == 8 || e.htmlEvent.keyCode == 46 || e.htmlEvent.keyCode == 37 || e.htmlEvent.keyCode == 39)))
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
}


function close(result) {
   
    if (window.showModalDialog) {
        alert(result);
        //window.parent.opener.grid.Refresh();
        window.parent.close();
    }
    else {
        alert(result);
        window.parent.close();  window.parent.opener.location.reload();
        //window.parent.opener.grid.Refresh();
        //window.parent.close();
        
    }
}

function close_md(result) {
   
    alert(result);
    if (window.showModalDialog) {
        //window.parent.opener.grid.Refresh();
        window.parent.location.reload();
        window.parent.close();
    }
    else {
        window.parent.opener.location.reload();
        window.parent.close();
    }
}

function ShowSalesOrder() {
   // alert("yes");
    var rtnvalues;
    var lhlpvalues = new Array();

    if (window.showModalDialog) {
        rtnvalues = window.showModalDialog("SearchSalesOrder.aspx?SalesOrder=" + txtSalesOrder.GetText() + "&logid=" + document.all.logid.value, null, "dialogWidth=750Px;dialogHeight=400Px;status:no;");
        fnsetSalesOrder(rtnvalues);
    }
    else {
        rtnvalues = window.open("SearchSalesOrder.aspx?SalesOrder=" + txtSalesOrder.GetText() + "&logid=" + document.all.logid.value, null, "Width=750,Height=400,scroll=no;")
        rtnvalues.moveTo((window.screen.width / 2) - (750 / 2), (window.screen.height / 2) - (400 / 2));
    }

    //Commented By Deepak on 08JUN2018
  //  var url = "SearchSalesOrder.aspx?SalesOrder=" + txtSalesOrder.GetText() + "&logid=" + document.all.logid.value;

  //  $("#objSalesOrder").attr("data", url);
  //  $('#SalesOrderModal').modal('show');




}

function fnsetSalesOrder(rtnvalues) {
    //alert("test");
   // debugger;
    if (String(rtnvalues) != "undefined") {
       
        lhlpvalues = rtnvalues.split("|");
        txtSalesOrder.SetText(lhlpvalues[0]);
        document.all.hdnOrderNo.value = lhlpvalues[0];
        document.all.hdnOrderDate.value = lhlpvalues[1];
        //txtSalesOrderDate.SetText(lhlpvalues[1]);
        document.all.txtSalesOrderDate.value = lhlpvalues[1];
        document.all.hdnAccount.value = lhlpvalues[2];

        txtPuchaseOrder.SetText(lhlpvalues[5]);
        document.all.txtPuchaseOrderDate.value = lhlpvalues[6];

        txtInvoiceNo.SetText(lhlpvalues[7]);
        document.all.txtInvoiceDate.value = lhlpvalues[8];
        //document.all.hdnAccCode.value = lhlpvalues[9];

        document.all.hdnAccCode.value = lhlpvalues[9];
        document.all.hdnContCode.value = lhlpvalues[10];
        //var sitecode = "0000000302";
       // var a = "0000000039";

       // var hdnaccode = lhlpvalues[9];
        //if (document.all.txtEquipId.value != "")
        //{
        //    document.all.slamast.disabled = false;
        //    document.all.cmmast.disabled = false;
        //}
        //else
        //{
        //    document.all.slamast.disabled = true;
        //    document.all.cmmast.disabled = true;
        //}
        
        getAccData();
        getcontactData1();
        

    }
}


function getAccData() {
    //debugger;
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (document.all.hdnAccCode.value != "") {
        var sURL = "WebService/ServiceRequest.asmx/GetAccData"
        xml.open("POST", sURL, false);

        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var str = "AccCode=" + document.all.hdnAccCode.value;
        xml.send(str)
        lsval = xml.responseText;
      //  gridLookupInstallAddress.ClearItems();
        //gridLookupInstallAddress.AddItem("", "", 0);

      //  alert(lsval)

        if (lsval != "") {
            arReceived = lsval.split("^^^");
            // alert(arReceived)

            for (i = 0; i < arReceived.length - 1; i++) {
                arToBind = arReceived[0].split("~");

                ShowAccount1(arToBind);
                //// document.getElementById("gridLookup").value = "test";
                //document.all.hdnAccCode.value=arToBind[0]
                //gridLookup.SetText(arToBind[1]);
                //txtIndustry.SetText(arToBind[2]);
                //gridLookupInstallAddress.SetText(arToBind[3]);
                //txtCity.SetText(arToBind[4]);
                //txtState.SetText(arToBind[5]);
                //txtPin.SetText(arToBind[6]);
                //txtsite.SetText(arToBind[7]);
                          
            }
           // var test = arReceived[0].split("~");
           // arToBind = test
             
              
          
        }
      
    }
}


function ShowAccount1(lhlpvalues) {

     
    if (String(lhlpvalues) != "undefined" && String(lhlpvalues) != "null") {
        document.all.hdnAccCode.value = lhlpvalues[0];
        gridLookup.SetText(lhlpvalues[1]); // Set only Account to the Grid Lookup
        txtsite.SetText(lhlpvalues[2]);
        //txtSiteId.SetText((lhlpvalues[3]));
        //txtAddress.SetText(lhlpvalues[4]);
        document.getElementById('txtAddress').value = lhlpvalues[4];

        document.all.hdnAddress.value = lhlpvalues[4]; //R5.1.5

        txtCity.SetText(lhlpvalues[5]);
        txtState.SetText(lhlpvalues[6]);
        txtPin.SetText(lhlpvalues[7]);
        txtIndustry.SetText(lhlpvalues[8]);

        //    Clear Contact values
        ContactComboBox.SetText('');
        txtMobile.SetText('');
        txtDepart.SetText('');
        txtgl.SetText(lhlpvalues[12])
        //document.all.hdnContCode.value = "";

        document.all.hdnInsAccCode.value = lhlpvalues[11];

        gridLookupInstallAddress.GetGridView().PerformCallback();

        //   Clear Install Address INfo values
        //Removed Installation Address As per Pin - R5_1_5(CogentCRM)
        //txtInsAddress.SetText('');
        //txtInsCity.SetText('');
        //txtInsPinCode.SetText('');
        //document.all.cmbState.value = "";

       

        //SetValue and SetTExt are deprecated Properties R5_1_5
        gridLookupInstallAddress.SetValue(lhlpvalues[11]);
        gridLookupInstallAddress.SetText(lhlpvalues[4]);


    }
}

function getcontactData1() {
   // debugger;
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (document.all.hdnContCode.value != "") {
        var sURL = "WebService/ServiceRequest.asmx/GetContactValues1"
        xml.open("POST", sURL, false);

        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var str = "ContCode=" + document.all.hdnContCode.value;
        xml.send(str)
        lsval = xml.responseText;
       // ContactComboBox.ClearItems();
       // ContactComboBox.AddItem("<-Select->", "", 0);

        if (lsval != "") {
            arReceived = lsval.split("^^^");

            for (i = 0; i < arReceived.length - 1; i++) {
                arToBind = arReceived[0].split("|");
                //ContactComboBox.AddItem(arToBind[1], arToBind[0]);
                ContactComboBox.SetText(arToBind[0]);
                txtDepart.SetText(arToBind[1]);
                txtMobile.SetText(arToBind[2]);
               
               
            }
            
        }
    
       // ContactComboBox.SetSelectedIndex(0);
    }
}

var prodTable = 0;

RowCount = 0;
ContRowCount = 0;

initstartdate = new Date();
prevenddate = new Date();
var previous = "";
startdate = new Date();
enddate = new Date();

aWarType = new Array(100);
aMonth = new Array(100);
aNoofVisit = new Array(100);
aModule = new Array(100);
aWarStartDate = new Array(100);
aWarEndDate = new Array(100);

function AddToList() {

    //date = txtInstallDate.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('Install Date Can\'t be Empty');
    //    txtInstallDate.Focus();
    //    //e.processOnServer = false;
    //    return false;
    //}

    if (document.all.txtInstallDate.value == "") {
        alert("Install Date Can\'t be Empty")


        return false;
    }

    frmv = rtndateonly1(document.all.txtInstallDate, "Install Date");
    if (frmv == false) {
        // document.all.txtInstallDate.value = "";
        return false;
    }

    //if (cmbType.GetSelectedItem().value == null || cmbType.GetSelectedItem().value == "") {
    if (cmbType.GetValue() == null || cmbType.GetValue() == "") {
        alert("Please select the Type");
        cmbType.Focus();
        return false;
    }
    else {
        document.all.hdnWarantyType.value = cmbType.GetSelectedItem().value;
    }



    Month = document.getElementById("txtMonth").value; //txtMonth.GetText();*/


    //Noofvisit = txtNoofvisit.GetText();
    Noofvisit = document.getElementById("txtNoofvisit").value;

    //if (txtMonth.GetText() == "") {


    if (Month == "") {
        alert("Please Enter the Month");
        document.all.txtMonth.focus(); //txtMonth.Focus();
        return false;
    }

    else
    {
        document.all.hdnMonth.value = Month;

    }




    //Added by koripriyan on August 13 2018

    //if (txtMonth.GetValue() == null || txtMonth.GetValue() == "") {
    //    alert("Please Select the Month");
    //    txtMonth.Focus();
    //    return false;
    //}
    //else {
    //    document.all.hdnMonth.value = txtMonth.GetSelectedItem().value;
    //}



    //if (txtNoofvisit.GetText() == "") {
    if (Noofvisit == "") {
        alert("Please Enter the No of Visit");
        document.all.txtNoofvisit.focus();
        return false;
    }

    for (var i = 0; i < RowCount; i++) {
        if (aWarType[i] != '' && aWarType[i] == document.getElementById('hdnWarantyType').value) {
            alert('Warranty added already!')
            return false;
        }
    }

    aWarType[RowCount] = document.getElementById('hdnWarantyType').value;
    aMonth[RowCount] = document.getElementById("hdnMonth").value;         //txtMonth.GetText();
    aNoofVisit[RowCount] = document.getElementById("txtNoofvisit").value  //txtNoofvisit.GetText();
    aModule[RowCount] = "Insert";
    // aWarStartDate[RowCount] = txtWarrantyStart.GetValue();
    //aWarEndDate[RowCount] = txtWarrantyEnd.GetValue();
    //alert(RowCount +"," +aWarEndDate[RowCount]);
    aWarStartDate[RowCount] = document.all.txtWarrantyStart.value;
    aWarEndDate[RowCount] = document.all.txtWarrantyEnd.value;

    WarantyAdd(RowCount);

    RowCount = RowCount + 1;

    prodTable = prodTable + 1;


    RebuildTable();
    document.getElementById('hdnWarantyType').value = '';
    document.getElementById("hdnMonth").value = '';

    document.getElementById("txtMonth").value = '';
    //txtMonth.SetValue('');
    //txtMonth.SetText('<-Select->');
    //txtNoofvisit.SetText('');
    document.getElementById("txtNoofvisit").value = '';
    cmbType.SetValue('');
    cmbType.SetText('<-Select->');


    return true;
}

function RemoveFromList(removeid) {
    aMonth[removeid] = "";
    aWarType[removeid] = "";
    aWarStartDate[removeid] = "";
    aWarEndDate[removeid] = "";
    countdsds = countdsds + 1;

    prodTable = prodTable - 1;

    RebuildValue(); //RebuildTable() called inside RebuildValue
    //RebuildTable();
    return false;
}

function fnBindInitialValues() {

    var flag = "";
    var rtnvalues;
    var rtnContvalues;
    var lhlpvalues = new Array();
    var lhlpvalues2 = new Array();
    var Accode = "";
    var accountcode = "";
    RowCount = 0;
    ContRowCount = 0;
    rtnvalues = document.all.hdnWarrantyInfo.value;
    // alert(rtnvalues) 
    if (rtnvalues != "")
    {
        lhlpvalues1 = rtnvalues.split("#");

        //document.all.hdnInstallcode.value="";
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


function fnBindCompInitialValues() {
    var flag = "";
    var rtnvalues;
    var rtnContvalues;
    var lhlpvalues = new Array();
    var lhlpvalues2 = new Array();

    RowNewCount = 0;
    ContRowCount = 0;
    rtnvalues = document.all.hdnComponentInfo.value;
    // alert(rtnvalues) 
    if (rtnvalues != "")
    {
        lhlpvalues1 = rtnvalues.split("#");

        //document.all.hdnInstallcode.value="";
        for (i = 0; i < lhlpvalues1.length; i++) {
            TempVal = lhlpvalues1[i].split("~");



            aComponent[RowNewCount] = TempVal[0];
            aComponenttext[RowNewCount] = TempVal[1];
            aSerialno[RowNewCount] = TempVal[2];
            aQty[RowNewCount] = TempVal[3];
            aVersionno[RowNewCount] = TempVal[4];
            aNewWarStartDate[RowNewCount] = TempVal[5];
            aNewWarEndDate[RowNewCount] = TempVal[6];
            aComments[RowNewCount] = TempVal[7];


            RowNewCount++;
        }
    }
    RebuildcompTable();

}

function RebuildTable() {
    var output = "";
    var header = "";
    var footer = "";
    var footer1 = "";
    var counter = 1;
    var clr;
    clr = "grid_background";

    for (var j = 0; j < RowCount; j++) {
        //alert("for loop "+j + "," + aWarStartDate[j]);
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
            //output += "<td align='center' class=" + clr + ">" + aWarStartDate[j] + "</td>";
            //output += "<td align='center' class=" + clr + ">" + aWarEndDate[j] + "</td>";
            if (document.all.hdnPage.value == "summary")
                output += "<td align='center' valign='middle' class=" + clr + " ><img src='images/remove_icon.png' style='cursor:pointer;' width='16' height='16' onClick='' ></td>"
            else
                output += "<td align='center' valign='middle' class=" + clr + " ><img src='images/remove_icon.png' style='cursor:pointer;' width='16' height='16' onClick='RemoveFromList(" + j + ")' ></td>"

            output += "</tr>";
            counter += 1;
            countdsds = counter;
        }
    }

    header += "<tr style='background-color:#DFF0F7;height:30px'>"
    header += "<th width='10%' align='center' valign='middle'  class='gadget_heading_txt' style='text-align:center;'>S.No.</th>";
    header += "<th width='22%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>Type</th>";
    header += "<th width='22%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>Month</th>";
    header += "<th width='22%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>No of Visit</th>";
    //header += "<th width='22%' align='center' valign='middle' class='grid_heading_bg'><span class='grid_heading_txt'>WarStartDate</span></th>";
    //header += "<th width='22%' align='center' valign='middle' class='grid_heading_bg'><span class='grid_heading_txt'>WarEndDate</span></th>";
    header += "<th width='22%'  align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>Remove</th>";
    header += "</tr>";

    if (output != "") {
        output = "<table width='98%' align='center'  border='0' class='TD_border' cellpadding='0' cellspacing='1' id='DispTable'>" + header + output + footer + "</table>";
        //document.getElementById("footerProductList").style.display = "";
    }
    else {
        output = "<table>" + footer1 + "</table>";
        //document.getElementById("footerProductList").style.display = "none";
    }
    if (output != "") {
        document.getElementById('WarrantyList').innerHTML = output;
    }
    else {
        document.getElementById("WarrantyList").innerHTML = "";
        //document.getElementById("footerProductList").style.display = "none";
    }
    countdsds = counter;

}


function recalculateDate(id, WarType, currmonth) {
    var totalmonth = 0;

    for (var j = 0; j < id + 1; j++) {
        if (aWarType[j] != "")
            totalmonth = parseInt(totalmonth) + parseInt(aMonth[j]);

    }
    //alert(totalmonth);
    currmonth = totalmonth;
    if (WarType != "") {
        var WARStartDate, WAREndmyDate;

        //  jsDate = txtInstallDate.GetDate();

        var from = $("#txtInstallDate").val().split("/"); // get install date value and split by '/'
        var jsDate = new Date(from[2], from[1] - 1, from[0]); // -1 month 

        year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
        month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
        day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

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

        //   WARStartDate = convertDate(WARStartDate)
        //   WAREndmyDate = convertDate(WAREndmyDate)

        year2 = WAREndmyDate.getFullYear(); // where getFullYear returns the year (four digits)
        month2 = WAREndmyDate.getMonth(); // where getMonth returns the month (from 0-11)
        day2 = WAREndmyDate.getDate();
        minus = 1;
        if (month2 > actual) {
            //This conditions occur only feb 
            day2 = 1;
            minus = 1;
        }
        else {
            if (month == "3" || month == "5" || month == "8" || month == "10") {
                //this is for Apr,Jun,Sep,Nov
                minus = 1;
                if (day == "30") {
                    //this is for last day od 30 days month
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

        document.all.txtWarrantyEnd.value = WAREndmyDate;
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
function OnGridFocusedRowChanged(s, e) {
    //debugger;
    var grid = gridLookup.GetGridView();
    if (grid.GetFocusedRowIndex() >= 0) {
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'AccCode;Account;Site;SiteID;Address;City;State;Pincode;Industry;Phone;SiteID;insacccode;GLname', ShowAccount);
    }

    //document.all.hdnPrimaryContCode.value = '';
    //for (var i = 0; i < ContRowCount; i++) {
    //    aContCode[i] = '';
    //    aContact[i] = '';
    //    aDepartment[i] = '';
    //    aMobileNo[i] = '';
    //}
    //RebuildContactTable();

}

function ShowAccount(lhlpvalues) {
   
  //  debugger;
    if (String(lhlpvalues) != "undefined" && String(lhlpvalues) != "null") {
        document.all.hdnAccCode.value = lhlpvalues[0];
        gridLookup.SetText(lhlpvalues[1]); // Set only Account to the Grid Lookup
        txtsite.SetText(lhlpvalues[2]);
        //txtSiteId.SetText((lhlpvalues[3]));
        //txtAddress.SetText(lhlpvalues[4]);
        document.getElementById('txtAddress').value = lhlpvalues[4];

        document.all.hdnAddress.value = lhlpvalues[4]; //R5.1.5

        txtCity.SetText(lhlpvalues[5]);
        txtState.SetText(lhlpvalues[6]);
        txtPin.SetText(lhlpvalues[7]);
        txtIndustry.SetText(lhlpvalues[8]);
        txtgl.SetText(lhlpvalues[12]);

        //    Clear Contact values
        ContactComboBox.SetText('');
        txtMobile.SetText('');
        txtDepart.SetText('');
        document.all.hdnContCode.value = "";

        document.all.hdnInsAccCode.value = lhlpvalues[11];

        gridLookupInstallAddress.GetGridView().PerformCallback();

        //   Clear Install Address INfo values
        //Removed Installation Address As per Pin - R5_1_5(CogentCRM)
        //txtInsAddress.SetText('');
        //txtInsCity.SetText('');
        //txtInsPinCode.SetText('');
        //document.all.cmbState.value = "";
     
        getcontactData();

        //SetValue and SetTExt are deprecated Properties R5_1_5
        gridLookupInstallAddress.SetValue(lhlpvalues[11]);
        gridLookupInstallAddress.SetText(lhlpvalues[4]);
        getnpsdetails(lhlpvalues[3]);
      
    }
}
function getnpsdetails(siteid) {
   // alert(siteid)
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }

    var sURL = "Webrequest.asmx/Getnpsscore"
    xml.open("POST", sURL, false);
    xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    var str = "siteid=" + siteid + "&type=Installation";
    xml.send(str)

    lsval = xml.responseText;
    //  alert(lsval)
    if (lsval != "") {
        var no = Number(lsval)
        if (no <= 6) {
            // alert("detractor");
            document.getElementById("detractid").style.display = "block";
            document.getElementById("detractspan").style.display = "block";
            document.getElementById("npsdiv").style.display = "block";
            // document.getElementById("detractlabel").innerHTML = no;
        }
        else if (no >= 9) {
            // alert("promotors");
            document.getElementById("promoid").style.display = "block";
            document.getElementById("promospan").style.display = "block";
            document.getElementById("npsdiv").style.display = "block";
            // document.getElementById("promolabel").innerHTML = no;
        }
        else {
            document.getElementById("passiveid").style.display = "block";
            document.getElementById("passivespan").style.display = "block";
            document.getElementById("npsdiv").style.display = "block";
        }
    }
    else {
        document.getElementById("detractid").style.display = "none";
        document.getElementById("promoid").style.display = "none";
        document.getElementById("promospan").style.display = "none";
        document.getElementById("detractspan").style.display = "none";
        document.getElementById("npsdiv").style.display = "none";
    }
}

//R5_1_5 Changes Start
function OnGridInstallAddressFocusedRowChanged(s, e) {
    var grid1 = gridLookupInstallAddress.GetGridView();
    if (grid1.GetFocusedRowIndex() >= 0) {
        grid1.GetRowValues(grid1.GetFocusedRowIndex(), 'Address;Site;City;State;Pincode;acccode;insacccode;', ShowInstallAddress);
    }
}

function ShowInstallAddress(lhlpvalues) {
    if (String(lhlpvalues) != "undefined" && String(lhlpvalues) != "null") {
        document.all.hdnAddress.value = lhlpvalues[0];
        txtsite.SetText(lhlpvalues[1]);
        txtCity.SetText(lhlpvalues[2]);
        txtState.SetText(lhlpvalues[3]);
        txtPin.SetText(lhlpvalues[4]);
        document.all.hdnInsAccCode.value = lhlpvalues[6];
    }
}

function showMultiAddressPop() {
    if (gridLookup.GetValue() == "" || gridLookup.GetValue() == null) {
        alert("Please select Account");
        return false;
    }

    rtnvalues = window.open("PopOverlay.aspx?Url=mdAddressInfo.aspx?acccode=" + document.getElementById("hdnAccCode").value + "&Mode=New&InsAcccode=&From=Installation", null, "Width=1000,Height=280,scroll=no;")

    gridLookupInstallAddress.GetGridView().Refresh();

}
//R5_1_5 Changes End

function ContactOnGridFocusedRowChanged(s, e) {
    var grid = ContactComboBox.GetGridView();
    if (grid.GetFocusedRowIndex() >= 0) {
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'ContCode;Name;Department;Phone;', ShowContact);
    }
}

function ShowContact(lhlpvalues) {
    if (String(lhlpvalues) != "undefined" && String(lhlpvalues) != "null") {
        ContactComboBox.SetText(lhlpvalues[1]);
        document.all.hdnWarType.value = lhlpvalues[1];
    }
}

function OngrdModelFocusedRowChanged(s, e) {
    var grid = grdModel.GetGridView();
    if (grid.GetFocusedRowIndex() >= 0) {
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'PSCode;Prodcode;PartNo;Prodline;ProdDesc;', ShowModel);
    }
}

function ShowModel(lhlpvalues) {
    if (String(lhlpvalues) != "undefined" && String(lhlpvalues) != "null") {
        //grdModel.SetText(lhlpvalues[2]); // Set only Account to the Grid Lookup 
        document.all.hdnProdCode.value = lhlpvalues[1];
        document.all.hdnPSCode.value = lhlpvalues[0];
        txtProdDesc.SetText(lhlpvalues[4]);

        // Added by koripriyan on August 17 2018
        txtPrincipal.SetText(lhlpvalues[3]);
        //


        //alert(document.all.hdnProdCode.value);
    }

    //for devexpress tabs
    //pcContract.GetTabByName('name_InstallationDetails').SetEnabled(true);
    //pcContract.GetTabByName('name_SLADetails').SetEnabled(true);
    //pcContract.GetTabByName('name_ComponentDetails').SetEnabled(true);
    //for html ul div

    hypLink1 = $("#liSLAInfo");//slamast
    hypLink2 = $("#liComponents");//componentmast
    hypLoadFav1 = document.getElementById("liSLAInfo");//slamast
    hypLoadFav2 = document.getElementById("liComponents");//componentmast
    if (document.all.hdnProdCode.value != "") {
        hypLink1.removeAttr('class');
        hypLink2.removeAttr('class');
        //document.all.slamast.disabled = false;
        //document.all.componentmast.disabled = false;
    }
    else {
        hypLink1.addClass("DisabledLink");
        hypLink2.addClass("DisabledLink");
        //document.all.slamast.disabled = true;
        //document.all.componentmast.disabled = true;
    }

    //document.all.slamast.disabled = false;
    //document.all.componentmast.disabled = false;


}

function getcontactData() {
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
        var sURL = "WebService/ServiceRequest.asmx/GetContact"
        xml.open("POST", sURL, false);

        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var str = "AccCode=" + document.all.hdnAccCode.value;
        xml.send(str)
        lsval = xml.responseText;
        ContactComboBox.ClearItems();
        ContactComboBox.AddItem("<-Select->", "", 0);

        if (lsval != "") {
            arReceived = lsval.split("^^^");

            for (i = 0; i < arReceived.length - 1; i++) {
                arToBind = arReceived[i].split("|");
                ContactComboBox.AddItem(arToBind[1], arToBind[0]);
            }
        }
        ContactComboBox.SetSelectedIndex(0);
    }
}

function ContactValueChanged() {

    var contactValues = ContactComboBox.GetValue();
    if (contactValues != "") {
        document.all.hdnContCode.value = contactValues;
        var xml;
        if (window.XMLHttpRequest) {
            // code for all new browsers
            xml = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) {
            // code for IE5 and IE6
            xml = new ActiveXObject("Microsoft.XMLHTTP");
        }
        var sURL = "WebService/ServiceRequest.asmx/GetContactValues"
        xml.open("POST", sURL, false);

        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var str = "ContCode=" + document.all.hdnContCode.value;
        xml.send(str)
        lsval = xml.responseText;

        if (lsval != "") {
            arReceived = lsval.split("^^^");
            for (i = 0; i < arReceived.length - 1; i++) {
                arToBind = arReceived[i].split("|");

                if (arToBind[0] != "null" && arToBind[0] != "")
                    txtDepart.SetText(arToBind[0]);//document.getElementById("txtDepartment").value = arToBind[0];

                if (arToBind[1] != "null" && arToBind[1] != "")
                    txtMobile.SetText(arToBind[1]);//document.getElementById("txtMobileNo").value = arToBind[1];
            }
        }
    }
    else {
        txtDepart.SetText('');
        txtMobile.SetText('');
    }
}
/*
function fnOpenContact() {
    if (gridLookup.GetValue() == "" || gridLookup.GetValue() == null) {
        alert("Please select Account");
        return false;
    }

    //var rtnval = fnOpenWindowPopup('AddContacts.aspx?acccode=' + document.getElementById("hdnAccCode").value + '&logid=' + document.getElementById("hdnLogId").value + '&ShowModalDialog=Yes', '450', '750');
    //if (window.showModalDialog) {
    //    rtnvalues = window.showModalDialog("PopOverlay.aspx?Url=AddContact.aspx?acccode=" + document.getElementById("hdnAccCode").value + "&logid=" + document.all.logid.value, null, "dialogWidth=1000Px;dialogHeight=450Px;status:no;");
    //    loadContactValues(rtnvalues);
    //}
    //else {


    /*    Commented BY Deepak on 08JUN2018
    rtnvalues = window.open("PopOverlay.aspx?Url=AddContact.aspx?acccode=" + document.getElementById("hdnAccCode").value + "&logid=" + document.all.logid.value, null, "Width=1000,Height=450,scroll=no;")
    rtnvalues.moveTo((window.screen.width / 2) - (1000 / 2), (window.screen.height / 2) - (450 / 2));
    */
  //  var url = "PopOverlay.aspx?Url=AddContact.aspx?acccode=" + document.getElementById("hdnAccCode").value + "&logid=" + document.all.logid.value+"&Module=InstallationSubhome";
  //  $("#objAddPurchase").attr("data", url);
   // $('#AddPurchaseModal').modal('show');

    //}
//}

function loadContactValues(val) {
  //  alert(val);
    //getcontactData();
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }

    if (val != "" && val != undefined && val != "undefined") {
        var contactValues = val.substring(8);
        document.all.hdnContCode.value = contactValues;

        var sURL = "WebService/ServiceRequest.asmx/GetNewContactValues"
        //GetCustomer
        xml.open("POST", sURL, false);

        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var str = "ContCode=" + document.all.hdnContCode.value;
        // alert(str);
        xml.send(str)
        lsval = xml.responseText;

        if (lsval != "") {

            arReceived = lsval.split("^^^");

            for (i = 0; i < arReceived.length - 1; i++) {
                arToBind = arReceived[i].split("|");
                //alert(arToBind[0]);
                ContactComboBox.AddItem(arToBind[1], arToBind[0]);

            }
        }

        ContactComboBox.SetValue(arToBind[0]);
        ContactComboBox.SetText(arToBind[1]);
        ContactValueChanged();
    }
}

function RebuildValue() {
    var WarrantyEnd = "";
    for (var j = 0; j < RowCount; j++) {
        if (aWarType[j] != "") {
            WarrantyEnd = "s";
            recalculateDate(j, aWarType[j], aMonth[j]);
        }
    }

    if (WarrantyEnd != "s") {
        //  txtWarrantyEnd.SetValue(null);
        document.all.txtWarrantyEnd.value = null;
    }
    RebuildTable();
}

function WarantyAdd(id) {


    var year, month, day, jsDate, WARStartDate, WAREndmyDate;
    if (document.all.txtInstallDate.value != "") {

        if (id == "none" || id == null) {

            //date = txtInstallDate.GetText();
            //  date = document.all.txtInstallDate.value


            //if (date == 'dd/MM/yyyy' || date == '') {
            //    alert('Install Date Can\'t be Empty');
            //    txtInstallDate.Focus();
            //    return false;
            //}



            frmv = rtndateonly1(document.all.txtInstallDate, "Install Date");
            if (frmv == false) {
                // document.all.txtInstallDate.value = "";
                return false;
            }


            else {
                // //document.all.hdnInitialWarEnddate.value = txtInstallDate.GetDate();
                // jsDate = txtInstallDate.GetDate();
                //  jsDate = document.all.txtInstallDate.value
                //  alert(document.all.txtInstallDate.value)
                var from = $("#txtInstallDate").val().split("/");
                var jsDate = new Date(from[2], from[1] - 1, from[0]);

                year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
                month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
                day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

                //  WARStartDate = new Date(from[2], from[1], from[0]);
                //WAREndmyDate = new Date(from[2], from[1]-1, from[0]- 1);


                //alert(day)
                //alert(month)
                //alert(year)
                //alert(from[2])
                //alert(from[1])
                //alert(from[1]-1)
                //alert(from[0])

                //alert(f)
                //year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
                //month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
                //day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

                WARStartDate = new Date(year, month, day);
                WAREndmyDate = new Date(year, month, day - 1);

                //  WARStartDate = day + '/' + month + '/' + year;
                //   WAREndmyDate = day - 1 + '/' + month + '/' + year;
                WARStartDate = convertDate(WARStartDate)
                WAREndmyDate = convertDate(WAREndmyDate)

                initstartdate = WAREndmyDate;
                startdate = WARStartDate;
                enddate = WAREndmyDate;
                prevenddate = WAREndmyDate;
                document.all.txtWarrantyStart.value = WARStartDate;
                //txtWarrantyStart.SetText(WARStartDate);
                //// txtWarrantyEnd.SetText(WAREndmyDate);
            }
            RebuildValue();
        }
        else if (id == "war") {
            //document.all.hdnInitialWarEnddate.value = txtInstallDate.GetDate();
            //  jsDate = txtWarrantyEnd.GetDate();
            //  jsDate = new Date(document.all.txtWarrantyEnd.value);
            var from = $("#txtInstallDate").val().split("/");
            var jsDate = new Date(from[2], from[1] - 1, from[0]);
            year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
            month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
            day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

            WARStartDate = new Date(year, month, day);
            //  WAREndmyDate = txtWarrantyEnd.GetDate();//new Date(year + 1, month, day - 1);

            WARStartDate = convertDate(WARStartDate);
            WAREndmyDate = convertDate(WARStartDate);
            initstartdate = WAREndmyDate;

            RebuildValue();
        }
        else {
            recalculateDate(id, aWarType[id], aMonth[id]);
        }
    }
}


function checkstringnew(obj) {

    var specialchars = "`~#%^&+=|'><*"
    var retval;
    var inobj, message;
    inobj = obj;
    a = inobj.value;
    if (a == "") {
        return;
    }
    l = a.length;
    retval = "";
    for (i = 0; i < l; i++) {
        if (specialchars.indexOf(a.charAt(i)) == -1) {
            if (a.charCodeAt(i) != 34) {
                retval = retval + a.charAt(i)
            }
        }
    }
    inobj.value = retval;
    return;
}


function validform() {
    debugger;
   
   // checkstringnew(document.all.txtnewcomments);
  

    var date;
    if (grdModel.GetValue() == "" || grdModel.GetValue() == null || document.all.hdnProdCode.value == "") {
        alert("Please select Model No");
        grdModel.Focus();
        return false;
    }
  
    if (document.all.txtSerialNo.value == "" || document.all.txtSerialNo.value == null && document.getElementById("hdnserialnomandatory").value == "1") {
        var lblserialname = document.getElementById('lblserialno').innerText;
        alert("Please Enter " + lblserialname + " ");
        txtSerialNo.Focus();
        return false;
    }
    
   // document.all.hdnFinalProdCode.value = document.all.hdnProdCode.value;
   // alert(document.all.hdnFinalProdCode.value)
    document.all.hdnFinalPSCode.value = document.all.hdnPSCode.value;
  
    if (document.all.txtSalesOrderDate.value != "") {
        frmv = rtndateonly1(document.all.txtSalesOrderDate, "Sales Order Date");
        if (frmv == false) {
            return false;
        }
    }
    //if (txtSerialNo.GetText() == "" || txtSerialNo.GetText() == null) {
    //    // alert("test");
    //    var name = document.getElementById('lblserialno').innerText;
    //    if (name == "Serial No")

    //    {
    //        alert("Please Enter Serial no");
    //    }
    //    else {
    //        alert("Please Enter Sr no");
    //    }
       
    //    return false;
    //}

   
    if (document.getElementById("hdnmandatory1").value == "True") {
       
        if (document.getElementById("hdncontroltype1").value == "TextBox") {
            if (document.all.txtfield1.value == "") {
                alert("" + document.all.hdnlblfield1.value + " cannot be Empty");
                document.all.txtfield1.focus();
                return false;
            }
        }
        if (document.getElementById("hdncontroltype1").value == "TextArea") {
            if (document.all.txtarea1.value == "") {
                alert("" + document.all.hdnlblfield1.value + " cannot be Empty");
                document.all.txtarea1.focus();
                return false;
            }
        }
        if (document.getElementById("hdncontroltype1").value == "Dropdown") {
          
            if (document.all.ddfield1.value == "<-Select->") {
                alert("Please Select " + document.all.hdnlblfield1.value + " ");
                document.all.ddfield1.focus();
                return false;
            }
        }
    }

    if (txtPuchaseOrder.GetText() == "" || txtPuchaseOrder.GetText() == null) {
        alert("Please enter PO#");
        txtPuchaseOrder.Focus();
        return false;
    }
  
    //date = txtPuchaseOrderDate.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('PO Date Can\'t be Empty');
    //    txtPuchaseOrderDate.Focus();
    //    return false;
    //}

    if (document.all.txtPuchaseOrderDate.value == "") {
        alert("PO Date Can\'t be Empty")
        document.all.txtPuchaseOrderDate.focus();
        return false;
    }

    frmv = rtndateonly1(document.all.txtPuchaseOrderDate, "PO Date");
    if (frmv == false) {
        return false;
    }

    if (cmbCat.GetValue() == "" || cmbCat.GetValue() == null) {
        alert("Please select Category");
        cmbCat.Focus();
        return false;
    }
    if (txtInvoiceNo.GetText() == "" || txtInvoiceNo.GetText() == null) {
        alert("Please enter Invoice No");
        txtInvoiceNo.Focus();
        return false;
    }
    //date = txtInvoiceDate.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('Invoice Date Can\'t be Empty');
    //    txtInvoiceDate.Focus();
    //    return false;
    //}

    //Commented and Modified by koripriyan on August 14 2018 
    //if (document.all.txtInvoiceDate.value == "") {

    if (document.all.txtInvoiceDate.value == "") {
        alert("Invoice Date Can\'t be Empty")
        document.all.txtInvoiceDate.focus();
        return false;
    }

    frmv = rtndateonly1(document.all.txtInvoiceDate, "Invoice Date");
    if (frmv == false) {
        return false;
    }


    /*
    if (txtdisFrmBranch.GetText() == "" || txtdisFrmBranch.GetText() == null) {
        alert("Please enter Distance From Service Location");
        txtdisFrmBranch.Focus();
        return false;
    }
    */





    //date = txtInstallDate.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('Install Date Can\'t be Empty');
    //    txtInstallDate.Focus();
    //    //e.processOnServer = false;
    //    return false;
    //}

    //date = txtWarrantyStart.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('Warranty Start Date Can\'t be Empty');
    //    txtWarrantyStart.Focus();
    //    //e.processOnServer = false;
    //    return false;
    //}

    //date = txtWarrantyEnd.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('Warranty End Date Can\'t be Empty');
    //    txtWarrantyEnd.Focus();
    //    //e.processOnServer = false;
    //    return false;
    //}

    //Added by koripriyan on August 20 2018

    //if (document.all.txtInstallDate.value == "") {

    //    alert("Install Date Can\'t be Empty")
    //    document.all.txtInstallDate.focus();
    //    return false;
    //}


    if (document.all.txtInstallDate.value != "") {



        frmv = rtndateonly1(document.all.txtInstallDate, "Install Date");
        if (frmv == false) {
            // document.all.txtInstallDate.value = "";
            return false;
        }

        if (document.all.txtWarrantyStart.value == "") {
            alert("Warranty Start Date Can\'t be Empty")
            //  document.all.txtInstallDate.focus();

            return false;
        }

        frmv = rtndateonly1(document.all.txtWarrantyStart, "Warranty Start Date");
        if (frmv == false) {
            // document.all.txtInstallDate.value = "";
            return false;
        }

        if (document.all.txtWarrantyEnd.value == "") {
            alert("Warranty End Date is empty! Enter Install Date, Months and click on Add to List button")
            //  document.all.txtInstallDate.focus();

            return false;
        }

        frmv = rtndateonly1(document.all.txtWarrantyEnd, "Warranty End Date");
        if (frmv == false) {
            // document.all.txtInstallDate.value = "";
            return false;
        }


        document.getElementById("hdnWarrantyInfo").value = "";

        for (var i = 0; i < RowCount; i++) {
            if (aWarType[i] != "") {
                document.getElementById("hdnWarrantyInfo").value += aWarType[i] + "~" + aMonth[i] + "~" + aNoofVisit[i] + "~" + aModule[i] + "~" + aWarStartDate[i] + "~" + aWarEndDate[i] + "#";
            }
        }

        if (document.getElementById("hdnWarrantyInfo").value == "") {
            alert("Warranty Info Details cannot be empty");
            document.all.txtWarrantyStart.Focus();
            return false;
        }
    }


    if (gridLookup.GetValue() == "" || gridLookup.GetValue() == null) {
        alert("Please select Account");
        gridLookup.Focus();
        return false;
    }

    //Removed Installation Address As per Pin - R5_1_5(CogentCRM)
    /*
    if (txtInsAddress.GetText() == "" || txtInsAddress.GetText() == null) {
        alert("Please enter Address");
        txtInsAddress.Focus();
        return false;
    }

    if (txtInsPinCode.GetText() == "" || txtInsPinCode.GetText() == null) {
        alert("Please enter Installation Pincode");
        txtInsPinCode.Focus();
        return false;
    }

    if (txtInsCity.GetText() == "" || txtInsCity.GetText() == null) {
        alert("Please enter City");
        txtInsCity.Focus();
        return false;
    }
    //if (txtInsState.GetText() == "" || txtInsState.GetText() == null) {
    //    alert("Please enter State");
    //    txtInsState.Focus();
    //    return false;
    //}

    if (document.all.cmbState.value == "") {
        alert("Please select the State");
        document.all.cmbState.focus();
        return false;
    }
    */

    if (ContactComboBox.GetValue() == "" || ContactComboBox.GetValue() == null) {
        alert("Please select Contact");
        ContactComboBox.Focus();
        return false;
    }

    if (cmbengineer1.GetValue() == "" || cmbengineer1.GetValue() == null) {
        alert("Please select Engineer1");
        cmbengineer1.Focus();
        return false;
    }

    /*enginere*/
    if (cmbengineer1.GetValue() == cmbengineer2.GetValue()) {
        alert("Engineer1 and Engineer2 are Same, Please select different Engineer");
        cmbengineer1.Focus();
        return false;
    }

    if (cmbSubStatus.GetValue() == "" || cmbSubStatus.GetValue() == null) {
        alert("Please select SubStatus");
        cmbSubStatus.Focus();
        return false;
    }


    document.getElementById("hdnComponentInfo").value = "";

    for (var i = 0; i < RowNewCount; i++) {
        if (aComponent[i] != "") {
            document.getElementById("hdnComponentInfo").value += aComponent[i] + "~" + aSerialno[i] + "~" + aQty[i] + "~" + aVersionno[i] + "~" + aNewWarStartDate[i] + "~" + aNewWarEndDate[i] + "~" + aComments[i] + "#";
            alert(document.getElementById("hdnComponentInfo").value);
            return false;
        }
    }

    // alert(document.getElementById("hdnComponentInfo").value)
    // = "";



    //SLA Info

    var ProdList = "";
    //for (i = 1; i <= document.all.hdncount.value; i++) {
    //if (document.all("chkBillable" + i).checked)
    //{
    //// ProdList += document.all("hdnservicecode" + i).value + "^^^" + document.all("txtResponse" + i).value + "^^^" + document.all("txtResolution" + i).value + "^^^" + document.frmSLA("hdnvendorcode" + i).value + "^^^" + "|||"
    //ProdList += document.all("hdnservicecode" + i).value + "^^^" + document.all("txtResponse" + i).value + "^^^" + document.all("txtResolution" + i).value + "^^^" + document.frmSLA("hdnvendorcode" + i).value + "^^^" + "|||"

    /* //backup
    if (txtHighResp.GetText() != '' && txtHighResol.GetText() != '' && document.all.hdnvendorcode1.value != '')
        ProdList += document.all("hdnservicecode1").value + "|" + txtHighResp.GetText() + "|" + txtHighResol.GetText() + "|" + document.all.hdnvendorcode1.value + "~"
    if (txtMediumResp.GetText() != '' && txtMediumResol.GetText() != '' && document.all.hdnvendorcode2.value != '')
        ProdList += document.all("hdnservicecode2").value + "|" + txtMediumResp.GetText() + "|" + txtMediumResol.GetText() + "|" + document.all.hdnvendorcode2.value + "~"
    if (txtLowResp.GetText() != '' && txtLowResol.GetText() != '' && document.all.hdnvendorcode3.value != '')
        ProdList += document.all("hdnservicecode3").value + "|" + txtLowResp.GetText() + "|" + txtLowResol.GetText() + "|" + document.all.hdnvendorcode3.value + "~"
    */
    
    if (txtHighRespHrs.GetText() == "" || txtHighRespMins.GetText() == "" || txtHighResolHrs.GetText() == "" || txtHighResolMins.GetText() == ""
        || txtMediumRespHrs.GetText() == "" || txtMediumRespHrs.GetText() == "" || txtMediumResolHrs.GetText() == "" || txtMediumResolMins.GetText() == ""
        || txtLowRespHrs.GetText() == "" || txtLowRespMins.GetText() == "" || txtLowResolHrs.GetText() == "" || txtLowResolMins.GetText() == "")
    {
        alert('Select SLA Info');
        return false;
    }


    var HighResp = (+(txtHighRespHrs.GetText() * 60) + +txtHighRespMins.GetText())
    var HighResol = (+(txtHighResolHrs.GetText() * 60) + +txtHighResolMins.GetText())
    var MediumResp = (+(txtMediumRespHrs.GetText() * 60) + +txtMediumRespMins.GetText())
    var MediumResol = (+(txtMediumResolHrs.GetText() * 60) + +txtMediumResolMins.GetText())
    var LowResp = (+(txtLowRespHrs.GetText() * 60) + +txtLowRespMins.GetText())
    var LowResol = (+(txtLowResolHrs.GetText() * 60) + +txtLowResolMins.GetText())

    if (HighResp != '' && HighResol != '' && document.all.hdnvendorcode1.value != '')
        ProdList += document.all("hdnservicecode1").value + "|" + HighResp + "|" + HighResol + "|" + document.all.hdnvendorcode1.value + "~"
    if (MediumResp != '' && MediumResol != '' && document.all.hdnvendorcode2.value != '')
        ProdList += document.all("hdnservicecode2").value + "|" + MediumResp + "|" + MediumResol + "|" + document.all.hdnvendorcode2.value + "~"
    if (LowResp != '' && LowResol != '' && document.all.hdnvendorcode3.value != '')
        ProdList += document.all("hdnservicecode3").value + "|" + LowResp + "|" + LowResol + "|" + document.all.hdnvendorcode3.value + "~"

    if (ProdList == '') {
        alert('Select SLA Info');
        return false;
    }
    //}
    //} 
    document.all.hdnProdlist.value = ProdList




    document.getElementById('btnsave').style.display = 'none';

    //alert("validation end")
}

function ShowMap() {

    var markerinfo = "";

    if (grdModel.GetValue() != "" || grdModel.GetValue() != null) {
        markerinfo += "Model No:" + grdModel.GetValue() + "|";
    }
    if (gridLookup.GetValue() != "" || gridLookup.GetValue() != null) {
        markerinfo += "Account:" + gridLookup.GetValue() + "|";
    }

    //if (txtAddress.GetText() != "" || txtAddress.GetText() != null) {
    //    markerinfo += "Address:" + txtAddress.GetText() + "|";
    //}
    if (document.getElementById('txtAddress').value != "" || document.getElementById('txtAddress').value != null) {
        markerinfo += "Address:" + document.getElementById('txtAddress').value + "|";
    }




    document.all.hdnmarkerinfo.value = markerinfo
    if (isNaN(txtlatitude.GetText())) {
        alert("Please enter only numeric value For Lattitude ");
        txtlatitude.Focus();
        return false;
    }
    if (isNaN(txtlongitude.GetText())) {
        alert("Please enter only numeric value For Longitude ");
        txtlongitude.Focus();
        return false;
    }

    var retvalue = ""
    var url;

    // alert(document.getElementById('chkGeolocation').checked); 

    if (document.all.chkGeolocation.checked == true) {
        if (txtlongitude.GetText() != "" || txtlatitude.GetText() != "") {
            //retvalue = window.showModalDialog("BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=" + txtlatitude.GetText() + "&longitude=" + txtlongitude.GetText() + "&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=true", null, "dialogWidth=950px;dialogHeight=500px;status:no;")
            url = "BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=" + txtlatitude.GetText() + "&longitude=" + txtlongitude.GetText() + "&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=true";//, null, "dialogWidth=950px;dialogHeight=500px;status:no;";
        }
        else {
            //retvalue = window.showModalDialog("BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=22.492257694&longitude=79.381713469&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=true&ZoomLevel=1", null, "dialogWidth=950px;dialogHeight=500px;status:no;")
            url = "BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=22.492257694&longitude=79.381713469&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=true&ZoomLevel=1";//, null, "dialogWidth=950px;dialogHeight=500px;status:no;";
        }
    }
    else {
        if (txtlongitude.GetText() != "" || txtlatitude.GetText() != "") {
            //retvalue = window.showModalDialog("BankLocation.aspx?logid=" + document.all.hdnlogid.value + "&latitude=" + document.all.txtlatitude.value + "&longitude=" + document.all.txtlongitude.value + "&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=false", null, "dialogWidth=950px;dialogHeight=500px;status:no;")
            url = "BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=" + txtlatitude.GetText() + "&longitude=" + txtlongitude.GetText() + "&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=false";//, null, "dialogWidth=950px;dialogHeight=500px;status:no;"
        }
        else {
            //retvalue = window.showModalDialog("BankLocation.aspx?logid=" + document.all.hdnlogid.value + "&latitude=-14.455957734&longitude=28.317260344&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=false&ZoomLevel=1", null, "dialogWidth=950px;dialogHeight=500px;status:no;")
            url = "BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=-14.455957734&longitude=28.317260344&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=false&ZoomLevel=1"//, null, "dialogWidth=950px;dialogHeight=500px;status:no;"
        }
    }

    if (window.showModalDialog) {
        //rtnvalues = window.showModalDialog("SearchSalesOrder.aspx?SalesOrder=" + grdModel.GetValue() + "&logid=" + document.all.logid.value, null, "dialogWidth=700Px;dialogHeight=400Px;status:no;");
        rtnvalues = window.showModalDialog(url, null, "dialogWidth=950Px;dialogHeight=500Px;status:no;");
        fnsetMapDetails(rtnvalues);
    }
    else {
        //rtnvalues = window.open("SearchSalesOrder.aspx?SalesOrder=" + grdModel.GetValue() + "&logid=" + document.all.logid.value, null, "Width=700,Height=400,scroll=no;")
        rtnvalues = window.open(url, null, "Width=1000,Height=600,scroll=no;")
        rtnvalues.moveTo((window.screen.width / 2) - (1000 / 2), (window.screen.height / 2) - (600 / 2));
    }
}

function fnsetMapDetails(retvalue) {
    if (String(retvalue) == "undefined" || String(retvalue) == "Cancel") {
        return false;
    }
    else {
        var latlng = retvalue.split("|");
        if (latlng[0] != "" && latlng[1] != "") {
            txtlatitude.SetText(parseFloat(latlng[0]).toFixed(9));
            txtlongitude.SetText(parseFloat(latlng[1]).toFixed(9));
        }
    }
}

function addcomponent() {

    if (document.all.txtEquipId.value != "") {
        if (window.XMLHttpRequest) {
            // code for all new browsers
            xml = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) {
            // code for IE5 and IE6
            xml = new ActiveXObject("Microsoft.XMLHTTP");
        }
        /*
        // Mehtod to check whether the Serial No exist in CRM for Same Product
        var xml = new ActiveXObject("Microsoft.XMLHTTP");
        var sURL = "getSerialNoValid.asp?SerialNo=" + document.getElementById("txtEquipId").value + "&ProdCode=" + document.getElementById("hdnProdCode").value;
        xml.open("POST", sURL, false);
        xml.send();
        var lsval = xml.responseText;
        */
        var sURL = "WebService/ServiceRequest.asmx/getSerialNoValid"
        xml.open("POST", sURL, false);

        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var str = "SerialNo=" + document.getElementById("txtEquipId").value;// + "&ProdCode " + = document.getElementById("hdnProdCode").value;
        str += "&ProdCode=" + document.getElementById("hdnProdCode").value;
        xml.send(str)
        lsval = xml.responseText;
        //alert(lsval);
        if (lsval != "Valid") {
            alert("SerialNo Already Exist in CRM for Same Product...");
            return false;
        }
        if (cmbComponent.GetValue() == "" || cmbComponent.GetValue() == null) {
            alert("Please Select the Component");
            cmbComponent.Focus();
            return false;
        }
        var rtnvalues;

        if (window.showModalDialog) {
            rtnvalues = window.showModalDialog("PopupAddComponents.asp?Component=" + cmbComponent.GetValue() + "||" + cmbComponent.GetText() + "&ProdCode=" + document.getElementById("hdnProdCode").value + "&InstallCode=&atmid=" + document.all.txtEquipId.value + "&logid=" + document.all.logid.value, null, "dialogWidth=1450Px;dialogHeight=380Px;scroll:yes;")
            fnSetComponent();
        }
        else {
            rtnvalues = window.open("PopupAddComponents.asp?Component=" + cmbComponent.GetValue() + "||" + cmbComponent.GetText() + "&ProdCode=" + document.getElementById("hdnProdCode").value + "&InstallCode=&atmid=" + document.all.txtEquipId.value + "&logid=" + document.all.logid.value, null, "Width=1450,Height=380,scroll=no;")
            rtnvalues.moveTo((window.screen.width / 2) - (1250 / 2), (window.screen.height / 2) - (380 / 2));
        }

        //rtnvalues = window.showModalDialog("PopupAddComponents.asp?Component=" + cmbComponent.GetValue() + "||" + cmbComponent.GetText() + "&ProdCode=" + document.getElementById("hdnProdCode").value + "&InstallCode=&atmid=" + document.all.txtEquipId.value + "&logid=" + document.all.logid.value, null, "dialogWidth=950Px;dialogHeight=380Px;scroll:yes;")
        //document.all.Frame1.src = "ComponentDetails.asp?Component=" + cmbComponent.GetValue() + "&ProdCode=" + document.getElementById("hdnProdCode").value + "&InstallCode=&equipid=" + document.all.txtEquipId.value + "&logid=" + document.all.logid.value;
    }
    else {
        alert("Please Enter the Serial No");
    }
}
function fnSetComponent() {
    //pcContract.SetActiveTab(pcContract.GetTabByName('name_InstallationDetails'));
    //pcContract.SetActiveTab(pcContract.GetTabByName('name_SLADetails'));
    //pcContract.SetActiveTab(pcContract.GetTabByName('name_ComponentDetails'));

    //document.all.Frame1.src = "ComponentDetails.asp?Component=" + cmbComponent.GetValue() + "&ProdCode=" + document.getElementById("hdnProdCode").value + "&InstallCode=&equipid=" + document.all.txtEquipId.value + "&logid=" + document.all.logid.value;
}

function load() {
    //document.getElementById("Frame1").src = "ComponentDetails.asp?logid=" + document.all.logid.value;
    //document.all.Frame1.src = "ComponentDetails.asp?logid=" + document.all.logid.value;
}

function checkNum_dev(eveval) {
    if (eveval < 48 || eveval > 57) {
        event.keyCode = 0;
        return false;
    }
}



var Suppliercount = 0;

function ShowProduct(k) {
    var i = k
    var rtnvalues;
    var lhlpvalues = new Array();
    var VendorName = "";
    if (k != "fill") {
        if (i == 1) {
            VendorName = txtSupplier1.GetText();
            Suppliercount = 1;
        }
        else if (i == 2) {
            VendorName = txtSupplier2.GetText();
            Suppliercount = 2;
        }
        else if (i == 3) {
            VendorName = txtSupplier3.GetText();
            Suppliercount = 3;
        }


        //rtnvalues = window.showModalDialog("SearchSupplier.asp?VendorName=" + VendorName + "&logid=" + document.all.logid.value, null, "dialogWidth=600Px;dialogHeight=350Px;status:no;");
        //fnSetSupplier1(rtnvalues);
        if (window.showModalDialog) {
            rtnvalues = window.showModalDialog("SearchSupplier.aspx?VendorName=" + VendorName + "&logid=" + document.all.logid.value, null, "dialogWidth=600Px;dialogHeight=350Px;status:no;");
            fnSetSupplier(rtnvalues);
        }
        else {
            //rtnvalues = window.open("SearchSupplier.aspx?VendorName=" + VendorName + "&logid=" + document.all.logid.value, null, "Width=600,Height=350,scroll=no;")
            //rtnvalues.moveTo((window.screen.width / 2) - (600 / 2), (window.screen.height / 2) - (350 / 2));

            rtnvalues = window.open("SearchSupplier.aspx?VendorName=" + VendorName + "&logid=" + document.all.logid.value, null, "Width=600,Height=350,scroll=no;")
            rtnvalues.moveTo((window.screen.width / 2) - (600 / 2), (window.screen.height / 2) - (350 / 2));
        }
    }
    else {
        if (window.showModalDialog) {
            rtnvalues = window.showModalDialog("SearchSupplier.aspx?VendorName=" + VendorName + "&logid=" + document.all.logid.value, null, "dialogWidth=600Px;dialogHeight=350Px;status:no;");
            fnSetSupplier(rtnvalues);
        }
        else {
            rtnvalues = window.open("SearchSupplier.asp?VendorName=" + VendorName + "&logid=" + document.all.logid.value, null, "Width=60,Height=350,scroll=no;");
            rtnvalues.moveTo((window.screen.width / 2) - (600 / 2), (window.screen.height / 2) - (Height / 2));
            //var rtnvalue = window.open("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, "pop", position);
            //rtnvalue.moveTo((window.screen.width / 2) - (Width / 2), (window.screen.height / 2) - (Height / 2)); 
        }
    }
}

function fnSetSupplier(rtnvalues) {
    var i = Suppliercount;
    var k = Suppliercount;
    if (k != "fill") {
        if (String(rtnvalues) != "undefined") {
            lhlpvalues = rtnvalues.split("|");
            // alert(lhlpvalues[0] +','+document.getElementById("hdnvendorcode" + i).value);
            // document.frmPur("hdnvendorcode" + i).value = lhlpvalues[0];
            // alert(lhlpvalues[0] + ',' + document.getElementById("hdnvendorcode" + i).value);
            if (i == 1) {
                txtSupplier1.SetText(lhlpvalues[1]);
                document.all.hdnvendorcode1.value = lhlpvalues[0];
            }
            else if (i == 2) {
                txtSupplier2.SetText(lhlpvalues[1]);
                document.all.hdnvendorcode2.value = lhlpvalues[0];
            }
            else if (i == 3) {
                txtSupplier3.SetText(lhlpvalues[1]);
                document.all.hdnvendorcode3.value = lhlpvalues[0];
            }
            //document.frmPur("hdnvendorcode" + i).value = lhlpvalues[0];
            //document.frmPur("txtSupplier" + i).value = lhlpvalues[1]; 
        }
    }
    else {
        if (String(rtnvalues) != "undefined") {
            lhlpvalues = rtnvalues.split("|");
            document.all.hdncvendorcode.value = lhlpvalues[0];
            document.all.txtSupplier.value = lhlpvalues[1];
        }
    }
}


function fnreset() {
    ASPxClientEdit.ClearEditorsInContainer(frmPur);
    //alert(grdModel.GetText());
    grdModel.SetValue('');
    //alert(grdModel.GetValue());
    document.all.hdnProdCode.value = "";
    document.all.hdnPSCode.value = "";
    document.all.hdnContCode.value = "";

    //alert(document.all.hdnProdCode.value);
    //return false;
}


function fnOpenWindow_Ins() {

    var Height = "520";
    var Width = "1000";//750

    //url, Height, Width
    //'addAccMast.aspx?logid=&amp;ShowModalDialog=Yes', '520', '750'

    /*
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }

    url = url.replace(".", "$"); 
    if (window.showModalDialog) {
        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=yes;";
        position = position + "status:no;";
        var rtnvalue1 = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);
    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";

        var rtnvalue1 = window.open("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, "pop", position);
        rtnvalue1.moveTo((window.screen.width / 2) - (Width / 2), (window.screen.height / 2) - (Height / 2));
    }


    try {
        document.getElementById("Layer1").focus();
        getdata('', '', '', 'refresh');
    }
    catch (ers) {

    }
    return true;
    */

    if (window.showModalDialog) {
        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=yes;";
        position = position + "status:no;";
        var rtnvalue1 = window.showModalDialog("PopOverlay.aspx?Url=addAccMast.aspx?logid=" + document.all.logid.value + "&Height=" + Height + "&Width=" + Width, null, position);

        if (rtnvalue1 != undefined && rtnvalue1 != "") {

            var AccCodeValues = rtnvalue1.substring(8);


            gridLookup.SetValue(AccCodeValues);
            //OnGridFocusedRowChanged();
            GetAccountDetail(AccCodeValues);



            //alert(gridLookup.GetValue());

        }

    }
    else {
        var position = "width=" + Width + ",height=" + Height + "";

        var rtnvalue1 = window.open("PopOverlay.aspx?Url=addAccMast.aspx?logid=" + document.all.logid.value + "&Height=" + Height + "&Width=" + Width, "_blank", position);
        //var rtnvalue1 = window.open("addAccMast.aspx?logid=" + document.all.logid.value , "_blank", position);
        rtnvalue1.moveTo((window.screen.width / 2) - (Width / 2), (window.screen.height / 2) - (Height / 2));
    }

    //if (window.showModalDialog)
    //{
    //    rtnvalues = window.showModalDialog("PopOverlay.aspx?Url=AddContact.aspx?acccode=" + document.getElementById("hdnAccCode").value + "&logid=" + document.all.logid.value, null, "dialogWidth=750Px;dialogHeight=450Px;status:no;");
    //    loadContactValues(rtnvalues);
    //}
    //else
    //{
    //    rtnvalues = window.open("PopOverlay.aspx?Url=AddContact.aspx?acccode=" + document.getElementById("hdnAccCode").value + "&logid=" + document.all.logid.value, null, "Width=750,Height=450,scroll=no;")
    //    rtnvalues.moveTo((window.screen.width / 2) - (750 / 2), (window.screen.height / 2) - (450 / 2));
    //}

}

function GetAccountDetail(AccCode) {
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }
    lsval = "";
    var sURL = "WebRequest.asmx/GetAccountdetails"
    xml.open("POST", sURL, false);
    xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var str = "AccCode=" + AccCode;
    xml.send(str)
    lsval = xml.responseText;


    if (lsval != "") {
        arReceived = lsval.split("^^^");

        //for (i = 0; i < arReceived.length - 1; i++) {
        arToBind = arReceived[0].split("|");
        //ContactComboBox.AddItem(arToBind[1], arToBind[0]);
        //}


        document.all.hdnAccCode.value = arToBind[0];
        gridLookup.SetText(arToBind[1]); // Set only Account to the Grid Lookup
        txtsite.SetText(arToBind[2]);
        //txtSiteId.SetText((arToBind[3]));
        //txtAddress.SetText(lhlpvalues[4]);

        //document.getElementById('txtAddress').value = arToBind[4];

        //SetText property Deprecated in 17.1 
        //gridLookupInstallAddress.SetText(arToBind[4]); //R5_1_5 CHanges

        txtCity.SetText(arToBind[5]);
        txtState.SetText(arToBind[6]);
        txtPin.SetText(arToBind[7]);
        txtIndustry.SetText(arToBind[8]);

        //Clear Contact values
        ContactComboBox.SetText('');
        txtMobile.SetText('');
        txtDepart.SetText('');
        document.all.hdnContCode.value = "";

        //Clear Install Address INfo values
        //Removed Installation Address As per Pin - R5_1_5(CogentCRM)
        //txtInsAddress.SetText('');
        //txtInsCity.SetText('');
        //txtInsPinCode.SetText('');
        //document.all.cmbState.value = "";


        getcontactData();
    }

}


prodnewTable = 0;
RowNewCount = 0;
ContNewRowCount = 0;



aComponent = new Array(100);
aComponenttext = new Array(100);
aSerialno = new Array(100);
aQty = new Array(100);
aVersionno = new Array(100);
aNewWarStartDate = new Array(100);
aNewWarEndDate = new Array(100);
aComments = new Array(100);

function checkserialno(serialno) {


    
   

    
}

function Addonproducts() {
   
   
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }

    var sURL = "Webrequest.asmx/checkcomposerialno"
    xml.open("POST", sURL, false);
    xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    var str = "serialno=" + txtnewSerialno.GetValue();
    xml.send(str)

    lsval = xml.responseText;


    if (lsval != "") {
        var a = lsval.split("|");
        for (i = 0; i <= a.length - 2; i++) {

            var b = a[i];

            if (b == txtnewSerialno.GetValue()) {

                alert('Serial No already exists');
                return false;
            }

        }

    }
     
    if (cmbComponent.GetSelectedItem().value == null || cmbComponent.GetSelectedItem().value == "") {
        alert("Please select Components");
        cmbComponent.Focus();
        return false;
    }
    else {
        document.all.hdncomponents.value = cmbComponent.GetSelectedItem().value;
    }




    if (txtnewSerialno.GetText() == "" || txtnewSerialno.GetText() == null) {
        alert("Please Enter the SerialNo");

        txtnewSerialno.Focus();
        return false;
    }

    if (txtnewqty.GetText() == "" || txtnewqty.GetText() == null) {
        alert("Please Enter the Qty");

        txtnewqty.Focus();
        return false;
    }

    //if (txtnewversionno.GetText() == "" || txtnewversionno.GetText() == null) {
    //    alert("Please Enter the Version No");

    //    txtnewversionno.Focus();
    //    return false;
    //}





    //date = txtnewwarstartdate.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('Warranty Start Date Can\'t be Empty');
    //    txtnewwarstartdate.Focus();

    //    return false;
    //}

    //date1 = txtnewwarenddate.GetText();
    //if (date1 == 'dd/MM/yyyy' || date == '') {
    //    alert('Warranty End Date Can\'t be Empty');
    //    txtnewwarenddate.Focus();

    //    return false;
    //}
    if (document.all.txtnewwarstartdate.value == "") {
        alert("Warranty Start Date Can\'t be Empty")
        //  document.all.txtInstallDate.focus();

        return false;
    }

    frmv = rtndateonly1(document.all.txtnewwarstartdate, "Warranty Start Date");
    if (frmv == false) {
        // document.all.txtInstallDate.value = "";
        return false;
    }

    if (document.all.txtnewwarenddate.value == "") {
        alert("Warranty End Date Can\'t be Empty")
        //  document.all.txtInstallDate.focus();

        return false;
    }

    frmv = rtndateonly1(document.all.txtnewwarenddate, "Warranty End Date");
    if (frmv == false) {
        // document.all.txtInstallDate.value = "";
        return false;
    }


    var war1;
    var war2;

    //  war1 = txtnewwarstartdate.GetText();
    //  war2 = txtnewwarenddate.GetText();

    war1 = document.all.txtnewwarstartdate.value;
    war2 = document.all.txtnewwarenddate.value;


    frmv = checkdatevalue(war2, war1)

    if (frmv == 2) {
        alert("Warranty End Date cannot be lesser than Warranty Start Date ...");
        return false;
    }

    if (document.all.txtnewcomments.value == "" || document.all.txtnewcomments.value == null) {
        alert("Please Enter the comments");
        document.all.txtnewcomments.focus();
        return false;
    }


    for (var i = 0; i < RowNewCount; i++) {
        if (aComponent[i] != '' && aSerialno[i] != '' && (aComponent[i] == document.getElementById('hdncomponents').value && aSerialno[i] == txtnewSerialno.GetText())) {
            alert('Component and Serial No added already!')
            return false;
        }
    }

 

    aComponent[RowNewCount] = document.getElementById("hdncomponents").value;

    aComponenttext[RowNewCount] = cmbComponent.GetText();
    aSerialno[RowNewCount] = txtnewSerialno.GetText();
    aQty[RowNewCount] = txtnewqty.GetText();
    aVersionno[RowNewCount] = txtnewversionno.GetText();
    //aNewWarStartDate[RowNewCount] = txtnewwarstartdate.GetText();
    //aNewWarEndDate[RowNewCount] = txtnewwarenddate.GetText();


    aNewWarStartDate[RowNewCount] = document.all.txtnewwarstartdate.value;
    aNewWarEndDate[RowNewCount] = document.all.txtnewwarenddate.value;


    aComments[RowNewCount] = document.all.txtnewcomments.value;



    RowNewCount = RowNewCount + 1;

    prodnewTable = prodnewTable + 1;


    RebuildcompTable();

    //set empty values
    cmbComponent.SetValue('');
    cmbComponent.SetText('<-Select->');

    txtnewSerialno.SetText('');
    txtnewqty.SetText('');
    txtnewversionno.SetText('');

    //txtnewwarstartdate.SetText(null);
    // txtnewwarstartdate.SetValue(null);
    // txtnewwarenddate.SetValue(null);


    document.all.txtnewwarstartdate.value = null;
    document.all.txtnewwarenddate.value = null;

    // txtnewwarenddate.SetValue('');
    //  txtnewwarenddate.SetText('');

    document.getElementById("txtnewcomments").value = ''

  
    return true;
}





function modifyCompList(RowNo) {

    document.getElementById('btnupdate').disabled = false;
    document.getElementById('Add3').disabled = true;
    
    document.all.hdncomponents.value = aComponent[RowNo];
     // document.all.cmbComponent.value = aComponenttext[RowNo];
    cmbComponent.SetText(aComponenttext[RowNo]);
  
     // document.all.txtnewSerialno.value = aSerialno[RowNo];
      txtnewSerialno.SetText(aSerialno[RowNo]);

      txtnewqty.SetText(aQty[RowNo]);// = aQty[RowNo];
      txtnewversionno.SetText(aVersionno[RowNo]); // = aVersionno[RowNo];
   // document.all.txtnewqty.value = aQty[RowNo];
   // document.all.txtnewversionno.value = aVersionno[RowNo];
    document.all.txtnewwarstartdate.value = aNewWarStartDate[RowNo];
    document.all.txtnewwarenddate.value = aNewWarEndDate[RowNo];
    document.all.txtnewcomments.value = aComments[RowNo];

    ModifyRowNo = RowNo;



}

function UpdateList()
{
   
    document.getElementById('Add3').disabled = false;
    if (ModifyRowNo < 0) {
        alert('Cannot update the Components Info details');
    }
    else {

        if (window.XMLHttpRequest) {
            // code for all new browsers
            xml = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) {
            // code for IE5 and IE6
            xml = new ActiveXObject("Microsoft.XMLHTTP");
        }

        var sURL = "Webrequest.asmx/checkcomposerialno"
        xml.open("POST", sURL, false);
        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        var str = "serialno=" + txtnewSerialno.GetValue();
        xml.send(str)

        lsval = xml.responseText;


        if (lsval != "") {
            var a = lsval.split("|");
            for (i = 0; i <= a.length - 2; i++) {

                var b = a[i];

                if (b == txtnewSerialno.GetValue()) {

                    alert('Serial No already exists');
                    return false;
                }

            }

        }
      
      
        var Componenttext = cmbComponent.GetText();
        var Serialno = txtnewSerialno.GetText();
        var Qty = txtnewqty.GetText();
        var Versionno = txtnewversionno.GetText();
        var NewWarStartDate = document.getElementById('txtnewwarstartdate').value;
        var NewWarEndDate = document.getElementById('txtnewwarenddate').value;
        var Comments = document.getElementById('txtnewcomments').value;



        var strValidateMessage = "";

        if (Componenttext == "" || Componenttext == "undefined")
        { strValidateMessage = "Enter the Component" }

        if (Serialno == "" || Serialno == "undefined")
        { strValidateMessage = "Enter the Serial no" }

        if (Qty == "" || Qty == "undefined")
        { strValidateMessage = "Enter the Quantity" }

        //if (Versionno == "" || Versionno == "undefined")
        //{ strValidateMessage = "Enter the Version No" }

        if (NewWarStartDate == "" || NewWarStartDate == "undefined")
        { strValidateMessage = "Enter the New Warranty Start Date" }

        if (NewWarEndDate == "" || NewWarEndDate == "undefined")
        { strValidateMessage = "Enter the New Warranty End Date" }

        if (Comments == "" || Comments == "undefined")
        { strValidateMessage = "Enter the Comments" }




        if (strValidateMessage == "") {

          //aComponent[ModifyRowNo] = Componenttext;
            aComponenttext[ModifyRowNo] = Componenttext;
            aSerialno[ModifyRowNo] = Serialno;
            aQty[ModifyRowNo] = Qty;

            aVersionno[ModifyRowNo] = Versionno;
            aNewWarStartDate[ModifyRowNo] = NewWarStartDate;
            aNewWarEndDate[ModifyRowNo] = NewWarEndDate;
            aComments[ModifyRowNo] = Comments;
            ModifyRowNo = 0;

            RebuildcompTable();
            alert("updated successfully")
        }
        else {
            alert("Cannot update the Component in the list " + strValidateMessage)
        }
        document.all.hdncomponents.value = "";
       
        cmbComponent.SetText("");

       
        txtnewSerialno.SetText("");

        txtnewqty.SetText("");
        txtnewversionno.SetText(""); 
     
        document.all.txtnewwarstartdate.value = "";
        document.all.txtnewwarenddate.value = "";
        document.all.txtnewcomments.value = "";

    }




}


function RebuildcompTable() {
    debugger;
    var output = "";
    var header = "";
    var footer = "";
    var footer1 = "";
    var counter = 1;
    var clr;
    clr = "grid_background";

    for (var j = 0; j < RowNewCount; j++) {

        if (aComponent[j] != "") {
            if (clr == "grid_background1")
                clr = "grid_background";
            else
                clr = "grid_background1";


            // alert("1")
            //aComponent[RowNewCount] = document.getElementById('hdncomponents').value;
            //aComponenttext[RowNewCount] = cmbComponent.GetText();
            //aSerialno[RowNewCount] = txtnewSerialno.GetText();
            //aQty[RowNewCount] = txtnewqty.GetText();
            //aVersionno[RowNewCount] = txtnewversionno.GetText();
            //aNewWarStartDate[RowNewCount] = txtnewwarstartdate.GetText();
            //aNewWarEndDate[RowNewCount] = txtnewwarenddate.GetText();
            //aComments[RowNewCount] = document.all.txtnewcomments.value;


            output += "<tr valign='middle' align='center' class=" + clr + " >"
            output += "<td align='center' class=" + clr + ">" + counter + "</td>";
            output += "<td align='left' class=" + clr + ">" + aComponenttext[j] + "</td>";
            output += "<td align='left' class=" + clr + ">" + aSerialno[j] + "</td>";
            output += "<td align='center' class=" + clr + ">" + aQty[j] + "</td>";
            output += "<td align='center' class=" + clr + ">" + aVersionno[j] + "</td>";
            output += "<td align='center' class=" + clr + ">" + aNewWarStartDate[j] + "</td>";
            output += "<td align='center' class=" + clr + ">" + aNewWarEndDate[j] + "</td>";
            output += "<td align='center' class=" + clr + ">" + aComments[j] + "</td>";
            output += "<td align='center' class=" + clr + " ><img src='images/list_editor.gif' style='cursor:pointer;' width='16' height='16' onClick='modifyCompList(" + j + ")' ></td>";
            if (document.all.hdnPage.value == "summary")
                output += "<td align='center' valign='middle' class=" + clr + " ><img src='images/remove_icon.png' style='cursor:pointer;' width='16' height='16' onClick='' ></td>"
            else
                output += "<td align='center' valign='middle' class=" + clr + " ><img src='images/remove_icon.png' style='cursor:pointer;' width='16' height='16' onClick='RemoveFromCompList(" + j + ")' ></td>"

            output += "</tr>";
            counter += 1;
            countdsds = counter;
        }
    }

    header += "<tr style='background-color:#DFF0F7;height:30px'>"
    header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'><span>S.No.</span></th>";
    header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt'><span>Components</span></th>";
    header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt'><span >Serial No</span></th>";
    header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'><span >Qty</span></th>";
    header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'><span >Version No</span></th>";
    header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'><span >Warr Start Date</span></th>";
    header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'><span >Warr End Date</span></th>";
    header += "<th width='20%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'><span >Comments</span></th>";
    header += "<th width='20%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'><span >Modify</span></th>";
    header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'><span >Remove</span></th>";
    header += "</tr>";

    if (output != "") {
        output = "<table width='100%' align='center'  border='0' background='images/pixel_004.gif' cellpadding='1' cellspacing='1' id='DispTable'>" + header + output + footer + "</table>";

    }
    else {
        output = "<table>" + footer1 + "</table>";
        //document.getElementById("footerProductList").style.display = "none";
    }
    if (output != "") {

        //alert(output)
        document.getElementById('componentlist').innerHTML = output;
    }
    else {
        document.getElementById("componentlist").innerHTML = "";
        //document.getElementById("footerProductList").style.display = "none";
    }
    countdsds = counter;

}


function RemoveFromCompList(removeid) {

    debugger;
    aComponent[removeid] = "";
    aSerialno[removeid] = "";
    countdsds = countdsds + 1;

    prodnewTable = prodnewTable - 1;

    RebuildcompTable();

    return false;
}

function ShowAddress() {

    if (document.all.hdnAccCode.value == "") {
        alert("Please select Account");
        gridLookup.Focus();
        return false;
    }


    var rtnvalues;
    var lhlpvalues = new Array();

    if (window.showModalDialog) {
        rtnvalues = window.showModalDialog("SearchInstallAddress.aspx?AccCode=" + document.all.hdnAccCode.value, null, "dialogWidth=700Px;dialogHeight=400Px;status:no;scroll:yes");
        fnSetInstallAddress(rtnvalues);

    }
    else {
        rtnvalues = window.open("SearchInstallAddress.aspx?AccCode=" + document.all.hdnAccCode.value, null, "Width=700,Height=400,scroll=yes;")
        //rtnvalues = window.open("PopupAddComponents.asp?Component=" + cmbComponent.GetValue() + "||" + cmbComponent.GetText() + "&ProdCode=" + document.getElementById("hdnProdCode").value + "&InstallCode=&atmid=" + document.all.txtEquipId.value + "&logid=" + document.all.logid.value, null, "Width=950,Height=380,scroll=no;")
        rtnvalues.moveTo((window.screen.width / 2) - (950 / 2), (window.screen.height / 2) - (510 / 2));
    }


}

function fnSetInstallAddress(rtnvalues) {

    if (String(rtnvalues) != "undefined") {
        lhlpvalues = rtnvalues.split("|");
        document.all.hdnInsAccCode.value = lhlpvalues[1]
        txtInsAddress.SetText(lhlpvalues[2]);
        txtInsCity.SetText(lhlpvalues[3]);
        document.all.cmbState.value = lhlpvalues[4];
        txtInsPinCode.SetText(lhlpvalues[5]);
        txtInsSite.SetText(lhlpvalues[6]);
    }
}


function fnInsAddress(rtnvalues) {

    var lhlpvalues = new Array();

    if (String(rtnvalues) != "undefined") {
        lhlpvalues = rtnvalues.split("|");

        txtInsAddress.SetText(lhlpvalues[2]);
        txtInsCity.SetText(lhlpvalues[3]);
        document.all.cmbState.value = lhlpvalues[4];
        txtInsPinCode.SetText(lhlpvalues[5]);

    }
}


function LostFocusonInsPincode(s, e) {
    GetState_GoogleAPIPincode();
}


//added by thiru for Filling State from Google API
function GetState_GoogleAPIPincode() {

    //if (document.getElementById("txtInsPinCode").value != "" && document.getElementById("txtInsPinCode").value != document.getElementById("hdnInspincode").value) {
    if (txtInsPinCode.GetText() != "" && txtInsPinCode.GetText() != document.getElementById("hdnInspincode").value) {
        //alert('affect1')
        //document.getElementById("txtInsPinCode").value = document.getElementById("txtInsPinCode").value;

        try {
            //var city = document.getElementById("txtInsPinCode").value;

            var city = txtInsPinCode.GetText()

            txtInsCity.SetText("");
            city = city + "+India";
            //  alert('1=' + city)
            var state = "";
            //var country=document.getElementById("cmbCountry").value;
            var country = "";
            //  alert(country)
            var city1 = "";
            var addr = {};
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'address': city }, function (result, status) {
                // alert('2'+ city)
                if (status == google.maps.GeocoderStatus.OK) {
                    // alert('3'+ status)
                    for (var component in result[0]['address_components']) {
                        for (var i in result[0]['address_components'][component]['types']) {
                            if (result[0]['address_components'][component]['types'][i] == "administrative_area_level_1") {
                                // alert(result[0]['address_components'][component]['long_name'])                   
                                state = result[0]['address_components'][component]['long_name'];
                                //  alert(state)
                                lsval = state + "|" + state + "^^^";
                                fnBindDropDown_GoogleAPI("cmbState")
                            }
                            // debugger;
                            if (result[0]['address_components'][component]['types'][i] == "locality" || result[0]['address_components'][component]['types'][i] == "administrative_area_level_2" || result[0]['address_components'][component]['types'][i] == "administrative_area_level_3")
                                // if ( result[0]['address_components'][component]['types'][i] == "locality,political" ||  result[0]['address_components'][component]['types'][i] == "sublocality,political"   || result[0]['address_components'][component]['types'][i] == "neighborhood,political" || result[0]['address_components'][component]['types'][i] =="administrative_area_level_2,political" || result[0]['address_components'][component]['types'][i] =="administrative_area_level_3,political"  ) 
                                // if ( result[0]['address_components'][component]['types'][i] == "administrative_area_level_2,political" || result[0]['address_components'][component]['types'][i] == "administrative_area_level_3,political" ||result[0]['address_components'][component]['types'][i] == "locality,political" )
                                //if ( result[0]['address_components'][component]['types'][i] == "ctl00_ContentPlaceHolder1_txtCity_I") 
                            {

                                city1 = result[0]['address_components'][component]['long_name'];
                                //  alert(city1)
                                if (city1 != "Kutch") {
                                    //document.all.txtInsCity.value = city1;
                                    txtInsCity.SetText(city1);
                                }
                            }

                        }


                    }

                    if (state == "") {
                        fnGetState();
                    }

                }
                else {
                    fnGetState();
                }
            });
        }
        catch (ex) {
            fnGetState();
        }
    }

    else {
        if (txtInsPinCode.GetText() == "") {
            fnGetState();
        }

    }
}




function fnGetState() {
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }
    lsval = "";
    var sURL = "WebRequest.asmx/GetStateName"
    xml.open("POST", sURL, false);
    xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xml.send()
    lsval = xml.responseText;

    fnBindDropDown("cmbState");
    //fnBindDropDown("ddlshipstate");
}





function fnBindDropDown(cmbDropDown) {
    optn = document.createElement("option");
    document.getElementById(cmbDropDown).options.length = 0;
    optn.text = "<-Select->";
    optn.value = "";
    document.getElementById(cmbDropDown).options.add(optn);
    if (lsval != "") {
        arReceived = lsval.split("^^^");
        for (i = 0; i < arReceived.length - 1; i++) {
            arToBind = arReceived[i].split("|");
            optn = document.createElement("option");
            optn.text = arToBind[0];
            optn.value = arToBind[1];
            document.getElementById(cmbDropDown).options.add(optn);

        }
    }
}

function fnBindDropDown_GoogleAPI(cmbDropDown) {
    var optn_GoogleAPI = document.createElement("option");
    //document.getElementById(cmbDropDown).options.length = 0;

    if (lsval != "") {
        var arReceived_GoogleAPI = lsval.split("^^^");
        for (i = 0; i < arReceived_GoogleAPI.length - 1; i++) {
            var arToBind_GoogleAPI = arReceived_GoogleAPI[i].split("|");
            optn_GoogleAPI = document.createElement("option");
            optn_GoogleAPI.text = arToBind_GoogleAPI[0];
            optn_GoogleAPI.value = arToBind_GoogleAPI[1];
            //document.getElementById(cmbDropDown).options.add(optn_GoogleAPI);

            for (var i = 0; i < document.getElementById(cmbDropDown).options.length; i++) {
                if (document.getElementById(cmbDropDown).options[i].text == arToBind_GoogleAPI[1]) {
                    document.getElementById(cmbDropDown).options[i].selected = true; return;
                }
            }

        }
    }
}
function convertDate(inputFormat) {
    function pad(s) { return (s < 10) ? '0' + s : s; }
    var d = new Date(inputFormat);
    return [pad(d.getDate()), pad(d.getMonth() + 1), d.getFullYear()].join('/');
}



function fnCopyDetails() {

    //txtInsAddress.SetText()
    //  alert(txtAddress.GetValue())
    // debugger;
    

    txtInsPinCode.SetText(txtPin.GetValue());
    txtInsCity.SetText(txtCity.GetValue());
    txtInsAddress.SetText(document.getElementById('txtAddress').value)
    txtInsSite.SetText(txtsite.GetValue());

    //   document.all.txtInsCity.vlaue = document.all.txtCity.value;
    //  document.all.txtInsPinCode.vlaue = document.all.txtPin.value;   
    if (txtState.GetValue() != "" && txtState.GetValue() != null)
        document.all.cmbState.value = txtState.GetValue();



}