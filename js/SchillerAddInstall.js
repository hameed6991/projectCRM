 

function showAddProd()
{
	
    if (document.all.cmbProdLine.value == "")
    {
        alert("Pls select Product Line from the list !");
        document.all.cmbProdLine.focus();
    }
    else  
    {  	
        PCode =document.all.cmbProdLine.value;
        var strProdList;
        var objProdList = new Object();
        var objRtnVal = new Object();

        objProdList.DataString = document.frmpurchase.hdnProdList.value;
		
        if (window.showModalDialog) {

            var objRtnVal = window.showModalDialog('ProductsPopUp.asp?PCode=' + PCode, objProdList, 'dialogWidth=700Px;dialogHeight=430Px;status:no;')
        }
        else {
            winVal = window.open('ProductsPopUp.asp?PCode=' + PCode, objProdList, "height=460Px,width=690Px,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=yes,top=100,left=400");
        }



        if (String(objRtnVal) != "undefined")
        {
            strProdList = objRtnVal
            if (strProdList != "")  		
            { document.frmpurchase.hdnProdList.value = strProdList;}
        } 
	
    }

}

function receiveAddWarranty(value) {

    if (value != "undefined") {

        var strWarrList;
        var objWarrList = new Object();
 


        if (String(value) != "undefined") {
            strWarrList = value
            if (strWarrList != "") {
                document.frmpurchase.hdnwarrList.value = strWarrList;
            }
        }
        
    }

}


function showAddWarr()
{
    var strWarrList;
    var objWarrList = new Object();
    var objRtnVal1 = new Object();

    if (document.all.txtWarrantyStart.value=="")
    {
        alert("Enter the Warranty Start Date...")
        document.all.txtWarrantyStart.focus();
        return false;
    } 
    if (rtndateonly1(document.all.txtWarrantyStart,"Warranty Start Date") == false )
    {  
        return false;
    }	

    if (document.all.txtWarrantyEnd.value=="")
    {
        alert("Enter the Warranty End Date...")
        document.all.txtWarrantyEnd.focus();
        return false;
    } 
    if (rtndateonly1(document.all.txtWarrantyEnd,"Warranty End Date") == false )
    {  
        return false;
    }	
  
    frmv=checkdatevalue(document.all.txtWarrantyStart.value,document.all.txtWarrantyEnd.value)
    if (frmv==1)
    {
        alert("Warranty End Date cannot be lesser than Warranty Start Date ...");
        document.all.txtWarrantyEnd.focus()
        return false;
    }


    objWarrList.DataString = document.frmpurchase.hdnwarrList.value;
	


    if (window.showModalDialog) {

        var objRtnVal1 = window.showModalDialog('WarrantyPopUp.asp?StartDate=' + document.all.txtWarrantyStart.value + '&EndDate=' + document.all.txtWarrantyEnd.value, objWarrList, 'dialogWidth=700Px;dialogHeight=430Px;status:no;')
    }
    else {
        winVal = window.open('WarrantyPopUp.asp?StartDate=' + document.all.txtWarrantyStart.value + '&EndDate=' + document.all.txtWarrantyEnd.value, objWarrList, 'height=460Px,width=680Px,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=yes,top=100,left=400');
    }



    if (String(objRtnVal1) != "undefined")
    {
        strWarrList = objRtnVal1
        if (strWarrList != "")  		
        { 
            document.frmpurchase.hdnwarrList.value = strWarrList;
        }
    } 
}

