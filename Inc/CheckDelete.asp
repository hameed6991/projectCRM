<%
Function DeleteLinksOld(MyScreenCode,InputValue)
	Dim DelFlag
	Dim rsTblDelete
	Dim rs
	DelFlag = True
	cn.close
	cn.open CnStr 
	Set	 rsTblDelete = Server.CreateObject("ADODB.RECORDSET")
	Set rs = Server.CreateObject("ADODB.RECORDSET")
	rsTBLDelete.Open "Select * From tblDelete Where ScreenCode = '" & MyScreenCode & "' and SelQuery is not null ",cn,1,3
	if Not rsTblDelete.EOF  Then
		Do While Not rsTblDelete.Eof
		sql="Select "
			' & rsTBLDelete("LinkField") & ","
			'if rsTBLDelete("LinkField")<>rsTBLDelete("DispField")then
			'	sql=sql & rsTBLDelete("DispField") & ","
			'end if
		sql=sql & " " & rsTBLDelete("SelQuery") & " "  & rsTBLDelete("WhereQuery") 
		sql=replace(lcase(sql),"inputvalue",InputValue)
		rs.Open sql,cn,1,3
		If Not rs.Eof then
			DelFlag = False	
			Response.Write "<Table width = '200%' cellpadding=1  cellspacing=1 > <tr BGColor=#008080>"
			dim k
			k=0
			'if rsTBLDelete("LinkField")<>rsTBLDelete("DispField")then
			'k=1
			'end if
			Response.Write "<tr BgColor = '#eaeaea' Height='1'><Td Align = 'Center' ColSpan = ' " & rs.Fields.Count & " ' > <Font Face = 'Ms Sans Serif' Size = '2' Color = 'Navy'>" & rsTBLDelete("TableName") & " Details</font></Td></Tr> <tr BGColor=#008080>" 'Table Captions
			For i=k to rs.Fields.Count-1
			    	Response.write "<td  height = '1'><font face='Ms Sans Serif' size='1' color='White'>"
			   		Response.write rs.Fields(i).Name
			   		Response.write "</Td>"
		    Next
			Response.write "</TR>"
			Do While Not rs.eof
			flg=false
		   		Response.write "<tr  BGColor=lightyellow >"
				   For i=0 to rs.fields.count-1
				   		'if i = 0 then
				   		'	Response.write "<td><A Href ='" & rsTblDelete("Filename") & rs(0) &"' target='" & rsTBLDelete("Target") & "' ><font align=left face='Ms Sans Serif' size='1' >" 
				   		'	flg=true
				   		'else
				   			Response.write "<td><font align=left face='Ms Sans Serif' size='1' color='Black'>" 
   			   		   'end if
		   		       if isnull(rs.fields(i).value) then
					       Response.write "&nbsp;"
			   		    elseif  rs.fields(i).value="" then
					       Response.write "&nbsp;"
				        else 
				       'if flg=true then
    					'	 if rsTBLDelete("LinkField")<>rsTBLDelete("DispField")then
				       	'i=i+1
				       'end if
  				       	flg=false
				       'end if
					       Response.write rs.fields(i).value
  
				       end if
				       if i=0 then
					     	response.write "</font></td>"
				     	else
					     	response.write "</font></td>"
						end if
				   next
				   response.write "</tr>"
			   	   rs.movenext   
			Loop	
		   response.write "</Table> <P> </P>"
		end if
	   rsTblDelete.MoveNext
		rs.Close 
		loop
	else
		DelFlag = True	
	end if
	DeleteLinks = DelFlag
	cn.close
	cn.open CnStr
End Function

