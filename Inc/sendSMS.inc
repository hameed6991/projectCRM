<%
function sendSMS(Message,SendFrom,SendTo,SECode,Status,Reference)
 
   dim rsSMSXMLTTP    
   set rsSMSXMLTTP= Server.CreateObject("ADODB.Recordset")
 
   SMSsql = "Sp_SMSMakeXML '"+ Message + "','" + SendFrom + "','"  + SendTo + "','" + SECode + "','" + Status + "',''"
   rsSMSXMLTTP.Open SMSsql,cn 
   
    dim  smsurl	
    		
 if not rsSMSXMLTTP.eof then
      smsurl=rsSMSXMLTTP(0)
   'response.write smsurl
	 if smsurl <>"" then
	   dim xmlhttp
	   set xmlhttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
	   xmlhttp.Open "GET",smsurl, false
	   xmlhttp.Send
	   dim lsval 
	   lsval = xmlhttp.responseText

	   dim rssmsinfo 
	   set rssmsinfo = Server.CreateObject("ADODB.Recordset")
 	   rssmsinfo.open "select * From SMSINfo where 1=2"  ,cn,1,3
		rssmsinfo.addnew
			rssmsinfo("mess")   =Message 
			rssmsinfo("fromno")   =SendFrom 
			rssmsinfo("tono")   = SendTo  
			rssmsinfo("smsstatus")   = Status 
			rssmsinfo("createdate")   = now()
			rssmsinfo("ref")   = Reference 
			rssmsinfo("ErrorReason")   = reason
			rssmsinfo("resp")   = left(lsval,500)
			'rssmsinfo("resp")   = left(smsurl,500)
		rssmsinfo.update
		rssmsinfo.close
	    end if	
  else
	Response.write "Error , SMS Not sent...."
  end if

  rsSMSXMLTTP.close

End function

Function sendSMS_HS(Message,SendFrom,SendTo,SECode,Status,Reference)
 
   dim rsSMSXMLTTP    
   set rsSMSXMLTTP= Server.CreateObject("ADODB.Recordset")
 'cn.open cnstr
 
   SMSsql = "Sp_HS_SMSMakeXML '"+ Message + "','" + SendFrom + "','"  + SendTo + "','" + SECode + "','" + Status + "',''"
   
   set rsSMSXMLTTP=cn.Execute(SMSsql)

   'cn.execute(smssql)
   
   'rsSMSXMLTTP.Open SMSsql,cn,1,3
      
    dim  smsurl	
    		response.write(SMSsql)
 if not rsSMSXMLTTP.eof then
      smsurl=rsSMSXMLTTP(0)
				response.write smsurl
	 if smsurl <>"" then
	   dim xmlhttp
	   set xmlhttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
	   xmlhttp.Open "GET",smsurl, false
	   xmlhttp.Send
	   dim lsval 
	   lsval = xmlhttp.responseText
	   response.write(" lsval " &lsval) 
	   dim rssmsinfo 
	   set rssmsinfo = Server.CreateObject("ADODB.Recordset")
 	   rssmsinfo.open "select * From SMSINfo where 1=2"  ,cn,1,3
		rssmsinfo.addnew
			rssmsinfo("mess")   =Message 
			rssmsinfo("fromno")   =SendFrom 
			rssmsinfo("tono")   = SendTo  
			rssmsinfo("smsstatus")   = Status 
			rssmsinfo("createdate")   = now()
			rssmsinfo("ref")   = Reference 
			rssmsinfo("ErrorReason")   = reason
			rssmsinfo("resp")   = lsval
			'rssmsinfo("resp")   = left(smsurl,500)
		rssmsinfo.update
		rssmsinfo.close
	    end if	
  else
	Response.write "Error , SMS Not sent...."
  end if

  rsSMSXMLTTP.close

End function
%>
