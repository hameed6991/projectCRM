    RowCount = 0;
	ModifyRowNo = -1;
	aBankname= new Array(100);
	achequeno = new Array(100);
	achequeDate = new Array(100);
	achequeamt = new Array(100);
	abefname = new Array(100);
	var tabHeaders = "" ;
		tabHeaders = "<tr><td colspan='6' height='22'  style='border-bottom: 1px solid #cfcfcf' background='images/schi_pixel_03.gif'><strong class='sub1'>Details</strong></td></tr>";
	 
	function AddToList()
{
	checkstring(document.all.txtbankname)
	checkstring(document.all.txtChequeNo)
	checkstring(document.all.txtbefname)
	
	var bankname  = document.all.txtbankname.value
	var chequeno= document.all.txtChequeNo.value
	var chequedate = document.all.txtChequeDate.value
	var chequeamt = document.all.txtrcheamt.value
	var befname = document.all.txtbefname.value
	
	
		var strValidateMessage = "";
		
		
		
	    if (chequeno=="" || chequeno=="undefined")
		{ 
			strValidateMessage = "Cheque No Can't be empty !\n"  
		}
       if (strValidateMessage=="")
		{
			aBankname[RowCount] = bankname;
			achequeno[RowCount] = chequeno;
			achequeDate[RowCount] = chequedate;
			achequeamt[RowCount] = chequeamt;
			abefname[RowCount] = befname;
			RowCount = RowCount + 1;
			ResetButtons();
		 	RebuildTable();
		 	BankList();
		}
		else
		{
	 		alert("Cannot add the Cheque/Desposit Issue to the list !\n\n" + strValidateMessage)
		}
}

function RemoveFromList(RowNo)
{

	 achequeno[RowNo] = "" ;
	 RebuildTable();
	 BankList();
}

function viewATMDetails()
{
 if (document.all.txtEquipID.value != "")
   window.open("mdpurchase.asp?EquipId=" + document.all.txtEquipID.value ,null,"dialogwidth=450Px;dialogHeight=260Px;status:no;");
 else
   alert("Pls select an ATM ID")  

 
}

function ResetButtons()
{
		document.all.txtbankname.value  = "";
		document.all.txtChequeNo.value  = "";
		document.all.txtChequeDate.value  = "";
		document.all.txtrcheamt.value  = "";	
		document.all.txtbefname.value  = "";	
		//document.frmRMARequest.btnAdd.disabled = false;		
}


function RebuildTable()
{

 var output = "";
 var counter = 1; 
 for (var j = 0; j < RowCount; j++) 
  {
	if (achequeno[j] != "") 
	{

	output += "<tr  bgcolor='#EFEFEF'>";
	//output += "<td align='center'><font face='MS Sans Serif' size=1>" + counter + "</font></td>";
	output += "<td width=98><font face='MS Sans Serif' size=1>" + aBankname[j] + "&nbsp;</font></td>";
	output += "<td width=106><font face='MS Sans Serif' size=1>" + achequeno[j] + "&nbsp;</font></td>";
	output += "<td width=114><font face='MS Sans Serif' size=1>" + achequeDate[j] + "&nbsp;</font></td>";
	output += "<td width=113><font face='MS Sans Serif' size=1>" + achequeamt[j] + "&nbsp;</font></td>";
	output += "<td width=91><font face='MS Sans Serif' size=1>" + abefname[j] + "&nbsp;</font></td>";
	output += "<td width=82><input name='btnRemove' value='Remove' type=button onclick='RemoveFromList(" + j + ")' class=button></td> </tr>";
	counter += 1;
   }
  }
 output = "<table id='DispTable' width='100%' border=1 cellspacing=1 cellpadding=1>"   + tabHeaders + output  + "</table>";
 document.getElementById("TableContainer").innerHTML = output;

}

function BankList()
{
 var ProdList = "";
 //var objRtnVal = new Object();
 for (var j=0;j<RowCount;j++) 
  {
	if (achequeno[j] != "") 	
	{ 
		ProdList += aBankname[j] + "^^^" + achequeno[j] +  "^^^" + achequeDate[j] +"^^^" + achequeamt[j] +"^^^" + abefname[j]  + "|||"
	}
  }
  document.all.hdnBankList.value = ProdList ;
 
}



var ServerURL="SRDeRS.asp"

function showPreviousComplaint()
{
 WinVal=window.showModalDialog("complaintHistory.asp?accCode=" + document.all.hdnaccode.value + "&Account=" + document.all.txtAccount.value + "&SiteID=" + document.all.txtSiteID.value,null,"dialogHeight=400Px;dialogwidth=900Px;status:no")
}

function showSparesUsed()
{
srno=document.all.txtSrno.value
EquipId=document.all.txtEquipID.value
Model=document.all.txtProduct.value
Bool="Yes"
 WinVal=window.showModalDialog("frpartscon.asp?srno=" + srno + "&EquipId=" + EquipId + "&Model=" + Model + "&Bool=" + Bool,null,"dialogHeight=400Px;dialogwidth=600Px;status:no")
}



function showAllocationHistory()
{
  WinVal=window.showModalDialog("showallocinfo.asp?srnumber="+document.all.txtSrno.value,null,"dialogHeight=400Px;status:no")
}

function showHis()
{
rtnvalues = window.showModalDialog("hisSrStatus.asp?srnumber="+document.all.txtSrno.value,null,"dialogHeight=400Px;status:no" );
}

function ShowAccCode()
{
var rtnvalues;
var lhlpvalues = new Array(); 
rtnvalues = window.showModalDialog("SearchAccMast.asp?SiteID=" + document.frmservicerequest.txtSiteID.value,null,"dialogwidth=650Px;dialogHeight=460Px;status:no;"); 
if (String(rtnvalues) !="undefined")
{
	lhlpvalues = rtnvalues.split("|");
	document.all.hdnaccode.value=lhlpvalues[0];
	document.all.txtAccount.value=lhlpvalues[1];
	document.all.txtsite.value=lhlpvalues[2];
	document.all.txtSiteID.value=lhlpvalues[3];
	document.all.txtAddress.value=lhlpvalues[4];
	document.all.txtCity.value=lhlpvalues[5];
	document.all.txtState.value=lhlpvalues[6];
	document.all.txtServiceArea.value=lhlpvalues[7];
	document.all.txtEquipID.value=lhlpvalues[8];
	document.all.hdnEquipID.value=lhlpvalues[8];
	document.all.txtProduct.value=lhlpvalues[9];
	document.all.hdnprodcode.value=lhlpvalues[10];
	}
}

