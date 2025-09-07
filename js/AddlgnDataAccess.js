// JScript File


function Checktype(type)
{
    var chltype = type;
    if(chltype == "D")
    {
        document.all.hdnesctype.value = "Daily";
        document.all.ChkDaily.checked = true;
        document.all.ChkWeekly.checked = false;
        document.all.cmbsenton.style.visibility='hidden'
        document.all.tdday.style.visibility='hidden'
        document.all.cmdrepeat.disabled = false
        document.all.cmbsenton.disabled = false
        document.all.cmbendtime.disabled = false

    }
    else
    {
        document.all.hdnesctype.value = "Weekly";
        document.all.ChkDaily.checked = false;
        document.all.ChkWeekly.checked = true;
        document.all.cmbsenton.style.visibility=""
        document.all.tdday.style.visibility=""
        document.all.cmdrepeat.disabled = true
        document.all.cmbendtime.disabled = true
    }
}




function Checkservice(type)
{
    var chltype = type;
    if(chltype == "F")
    {
        document.all.chksa.checked = false;
        document.all.chksf.checked = true;
        document.all.cmbservicecode.disabled = false;

    }
    else
    {
        document.all.chksa.checked = true;
        document.all.chksf.checked = false;
        document.all.cmbservicecode.disabled = true;

        document.all.hdnApiList.value = "";
        document.all.hdnApiList1.value = "";
        document.all.cmbservicecode.selectedIndex =0;
    }
}

function CheckPrincipal(type)
{
    var chltype=type;
    if(chltype=="F")
    {
        document.all.chkPrincipala.checked = false;
        document.all.chkPrincipalf.checked = true;
        document.all.btnPrincipalGrp.disabled = false;        
    }
    else
    {
        document.all.chkPrincipala.checked = true;
        document.all.chkPrincipalf.checked = false;
        document.all.btnPrincipalGrp.disabled = true;
        document.all.hdnPrincipallist.value="";
        document.all.hdnPrincipal.value = "";
        document.all.txtprincipal.value = "";        
    }
}

function CheckRegion(type)
{
    var chltype = type;
    if(chltype == "F")
    {
        document.all.chkra.checked = false;
        document.all.chkrf.checked = true;
        document.all.txtRegionlist.disabled = false;
        document.all.btnRegionGroup.disabled = false;
    }
    else
    {
        document.all.chkra.checked = true;
        document.all.chkrf.checked = false;
        document.all.txtRegionlist.value = "";
        document.all.hdnRegionlist.value = "";
        document.all.txtRegionlist.disabled = true;
        document.all.btnRegionGroup.disabled = true;

    }
}

function CheckLocation(type)
{
    var chltype = type;
    if(chltype == "F")
    {
        document.all.chkla.checked = false;
        document.all.chklf.checked = true;
        document.all.txtLocationlist.disabled = false;
        document.all.btnLocationGroup.disabled = false;
    }
    else
    {
        document.all.chkla.checked = true;
        document.all.chklf.checked = false;
        document.all.txtLocationlist.value = "";
        document.all.hdnLocationlist.value = "";
        document.all.txtLocationlist.disabled = true;
        document.all.btnLocationGroup.disabled = true;
    }
}

function chkProductCat(type)
{
    var chltype=type;
    if(chltype=="F")
    {
        document.all.chkPrdCata.checked = false;
        document.all.chkPrdCatf.checked = true;
        document.all.btnProductCat.disabled = false;        
    }
    else
    {
        document.all.chkPrdCata.checked = true;
        document.all.chkPrdCatf.checked = false;
        document.all.btnProductCat.disabled = true;
        document.all.hdnProductCatlist.value="";
        document.all.hdnProductCat.value = "";
        document.all.txtProductCat.value = "";        
    }
}



