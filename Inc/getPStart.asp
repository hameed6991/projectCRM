<%

function getpStart(Srno)
	   
       set rs1=Server.CreateObject("ADODB.Recordset")  
       sqlstr ="Select isnull(AlliedCnt,0) as [AlliedCnt] from sr_details with (nolock) where srno_det ='" + Srno + "'"
       rs1.Open sqlstr ,cn,1,2
       Dim strCount
       strCount = cint(rs1("AlliedCnt"))
       strCount =strCount + 1
       getpStart= Srno & "-S" & strCount 
       rs1.close
       cn.execute ("UPDATE sr_details set AlliedCnt = '" & cint(strCount) & "' where srno_det ='" + Srno + "'")
       set rs1 = nothing

end function	



%>