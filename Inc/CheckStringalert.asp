
<%

  function checkwhitelist(checkstr,field)
      myString = Replace(checkstr, " – ", "-")
      Dim regex  
      Set regex = New RegExp  
      if lcase(field) <> "glist" and lcase(field) <> "disp" and lcase(field) <> "hdnquery" and lcase(field) <> "hdnquery2" and lcase(field) <> "hdnbranch" and lcase(field) <> "sqlq" and lcase(field) <> "hdnxml" and lcase(field) <> "hdnatmid" and lcase(field) <> "__viewstate"  and lcase(field)<>"aspxgridlookup" and lcase(field)<>"aspxgridlookup1$ddd$gv$callbackstate" then
      regex.Pattern = "[^0-9a-zA-Z_\+\._@$\*!:;#\~\^\|\?/\-\\\[\]\(\)\054\n\r\t\ ]"
      else
      regex.Pattern = "[^0-9a-zA-Z_\+\._@$\*!:;#\,\~\^\|\?/\-\=\'\\\[\]\(\)\054\n\r\t\ ]"
      end if 
      checkwhitelist =regex.Test(myString)
      
     end function
    

function checkSQLInjectionalert(checkstr,var)

	dim valstr 
	
	if lcase(var) <>"aspxgridlookup1$ddd$gv$callbackstate" and lcase(var) <> "__viewstate"  and lcase(var)<>"aspxgridlookup" then
	
	    dim specialchars 
	   
	    if  ((lcase(Left(var,3)) = "cmd" or lcase(var) ="submit") and lcase(checkstr)="delete") or (lcase(var) = "hdnquery2" or lcase(var) = "hdnquery" or lcase(var) = "disp") then
	    specialchars  = "truncate,having,http,www" 
	    else
	    specialchars  = "delete,select,truncate,having,http,www" 
	    end if
	
	    
	    valstr = checkstr 	  
	    sparr = split(specialchars,",")
	    if len(valstr)=0 then   
		   checkSQLInjectionalert= ""
	    else
	    
		  for ctr =0 to  ubound(sparr) 
		  	if instr(lcase(valstr),lcase(sparr(ctr))) then
		  		valstr = lcase(valstr) 
		  		'valstr  = replace(valstr,sparr(ctr),"")
	 			valstr  = "Error"
		  	end if
		  next	 	   
	    end if
    else
    	valstr=""
    end if
	  checkSQLInjectionalert = valstr
end function

IF request.Form.Count > 0 THEN
 'FOR i = 1 TO request.Form.Count
 'dim var 
   for each var in Request.Form
     if checkwhitelist(request.Form.Item(var),var) = False then
       if 	checkSQLInjectionalert(request.Form.Item(var),var) = "Error" then
           'response.write lcase(var)
	       'response.write trim(request.Form.Item(var)) & "1"
	       'response.end
	       Response.redirect "errorpage_form.asp"
	    end if
	    
	  else
	     
	     'response.write lcase(var) & "<br/>"
	     'response.write trim(request.Form.Item(var)) & "2"
	     'response.end
	     Response.redirect "errorpage_form.asp"
     end if  
  NEXT

end if


IF request.QueryString.Count > 0 THEN

 'FOR i = 1 TO request.QueryString.Count
    for each var in request.QueryString
     if checkwhitelist(request.QueryString.Item(var),var) = False then
        if checkSQLInjectionalert(request.QueryString.Item(var),var) = "Error" then
             'response.write lcase(var) & "<br/>"
	         'response.write trim(request.QueryString.Item(var)) & "3"
	         'response.end
	         Response.redirect "errorpage_form.asp"
	     end if
	  else 
	        'response.write lcase(var) & "<br/> "
	        'response.write trim(request.QueryString.Item(var)) & "4"
	        'response.end
	        Response.redirect "errorpage_form.asp"
     end if  
  NEXT

end if

 %>