Function DeleteLinks(MyScreenCode,InputValue)
	Dim DelFlag
	Dim rsTblDelete
	Dim rs
	Dim lFirst
	lFirst = 1
	DelFlag = True
	k=1
	cn.close
	cn.open CnStr 
	Set	 rsTblDelete = Server.CreateObject("ADODB.RECORDSET")
	Set rs = Server.CreateObject("ADODB.RECORDSET")
	rsTBLDelete.Open "Select * From tblDelete Where ScreenCode = '" & MyScreenCode & "' and SelQuery is not null ",cn,1,3
	If Not rsTblDelete.EOF  Then
	
		Do While Not rsTblDelete.Eof
			sql="Select "
			sql=sql & " " & rsTBLDelete("SelQuery") & " "  & rsTBLDelete("WhereQuery") 
			sql=replace(lcase(sql),"inputvalue",InputValue)
			rs.Open sql,cn,1
			If Not rs.Eof then
			 	rs.MoveLast
				DelFlag = False	
				if lFirst = 1 then
					Response.Write "<Div Align = 'Center'><Table Align = 'Center'  width = '50%' cellpadding=0  cellspacing=0 Border = '1' BorderColor=" & lTableBrClr & " >"
					Response.Write "<Tr BgColor = " & lTableHdClr & "><Td Align = 'Center'><Font Face = 'Ms Sans Serif' Size = 1 Color =" & lTableHdFontClr &  ">Delete Impact Analysis for " & ScreenDesc(MyScreenCode) & "</Font></Td></Tr>"
					Response.Write "<TR><TD>"
				End if
				
				Response.Write "<Table Align = 'Center' width = '100%' cellpadding=0  cellspacing=0 > <tr BGColor=" & lTableBdClr & " >"
		    	Response.write "<td  width = '90%' Align = 'Left' height = '1' style='border-bottom-style: double' bordercolor='White'><font face='Ms Sans Serif' size='1' color="  & lTableBdFontClr & ">Number of Record (s) found for " & rsTBLDelete("ScreenName") & " are </td><Td width = '10%' style='border-bottom-style: double' bordercolor='White'></Font>"
		    	Response.write "<font face='Ms Sans Serif' size='2' color='Red'>" & rs.AbsolutePosition & "</font>"
		   		Response.write "</td>"
				Response.write "</tr><Tr></Tr>"
		   		response.write "</Table>"
		   		lFirst = 0
			end if
			
		   rsTblDelete.MoveNext
		   If DelFlag=false and rsTblDelete.Eof Then
		    	Response.write "</TD></TR></TABLE></Div>"		
			End if
			
		   rs.Close 
		Loop
		
	else
			
		DelFlag=true
	
	End if
	
	DeleteLinks = DelFlag
	cn.close
	cn.open CnStr
End Function
 
Function ScreenDesc(ScreenCode)
	Select Case ScreenCode	
			Case 1
				 ScreenDesc = "Service Request"	
			Case 2
				 ScreenDesc = "Accounts"	
			Case 3
				 ScreenDesc = "Products"	
			Case 4
				 ScreenDesc = "Part"	
			Case 5
				 ScreenDesc = "Team"	
			Case 6
				 ScreenDesc = "Defects"	
			Case 7
				 ScreenDesc = "Agreement"	
			Case 8
				 ScreenDesc = "Activity"	
			Case 9
				 ScreenDesc = "Solution"	
			Case 10
				 ScreenDesc = "Survey"	
			Case 11
				 ScreenDesc = "Department"	
			Case 12
				 ScreenDesc = "Version"	
			Case 13
				 ScreenDesc = "RMA Request"	
			Case 24
				 ScreenDesc = "RMA Transaction"	
			Case 15
				 ScreenDesc = "Purchase"	
			Case 16
				 ScreenDesc = "Contacts"	
			Case 17
				 ScreenDesc = "Survey Questions"	
			Case 18
				 ScreenDesc = "Survey Answers"	
			Case 19
				 ScreenDesc = "Log User List"	
			Case 20
				 ScreenDesc = "Vendor"	
			Case 21
				 ScreenDesc = "Log User Name"	
			Case 22
				 ScreenDesc = "Features"	
				 
	End Select
End Function

