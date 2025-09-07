<script language = "Javascript">
function chkrepeat(EquipId,ProdCode)
{
	var xml = new ActiveXObject( "Microsoft.XMLHTTP" );
	var sURL = "EquipCheck.asp?EquipID="+EquipId+"&ProdCode="+ProdCode
	xml.open( "POST", sURL, false);
	xml.send();
	var lsval = xml.responseText;
	var retValue=lsval
	if (retValue != "")
		return retValue;
}
</Script>