function ShowSerialNo()
{
var rtnvalues;
var lhlpvalues = new Array(); 
rtnvalues = window.showModalDialog("Searchpurchase.asp?EquipId=" + document.all.txtEquipID.value + "&SiteID=" + document.all.txtSiteID.value,null,"dialogwidth=650Px;dialogHeight=460Px;status:no;");
	if (String(rtnvalues) !="undefined")
	{ 
		lhlpvalues = rtnvalues.split("|");
		document.all.txtEquipID.value=lhlpvalues[0];
		document.all.hdnEquipID.value=lhlpvalues[0];
		document.all.txtProduct.value=lhlpvalues[1];
		document.all.txtSiteID.value=lhlpvalues[2];
		document.all.hdnprodcode.value=lhlpvalues[3];
		document.all.hdnaccode.value=lhlpvalues[4];
		document.all.txtsite.value=lhlpvalues[5];
		document.all.txtAccount.value=lhlpvalues[6];
		document.all.txtServiceArea.value=lhlpvalues[7];
		document.all.txtAddress.value=lhlpvalues[8];
		document.all.txtCity.value=lhlpvalues[9];
		document.all.txtState.value=lhlpvalues[10];
		document.all.hdnserialno.value=lhlpvalues[12];
		document.all.hdnrocode.value=lhlpvalues[13];
		document.all.cmbLocation.value=lhlpvalues[14];
		ShowServiceCode();
		if(document.all.hdnissummary.value!="True")
		{
		chkPurExist();
		}
		Chk();
		chkrepeats();
		document.all.hdnagreevp.value=""
		if(document.all.CmbCallType.value=="PM")
	    {
	        getAgvistcode();
	    }
	}
}

var xml;
function displaySerialNo()
{
if (document.all.txtEquipID.value!= "")
 {
//	var xml= new ActiveXObject( "Microsoft.XMLHTTP" );
	
	if (window.XMLHttpRequest) 
	{
		// code for all new browsers
		xml=new XMLHttpRequest(); 
	}
	else if (window.ActiveXObject) 
	{
		// code for IE5 and IE6
		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
	}
	var sURL="Searchdisplaypurchase.asp?EquipId=" + document.all.txtEquipID.value;
	xml.open("Get",sURL,false );
	xml.send();
	var lsval=xml.responseText

	if (lsval!="")
	{ 
		lhlpvalues = lsval.split("|");
		
		if (lhlpvalues[15].toLowerCase() == "inactive")
		{
			alert("ATM ID is Inactive!");
			return;
		}
		
		document.all.txtEquipID.value=lhlpvalues[0];
		document.all.hdnEquipID.value=lhlpvalues[0];
		document.all.txtProduct.value=lhlpvalues[1];
		document.all.txtSiteID.value=lhlpvalues[2];
		document.all.hdnprodcode.value=lhlpvalues[3];
		document.all.hdnaccode.value=lhlpvalues[4];
		document.all.txtsite.value=lhlpvalues[5];
		document.all.txtAccount.value=lhlpvalues[6];
		document.all.txtServiceArea.value=lhlpvalues[7];
		document.all.txtAddress.value=lhlpvalues[8];
		document.all.txtCity.value=lhlpvalues[9];
		document.all.txtState.value=lhlpvalues[10];
		//document.all.cmbBrand.value=lhlpvalues[11];
		document.all.hdnserialno.value=lhlpvalues[12];
		document.all.hdnrocode.value=lhlpvalues[13];
		document.all.cmbLocation.value=lhlpvalues[14];
		
		if(document.all.hdnissummary.value!="True")
		{
		chkPurExist();
		}
		Chk();
		ShowServiceCode();
		chkrepeats();
		
		document.all.hdnagreevp.value=""
		if(document.all.CmbCallType.value=="PM")
	    {
	        getAgvistcode();
	    }
	}
	else
	{
		alert("ATM ID Not Found...");
		document.all.txtProduct.value="";
		document.all.txtSiteID.value="";
		document.all.hdnprodcode.value="";
		document.all.hdnaccode.value="";
		document.all.txtsite.value="";
		document.all.txtAccount.value="";
		document.all.txtServiceArea.value="";
		document.all.txtAddress.value="";
		document.all.txtCity.value="";
		document.all.txtState.value="";
		//document.all.cmbBrand.value="";
		document.all.hdnserialno.value="";
		document.all.hdnrocode.value="";
		document.all.cmbLocation.value="";
		ShowSerialNo();
	}

}


}


function ShowServiceCode()
{

//var xml = new ActiveXObject( "Microsoft.XMLHTTP" );
	if (window.XMLHttpRequest) 
	{
		// code for all new browsers
		xml=new XMLHttpRequest(); 
	}
	else if (window.ActiveXObject) 
	{
		// code for IE5 and IE6
		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
	}

	var sURL = "Searchservicecode.asp?EquipId="+document.all.hdnEquipID.value;
	xml.open( "POST", sURL, false);
	xml.send();
	var lsval = xml.responseText;
	var lseng;
	var status;
	var lsdata;
	var obj;
	var tempsval;
	obj = new Option(); 
	document.all.cmbService.length=0;
	
		obj.text="<-Select->";
		obj.value="";
		document.all.cmbService.add(obj);
		if(lsval!="")
		{
			lssaleshead=lsval.split("^^^");
			final =lssaleshead.length - 1;
	

			for (i=0;i<final;i++)
				{	
					obj = new Option(); 
					
					shead=lssaleshead[i].split("|");
					obj.text=shead[1] ;
					obj.tagvalue=shead[2];	
					obj.value=shead[0];
					document.all.cmbService.add(obj);
					

					//documen.all.cmbService.
					if(document.all.hdnparentsc.value ==shead[0]) 
					{
					x = i+1;
					document.all.cmbService.options[x].selected =true;	
					
			       }
				}
				getVendordet();
		}
}


function getsubcalltype()
{

//var xml = new ActiveXObject( "Microsoft.XMLHTTP" );
	if (window.XMLHttpRequest) 
	{
		// code for all new browsers
		xml=new XMLHttpRequest(); 
	}
	else if (window.ActiveXObject) 
	{
		// code for IE5 and IE6
		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
	}

	var sURL = "getsubcalltype.asp?calltype="+document.all.CmbCallType.value;
	xml.open( "POST", sURL, false);
	xml.send();
	var lsval = xml.responseText;
	var lseng;
	var status;
	var lsdata;
	var obj;
	var tempsval;
	obj = new Option(); 
	document.all.cmbsubcalltype.length=0;
	
		obj.text="<-Select->";
		obj.value="";
		document.all.cmbsubcalltype.add(obj);
		if(lsval!="")
		{
			lssaleshead=lsval.split("^^^");
			final =lssaleshead.length - 1;
	

			for (i=0;i<final;i++)
				{	
					obj = new Option(); 
					
					shead=lssaleshead[i].split("|");
					
					obj.text=shead[0] ;
					obj.value=shead[0];
					document.all.cmbsubcalltype.add(obj);
					if(shead[1]=="True")
					{
					x = i+1;
					document.all.cmbsubcalltype.options[x].selected =true;	

					}
					
				}
			
		}
		checktype();
}

