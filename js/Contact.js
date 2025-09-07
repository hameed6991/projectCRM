
function frmvalidation() {

   

    if (document.all.ddlsalutation.value == "") {
        alert("Please select Salutation..");
        return false;
    }


    if (document.all.txtname.value == "") {
        alert("Please Enter Name..");
        return false;
    }

    //alert(document.all.ASPxGridLookup2.value)
    //  alert(document.all.ASPxGridLookup1.value)
    //if(document.all.ASPxGridLookup1.value =="")
    if (gridLookup.GetValue() == "") {
        alert("Please select Department..");
        return false;
    }
    if (document.all.hdnShowDept.value == "") {
        alert("Please select Department..");
        return false;
    }

    //if (document.all.ASPxGridLookup2.value == "") {
    //    alert("Please select Designation..");
    //    return false;
    //}
    if (document.all.hdnShowDesg.value == "") {
        alert("Please select Designation..");
        return false;
    }

    if (document.all.txtmob1.value == "") {
        alert("Please Enter Mobile Number..");
        return false;

    }


    if (document.all.txtemail.value == "") {
        alert("Please Enter Email..");
        return false;

    }

    if (document.all.txtemail.value != "") {
        if (ValidateEmail(document.all.txtemail.value) == 0) {

            alert("Please Enter Valid Email..");
            return false;
        }
    }

    if (document.all.txtaltmail.value != "") {
        if (ValidateEmail(document.all.txtaltmail.value) == 0) {

            alert("Please Enter Valid Alternate Email..");
            return false;
        }
    }
    return true;
}



function ValidateEmail(inputText) {
    var x = inputText;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
        return 0;
    }
    else { return 1; }
}