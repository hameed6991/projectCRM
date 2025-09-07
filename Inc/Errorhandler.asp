<%

Function CheckLastError(objError,Source,Mode) 
	If objError.Number <> 0 Then
			ClientName=	Session("ClientName")
			UserName=Session("UserName")	
			FileName=Request.ServerVariables("SCRIPT_NAME")
			nInd=0
			nInd=Instr(StrReverse(FileName),"/")
			if nInd>0 then
				FileName=Right(FileName,nInd-1)
			end if 		
	    	ErrDesc=objError.Description 
			ErrNumber=objError.Number
			ErrSource=objError.Source
			Priority=1
			set rsErr=Server.CreateObject("ADODB.RecordSet")
			cn.BeginTrans
			cn.CursorLocation = 3
			rsErr.Open "Select * from ErrorLog",cn,1,3
				rsErr.AddNew 		
				rsErr("ClientName")=ClientName
				rsErr("UserName")=UserName
				rsErr("FileName")=FileName
				rsErr("ErrSource")=ErrSource
				rsErr("ErrDesc")=ErrDesc
				rsErr("ErrNumber")=ErrNumber
				rsErr("Source")=Source
				rsErr("Priority")=Priority
			rsErr.Update
			ErrCode=ClientName & "-" & rsErr("ErrCode") 
			cn.CommitTrans
			set rsErr=nothing
			Err.Clear
			if Mode="S" then
				Response.Redirect "ErrorPage.asp?" & "ID=" & ErrCode & "&Source=" & Source & "&File=" & FileName
			end if 
	end if 

end function
%>