function checktype()
{
if (document.all.cmbsubcalltype.value!= "")
 {
//   var xml = new ActiveXObject( "Microsoft.XMLHTTP" );
	if (window.XMLHttpRequest) 
	{
		// code for all new browsers
		xml=new XMLHttpRequest(); 
	}
	else if (window.ActiveXObject) 
	{
		// code for IE5 and IE6
		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
	}

	var sURL = "checksubtype.asp?calltype="+document.all.cmbsubcalltype.value;
	xml.open( "POST", sURL, false);
	xml.send();
	var lsval = xml.responseText;
	var lseng;
	var status;
	var lsdata;
	var obj;
	var tempsval;
	//obj = new Option(); 
	//document.all.cmbsubcalltype.length=0;
	
		//obj.text="<-Select->";
		//obj.value="";
		//document.all.cmbsubcalltype.add(obj);
		if(lsval!="")
		{
			lssaleshead=lsval.split("^^^");
			final =lssaleshead.length - 1;
	

			for (i=0;i<final;i++)
				{	
					//obj = new Option(); 
					
					shead=lssaleshead[i].split("|");
			
					if(shead[0] == "False")
					{
					document.all.txtresponsetime.value ="";
					}
					if(shead[1] == "False")
					{
					document.all.txtcommitteddate.value ="";
					
					}
						document.all.hdnIsResp.value =shead[0];	
						document.all.hdnIsResol.value =shead[1];	
				}
			
		}
		getVendordet();
	}
	else
	{
	document.all.txtresponsetime.value ="";
    document.all.txtcommitteddate.value ="";

	}
	
}



function getVendordet()
{
//alert(RowCount);
for(var i=0;i<parseInt(RowCount);i++)
{
RemoveFromList(i);
}
RowCount = 0;
 //document.all.hdnBankList.value ="";
//document.getElementById("TableContainer").innerHTML="";
 if(document.all.cmbService.options[document.all.cmbService.selectedIndex].tagvalue == "True")
 {
 document.all.hdnIsCheque.value="Yes"
 document.all.dvcheque.style.display="block";
 }
 else
 {
 document.all.hdnIsCheque.value="No"
 document.all.dvcheque.style.display="none";
 }

	
if (document.all.txtEquipID.value!= "")
 {
// alert(document.all.txtCallDate.value)
//	var xml= new ActiveXObject( "Microsoft.XMLHTTP" );
	if (window.XMLHttpRequest) 
	{
		// code for all new browsers
		xml=new XMLHttpRequest(); 
	}
	else if (window.ActiveXObject) 
	{
		// code for IE5 and IE6
		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
	}

	var sURL="Searchvendordet.asp?EquipId=" + document.all.txtEquipID.value+"&ServiceCode=" + document.all.cmbService.value+"&calldate=" + document.all.txtCallDate.value;
	//var sURL="Searchvendordet.asp?EquipId=" + document.all.txtEquipID.value+"&ServiceCode=" + document.all.cmbService.value;
	xml.open( "Get",sURL,false );
	xml.send();
	var lsvals=xml.responseText
	//alert(lsvals)	
	if (lsvals!="")
	{ 
		lhlpvalues = lsvals.split("|");
		document.all.hdnvendorcode.value=lhlpvalues[0];
		document.all.txtVendor.value=lhlpvalues[1];
		if(document.all.hdnIsResol.value =="True")
		{
		document.all.txtcommitteddate.value=lhlpvalues[2];
		}
		if(document.all.hdnIsResp.value =="True")
		{
		document.all.txtresponsetime.value=lhlpvalues[3];
		}
		
	}
	else
	{
		document.all.hdnvendorcode.value="";
		document.all.txtVendor.value="";
		document.all.txtcommitteddate.value="";
		document.all.txtresponsetime.value ="";
	}
	getEngineers();
	
}
}




function checksrno()
{
 	 if (document.frmservicerequest.txtSrno.value == "")
      { return false;
        }
     return true;
}


function chkPurExist()
{
//alert(document.all.hdnaccode.value)
//alert(document.all.hdnprodcode.value)
//	var xml = new ActiveXObject( "Microsoft.XMLHTTP" );
	if (window.XMLHttpRequest) 
	{
		// code for all new browsers
		xml=new XMLHttpRequest(); 
	}
	else if (window.ActiveXObject) 
	{
		// code for IE5 and IE6
		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
	}

	var sURL = "getChkSR.asp?AccCode="+document.all.hdnaccode.value+"&EquipId=" + document.all.txtEquipID.value
	xml.open( "POST", sURL, false);
	xml.send();
	var lsval = xml.responseText;
//alert(lsval)
	if (lsval!= "")
	{
		var Chk
		var oldSRDet
		oldSRDet = ""
			if (lsval!="")
		{
			Chk="Y"
			mylen = lsval.length
			oldSRDet=lsval.substr(0,mylen-1)
		}
		else
		{	
			Chk="N"
		}

	if(Chk=="Y")
		{
		//alert(oldSRDet)
		//alert(document.all.txtSrno.value)
	
		var WinVal=window.showModalDialog("ShowExistSR.asp?Srno=" + oldSRDet+"&EquipId=" + document.all.txtEquipID.value,null,"dialogwidth=450Px;dialogHeight=250Px;dialogTop=200Px;dialogLeft=250Px;status:no")
		//alert(WinVal)
		//alert(oldSRDet)
		if(WinVal=="O")
			{
			window.open ("SRSummary.asp?srno=" + oldSRDet,"f5")	
			return
			}	
		}
}	}

function chkrepeats()
{
if(document.all.hdnprodcode.value != "")
	{	
y=chkrepeat(document.all.txtEquipID.value)
if (y>=3)
{
alert("Calls repeated more then 3 times within 7 days");
document.all.hdisrepeat.value = "True";
if (document.all.UType.value.toUpperCase()=="HO")
{
x = window.showModalDialog("PendingCalls.asp?EquipID=" + document.all.txtEquipID.value,null,"dialogLeft=150Px;dialogwidth=750Px;dialogHeight=400Px;status:no;")
}
}
}
}

function Chk()
{
//alert(document.all.hdnprodcode.value)
//alert(document.all.hdnserialno.value)
if(document.all.hdnprodcode.value != "")
	{	
	x = warrantycheck("S",document.all.txtSrno.value,"ServiceRequest","SRNo","","P",document.all.txtEquipID.value,document.all.hdnprodcode.value)
	if(x=="WAR" || x=="AMC")
		{
		document.all.chkBillable.checked = false;
		if (x=="WAR")
			alert("Its under Warranty");
		else
			alert("Its under AMC");
		
		if(document.all.hdnBillFlag.value=="")
		  document.all.hdnBillFlag.value = "false";
		}
	else
		{
		document.all.chkBillable.checked = true;	
		alert("Out of Warranty");		
		if(document.all.hdnBillFlag.value=="")
		  document.all.hdnBillFlag.value = "true";
		}
		document.all.cmbReprod.value=x
	}
}


function chkJustify()
{
	if(document.all.hdnBillFlag.value=="")
		{
		return;
		}
	if ((document.all.hdnBillFlag.value=="true" && document.all.chkBillable.checked==false) || (document.all.hdnBillFlag.value=="false" && document.all.chkBillable.checked==true))
		{
		document.all.justid.innerHTML = "<font Face='Ms Sans Serif' size='1'><a Href='javascript:justify()'>Justify</a></font>";
		}
	else
		{
		document.all.justid.innerHTML = "";
		document.all.hdnJustification.value = "";
		}

}


