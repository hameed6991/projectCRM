<script>
function pattern(mytype,objfrom,objto)
{
<%
dim TodDate
dim YesDate
dim LWDate
dim LMDate
dim LYDate
TodDate=Date()
YesDate=DateAdd ("d",-1,Date)
LWDate=DateAdd ("d",-7,Date)
LMDate=DateAdd ("m",-1,Date)
LYDate=DateAdd ("m",-12,Date)

response.write LYDate

%>

switch(mytype)
{

case "1" :
	{
	objfrom.value = fmtpdate(<%=Day(TodDate)%>,<%=Month(TodDate)%>,<%=Year(TodDate)%>)	
	objto.value = fmtpdate(<%=Day(TodDate)%>,<%=Month(TodDate)%>,<%=Year(TodDate)%>)	
	return;
	break;
	}
case "2" :
	{
	objfrom.value = fmtpdate(<%=Day(YesDate)%>,<%=Month(YesDate)%>,<%=Year(YesDate)%>)	
	objto.value = fmtpdate(<%=Day(YesDate)%>,<%=Month(YesDate)%>,<%=Year(YesDate)%>)
	return;
	break;
	}
case "3" :
	{
	objfrom.value = fmtpdate(<%=Day(LWDate)%>,<%=Month(LWDate)%>,<%=Year(LWDate)%>)	
	objto.value = fmtpdate(<%=Day(YesDate)%>,<%=Month(YesDate)%>,<%=Year(YesDate)%>)	
	return;
	break;
	}
case "4" :
	{
	objfrom.value = fmtpdate(<%=Day(LMDate)%>,<%=Month(LMDate)%>,<%=Year(LMDate)%>)	
	objto.value = fmtpdate(<%=Day(YesDate)%>,<%=Month(YesDate)%>,<%=Year(YesDate)%>)	
	return;
	break;
	}
case "5" :
	{
	objfrom.value = fmtpdate(<%=Day(LYDate)%>,<%=Month(LYDate)%>,<%=Year(LYDate)%>)	
	objto.value = fmtpdate(<%=Day(YesDate)%>,<%=Month(YesDate)%>,<%=Year(YesDate)%>)
	return;
	break;
	}
	
case "None" :	
	{
		objfrom.value = ""
		objto.value = ""
	}
}

}

function fmtpdate(d,m,y)
{
if(String(d).length==1) 
	d="0" + d
if(String(m).length==1) 
	m="0" + (m)

return d + "/"  + m +  "/"  + y

}

function patterndatetime(mytype,objfrom,objto)
{
switch(mytype)
{

case "1" :
	{
	objfrom.value = fmtpdate(<%=Day(TodDate)%>,<%=Month(TodDate)%>,<%=Year(TodDate)%>) + " 00:00"	
	objto.value = fmtpdate(<%=Day(TodDate)%>,<%=Month(TodDate)%>,<%=Year(TodDate)%>) + " 23:59"	
	return;
	break;
	}
case "2" :
	{
	objfrom.value = fmtpdate(<%=Day(YesDate)%>,<%=Month(YesDate)%>,<%=Year(YesDate)%>) + " 00:00"		
	objto.value = fmtpdate(<%=Day(YesDate)%>,<%=Month(YesDate)%>,<%=Year(YesDate)%>)  + " 23:59"	
	return;
	break;
	}
case "3" :
	{
	objfrom.value = fmtpdate(<%=Day(LWDate)%>,<%=Month(LWDate)%>,<%=Year(LWDate)%>)	 + " 00:00"	
	objto.value = fmtpdate(<%=Day(YesDate)%>,<%=Month(YesDate)%>,<%=Year(YesDate)%>)  + " 23:59"		
	return;
	break;
	}
case "4" :
	{
	objfrom.value = fmtpdate(<%=Day(LMDate)%>,<%=Month(LMDate)%>,<%=Year(LMDate)%>)	 + " 00:00"	
	objto.value = fmtpdate(<%=Day(YesDate)%>,<%=Month(YesDate)%>,<%=Year(YesDate)%>) + " 23:59"		
	return;
	break;
	}
case "5" :
	{
	objfrom.value = fmtpdate(<%=Day(LYDate)%>,<%=Month(LYDate)%>,<%=Year(LYDate)%>)	 + " 00:00"	
	objto.value = fmtpdate(<%=Day(YesDate)%>,<%=Month(YesDate)%>,<%=Year(YesDate)%>)  + " 23:59"	
	return;
	break;
	}
	
case "None" :	
	{
		objfrom.value = ""
		objto.value = ""
	}
}

}
</script>