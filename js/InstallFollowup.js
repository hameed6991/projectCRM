function TextBoxKeyDown(s, e) {
    if (!((e.htmlEvent.keyCode >= 48 && e.htmlEvent.keyCode <= 57) || (e.htmlEvent.keyCode == 8 || e.htmlEvent.keyCode == 46 || e.htmlEvent.keyCode == 37 || e.htmlEvent.keyCode == 39)))
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
}

var prodTable = 0;

var RowCount = 0;

aWarType = new Array(100);
aMonth = new Array(300);
aNoofVisit = new Array(100);
aWarStartDate = new Array(100);
aWarEndDate = new Array(100);


var ContRowCount = 0;



aCompCode = new Array(100);
aPartNo = new Array(100);
aPartDesc = new Array(300);
aQty = new Array(100);
aComments = new Array(400);

var SparesRowCount = 0;

//Questionnaire
aQuestCode = new Array(30);
aQuestion = new Array(100);
aQuestAnsType = new Array(50);
aQuestDef = new Array(10);
aQuestManAns = new Array(30);

var QuestRowCount = 0;
var QuestStarAnswerCount = 0;

var QuestionValue = new Array();


function AddToList() {
    //Modified
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

    if (cmbType.GetSelectedItem().value == null || cmbType.GetSelectedItem().value == "") {
        alert("Please select the Type");
        cmbType.Focus();
        return false;
    }
    else {
        document.all.hdnWarantyType.value = cmbType.GetSelectedItem().value;
       
    }


    // Month = txtMonth.GetText();
    // Noofvisit = txtNoofvisit.GetText();

    //Commented by koripriyan on August 13 2018

    Month = document.all.txtMonth.value; 
    //Commented and Modified by koripriyan on August 14 2018

    if (Month == "0" || Month == "" || Month == null) {
        alert("Please Enter the Month");
        // document.all.txtMonth.Focus();
        return false;
    }
    
    //if (txtMonth.GetSelectedItem().value == null || txtMonth.GetSelectedItem().value == "") {

    //if (txtMonth.GetValue() == null || txtMonth.GetValue() == "") {

    //    alert("Please Select the Month");
    //    // document.all.txtMonth.Focus();
    //    txtMonth.Focus();
    //    return false;
    //}

    //else
    //{
    //    document.all.hdnMonth.value = txtMonth.GetSelectedItem().value;
    //}

    //

    //Noofvisit == "0" || 

    Noofvisit = document.all.txtNoofvisit.value;

    if (Noofvisit == "" || Noofvisit == null) {
        alert("Please Enter the No of Visit");
        // document.all.txtNoofvisit.Focus();
        return false;
    }

    else
    {
        document.all.hdnMonth.value = document.all.txtMonth.value;
    }


    for (var i = 0; i < RowCount; i++) {
        if (aWarType[i] != '' && aWarType[i] == document.getElementById('hdnWarantyType').value) {
            alert('Warranty added already!')
            return false;
        }
    }


    //document.all.hdnProdAmount.value = document.all.hdnProdRate.value * document.all.txtQty.value;


    aWarType[RowCount] = document.getElementById('hdnWarantyType').value;

    //Commented and Modified by koripriyan on August 14 2018
    aMonth[RowCount] = Month;
    //aMonth[RowCount] =  document.getElementById("hdnMonth").value;         //txtMonth.GetText();
    //

    aNoofVisit[RowCount] = Noofvisit;
    //aRate[RowCount] = document.getElementById('hdnProdRate').value;
    //aAmount[RowCount] = document.getElementById('hdnProdAmount').value;

    aWarStartDate[RowCount] = document.all.txtWarrStartDt.value;
    aWarEndDate[RowCount] = document.all.txtWarrEndDt.value;
    
    
    WarantyAdd(RowCount);

    RowCount = RowCount + 1;

    prodTable = prodTable + 1;

    //document.all.txtorderValue.value = "0";
    //for (var i = 0; i < RowCount; i++)
    //{
    //    document.all.txtorderValue.value = +document.all.txtorderValue.value + +aAmount[i];
    //} 
    RebuildTable();
    //document.getElementById('hdnProddesc').value = '';
    document.getElementById('hdnWarantyType').value = '';
    document.getElementById("hdnMonth").value = ''

    //txtMonth.SetText('');
    //document.all.txtMonth.value = "";
    document.all.txtNoofvisit.value = "";

    txtMonth.SetValue('');
    txtMonth.SetText('<-Select->');

    //txtNoofvisit.SetText('');
    cmbType.SetValue('');
    cmbType.SetText('<-Select->');
    //document.getElementById('hdnProdAmount').value = '';
    //ProductComboBox.SetValue('');
    //ProductComboBox.SetText('');

    return true;
}
function RemoveFromList(removeid) {
    aMonth[removeid] = "";
    aWarType[removeid] = "";
    aWarStartDate[removeid] = "";
    aWarEndDate[removeid] = "";
    countdsds = countdsds + 1;

    prodTable = prodTable - 1;
    //document.all.txtorderValue.value = "";
    //for (var i = 0; i < RowCount; i++)
    //{
    //    if (aProdCode[i] != "")
    //        //document.all.hdnTotalProdAmount.value = +document.all.hdnTotalProdAmount.value - -aAmount[i];
    //        document.all.txtorderValue.value = +document.all.txtorderValue.value - -aAmount[i];
    //}

    RebuildValue(); //RebuildTable() called inside RebuildValue
    return false;
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
        if (aWarType[j] != "") {
            if (clr == "grid_background1")
                clr = "grid_background";
            else
                clr = "grid_background1";
            output += "<tr valign='middle' style='height:30px'  align='center' class=" + clr + " >"
            output += "<td align='center' class=" + clr + ">" + counter + "</td>";
            output += "<td align='left' class=" + clr + ">" + aWarType[j] + "</td>";
            output += "<td align='center' class=" + clr + ">" + aMonth[j] + "</td>";
            output += "<td align='center' class=" + clr + ">" + aNoofVisit[j] + "</td>";
            //output += "<td style='display: none' width='50px' align='center' class=" + clr + ">" + aWarType[j] + "</td>";



            //output += "<td align='center'  class=" + clr + "><input style='margin: 0px 1px 0px 3px;width:62px;text-align:right' type='number' class='inputstyle' id='prodRateValue" + j + "' name='orderValue' onkeypress='return isNumber(event)' onchange='RateFocusOut(" + j + ")' value='" + aRate[j] + "'/></td>";           
            //output += "<td align='center'  class=" + clr + ">" + aAmount[j] + "</td>";

            output += "<td width='10%' align='center' valign='middle' class=" + clr + " ><img src='images/remove_icon.png' style='cursor:pointer;' width='16' height='16' onClick='RemoveFromList(" + j + ")' ></td>"

            output += "</tr>";
            counter += 1;
            countdsds = counter;
        }
    }
    header += "<tr style='background-color:#DFF0F7;height:30px'>"
    header += "<th width='10%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>S.No.</th>";
    header += "<th width='21%' align='center' valign='middle' class='gadget_heading_txt'>Type</span></th>";
    header += "<th width='21%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>Month</th>";
    header += "<th width='21%' align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>No of Visit</th>";
    //header += "<th width='5%' align='center' valign='middle' class='grid_heading_bg'><span class='grid_heading_txt'>Rate</span></th>";
    //header += "<th width='11%' align='center' valign='middle' class='grid_heading_bg'><span class='grid_heading_txt'>Amount</span></th>";
    header += "<th width='21%'  align='center' valign='middle' class='gadget_heading_txt' style='text-align:center;'>Remove</th>";
    header += "</tr>";

    if (output != "") {
        output = "<table width='70%' align='center'  border='0' class='TD_border' cellpadding='0' cellspacing='1' id='DispTable'>" + header + output + footer + "</table>";
        //document.getElementById("footerProductList").style.display = "";
    }
    else {
        output = "<table>" + footer1 + "</table>";
        //document.getElementById("footerProductList").style.display = "none";
    }

    //alert(output) 
    
    if (output != "" && output != "<table></table>") {
        document.getElementById('WarrantyList').innerHTML = output;
    }
    else {
        document.getElementById("WarrantyList").innerHTML = "";
        //alert();
        //txtWarrStartDt.SetValue(null);
        //document.getElementById("footerProductList").style.display = "none";
    }
    countdsds = counter;
}

