function close(result)
{
    alert(result);
    if (window.showModalDialog)
    {
        //window.parent.opener.grid.Refresh();
        window.parent.close();
    }
    else
    {
        window.parent.opener.grid.Refresh();
        window.parent.close();
    }

    //var obj = result;
    //var arr = [];
    //for (elem in obj) {
    //    arr.push(obj[elem]);
    //}
    //if (window.showModalDialog) {
    //    alert(arr[0]);
    //    window.parent.close();
    //}
    //else
    //{
    //    alert(arr[0]);
    //    window.parent.opener.grid.Refresh();
    //    window.parent.close();
    //}
}


function ShowSalesOrder()
{
    var rtnvalues;
    var lhlpvalues = new Array();
    
    if (window.showModalDialog)
    {
        rtnvalues = window.showModalDialog("SearchSalesOrder.aspx?SalesOrder=" + txtSalesOrder.GetText() + "&logid=" + document.all.logid.value, null, "dialogWidth=750Px;dialogHeight=400Px;status:no;");
        fnsetSalesOrder(rtnvalues);
    }
    else
    {
        rtnvalues = window.open("SearchSalesOrder.aspx?SalesOrder=" + txtSalesOrder.GetText() + "&logid=" + document.all.logid.value, null, "Width=750,Height=400,scroll=no;")
    }

}
function fnsetSalesOrder(rtnvalues)
{
    if (String(rtnvalues) != "undefined")
    { 
        lhlpvalues = rtnvalues.split("|");
        txtSalesOrder.SetText(lhlpvalues[0]);
        document.all.hdnOrderNo.value = lhlpvalues[0];
        document.all.hdnOrderDate.value = lhlpvalues[1];
        txtSalesOrderDate.SetText(lhlpvalues[1]);
        document.all.hdnAccount.value = lhlpvalues[2];

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
    }
}

var prodTable = 0;

RowCount = 0;

aWarType = new Array(100);
aMonth = new Array(100);
aNoofVisit = new Array(100);
aModule = new Array(100);

ContRowCount = 0;

