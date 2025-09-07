<script language = "Javascript">
function warrantycheck(TransFlag,TransNo,TransTable,TransField,TransType,ProdPartFlag,EquipId,PCode)
{
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }

	//var xml = new ActiveXObject( "Microsoft.XMLHTTP" );
	var sURL = "INC/CheckWarranty.asp?TransFlag="+TransFlag+"&TransNo="+TransNo+"&TransTable="+TransTable+"&TransField="+TransField+"&TransType="+TransType+"&ProdPartFlag="+ProdPartFlag+"&EquipId="+EquipId+"&PCode="+PCode
	xml.open( "POST", sURL, false);
	xml.send();
	var lsval = xml.responseText;
	var retValue=lsval
	if (retValue != "")
		return retValue;
}
</Script>

