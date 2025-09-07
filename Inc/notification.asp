<%
Function notification(values,elementname,ModuleName,Subject,Ucode,UserType)
set rsAllMap=server.createobject("adodb.recordset")

rsAllMap.Open "Select * From AllMap Where UserType = '"&UserType&"' ",cn,1,3
if not rsAllMap.EOF then
	lINVAllocateTo= rsAllMap("AllocateTo")
end if
rsAllMap.close
set rsmast=server.createobject("adodb.recordset")


rsmast.open "select "&lINVAllocateTo&"name from "&lINVAllocateTo&"mast where "&lINVAllocateTo&"code='"&Ucode&"'",cn
if not rsmast.eof then
username=rsmast(0)
end if
rsmast.close		
set rsnot=server.createobject("adodb.recordset")
set rsmodule=server.createobject("adodb.recordset")
'response.write "select * from Notify where uname='" & username & "' and Module='" & ModuleName & "' and Event like '%Add%' or Event like '%Edit%' "
rsnot.open "select * from Notify where uname='" & username & "' and Module='" & ModuleName & "' and (Event like '%Add%' or Event like '%Edit%') ",cn

if not rsnot.eof then		
		dim SqlArr,ElementArr,ValueArr
		SqlArr=array()
		
		ValueArr=split(values,"|")
		ElementArr=split(elementname,"|")
		
			
		if not rsnot.eof then
			sql=rsnot("fields")
			
			if instr(sql,",")>0 then
				SqlArr=split(sql,",")
					
				for e=0 to Ubound(ElementArr)
					rsmodule.open "select * from module where MName='" & ModuleName & "' and EName='"& trim(ElementArr(e)) &"'",cn,1,3
				for i=0 to Ubound(SqlArr)
					if lcase(trim(ElementArr(e)))=lcase(trim(sqlArr(i))) then
						if not rsmodule.eof then
						str=str & rsmodule("DName") &" : "& ValueArr(e) &"|"
						end if
					end if
				next
				rsmodule.close
				next

			else
			
				for e=0 to Ubound(ElementArr)
				rsmodule.open "select * from module where MName='" & ModuleName & "' and EName='"& trim(ElementArr(e)) &"'",cn,1,3
					if lcase(trim(ElementArr(e)))=lcase(trim(sql)) then
						if not rsmodule.eof then
						str=rsmodule("DName") &" : "& ValueArr(e)
						end if
					end if
			    rsmodule.close
				next
			end if
			
		end if	
			
			
		   	
			
			'myMail.To = mail
			
			'myMail.Subject =subject
				response.write "Message which is Notified::" &str &"<br>"
       		mes=str 
       		
       		
       	if instr(rsnot("notify"),"SMS")>0 or instr(rsnot("notify"),"Pager")>0 then
       		Set myMail = Server.CreateObject("CDONTS.NewMail")  
       			if instr(rsnot("notify"),"SMS")>0 then
					mail=mail & rsNot("emobile")
					end if
					if instr(rsnot("notify"),"Pager")>0 then
					mail = mail&","& rsNot("ePager")
					end if
					mm=mail
				myMail.To = mail
				myMail.Subject =subject
				myMail.Body =  mes
				myMail.Send 
				set Mymail=Nothing
			end if
		   
		
			if instr(rsnot("notify"),"e-Mail")>0 then
				Set myMail = Server.CreateObject("CDONTS.NewMail")  
					if instr(rsnot("notify"),"e-Mail")>0 then
					email= rsNot("eMail") 
					end if
				MyMail.To = email
				myMail.Subject =subject
				emes = "<!DOCTYPE HTML PUBLIC ""-//IETF//DTD HTML//EN"">" & NL 
				emes = emes & "<html>" 
				emes = emes & "<head>" 
				emes = emes & "<meta http-equiv=""Content-Type""" 
				emes = emes & "mes = mes & ""content=""text/htcharset=iso-8859-1"">""" 
				emes = emes & "<title>Notification</title>" 
				emes = emes & "</head>" 
				emes = emes & "<body>" 
				emes = emse  &"<table>"
				 
				if instr(mes,"|")>0 then
					mesarr=split(mes,"|")
					for i=0 to Ubound(mesArr)
					emes=emes & "<tr><td>" & mesArr(i) & "</td></tr>" 
					next
				else
					emes=emes & "<tr><td>" & mes & "</td></tr>"
				   
				end if
				
					emes = emes  &"</table>"			   
					emes =emes	 &"</body>"
					
					myMail.BodyFormat=0
  					myMail.MailFormat=0
					myMail.Body =emes
					myMail.Send 
					set Mymail=Nothing 
			end if
			response.write "message sent to:"&mm&","&email
			response.write "<br>"
