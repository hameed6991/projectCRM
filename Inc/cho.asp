  <Script Language="vbs" runat=server>
  Function MthName(Idx)
  select case idx
    Case "1", "01"
        MthName = "January"
    Case "2", "02"
        MthName = "February"
    Case "3", "03"
        MthName = "March"
    Case "4", "04"
        MthName = "April"
    Case "5", "05"
        MthName = "May"
    Case "6", "06"
        MthName = "June"
    Case "7", "07"
        MthName = "July"
    Case "8", "08"
        MthName = "August"
    Case "9", "09"
        MthName = "September"
  	case "10"
        mthname = "October"
	case "11"
        mthname = "November"
  	case "12"
        mthname = "December"
  end select 
  end Function

  function fmtDate(MyDate)
  dim d(3)
  dim i
  dim j
  dim s 
  dim MyDt
  MyDt = ""
  j=1
  s=""
  d(1)=""
  d(2)=""
  d(3)=""
  if Len(MyDate) > 6 then
	  If InStr(Trim(MyDate), " ") = 0 Then MyDate = MyDate & " !"
	  for i=1 to Instr(Trim(Mydate)," ")
   		   if mid(Mydate,i,1)="/" or mid(Mydate,i,1)="-" or mid(Mydate,i,1)="."then 
	       	  d(j)=s
	         s=""
	         j=j+1
	      else
	         s=s + mid(Mydate,i,1)
	      end if
	  next
	  d(3)=s
	  d(2)= MthName(d(2))
	  MyDt = d(2) & " " & d(1) & "," & d(3) & " "
	  j = 1
	  s = ""
	  d(1) = ""
	  d(2) = ""
	  d(3) = ""
	  if InStr(Trim(MyDate), ":") > 0 then
		  For i = InStr(Trim(MyDate), " ") + 1 To InStr(Trim(MyDate), ":") + 2
				If Mid(MyDate, i, 1) = ":" Then
   					  d(j) = s
	 		          s = ""
		 	          j = j + 1
		   		Else
	   				  s = s + Mid(MyDate, i, 1)
				End If
		  Next
		  d(2) = s
		  If Cint(d(1)) >= 12 Then
		     If Cint(d(1)) = 12 Then
   			     d(1) = d(1) & ":" & d(2) & " " & "PM"
		     else
			     d(1) = d(1) - 12 & ":" & d(2) & " " & "PM"
		     end if
		  Else
		     d(1) = d(1) & ":" & d(2) & " " & "AM"
		  End If
		  fmtDate = MyDt & d(1)
	  else
		  fmtDate = MyDt		  
	  end if
else
	fmtdate = ""
end if

end function
  </script>
