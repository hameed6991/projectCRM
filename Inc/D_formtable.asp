<%
function FormDTable(Module,Heading,Code,Header) 
 	i=0
 	tdwifth="99"
 	fields=""
 	fieldsname=""
 	fldtype=""
 	datetype=""
 	if tabind="" then
 	tabind=1
 	end if
 	set rsfield = Server.createObject("Adodb.RecordSet")
 	set rsd= Server.createObject("Adodb.RecordSet")
 	
 	rsfield.open "select * from  D_TABDEt,D_TabDef where D_TabDef.cd=D_TABDEt.cd and Module = '"& Module &"' and  D_TabDet.flg is null order by seq",cn
 		if not rsfield.eof then
 		dTable=""
 		TableName = rsfield("tableref")
 		dTable =" <table border='0' width='900' cellspacing='0'  cellpadding='0' height='51' >"
 		
 		''''''''''''''''''''''Heading Formation
 		
 		dTable =dTable & "<tr>"
 		if Header<>"NO" then
 		    dTable =dTable & "<td width='29' align='left' valign='middle' height='28'><img src='images/arrow_02.gif' height='26'></td>"
 		    dTable =dTable & "<td height='28' width='871'  lign='left' valign='middle'  background='images/pixel_004.gif'> <strong class='bodytxt_black_b'> "& Heading &" </strong> </td> </tr>"
 		end if
 		dTable =dTable & "<tr> <td width='900' height='56' valign=top colspan='2' >"
 		dTable =dTable & "<table BORDER='0' width='900' cellspacing =0 cellpadding = 0 height='51'> "
 		dTable =dTable & "<tr> <td width='900' height='1'>  <table border='0' width='900' height='47' cellspacing='0'>"
' 		dTable =dTable & "<tr> <td width='900' height='22' valign='top' align='right' colspan='6' style='border-bottom: 1px solid #cfcfcf' background='images/schi_pixel_03.gif'> "
' 		dTable =dTable & " <p align='left'><span class='bodytxt_black'>"& Heading &"</span></td> </tr> <tr>"

		do while not rsfield.eof 
 		  if i=0 then 
		     dTable =dTable & " <tr>"
	     end if
        mndt =""
        txtnumcheck =""
        frmdatebutton =""
        txtsize="147"
        txthig= "17"
        tabplus= 0
	       if rsfield("mandatory") then
       	    fields=fields & "auto_" & TableName & replace(rsfield("FldName")," ","_") & ";"
          		 fieldsname=fieldsname & rsfield("FldName")  & ";"
          		 fldtype=fldtype & rsfield("FldType")  & ";"
          		 mndt ="<font face='MS Sans Serif' Color = 'Red' size='3'>*</Font>"
          end if 
           
          
           if lcase(rsfield("fdbtype"))="datetime" then
             lbtime =1
             if rsfield("fdbtime") then
             lbtime =0
             datetype = datetype & "rtndatetime1;"
             else
             datetype = datetype & "rtndateonly1;"
             end if
       	    datefields=datefields & "auto_" & TableName & replace(rsfield("FldName")," ","_") & ";"
          		 datefieldsname=datefieldsname &    rsfield("FldName")  & ";"
          		 frmdatebutton ="<input type='button'  class='small_button' value='?' tabindex='"& tabind+1 & "'  name='btnCommit1' onClick='showCal(document.all.auto_" & TableName & replace(rsfield("FldName")," ","_") & ","& lbtime &");' >"
          		 txtsize="124"
          		 tabplus =1
           end if
           
           if lcase(rsfield("fdbtype"))="numeric" then
                txtnumcheck = "onkeypress='return checkNum(event.keyCode)'"
           end if
           
           
           
           
           if lcase(rsfield("fldtype")) ="textarea" then
             if i<=1 then
               dTable =dTable & "<td height='1' align='right' valign='middle'> "  & mndt & " <font size='1' face='MS Sans Serif'>" & rsfield("FldName") & "</font>&nbsp;</td>"
	           dTable =dTable & "<td align='left' colspan='3' valign='middle' height='1'>"
	           txtsize= "434"
	           txthig= "28"
	           i=(1+i)
	         else
	           dTable =dTable & "<td></td><td></td></tr>"
	           dTable =dTable & "<tr><td height='1' align='right' valign='middle'> " & mndt & " <font size='1' face='MS Sans Serif'>" & rsfield("FldName") & "</font>&nbsp;</td>"
	           dTable =dTable & "<td align='left' colspan='3' valign='middle' height='1'>"
              i=1
              txtsize= "430"
              txthig= "28"
	         end if
	       end if
	      if lcase(rsfield("fldtype")) <>"textarea" then
	            dTable =dTable & "<td height='1' align='right' valign='middle'> " & mndt & " <font size='1' face='MS Sans Serif'>" & rsfield("FldName") & "</font>&nbsp;</td>"
	            dTable =dTable & "<td align='left' valign='middle' height='1'>"
	      end if
	       if lcase(rsfield("fldtype")) ="textbox"  then
	          dTable =dTable & " <input type='text' tabindex='"& tabind & "' name='auto_" & TableName & replace(rsfield("FldName")," ","_") & "' maxlength='"& rsfield("Fdbsize")  &"' " & txtnumcheck & " class='inputstyle' size='20' style='width: "& txtsize &"; height: "& txthig &"'>  " & frmdatebutton 
	          dTable =dTable & " <input type='hidden' name='hdnauto_" & TableName & replace(rsfield("FldName")," ","_") & "' value='" & rsfield("fDbType") & "' />"
	          tabind = tabind+1+tabplus
	       end if
	       
	      if lcase(rsfield("fldtype")) ="textarea" then
	          dTable =dTable & " <textarea style='width: "& txtsize &"; height: "& txthig &"; ' class='inputstyle' tabindex='"& tabind & "' name='auto_" & TableName & replace(rsfield("FldName")," ","_") & "' maxlength="& rsfield("Fdbsize")  &" rows='3' cols='25' " & txtnumcheck & "></textarea>"
	          dTable =dTable & " <input type='hidden' id='hdnauto_" & TableName & replace(rsfield("FldName")," ","_") & "' value='" & rsfield("Fdbsize") & "' />"
	          lnkfields=lnkfields& "auto_" & TableName & replace(rsfield("FldName")," ","_") & ";"
          		lnkfieldsname=lnkfieldsname & rsfield("FldName")  & ";"
          		tabind = tabind+1
         end if 
	       if lcase(rsfield("fldtype")) ="d_down" then
	           dTable =dTable & " <select name='auto_" & TableName & replace(rsfield("FldName")," ","_") & "' class='inputstyle1' tabindex='"& tabind & "' style='width: 147; height: 23'>"
	          tabind = tabind+1
	           if rsfield("mandatory") then
	              dTable =dTable & " <option value = ''>&lt;-Select-&gt;</option> "
	          else 
	              dTable =dTable & "<option value = ''>None</option> "
	          end if
	         if rsfield("dropdownfields") <> "" then
	            DataApiRows = Split(rsfield("dropdownfields"),";")
	              For x = 0 to UBound(DataApiRows)-1
	                 dTable =dTable & "  <option value = '" & DataApiRows(x) &"'>"& DataApiRows(x)& " </option>"
      	           Next
            end if 
               dTable =dTable & " </select>"
           end if 
	      dTable =dTable & " </td>"
	   i=i+1
	   	 
	   if i=3 then
	   i=0
	   dTable =dTable & " </tr>"
	   end if
	   strformfield = strformfield &"t.["& rsfield("fldname") & "],"
      rsfield.movenext
      
	loop
	end if
	dTable =dTable & "<tr><td colspan='6'><td>&nbsp;</tr>"
	dTable =dTable & "</table></td></tr></table></td></tr></table>"
	dTable =dTable & "<input type ='hidden' name='hdntablename' value='" & TableName & "'>"
	dTable =dTable & "<input type ='hidden' name='"& TableName&"fields' value='" & fields & "'>"
	dTable =dTable & "<input type ='hidden' name='"& TableName&"fieldsname' value='"& fieldsname & "'>"
	dTable =dTable & "<input type ='hidden' name='"& TableName&"fieldtype' value='"& fldtype & "'>"
	dTable =dTable & "<input type ='hidden' name='"& TableName&"datefields' value='" & datefields & "'>"
	dTable =dTable & "<input type ='hidden' name='"& TableName&"datefieldsname' value='"& datefieldsname & "'>"
	dTable =dTable & "<input type ='hidden' name='"& TableName&"lnkfields' value='" & lnkfields & "'>"
	dTable =dTable & "<input type ='hidden' name='"& TableName&"lnkfieldsname' value='"& lnkfieldsname & "'>"
	dTable =dTable & "<input type ='hidden' name='"& TableName&"datetype' value='"& datetype & "'>"
	

	
	
	 response.write dTable 
	 
	  if code <> "" then
	     strformfield = left(strformfield,(len(strformfield )-1))
	     strformfield ="Select " & strformfield & " from " & TableName & " t where t.idval = '" & Code & "'"
        rsd.Open strformfield,cn 
 	       if not rsd.eof then
 	       for i = 0 to rsd.fields.count -1
 	       rtnval =""
 	         if isdate(rsd(i)) then
 	           rtnval = showdate(rsd(i))
 	         else
 	           rtnval = rsd(i)
            end if 
 	       %>
 	      <script>
          var fldname= "auto_"+'<%=TableName%>'+'<%=replace(rsd.fields(i).Name," ","_")%>'
 	      document.all(fldname).value='<%=rtnval%>'
 	      </script>
 	    <%
 	     next
 	     end if
	     rsd.close
	  end if

	 
end function
%>