function AddToList()
{
    if (cmbType.GetSelectedItem().value == null || cmbType.GetSelectedItem().value == "")
    {
        alert("Please select the Type");
        cmbType.Focus();
        return false;
    }
    else
    {  
        document.all.hdnWarantyType.value = cmbType.GetSelectedItem().value; 
    } 
    Month = txtMonth.GetText();
    Noofvisit = txtNoofvisit.GetText(); 
    
    if (txtMonth.GetText() == "0")
    {
        alert("Please Enter the Month");
        txtMonth.Focus();
        return false;
    }

    if (txtNoofvisit.GetText() == "0") {
        alert("Please Enter the No of Visit");
        txtNoofvisit.Focus();
        return false;
    }

    for (var i = 0; i < RowCount; i++)
    {
        if (aWarType[i] != '' && aWarType[i] == document.getElementById('hdnWarantyType').value)
        {
            alert('Warranty added already!')
            return false;
        }
    }
    
    //document.all.hdnProdAmount.value = document.all.hdnProdRate.value * document.all.txtQty.value;
    
    
    aWarType[RowCount] = document.getElementById('hdnWarantyType').value;
    aMonth[RowCount] = txtMonth.GetText();
    aNoofVisit[RowCount] = txtNoofvisit.GetText();
    aModule[RowCount] = "Insert";
    //aRate[RowCount] = document.getElementById('hdnProdRate').value;
    //aAmount[RowCount] = document.getElementById('hdnProdAmount').value;
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
    txtMonth.SetText('');
    txtNoofvisit.SetText('');
    cmbType.SetValue('');
    cmbType.SetText('<-Select->');
    //document.getElementById('hdnProdAmount').value = '';
    //ProductComboBox.SetValue('');
    //ProductComboBox.SetText('');

    return true;
}
function RemoveFromList(removeid)
{
    aMonth[removeid] = "";
    aWarType[removeid] = "";
    //aRate[removeid] = "";
    //aAmount[removeid] = "";
    countdsds = countdsds + 1;

    prodTable = prodTable - 1; 
    //document.all.txtorderValue.value = "";
    //for (var i = 0; i < RowCount; i++)
    //{
    //    if (aProdCode[i] != "")
    //        //document.all.hdnTotalProdAmount.value = +document.all.hdnTotalProdAmount.value - -aAmount[i];
    //        document.all.txtorderValue.value = +document.all.txtorderValue.value - -aAmount[i];
    //}

    RebuildTable();
    return false;
}
function RebuildTable()
{
    var output = "";
    var header = "";
    var footer = "";
    var footer1 = "";
    var counter = 1;
    var clr;
    clr = "grid_row_bg1";
     
    for (var j = 0; j < RowCount; j++)
    { 
        if (aWarType[j] != "")
        {
            if (clr == "grid_row_bg1")
                clr = "grid_row_bg";
            else
                clr = "grid_row_bg1"; 
            output += "<tr valign='middle' align='center' class=" + clr + " >"
            output += "<td align='center' class=" + clr + ">" + counter + "</td>";
            output += "<td align='center' class=" + clr + ">" + aWarType[j] + "</td>";
            output += "<td align='center' class=" + clr + ">" + aMonth[j] + "</td>";
            output += "<td align='center' class=" + clr + ">" + aNoofVisit[j] + "</td>";
            //output += "<td style='display: none' width='50px' align='center' class=" + clr + ">" + aWarType[j] + "</td>";



            //output += "<td align='center'  class=" + clr + "><input style='margin: 0px 1px 0px 3px;width:62px;text-align:right' type='number' class='inputstyle' id='prodRateValue" + j + "' name='orderValue' onkeypress='return isNumber(event)' onchange='RateFocusOut(" + j + ")' value='" + aRate[j] + "'/></td>";           
            //output += "<td align='center'  class=" + clr + ">" + aAmount[j] + "</td>";

            output += "<td width='10%' align='center' valign='middle' class=" + clr + " ><img src='images/cancel_icon.gif' width='16' height='16' onClick='RemoveFromList(" + j + ")' ></td>"

            output += "</tr>";
            counter += 1;
            countdsds = counter;             
        }
    } 
    header += "<tr>"
    header += "<th width='10%' align='center' valign='middle' class='grid_heading_bg'><span class='grid_heading_txt'>S.No.</span></th>";
    header += "<th width='21%' align='center' valign='middle' class='grid_heading_bg'><span class='grid_heading_txt'>Type</span></th>";
    header += "<th width='21%' align='center' valign='middle' class='grid_heading_bg'><span class='grid_heading_txt'>Month</span></th>";
    header += "<th width='21%' align='center' valign='middle' class='grid_heading_bg'><span class='grid_heading_txt'>No on Visit</span></th>";
    //header += "<th width='5%' align='center' valign='middle' class='grid_heading_bg'><span class='grid_heading_txt'>Rate</span></th>";
    //header += "<th width='11%' align='center' valign='middle' class='grid_heading_bg'><span class='grid_heading_txt'>Amount</span></th>";
    header += "<th width='21%'  align='center' valign='middle' class='grid_heading_bg'><span class='grid_heading_txt'>Remove</span></th>";
    header += "</tr>";

    if (output != "")
    {
        output = "<table width='70%' align='center'  border='0' background='images/pixel_004.gif' cellpadding='0' cellspacing='1' id='DispTable'>" + header + output + footer + "</table>";
        //document.getElementById("footerProductList").style.display = "";
    }
    else
    {
        output = "<table>" + footer1 + "</table>";
        //document.getElementById("footerProductList").style.display = "none";
    }

    //alert(output) 

    if (output != "")
    {
        document.getElementById('WarrantyList').innerHTML = output;        
    }
    else
    {
        document.getElementById("WarrantyList").innerHTML = "";
        //document.getElementById("footerProductList").style.display = "none";
    }
    countdsds = counter;
}

