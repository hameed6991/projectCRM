<%
 function SaveDTable(Module,Linkfldvalue,FType) 
     set rs = Server.createObject("Adodb.RecordSet")
 	  set rsd= Server.CreateObject("ADODB.Recordset")
	  str="select a.cd,a.tableref,b.ID,b.fldname,fDbType,FDBSize,b.Seq,a.linkfld,'auto_'+a.tableref+replace(b.fldname,' ','_') as 'fieldname'  From D_TabDef a , d_tabdet b where a.cd = b.cd and module='" & Module & "' and  b.flg is null"
     rsd.open str,cn,1,1
     if not rsd.eof then
         D_Tabname =rsd("tableref")
         linkfld = rsd("linkfld")
               if FType="Add" then
               rs.open "select * from  " & D_TabName & " where 1=2",cn,1,3
               else
               rs.open "select * from  " & D_TabName & " where " & linkfld & "='" & Linkfldvalue & "'",cn,1,3
               end if
               if rs.eof then
               rs.AddNew
               end if
               do while not rsd.eof 
               rs(linkfld) = Linkfldvalue
               if rsd("fDbType")="datetime" then
                        if isdate(request.form(rsd("fieldname"))) then
							rs(trim(rsd("fldname")))= fmtDate(request.form(rsd("fieldname")))
							else 
							rs(trim(rsd("fldname")))= null
							end if
	            elseif rsd("fDbType")="numeric" then
	                     if isnumeric(request.form(rsd("fieldname"))) then
							rs(trim(rsd("fldname")))= request.form(rsd("fieldname"))
							else 
							rs(trim(rsd("fldname")))= null
							end if
                else 	
                      
                        rs(trim(rsd("fldname"))) = request.form(rsd("fieldname"))		
                end if        
               rsd.movenext
	           loop
              rs.update
              rs.close
     end if
     rsd.close
end function
%>