function justify()
{

if(document.all.chkBillable.checked==false)
	{
	blflg = "Non-Billable";
	}
else
	{
	blflg = "Billable";
	}
	//Pflg = "Product";
x = window.showModalDialog("justification.asp?EquipId=" + document.all.txtEquipID.value+ "&Justify=" + blflg +"&Justification=" + document.all.hdnJustification.value ,null,"dialogLeft=150Px;dialogwidth=500Px;dialogHeight=200Px;status:no;")
if (String(x)!="undefined")
document.all.hdnJustification.value = x;
}



function frmservicerequestvalid()
{

if ((document.all.CmbCallType.value)=="PM" && (document.all.hdnagreevp.value)=="")
{
alert("PM Date is Not Configured, So PM call Cannot be created")
return false;
}

 
 if(document.frmservicerequest.PhdnEquipID.value!="")
 {
 if (document.frmservicerequest.hdnEquipID.value!=document.frmservicerequest.PhdnEquipID.value)
 {
      alert("ATM ID does not match");
	  document.all.txtEquipID.focus();
	  return false;

 }
 }


  if (checksrno() == false)
	{ alert("Enter a Valid Service Request Number");
	  document.frmservicerequest.txtSrno.focus();
	  return false;
	}
	
		
  if (document.all.txtEquipID.value =="" || document.frmservicerequest.hdnprodcode.value =="")
	{ alert("Please Enter ATM ID");
	  document.all.txtEquipID.focus();
	  return false;
	}
	
  if (document.frmservicerequest.txtSiteID.value =="" || document.frmservicerequest.hdnaccode.value =="")
	{ alert("Select a Site ID..");
	  document.frmservicerequest.txtSiteID.focus();
	  return false;
	}

  if (document.all.txtEquipID.value !=document.frmservicerequest.hdnEquipID.value)
	{ alert("Invalid ATM ID, Click Help button to select a proper ATM ID");
	  document.all.txtEquipID.focus();
	  return false;
	}

	 if (document.frmservicerequest.txtopendate.value=="")
	   {  
	   alert("Open Date is Empty....");
	   document.frmservicerequest.txtopendate.focus();
	      return false;
	   }
	   
		if (document.frmservicerequest.txtCallDate.value=="")
	   {  
	   alert("Call Date Can't be Empty");
	   document.frmservicerequest.txtCallDate.focus();
      return false;
	   }
	   if (rtndatetime1(document.all.txtCallDate,"Call Date") == false )
	   {  
      return false;
	   }
	   
	   if (document.all.txtCallDate.value!="")
		{
   		frmv=checkdatetimevalue(document.all.txtCallDate.value,document.all.hdndatenow.value)
		if (frmv==1)
			{
   			alert("Call Date cannot be greater than Current Date ...");
			return false;
			}
		} 
		
	
       if (document.all.txtCallDate.value!="")
		{
	   			frmv=checkdatetimevalue(document.all.hdndatenow2.value,document.all.txtCallDate.value)
				if (frmv==1)
				{
   					alert("Call Date cannot be back dated more than " + document.all.hdncallbackdate.value + " day[s]...");
					return false;
              }
		} 
	
	   /*if (document.frmservicerequest.txtCallTicketNo.value=="")
	   {  
	   alert("Ref Ticket No Can't be Empty");
	   document.frmservicerequest.txtCallTicketNo.focus();
      return false;
	   }*/
 
   
	if (rtndatetime1(document.all.txtopendate,"Open Date") == false )
	   {  
      return false;
	   }


	   	   if (document.frmservicerequest.CmbCallType.value=="")
	   {  
	   alert("Call Type Can't be Empty");
	   document.frmservicerequest.CmbCallType.focus();
      return false;
	   }	
	    	   if (document.frmservicerequest.cmbsubcalltype.value=="")
	   {  
	   alert("Sub Call Type Can't be Empty");
	   document.frmservicerequest.cmbsubcalltype.focus();
      return false;
	   }	   
	   
	   	   if (document.frmservicerequest.cmbReprod.value=="")
	   {  
	   alert("Type Can't be Empty");
	   document.frmservicerequest.cmbReprod.focus();
      return false;
	   }

	   if (document.frmservicerequest.txtdescription.value=="")
	   {  
	   alert("Diagnosis Can't be Empty");
	   document.frmservicerequest.txtdescription.focus();
      return false;
	   }
	   
	      
    if (document.all.txtdescription.value.length>250)
		{
		alert("Diagnosis Cannot be Greater than 250 Characters")
		document.all.txtdescription.focus()
		 return false;
		}	   
	   	   
	   
	   	 if (document.frmservicerequest.cmbService.value=="")
	   {  
	   alert("Please Select Service code..");
	   document.frmservicerequest.cmbService.focus();
	      return false;
	   }
	   
	   
	  /* 
	
	if (rtndatetime1(document.all.txtclosedate,"Completed Date") == false)
	   {  
	   return false;
	   }
	   
   
   if(document.all.txtclosedate.value != "")
	   {
   		frmv=checkdatetimevalue(document.all.txtCallDate.value,document.all.txtclosedate.value)
		if (frmv==1)
			{
   			alert("Completed Date cannot be lesser than Call Date ...");
			return false;
			}
		}
		*/
	if (rtndatetime1(document.all.txtcommitteddate,"Committed Date") == false )
	   {  
	      return false;
	   }
	
	if(document.all.txtcommitteddate.value != "")
		{
	   frmv=checkdatetimevalue(document.all.txtopendate.value,document.all.txtcommitteddate.value)
   		if (frmv==1)
   			{
	   		alert("Committed Date cannot be lesser than Open Date ...");
			return false;
			}
		}
		
	/*	

	 if ((document.all.cmbstatus.value=="Close") && (document.all.txtclosedate.value==""))
		{
		  alert("Completed Date can't be empty as Status is 'Closed'....");
		  document.all.txtclosedate.value.focus;
		  return false;
		 }
		 */

	var	chkstr=document.all.cmbstatus.value
	var resultchkstr = chkstr.indexOf("Close")
	/*
	
	if ((document.all.txtclosedate.value!="") && (resultchkstr == -1))
		{
			//alert("Status cannot be '" + document.all.cmbstatus.value  + "' as Closed date is given...");
			alert("Completed date has been cleared since status is '" + document.all.cmbstatus.value  + "'");
			document.all.txtclosedate.value=""
	 	   return false;
		}
		
		*/
   
  if (document.all.cmbstatus.value=="Close")
	{
 		Version = navigator.appVersion
   		if 	(Version.indexOf("MSIE 5.0")!=-1)
   		{
   			retval= window.showModalDialog ("CheckActivityDone.asp?srno=" + document.all.txtSrno.value);
			if (String(retval) !="undefined")
			{ 
				arrtemp = retval.split("|")
   				document.all.hdnActivityDone.value = arrtemp[0]
   				document.all.hdnProdblemFix.value = arrtemp[1]
   			}
   		}
	}
 /*
	if (document.all.PhoneFix.checked)
   {
   		if (document.all.cmbstatus.value=="Close")
   		{
   			if (document.all.hdnProdblemFix.value=="")
   			{
   				alert("Enter the Problem and Fix Details")
   				return false;
   			}
   		}   	   
   	   document.all.hdnPhoneFix.value="yes"
 	}
 
 	if (document.all.PhoneFix.checked)
   {	   
   	   document.all.hdnPhoneFix.value="yes"
 	}

 	
   if (!document.all.PhoneFix.checked)
   {
   	   if (document.all.cmbstatus.value=="Close")
   		{
   			if (document.all.hdnActivityDone.value=="")
   			{
   				alert("Enter the Call Close Details")
   				return false;
   			}
   		}
   		
   }
   
   		if (document.all.cmbstatus.value=="Close")
   		{
   			if (document.all.hdnProdblemFix.value=="")
   			{
   				alert("Enter the Problem and Fix Details")
   				return false;
   			}
   		}
   		document.all.hdnPhoneFix.value="no"
   }
   */
 

/*	if (document.all.chkDown.checked && document.all.txtDownTime.value=="")
	{
		alert("Down Time Can't be Empty...")	
		document.all.txtDownTime.focus()
		return false;
	}
	
	if(!checkDown())
	return false */

 if (document.all.cmbsubstatus.value=="")
 {
 alert("Please Select Sub Status...")
 document.all.cmbsubstatus.focus()
 return false;
 }	
 if(document.all.hdnIsCheque.value=="Yes")
 {
  

 /*
   if (document.all.txtChequeNo.value=="")
 {
     alert("Cheque No Can't be Empty...")	
		document.all.txtChequeNo.focus()
		return false;

 }	
  if (document.all.txtChequeDate.value!="")
 {
   if (rtndateonly1(document.all.txtChequeDate,"Cheque Date") == false )
	 {  
	      return false;
	 }
 }	
  
 if (document.all.txtbankname.value=="")
 {
     alert("Bank Name Can't be Empty...")	
		document.all.txtbankname.focus()
		return false;

 }	

 
	 if (document.all.txtrcheamt.value=="")
     {
        alert("Cheque Amount Can't be Empty...")	
		document.all.txtrcheamt.focus()
		return false;

    }	
    */	
    //if(document.all.txtChequeNo.value =="")
    //{
     if (document.all.hdnBankList.value=="")
	  { 
	  alert("Enter Cheque/Desposit Issue Details");
	 // document.all.txtbankname.focus();
	  return false;
	  }
	//}


 }
	return true;
}
function checkstring(obj) {
    
    var specialchars = "`~#%^&+=|'><*"
    var retval;
    var inobj, message;
    inobj = obj;
    a = inobj.value;
    if (a == "") {
        return;
    }
    l = a.length;
    retval = "";
    for (i = 0; i < l; i++) {
        if (specialchars.indexOf(a.charAt(i)) == -1) {
            if (a.charCodeAt(i) != 34) {
                retval = retval + a.charAt(i)
            }
        }
    }
    inobj.value = retval;
    return;
}


