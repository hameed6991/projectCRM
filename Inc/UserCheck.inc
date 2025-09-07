
	
<%
flg="no"
dim rss
set rss=server.createobject("ADODB.Recordset")
cn.open cnStr
strs = "select * from login where uname='" & username & "' and SessionLogid = '" & SessionLogid  & "' and LOuttime is not null "


rss.open strs,cn,1,3
If not rss.eof Then
	flg="yes"
end if
rss.close
if flg="no" then
strs = "select * from login where uname='" & username & "' and SessionLogid <> '" & SessionLogid  & "' and LOuttime is null "
rss.open strs,cn,1,3
If not rss.eof Then
rss("LOuttime = Zone_now()")
rss.update
rss.close
end if
end if
if 	flg="yes" then

	strs ="select top 1 * from login where uname='" & username & "' and SessionLogid <> '" & SessionLogid  & "' and LOuttime is null  order by LOuttime desc "
	rss.open strs,cn,1,3
	If not rss.eof Then
		ipaddr=rss("ip")
	end if
	rss.close
session.Abandon        

%>
<input type="hidden" value ="<%=ipaddr%>" id ="hdnipaddr">
	<script>alert("Your session is used by another user [ IP : " + document.all.hdnipaddr.value + " ] with same login credentials Page Expired!!!. ;window.open('default.htm','_top');</script>;

<%	 Response.End 
end if
	'Response.End 

cn.close
%>


