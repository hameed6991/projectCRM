
<%
function checkSQLInjection(checkstr)
    dim specialchars 
    specialchars  = "`,%,&,+,=,',>,<,*,--,"",(,),{,},delete,select,drop,truncate,having" 

    dim valstr 
    valstr = checkstr 	  
    sparr = split(specialchars,",")
    if len(valstr)=0 then   
	   checkSQLInjection = ""
    else
    
	  for ctr =0 to  ubound(sparr) 
	  if instr(lcase(valstr),lcase(sparr(ctr))) then
	  valstr = lcase(valstr) 
	  end if
		valstr  = replace(valstr,sparr(ctr),"")
	  next	 	   
    end if 	  
	  checkSQLInjection= valstr
end function
 %>



