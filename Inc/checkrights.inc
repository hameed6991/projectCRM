<%
function CheckRights(Module,ActType)
''//Modified by Christopher on Feb 14, 2012 for Removing Bulk values from Session
''Role Code is Stored in Session("uRights")
if isnull(session("uRights"))=false and session("uRights")<>"" then
	set cnRights = Server.CreateObject("ADODB.Connection")
	cnRights.open cnstr
	set rskey = server.CreateObject ("adodb.recordset")
	rskey.open " exec sp_CheckRights " & session("uRights") + ",'" & Module & "','" & ActType & "'", cnRights
	CheckRights = rskey(0)
	rskey.close
	cnRights.close
Else
	CheckRights = false
End if

' URights=session("uRights")
' dim arrModRights
' arrModRights=split(URights,"|") 
' flg=0
' for i=0 to UBound(arrModRights)-1
' if lcase(trim(arrModRights(i)))=lcase(trim(Module))then
'	flg=1
'	if arrModRights(i+1)<>"" then
'		if instr(arrModRights(i+1),trim(ActType))<>0 then
'			CheckRights=true
'		else
'			CheckRights=false
'		end if
'	else
'		CheckRights=false
'	end if 
' end if 
' 
' next
' 
' if flg=0 then
'	CheckRights=false
' end if 
    
end function
%>