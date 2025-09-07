<!--#INCLUDE FILE="cn.inc"-->
<!--#include file = "CheckStringalert.asp"-->
<%

cn.open cnstr
set rs = Server.CreateObject("Adodb.recordset")

sqlstr = " Select * From Purchase Where EquipId = '" & request.querystring("EquipId") & "' and WarrEndDate > dbo.getCountrydate() and ProdCode='"&request.querystring("PCode") &"' "
rs.open sqlstr,cn
if not rs.eof then
	str = "WAR"
else
	rs.close
	rs.Open "Select count(*) From Agreement where agno in (select agno from agreeProd where serialNo= '" & request.querystring("EquipId") & "' and ProdCode ='" & request.querystring("PCode") & "') having Max(EndDate) > dbo.getCountrydate()",cn 
	if not rs.eof then
		if rs(0)>0 then
			str = "AMC"
		else
			str = "OOW"
		end if
	else
		str = "OOW"
	end if
end if
response.write str 
%>