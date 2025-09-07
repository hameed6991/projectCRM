<script language = "vbscript" runat = "server" >

function ShowTimeonly(inDate)
	if isnull(indate) then
		ShowTimeonly = ""
		exit function
	elseif trim(indate) ="" then
			ShowTimeonly=""
			exit function	
		else
		    if isdate(indate) then
				strdt  = ""
				if hour(indate) <10 then
					strdt= strdt & "0" & hour(indate) & ":"
				elseif hour(indate) >12 then
					strdt= strdt & (hour(indate)-12) & ":"
				else
					strdt= strdt & hour(indate) & ":"
				end if
				if minute(indate)  <10 then
					strdt = strdt & "0" & minute(indate)
				else
					strdt = strdt & minute(indate)
				end if
				if hour(indate) <12 then
					strdt= strdt & " A.M."
				else
					strdt= strdt & " P.M."
				end if
				ShowTimeonly = trim(strdt)
				exit function
			else
				ShowTimeonly = ""
				exit function
			end if
		end if
end function 

function ShowAbrDate(inDate)
	if isnull(indate) then
		ShowAbrDate = ""
		exit function
	elseif trim(indate) = "" then
			ShowAbrDate =""
			exit function
		else
			if isdate(indate) then
				strdt  = ""
				if day(indate) < 10 then
					strdt = "0" & day(indate) & "-"
				else
					strdt = day(indate) & "-"
				end if
				strdt = strdt & monthname(month(indate),true) & "-" & year(indate) & " "
				If hour(indate) = 0 and Minute(indate) = 0 Then
					ShowAbrDate = trim(strdt)
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
					
				ShowAbrDate = trim(strdt)
				exit function
			else
				showAbrdate = ""
				exit function
			end if
		end if
end function 

function ShowAbrDateonly(inDate)
	if isnull(indate) then
		ShowAbrDateonly = ""
		exit function
	elseif trim(indate) ="" then
			ShowAbrDateonly=""
			exit function	
		else
		    if isdate(indate) then
				strdt  = ""
				if day(indate) < 10 then
					strdt = "0" & day(indate) & "-"
				else
					strdt = day(indate) & "-"
				end if
				strdt = strdt & monthname(month(indate),true) & "-" & year(indate) & " "
				ShowAbrDateonly = trim(strdt)
				exit function
			else
				showAbrdateonly = ""
				exit function
			end if
		end if
end function 

</script>