function OnGridFocusedRowChanged(s, e) {
    var grid = gridLookup.GetGridView();
    if (grid.GetFocusedRowIndex() >= 0) {
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'AccCode;Account;Site;SiteID;Address;City;State;Pincode;Industry;Phone;SiteID;', ShowAccount);
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
    if (String(lhlpvalues) != "undefined" && String(lhlpvalues) != "null") {
        //txtSiteId
        document.all.hdnAccCode.value = lhlpvalues[0];
        gridLookup.SetText(lhlpvalues[1]); // Set only Account to the Grid Lookup
        txtsite.SetText(lhlpvalues[2]);
        txtSiteId.SetText((lhlpvalues[3]);
        txtAddress.SetText(lhlpvalues[4]);
        txtCity.SetText(lhlpvalues[5]);
        txtState.SetText(lhlpvalues[6]);
        txtPin.SetText(lhlpvalues[7]);
        txtIndustry.SetText(lhlpvalues[8]);
        
        //document.all.txtsite.value = lhlpvalues[2];
        //document.all.txtAddress.value = lhlpvalues[3];
        //document.all.txtCity.value = lhlpvalues[4];
        //document.all.txtState.value = lhlpvalues[5];
        //document.all.txtPin.value = lhlpvalues[6];
        //document.all.txtIndustry.value = lhlpvalues[7];
        //document.all.txtIndustry.value = lhlpvalues[8];

        //Clear Contact values
        ContactComboBox.SetText('');
        txtMobile.SetText('');
        txtDepart.SetText('');
        document.all.hdnContCode.value = "";
        //document.all.txtMobileNo.value = "";
        //document.all.txtDepartment.value = "";

        getcontactData();
    }

}


function ContactOnGridFocusedRowChanged(s, e) {
    var grid = ContactComboBox.GetGridView();
    //alert(grid.GetFocusedRowIndex())
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
    //alert(grid.GetFocusedRowIndex())
    if (grid.GetFocusedRowIndex() >= 0) {
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'PSCode;Prodcode;PartNo;Prodline;ProdDesc;', ShowModel);
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


function ShowModel(lhlpvalues) {

    if (String(lhlpvalues) != "undefined" && String(lhlpvalues) != "null") {
        grdModel.SetText(lhlpvalues[2]); // Set only Account to the Grid Lookup
        //ContactComboBox.SetText(lhlpvalues[1]);
        document.all.hdnProdCode.value = lhlpvalues[1];
        //document.all.hdnContCode.value = lhlpvalues[0];
        //document.all.txtMobileNo.value = lhlpvalues[3];
        //document.all.txtDepartment.value = lhlpvalues[2];
    }
}

function getcontactData() {

    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }
    //alert(document.all.hdnAccCode.value);
    if (document.all.hdnAccCode.value != "") {
        var sURL = "WebService/ServiceRequest.asmx/GetContact"
        xml.open("POST", sURL, false);

        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var str = "AccCode=" + document.all.hdnAccCode.value;
        //alert(str);
        xml.send(str)
        lsval = xml.responseText;
        //alert(lsval)
        //fnBindDropDown("cmbEngineer");   
        ContactComboBox.ClearItems();
        ContactComboBox.AddItem("None", "", 0);


        if (lsval != "") {

            arReceived = lsval.split("^^^");

            for (i = 0; i < arReceived.length - 1; i++) {
                arToBind = arReceived[i].split("|");
                //alert(arToBind[0]);
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
        // alert(str);
        xml.send(str)
        lsval = xml.responseText;

        if (lsval != "") {
            arReceived = lsval.split("^^^");

            for (i = 0; i < arReceived.length - 1; i++) {
                arToBind = arReceived[i].split("|");
                //alert(arToBind[0]);
                if (arToBind[0] != "null" && arToBind[0] != "")
                    txtDepart.SetText(arToBind[0]);//document.getElementById("txtDepartment").value = arToBind[0];

                if (arToBind[1] != "null" && arToBind[1] != "")
                    txtMobile.SetText(arToBind[1]);//document.getElementById("txtMobileNo").value = arToBind[1];
            }
        }
    }
    else
    {
        txtDepart.SetText('');
        txtMobile.SetText('');
    }
}


function fnOpenContact()
{
    if (gridLookup.GetValue() == "" || gridLookup.GetValue() == null)
    {
        alert("Please select Account");
        return false;
    }

    //var rtnval = fnOpenWindowPopup('AddContacts.aspx?acccode=' + document.getElementById("hdnAccCode").value + '&logid=' + document.getElementById("hdnLogId").value + '&ShowModalDialog=Yes', '450', '750');

    if (window.showModalDialog)
    {
        rtnvalues = window.showModalDialog("PopOverlay.aspx?Url=AddContact.aspx?acccode=" + document.getElementById("hdnAccCode").value + "&logid=" + document.all.logid.value, null, "dialogWidth=750Px;dialogHeight=450Px;status:no;");
        loadContactValues(rtnvalues);
    }
    else
    {
        rtnvalues = window.open("PopOverlay.aspx?Url=AddContact.aspx?acccode=" + document.getElementById("hdnAccCode").value + "&logid=" + document.all.logid.value, null, "Width=750,Height=450,scroll=no;")
    }


    

}

function loadContactValues(val)
{
    alert(val);
    alert('st contact');
    getcontactData();
    alert('end contact');
}

function WarantyAdd()
{
    var jsDate = txtInstallDate.GetDate();
    if (jsDate != null && jsDate != "") {
        var year = jsDate.getFullYear(); // where getFullYear returns the year (four digits)
        var month = jsDate.getMonth(); // where getMonth returns the month (from 0-11)
        var day = jsDate.getDate();   // where getDate returns the day of the month (from 1-31)

        var WARStartDate = new Date(year, month, day);
        var WAREndmyDate = new Date(year + 1, month, day);

        txtWarrantyStart.SetText(WARStartDate);
        txtWarrantyEnd.SetText(WAREndmyDate);

    }
}
function validform()
{
    var date;
    if (grdModel.GetValue() == "" || grdModel.GetValue() == null)
    {
        alert("Please select Model No");
        grdModel.Focus();
        return false;
    }
    
    if (txtSalesOrder.GetText() == "" || txtSalesOrder.GetText() == null)
    {
        alert("Please enter Sales Order#");
        txtSalesOrder.Focus();
        return false;
    }
    if (document.all.hdnOrderNo.value == "")
    {
        alert("Please Select Sales Order# using Search Option");
        txtSalesOrder.Focus();
        return false;
    }
    
    date = txtSalesOrderDate.GetText();
    if (date == 'dd/MM/yyyy' || date == '')
    {
        alert('Sales Order Date Can\'t be Empty');
        txtSalesOrderDate.Focus(); 
        return false;
    } 
    if (txtPuchaseOrder.GetText() == "" || txtPuchaseOrder.GetText() == null)
    {
        alert("Please enter PO#");
        txtPuchaseOrder.Focus();
        return false;
    }
    date = txtPuchaseOrderDate.GetText();
    if (date == 'dd/MM/yyyy' || date == '')
    {
        alert('PO Date Can\'t be Empty');
        txtPuchaseOrderDate.Focus();
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
    date = txtInvoiceDate.GetText();
    if (date == 'dd/MM/yyyy' || date == '')
    {
        alert('Invoice Date Can\'t be Empty');
        txtInvoiceDate.Focus();
        return false;
    }

    if (txtdisFrmBranch.GetText() == "0" || txtdisFrmBranch.GetText() == null)
    {
        alert("Please enter Distance From Service Location");
        txtdisFrmBranch.Focus();
        return false;
    }

    date = txtInstallDate.GetText();
    if (date == 'dd/MM/yyyy' || date == '')
    {
        alert('Install Date Can\'t be Empty');
        txtInstallDate.Focus();
        //e.processOnServer = false;
        return false;
    }
    date = txtWarrantyStart.GetText();
    if (date == 'dd/MM/yyyy' || date == '') {
        alert('Warranty Start Date Can\'t be Empty');
        txtWarrantyStart.Focus();
        //e.processOnServer = false;
        return false;
    }

    date = txtWarrantyEnd.GetText();
    if (date == 'dd/MM/yyyy' || date == '') {
        alert('Warranty End Date Can\'t be Empty');
        txtWarrantyEnd.Focus();
        //e.processOnServer = false;
        return false;
    }

    if (gridLookup.GetValue() == "" || gridLookup.GetValue() == null) {
        alert("Please select Account");
        gridLookup.Focus();
        return false;
    }
    
    if (cmbengineer1.GetValue() == "" || cmbengineer1.GetValue() == null) {
        alert("Please select Engineer1");
        cmbengineer1.Focus();
        return false;
    }



    document.getElementById("hdnWarrantyInfo").value = "";
    //document.getElementById("hdnProdDescription").value = "";
    for (var i = 0; i < RowCount; i++)
    {
        if (aWarType[i] != "")
        {
             
            document.getElementById("hdnWarrantyInfo").value += aWarType[i] + "~" + aMonth[i] + "~" + aNoofVisit[i] + "~" + aModule[i] + "#";
            //document.getElementById("hdnProdDescription").value += aProduct[i] + "[" + aQty[i] + "];";
        }
    }
    //alert('warinfo ' +document.getElementById("hdnWarrantyInfo").value);
    //alert('acccode ' + document.getElementById("hdnAccCode").value);
    //alert('prodcode ' + document.getElementById("hdnProdCode").value);
    //alert('end');
    //return false;

    document.getElementById('btnsave').style.display = 'none';
}

function ShowMap()
{
    var markerinfo = "";

    if (grdModel.GetValue() != "" || grdModel.GetValue() != null)
    {
        markerinfo += "Model No:" + grdModel.GetValue() + "|";
    }
    if (gridLookup.GetValue() != "" || gridLookup.GetValue() != null)
    {
        markerinfo += "Account:" + gridLookup.GetValue() + "|";
    }
    if (txtAddress.GetText() != "" || txtAddress.GetText() != null)
    {
        markerinfo += "Address:" + txtAddress.GetText() + "|";
    }

    document.all.hdnmarkerinfo.value = markerinfo
    if (isNaN(txtlatitude.GetText()))
    {
        alert("Please enter only numeric value For Lattitude ");
        txtlatitude.Focus();
        return false;
    }
    if (isNaN(txtlongitude.GetText()))
    {
        alert("Please enter only numeric value For Longitude ");
        txtlongitude.Focus();
        return false;
    }
    var retvalue = ""


    var url;
    //alert(document.all.chkGeolocation.checked);
    if (document.all.chkGeolocation.checked == true)
    {
        if (txtlongitude.GetText() != "00.000000" || txtlatitude.GetText() != "00.000000")
        {
           //retvalue = window.showModalDialog("BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=" + txtlatitude.GetText() + "&longitude=" + txtlongitude.GetText() + "&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=true", null, "dialogWidth=950px;dialogHeight=500px;status:no;")
            url = "BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=" + txtlatitude.GetText() + "&longitude=" + txtlongitude.GetText() + "&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=true";//, null, "dialogWidth=950px;dialogHeight=500px;status:no;";
        }
        else
        {
            //retvalue = window.showModalDialog("BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=22.492257694&longitude=79.381713469&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=true&ZoomLevel=1", null, "dialogWidth=950px;dialogHeight=500px;status:no;")
            url = "BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=22.492257694&longitude=79.381713469&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=true&ZoomLevel=1";//, null, "dialogWidth=950px;dialogHeight=500px;status:no;";
        }
    }
    else
    {
        if (txtlongitude.GetText() != "00.000000" || txtlatitude.GetText() != "00.000000")
        {
            //retvalue = window.showModalDialog("BankLocation.aspx?logid=" + document.all.hdnlogid.value + "&latitude=" + document.all.txtlatitude.value + "&longitude=" + document.all.txtlongitude.value + "&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=false", null, "dialogWidth=950px;dialogHeight=500px;status:no;")
            url = "BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=" + txtlatitude.GetText() + "&longitude=" + txtlongitude.GetText() + "&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=false";//, null, "dialogWidth=950px;dialogHeight=500px;status:no;"
        }
        else
        {
            //retvalue = window.showModalDialog("BankLocation.aspx?logid=" + document.all.hdnlogid.value + "&latitude=-14.455957734&longitude=28.317260344&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=false&ZoomLevel=1", null, "dialogWidth=950px;dialogHeight=500px;status:no;")
            url = "BankLocation.aspx?logid=" + document.all.logid.value + "&latitude=-14.455957734&longitude=28.317260344&markerinfo=" + document.all.hdnmarkerinfo.value + "&markertype=false&ZoomLevel=1"//, null, "dialogWidth=950px;dialogHeight=500px;status:no;"
        }
    }

    if (window.showModalDialog) 
    {
        //rtnvalues = window.showModalDialog("SearchSalesOrder.aspx?SalesOrder=" + grdModel.GetValue() + "&logid=" + document.all.logid.value, null, "dialogWidth=700Px;dialogHeight=400Px;status:no;");
        rtnvalues = window.showModalDialog(url, null, "dialogWidth=950Px;dialogHeight=500Px;status:no;");
        fnsetMapDetails(rtnvalues);
    }
    else 
    {
        //rtnvalues = window.open("SearchSalesOrder.aspx?SalesOrder=" + grdModel.GetValue() + "&logid=" + document.all.logid.value, null, "Width=700,Height=400,scroll=no;")
        rtnvalues = window.open(url, null, "Width=950,Height=500,scroll=no;")
    }   
}

function fnsetMapDetails(retvalue)
{
    if (String(retvalue) == "undefined" || String(retvalue) == "Cancel")
    {
        return false;
    }
    else
    {
        var latlng = retvalue.split("|");
        if (latlng[0] != "" && latlng[1] != "")
        {
            txtlatitude.SetText(parseFloat(latlng[0]).toFixed(9));
            txtlongitude.SetText(parseFloat(latlng[1]).toFixed(9));
        }
    }
}





function addcomponent() {
    if (document.all.txtEquipId.value != "") {
        // Mehtod to check whether the Serial No exist in CRM for Same Product

        var xml = new ActiveXObject("Microsoft.XMLHTTP");
        var sURL = "getSerialNoValid.asp?SerialNo=" + document.getElementById("txtEquipId").value + "&ProdCode=" + document.getElementById("hdnProdCode").value;
        xml.open("POST", sURL, false);
        xml.send();
        var lsval = xml.responseText;
        if (lsval != "Valid") {
            alert("SerialNo Already Exist in CRM for Same Product...");
            return false;
        }

        if (cmbComponent.GetValue() == "" || cmbComponent.GetValue() == null)
        {
            alert("Please Select the Component");
            cmbComponent.Focus();
            return false;
        }
        var rtnvalues;
        rtnvalues = window.showModalDialog("PopupAddComponents.asp?Component=" + cmbComponent.GetValue() + "||" + cmbComponent.GetText() + "&ProdCode=" + document.getElementById("hdnProdCode").value + "&InstallCode=&atmid=" + document.all.txtEquipId.value + "&logid=" + document.all.logid.value, null, "dialogWidth=950Px;dialogHeight=380Px;scroll:yes;")

        document.all.Frame1.src = "ComponentDetails.asp?Component=" + cmbComponent.GetValue() + "&ProdCode=" + document.getElementById("hdnProdCode").value + "&InstallCode=&equipid=" + document.all.txtEquipId.value + "&logid=" + document.all.logid.value;

    }
    else {
        alert("Please Enter the Serial No");
    }
}

 
function load()
{
    document.getElementById("Frame1").src = "ComponentDetails.asp?logid="+ document.all.logid.value;
}


//function editsla()
//{
//    // Mehtod to check whether the Serial No exist in CRM for Same Product
		
//    var xml = new ActiveXObject( "Microsoft.XMLHTTP" );
//    var sURL = "getSerialNoValid.asp?SerialNo="+txtSerialNo.GetText()+"&ProdCode="+document.getElementById("hdnProdCode").value;
//    xml.open("POST", sURL, false);
//    xml.send();
//    var lsval = xml.responseText;
//    if(lsval!="Valid")
//    {
//        alert("SerialNo Already Exist in CRM for Same Product...");
//        return false;
//    }

//    var rtnvalues;
//    //rtnvalues= window.showModalDialog("popSLA.asp?equipid="+document.all.hdnequipid.value+"&ProdCode="+document.getElementById("hdnProdCode").value+"&InstallCode="+document.getElementById("hdnInstallCode").value+"&logid="+document.all.hdnlogid.value,null,"dialogWidth=950Px;dialogHeight=380Px;scroll:yes;")
//    rtnvalues= window.showModalDialog("popSLA.asp?equipid="+txtSerialNo.GetText()+"&ProdCode="+document.getElementById("hdnProdCode").value+"&InstallCode=&logid="+document.all.logid.value,null,"dialogWidth=950Px;dialogHeight=380Px;scroll:yes;")
//    window.location.reload();
//}