function showcheqdet(){
//kavi Oct 05
var rtnChequeDet 
	rtnChequeDet=window.showModalDialog("chequedet.asp?srno=" + document.all.txtSrno.value +"&hdnBankList=" + document.all.hdnBankList.value,null,'dialogwidth=770Px;dialogHeight=300Px;status:no;')
   if (String(rtnChequeDet) !="undefined")
	{	 
		document.all.hdnBankList.value=rtnChequeDet
	}
	else
	{	document.all.hdnBankList.value=""
	} 

}

function EntInfo()
{ 
	showEntInfo(document.all.hdnaccode.value,document.all.txtEquipID.value)

}

/*	function checkDown()
	{	var str,count,lsstr1
		var lsDown1=new Array();

		if(document.all.txtDownTime.value!="")
		{	str=document.all.txtDownTime.value
			count=str.indexOf(":")
			if(count!=2)
			{ alert("Down Time Format (HH:MM)")
				document.all.txtDownTime.focus()
				return false
			}
			if(str.length!=5)
			{	alert("Down Time Format (HH:MM)")
				document.all.txtDownTime.focus()
				return false;
			}
			if((count==2)&&(str.length==5))
			{	lsstr1=document.all.txtDownTime.value
				lsDown1=lsstr1.split(":")
				if(lsDown1[1]>=60)
				{   alert("Invalid Minute Value")
					document.all.txtDownTime.focus()
  					return false;
				}
			
				return true;
			}
		}
		return true;
	}
function fncheckTime()
	{
	alert("hi"); 
	var l=document.all.txtDownTime.value
		var lsDwn=new Array();
		var ls=new Array();
		var ls_s
		ls_s=""
		if(l.indexOf(".")>0)
		{ lsDwn=l.split(".")
			if(lsDwn[0].length==1)
			{lsDwn[0]="0"+lsDwn[0]
			} 		
			if(lsDwn[1].length==1)
			{lsDwn[1]="0"+lsDwn[1]
			}

			ls_s=lsDwn[0]+":"+lsDwn[1]			
		}
			
		else if(l.indexOf(":") ==-1)
		{
			if(l.length==4)
			{
			ls_s=(l.substr(0,l.length-2))+":"+(l.substr(l.length-2,2))
			}
			if(l.length==2)
			{ls_s=l+":"+"00"
			}
			if(l.length==1)
			{ls_s="0"+l+":"+"00"
			}
			if(l.length==3)
			{ ls_s=(l.substr(0,l.length-1))+":"+"0"+(l.substr(l.length-1,1))
			}
		}
		
		if(ls_s!="")
		document.all.txtDownTime.value=ls_s
	} */
	
	function checkTime(eveval)
	{
		if((eveval<48||eveval>57)&&(eveval!=58)&&(eveval!=46))
		{
		event.keyCode=0;
			return false;
		}
	return true;

	}

