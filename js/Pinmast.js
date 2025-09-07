var aColumnIdentity = new Array();
var aDescription = new Array();
var aHours = new Array();
var aMinutes = new Array();
var aStartDate = new Array();
var aEndDate = new Array();
var aEngineer = new Array();
var aEngineerName = new Array();
var aCode = new Array();
var HolidayTableHeader = "";
var HolidayTableContent = "";





HolidayTableHeader = " <table border='0' cellpadding='0' cellspacing='1' width='100%'> ";
HolidayTableHeader += " <tr> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt'>SR No</span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt'>Description</span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center' colspan=2> ";
HolidayTableHeader += " <span class='gadget_heading_txt'>Duration</span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt'  >Start Date</span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt' >End Date</span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt' >Engineer</span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt' >Remove</span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += "</tr>";
HolidayTableHeader += " <tr> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt'></span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt'></span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt'>Hours</span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt'>Minutes</span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt'></span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt'></span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt'></span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += " <td class='gadget_top_bg' align='center'> ";
HolidayTableHeader += " <span class='gadget_heading_txt'></span> ";
HolidayTableHeader += " </td> ";
HolidayTableHeader += "</tr>";

var bgColor = "";

var HolidayCount = 0;

function fnAddListofHolidays() {

    if (document.all.txtDescription.value == "") {
        alert("Description Can't be empty");

        return false;
    }

    if (document.all.txtDescription.value.length > 4000) {
        alert("Description size exceeded");

        return false;
    }

    if (document.all.DropDownHrs.value == "0") {
        if (document.all.DropDownMin.value == "00") {
            alert("Hours Can't be empty");
            return false;
        }
    }

    //if (document.all.txtHours.value == "00") {
    //    if (document.all.txtMinutes.value == "00") {
    //        alert("Hours Can't be empty");
    //        return false;
    //    }
    //}
    if (document.all.txtStartDate.value == "") {
        alert("Start Date Can't be empty");
        return false;
    }
    //if (document.all.txtEndDate.value == "") {
    //    alert("End Date Can't be empty");
    //    return false;
    //}
    //if (!rtndateonly1(document.all.txtStartDate, "StartDate")) {
    //    return false;
    //}
    //if (!rtndateonly1(document.all.txtEndDate, "EndDate")) {
    //    return false;
    //}
    var start = document.all.txtStartDate.value;
    var end = document.all.txtStartDate.value;


    //var Difference = checkdatetimevalue(start, end);

    //if (Difference == 1) {
    //    alert("End Date Can't be Lesser than Start Date");
    //    return false;
    //}
    if (document.all.ddlEngineer.value == "") {
        alert("Engineer Can't be empty");
        return false;
    }

    aColumnIdentity[HolidayCount] = "";
    aDescription[HolidayCount] = document.all.txtDescription.value;
    aHours[HolidayCount] = document.all.DropDownHrs.options[document.all.DropDownHrs.selectedIndex].text
    //document.all.txtHours.value;
    aMinutes[HolidayCount] = document.all.DropDownMin.options[document.all.DropDownMin.selectedIndex].text
    //document.all.txtMinutes.value;
    aStartDate[HolidayCount] = document.all.txtStartDate.value;
    aEndDate[HolidayCount] = document.all.txtStartDate.value;
    aEngineer[HolidayCount] = document.all.ddlEngineer.value;
    aEngineerName[HolidayCount] = document.all.ddlEngineer.options[document.all.ddlEngineer.selectedIndex].text

    HolidayCount++;
    document.all.txtDescription.value = "";
    document.all.DropDownHrs.selectedIndex = 0;
    document.all.DropDownMin.selectedIndex = 0;
    //            document.all.txtStartDate.value="";
    //            document.all.txtEndDate.value="";
    //defaultDate()
    document.all.ddlEngineer.selectedIndex = 0

    fnHolidayRebuildTable();
    return false;
}

function fnHolidayRemove(iIndex) {
    aDescription[iIndex] = "";
    aHours[iIndex] = "";
    aMinutes[iIndex] = "";
    aStartDate[iIndex] = "";
    aEndDate[iIndex] = "";
    aEngineer[iIndex] = "";
    aEngineerName[iIndex] = "";
    aCode[iIndex] = "";
    fnHolidayRebuildTable();
}