function Validform() {

 
    /* if (!isempty(document.all.txtPIINo,"Invoice #"))
	return false; 
	
	if (!isempty(document.all.txtPIIDate,"Invoice Date"))
	return false;
			frmv=rtndateonly1(document.all.txtPIIDate,"Invoice Date");
 			 if (frmv==false)
 			{return false;}
	if (!isempty(document.all.txtVIFNo,"Dispatch Reference #"))
	return false;*/
    if (!isempty(document.all.txtVIFDate, "Dispatch Reference Date"))
        return false;
    frmv = rtndateonly1(document.all.txtVIFDate, "Dispatch Reference Date");
    if (frmv == false)
    { return false; }


    frmv = checkdatevalue(document.all.txtVIFDate.value, document.all.hdndatenow.value)
    if (frmv == 1) {
        alert("Dispatch Reference Date cannot be greater than Current Date ...");
        return false;
    }


    if (!isempty(document.all.txtPONo, "Pondy Reference #"))
        return false;
    if (!isempty(document.all.txtPODate, "Pondy Reference Date"))
        return false;

    frmv = rtndateonly1(document.all.txtPODate, "Pondy Reference Date");
    if (frmv == false)
    { return false; }

    if (!isempty(document.all.txtInsDate, "Install Date"))
        return false;
    frmv = rtndateonly1(document.all.txtInsDate, "Install Date");
    if (frmv == false)
    { return false; }


    frmv = checkdatevalue(document.all.txtInsDate.value, document.all.hdndatenow.value)
    if (frmv == 1) {
        alert("Install Date cannot be greater than Current Date ...");
        return false;
    }




    if (document.all.txtWarrantyCard.value == "") {
        alert(" Enter the Warranty Card...");
        document.all.txtWarrantyCard.focus()
        return false;
    }



    if (document.all.cmbWarCard.value == "" && document.all.hdnWarrantyCardUser.value == "") {
        alert("Warranty Card Recieved should be selected")
        document.all.cmbWarCard.focus()
        return false;
    }


    /*if (document.all.cmbPymtDetail.value=="")
	{
	alert("Payment Details should be selected")
	document.all.cmbPymtDetail.focus()
	return false;
	}*/
    if (document.all.cmbProdLine.value == "") {
        alert("Product Line should be selected")
        document.all.cmbProdLine.focus()
        return false;
    }

    if (!isempty(document.all.txtProduct, "Product"))
        return false;


    if (document.all.hdnprodcode.value == "") {
        alert("Use Help! To Select Product")
        document.all.txtProduct.focus()
        return false;
    }

    if (document.all.cmbSpl.value == "") {
        alert("Specialist Can't be empty")
        document.all.cmbSpl.focus()
        return false;
    }


    /*if (!isempty(document.all.txtApplication,"Application"))
	return false;*/
    if (document.all.txtApplication.value.length > 500) {
        alert("Remarks Cannot be Greater than 500 Characters")
        document.all.txtApplication.focus()
        return false;
    }




    if (!isempty(document.all.txtSerial, "Serial #"))
        return false;


    if (document.all.hdnacccode.value == "") {
        alert("Pls select Account from Help engine")
        return false;
    }
 
  

    if (!isempty(document.all.txtContact, "Contact"))
        return false;
    if (!isempty(document.all.txtDesignation, "Designation"))
        return false;
    if (!isempty(document.all.txtDepartment, "Department"))
        return false;

   
    
    //if (document.all.txtgroup.value == "") {
    //    alert("Branch Should Be Selected")
    //    document.all.txtgroup.focus()
    //    return false;
    //}

    //if (document.all.cmbengcode.value == "") {
    //    alert("Engineer Should Be Selected")
    //    document.all.cmbengcode.focus()
    //    return false;
    //}
    
    if (document.all.cmbsubstatus.value == "<-Select->") {
        alert("Sub Status Should be Selected");
        document.all.cmbsubstatus.focus()
        return false;
    }

    if (document.all.cmbStatus.value == "") {
        alert("Status Should be Selected");
        document.all.cmbStatus.focus()
        return false;
    }

    
 
    
    var n = document.all.txtSerial.value.length
    flg = false
    for (i = 0; i < n; i++) {
        if (document.all.txtSerial.value.charCodeAt(i) == 32)
            flg = true
        else {
            flg = false
            break
        }
    }
    if (flg == true) {
        document.all.txtSerial.value = ""
    }


    //end by coding	
    if (document.all.cmbsubstatus.value == "<-Select->" || document.all.cmbsubstatus.value == "") {
        alert("Sub Status Should be Selected");
        document.all.cmbsubstatus.focus()
        return false;
    }
 

    if (document.all.hdnSchDetails.value != "") {
        temp = document.all.hdnSchDetails.value
        arrtemp = temp.split("|")
        if (arrtemp[0] == "") {
            document.all.hdnSchDetails.value = ""
        }

        if (arrtemp[0] != "") {
            if (arrtemp[document.all.txtRVisit.value - 1] == "") {
                alert("Schedule visit is incomplete")
                return false;
            }
        }
        if (document.all.txtRVisit.value != (arrtemp.length - 1)) {
            alert("Schedule visit is incomplete")
            return false;
        }
    }

    

    if (document.all.txtRVisit.value != 0 && document.all.txtRVisit.value != "" && document.all.hdnSchDetails.value == "") {
        alert("Enter Schedule Visits")
        return false
    }


    
    if (document.all.hdnwarrList.value == "") {
        
        if (document.frmpurchase.hdnwarrList.value == "") {
             
            document.frmpurchase.hdnwarrList.value = "In Warranty" + "^^^" + document.all.txtWarrantyStart.value + "^^^" + document.all.txtWarrantyEnd.value + "^^^" + "In-Warranty" + "|||"
            //alert(document.frmpurchase.hdnwarrList.value)
        }

        //alert("Enter Warranty Details")
        //return false
    }

    //end by coding
    document.all.hdnBranch.value = document.all.txtgroup.options[document.all.txtgroup.selectedIndex].text
    calwardate();

    document.all.cmbState.disabled = false

    return true;

    return false;
}