function showCallClose(){

if (document.all.PhoneFix.checked)
{
alert("Call Close is not applicable for Phone fix Call")
return false
}

if (document.all.cmbstatus.value!="Close")
{
	alert("Status should be Close...")
	return false
}
if (document.all.cmbstatus.value =="Close")
{

Srno=document.all.txtSrno.value
AccCode= document.all.hdnaccode.value
txtCallDate=document.all.txtCallDate.value
txtAccount=document.all.txtAccount.value
txtEquipID=document.all.txtEquipID.value
txtProduct=document.all.txtProduct.value
cmbModule=document.all.cmbModule.value
txtContact=document.all.txtContact.value
txtSiteID=document.all.txtSiteID.value
txtsite=document.all.txtsite.value
txtEquipID=document.all.txtEquipID.value
hdnprodcode=document.all.hdnprodcode.value
chkDown=document.all.chkDown.value
txtdescription=document.all.txtdescription.value
txtDownTime=document.all.txtDownTime.value


  if (checksrno() == false)
	{ alert("Enter a Valid Service Request Number");
	  document.frmservicerequest.txtSrno.focus();
	  return false;
	}
	
		
  if (document.all.txtEquipID.value =="" || document.frmservicerequest.hdnprodcode.value =="")
	{ alert("Please Enter ATM ID");
	  document.all.txtEquipID.focus();
	  return false;
	}
	
  if (document.frmservicerequest.txtSiteID.value =="" || document.frmservicerequest.hdnaccode.value =="")
	{ alert("Select a Site ID..");
	  document.frmservicerequest.txtSiteID.focus();
	  return false;
	}

  if (document.all.txtEquipID.value !=document.frmservicerequest.hdnEquipID.value)
	{ alert("Invalid ATM ID, Click Help button to select a proper ATM ID");
	  document.all.txtEquipID.focus();
	  return false;
	}

	 if (document.frmservicerequest.txtopendate.value=="")
	   {  
	   alert("Open Date is Empty....");
	   document.frmservicerequest.txtopendate.focus();
	      return false;
	   }
	   
		if (document.frmservicerequest.txtCallDate.value=="")
	   {  
	   alert("Call Date Can't be Empty");
	   document.frmservicerequest.txtCallDate.focus();
      return false;
	   }
	   if (rtndatetime1(document.all.txtCallDate,"Call Date") == false )
	   {  
      return false;
	   }
	   
	   if (document.all.txtCallDate.value!="")
		{
   		frmv=checkdatetimevalue(document.all.txtCallDate.value,document.all.hdndatenow.value)
		if (frmv==1)
			{
   				alert("Call Date cannot be greater than Current Date ...");
				return false;
			}
		}  
 
	if (rtndatetime1(document.all.txtopendate,"Open Date") == false )
	   {  
   		   return false;
	   }
	/*
	if (rtndatetime1(document.all.txtclosedate,"Completed Date") == false)
	   {  
		   return false;
	   }
   
   if(document.all.txtclosedate.value != "")
	   {
   		frmv=checkdatetimevalue(document.all.txtCallDate.value,document.all.txtclosedate.value)
		if (frmv==1)
			{
   			alert("Completed Date cannot be lesser than Call Date ...");
			return false;
			}
		}
	*/	
	if (rtndatetime1(document.all.txtcommitteddate,"Committed Date") == false )
	   {  
	      return false;
	   }
	
	if(document.all.txtcommitteddate.value != "")
		{
	   frmv=checkdatetimevalue(document.all.txtopendate.value,document.all.txtcommitteddate.value)
   		if (frmv==1)
   			{
	   		alert("Committed Date cannot be lesser than Open Date ...");
			return false;
			}
		}
	
		 if (document.all.txtCallDate.value!="")
		{

	   			frmv=checkdatevalue(document.all.hdndatenow2.value,document.all.txtCallDate.value)
				if (frmv==1)
				{
   					alert("Call Date cannot be back dated more than " + document.all.hdncallbackdate.value + " day[s]...");
					return false;                                        
			    }
		
		}  
	
	/*		
	 if ((document.all.cmbstatus.value=="Close") && (document.all.txtclosedate.value==""))
		{
		  alert("Completed Date can't be empty as Status is 'Close'....");
		  document.all.txtclosedate.value.focus;
		  return false;
		 }
	*/	 
	var	chkstr=document.all.cmbstatus.value
	var resultchkstr = chkstr.indexOf("Close")
	/*
	if ((document.all.txtclosedate.value!="") && (resultchkstr == -1))
		{
			//alert("Status cannot be '" + document.all.cmbstatus.value  + "' as Closed date is given...");
			alert("Completed date has been cleared since status is '" + document.all.cmbstatus.value  + "'");
			document.all.txtclosedate.value=""
	 	   return false;
		}
   
   if (document.all.txtdescription.value.length>500)
		{
		alert("Diagnosis Cannot be Greater than 500 Characters")
		document.all.txtdescription.focus()
		 return false;
		}
		*/ 
/*
	if (document.all.chkDown.checked && document.all.txtDownTime.value=="")
	{
		alert("Down Time Can't be Empty...")	
		document.all.txtDownTime.focus()
		return false;
	} 
*/	
	if(!checkDown())
	return false;
var retval
checkstring(document.all.txtdescription)


//retval= window.showModalDialog ("popActivity.asp?From=servicerequest&srno=" + document.all.txtSrno.value + "&AccCode=" +  document.all.hdnaccode.value + "&txtCallDate=" + document.all.txtCallDate.value + "&txtAccount=" + document.all.txtAccount.value + " &txtEquipID=" + document.all.txtEquipID.value + "&cmbLocation=" + document.all.cmbLocation.value+"&cmbCSE="+ document.all.cmbCSE.value  + "&cmbModule=" + document.all.cmbModule.value + "&txtContact=" + document.all.txtContact.value + "&txtSiteID=" + document.all.txtSiteID.value + "&txtsite=" + document.all.txtsite.value + "&cmbCSEName=" + document.all.cmbCSE.options[document.all.cmbCSE.selectedIndex].text + "&txtEquipID=" + document.all.txtEquipID.value +"&cmbService=" +document.all.cmbService.value + "&txtProduct=" + document.all.txtProduct.value + "&hdnprodcode=" + document.all.hdnprodcode.value + "&chkDown=" + document.all.chkDown.value + "&txtdescription=" + document.all.txtdescription.value + "&txtDownTime=" + document.all.txtDownTime.value + "&Completedate=" + document.all.txtclosedate.value,null,'dialogwidth=780Px;dialogHeight=350Px;status:no;');
//retval= window.showModalDialog ("popActivity.asp?From=servicerequest&srno=" + document.all.txtSrno.value + "&AccCode=" +  document.all.hdnaccode.value + "&txtCallDate=" + document.all.txtCallDate.value + "&txtAccount=" + document.all.txtAccount.value + " &txtEquipID=" + document.all.txtEquipID.value + "&cmbLocation=" + document.all.cmbLocation.value+"&cmbCSE="+ document.all.cmbCSE.value  + "&txtContact=" + document.all.txtContact.value + "&txtSiteID=" + document.all.txtSiteID.value + "&txtsite=" + document.all.txtsite.value + "&cmbCSEName=" + document.all.cmbCSE.options[document.all.cmbCSE.selectedIndex].text + "&txtEquipID=" + document.all.txtEquipID.value +"&cmbService=" + document.all.cmbService.value + "&txtProduct=" + document.all.txtProduct.value + "&hdnprodcode=" + document.all.hdnprodcode.value + "&chkDown=" + document.all.chkDown.value + "&txtdescription=" + document.all.txtdescription.value + "&txtDownTime=" + document.all.txtDownTime.value + "&Completedate=" + document.all.txtclosedate.value + "&mode=" + document.all.hdnmode.value,null,'dialogwidth=780Px;dialogHeight=350Px;status:no;');
//retval= window.showModalDialog ("popActivity.asp?From=servicerequest&DefClose=Yes&srno=" + document.all.txtSrno.value + "&AccCode=" +  document.all.hdnaccode.value + "&txtCallDate=" + document.all.txtCallDate.value + "&txtAccount=" + document.all.txtAccount.value + " &txtEquipID=" + document.all.txtEquipID.value + "&cmbLocation=" + document.all.cmbLocation.value+"&cmbCSE="+ document.all.cmbCSE.value  + "&txtContact=" + document.all.txtContact.value + "&txtsite=" + document.all.txtsite.value + "&cmbCSEName=" + document.all.cmbCSE.options[document.all.cmbCSE.selectedIndex].text + "&cmbService=" + document.all.cmbService.value + "&txtProduct=" + document.all.txtProduct.value + "&hdnprodcode=" + document.all.hdnprodcode.value + "&chkDown=" + document.all.chkDown.value + "&txtdescription=" + document.all.txtdescription.value + "&txtDownTime=" + document.all.txtDownTime.value + "&Completedate=" + document.all.txtclosedate.value + "&mode=" + document.all.hdnmode.value,null,'dialogwidth=780Px;dialogHeight=350Px;status:no;');
retval= window.showModalDialog ("popActivity.asp?From=servicerequest&DefClose=Yes&srno=" + document.all.txtSrno.value + "&AccCode=" +  document.all.hdnaccode.value + "&txtCallDate=" + document.all.txtCallDate.value + "&txtAccount=" + document.all.txtAccount.value + " &txtEquipID=" + document.all.txtEquipID.value +"&cmbCSE="+ document.all.cmbCSE.value  + "&txtContact=" + document.all.txtContact.value + "&txtsite=" + document.all.txtsite.value + "&cmbCSEName=" + document.all.cmbCSE.options[document.all.cmbCSE.selectedIndex].text + "&cmbService=" + document.all.cmbService.value + "&txtProduct=" + document.all.txtProduct.value + "&hdnprodcode=" + document.all.hdnprodcode.value + "&chkDown=" + document.all.chkDown.value + "&txtdescription=" + document.all.txtdescription.value + "&txtDownTime=" + document.all.txtDownTime.value +	"&mode=" + document.all.hdnmode.value,null,'dialogwidth=780Px;dialogHeight=350Px;status:no;');


if (String(retval) !="undefined")
{ 
document.all.hdnActivityDone.value =retval
}

}
}

