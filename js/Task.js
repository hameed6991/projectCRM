function frmvalidation() {

    //    if(document.all.hdnAccCode.value == "")
    //    {
    //        alert("Please select a Account..");
    //        return false;
    //    }
    //     if(document.form1.hdnContCode.value == "")
    //        {alert("Please select a Contact..");
    //        return false;
    //    }


    //if ((gridLookupAccount.GetValue() == "" || gridLookupAccount.GetValue() == null) && (gridLookupContact.GetValue() == "" || gridLookupContact.GetValue() == null) && document.all.txtOthers.value == "") {


   
    if (document.all.txtactivitydate.value == "") {
        alert("Please select Activity Date..");
        document.all.txtactivitydate.focus();
        return false;
    }
    date = document.all.txtactivitydate.value;
    if (date != "") {
        frmv = checkdatevalue(document.all.txtactivitydate.value, document.all.hdndatenow.value)
        if (frmv == 1) {
            alert("Activity Date cannot be greater than Current Date ...");
            return false;
        }
    }

    if (document.all.txtactivitydate.value != "") {
        if (!rtndateonly2(document.all.txtactivitydate, "Activity Date"))
            return false;
    }



    if (document.all.ddlactivitytype.value == "") {
        alert("Please select Activity Type..");
        document.all.ddlactivitytype.focus();
        return false;
    }

    if (document.all.ddlengineer.value == "") {
        alert("Please select Engineer..");
        document.all.ddlengineer.focus();
        return false;
    }

    if (document.all.txtdescription.value == "") {
        alert("Description Can't be Empty..");
        document.all.txtdescription.focus();
        return false;
    }

    if (document.all.txtdescription.value.length > 1000) {
        alert("Description Can't more than 1000 words..");
        document.all.txtdescription.focus();
        return false;
    }





    if (document.all.ddlactagainst.value == "") {
        alert("Please Select Activity Against..");
        document.all.ddlactagainst.focus();
        return false;
    }

    
    if (document.all.hdncode.value == "" && document.all.hdnactaginst.value == "") {
        if (document.all.ddlactagainst.value != "Others") {
            alert("Please Select Reference..");
            return false;
        }
        else if (document.all.hdnactaginst.value == "") {
            alert("Please Select Reference..");
            return false;
        }
    }


    //Hours Spend 
   // debugger;
    if (RepairtimeEdit.GetValue().getHours() == "0")
        RepairTimeHrs = '0' + RepairtimeEdit.GetValue().getHours();
    else
        RepairTimeHrs = RepairtimeEdit.GetValue().getHours();

    if (RepairtimeEdit.GetValue().getMinutes() == "0")
        RepairTimeMins = '0' + RepairtimeEdit.GetValue().getMinutes();
    else
        RepairTimeMins = RepairtimeEdit.GetValue().getMinutes();


    if (RepairtimeEdit.GetValue().getHours() == "0" && RepairtimeEdit.GetValue().getMinutes() == "0") {
        alert("Hours Spent Cannot be empty");
        return false;
    }

    document.all.hdnRepairHrsMins.value = RepairtimeEdit.GetValue().getHours() + ':' + RepairtimeEdit.GetValue().getMinutes();
    document.all.hdnRepairHrs.value = (RepairTimeHrs * 60) + +RepairTimeMins;

    return true;
}


function OnInit(s, e) {
    var date = new Date();
    date.setHours(00);
    date.setMinutes(00);

    s.SetDate(date);
}


function gettodaydate() {
    var today = new Date();
    var dd = today.getDate();

    var mm = today.getMonth() + 1;
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }

    if (mm < 10) {
        mm = '0' + mm;
    }
    today = dd + '/' + mm + '/' + yyyy;
    return today;
}