<%
	function  UpdateLookUp(TName,FName,FValue,ScreenVal,Mode)
	
	dim rs1
	set rs1=Server.CreateObject("ADODB.Recordset")
	
	if Mode="R" then
		Mode="A"
		rs1.Open "Select * from " & TName & " where  code='" & ScreenVal & "'",cn,1,3
			
			if not rs1.EOF then
				FValue=rs1("AuthorCode")
				FName=rs1("AuthorType")& "Code"  
				cn.execute("delete from " & TName & " where  code='" & ScreenVal & "'" )
			else
				Response.write "<font size=1 face='ms sans serif' >Record Not Found</font>"	
				response.end
			end if	
			rs1.close	
	end if 
	
	
	
	if Mode="A" or Mode="E"  then
		
		
	dim rs
	set rs=Server.CreateObject("ADODB.Recordset")
	
	if Mode="E" then
		UType=FName
		FName=FName & "Code"
	elseif Mode="A" then
		UType=left(FName,len(FName)-4)
	end if 
	
	
	dim SqlStr
	SqlStr=""
	dim UType
	
	
	
	dim FieldNames
	dim FieldValues
	FieldNames=""
	FieldValues=""
		
		
			
		if Mode="E" then
			rs1.Open "Select * from " & TName & " where  code='" & ScreenVal & "'",cn,1,3
					
			if  rs1.EOF then
				Response.write "<font size=1 face='ms sans serif' color='Navy' >Record Not Found</font>"	
				response.end
			end if		
						
		end if
			
		
		if Mode="A" then
			rs1.Open "Select * from " & TName  & " where 1=2 ",cn,1,3
			rs1.AddNew()
			rs1("AuthorCode")=FValue
		    rs1("AuthorType")=UType  
		    rs1("code")=ScreenVal
		end if    
	
		rs1(trim(FName))=FValue
		
			
		
		rs.Open "Select UCode,UType from UserMap where BaseUCode='" & trim(FValue) & "' and  BaseUType='"& trim(UType) & "' and Module='" & trim(TName) & "'",cn


	
	dim FieldName
	do while not rs.EOF
	
		FieldName=trim(rs("UType")) & "Code"
		rs1(FieldName)=rs("UCode")


	rs.MoveNext	
	loop
	
	rs.close
	rs1.Update 
	rs1.Close 
	
	set rs1=nothing	
	set rs=nothing
		
	else
		cn.execute "Delete  from " & TName & " where Code='" & ScreenVal & "'"		
	end if
	end function


%>