function showFollowUpClose(){




  if (checksrno() == false)
	{ alert("Enter a Valid Service Request Number");
	  document.frmservicerequest.txtSrno.focus();
	  return false;
	}
	
		
  if (document.all.txtEquipID.value =="" || document.frmservicerequest.hdnprodcode.value =="")
	{ alert("Please Enter ATM ID");
	  document.all.txtEquipID.focus();
	  return false;
	}
	
  if (document.frmservicerequest.txtSiteID.value =="" || document.frmservicerequest.hdnaccode.value =="")
	{ alert("Select a Site ID..");
	  document.frmservicerequest.txtSiteID.focus();
	  return false;
	}

  if (document.all.txtEquipID.value !=document.frmservicerequest.hdnEquipID.value)
	{ alert("Invalid ATM ID, Click Help button to select a proper ATM ID");
	  document.all.txtEquipID.focus();
	  return false;
	}

	 if (document.frmservicerequest.txtopendate.value=="")
	   {  
	   alert("Open Date is Empty....");
	   document.frmservicerequest.txtopendate.focus();
	      return false;
	   }
	   
		if (document.frmservicerequest.txtCallDate.value=="")
	   {  
	   alert("Call Date Can't be Empty");
	   document.frmservicerequest.txtCallDate.focus();
      return false;
	   }
	   if (rtndatetime1(document.all.txtCallDate,"Call Date") == false )
	   {  
      return false;
	   }
	   
	   if (document.all.txtCallDate.value!="")
		{
   		frmv=checkdatetimevalue(document.all.txtCallDate.value,document.all.hdndatenow.value)
		if (frmv==1)
			{
   				alert("Call Date cannot be greater than Current Date ...");
				return false;
			}
		}  
 
	if (rtndatetime1(document.all.txtopendate,"Open Date") == false )
	   {  
   		   return false;
	   }
	
	
	   if (document.all.txtdescription.value.length>500)
		{
		alert("Diagnosis Cannot be Greater than 500 Characters")
		document.all.txtdescription.focus()
		 return false;
		} 

/*
   if(document.all.txtclosedate.value != "")
	   {
   		frmv=checkdatetimevalue(document.all.txtCallDate.value,document.all.txtclosedate.value)
		if (frmv==1)
			{
   			alert("Completed Date cannot be lesser than Call Date ...");
			return false;
			}
		}
*/
		
	if (rtndatetime1(document.all.txtcommitteddate,"Committed Date") == false )
	   {  
	      return false;
	   }
	
	if(document.all.txtcommitteddate.value != "")
		{
	   frmv=checkdatetimevalue(document.all.txtopendate.value,document.all.txtcommitteddate.value)
   		if (frmv==1)
   			{
	   		alert("Committed Date cannot be lesser than Open Date ...");
			return false;
			}
		}
			
	
	var chkstr=document.all.cmbstatus.value
	var resultchkstr = chkstr.indexOf("Close")
	/*
	if ((document.all.txtclosedate.value!="") && (resultchkstr == -1))
		{
			//alert("Status cannot be '" + document.all.cmbstatus.value  + "' as Closed date is given...");
			alert("Completed date has been cleared since status is '" + document.all.cmbstatus.value  + "'");
			document.all.txtclosedate.value=""
	 	   return false;
		}
	*/
		 if (document.all.txtCallDate.value!="")
		{

	   			frmv=checkdatevalue(document.all.hdndatenow2.value,document.all.txtCallDate.value)
				if (frmv==1)
				{
   					alert("Call Date cannot be back dated more than " + document.all.hdncallbackdate.value + " day[s]...");
					return false;
             }
		
		}  
	
   


	if (document.all.chkDown.checked && document.all.txtDownTime.value=="")
	{
		alert("Down Time Can't be Empty...")	
		document.all.txtDownTime.focus()
		return false;
	} 
	
	if(!checkDown())
	return false; 

var retval
checkstring(document.all.txtdescription)

//retval= window.showModalDialog ("popActivity.asp?From=servicerequest&srno=" + document.all.txtSrno.value + "&AccCode=" +  document.all.hdnaccode.value + "&txtCallDate=" + document.all.txtCallDate.value + "&txtAccount=" + document.all.txtAccount.value + " &txtEquipID=" + document.all.txtEquipID.value + "&cmbLocation=" + document.all.cmbLocation.value+"&cmbCSE="+ document.all.cmbCSE.value  + "&cmbModule=" + document.all.cmbModule.value + "&txtContact=" + document.all.txtContact.value + "&txtSiteID=" + document.all.txtSiteID.value + "&txtsite=" + document.all.txtsite.value + "&cmbCSEName=" + document.all.cmbCSE.options[document.all.cmbCSE.selectedIndex].text + "&txtEquipID=" + document.all.txtEquipID.value +"&cmbService=" +document.all.cmbService.value + "&txtProduct=" + document.all.txtProduct.value + "&hdnprodcode=" + document.all.hdnprodcode.value + "&chkDown=" + document.all.chkDown.value + "&txtdescription=" + document.all.txtdescription.value + "&txtDownTime=" + document.all.txtDownTime.value + ",'dialogwidth=780Px;dialogHeight=350Px;status:no;');
//retval= window.showModalDialog ("popActivity.asp?From=servicerequest&srno=" + document.all.txtSrno.value + "&AccCode=" +  document.all.hdnaccode.value + "&txtCallDate=" + document.all.txtCallDate.value + "&txtAccount=" + document.all.txtAccount.value + " &txtEquipID=" + document.all.txtEquipID.value + "&cmbLocation=" + document.all.cmbLocation.value+"&cmbCSE="+ document.all.cmbCSE.value  + "&txtContact=" + document.all.txtContact.value + "&txtSiteID=" + document.all.txtSiteID.value + "&txtsite=" + document.all.txtsite.value + "&cmbCSEName=" + document.all.cmbCSE.options[document.all.cmbCSE.selectedIndex].text + "&txtEquipID=" + document.all.txtEquipID.value +"&cmbService=" + document.all.cmbService.value + "&txtProduct=" + document.all.txtProduct.value + "&hdnprodcode=" + document.all.hdnprodcode.value + "&chkDown=" + document.all.chkDown.value + "&txtdescription=" + document.all.txtdescription.value + "&txtDownTime=" + document.all.txtDownTime.value + "&Completedate=" + document.all.txtclosedate.value + "&mode=" + document.all.hdnmode.value,null,'dialogwidth=780Px;dialogHeight=350Px;status:no;');
retval= window.showModalDialog ("popActivity.asp?From=servicerequest&FollowUp=Yes&srno=" + document.all.txtSrno.value + "&AccCode=" +  document.all.hdnaccode.value + "&txtCallDate=" + document.all.txtCallDate.value + "&txtAccount=" + document.all.txtAccount.value + " &txtEquipID=" + document.all.txtEquipID.value + "&cmbCSE="+ document.all.cmbCSE.value  + "&txtContact=" + document.all.txtContact.value + "&txtsite=" + document.all.txtsite.value + "&cmbCSEName=" + document.all.cmbCSE.options[document.all.cmbCSE.selectedIndex].text + "&cmbService=" + document.all.cmbService.value + "&txtProduct=" + document.all.txtProduct.value + "&hdnprodcode=" + document.all.hdnprodcode.value + "&chkDown=" + document.all.chkDown.value + "&txtdescription=" + document.all.txtdescription.value + "&txtDownTime=" + document.all.txtDownTime.value + "&mode=" + document.all.hdnmode.value,null,'dialogwidth=780Px;dialogHeight=350Px;status:no;');



if (String(retval) !="undefined")
{ 
document.all.hdnActivityDone.value =retval
}


}