Function MasterDeleteLinks(MyScreenCode,InputValue)
	Dim DelFlag
	Dim rsTblDelete
	Dim rs
	DelFlag = True
	cn.close
	cn.open CnStr 
	Set	 rsTblDelete = Server.CreateObject("ADODB.RECORDSET")
	Set rs = Server.CreateObject("ADODB.RECORDSET")
	rsTBLDelete.Open "Select * From tblDelete Where ScreenCode = '" & MyScreenCode & "' and SelQuery is not null ",cn,1,3
	if Not rsTblDelete.EOF  Then
		Do While Not rsTblDelete.Eof
		sql="Select "	 & rsTBLDelete("LinkField") & ","
			if rsTBLDelete("LinkField")<>rsTBLDelete("DispField")then
				sql=sql & rsTBLDelete("DispField") & ","
			end if
		sql=sql & " " & rsTBLDelete("SelQuery") & " "  & rsTBLDelete("WhereQuery") 
		sql=replace(lcase(sql),"inputvalue",InputValue)
		rs.Open sql,cn,1,3
		If Not rs.Eof then
			DelFlag = False	
			Response.Write "<Table width = '100%' cellpadding=1  cellspacing=1 > <tr BGColor=#008080>"
			dim k
			k=0
			if rsTBLDelete("LinkField")<>rsTBLDelete("DispField") then ''
				k=1  ''
			end if  ''
			Response.Write "<tr BgColor = '#eaeaea' Height='1'><Td Align = 'Center' ColSpan = ' " & rs.Fields.Count & " ' > <Font Face = 'Ms Sans Serif' Size = '2' Color = 'Navy'>" & rsTBLDelete("ScreenName") & " Details</font></Td></Tr> <tr BGColor=#008080>" 'Table Captions
			For i=k to rs.Fields.Count-1
			    	Response.write "<td  height = '1'><font face='Ms Sans Serif' size='1' color='White'>"
			   		Response.write ConvProperCase(rs.Fields(i).Name)
			   		Response.write "</Td>"
		    Next
			Response.write "</TR>"
			Do While Not rs.eof
			flg=false
		   		Response.write "<tr  BGColor=lightyellow >"
			   For i=0 to rs.fields.count-1
				   		if i = 0 then
				   			Response.write "<td><A Href ='" & rsTblDelete("Filename") & rs(0) &"' target='" & rsTBLDelete("Target") & "' ><font align=left face='Ms Sans Serif' size='1' >" 
				   			flg=true
				   		else
				   			Response.write "<td><font align=left face='Ms Sans Serif' size='1' color='Black'>" 
   			   		   end if
		   		       if isnull(rs.fields(i).value) then
					       Response.write "&nbsp;"
			   		    elseif  rs.fields(i).value="" then
					       Response.write "&nbsp;"
				        else 
				       if flg=true then
    						 if rsTBLDelete("LinkField")<>rsTBLDelete("DispField")then
				       	i=i+1
				       end if
  				       	flg=false
				       end if
					       Response.write rs.fields(i).value
  
				       end if
				       if i=0 then
					     	response.write "</font></td>"
				     	else
					     	response.write "</font></td>"
						end if
				   next
				   response.write "</tr>"
			   	   rs.movenext   
			Loop	
		   response.write "</Table> <P> </P>"
		end if
	   rsTblDelete.MoveNext
		rs.Close 
		loop
	else
		DelFlag = True	
	end if
	MasterDeleteLinks = DelFlag
	cn.close
	cn.open CnStr
End Function
%>

<%
Function ConvProperCase(strValue)
Dim tmpStr
tmpStr = Trim(strValue)
If InStr(tmpStr," ") <> 0 Then
	strSplit =  Split(tmpStr," ")
	tmpStr = ""
	For i = LBound(strSplit) To UBound(strSplit)
		tmpStr = tmpStr & UCase(Mid(strSplit(i),1,1)) & Mid(strSplit(i),2) & " "
	Next 
Else
	tmpStr = UCase(Mid(strValue,1,1)) & Mid(strValue,2)
End if
ConvProperCase= tmpStr
End Function
%>