
<%


  function checkwhitelist(checkstr,field)
 
      myString = Replace(checkstr, " – ", "-")
      Dim regex  
      Set regex = New RegExp  
      regex.Pattern = "[^0-9a-zA-Z_\+\._@$\*!:;\~\^\|\?[/]\-\=\'\\\[\]\(\)\054\<> ]"
      checkwhitelist =regex.Test(myString)
      
     end function
    

function checkSQLInjectionalert(checkstr,var)
    dim specialchars 
    specialchars  = "delete,select,drop,truncate,having,http,www,alert" 
    dim valstr 
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
	  checkSQLInjectionalert= valstr
end function

IF request.Form.Count > 0 THEN
 'FOR i = 1 TO request.Form.Count
 dim var 
   for each var in Request.Form
     if checkwhitelist(request.Form.Item(var),var) = False then
       if 	checkSQLInjectionalert(request.Form.Item(var),var) = "Error" then
           'response.write lcase(var)
	      'response.write trim(request.Form.Item(var)) & "1"
	      Response.redirect "errorpage_form.asp"
	 	 
	    end if
	    
	  else
	     
	      'response.write lcase(var) & "<br/>"
	     ' response.write trim(request.Form.Item(var)) & "2"
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
          Response.redirect "errorpage_form.asp"
	     end if
	  else 
	       'response.write lcase(var) & "<br/> "
	       'response.write trim(request.QueryString.Item(var)) & "4"
	       Response.redirect "errorpage_form.asp"
     end if  
  NEXT

end if

 %>





