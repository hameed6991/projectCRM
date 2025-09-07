<%
function SendMail(EscToEmail,EscSubject,EscBody)

		if Trim(EscToEmail)<>"" then
			'cn.open cnStr
			Escfrommail = ""
			
			set rsEscfrom=server.CreateObject("ADODB.RecordSet")
			strfromid = "select subval from submaster where [key]='FromID' "
			rsEscfrom.open strfromid,cn
			if not rsEscfrom.EOF then
			     Escfrommail = rsEscfrom("subval")
			End if
			rsEscfrom.Close
	
			'Set cdoConfig = CreateObject("CDO.Configuration")
			'With cdoConfig.Fields  
			'.Item(cdoSendUsingMethod) = cdoSendUsingPort  
			'.Item(cdoSMTPServer) = "cmssmtp.cms.com"
			'.Update  
			'End With 
			
			'Set cdoMessage = CreateObject("CDO.Message")  
			'With cdoMessage 
			'Set .Configuration = cdoConfig 
			'.From = "crmsupport@cms.com"
			'.To = EscEmail
			'.Subject = EscSubject 
			'.HTMLBody = MailMess	
			'.HTMLBodyPart.ContentTransferEncoding = "quoted-printable" 
			'.Send 
			'End With 
			
			'Set cdoMessage = Nothing  
			'Set cdoConfig = Nothing  
			if Trim(Escfrommail)<>"" then
				Set myMail = Server.CreateObject("CDONTS.NewMail")  
				myMail.From = Escfrommail
				myMail.To = EscToEmail
				myMail.Subject = EscSubject
				myMail.BodyFormat = 0
				myMail.MailFormat = 0
				myMail.Body = EscBody
			  	myMail.Send 
	      	end if
      	end if
      	
end function
%>

