<script language = "Javascript">
function AgnoCheck(SerialNo,Acccode,ProdCode)
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
	var sURL = "CheckAgno.asp?SerialNo="+SerialNo+"&Acccode="+Acccode+"&ProdCode="+ProdCode
	xml.open( "POST", sURL, false);
	xml.send();
	var lsval = xml.responseText;
	var retValue=lsval
	if (retValue != "")
		return retValue;
}
</Script>