var RowCount = 0;
function fnHolidayRebuildTable() {
    rtnValue = "";
    var SrNo = 1;
    bgColor = "grid_background";

    HolidayTableContent = "";
    RowCount = 0;

    for (i = 0; i < HolidayCount; i++) {
        if ((aDescription[i] != "" && aDescription[i] != "undefined") || (aColumnIdentity[i] != "" && aColumnIdentity[i] != "undefined") || (aCode[i] != "" && aCode[i] != "undefined")) {
            if (rtnValue.length > 1) {
                rtnValue += "#" + aColumnIdentity[i] + "~" + aDescription[i] + "~" + aHours[i] + "~" + aMinutes[i] + "~" + aStartDate[i] + "~" + aEndDate[i] + "~" + aEngineer[i] + "~" + aCode[i];
            }
            else {
                rtnValue = aColumnIdentity[i] + "~" + aDescription[i] + "~" + aHours[i] + "~" + aMinutes[i] + "~" + aStartDate[i] + "~" + aEndDate[i] + "~" + aEngineer[i] + "~" + aCode[i];
            }
        }
        if (aDescription[i] != "" && aDescription[i] != "undefined" && aHours[i] != "" && aHours[i] != "undefined" && aMinutes[i] != "" && aMinutes[i] != "undefined" && aStartDate[i] != "" && aStartDate[i] != "undefined" && aEndDate[i] != "" && aEndDate[i] != "undefined" && aEngineer[i] != "" && aEngineer[i] != "undefined") {
            RowCount = RowCount + 1;

            if (bgColor == "grid_background1") {
                bgColor = "grid_background'";
            }
            else {
                bgColor = "grid_background1";
            }

            HolidayTableContent += "<tr class=' + bgColor + '>";
            HolidayTableContent += "<td align='center'  >" + SrNo + "</td>";
            HolidayTableContent += "<td align='center' >" + aDescription[i] + "</td>";
            HolidayTableContent += "<td align='center'  >" + aHours[i] + "</td>";
            HolidayTableContent += "<td align='center'  >" + aMinutes[i] + "</td>";
            HolidayTableContent += "<td align='center'  >" + aStartDate[i] + "</td>";
            HolidayTableContent += "<td align='center'   >" + aEndDate[i] + "</td>";
            HolidayTableContent += "<td align='center'   >" + aEngineerName[i] + "</td>";
            HolidayTableContent += "<td align='center'   >";
            HolidayTableContent += "<input type='button' class='login_button' value='Remove'  onclick='fnHolidayRemove(" + i + ")' id='btnRemove" + i + "' name='btnRemove  height='22'px width='72px'" + i + "' />";
            HolidayTableContent += "</td>";
            HolidayTableContent += "</tr>";
            SrNo++;


        }
    }
    document.all.hdnTaskLists.value = rtnValue;
    document.getElementById("spnAddListofHolidays").innerHTML = HolidayTableHeader + HolidayTableContent + "</table>";

}


function fnFormValid() {



    if (document.all.ddlCustomerName.value == "") {
        alert("Customer Name Can't be empty");
        return false;
    }
    if (document.all.txtPinNo.value == "") {
        alert("Pin Number Can't be empty");
        return false;
    }
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");

    }

    var sURL = "WebRequest.asmx/GetPin_Duplication"
    xml.open("POST", sURL, false);
    xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var str = "custName=" + document.getElementById("ddlCustomerName").value + "&pinNo=" + document.getElementById("txtPinNo").value + "&pinCode=" + document.getElementById("hdnPinCode").value;
    xml.send(str)
    lsval = xml.responseText;
    if (lsval == "Pin Exists") {
        alert("Pin Number already exists for this customer.");
        return false;
    }

    if (document.all.ddlTeamLeader.value == "None") {
        alert("Team Leader Can't be empty");
        return false;
    }
    if (document.all.ddlStatus.value == "None") {
        alert("Status Can't be empty");
        return false;
    }
    if (!rtndateonly1(document.all.txtrdate, "Release Date")) {
        return false;
    }
    if (document.all.ddlStatus.value == "Close") {
        if (document.all.txtrdate.value == "") {
            alert("Release Date Can't be empty");
            return false;
        }
    }
    if (document.all.txtPinDescription.value == "") {
        alert("Pin Description Can't be empty");
        return false;
    }
    //debugger;
    if (document.all.hdnTaskLists.value == "") {
        alert("Add Task List...");
        return false;
    }
}

function fnBindInitialValues() {
    var flag = "";
    var rtnvalues;
    var lhlpvalues = new Array();
    var TempATM = "";
    HolidayCount = 0;
    rtnvalues = document.all.hdnTaskLists.value;

    if (rtnvalues != "") {
        lhlpvalues1 = rtnvalues.split("^^^");
        for (i = 0; i < lhlpvalues1.length; i++) {
            TempVal = lhlpvalues1[i].split("|");
            aColumnIdentity[HolidayCount] = "";
            aDescription[HolidayCount] = TempVal[0];
            aHours[HolidayCount] = TempVal[1];
            aMinutes[HolidayCount] = TempVal[2];
            aStartDate[HolidayCount] = TempVal[3];
            aEndDate[HolidayCount] = TempVal[4];
            aEngineer[HolidayCount] = TempVal[5];
            aEngineerName[HolidayCount] = TempVal[6];
            aCode[HolidayCount] = TempVal[7];
            HolidayCount++;
        }
    }
    fnHolidayRebuildTable();
    defaultvalues();
}



