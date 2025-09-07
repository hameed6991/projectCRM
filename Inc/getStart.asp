<%

function getStart(uname)
	 
	
       set rs1=Server.CreateObject("ADODB.Recordset")  
       rs1.Open "Select * from logmast where uname ='" + uname + "'",cn,1,2
       if rs1.EOF then       
         no="null"
         no1="null"
       else
        no = CStr(rs1("srnum"))
          no1=rs1("srkey")
          l = len(no)
          no2 =""
          dim i
          for i=l to 3
			no2 =no2 + "0"
          next
          no = no2 + no
       end if        
	getStart=CStr(year(date)) + "-" + Cstr(month(date)) + "-" + no1 + "-" + no 
      rs1.close
end function	



%>