function SetIniValues()
{

    if(document.all.cmbservicecode.value!="")
    {
        document.all.chksf.checked = true;
        document.all.chksa.checked = false;
        document.all.cmbservicecode.disabled = false;
    }

    if(document.all.hdnstrRegionlist.value!="")  
    {
        document.all.chkrf.checked = true;
        document.all.chkra.checked = false;
        document.all.txtRegionlist.disabled = false;
        document.all.btnRegionGroup.disabled = false;
    }

    if(document.all.hdnstrLocationlist.value!="")  
    {
        document.all.chklf.checked = true;
        document.all.chkla.checked = false;
        document.all.txtLocationlist.disabled = false;
        document.all.btnLocationGroup.disabled = false;
    }

    if(document.all.hdnstrPrincipallist.value!="")
    {
        document.all.chkPrincipalf.checked = true;
        document.all.chkPrincipala.checked = false;
        document.all.txtprincipal.disabled = false;
        document.all.btnPrincipalGrp.disabled = false;
    }


    if(document.all.hdnstrProductCatlist.value!="")
    {
        document.all.chkPrdCatf.checked = true;
        document.all.chkPrdCata.checked = false;
        document.all.txtProductCat.disabled = false;
        document.all.btnProductCat.disabled = false;
    }


   var hdnstrRegionList;
   var hdnstrLocationList;
   var hdnstrPrincipalList;
   var hdnstrProductCatList;
	  
	  hdnstrRegionList = document.all.hdnstrRegionlist.value;
	  hdnstrLocationList = document.all.hdnstrLocationlist.value;
	  hdnstrPrincipalList = document.all.hdnstrPrincipallist.value;
	  hdnstrProductCatList = document.all.hdnstrProductCatlist.value;
	  
	  
  	  var aRows = new Array();
	  var aFields = new Array();
	  var aMaxsub = new Array();
	  var aMax  = new Array();
	  var RowData = "";
	  

    if (hdnstrRegionList!= "")
    {	 
        aRows = hdnstrRegionList.split("|||");
        RowCount = aRows.length-1;
        for (var i=0; i < RowCount; i++)
        {
            RowData = aRows[i];
            aFields = RowData.split("^^^");	
            document.all.hdnRegionlist.value=document.all.hdnRegionlist.value + aFields[0]  + "|";
            document.all.txtRegionlist.value=document.all.txtRegionlist.value + aFields[1] + ";";
            
        }
    }

    if (hdnstrLocationList!= "")
    {	 
        aRows = hdnstrLocationList.split("|||");
        RowCount = aRows.length-1;
        for (var i=0; i < RowCount; i++)
        {
            RowData = aRows[i];
            aFields = RowData.split("^^^");	
            document.all.hdnLocationlist.value=document.all.hdnLocationlist.value + aFields[0]  + "|";
            document.all.txtLocationlist.value=document.all.txtLocationlist.value + aFields[1] + ";";
        }
    }	

    if (hdnstrPrincipalList!= "")
    {	 
        aRows = hdnstrPrincipalList.split("|||");
        RowCount = aRows.length-1;
        for (var i=0; i < RowCount; i++)
        {
            RowData = aRows[i];
            aFields = RowData.split("^^^");	
            document.all.hdnPrincipallist.value=document.all.hdnPrincipallist.value + aFields[0]  + "|";
            document.all.txtprincipal.value=document.all.txtprincipal.value + aFields[1] + ";";
        }
    }	

    if (hdnstrProductCatList!= "")
    {	 
        aRows = hdnstrProductCatList.split("|||");
        RowCount = aRows.length-1;
        for (var i=0; i < RowCount; i++)
        {
            RowData = aRows[i];
            document.all.hdnProductCatlist.value=document.all.hdnProductCatlist.value + RowData  + "|";
            document.all.txtProductCat.value=document.all.txtProductCat.value + RowData + ";";
        }
    }	
		
}


