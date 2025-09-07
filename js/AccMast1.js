
function showCM() {
    if (document.all.cmbLocation.value != "" && document.all.cmbTeam.value != "") {

        Loccode = document.all.cmbLocation.value
        RoCode = document.all.cmbTeam.value
        var ShowDet = window.showModalDialog("ShowCMDetails.asp?cmcode=" + Loccode + "&RcmCode=" + RoCode, null, 'dialogWidth=770Px;dialogHeight=350Px;status:no;')
        //window.open("ShowCMDetails.asp","Synergy","top=5,left=30,toolbars=no,maximize=yes,resize=yes,width=450,height=200,location=no,directories=no,scrollbars=yes");

    }
    else {
        if (document.all.cmbTeam.value == "") {
            alert("Pls Select the Region");
            //document.all.cmbTeam.focus();
            //return false;
        }

        else
            if (document.all.cmbLocation.value == "") {
                alert("Pls Select the Location");
                //document.all.cmbLocation.focus();
            }
    }
}

function popLoc() { // Function for displaying Location belonging to particular RO 

    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }
    var sURL = "getLoc.asp?RO=" + document.all.cmbTeam.value
    xml.open("POST", sURL, false);
    xml.send();
    var lsval = xml.responseText;

    l = document.all.cmbLocation.length;
    for (j = 0; j < l; j++) {
        document.all.cmbLocation.remove(0);
    }

    final = 0
    if (lsval != "") {
        obj = new Option();
        obj.text = "<-Select->";
        obj.value = "";
        document.all.cmbLocation.add(obj);

        tempsval = lsval.split("|");
        final = tempsval.length - 1;
    }

    for (i = 0; i < final; i++) {
        obj = new Option();
        lseng = tempsval[i].split("~");
        obj.text = lseng[1];
        obj.value = lseng[0];
        document.all.cmbLocation.add(obj);
    }
}



function showMulContNo() {
    checkstring(document.all.txtM_Phone)
    if (document.all.txtM_Phone.value != "") {
        if (document.all.hdnCNo.value != "")
            document.all.hdnCNo.value = repCNo(document.all.hdnCNo.value, document.all.txtM_Phone.value, document.all.txtContType.value)
        else
            document.all.hdnCNo.value = "1~" + document.all.txtM_Phone.value + "^" + document.all.txtContType.value + "^~"

    }

    site = document.all.txtSite.value

    var CNoobj = new Object()
    CNoobj.CNo = document.all.hdnCNo.value

    var primCNo = 0

    var strCNO = window.showModalDialog('MulCNOPopUp.asp?site=' + site, CNoobj, 'dialogWidth=370Px;dialogHeight=370Px;status:no;')
    if ((String(strCNO) != "undefined") && (String(strCNO) != "")) {
        document.all.hdnCNo.value = strCNO
        var arrCNO = new Array()
        var arrCNOtemp = new Array()
        arrCNO = strCNO.split("~")
        primCNO = parseInt(arrCNO[0])
        for (i = 1; i <= arrCNO.length; i++) {
            if (primCNO == i) {
                arrCNOtemp = arrCNO[i].split("^")
                document.all.txtM_Phone.value = arrCNOtemp[0]
                document.all.txtContType.value = arrCNOtemp[1]
            }
        }
    }

}


function showMulAdd() {
    checkstring(document.all.txtAccount)
    checkstring(document.all.txtAddress)
    checkstring(document.all.txtM_Phone)
    checkstring(document.all.txtCity)
    checkstring(document.all.txtSite)
    checkstring(document.all.txtSyn)
    checkstring(document.all.txtURL)
    checkstring(document.all.txtZip)


    if (document.all.txtM_Phone.value != "") {
        if (document.all.hdnCNo.value != "")
            document.all.hdnCNo.value = repCNo(document.all.hdnCNo.value, document.all.txtM_Phone.value, document.all.txtContType.value)
        else
            document.all.hdnCNo.value = "1~" + document.all.txtM_Phone.value + "^" + document.all.txtContType.value + "^~"

    }

    if (!isempty2(document.all.txtAccount, "Account"))
        return false;
}


