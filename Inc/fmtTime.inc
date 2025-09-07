<%

function fmtTime(val) 
	dim TimeVal
	TimeVal=Cstr(val)
	if len(TimeVal)=1 then
		TimeVal="0" & TimeVal
	end if	
	fmtTime=TimeVal
 end function   

%>