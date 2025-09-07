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
    var today = dd + '/' + mm + '/' + yyyy;// + ' ' + HM2;

     
    //return today;
    
    /////  Installation followup , closure and reallcoation get current date 

    //want to separte date means uncomment below lines  by chandrasekar on may 26 2017
    
   
   
    //    txtActivityDate.SetText(today);       
    document.all.txtActivityDate.value=today;
       
    
    //if (flag = "Close") {

    //    txtActivityDate.SetText(today);
    //}
    //if (flag = "ReAllocation") {
    //    txtActivityDate.SetText(today);
    //}

    //////////////end ///////////


}

function FnGetDate1(flag) {

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
    var today = dd + '/' + mm + '/' + yyyy + ' ' + HM2;

    //return today;

    /////  Installation followup , closure and reallcoation get current date 

    //want to separte date means uncomment below lines  by chandrasekar on may 26 2017


    
   // txtSchedDate.SetText(today);
    document.all.txtSchedDate.value = today

    
    //if (flag = "Close") {

    //    txtActivityDate.SetText(today);
    //}
    //if (flag = "ReAllocation") {
    //    txtActivityDate.SetText(today);
    //}

    //////////////end ///////////


}

function validFollowup() {
    var date;
    var frmv;

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

   
    if (cmbSubStatus.GetValue() == "" || cmbSubStatus.GetValue() == null) {
        alert("Please select Sub Status");
        cmbSubStatus.Focus();
        return false;
    }

    //date = txtActivityDate.GetText();
    //if (date == 'dd/MM/yyyy' || date == '') {
    //    alert('Activity Date Can\'t be Empty');
    //    txtActivityDate.Focus();
    //    return false;
    //}

    if (document.all.txtActivityDate.value == "")
    {
        alert('Activity Date Can\'t be Empty');
       // document.all.txtActivityDate.Focus();
    }

    //alert(cmbHrs.GetValue())
    //if ((cmbHrs.GetValue() == "" && cmbHrs.GetValue() == null && cmbHrs.GetValue() == "00") || (cmbMins.GetValue() == "" && cmbMins.GetValue() == null && cmbMins.GetValue() == "00")) {
    //    alert("Please select Hrs Mins");
    //    cmbHrs.Focus();
    //    return false;
    //}

    //if (cmbHrs.GetValue() == "00" && cmbMins.GetValue() == "00") {
    //    alert("Please select Hrs Mins");
    //    return false;
    //}

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
   // alert(document.all.hdnRepairHrs.value)
  //  alert(document.all.hdnRepairHrsMins.value)

    if (document.all.txtComments.value == "" || document.all.txtComments.value == null) {
        alert("Please enter Action Taken");
        // document.all.txtComments.Focus();
        return false;
    }
    if (document.all.hdnvalidatereportno.value == "validatereportno" && document.all.txtReportNo.value == "") {
        alert("Report No cannot be empty");
        document.all.txtReportNo.focus();
        return false;
    }
    if (document.all.chkNextVisit.checked) {

         
      
        if (document.all.txtNextActDt.value == "") {
            alert("Please select Next Activity Date")
            document.all.txtNextActDt.focus();
            return false;
        }

        frmv = rtndateonly1(document.all.txtNextActDt, "Next Activity Date");
        if (frmv == false) {
            return false;
        }

        //Create = document.all.txtCreateDate.value;
        var NAct = document.all.txtNextActDt.value;

        if (checkdatevalue(today, NAct) < 2) {
            alert("Next Activity Date must be Greater than Current Date");
            document.all.txtNextActDt.focus();
            return false;
        }

    }
  
    return true;


}

function OnInit(s, e) {
    var date = new Date();
    date.setHours(00);
    date.setMinutes(00);

    s.SetDate(date);
}

function validDispatch() {
    var date;
    var frmv;

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




    //if (cmbSubStatus.GetValue() == "" || cmbSubStatus.GetValue() == null) {
    //    alert("Please select Sub Status");
    //    cmbSubStatus.Focus();
    //    return false;
    //}
    if (cmbEngineer.GetValue() == "" || cmbEngineer.GetValue() == null) {

        alert("Please select Engineer1");
        cmbEngineer.Focus();
        return false;
    }

  //  alert(document.all.hdndispEngDate.value)
   /// below alert is working based on CRM Conifg by chandrasekar on 12th June 2017
    if (document.all.hdndispEngDate.value == "False") {
        //date = txtSchedDate.GetText();
        date = document.all.txtSchedDate.value;
        if (date == 'dd/MM/yyyy' || date == '') {
            alert('Display to Engineer On Can\'t be Empty');
           // txtSchedDate.Focus();
            return false;
        }
    }


    if (cmbEngineer1.GetValue() != "" || cmbEngineer1.GetValue() != null) {

        if (cmbEngineer.GetValue() == cmbEngineer1.GetValue()) {
            alert("Engineer1 and Engineer2 Should not be Same:");
            cmbEngineer1.Focus();
            return false;
        }
    }


    if (document.all.txtComments.value == "" || document.all.txtComments.value == null) {
        alert("Please enter Action Taken");
        // document.all.txtComments.Focus();
        return false;
    }

    return true;


}