//Modify by askar 

function checkschedule()
{
    temp=document.all.hdnSchDetails.value
    arrtemp= temp.split("|")
    if (document.all.txtRVisit.value < (arrtemp.length-1))
    {
        document.all.hdnSchDetails.value=""
        for (i=0;i<document.all.txtRVisit.value;i++)
        {
            document.all.hdnSchDetails.value= document.all.hdnSchDetails.value + arrtemp[i]+"|"
        }
    }
}



// ----------------------------------- ShowSchList popup start

function receiveChildValueshedule(value)
{
    

    if (String(value) != "undefined") {
        document.all.hdnSchDetails.value = value
    }
}



function ShowSchList() {
    var winval;
    if (document.all.txtRVisit.value == 0 || document.all.txtRVisit.value == "") {
        alert("Routine Visit Can't be Empty or Zero")
        document.all.txtRVisit.focus()
        return false
    }


    if (document.all.txtWarrantyStart.value == "") {
        alert("Enter the Warranty Start Date...")
        document.all.txtWarrantyStart.focus();
        return false;
    }
    if (rtndateonly1(document.all.txtWarrantyStart, "Warranty Start Date") == false) {
        return false;
    }

    if (document.all.txtWarrantyEnd.value == "") {
        alert("Enter the Warranty End Date...")
        document.all.txtWarrantyEnd.focus();
        return false;
    }
    if (rtndateonly1(document.all.txtWarrantyEnd, "Warranty End Date") == false) {
        return false;
    }

    frmv = checkdatevalue(document.all.txtWarrantyStart.value, document.all.txtWarrantyEnd.value)
    if (frmv == 1) {
        alert("Warranty End Date cannot be lesser than Warranty Start Date ...");
        document.all.txtWarrantyEnd.focus()
        return false;
    }

    temp = document.all.hdnSchDetails.value
    arrtemp = temp.split("|")

    j = document.all.txtRVisit.value
    if (document.all.hdnSchDetails.value != "") {
        i = arrtemp.length - 1;
    }
    else {
        i = 0;
    }

    if (j > i) {
        while (i < j) {
            document.all.hdnSchDetails.value = document.all.hdnSchDetails.value + "|"
            i = i + 1
        }
    }


    if (window.showModalDialog) {

        winVal = window.showModalDialog("ScheduleListInstall1.asp?Visit=" + document.all.txtRVisit.value + "&modeval=" + document.all.hdnmode.value + "&SchDetails=" + document.all.hdnSchDetails.value + "&StartDate=" + document.all.txtWarrantyStart.value + "&EndDate=" + document.all.txtWarrantyEnd.value + "&page=Add", null, "dialogHeight=300px;dialogwidth=400px;status:no")
    }
    else
    {
        winVal = window.open("ScheduleListInstall1.asp?Visit=" + document.all.txtRVisit.value + "&modeval=" + document.all.hdnmode.value + "&SchDetails=" + document.all.hdnSchDetails.value + "&StartDate=" + document.all.txtWarrantyStart.value + "&EndDate=" + document.all.txtWarrantyEnd.value + "&page=Add", null, "height=460Px,width=650Px,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=yes,top=100,left=400");
    }
    

    if (String(winVal) != "undefined") {
        document.all.hdnSchDetails.value = winVal
    }
    /*	
		else
		{
		document.all.hdnSchDetails.value=""
		}
	*/
}


// ----------------------------------- ShowSchList popup end




function checkNum(eveval){
    if (eveval<48 || eveval>57){
        event.keyCode=0
        return false
    }
}





//end for code


 