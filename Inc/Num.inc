<script language="javascript">
function num(ss,s)
{
	var tv
	tv=ss.value
	
	if (tv=="")
	 return true;
	else
	if (isNaN(tv)==true)
	{
	alert("  Not a Valid" +s+ " ......")
	ss.focus()
	return false;
	}
}
</script>