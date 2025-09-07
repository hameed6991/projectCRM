function ShowEditAccount() {

    var rtnvalues, url, Height, Width;
    var Lmode = "summary"

    url = "MdAccMast.aspx?acccode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;

    Height = "580";
    Width = "1000";
    if (window.showModalDialog) {
        url = url.replace(".", "$");
        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=no;";
        position = position + "status:no;";
        var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);

        window.location = "AccountSummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;

    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";
        var rtnvalue = window.open("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, "_blank", position);
        //var rtnvalue = window.open(url, "_blank", position);
        //  window.location.reload();
        window.location = "AccountSummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;

    }

    //  return true;
}


function fnOpenAddContact()
{
    var rtnvalues, url, Height, Width;
    var Lmode = "summary"

    url = "AddContact.aspx?acccode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;

    Height = "340";
    Width = "1000";//800
    if (window.showModalDialog) {
        url = url.replace(".", "$");
        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=no;";
        position = position + "status:no;";
        var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);
        window.location = "AccountSummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;

    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";
        //var rtnvalue = window.open("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, "_blank", position);
        var rtnvalue = window.open(url, "_blank", position);
        window.location = "AccountSummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;
    }
    try {
        document.getElementById("Layer1").focus();
        getdata('', '', '', 'refresh');
    }
    catch (ers) {

    }

    return true;
}

function fnOpenAddBill()
{
    var rtnvalues, url, Height, Width;
    var Lmode = "summary"

    url = "GenerateBillSB.asp?AccountCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;

    //Height = "600";
    Height = "650";
    Width = "800";
    if (window.showModalDialog) {
        url = url.replace(".", "$");
        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=no;";
        position = position + "status:no;";
        var rtnvalue = window.showModalDialog("GenerateBillSB.asp?AccountCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value + "&Height=" + Height + "&Width=" + Width, null, position);
        window.location = "AccountSummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;

    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";
        var rtnvalue = window.open("GenerateBillSB.asp?AccountCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value + "&Height=" + Height + "&Width=" + Width, "_blank", position);
        window.location = "AccountSummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;
    }

}


function fnOpenFollowup()
{


}

function fnOpenRMARequest()
{
    var rtnvalues, url, Height, Width;
    var Lmode = "summary"

    // url = "addsrRMARequestnew.asp?SRNo=" + document.all.txtSrno.value + "&From=Accounts&logid=" + document.all.logid.value;
    url = "addsrRMARequestnew.asp?acccode=" + document.all.hdnAccCode.value + "&From=account&logid=" + document.all.logid.value;

    Height = "600";
    Width = "900";//900
    if (window.showModalDialog) {
        url = url.replace(".", "$");

        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=no;";
        position = position + "status:no;";
        var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);


        window.location = "accountsummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;

    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";
        //var rtnvalue = window.open("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, "_blank", position);
        var rtnvalue = window.open(url, "_blank", position);
        //  window.location.reload();

        window.location = "accountsummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;
    }

}

function fnOpenQuotationReq()
{

    var rtnvalues, url, Height, Width;
    var Lmode = "summary"

    // url = "addsrRMARequestnew.asp?SRNo=" + document.all.txtSrno.value + "&From=Accounts&logid=" + document.all.logid.value;
    url = "AddAQuotation.asp?Refcode=" + document.all.hdnAccCode.value + "&Reftype=Account&cancelbut=remove&logid=" + document.all.logid.value;

    Height = "600";
    Width = "900";//900
    if (window.showModalDialog) {
        url = url.replace(".", "$");

        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=no;";
        position = position + "status:no;";
        var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);


        window.location = "accountsummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;

    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";
        //var rtnvalue = window.open("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, "_blank", position);
        var rtnvalue = window.open(url, "_blank", position);
        //  window.location.reload();

        window.location = "accountsummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;
    }

}

function fnOpenAttachments()

{
    var rtnvalues, url, Height, Width;
    var Lmode = "summary"

    url = "PopbankAttachment.asp?AccountCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;

    //Height = "400"; 
    Height = "220";
    Width = "600";
    if (window.showModalDialog) {
        url = url.replace(".", "$");
        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=no;";
        position = position + "status:no;";
        var rtnvalue = window.showModalDialog("PopbankAttachment.asp?AccountCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value + "&Height=" + Height + "&Width=" + Width, null, position);
        window.location = "AccountSummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;

    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";
        var rtnvalue = window.open("PopbankAttachment.asp?AccountCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value + "&Height=" + Height + "&Width=" + Width, "_blank", position);
        window.location = "AccountSummary.aspx?AccCode=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value;
    }

}


function fetchAccountData() {
    document.getElementById("spnAccount").innerHTML = document.getElementById("hdnAccount").value;
}

function fetchAddressData() {
    document.getElementById("spnAddress").innerHTML = document.getElementById("hdnAddress").value;
}

function fetchCommentsData() {
    document.getElementById("spnComments").innerHTML = document.getElementById("hdnComments").value;
}






