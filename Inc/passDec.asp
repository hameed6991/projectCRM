<%
function Decrypt(InputStr)
	AppendStr = ""
	For I = 1 To Len(InputStr)
	
   	 myval = Asc(Mid(InputStr, I, 1))
   	 
   	 if Chr(myval) <> "a" and Chr(myval) <> "0" then
   	 AppendStr = AppendStr & Chr(myval - 1)
   	 else
   	 if Chr(myval) = "a" then
   	 AppendStr = AppendStr & "z" 
   	 end if
   	 if Chr(myval) = "0" then
   	 AppendStr = AppendStr & "9" 
   	 end if
   	 
   	 end if
	Next 
	Decrypt=AppendStr
	
end function 	


%>
