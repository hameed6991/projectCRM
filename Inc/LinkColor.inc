<script>
CurLink=""
function ChgColor(lnk){
	document.all(String(lnk)).style.color='Red';
	if(!CurLink=="")
		document.all(CurLink).style.color='#CFEBF9';
	CurLink=String(lnk)
}

</script>
