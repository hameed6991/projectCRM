<%@language=vbscript%>
<% Response.Buffer = true%>
<!--#include file="inc/cn.inc" -->
<!--#include file="inc/cnINV.inc" -->
<!--#include file="inc/Datefun.inc"-->
<!--#include file="inc/showdate.inc"-->
<!--#include file="inc/isempty.inc"-->
<!--#include file="inc/pincode.inc"-->
 
<!--#include file="inc/dateHelp.inc"-->
<!--#include file="inc/DateCompare.inc" -->
<!--#include file="inc/string.inc" -->
<!--#include file="inc/settings.asp" -->
<!--#include File ="inc/Errorhandler.asp"-->

<!--#include file="inc/hdnempty.inc" -->
<!--#include file = "inc/GenerateKey.asp"-->
 
<!--#include file="inc/checkrights.inc"-->
<!--#include file ="inc/CheckRights.inc"-->

 


<%
    'request.QueryString(componentlist)
    'response.Write(componentlist) 
    'response.End
        '------------------------------------------------  

   
    '------------------------------------------------  
    ' Get Vender Name
  
%>
<HTML>
<HEAD>


    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/standalone.css" />
    <link rel="stylesheet" type="text/css" href="css/tabs.css" />
    <link href="css/DevexpressStyle.css" rel="stylesheet" type="text/css" />
    <link href="css/style_new.css" rel="stylesheet" type="text/css" />
    <link href="css/style_new1.css" rel="stylesheet" type="text/css" />
    <link href="greybox/gb_styles.css" rel="stylesheet" type="text/css" />

      <link href="CSS/Bootstrap_Modified_3.3.7.css" rel="stylesheet" />
  
    <link href="CSS/new_styles1.css" rel="stylesheet" type="text/css" />
 

<!--<link href="css/style_new.css" rel="stylesheet" type="text/css">-->
<script language ="javascript">

    function receiveprodChildValue(prodvalues)
    {
        //alert(prodvalues)
        var strProdList;
        var objProdList = new Object();
        var objRtnVal = new Object();

        if (prodvalues != "undefined") {
            strProdList = prodvalues
            if (strProdList != "")
            {
                document.all.hdnProdList.value = strProdList;
                //alert(document.all.hdnProdList.value)
            }
        }


    }


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
		    objRtnVal = window.open('ProductsPopUp.asp?PCode=' + PCode, objProdList, "height=460Px,width=690Px,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=yes,top=100,left=400");
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
                //alert(strWarrList)
                document.all.hdnwarrList.value = strWarrList;
                 //alert(document.all.hdnwarrList.value)
            }
        }
        
    }
    //alert(document.all.hdnwarrList.value)
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


	objWarrList.DataString = document.all.hdnwarrList.value;
	


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
		document.all.hdnwarrList.value = strWarrList;
	   }
	} 
}