function fnPopAttachment(traveltype) {
    var retval;

    fnOpenWindowOpp("Attachments.aspx?EnqNo=" + document.getElementById("hdnInstallCode").value + "&logid=" + document.getElementById("logid").value + "&TravelType=" + traveltype + "&From=InstallClosure", "300", "500");


}

function OnInit(s, e) {
    var date = new Date();
    date.setHours(00);
    date.setMinutes(00);

    s.SetDate(date);
}


function ShowParts() {

    var rtnvalues;
    var lhlpvalues = new Array();

    if (window.showModalDialog) {
        rtnvalues = window.showModalDialog("SearchParts.aspx?PartNo=" + document.all.txtSparesPartNo.value, null, "dialogWidth=700Px;dialogHeight=400Px;status:no;scroll:yes");
        fnSetPartNoAndDesc(rtnvalues);

    }
    else {
        rtnvalues = window.open("SearchParts.aspx?PartNo=" + document.all.txtSparesPartNo.value, null, "Width=700,Height=400,scroll=yes;")
        //rtnvalues = window.open("PopupAddComponents.asp?Component=" + cmbComponent.GetValue() + "||" + cmbComponent.GetText() + "&ProdCode=" + document.getElementById("hdnProdCode").value + "&InstallCode=&atmid=" + document.all.txtEquipId.value + "&logid=" + document.all.logid.value, null, "Width=950,Height=380,scroll=no;")
        rtnvalues.moveTo((window.screen.width / 2) - (950 / 2), (window.screen.height / 2) - (510 / 2));
    }


}

function fnSetPartNoAndDesc(rtnvalues) {
    if (String(rtnvalues) != "undefined") {
        lhlpvalues = rtnvalues.split("|");

        document.all.hdnCompcode.value = lhlpvalues[0];
        document.all.hdnPartNo.value = lhlpvalues[1];
        document.all.txtSparesPartNo.value = lhlpvalues[1];
        document.all.txtSparesPartDesc.value = lhlpvalues[2];
        document.all.txtSparesQuantity.focus();
    }
}


function fnSearchParts(rtnvalues) {

    var lhlpvalues = new Array();

    if (String(rtnvalues) != "undefined") {
        lhlpvalues = rtnvalues.split("|");

        document.all.hdnCompcode.value = lhlpvalues[0];
        document.all.hdnPartNo.value = lhlpvalues[1];
        document.all.txtSparesPartNo.value = lhlpvalues[1];
        document.all.txtSparesPartDesc.value = lhlpvalues[2];
        document.all.txtSparesQuantity.focus();
    }
}