function validform() {
    
  //  debugger;
   // alert(document.all.cmbGLList.value)
    //    checkstring(document.all.txtAccount)
    //    checkstring(document.all.txtBank)
    //    checkstring(document.all.txtAddress)
    //    checkstring(document.all.txtCity )
    //    checkstring(document.all.txtSite)
    //    checkstring(document.all.txtZip)
    //    checkstring(document.all.txtComments)
    //    


    //document.all.D_Accsitemast.value
    // alert(document.all.hdntablename.value)
    //   alert(document.all.D_Accsitemastfields.value)
    //   alert(document.all.D_Accsitemastfieldsname.value)
    //   alert(document.all.D_Accsitemastfieldtype.value)
    //   var lhlvalues = document.all.D_Accsitemastfields.value.split(";");
    //    var lhlfieldname = document.all.D_Accsitemastfieldsname.value.split(";");
    //   var lhlfieldtype = document.all.D_Accsitemastfieldtype.value.split(";");


    //return false;

    //    if (!isempty2(document.all.txtAccount,"Account Info - Account"))
    //    	return false;

    //    if (!isempty2(document.all.txtBank,"Account Info - Account Group"))
    //    	return false;

    //commented while convert to aspx page
    //    if (!isempty2(document.all.txtSiteId,"Account Info - Site ID"))
    //    	return false;
    //alert("test1") 

    //  document.all.hdnAccount1.value =txtAccount.GetText();
    //  alert(document.all.hdnAccount1.value)
    //alert(RowCount);

    //Commented by mukesh 260717
    //document.getElementById("hdnshipaddress").value = "";

    //for (var i = 0; i < RowCount; i++) {
    //    if (aAddress[i] != "") {

    //        document.all.hdnshipaddress.value += acityval[i] + "~" + apinval[i] + "~" + aAddress[i] + "~" + aStateval[i] + "#";

    //    }
    //} //Commented by mukesh 260717
    
        if (txtAccount.GetText() == "" || txtAccount.GetText() == null) {
            alert("Please select the Account Info - Account");
            txtAccount.Focus();
            return false;
        }


        if (document.all.txtSite.value == "") {
            alert("Please select the Account Info - Site");
            document.all.txtSite.focus();
            return false;
        }
        if (document.all.cmbAccType.value == "") {
        	alert("Please select the Account Info - Type");
        	document.all.cmbAccType.focus();
        	return false;
        }

       // Added by koripriyan on August 18 2018
        if (document.all.txtSiteId.value == "" && document.getElementById("hdnchksiteidmandatory").value=="1") {
            alert("Please select the Account Info - " + document.all.hdnlblFiled5.value + "  ");
            document.all.txtSiteId.focus();
            return false;
        }
      // Ended by koripriyan

        //if (document.all.cmbAccType.value == "") {
        //    alert("Please select the Account Info - Account Type");
        //    //document.all.txtSite.focus();
        //    return false;
        //}
        if (document.all.cmbIndustry.value == "") {
            alert("Please select the Account Info - Industry");
            document.all.cmbIndustry.focus();
            return false;
        }
      
        if (document.all.hdnFiled1.value == "true") {
            if (document.all.hdncal1.value == "varchar") {
                
                if (document.all.txtfield1.value == "") {

                    alert("Please enter the " + document.all.hdnlblFiled1.value + " ");
                    document.all.txtfield1.focus();
                    return false;
                }
                //This for SPl characters check
                //else {
                //    var value = document.getElementById("txtfield1").value;
                   
                //    if (/[^a-z\s][^A-Z\s][^0-9]+$/.test(value) ) {
                //        alert('Enter Only Alphanumeric value');
                //        return false;
                //    }
                   
                //}
            }

            else if (document.all.hdncal1.value == "numeric") {

                if (document.all.txtfield1.value == "") {

                    alert("Please enter the " + document.all.hdnlblFiled1.value + "");
                    document.all.txtfield1.focus();
                    return false;
                }
                else {
                    var value = document.getElementById("txtfield1").value;

                    if (isNaN(value)) {
                        alert("Enter Only numeric value");
                        document.all.txtfield1.focus();
                        return false;
                    }
                }


            }
            else {
                
                if (document.all.txtfield1.value == "") {
                    
                    alert("Please enter the " + document.all.hdnlblFiled1.value + " ");
                    document.all.txtfield1.focus();
                    return false;
                }
                else {
                    var value = document.getElementById("txtfield1").value;
                    if (!value.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/))
                    {
                        alert('date format is wrong');
                        document.all.txtfield1.focus();
                        return false;
                    }
                }
            }
        }
            
        
            if (document.all.hdnFiled2.value == "true") {
                if (document.all.hdncal2.value == "varchar") {
                    if (document.all.txtfield2.value == "") {
                        alert("Please enter the " + document.all.hdnlblFiled2.value + " ");
                        document.all.txtfield2.focus();
                        return false;
                    }
                    //This for SPl characters check
                    //else {
                    //    var value = document.getElementById("txtfield2").value;

                    //    if (/[^a-z\s][^A-Z\s][^0-9]+$/.test(value)) {
                    //        alert('Enter Only Alphanumeric value');
                    //        document.all.txtfield2.focus();
                    //        return false;
                    //    }

                    //}
                }
        
                else if (document.all.hdncal2.value == "numeric") {
                    if (document.all.txtfield2.value == "") {
                        alert("Please enter the " + document.all.hdnlblFiled2.value + " ");
                        document.all.txtfield2.focus();
                        return false;
                    }
                    else {
                        var value = document.getElementById("txtfield2").value;

                        if (isNaN(value)) {
                            alert("Enter Only numeric value");
                            document.all.txtfield2.focus();
                            return false;
                        }
                    }
                }
                else {
                    if (document.all.txtfield2.value == "") {
                        alert("Please enter the " + document.all.hdnlblFiled2.value + " ");
                        document.all.txtfield2.focus();
                        return false;

                    }
                    else {
                        var value = document.getElementById("txtfield2").value;
                        if (!value.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/)) {
                            alert('date format is wrong');
                            document.all.txtfield2.focus();
                            return false;
                        }
                    }
                }
            }
            
            if (document.all.hdnFiled3.value == "true") {
                if (document.all.hdncal3.value == "varchar") {
                    if (document.all.txtfield3.value == "") {
                        alert("Please enter the " + document.all.hdnlblFiled3.value + " ");
                        document.all.txtfield3.focus();
                        return false;
                    }
                    //This for SPl characters check
                    //else {
                    //    var value = document.getElementById("txtfield3").value;

                    //    if (/[^a-z\s][^A-Z\s][^0-9]+$/.test(value)) {
                    //        alert('Enter Only Alphanumeric value');
                    //        document.all.txtfield3.focus();
                    //        return false;
                    //    }

                    //}
                }
        
                else if (document.all.hdncal3.value == "numeric") {
                    if (document.all.txtfield3.value == "") {
                        alert("Please enter the " + document.all.hdnlblFiled3.value + " ");
                        document.all.txtfield3.focus();
                        return false;
                    }
                    else {
                        var value = document.getElementById("txtfield3").value;

                        if (isNaN(value)) {
                            alert("Enter Only numeric value");
                            document.all.txtfield3.focus();
                            return false;
                        }
                    }
                   
                }
                else {
                    if (document.all.txtfield3.value == "") {
                        alert("Please enter the " + document.all.hdnlblFiled3.value + " ");
                        document.all.txtfield3.focus();
                        return false;
                    }
                    else {
                        var value = document.getElementById("txtfield3").value;
                        if (!value.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/)) {
                            alert('date format is wrong');
                            document.all.txtfield3.focus();
                            return false;
                        }
                    }
                }
            }
            
            if (document.all.hdnFiled4.value == "true") {
                if (document.all.hdncal4.value == "varchar") {
                    if (document.all.txtfield4.value == "") {
                        alert("Please enter the " + document.all.hdnlblFiled4.value + " ");
                        document.all.txtfield4.focus();
                        return false;
                    }
                    //This for SPl characters check
                    //else {
                    //    var value = document.getElementById("txtfield4").value;

                    //    if (/[^a-z\s][^A-Z\s][^0-9]+$/.test(value))
                    //    {
                    //        alert('Enter Only Alphanumeric value');
                    //        document.all.txtfield4.focus();
                    //        return false;
                    //    }

                    //}
                }
        
                else if (document.all.hdncal4.value == "numeric") {
                    if (document.all.txtfield4.value == "") {
                        alert("Please enter the " + document.all.hdnlblFiled4.value + " ");
                        document.all.txtfield4.focus();
                        return false;
                    }
                    else {
                        var value = document.getElementById("txtfield4").value;

                        if (isNaN(value)) {
                            alert("Enter Only numeric value");
                            document.all.txtfield4.focus();
                            return false;
                        }
                    }
                }
                else {
                    if (document.all.txtfield4.value == "") {
                        alert("Please enter the " + document.all.hdnlblFiled4.value + " ");
                        document.all.txtfield4.focus();
                        return false;
                    }
                    else {
                        var value = document.getElementById("txtfield4").value;
                        if (!value.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/)) {
                            alert('date format is wrong');
                            document.all.txtfield4.focus();
                            return false;
                        }
                    }
                }
            }
        
        

                    if (!isempty2(document.all.txtAddress, "Account Info - Address"))
                    {
                        document.all.txtAddress.focus();
                        return false;
                    }

                    if (document.all.txtAddress.value.length > 250) {
                        alert("Account Info - Address Cannot be Greater than 250 Characters")
                        document.all.txtAddress.focus();
                        return false;
                    }

                    if (document.all.txtgstin.value != "") {
                        if (document.all.txtgstin.value.length != 15) {
                            alert("GSTIN Should be 15 Characters")
                            document.all.txtgstin.focus();
                            return false;
                        }
                    }

                    if (document.all.txtComments.value != "") {
                        if (document.all.txtComments.value.length > 250) {
                            alert("Account Info - Comments Cannot be Greater than 250 Characters")
                            document.all.txtComments.focus();
                            return false;
                        }
                    }

                    if (!isempty2(document.all.txtPincode, "Pincode"))
                    {
                        document.all.txtPincode.focus();
                        return false;
                    }
		
                    if (!isempty2(document.all.txtCity, "City"))
                    {
                        document.all.txtCity.focus();
                        return false;
                    }
		

                    if (document.all.cmbState.value == "") {
                        alert("Please select the Account Info - State");
                        document.all.cmbState.focus();
                        return false;
                    }


                    //if (document.all.cmbCountry.value == "") {
                    //    alert("Please select the Account Info - Country");
                    //    return false;
                    //}
                    //if (document.getElementById("hdnshipaddress").value == "")
                    //{
                    //    alert("Please select Shipping Address");
                    //    return false;
                    //}

                    if (document.all.cmbRegion.value == "") {
                        alert("Please select the Account Info - Region");
                        document.all.cmbRegion.focus();
                        return false;
                    }

                    if (document.all.cmbLocation.value == "") {
                        alert("Please select the Account Info - Location");
                        document.all.cmbLocation.focus();
                        return false;
                    }

                    //if (document.all.cmbGLList.value == "") {
                    //    alert("Please select the  Account Info - Group Leader");
                    //    document.all.cmbGLList.focus();
                    //    return false;
                    //}

                    var resp1 = "";
                    var resp2 = "";
                    var reso1 = "";
                    var reso2 = "";





                    if (document.all.cmbAccessibilityType.value == "Specific") {
                        if (document.all.txtAccessibilityFrom.value != "00:00") {
                            h = document.all.txtAccessibilityFrom.value.search(":")
                            if (h != 2) {
                                alert("Invalid Time; Account Info - Accessibility From");
                                return false;
                            }
                            var resptime = document.all.txtAccessibilityFrom.value.split(":")
                            if (resptime[2] == "") {
                                alert("Invalid Time; Account Info - Accessibility From");
                                return false;
                            }
                            resp1 = resptime[0];
                            resp2 = resptime[1];
                            if (resp1 == "") {
                                alert("Invalid Time; Account Info - Accessibility From");
                                return false;
                            }
                            if (resp2 == "") {
                                alert("Invalid Time; Account Info - Accessibility From");
                                return false;
                            }
                            if (resp2 > 59) {
                                alert("Invalid Time; Account Info - Accessibility From");
                                return false;
                            }
                        }
                        else {
                            alert("Account Info - Accessibility Time From Can't be Empty");
                            document.all.txtAccessibilityFrom.focus();
                            return false;
                        }

                        if (document.all.txtAccessibilityTo.value != "00:00") {
                            h = document.all.txtAccessibilityTo.value.search(":")
                            if (h != 2) {
                                alert("Invalid Time; Account Info - Accessibility From");
                                return false;
                            }
                            var resotime = document.all.txtAccessibilityTo.value.split(":")
                            if (resotime[2] == "") {
                                alert("Invalid Time; Account Info - Accessibility From");
                                return false;
                            }
                            reso1 = resotime[0];
                            reso2 = resotime[1];
                            if (reso1 == "") {
                                alert("Invalid Time; Account Info - Accessibility From");
                                return false;
                            }
                            if (reso2 == "") {
                                alert("Invalid Time; Account Info - Accessibility From");
                                return false;
                            }
                            if (reso2 > 59) {
                                alert("Invalid Time; Account Info - Accessibility From");
                                return false;
                            }
                        }
                        else {
                            alert("Account Info - Accessibility To Can't be Empty");
                            document.all.txtAccessibilityTo.focus();
                            return false;
                        }


                        if (parseInt((parseFloat(resp1) * 60 + parseFloat(resp2))) > parseInt((parseFloat(reso1) * 60 + parseFloat(reso2)))) {
                            alert("Account Info - Accessibility Time To should be greater than Accessibility Time From");
                            return false;
                        }
                    }
                    else if (document.all.cmbAccessibilityType.value == "") {
                        alert("Please Select Account Info - Accessibility");
                        return false;
                    }

                    ///COMMENT BY SEKAR FOR SITE INFO

                    var lhlvalues = document.all.D_Accsitemastfields.value.split(";");
                    var lhlfieldname = document.all.D_Accsitemastfieldsname.value.split(";");
                    var lhlfieldtype = document.all.D_Accsitemastfieldtype.value.split(";");

                    for (i = 0; i < lhlvalues.length - 1; i++) {
                        if (document.all(lhlvalues[i]).value == "") {
                            if (lhlfieldtype[i].indexOf("D_Down") != -1) {
                                alert("Please Select Site Info - " + lhlfieldname[i]);
                            }
                            else {
                                alert("Please Enter Site Info - " + lhlfieldname[i]);
                            }
                            //document.all(lhlvalues[i]).focus();
                            return false;
                        }
                    }

                    //END////
                    //////	 if(document.all.auto_D_AccsitemastAccessibility.value=="Specific")
                    //////	 {
                    //////	    if(document.all.auto_D_AccsitemastAccessibility_Time_From.value=="")
                    //////	    {
                    //////	        alert("From Accessibility Time cant be empty");
                    //////	        return false;
                    //////	    }
                    //////	    if(document.all.auto_D_AccsitemastAccessibility_Time_To.value=="")
                    //////	    {
                    //////	        alert("To Accessibility Time cant be empty");
                    //////	        return false;
                    //////	    }
                    //////    }

       

                    ///COMMENT BY SEKAR FOR SITE INFO
                    lhlvalues = document.all.D_Accsitemastdatefields.value.split(";");
                    lhlfieldname = document.all.D_Accsitemastdatefieldsname.value.split(";");
                    var lhldatetype = document.all.D_Accsitemastdatetype.value.split(";");


                    for (i = 0; i < lhlvalues.length - 1; i++) {
                        if (document.all(lhlvalues[i]).value != "") {
                            if (lhldatetype[i] == "rtndateonly1") {
                                if (rtndateonly2(document.all(lhlvalues[i]), "Site Info - " + lhlfieldname[i]) == false) {
                                    return false;
                                }
                            }
                            else {
                                if (rtndatetime2(document.all(lhlvalues[i]), "Site Info - " + lhlfieldname[i]) == false) {
                                    return false;
                                }
                            }
                        }
                    }

                    lhlvalues = document.all.D_Accsitemastlnkfields.value.split(";");
                    lhlfieldname = document.all.D_Accsitemastlnkfieldsname.value.split(";");

                    for (i = 0; i < lhlvalues.length - 1; i++) {
                        if (document.all(lhlvalues[i]).value != "") {
                            if (document.all(lhlvalues[i]).value.length > document.all("hdn" + lhlvalues[i]).value) {
                                alert("Site Info - " + lhlfieldname[i] + " can not be greater than " + document.all("hdn" + lhlvalues[i]).value);
                                return false;
                            }
                        }
                    }
                    //////END/////////
       
                    document.all.hdnRocode.value = document.all.cmbRegion.value
                    document.all.hdnLocationCode.value = document.all.cmbLocation.value
                    document.all.hdnGLCode.value = document.all.cmbGLList.value
                    document.all.hdnAcctype.value = document.all.cmbAccType.value
                    document.all.hdnindustry.value = document.all.cmbIndustry.options[document.all.cmbIndustry.selectedIndex].text
                    document.all.hdnAccount1.value = txtAccount.GetText();
                    document.all.hdncmbGroup.value = document.all.cmbAcctGroup.value
                    document.all.hdnacceessibility.value = document.all.cmbAccessibilityType.value
                    // document.all.hdnGLCode.value = document.getElementById("cmbGLList").value
       
                    //alert(document.all.hdnLocationCode.value)
                    // alert(document.all.hdnAcctype.value)
                    // alert(document.all.hdnindustry.value)
                    return true;
                }

                function ShowAccountGroup(param1, param2) {
                    var rtnvalues;
                    var lhlpvalues

                    rtnvalues = window.showModalDialog("SearchAccountTeam.asp?switch=accteam&Account=" + document.all.txtAccGroup.value, null, "dialogWidth=750Px;dialogHeight=450Px;status:no;")
                    var c;
                    if (String(rtnvalues) != "undefined") {
                        c = rtnvalues.split("|");
                        document.all.hdnAccGroup.value = c[0];
                        document.all.txtAccGroup.value = c[1];

                        //document.all.hdnAccount.value=c[1];
                        //document.all.txtAccount.value=c[1];
                    }
                }


                function ShowCircleGroup() {
                    var rtnvalues;
                    var lhlpvalues

                    //rtnvalues = window.showModalDialog("SearchZone.asp?switch=accteam&Account="+ document.all.txtzonalcode.value,null,"dialogWidth=750Px;dialogHeight=450Px;status:no;")
                    rtnvalues = window.showModalDialog("SearchZone.aspx?switch=accteam&Account=" + document.all.txtzonalcode.value, null, "dialogWidth=800Px;dialogHeight=450Px;status:no;")

                    var c;
                    if (String(rtnvalues) != "undefined") {
                        c = rtnvalues.split("|");

                        document.all.hdncircleCode.value = c[0];
                        document.all.txtzonalcode.value = c[0];
                    }
                }

                function Shownsb() {
                    var rtnvalues;
                    var lhlpvalues
                    rtnvalues = window.showModalDialog("SearchNSB.aspx?switch=accteam&Account=" + document.all.txtnsbid.value, null, "dialogWidth=850Px;dialogHeight=450Px;status:no;")
                    var c;
                    if (String(rtnvalues) != "undefined") {
                        c = rtnvalues.split("|");

                        document.all.hdnnsbCode.value = c[0];
                        document.all.txtnsbid.value = c[0];
                    }
                }

                function ShowAccountGroup1() {
                    var rtnvalues;
                    var lhlpvalues

                    rtnvalues = window.showModalDialog("SearchAccountTeam.asp?switch=account&Account=" + document.all.txtAccount.value, null, "dialogWidth=450Px;dialogHeight=450Px;status:no;")
                    var c;
                    if (String(rtnvalues) != "undefined") {
                        c = rtnvalues.split("|");

                        document.all.hdnAccGroup.value = c[0];
                        document.all.txtAccGroup.value = c[0];
                        document.all.hdnAccount.value = c[1];
                        document.all.txtAccount.value = c[1];

                    }
                }

                function module(mod, tb) {
                    document.all.hdnmodule.value = mod;
                    document.all.hdntablename.value = tb;
                }
                function showEntitlement() {
                    //showEntInfo("A",document.all.hdnAccCode.value,document.all.hdnSiteCode.value)
                    window.showModalDialog("showEntitle.asp?siteid=" + document.all.txtSiteId.value, null, "dialogWidth=650px;dialogHeight=350px;status=no;Left=120px;Top=150px")
                }



                function Showttach() {
                    window.showModalDialog("PopbankAttachment.asp?AccountCode=" + document.all.hdnAccCode.value + "&Summary=True&logid=" + document.all.logid.value, null, "dialogHeight=300Px;dialogWidth=550Px;status:no")
                    window.location.reload()

                }
                function AddAtm() {
                    window.showModalDialog("addpurchase.asp", null, "dialogHeight=400Px;dialogWidth=720Px;status:no")
                    window.location.reload()

                }
                function Attachfile(Attachcode, k) {
                    filename = document.all("hdnFileName" + k).value
                    actfilename = document.all("hdnActFileName" + k).value

                    document.frmSR.action = "download.asp?file=" + filename + "&clientfile=" + actfilename + "&Mode=1"
                    document.frmSR.submit()

                }

                function exportReport() {
                    document.all.hdnExport.value = "True"
                    document.frmSR.submit()
                }


                function EditSr() {

                    WinVal = window.showModalDialog("popupmdaccount.aspx?acccode=" + document.all.hdnAccCode.value + "&Summary=True&logid=" + document.all.logid.value, null, "dialogHeight=380Px;dialogWidth=870Px;status:no")
                    window.location.reload()
                }
                function Showbranch() {
                    var rtnvalues;
                    var lhlpvalues

                    rtnvalues = window.showModalDialog("SearchBranchID.aspx?switch=accteam&Account=" + document.all.txtbranchcode.value, null, "dialogWidth=850Px;dialogHeight=450Px;status:no;")
                    var c;
                    if (String(rtnvalues) != "undefined") {
                        c = rtnvalues.split("|");

                        document.all.hdnbranchCode.value = c[0];
                        document.all.txtbranchcode.value = c[0];
                    }
                }

                function checkNum(eveval) {
                    if (eveval < 48 || eveval > 57) {
                        event.keyCode = 0;
                        return false;
                    }
                }

                function fnBindLocation() {
                    if (window.XMLHttpRequest) {
                        // code for all new browsers
                        xml = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        // code for IE5 and IE6
                        xml = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    if (document.getElementById("cmbRegion").value != "") {
                        var sURL = "WebRequest.asmx/GetLocation"
                        xml.open("POST", sURL, false);
                        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        var str = "Rocode=" + document.getElementById("cmbRegion").value;
                        xml.send(str)
                        lsval = xml.responseText;
                    }
                    fnBindDropDown("cmbLocation");
                }

                function fnBindLocation1() {
                    if (window.XMLHttpRequest) {
                        // code for all new browsers
                        xml = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        // code for IE5 and IE6
                        xml = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    if (document.getElementById("cmbRegion").value != "") {
                        var sURL = "WebRequest.asmx/GetLocation"
                        xml.open("POST", sURL, false);
                        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        var str = "Rocode=" + document.getElementById("cmbRegion").value;
                        xml.send(str)
                        lsval = xml.responseText;
                    }
                    fnBindDropDown("cmbLocation");
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

                //commented by chandrasekar for didnt use industry (22032017)
                //function ShowCategory()
                //{
                //	
                //if (window.XMLHttpRequest) 
                //	{
                //		// code for all new browsers
                //		xml=new XMLHttpRequest(); 
                //	}
                //	else if (window.ActiveXObject) 
                //	{
                //		// code for IE5 and IE6
                //		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
                //	}
                //    if(document.getElementById("cmbIndustry").value!="")
                //    {
                //        var sURL = "WebRequest.asmx/GetCustomercat"
                //        //GetCustomer
                //        xml.open( "POST", sURL, false );
                //        
                //        xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                //        var str="Category=" +  document.getElementById("cmbIndustry").value;
                //       // alert(str);
                //        xml.send(str)
                //        lsval=xml.responseText;
                //        //alert(lsval)
                //       document.all.txtCategory.value=lsval;
                //    }
                //    
                //    else
                //    {
                //     document.all.txtCategory.value="";
                //    }
                //  
                //   // fnBindDropDown("cmbLocation");
                //	

                //    

                //}

                function fnBindBank() {
                    if (window.XMLHttpRequest) {
                        // code for all new browsers
                        xml = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        // code for IE5 and IE6
                        xml = new ActiveXObject("Microsoft.XMLHTTP");
                    }


                    if (document.getElementById("txtAccount").value != "") {
                        var sURL = "WebService/ServiceRequest.asmx/GetBank"
                        xml.open("POST", sURL, false);
                        xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        var str = "AccountName=" + document.getElementById("txtAccount").options[document.getElementById("txtAccount").selectedIndex].tagValue;

                        xml.send(str)
                        lsval = xml.responseText;
                    }
                    fnBindDropDown("txtBank");
                }



                //added by thiru for Filling State from Google API
                function GetState_GoogleAPI() {
                    if (document.getElementById("txtCity").value != "" && document.getElementById("txtCity").value != document.getElementById("hdnCity").value) {
                        document.getElementById("hdnCity").value = document.getElementById("txtCity").value;
                        try {
                            var city = document.getElementById("txtCity").value;
                            city = city + "+India";
                            var state = "";
                            var country = "";
                            var geocoder = new google.maps.Geocoder();
                            geocoder.geocode({ 'address': city }, function (result, status) {
                                if (status == google.maps.GeocoderStatus.OK) {
                                    for (var component in result[0]['address_components']) {
                                        for (var i in result[0]['address_components'][component]['types']) {
                                            if (result[0]['address_components'][component]['types'][i] == "administrative_area_level_1") {
                                                state = result[0]['address_components'][component]['long_name'];
                                                lsval = state + "|" + state + "^^^";
                                                fnBindDropDown_GoogleAPI("cmbState")
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
                        if (document.getElementById("txtCity").value == "") {
                            fnGetState();
                        }

                    }
                }


                function GetState_GoogleAPI2() {
                    if (document.getElementById("txtsCity").value != "" && document.getElementById("txtsCity").value != document.getElementById("hdnsCity").value) {
                        document.getElementById("hdnsCity").value = document.getElementById("txtsCity").value;
                        try {
                            var city = document.getElementById("txtsCity").value;
                            city = city + "+India";
                            var state = "";
                            var country = "";
                            var geocoder = new google.maps.Geocoder();
                            geocoder.geocode({ 'address': city }, function (result, status) {
                                if (status == google.maps.GeocoderStatus.OK) {
                                    for (var component in result[0]['address_components']) {
                                        for (var i in result[0]['address_components'][component]['types']) {
                                            if (result[0]['address_components'][component]['types'][i] == "administrative_area_level_1") {
                                                state = result[0]['address_components'][component]['long_name'];
                                                lsval = state + "|" + state + "^^^";
                                                fnBindDropDown_GoogleAPI("ddlshipstate")
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

                        if (document.getElementById("txtsCity").value == "") {
                            fnGetState();
                        }
                    }
                }
                //added by thiru for Filling State from Google API
                function GetState_GoogleAPIPincode() {
        

                    if (document.getElementById("txtPincode").value == "")
                    {
                        document.getElementById("txtCity").value="";
                    }



                    if (document.getElementById("txtPincode").value != "" && document.getElementById("txtPincode").value != document.getElementById("hdnpincode").value) {
                        //alert('affect1')
                        document.getElementById("txtPincode").value = document.getElementById("txtPincode").value;
                        try {
                            var city = document.getElementById("txtPincode").value;
                            document.all.txtCity.value = "";
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
                                                    document.all.txtCity.value = city1;
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
                        if (document.getElementById("txtPincode").value == "") {
                            fnGetState();
                        }

                    }
                }
                function GetState_GoogleAPIPincode2() {
                    if (document.getElementById("txtsPincode").value != "" && document.getElementById("txtsPincode").value != document.getElementById("hdnspincode").value) {
                        //    document.getElementById("txtsPincode").value = document.getElementById("txtsPincode").value;

                        try {
                            var city = document.getElementById("txtsPincode").value;
                            document.all.txtsCity.value = "";
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
                                                fnBindDropDown_GoogleAPI("ddlshipstate")
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
                                                    document.all.txtsCity.value = city1;
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
                        if (document.getElementById("txtPincode").value == "") {
                
                            fnGetState();
                            document.all.txtCity.value = "";
               
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
                    fnBindDropDown("ddlshipstate");
                }
                function fnBindDropDown_GoogleAPI(cmbDropDown) {
                    var optn_GoogleAPI = document.createElement("option");
                    document.getElementById(cmbDropDown).options.length = 0;

                    if (lsval != "") {
                        var arReceived_GoogleAPI = lsval.split("^^^");
                        for (i = 0; i < arReceived_GoogleAPI.length - 1; i++) {
                            var arToBind_GoogleAPI = arReceived_GoogleAPI[i].split("|");
                            optn_GoogleAPI = document.createElement("option");
                            optn_GoogleAPI.text = arToBind_GoogleAPI[0];
                            optn_GoogleAPI.value = arToBind_GoogleAPI[1];
                            document.getElementById(cmbDropDown).options.add(optn_GoogleAPI);
                        }
                    }
                }



                //End here

                //function fnHubLocation()
                //{
                //	if (window.XMLHttpRequest) 
                //	{
                //		// code for all new browsers
                //		xml=new XMLHttpRequest(); 
                //	}
                //	else if (window.ActiveXObject) 
                //	{
                //		// code for IE5 and IE6
                //		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
                //	}
                //    if(document.getElementById("cmbLocation").value!="")
                //    {
                //        var sURL = "WebService/ServiceRequest.asmx/GetHubLocation"
                //        xml.open( "POST", sURL, false );
                //        xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                //        var str="LocationCode=" +  document.getElementById("cmbLocation").value;
                //        xml.send(str)
                //        lsval=xml.responseText;
                //    }
                //    fnBindDropDown("cmbHubLocation");
                //}

                //function fnSubLocation()
                //{
                //	if (window.XMLHttpRequest) 
                //	{
                //		// code for all new browsers
                //		xml=new XMLHttpRequest(); 
                //	}
                //	else if (window.ActiveXObject) 
                //	{
                //		// code for IE5 and IE6
                //		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
                //	}
                //    if(document.getElementById("cmbHubLocation").value!="")
                //    {
                //        var sURL = "WebService/ServiceRequest.asmx/GetSubLocation"
                //        xml.open( "POST", sURL, false );
                //        xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                //        var str="HubLocationCode=" +  document.getElementById("cmbHubLocation").value;
                //        xml.send(str)
                //        lsval=xml.responseText;
                //    }
                //    fnBindDropDown("cmbSubLocation");
                //}
