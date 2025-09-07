<script>
function repPrimeAdd(){
strAddress=document.all("hdnAddress").value 

var arrAdd=new Array()
var arrAddtemp=new Array()
var arrAddtemp1=new Array(10)
arrAddtemp[0]=document.all("txtAddress").value 
arrAddtemp[1]=document.all("txtSite").value
arrAddtemp[2]=document.all("txtSyn").value 
arrAddtemp[3]=document.all("txtCity").value
arrAddtemp[4]=document.all("cmbState").value
arrAddtemp[5]=document.all("txtM_Phone").value
arrAddtemp[6]=document.all("txtZip").value 
arrAddtemp[7]=document.all("cmbCountry").value 
arrAddtemp[8]=document.all("txtContType").value
arrAddtemp[9]=document.all("txtURL").value 
arrAddtemp[10]=document.all("hdnCNo").value
arrAddtemp[11]=document.all("hdnSiteCode").value  

arrAdd=strAddress.split("**")
strAddress=""
primAdd=parseInt(arrAdd[0])

for(i=1;i<arrAdd.length-1;i++){
	if (primAdd==i)
	{
		arrAddtemp1=arrAdd[i].split("||")
		
		arrAddtemp1=arrAddtemp
		strAddress1=""
		for(k=0;k<=arrAddtemp1.length-1;k++){
			strAddress1=strAddress1 + arrAddtemp1[k]	+ "||"				
		}	
		strAddress=strAddress + strAddress1 + "**"	
	}
	else
	{
		strAddress=strAddress + arrAdd[i] + "**"
	}
	
}
strAddress=primAdd + "**" + strAddress 
document.all("hdnAddress").value =strAddress

}

function AddPrimeAdd(){
strAddress="1**"
strAddress=strAddress + document.all("txtAddress").value  + "||"
strAddress = strAddress + document.all("txtSite").value  + "||"
strAddress = strAddress + document.all("txtSyn").value  + "||" 
strAddress = strAddress + document.all("txtCity").value  + "||"
strAddress = strAddress + document.all("cmbState").value  + "||"
strAddress = strAddress + document.all("txtM_Phone").value  + "||"
strAddress = strAddress + document.all("txtZip").value  + "||" 
strAddress = strAddress + document.all("cmbCountry").value  + "||" 
strAddress = strAddress + document.all("txtContType").value  + "||"
strAddress = strAddress + document.all("txtURL").value  + "||"
strAddress = strAddress + document.all("hdnCNo").value  + "||"
strAddress = strAddress + document.all("hdnSiteCode").value  + "||"    
strAddress=strAddress + "**"
document.all("hdnAddress").value =strAddress
}

function repCNo(CNoVal,PCNo,PCType){
var arrCNO=new Array()
strCRNo=""
arrCNO=CNoVal.split("~")
PrimeCNo=arrCNO[0]
for(d=1;d<arrCNO.length-1;d++){
	if (PrimeCNo==d)
	{
		strCRNo=strCRNo + PCNo  + "^" + PCType  + "^" + "~"
	}
	else
		strCRNo=strCRNo + arrCNO[d] + "~"
}
	
strCRNo=PrimeCNo + "~" + strCRNo
return strCRNo	
}
</script>