function AddSparesUsedToList() {

    if (document.all.txtSparesPartNo.value == "") {
        alert("Spares Used - Part Number cannot be empty")
        document.all.txtSparesPartNo.focus();
        return false;
    }

    if (document.all.txtSparesPartDesc.value == "") {
        alert("Spares Used - Part Description cannot be empty")
        document.all.txtSparesPartDesc.focus();
        return false;
    }


    if (document.all.txtSparesQuantity.value == "") {
        alert("Spares Used - Quantity Cannot be Empty")
        document.all.txtSparesQuantity.focus();
        return false;
    }
    else {
        if (document.all.txtSparesQuantity.value <= 0) {
            alert("Spares Used - Quantity Cannot be 0")
            document.all.txtSparesQuantity.focus();
            return false;
        }
    }


    for (var i = 0; i < SparesRowCount; i++) {
        if (aCompCode[i] != '' && aCompCode[i] == document.getElementById('hdnCompcode').value) {
            alert('Part added already!')
            return false;
        }
    }


    aCompCode[SparesRowCount] = document.getElementById('hdnCompcode').value;
    aPartNo[SparesRowCount] = document.getElementById('txtSparesPartNo').value;//hdnPartNo
    aPartDesc[SparesRowCount] = document.getElementById('txtSparesPartDesc').value;
    aQty[SparesRowCount] = document.getElementById('txtSparesQuantity').value;
    aComments[SparesRowCount] = document.getElementById('txtSparesComments').value;
    SparesRowCount = SparesRowCount + 1;


    RebuildSparesUsedTable();

    document.getElementById('hdnCompcode').value = '';
    document.getElementById('hdnPartNo').value = '';
    document.getElementById('txtSparesPartNo').value = "";
    document.getElementById('txtSparesPartDesc').value = '';
    document.getElementById('txtSparesQuantity').value = '';
    document.getElementById('txtSparesComments').value = '';
    //gridLookup.SetValue('');
    //gridLookup.SetText('');

    return true;


}


function RemoveSparesUsedFromList(removeid) {

    aCompCode[removeid] = "";
    aPartNo[removeid] = "";
    aPartDesc[removeid] = "";
    aQty[removeid] = "";
    aComments[removeid] = "";

    countdsds = countdsds + 1;

    //prodTable = prodTable - 1;

    RebuildSparesUsedTable();
    return false;
}

function RebuildSparesUsedTable() {

    var output = "";
    var header = "";
    var footer = "";
    var footer1 = "";
    var counter = 1;
    var clr;

    clr = "grid_background";


    for (var j = 0; j < SparesRowCount; j++) {

        if (aPartDesc[j] != "") {

            if (clr == "grid_background1")
                clr = "grid_background";
            else
                clr = "grid_background1";


            output += "<tr valign='middle' style='height:30px' align='left' class=" + clr + " >"
            output += "<td align='center' class=" + clr + ">" + counter + "</td>";
            output += "<td width='12%' align='left' class=" + clr + ">" + aPartNo[j] + "</td>";
            //                width='350px'
            output += "<td width='30%' align='left' style='word-wrap: break-word;' class=" + clr + ">" + aPartDesc[j] + "</td>";
            //                width='50px'
            output += "<td width='10%' align='center' class=" + clr + ">" + aQty[j] + "</td>";

            //output += "<td align='center'  class=" + clr + "><input style='margin: 0px 1px 0px 3px;width:62px;text-align:right' type='number' class='inputstyle' id='prodRateValue" + j + "' name='orderValue' onkeypress='return isNumber(event)' maxlength='7' onchange='RateFocusOut(" + j + ")' value='" + aRate[j] + "'/></td>";

            output += "<td width='30%' align='left' style='word-wrap: break-word;' class=" + clr + ">" + aComments[j] + "</td>";

            output += "<td width='10%' align='center' valign='middle' class=" + clr + " ><img src='images/remove_icon.png' style='cursor:pointer;' width='16' height='16' onClick='RemoveSparesUsedFromList(" + j + ")' ></td>"


            output += "</tr>";
            counter += 1;
            countdsds = counter;
        }
    }

    header += "<tr style='background-color:#DFF0F7;height:30px;'>"
    header += "<th width='8%' align='center' valign='middle' style='text-align:center'  class='gadget_heading_txt'>S.No.</th>";
    header += "<th width='12%' align='left' valign='middle' class='gadget_heading_txt'>Part No</th>";
    header += "<th width='30%' align='center' valign='middle'  class='gadget_heading_txt'>Part Description</th>";
    header += "<th width='10%' align='center' valign='middle' style='text-align:center' class='gadget_heading_txt'>Quantity</th>";
    header += "<th width='30%' align='center' valign='middle'  class='gadget_heading_txt'>Comments</th>";
    header += "<th width='10%' align='center' valign='middle' style='text-align:center' class='gadget_heading_txt'>Remove</th>";
    header += "</tr>";


    if (output != "") {
        output = "<table width='98%'  border='0' cellpadding='0' class='TD_border' cellspacing='1' id='DispTable'>" + header + output + footer + "</table>";
    }
    else {
        output = "<table>" + footer1 + "</table>";
    }
    //output = "<table width='98%'  border='0' cellpadding='0' class='TD_border' cellspacing='1' id='DispTable'>" + header + output + footer + "</table>";

    //alert(output)

    if (output != "") {
        document.getElementById("PartsList").innerHTML = output;
    }
    else {
        document.getElementById("PartsList").innerHTML = "";
    }

    countdsds = counter;

}

//Questionnaire



function BindQuest() {


    var Question = document.getElementById("hdnQuestions").value;


    var Questdata = new Array();

    if (Question != "") {
        Questdata = Question.split("#");


        for (QuestRowCount = 0; QuestRowCount < Questdata.length; QuestRowCount++) {
            QuestionValue = Questdata[QuestRowCount].split(",");


            if (QuestionValue != "") {
                aQuestCode[QuestRowCount] = QuestionValue[0];
                aQuestion[QuestRowCount] = QuestionValue[1];
                if (QuestionValue[2] == "StarRating")
                    aQuestAnsType[QuestRowCount] = QuestionValue[2] + QuestRowCount;
                else
                    aQuestAnsType[QuestRowCount] = QuestionValue[2];
                aQuestDef[QuestRowCount] = QuestionValue[3];
                aQuestManAns[QuestRowCount] = QuestionValue[4];
            }
        }

        BuildQuestionnaire();
    }
}


function StarClickedRow(val) {
    document.getElementById("hdnClickedRow").value = val;
}

