<%

if session("username")="" or isnull(session("username")) then 
	alert "5","5","","","",""
	Response.End 
end if 

if lcase(session("username")) = "administrator"   then
	alert "9","9","","","",""
	Response.End
end if

%>