function ShowRegionlist()
{

	var rtnvalues,a;
	var lhlpvalues = new Array(); 
	var arTemp = new Array();
	rtnvalues = window.showModalDialog("PopSearchRegionlist.asp?Rocode=" +document.all.hdnRegionlist.value,null,"dialogWidth=320Px;dialogHeight=300Px;status:no;");
	if (String(rtnvalues) !="undefined")
	{

		document.all.hdnRegionlist.value="";
		document.all.txtRegionlist.value="";

		 lhlpvalues1 = rtnvalues.split("~");
		 for (i=0;i<lhlpvalues1.length;i++)
		 {
			arTemp = lhlpvalues1[i].split("|");
		 	document.all.hdnRegionlist.value=document.all.hdnRegionlist.value + arTemp[0]  + "|";
		 	document.all.txtRegionlist.value= document.all.txtRegionlist.value + arTemp[1]  + ";" ;
		 }
		 document.all.hdnLocationlist.value=""
         document.all.txtLocationlist.value=""
	}
}


function ShowLocationlist()
{
	var rtnvalues,a;
	var lhlpvalues = new Array(); 
	var arTemp = new Array();

	rtnvalues = window.showModalDialog("PopSearchLocationlist.asp?prodlist=" + document.all.hdnLocationlist.value + "&Rocode=" +document.all.hdnRegionlist.value,null,"dialogWidth=320Px;dialogHeight=300Px;status:no;");
	if (String(rtnvalues) !="undefined")
	{

		document.all.hdnLocationlist.value="";
		document.all.txtLocationlist.value="";

		 lhlpvalues1 = rtnvalues.split("~");
		 for (i=0;i<lhlpvalues1.length;i++)
		 {
			arTemp = lhlpvalues1[i].split("|");
		 	document.all.hdnLocationlist.value=document.all.hdnLocationlist.value + arTemp[0]  + "|";
		 	document.all.txtLocationlist.value= document.all.txtLocationlist.value + arTemp[1]  + ";" ;
		 }
	}
}


function ShowPrincipal()
{

    var rtnvalues,a;
    var lhlpvalues = new Array(); 
    var objProdList = new Object();
    var locationlist ="";
    
    objProdList.DataString = document.all.hdnPrincipallist.value;
    rtnvalues = window.showModalDialog("PopPrincipallist.asp?Principal="+document.all.hdnPrincipallist.value,objProdList,"dialogWidth=530Px;dialogHeight=400Px;status:no;");
    if (String(rtnvalues) !="undefined" && String(rtnvalues) !="")
	    {
	         document.all.hdnPrincipallist.value="";
             document.all.txtprincipal.value="";             
	         lhlpvalues1 = rtnvalues.split("~");
	         for (i=0;i<lhlpvalues1.length;i++)
	         {
        	 
	 		        lhlpvalues = lhlpvalues1[i].split("|");
	 		        document.all.hdnPrincipallist.value=document.all.hdnPrincipallist.value + lhlpvalues[0]  + "|";
	 		        document.all.txtprincipal.value= document.all.txtprincipal.value + lhlpvalues[1]  + ";" ;
        	 

	         }	 	
        }
	 		
}


function ShowProductCategory()
{

    var rtnvalues,a;
    var lhlpvalues = new Array(); 
    var objProdList = new Object();
    var locationlist ="";


    objProdList.DataString = document.all.hdnProductCatlist.value;
    rtnvalues = window.showModalDialog("PopProductCategorylist.asp?ProductCat="+document.all.hdnProductCatlist.value,objProdList,"dialogWidth=530Px;dialogHeight=400Px;status:no;");
    if (String(rtnvalues) !="undefined" && String(rtnvalues) !="")
	    {
	         document.all.hdnProductCatlist.value="";
             document.all.txtProductCat.value="";             
	         lhlpvalues1 = rtnvalues.split("~");
	         for (i=0;i<lhlpvalues1.length;i++)
	         {
        	 
	 		        lhlpvalues = lhlpvalues1[i].split("|");
	 		        document.all.hdnProductCatlist.value=document.all.hdnProductCatlist.value + lhlpvalues[0]  + "|";	 		        
	 		        document.all.txtProductCat.value= document.all.txtProductCat.value + lhlpvalues[0]  + ";" ;
	         }	 	
        }
	 		
}