<%
function decrypt(InputStr)
	AppendStr = ""
	For I = 1 To Len(InputStr)
   	 myval = Asc(Mid(InputStr, I, 1))
   	 AppendStr = AppendStr & Chr(myval - 1)
	Next 
	
	decrypt=AppendStr
	
end function 	


%>
