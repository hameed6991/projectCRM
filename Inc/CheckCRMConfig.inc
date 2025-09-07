<%
function CheckCRMConfig(Module)
	set cnRights1 = Server.CreateObject("ADODB.Connection")
	cnRights1.open cnStr
		set rskey1 = server.CreateObject("adodb.recordset")
		rskey1.open " exec sp_CheckCRMConfig '" & Module & "','' ", cnRights1
		CheckCRMConfig = rskey1(0)
		rskey1.close
	cnRights1.close
	
	
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
	
	<%
	function CheckCRMConfigRights(Module,Source)
	set cnRights2 = Server.CreateObject("ADODB.Connection")
	cnRights2.open cnStr
		set rskey2 = server.CreateObject("adodb.recordset")
		rskey2.open " exec sp_CheckCRMConfigRights '" & Module & "','" & Source & "','' ", cnRights2
		CheckCRMConfigRights = rskey2(0)
		rskey2.close
	cnRights2.close
	

end function

%>

<%
function CheckDenomConfig(Module)
	set cnRights3 = Server.CreateObject("ADODB.Connection")
	cnRights3.open cnStr
		set rskey3 = server.CreateObject("adodb.recordset")
		rskey3.open " exec sp_CheckDenomConfig '" & Module & "','' ", cnRights3
		CheckDenomConfig = rskey3(0)
		rskey3.close
	cnRights3.close

end function

%>