function Validform() {


    if (document.all.cmbProdLine.value == "") {
        alert("Principal should be selected")
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


    if (!isempty(document.all.txtSerial, "Serial #"))
        return false;


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


    if (document.all.txtApplication.value.length > 500) {
        alert("Remarks Cannot be Greater than 500 Characters")
        document.all.txtApplication.focus()
        return false;
    }

 

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
 

    if (document.all.txtgroup.value == "") {
        alert("Location Should Be Selected")
        document.all.txtgroup.focus()
        return false;
    }

    if (document.all.cmbengcode.value == "") {
        alert("Engineer Should Be Selected")
        document.all.cmbengcode.focus()
        return false;
    }

    if (document.all.cmbStatus.value == "") {
        alert("Status Should be Selected");
        document.all.cmbStatus.focus()
        return false;
    }

    if (document.all.cmbsubstatus.value == "<-Select->") {
        alert("Sub Status Should be Selected");
        document.all.cmbsubstatus.focus()
        return false;
    }


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

        if (document.all.hdnwarrList.value == "") {

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





</script>


<SCRIPT ID="clientEventHandlersJS" LANGUAGE="javascript">
<!--

function window_onload() {
//document.all.txtPIINo.focus()
}

//-->
</SCRIPT>
<SCRIPT LANGUAGE=javascript FOR=window EVENT=onload>
<!--
 window_onload()
    //-->




 function onpageload()
 {
      
     SlaInfoList();
 }

 function SlaInfoList() {

    

 }

</SCRIPT>
</HEAD>
<BODY  leftmargin="0" topmargin="2" onload="onpageload()">
<form name = "frmpurchase" method="post" action = "saveInstall.asp" onsubmit="return Validform()">

     <input type = "submit" value = "Submit" name="cmdSubmit" class="login_button" style="width: 80px; float: left; display: ruby-text; padding-left: 15px; padding-top: 0px; padding-bottom: 3px; padding-right: 20px; height: 23px; font-size: 14px; margin-top: 0px;" tabindex="45" >


    <table width="100%">

<tr>
<td height="30" width="84%" background="images/schi_pixel_01.gif"> <strong class="sub4">
&nbsp;INSTALLATION&nbsp; </strong> </td>
<tr>



<td width="100%">

<table border = "1" cellspacing="0" cellpadding="0" width="100%" height="206" bordercolor="#cfcfcf">

 

    <tr width="100%">

        <td width="100%" height="92" valign="top">

 <table border="0" cellspacing="0" width="100%" cellpadding="0" height="100%" bgcolor="#F5F5F5">

     
     <tr>
         <td width="347" colspan="6" align="right" height="23" style="border-bottom: 1px solid #cfcfcf" background="images/schi_pixel_03.gif">
             <p align="left"><span class="sub1"><strong>Product Info</strong></span></p>
         </td>
     </tr>


     <tr>
         <td height="5"> 
         </td>
     </tr>


     <tr>
         <td width="81" height="25" align="right"><font face="MS Sans Serif" size="3" color="#FF0000">
	*
      </font><font face="MS Sans Serif" size="1" color=" ">Principal
	 &nbsp;</font></td>
         <td width="96" height="25">&nbsp;
             <select name="cmbProdLine" size="1" onblur="ShowPSNames()"  style="font-size: 8pt; width: 98; font-family: MS Sans Serif; height: 23; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="1" onchange="ClearValues();ShowPSNames()">
                 <option selected value="">&lt;-Select-&gt;</option>
             
             </select>
         </td>


         <td width="81" height="25" class="bodytxt_black" align="right"><font face="MS Sans Serif" size="3" color="#FF0000">*</font><font face="MS Sans Serif" size="1" color=" ">Product&nbsp;</font></td>
         <td width="98" height="25" class="bodytxt_black"><font face="MS Sans Serif"  size="1">&nbsp; 
          <input type = text  name= "txtProduct" size="1" Class="inputstyle_dev" maxlength="20" style="font-size: 8pt; width: 77; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex ="2"></font>
             <input type="button" value="?" name="btnproduct"  class="small_button" onclick="searchProduct()"></td>



         <td width="79" height="25" align="right"><font face="MS Sans Serif" size="2" color=red >
	*</font><font face="MS Sans Serif" size="1" color=" ">Serial 
	#&nbsp;</font></td>
    <td width="97" height="25">
     <INPUT name="txtSerial" maxlength = "20" type = text <% if serialno<>"" then %> value=" " <%end if %> size=14 style="font-size: 8pt; width: 100; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="3">
    </td>

     


     </tr>





     
           <tr>

                    <td width="81" height="1" align="right"><font face="MS Sans Serif" size="3" color="#FF0000">&nbsp;
      </font><font face="MS Sans Serif" size="1" color=" ">Invoice 
	#&nbsp;</font></td>
                    <td width="96" height="1">&nbsp;
                <input name="txtPIINo" type="text" size="16" maxlength="30" style="font-size: 8pt; width: 96; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="4">
                    </td>
                    <td width="81" height="1" align="right"><font face="MS Sans Serif" size="3" color="#FF0000">&nbsp;
      </font><font face="MS Sans Serif" size="1" color=" ">Invoice 
	Date&nbsp;</font></td>
                    <td width="98" height="1">
                        <font face="MS Sans Serif" size="1">&nbsp;&nbsp;<input name="txtPIIDate" type = "text" maxlength="10" size=16 style="font-size: 8pt; width: 77; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="5" /></font>
                        <input type="button" value="?" onclick="showCal(document.all.txtPIIDate, 1)"  name="btnPIIDate" class="small_button" />
                    </td>


                      <td align="right" valign="middle" width="81">
                        <font face="MS Sans Serif" size="3" color="#FF0000">*</font><font face="MS Sans Serif" size="1" color=" ">Install 
		Date&nbsp;&nbsp;</font>
                    </td>
                    <td valign="middle" width="96">
                        <font face="MS Sans Serif" size="1"><INPUT name="txtInsDate" type = "text" maxlength="10" size=16 style="font-size: 8pt; width: 79; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="6"   onblur= "calwardate();"  ></font>
                        <input type="button" value="?" onclick="showCal(document.all.txtInsDate, 1); calwardate();"  onblur="calwardate();" name="btninsDate1" class="small_button">
                    </td>


                </tr>


                <tr>

                    <td width="81" height="1" align="right"><font face="MS Sans Serif" size="3" color="#FF0000">&nbsp;
      </font><font face="MS Sans Serif" size="1" color=" ">
	Dispatch Reference #&nbsp;</font></td>
                    <td width="96" height="1">&nbsp; <input name="txtVIFNo" type="text" size="16" maxlength="30" style="font-size: 8pt; width: 97; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="7">
                    </td>
                    <td width="81" height="1" align="right"><font face="MS Sans Serif" size="3" color="#FF0000">&nbsp; 
	*</font><font face="MS Sans Serif" size="1" color=" ">Dispatch 
	Reference Date&nbsp;</font></td>
                    <td width="98" height="1">
                        <font face="MS Sans Serif" size="1">&nbsp;&nbsp;<INPUT name="txtVIFDate" type = "text" maxlength="10" size=16 style="font-size: 8pt; width: 77; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" onblur= "calwardate();"  tabindex="8" ></font>
                        <input type="button" value="?" onclick="showCal(document.all.txtVIFDate, 1); calwardate();" onblur="calwardate();" name="btninvoicedate" class="small_button">
                    </td>


                    <td align="right" valign="middle" width="81"><font size="1" face="MS Sans Serif">
	Routine Visit&nbsp;</font></td>
                    <td valign="middle" width="96">
                        <font size="1" face="MS Sans Serif"><input name="txtRVisit"  size="12" tabIndex="9" maxlength="20" onkeypress="return checkNum(event.keyCode)" style="font-size: 8pt; width: 100; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" ></font>
                    </td>

                </tr>



                <tr>

                    <td width="81" align="right" valign="top"><font face="MS Sans Serif" size="3" color="#FF0000">
	*
      </font><font face="MS Sans Serif" size="1" color=" ">Pondy 
	Reference #&nbsp;</font></td>
                    <td width="96" valign="middle">&nbsp;
                        <input name="txtPONo" type="text" size="16" maxlength="30" style="font-size: 8pt; width: 97; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="10">
                    </td>
                    <td width="81" align="right" valign="top"><font face="MS Sans Serif" size="3" color="#FF0000">
	*
      </font><font face="MS Sans Serif" size="1" color=" ">Pondy 
	Reference&nbsp; Date</font></td>
                    <td width="98" valign="middle">
                        <font face="MS Sans Serif" size="1">&nbsp;&nbsp;<INPUT name="txtPODate" type = "text" maxlength="10" size=16  style="font-size: 8pt; width: 77; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="11" ></font>
                        <input type="button" value="?" onclick="showCal(document.all.txtPODate, 1)"  name="btnPODate" class="small_button">&nbsp;
                    </td>
 

                     <td align="right" valign="middle" width="81"><font face="MS Sans Serif" size="3" color="#FF0000">
	*</font><font face="MS Sans Serif" size="1" color=" ">Warranty 
	Card&nbsp;</font></td>
                    <td valign="middle" width="98">
                        <input name="txtWarrantyCard" type="text" size="20" maxlength="20" <% if warrantycardno<>"" then %> value=" " <%end if %> style="font-size: 8pt; width: 100; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="12">
                    </td>


                </tr>

                
                <tr>
 
                    <td align="right" valign="top" width="81">&nbsp;</td>
                    <td width="98">&nbsp;
                    </td>

                </tr>


                <tr>

                    <td align="right" valign="middle" width="81">
                        <p align="right">
                            <font face="MS Sans Serif" size="1" color=" ">
		Warranty Start&nbsp;</font>
                        </p>
                    </td>
                    <td valign="middle" width="96">&nbsp;
                        <input name="txtWarrantyStart" readonly type="text" size="16" maxlength="30" style="font-size: 8pt; width: 95; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="13">
                    </td>
                    <td align="right" valign="top" width="81"><font face="MS Sans Serif" size="1" color=" ">
	Warranty End&nbsp;</font></td>
                    <td width="98">&nbsp;<input name="txtWarrantyEnd" type="text" size="16" maxlength="30" style="font-size: 8pt; width: 75; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="14"> <input type="button" value="?" onclick="showCal(document.all.txtWarrantyEnd, 1)" name="btnWarEndDate" class="small_button">&nbsp;
                    </td>


                    <td align="right" valign="middle" width="81">
                          <font face="MS Sans Serif" size="3" color="#0000FF">  <font face="MS Sans Serif" size="3" color="#FF0000" >  *</font><font size="1" face="MS Sans Serif">Warranty 
		Card Received</font><font face="MS Sans Serif" size="3" color="#0000FF"  >&nbsp;</font></font></td>
                    <td valign="middle" width="96">
                        <select  name="cmbWarCard" size="1" style="font-size: 8pt; width: 100; font-family: MS Sans Serif; height: 23; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="15">
                            <option selected value="">&lt;-Select-&gt;</option>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>

                        </select>
                    </td>


                </tr>
 



     <tr>

                    
 


  <tr>

      <td align="right" width="81" height="21">
          <p align="right">
              <font size="1" face="MS Sans Serif">Remarks&nbsp;</font>
          </p>
      </td>
      <td style="width: 212 !important;margin-top: 2px;" height="22" valign="bottom" colspan="3">&nbsp;
          <textarea cols="28" name="txtApplication" rows="1" style="margin-top: 2px;height: 19; width: 200; font-family: MS Sans Serif; font-size: 8pt; position: relative; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px" tabindex="16"></textarea>
      </td>
   


  </tr>



     <tr>
         
     </tr>



                <tr>

                    
                    <td align="right" valign="middle" width="81"><font face="MS Sans Serif" size="1" color="<%=lBdFontClr%>">
	&nbsp;</font></td>
                    <td valign="middle" width="98">&nbsp;
                    </td>

                </tr>


<!--     <tr>
         <td align="right" width="79" height="21">
             <p align="right">
                 <font size="1" face="MS Sans Serif">&nbsp;</font>
             </p>
         </td>
         <td align="right" width="79" height="21">
             <p align="right">
                 <font size="1" face="MS Sans Serif">&nbsp;</font>
             </p>
         </td>
     </tr>-->


</table>

</td>
       


    </tr>
 
 





<tr width="100%">



     <td width="100%" height="110">


            <table border="0" cellspacing="0" width="100%" cellpadding="0" height="100%" bgcolor="#F5F5F5">

                <tr>
                    <td width="347" height="23" colspan="6" align="right" style="border-bottom: 1px solid #cfcfcf" background="images/schi_pixel_03.gif">
                        <p align="left">
                            <span class="sub1"><strong>Account Info &amp; Contact Info</strong></span>
                    </td>
                </tr>


                <tr>
                    <td height="5"></td>
                </tr>

                <tr>
                    <td width="81" height="22" align="right"><font face="MS Sans Serif" size="3" color="#0000FF">
	*
      </font><font face="MS Sans Serif" size="3" color="#FF0000">
      </font><font face="MS Sans Serif" size="1" color=" ">
	Account&nbsp;</font></td>
                    <td height="22" style="width: 160px !important;position: absolute;" align="left">&nbsp;
                        <input type="text" maxlength="100" name="txtAccount" <% if Account<>"" then %> value=" " <% end if %> onblur="Checkcode()" readonly size="1" style="font-size: 8pt; width: 94; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin;"><input type="button" value="?" name="btnaccount" class="small_button" onclick="SearchAccount()" tabindex="30">
                    </td>

                    <td width="81" height="22" align="right"><font face="MS Sans Serif" size="3" color="#0000FF">&nbsp;
      </font><font face="MS Sans Serif" size="2" color="#0000FF">* </font><font face="MS Sans Serif" size="1" color=" ">
	City&nbsp;</font></td>
                    <td width="98" height="22">
                        <font face="MS Sans Serif" size="1">
    <INPUT name="txtCity"  type = text  size=15 <% if City<>"" then %> value=" "<% end if %> maxlength ="30" readonly style="font-size: 8pt; width: 100; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" ></font>
                    </td>

                    <td width="81" height="22">
                        <p align="right">
                            <font size="3" color="blue">&nbsp; </font><font face="MS Sans Serif" size="2" color="#0000FF">
	*</font><font size="3" color="blue"> </font><font face="MS Sans Serif" size="1" color=" ">
	Site&nbsp;&nbsp;</font>
                    </td>
                    <td width="96" height="22">
                        <font face="MS Sans Serif" size="1">
    <INPUT name="txtSite"  onblur = "Checkcode()" type ="text" <% if Site<>"" then %> value=" "<% end if %> readonly size=16 style="font-size: 8pt; width: 110; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" maxlength="30" ></font>
                    </td>


                </tr>


                 <tr>

                     <td width="81" height="22" align="right"><font face="MS Sans Serif" size="3" color="#0000FF">&nbsp;
      </font><font face="MS Sans Serif" size="2" color="#0000FF">* </font><font face="MS Sans Serif" size="1" color=" ">
	Address&nbsp;</font></td>
                     <td style="width: 160px !important;position: absolute;" height="22">

                         <font face="MS Sans Serif" size="1">&nbsp; &nbsp;<input name="txtAddress" <% if Address<>"" then %> value="  "<% end if %>  readonly type = text  size=15 maxlength = "150" style="margin-top: -8px;margin-left: 10px;font-size: 8pt; width: 250; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" >
      </font>

                     </td>


                     
                    <td width="81" height="22" align="right">
                        <font face="MS Sans Serif" size="3" color="#0000FF">&nbsp;
      </font>
                        <font face="MS Sans Serif" size="2" color="#0000FF">* </font><font face="MS Sans Serif" size="1" a>
	Pincode&nbsp;&nbsp;</font>
                    </td>
                    <td width="98" height="22">
                        <font face="MS Sans Serif" size="1">
	 <INPUT name="txtPincode" <% if Pincode<>"" then %> value=" "<% end if %>  readonly type = text  size=15 maxlength ="6" style="font-size: 8pt; width: 100; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" >
      </font>
                    </td>

                      <td width="81" height="25" align="right"><font face="MS Sans Serif" size="3" color="#0000FF">
	* 
      </font><font face="MS Sans Serif" size="3" color="#FF0000">
      </font><font face="MS Sans Serif" size="3" color="#0000FF">
      </font><font face="MS Sans Serif" size="1" color=" ">State&nbsp;&nbsp;</font></td>
                    <td width="96" height="25">
                        <font face="MS Sans Serif" size="1">&nbsp;<select name="cmbState" disabled size="1" style="margin-left: -2px;margin-top: 2px;font-size: 8pt; width: 108; font-family: MS Sans Serif; height: 23; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin">
				<option selected value ="" >&lt;-Select-&gt;</option> 
       
</select>			
</font>
                    </td>
 

                </tr>




                  <tr>

        <td width="72" align="right" valign="middle">
            <p>
                <font face="MS Sans Serif" size="2" color="red">&nbsp;*</font><font size="1" face="MS Sans Serif">Contact&nbsp;</font>
        </td>
        <td width="113" valign="middle">
            <p align="left">
                <font size="1" face="MS Sans Serif">&nbsp;&nbsp;&nbsp;
					 <input name="txtContact" size="12" tabIndex="35"  onblur = "Checkcode()" maxlength =50 style="font-size: 8pt; width: 94; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin"><input type="button" value="?" tabindex="36" name="btncont" class="small_button" onClick="ShowContCode()"></font>
            </p>
        </td>
        <td width="75" align="right" valign="middle">
            <font face="MS Sans Serif" size="2" color="red">*</font><font size="1" face="MS Sans Serif">Designation&nbsp;</font></td>
        <td width="105" valign="middle"><font size="1" face="MS Sans Serif"><input name="txtDesignation" size="12" tabIndex="37" style="font-size: 8pt; width: 100; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" ></font>
        </td>


        <td width="72" align="right"><font face="MS Sans Serif" size="1">&nbsp;</font><font face="MS Sans Serif" size="3" color="#FF0000">*</font><font face="MS Sans Serif" size="1">Department&nbsp;&nbsp;</font></td>
        <td width="113"><font size="1" face="MS Sans Serif">
 <input name="txtDepartment" size="12" tabIndex="38"  onblur = "Checkcode()" maxlength =50 style="margin-top: 0px;font-size: 8pt; width: 109; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin"></font>
        </td>

 
        
 
    </tr>

                
 



                <tr>

                   

                    <td width="81" height="25" align="right"><font face="MS Sans Serif" size="2" color="#0000FF">
	*
      </font><font face="MS Sans Serif" size="1" color=" ">Phone&nbsp;&nbsp;</font></td>
                    <td width="96" height="25">&nbsp;&nbsp; <input type="text" maxlength="30" name="txtPhone" <% if Phone<>"" then %> value=" " <% end if %> readonly size="1" style="margin-left: -7px;font-size: 8pt; width: 98; font-family: MS Sans Serif; height: 19; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin">
                    </td>
 


                     <td align="right" width="81" height="21">
             <font size="1" face="MS Sans Serif">Dealer&nbsp;&nbsp;</font>
         </td>
         <td width="96" style="" height="21" valign="bottom" colspan="3">&nbsp;
             <select style="margin-left: -12px;margin-top: 2px;font-size: 8pt; width: 100; font-family: MS Sans Serif; height: 23; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabindex="17" size="1" name="cmbdealer">
                 <option selected value="None">None</option>
            
             </select>
         </td>

                     
                </tr>



                <tr>

                    <td width="81" height="29" align="right">
                        <input type="checkbox" name="chktemp" value="ON" tabindex="31"></td>
                    <td width="96" height="29" >
                        <font face="MS Sans Serif" size="1" color=" ">Temporary 
	Details (Dealer/Branch)</font>
                    </td>
 
 
                </tr>

 
         


               


            </table>
        </td>

 
</tr>




<tr width="100%">

    <td width="100%" height="92" valign ="top">

<table border="0" cellspacing="0" width="100%" cellpadding="0" height="100%" bgcolor="#F5F5F5">

    <tr>
        <td width="347" height="23" align="right" colspan="6" style="border-bottom: 1px solid #cfcfcf" background="images/schi_pixel_03.gif">
            <p align="left">
                <span class="sub1"><strong>Status &nbsp;</strong></span>
        </td>
    </tr>


    <tr>
         <td height="5"> 
         </td>
     </tr>
 

<!-- removed-->

    <tr>

        <td width="72" align="right"><font face="MS Sans Serif" size="2" color="red">
		*</font><font face="MS Sans Serif" size="1">Location&nbsp;</font></td>
        <td width="113"><font face="MS Sans Serif" size="1">&nbsp;
           <select style="font-size: 8pt; width: 105; font-family: MS Sans Serif; height: 23; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabIndex="39" size="1" name="txtgroup" onChange="ShowEngNames()"  >
 				<option selected value ="" >&lt;-Select-&gt;</option>
             
    </select></font>
        </td>
        <td width="75" align="right"><font face="MS Sans Serif" size="2" color="red">
		*</font><font face="MS Sans Serif" size="1">Engineer&nbsp;</font></td>
        <td width="105"><font face="MS Sans Serif" size="1">&nbsp;<select style="font-size: 8pt; width: 100; font-family: MS Sans Serif; height: 23; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin" tabIndex="40" size="1" name="cmbengcode">
<option selected value ="" >&lt;-Select-&gt;</option>
  
            
    </select></font>
        </td>


            <td width="72" align="right" valign="middle">
                <p align="right"><font size="1" face="MS Sans Serif">&nbsp;</font><font size="1" face="MS Sans Serif">Status&nbsp;&nbsp;</font>
                </td>
                <td width="113" valign="middle">
                <font face="MS Sans Serif" size="1"> 
                    <select style='font-family: Ms Sans Serif; font-size: 10px; font-style: normal; font-weight: normal; height: 23; width: 110; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin' tabIndex="41" size="1" name="cmbStatus">
                        
               
    </select></font>
                </td>

    </tr>

 
    <!-- removed-->

 
 <tr>
            


		<td width="75">
          <p align="right"><font face="MS Sans Serif" Color = 'Red' size="3">* </Font><font face="MS Sans Serif" size="1">
			Sub-Status&nbsp;</font>
          </p>
        </td>
		<td width="105">
          <p align="left"><Font = 'Ms Sans Serif' size='1'>&nbsp;<Select style='font-family: Ms Sans Serif; font-size: 10px; font-style: normal; font-weight: normal; height: 23; width: 105; border-left-style: groove; border-left-width: 1px; border-right-width: thin; border-top-style: solid; border-top-width: 1px; border-bottom-width: thin' Name='cmbsubstatus' Width='50' Tabindex = '42' size="1">
          <option value ="" >&lt;-Select-&gt;</option> 
        
	</Select></Font></p>
      </td>
 </tr>



    <tr>
         <td height="10"> 
         </td>
     </tr>

</table>

</td>

</tr>








    


</table>

<table border="0" cellspacing="0" width="93%">
  <tr>
    <!--<td width="10%" align="left">
      <input type = button value = "Carry On" name="cmdcarryon" onclick= "carryon()" class="button" >
    </td>-->
    <td width="5%" align="left">
    <img height="20" src="images/pcPIC.jpg" width="28" border="0">
    </td>
    <td width="18%" align="left"><b><font face="Arial" color="#2D4E5E" size="1"><span onclick="javascript:showAddProd()" onmouseover="this.style.cursor='hand'" title="Schedule the Visits"  >
	Sub Products&nbsp;
          </span>
          </font></b>

    </td>

    <!--<td width="8%" align="left">
    <font face="Arial" color="#2d4e5e" size="1"><b><a style="TEXT-DECORATION: none" href="javascript:showAddProd()">Sub&nbsp;Products</a></b></font>
    </td> -->
    <td width="4%" align="left">
    <img height="20" src="images/pcPIC.jpg" width="28" border="0">
    </td>
    <td width="18%" align="left"><b><font face="Arial" color="#2D4E5E" size="1"><span onclick="checkschedule(),ShowSchList()" onmouseover="this.style.cursor='hand'" title="Schedule the Visits"  >
	Schedule Visits&nbsp;
          </span>
          </font></b>

    </td>
    <td width="4%" align="left">
    <img height="20" src="images/pcPIC.jpg" width="28" border="0">
    </td>
    <td width="18%" align="left"><b><font face="Arial" color="#2D4E5E" size="1"><span onclick="javascript:showAddWarr()" onmouseover="this.style.cursor='hand'" title="Schedule the Visits"  >
	Warranty Details&nbsp;
          </span>
          </font></b>

    </td>
    <td width="65%" align="right">
      <input type = "submit" value = "Submit" name="cmdSubmit" class="login_button" tabindex="45" >
      <input type = reset value = "Reset" name="cmdReset" tabindex="46" class="button" >
    </td>
  </tr>
</table>



</td>


</tr>

    </table>

 


</form>
</BODY>
 