function showProblemFix()
{
if (document.all.cmbstatus.value !="Close")
{
	alert("Status should be Close...")
	return false;
}
if (document.all.cmbstatus.value =="Close")
{
var retval
checkstring(document.all.txtdescription)
	/*
	if (document.all.txtclosedate.value=="")
	{
  		alert("Completed Date can't be empty as Status is 'Close'...");
  		document.all.txtclosedate.value.focus;
  		return false;
	 }
	 */
if (document.all.PhoneFix.checked)
{
phonefixval= "yes"
}
else
{
phonefixval=""
}
	 
retval= window.showModalDialog ("PopProblemFix.asp?From=servicerequest&srno=" + document.all.txtSrno.value,null,'dialogwidth=480Px;dialogHeight=280Px;status:no;');
if (String(retval) !="undefined")
{ 

document.all.hdnProdblemFix.value ="done"	
}

}
}


function checkEquipment()
{
	if (document.all.txtEquipID.value=="")
	{
		alert("Please select the ATM ID")
		document.all.txtEquipID.focus()
		return false;
	}

	if (document.all.txtProduct.value=="")
	{
		alert("Product should not be empty")
		document.all.txtProduct.focus()
		return false;
	}
	return true;
}


var arReceived;
var arToBind;
var optn;
var lsval;
var i;

function BindSubCallType()
{
    var arReceived;
    var arToBind;
    var optn;
//    xml=new XMLHttpRequest();
	if (window.XMLHttpRequest) 
	{
		// code for all new browsers
		xml=new XMLHttpRequest(); 
	}
	else if (window.ActiveXObject) 
	{
		// code for IE5 and IE6
		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
	}

    if(document.getElementById("CmbCallType").value!="")
    {
        var sURL = "../WebRequest.asmx/SubCallType"
        xml.open( "POST", sURL, false );
        xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        var str="strCallType=" +  document.getElementById("CmbCallType").value;
        xml.send(str)
        lsval=xml.responseText;
    }
    fnBindDropDown("cmbsubcalltype");
}

function fnBindService()
{
//    xml=new XMLHttpRequest();
	if (window.XMLHttpRequest) 
	{
		// code for all new browsers
		xml=new XMLHttpRequest(); 
	}
	else if (window.ActiveXObject) 
	{
		// code for IE5 and IE6
		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
	}

    if(document.getElementById("txtEquipID").value!="")
    {
        var sURL = "../WebRequest.asmx/fnBindService"
        xml.open( "POST", sURL, false );
        xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        var str="EquipId=" +  document.getElementById("txtEquipID").value;
        xml.send(str)
        lsval=xml.responseText;
    }
    fnBindDropDown("cmbService");    
}

function fnBindEngineers()
{
//    xml=new XMLHttpRequest();
	if (window.XMLHttpRequest) 
	{
		// code for all new browsers
		xml=new XMLHttpRequest(); 
	}
	else if (window.ActiveXObject) 
	{
		// code for IE5 and IE6
		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
	}

    if(document.getElementById("txtEquipID").value!="")
    {
        var sURL = "../WebRequest.asmx/fnBindEngineers"
        xml.open( "POST", sURL, false );
        xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        var str="VendorCode=" +  document.getElementById("txtEquipID").value;
        str+="&Location=" +  document.getElementById("txtEquipID").value;
        xml.send(str)
        lsval=xml.responseText;
    }
    fnBindDropDown("cmbCSE");
}

function fnBindDropDown(cmbDropDown)
{
    optn = document.createElement("option");
    document.getElementById(cmbDropDown).options.length=0;
    document.getElementById(cmbDropDown).options.add(optn);
    optn.text="<--Select-->";
    optn.value="";
    if(lsval!="")
    {
        arReceived = lsval.split("^");
        for(i=0;i<arReceived.length;i++)
        {
            arToBind = arReceived[i].split("|");
            optn = document.createElement("option");
            document.getElementById(cmbDropDown).options.add(optn);
            optn.text=arToBind[0];
            optn.value=arToBind[1];
        }
    }
}