function BuildQuestionnaire() {


    var Questoutput = "";
    var Questheader = "";
    var Questfooter = "";
    var Questcounter = 1;
    var Questclr;

    Questclr = "grid_background";


    Questheader += "<tr style='background-color:#DFF0F7;height:30px'><td width='10%' class='gadget_heading_txt' style='text-align:center;'>S.No.</td> ";
    Questheader += "<td style='display:none'>&nbsp;</td>";
    Questheader += "<td width='60%' class='gadget_heading_txt'>Question</td>";
    Questheader += "<td width='30%' class='gadget_heading_txt' style='FONT-WEIGHT: bold; FONT-SIZE: 11px; FONT-FAMILY: Tahoma; TEXT-DECORATION: none; text-indent:5px;'>Answer</td>";
    Questheader += "<td style='display:none'>&nbsp;</td>";
    Questheader += "<td style='display:none'>&nbsp;</td></tr>";


    for (var j = 0; j < QuestRowCount - 1; j++) {

        if (aQuestCode[j] != "") {

            if (Questclr == "grid_background1")
                Questclr = "grid_background";
            else
                Questclr = "grid_background1";


            Questoutput += "<tr valign='middle' align='left' style='height:30px' class=" + Questclr + " >"
            Questoutput += "<td width='10%' align='center' class=" + Questclr + ">" + Questcounter + "</td>";
            Questoutput += "<td style='display:none' align='left' class=" + Questclr + ">" + aQuestCode[j] + "</td>";
            Questoutput += "<td width='60%' class=" + Questclr + ">" + aQuestion[j] + "</td>";

            Questoutput += "<td width='30%' class=" + Questclr + ">";

            //Questoutput += "<select id='AnsType" + Questcounter + "' class='inputstyle'>";
            if (aQuestAnsType[j] == "Good/Average/Poor/NA") {
                Questoutput += "<select id='AnsType" + Questcounter + "' class='inputstyle'>";
                Questoutput += "<option value=''><-Select-></option>";
                Questoutput += "<option value='Good'>Good</option>";
                Questoutput += "<option value='Average'>Average</option>";
                Questoutput += "<option value='Poor'>Poor</option>";
                Questoutput += "<option value='NA'>NA</option>";
                Questoutput += "</select>";
            }
            else if (aQuestAnsType[j] == "Yes/No/NA") {
                Questoutput += "<select id='AnsType" + Questcounter + "' class='inputstyle'>";
                Questoutput += "<option value=''><-Select-></option>";
                Questoutput += "<option value='Yes'>Yes</option>";
                Questoutput += "<option value='No'>No</option>";
                Questoutput += "<option value='NA'>NA</option>";
                Questoutput += "</select>";
            }
            else if (aQuestAnsType[j] == "StarRating" + (j)) {
                Questoutput += "<span onclick='StarClickedRow(" + Questcounter + ");' class='starrr star" + Questcounter + "'></span>";
                Questoutput += "<input type='text' name='star_input' style='display:none' value='0' id='star_input" + Questcounter + "' /> ";
                //Questoutput += "<span class='starrr star'></span>";

                QuestStarAnswerCount += 1;

            }

            //Questoutput += "</select>";

            Questoutput += "</td>";
            Questoutput += "<td style='display:none' align='center'  class=" + Questclr + ">" + aQuestDef[j] + "</td>";
            Questoutput += "<td  style='display:none' align='center'  class=" + Questclr + ">" + aQuestManAns[j] + "</td>";



            Questoutput += "</tr>";
            Questcounter += 1;
            //countdsds = counter;




        }
    }



    if (Questoutput != "") {
        Questoutput = "<table width='98%' style='margin:3px' border=0 cellspacing=1 cellpadding=1>" + Questheader + Questoutput + "</table>";
    }
    else
        Questoutput = "<table> </table>";


    document.getElementById("QuestionnaireList").innerHTML = Questoutput;


    //To set default selected values. Looping done here because dropdown id's can be accessed only after tags are binded to innerHTML.
    for (var j = 1; j <= QuestRowCount - 1; j++) {



        if (aQuestDef[j - 1] == "Good")
            document.getElementById("AnsType" + j).value = "Good";
        else if (aQuestDef[j - 1] == "Average")
            document.getElementById("AnsType" + j).value = "Average";
        else if (aQuestDef[j - 1] == "Poor")
            document.getElementById("AnsType" + j).value = "Poor";
        else if (aQuestDef[j - 1] == "Yes")
            document.getElementById("AnsType" + j).value = "Yes";
        else if (aQuestDef[j - 1] == "No")
            document.getElementById("AnsType" + j).value = "No";
        else if (aQuestDef[j - 1] == "NA")
            document.getElementById("AnsType" + j).value = "NA";


        $('.star' + j).starrr({
            change: function (e, value) {
                var IsRatingChanged = false;

                for (var k = 1; k <= QuestRowCount - 1; k++) {
                    if (document.getElementById("hdnClickedRow").value == k)
                        if (aQuestAnsType[k - 1] == "StarRating" + (k - 1) && IsRatingChanged == false) {
                            //&& document.getElementById("star_input" + k).value == "0"
                            if (value) {
                                IsRatingChanged = true;

                                $('#star_input' + k).val(value).trigger('input');
                                //alert(document.getElementById("star_input" + k).value);
                            }
                        }
                }
            }
        });

    }

}
function chkattachment()
{
    if (window.XMLHttpRequest) {        
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (document.all.hdnInstallCode.value != "") {
        var sURL = "WebRequest.asmx/chkattachment"
        xml.open("POST", sURL, false);
        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var str = "Pincode=" + document.all.hdnInstallCode.value;
        xml.send(str)
        var lsval = xml.responseText;       
    }
}
function validformFollowup()
{
    debugger;
    if (document.all.hdnFrom.value == "Closure")
    {
        
        //installation closure attachment mandatory
        if (window.XMLHttpRequest) {
            xml = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) {

            xml = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (document.all.hdnInstallCode.value != "") {
            var sURL = "WebRequest.asmx/chkattachment"
            xml.open("POST", sURL, false);
            xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var str = "Installcode=" + document.all.hdnInstallCode.value;
            xml.send(str)
            var lsval = xml.responseText;
            lseng = lsval.split("|");
           var Attch = lseng[0];
           var Comp = lseng[1];          
           if (Attch == "0") {
               alert("Please Attach the file");
               return false;
           }
           if (Comp == "0") {
               alert("Please add components");
               return false;
           }

        }
    }
    
    //alert("test");
    //var lblserialname = document.getElementById('lblserialno').innerText;
    //alert(lblserialname);
   
    var date;
    var frmv;
    var RepairTimeHrs = "", RepairTimeMins = "";
    

    //current date   
    var today = new Date();
    // alert(document.all.hdndate.value)
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!

    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    var today = dd + '/' + mm + '/' + yyyy;


    if (document.all.txtPoNo.value == "" || document.all.txtPoNo.value == null)
    {
       
        alert("Please enter PO No");
        //txtRefNo.Focus();
        return false;
    }

    //date = txtPoDate.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('PO Date Can\'t be Empty');
    //    txtPoDate.Focus();
    //    return false;
    //}
     
    if (document.all.txtPoDate.value == "") {
        
        alert("PO Date Can\'t be Empty")
        //  document.all.txtInstallDate.focus();

        return false;
    }

    frmv = rtndateonly1(document.all.txtPoDate, "PO Date");
    if (frmv == false) {
        // document.all.txtInstallDate.value = "";
        return false;
    }

    /*
    if ((document.all.txtDispatchRefNo.value == "" || document.all.txtDispatchRefNo.value == null) && document.all.hdnFrom.value == "Closure")
    {
        alert("Please enter Dispatch Ref No");
        document.all.txtDispatchRefNo.focus();
        return false;
    }
    */
    if (document.all.hdnFrom.value == "Closure") {
        
        if (document.all.hdnvalidatereportno.value == "validatereportno" && document.all.txtDispatchRefNo.value == "") {
            alert(document.all.lbldisprefno.innerText + " cannot be empty");
            document.all.txtDispatchRefNo.focus();
            return false;
        }
    }
    if (document.all.txtInvoiceNo.value == "" || document.all.txtInvoiceNo.value == null) 
    {
        alert("Please enter Invoice No");
        //txtRefNo.Focus();
        return false;
    }

    //date = txtInvoiceDate.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('Invoice Date Can\'t be Empty');
    //    txtInvoiceDate.Focus();
    //    return false;
    //}
    if (document.all.txtInvoiceDate.value == "") {
        alert("Invoice Date Can\'t be Empty")
        //  document.all.txtInstallDate.focus();

        return false;
    }

    frmv = rtndateonly1(document.all.txtInvoiceDate, "Invoice Date");
    if (frmv == false) {
        // document.all.txtInstallDate.value = "";
        return false;
    }
    
  // if (document.all.hdnflag.value != "True") {
    if ((document.all.txtSerialNo.value == "" || document.all.txtSerialNo.value == null) && document.all.hdnFrom.value == "Closure") {
        var lblserialname = document.getElementById('lblserialno').innerText;
                
            alert("Please enter "+lblserialname+"");
        
            document.all.txtSerialNo.focus();
            return false;
        }
   // }

   

    if (cmbActivityType.GetValue() == "" || cmbActivityType.GetValue() == null) {
        alert("Please select Activity Type");
        cmbActivityType.Focus();
        return false;
    }


    //date = txtActivityDate.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('Activity Date Can\'t be Empty');
    //    document.all.txtActivityDate.focus();
    //    return false;
    //}

    if (document.all.txtActivityDate.value == "") {
        alert("Please select  Activity Date")
        document.all.txtActivityDate.focus();
        return false;
    }

    frmv = rtndateonly1(document.all.txtActivityDate, "Next Activity Date");
    if (frmv == false) {
        return false;
    }



    //if ((cmbHrs.GetValue() == "" || cmbHrs.GetValue() == null || cmbHrs.GetValue() == "00") || (cmbHrs.GetValue() == "" || cmbHrs.GetValue() == null || cmbHrs.GetValue() == "00")) {
    //    alert("Please select Effort");
    //    cmbHrs.Focus();
    //    return false;
    //}

    // alert(cmbHrs.GetValue());
    // alert(cmbMins.GetValue());
    //if ((cmbHrs.GetValue() == "" || cmbHrs.GetValue() == null || cmbHrs.GetValue() == "00") && (cmbMins.GetValue() == "" || cmbMins.GetValue() == null || cmbMins.GetValue() == "00")) {
    //    alert("Please select Effort");
    //    cmbHrs.Focus();
    //    return false;
    //}
   // alert(document.all.hdnFrom.value)
    if (document.all.hdnFrom.value == "Closure") {
        if (document.getElementById("WarrantyList").innerHTML == "<table></table>" || document.getElementById("WarrantyList").innerHTML == "") {
            alert("Warranty Info Details cannot be empty");
            return false;
        } 
    }
   

    if (HoursSpentEdit.GetValue().getHours() == "0")
        RepairTimeHrs = '0' + HoursSpentEdit.GetValue().getHours();
    else
        RepairTimeHrs = HoursSpentEdit.GetValue().getHours();

    if (HoursSpentEdit.GetValue().getMinutes() == "0")
        RepairTimeMins = '0' + HoursSpentEdit.GetValue().getMinutes();
    else
        RepairTimeMins = HoursSpentEdit.GetValue().getMinutes();

    if (HoursSpentEdit.GetValue().getHours() == "0" && HoursSpentEdit.GetValue().getMinutes() == "0") {
        alert("Please select Hours Spent");
        HoursSpentEdit.Focus();
        return false;
    }
    document.all.hdnHrsMins.value = RepairTimeHrs + ':' + RepairTimeMins;
    document.all.hdnEffortinMins.value = (RepairTimeHrs * 60) + +RepairTimeMins;


    if (cmbSubStatus.GetValue() == "" || cmbSubStatus.GetValue() == null) {
        alert("Please select Sub Status");
        cmbSubStatus.Focus();
        return false;
    }

    //4.0 to 5.0 Changes
    if ((document.all.txtRefNo.value == "" || document.all.txtRefNo.value == null) && document.all.hdnFrom.value == "Closure" && document.all.hdnRefNo.value == "True") {
        alert("Please enter Ref No");
        document.all.txtRefNo.focus();
        return false;
    }
    

    if (document.all.txtComments.value == "" || document.all.txtComments.value == null) {
        alert("Please enter Comments");
        document.all.txtComments.focus();
        return false;
    }

    //4.0 to 5.0 Changes
    if ((document.all.txtCustComments.value == "" || document.all.txtCustComments.value == null) && document.all.hdnCustCmts.value == "True") {
        alert("Please enter Customer Comments");
        document.all.txtCustComments.focus();
        return false;
    }


    if (document.all.chkNextVisit.checked) {

        // alert(txtNextActDt.GetValue());

        //if (txtNextActDt.GetValue() == "" || txtNextActDt.GetValue() == null) {
        //    alert("Please select Next Visit Date");
        //    txtNextActDt.Focus();
        //    // document.all.txtNextActDt.focus();
        //    return false;
        //}
        if (document.all.txtNextActDt.value == "") {
            alert("Please select Next Activity Date")
            document.all.txtNextActDt.focus();
            return false;
        }

        frmv = rtndateonly1(document.all.txtNextActDt, "Next Activity Date");
        if (frmv == false) {
            return false;
        }

        NAct = document.all.txtNextActDt.value;

        if (checkdatevalue(today, NAct) < 2) {
            alert("Next Activity Date must be Greater than Current Date");
            document.all.txtNextActDt.focus();
            //  document.all.txtNextActDt.focus();
            return false;

        }


    }

    //Validate only if spares is displayed
    if (document.all.hdnDisplaySparesUsed.value == "True") {
        //COmmented by Padmanaban as SUggested by Gulam and Ganesh that Not necessary for validation
        /*
        if (document.getElementById("PartsList").innerHTML == "") {

            //if (gridLookup.GetText() == null || gridLookup.GetText() == "") {
            //    alert("Spares Used - Part Number cannot be empty")
            //    //gridLookup.focus();
            //    return false;
            //}


            if (document.all.txtSparesPartNo.value == "") {
                alert("Spares Used - Part Number cannot be empty")
                document.all.txtSparesPartNo.focus();
                return false;
            }

            if (document.all.txtSparesPartDesc.value == "") {
                alert("Spares Used - Part Description cannot be empty")
                document.all.txtSparesPartDesc.focus();
                return false;
            }

            if (document.all.txtSparesQuantity.value == "") {
                alert("Spares Used - Quantity Cannot be Empty")
                document.all.txtSparesQuantity.focus();
                return false;
            }
            else {
                if (document.all.txtSparesQuantity.value <= 0) {
                    alert("Spares Used - Quantity Cannot be 0")
                    document.all.txtSparesQuantity.focus();
                    return false;
                }
            }

            alert("Spares Used - Please Fill Parts Used")
            return false;

        }
        */

    }


    //To save the Spares data
    document.getElementById("hdnPartsInfo").value = "";
    for (var i = 0; i < SparesRowCount; i++) {
        if (aCompCode[i] != "") {
            document.getElementById("hdnPartsInfo").value += aCompCode[i] + "~" + aPartNo[i] + "~" + aPartDesc[i] + "~" + aQty[i] + "~" + aComments[i] + "#";
        }
    }


    //Validate only if Bill Details is displayed
    if (document.all.hdnDisplayBillDetails.value == "True") {
        //COmmented by Padmanaban as SUggested by Gulam and Ganesh that Not necessary for validation
        /*
        if (document.all.txtBillNo.value == "") {
            alert("Bill Details - Please enter Bill No")
            document.all.txtBillNo.focus();
            return false;
        }



        if (/[^a-zA-Z0-9\-\/]/.test(document.all.txtBillNo.value)) {
            alert('Bill Details - Special Characters are not allowed in Bill No');
            return false;
        }


        //if (document.all.txtBillDate.value == "") {
        //    alert("Bill Details - Please enter Bill Date")
        //    document.all.txtBillDate.focus();
        //    return false;
        //}

        //if (document.all.txtBillDate.value != "") {
        //    if (rtndatetime1(document.all.txtBillDate, "Bill Date") == false) {
        //        return false;
        //    }
        //}

        //date = txtBillDate.GetText();
        //if (date == 'dd/MM/yyyy' || date == '') {
        //    alert('Bill Date Can\'t be Empty');
        //    txtBillDate.Focus();
        //    return false;
        //}


        if (document.all.txtBillAmount.value == "") {
            alert("Bill Details - Please enter Bill Amount")
            document.all.txtBillAmount.focus();
            return false;
        }

        var fuData = document.getElementById('BillUploadimage');
        var FileUploadPath = fuData.value;


        if (FileUploadPath == '') {
            alert("Bill Details - Please upload an image");
            return false;
        }
        else {
            */

        var fuData = document.getElementById('BillUploadimage');
        var FileUploadPath = fuData.value;

        if (FileUploadPath != '') {
            var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

            //if (Extension == "gif" || Extension == "png" || Extension == "bmp" || Extension == "jpeg" || Extension == "jpg" || Extension == "doc" || Extension == "doc") {
            if (document.all.hdnFileType.value != "") {
                if (document.all.hdnFileType.value.indexOf(Extension) > 1) {

                    if (fuData.files && fuData.files[0]) {

                        if (fuData.files[0].size > document.all.hdnImgExceededSizeval.value) {
                            alert("Bill Details - File Upload Failed due to File Size Exceeding Limit.");
                            fuData.value = "";
                            return false;
                        }

                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $('#blah').attr('src', e.target.result);
                        }

                        reader.readAsDataURL(fuData.files[0]);
                    }
                }
                else {
                    alert("Bill Details - Upload file Shoud be image or document format");
                    fuData.value = "";
                    //e.processOnServer = false;
                    return false;
                }
            }
        }
    }


    //Multiple Attachments
    if (document.all.hdnAttachments.value == "True") {

        for (var i = 1; i <= 5; i++) {
            var fuData = document.getElementById('FileAttach' + i);

            //var fuData = document.getElementById('FileAttach1');
            var FileUploadPath = fuData.value;

            //if (FileUploadPath == '') {
            //    alert("Please upload an image");
            //    return false;
            //}
            //else {

            if (FileUploadPath != '') {

                var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

                //if (Extension == "gif" || Extension == "png" || Extension == "bmp" || Extension == "jpeg" || Extension == "jpg" || Extension == "doc" || Extension == "docx") {
                if (document.all.hdnFileType.value != "") {
                    if (document.all.hdnFileType.value.indexOf(Extension) > 1) {

                        if (fuData.files && fuData.files[0]) {

                            if (fuData.files[0].size > document.all.hdnImgExceededSizeval.value) {
                                alert("Attachments - File Upload Failed due to File Size Exceeding Limit.");
                                fuData.value = "";
                                return false;
                            }

                            var reader = new FileReader();
                            reader.onload = function (e) {
                                $('#blah').attr('src', e.target.result);
                            }

                            reader.readAsDataURL(fuData.files[0]);
                        }
                    }
                    else {
                        alert("Attachments - Upload file Shoud be image or document format");
                        fuData.value = "";
                        //e.processOnServer = false;
                        return false;
                    }
                }
            }
        }

    }


    //update Questionnaire
    if (document.all.hdnQuestionnaire.value == "True") {


        //Non mandatory 4.0 to 5.0 CHanges
        //for (var i = 1; i < QuestRowCount; i++) {
        //    if (aQuestAnsType[i - 1] != "StarRating" + (i - 1)) {
        //        if (document.getElementById("AnsType" + i).value == "") {
        //            alert("Questionnaire - Answer cannot be empty");
        //            document.getElementById("AnsType" + i).focus();
        //            return false;
        //        }
        //    }
        //    if (aQuestAnsType[i - 1] == "StarRating" + (i - 1)) {
        //        //alert(document.getElementById("star_input" + i).value);
        //        if (document.getElementById("star_input" + (i)).value == "0") {
        //            alert("Questionnaire - Star Rating cannot be empty");
        //            return false;
        //        }
        //    }
        //}


        //To save the Questionnaire Answers
        document.getElementById("hdnAnswers").value = "";
        for (var i = 1; i < QuestRowCount; i++) {
            if (aQuestCode[i - 1] != "" && aQuestAnsType[i - 1] != "StarRating" + (i - 1)) {
                document.getElementById("hdnAnswers").value += aQuestCode[i - 1] + "~" + document.getElementById("AnsType" + (i)).value + "#";
            }
            else if (aQuestCode[i - 1] != "" && aQuestAnsType[i - 1] == "StarRating" + (i - 1)) {
                document.getElementById("hdnAnswers").value += aQuestCode[i - 1] + "~" + document.getElementById("star_input" + (i)).value + "#";
            }
        }
        //alert(document.getElementById("hdnAnswers").value);
    }




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

    //if (gridLookup.GetValue() == "" || gridLookup.GetValue() == null) {
    //    alert("Please select Account");
    //    gridLookup.Focus();
    //    return false;
    //}

    //if (cmbengineer1.GetValue() == "" || cmbengineer1.GetValue() == null) {
    //    alert("Please select Engineer1");
    //    cmbengineer1.Focus();
    //    return false;
    //}


    document.getElementById("hdnWarrantyInfo").value = "";
    //document.getElementById("hdnProdDescription").value = "";
    for (var i = 0; i < RowCount; i++) {
        if (aWarType[i] != "") {

            document.getElementById("hdnWarrantyInfo").value += aWarType[i] + "~" + aMonth[i] + "~" + aNoofVisit[i] + "#";
            //document.getElementById("hdnProdDescription").value += aProduct[i] + "[" + aQty[i] + "];";
        }
    }
    //alert('warinfo ' + document.getElementById("hdnWarrantyInfo").value);
    //alert('acccode ' + document.getElementById("hdnAccCode").value);
    //alert('prodcode ' + document.getElementById("hdnProdCode").value);
    //alert('end');
    return true;


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
    

    //alert(rtnvalues);
    if (rtnvalues != "") {
        lhlpvalues1 = rtnvalues.split("#");

        //document.all.hdnInstallcode.value="";
        for (i = 0; i < lhlpvalues1.length; i++) {
            TempVal = lhlpvalues1[i].split("~");

            aWarType[RowCount] = TempVal[0];
            aNoofVisit[RowCount] = TempVal[2];
            aMonth[RowCount] = TempVal[1];
            aWarStartDate[RowCount] = TempVal[3];
            aWarEndDate[RowCount] = TempVal[4];
            RowCount++;

        }


    }

    RebuildTable();


}

function WarantyAdd(id) {
    
    var year, month, day, jsDate, WARStartDate, WAREndmyDate;
    if (document.all.txtInstallDate.value != "") {
        if (id == "none" || id == null) {
            //date = txtInstallDate.GetText();
            //if (date == 'dd/MM/yyyy' || date == '') {
            //    alert('Install Date Can\'t be Empty');
            //    txtInstallDate.Focus();
            //    return false;
            //}

            if (document.all.txtInstallDate.value == "") {
                alert("Please select Install Date")
                //  document.all.txtInstallDate.focus();

                return false;
            }

            frmv = rtndateonly1(document.all.txtInstallDate, "Install Date");
            if (frmv == false) {
                // document.all.txtInstallDate.value = "";
                return false;
            }

            else {
                ////document.all.hdnInitialWarEnddate.value = txtInstallDate.GetDate();
                //jsDate = txtInstallDate.GetDate();

                //year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
                //month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
                //day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

                //WARStartDate = new Date(year, month, day);
                //WAREndmyDate = new Date(year, month, day - 1);

                var from = $("#txtInstallDate").val().split("/");
                var jsDate = new Date(from[2], from[1] - 1, from[0]);

                year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
                month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
                day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

                WARStartDate = new Date(year, month, day);
                WAREndmyDate = new Date(year, month, day - 1);

                WARStartDate = convertDate(WARStartDate)
                WAREndmyDate = convertDate(WAREndmyDate)

                initstartdate = WAREndmyDate;
                startdate = WARStartDate;
                enddate = WAREndmyDate;
                prevenddate = WAREndmyDate;
                //  txtWarrStartDt.SetText(WARStartDate);
                document.all.txtWarrStartDt.value = WARStartDate
                //added by babu
                //  document.all.txtWarrEndDt.value = WAREndmyDate
               // alert(WAREndmyDate);
                // txtWarrEndDt.SetText(WAREndmyDate);
            }
            RebuildValue();
        }
        else if (id == "war") {
            ////document.all.hdnInitialWarEnddate.value = txtInstallDate.GetDate();
            //jsDate = txtWarrEndDt.GetDate();
            //year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
            //month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
            //day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

            //WARStartDate = new Date(year, month, day);
            //WAREndmyDate = txtWarrEndDt.GetDate();//new Date(year + 1, month, day - 1);


            var from = $("#txtInstallDate").val().split("/");
            var jsDate = new Date(from[2], from[1] - 1, from[0]);
            year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
            month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
            day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

            WARStartDate = new Date(year, month, day);


            WARStartDate = convertDate(WARStartDate);
            WAREndmyDate = convertDate(WARStartDate);


            initstartdate = WAREndmyDate;

            RebuildValue();
        }
        else {
            recalculateDate(id, aWarType[id], aMonth[id]);
        }

    }

    /*
    var jsDate = txtInstallDate.GetDate();

    if (jsDate != null && jsDate != "") {

        var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
        var month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
        var day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

        var WARStartDate = new Date(year, month, day);
        var WAREndmyDate = new Date(year + 1, month, day - 1);

        txtWarrStartDt.SetText(WARStartDate);
        txtWarrEndDt.SetText(WAREndmyDate);

    }
    */
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
        //txtWarrEndDt.SetValue(null);
   //     document.all.txtWarrEndDt.value = null;
    }
    RebuildTable();
}


