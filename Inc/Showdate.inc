<script language = "vbscript" runat = "server" >
function ShowDate(inDate)
	if isnull(indate) then
		ShowDate = ""
		exit function
	elseif trim(indate) = "" then
			ShowDate =""
			exit function
		else
			if isdate(indate) then
				strdt  = ""
				if day(indate) < 10 then
					strdt = "0" & day(indate) & "/"
				else
					strdt = day(indate) & "/"
				end if
				if month(indate)< 10  then
					strdt = strdt & "0" & month(indate) & "/" & year(indate) & " "
				else
					strdt = strdt & month(indate) & "/" & year(indate) & " "
				end if 
				If hour(indate) = 0 and Minute(indate) = 0 Then
					ShowDate = trim(strdt)
					exit function
				end if
				if hour(indate) <10 then
					strdt= strdt & "0" & hour(indate) & ":"
				else
					strdt= strdt & hour(indate) & ":"
				end if
				if minute(indate)  <10 then
					strdt = strdt & "0" & minute(indate)
				else
					strdt = strdt & minute(indate)
				end if
					
				ShowDate = trim(strdt)
				exit function
			else
				showdate = ""
				exit function
			end if
		end if
end function 

function ShowDateonly(inDate)
	if isnull(indate) then
		ShowDateonly = ""
		exit function
	elseif trim(indate) ="" then
			ShowDateonly=""
			exit function	
		else
		    if isdate(indate) then
				strdt  = ""
				if day(indate) < 10 then
					strdt = "0" & day(indate) & "/"
				else
					strdt = day(indate) & "/"
				end if
				if month(indate)< 10  then
					strdt = strdt & "0" & month(indate) & "/" & year(indate) & " "
				else
					strdt = strdt & month(indate) & "/" & year(indate) & " "
				end if 
				ShowDateonly = trim(strdt)
				exit function
			else
				showdateonly = ""
				exit function
			end if
		end if
end function 

function ShowDateExcel(inDate)
	if isnull(indate) then
		ShowDateExcel= ""
		exit function
	elseif trim(indate) = "" then
			ShowDateExcel=""
			exit function
		else
			if isdate(indate) then
				strdt  = ""
				
				
				if month(indate) < 10 then
					strdt =  left(MonthName(month(indate)),3) & " "
				else
					strdt = left(MonthName(month(indate)),3) & " "

				end if
				
				 
				if day(indate)< 10  then
					strdt = strdt & "0" &  day(indate) & ", " & year(indate) & " "
				else
					strdt = strdt & day(indate) & ", " & year(indate) & " "
				end if 
				
				
				If hour(indate) = 0 and Minute(indate) = 0 Then
					ShowDateExcel= trim(strdt)
					exit function
				end if
				if hour(indate) <10 then
					strdt= strdt & "0" & hour(indate) & ":"
				else
					strdt= strdt & hour(indate) & ":"
				end if
				if minute(indate)  <10 then
					strdt = strdt & "0" & minute(indate)
				else
					strdt = strdt & minute(indate)
				end if
					
				ShowDateExcel= trim(strdt)
				exit function
			else
				ShowDateExcel= ""
				exit function
			end if
		end if
end function 
</script>