end if	
End Function

Function Delnotification(values,elementname,ModuleName,Subject,Ucode,UserType)

set rsAllMap=server.createobject("adodb.recordset")
rsAllMap.Open "Select * From AllMap Where UserType = '"&UserType&"' ",cn,1,3
if not rsAllMap.EOF then
	lINVAllocateTo= rsAllMap("AllocateTo")
end if
rsAllMap.close

set rsmast=server.createobject("adodb.recordset")
rsmast.open "select "&lINVAllocateTo&"name from "&lINVAllocateTo&"mast where "&lINVAllocateTo&"code='"&Ucode&"'",cn
if not rsmast.eof then
username=rsmast(0)
end if
rsmast.close		
		
set rsnot=server.createobject("adodb.recordset")
set rsmodule=server.createobject("adodb.recordset")

'response.write "select * from Notify where uname='" & username & "' and Module='" & ModuleName & "' and Event like '%Add%' or Event like '%Edit%' "
rsnot.open "select * from Notify where uname='" & username & "' and Module='" & ModuleName & "' and (Event like '%Add%' or Event like '%Edit%') ",cn
if not rsnot.eof then		
		dim SqlArr,ElementArr,ValueArr
		SqlArr=array()
		
		ValueArr=split(values,"|")
		ElementArr=split(elementname,"|")
		
			
		
			
			
		   	Set myMail = Server.CreateObject("CDONTS.NewMail")  
			myMail.From = "Synergy"
			myMail.To =rsNot("EMailOnDel")
			myMail.Subject =subject
			if not rsnot.eof then
				sql=rsnot("fields")
			
		
				
				emes = "<!DOCTYPE HTML PUBLIC ""-//IETF//DTD HTML//EN"">" & NL 
				emes = emes & "<html>" 
				emes = emes & "<head>" 
				emes = emes & "<meta http-equiv=""Content-Type""" 
				emes = emes & "emes = emes & ""content=""text/htcharset=iso-8859-1"">""" 
				emes = emes & "<title>Escalation</title>" 
				emes = emes & "</head>" 
				emes = emes & "<body>" 
				emes = emse  &"<table>"
				 
				if instr(sql,",")>0 then
					SqlArr=split(sql,",")
					
				for e=0 to Ubound(ElementArr)
					rsmodule.open "select * from module where MName='" & ModuleName & "' and EName='"& trim(ElementArr(e)) &"'",cn,1,3
				for i=0 to Ubound(SqlArr)
					if lcase(trim(ElementArr(e)))=lcase(trim(sqlArr(i))) then
						if not rsmodule.eof then
						emes=emes &"<tr><td>"&rsmodule("DName") &" : "& ValueArr(e) &"</td></tr>"
						lmes=lmes & rsmodule("DName") &" : "& ValueArr(e)
						end if
				   end if
			next
					rsmodule.close
				next

				else
			
				for e=0 to Ubound(ElementArr)
				rsmodule.open "select * from module where MName='" & ModuleName & "' and EName='"& trim(ElementArr(e)) &"'",cn,1,3
					if lcase(trim(ElementArr(e)))=lcase(trim(sql)) then
						if not rsmodule.eof then
							emes=emes &"<tr><td>"& rsmodule("DName") &" : "& ValueArr(e) &"</td></tr>"
							lmes=lmes & rsmodule("DName") &" : "& ValueArr(e)
						end if
					end if	
					rsmodule.CLOSE
				next
				end if
			
							
					emes = emes  &"</table>"			   
					emes =emes	 &"</body>"
					
				
					myMail.BodyFormat=0
  					myMail.MailFormat=0
					myMail.Body =emes
				
			end if
			
			'myMail.Send      
			response.write "Message  which is notified: " & lmes
   
			response.write "Message  Send to " & rsNot("EMailOnDel")
			response.write "<br>"
end if	
End Function
%>