function recalculateDate(id, WarType, currmonth) {
    var totalmonth = 0;

    for (var j = 0; j < id + 1; j++) {
        if (aWarType[j] != "")
            totalmonth = parseInt(totalmonth) + parseInt(aMonth[j]);

    }
    //alert(totalmonth);
    currmonth = totalmonth;
    if (WarType != "" && WarType != "undefined" && typeof(WarType) != "undefined") {
        var WARStartDate, WAREndmyDate;

       // jsDate = txtInstallDate.GetDate();

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
      //  txtWarrEndDt.SetText(WAREndmyDate);
        document.all.txtWarrEndDt.value = WAREndmyDate;
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

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}


function FnGetDate(flag) {

    var date;
    var frmv;

    //current date   
    var today = new Date();
    // alert(document.all.hdndate.value)
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var HM1 = today.getHours();
    var HM2 = today.getHours() + ':' + today.getMinutes();

    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    var today = dd + '/' + mm + '/' + yyyy;

    //return today;
 //   txtActivityDate.SetText(today);

    document.all.txtActivityDate.value = today;

    /////  Installation followup , closure and reallcoation get current date 

    //want to separte date means uncomment below lines  by chandrasekar on may 26 2017

    //if (flag = "Followup") {
    //    txtActivityDate.SetText(today);
    //}
    //if (flag = "Close") {

    //    txtActivityDate.SetText(today);
    //}
    //if (flag = "ReAllocation") {
    //    txtActivityDate.SetText(today);
    //}

    //////////////end ///////////


}

function validReallocation() {

    var date;



    //date = txtActivityDate.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('Re Allocation Date Can\'t be Empty');
    //    txtActivityDate.Focus();
    //    return false;
    //}
    if (document.all.txtActivityDate.value == "") {
        alert("Re Allocation Date Can\'t be Empty")
        //  document.all.txtInstallDate.focus();

        return false;
    }

    frmv = rtndateonly1(document.all.txtActivityDate, "Re Allocation Date");
    if (frmv == false) {
        // document.all.txtInstallDate.value = "";
        return false;
    }

    if (cmbEngineer.GetValue() == "" || cmbEngineer.GetValue() == null) {

        alert("Please select Engineer1");
        cmbEngineer.Focus();
        return false;
    }

    if (cmbEngineer1.GetValue() != "" || cmbEngineer1.GetValue() != null) {

        if (cmbEngineer.GetValue() == cmbEngineer1.GetValue()) {
            alert("Engineer1 and Engineer2 Should not be Same:");
            cmbEngineer1.Focus();
            return false;
        }
    }

    if (document.all.txtComments.value == "" || document.all.txtComments.value == null) {
        alert("Please enter Comments");
        // document.all.txtComments.Focus();
        return false;
    }
}

function convertDate(inputFormat) {
    function pad(s) { return (s < 10) ? '0' + s : s; }
    var d = new Date(inputFormat);
    return [pad(d.getDate()), pad(d.getMonth() + 1), d.getFullYear()].join('/');
}