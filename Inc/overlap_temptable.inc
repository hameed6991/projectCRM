<%
function overlap(username,field,stwith,txtfrom,txtto,apicode,chk,ROCode,ATMID,ATMStatus)				
dim rscheck
set rscheck=server.createobject("ADODB.RecordSet")
''sqldel= " delete From rep_results where uname = '"& username &"'"
'    cn.execute(sqldel)
sqlfrm="" 
sqlfrm1=""
sqlsel=""

sqlsel= sqlsel & " select '" & username &"' as uname, srno,Account,calldate as r_Calldate,"
'sqlsel= sqlsel & " actualcompdate as r_actualCompdate, 0 as 'downtime',"
sqlsel= sqlsel & " isnull(actualcompdate,'"& fmtdate(txtto) &"') as r_actualCompdate, 0 as 'downtime',"
sqlsel= sqlsel & " servicecode,api_servicecode,cast(null as varchar) as slab,servicerequest.equipid,servicerequest.acccode,"
sqlsel= sqlsel & " cast(null as varchar(20)) as Calldup,cast(null as datetime) as 'c_Calldate',cast(null as datetime) as 'C_actualCompdate',"
sqlsel= sqlsel & " servicerequest.Description as 'ServiceDescription',0 as 'idlehrs',calldate as 'orgcalldate' ,actualcompdate as 'orgActualCompdate',NonAccessibleHours "
sqlsel= sqlsel & " into #Temp  from ((servicerequest "
sqlsel= sqlsel & " Inner Join Sr_Time on ServiceRequest.Srno = Sr_Time.T_Srno "
sqlsel= sqlsel & " inner join accmast on servicerequest.acccode = accmast.acccode) "

if lcase(ATMStatus)="inactive" then
	sqlsel= sqlsel & " left join inactivepurchase as purchase on purchase.equipid = servicerequest.equipid and purchase.acccode=servicerequest.acccode "
else
	sqlsel= sqlsel & " left join purchase on purchase.equipid = servicerequest.equipid and purchase.acccode=servicerequest.acccode "
End if
sqlsel= sqlsel & " inner join ServiceRequestLookup on ServiceRequestLookup.Code = ServiceRequest.SRNo and " & MyCond1 & ") where 1=1 "


sqlfrm = sqlfrm & sqlsel


if field<>"" and stwith <>"" then
	sqlfrm=sqlfrm& " and  " & field & " like '" &   stwith & "%'"
end if	



if txtfrom<>"" and txtto<>"" then
FromDt=txtfrom
ToDt=txtto
dtsql= " and  (CallDate >='" & fmtdate(txtfrom) & "' and CallDate <='" &  fmtdate(txtto) & "'"
tdate = " or  CallDate <'" & fmtdate(txtfrom) & "' "
''//Modified by Christopher on June 19, 2012
'tdate = tdate & " and actualcompdate >='" &  fmtdate(txtfrom)  & "')"
tdate = tdate & " and (actualcompdate is null or actualcompdate >='" &  fmtdate(txtfrom)  & "'))"
end if


sqlfrm = sqlfrm & dtsql	& tdate 

upstr1=""    
      apiflg=false
      
			list=apicode
			if list <> "" then
			arr=split(list,",")
			upStr1=" ServiceRequest.API_Servicecode in("
			for k=0 to ubound(arr)
				apiflg=true
				upStr1=upStr1 & "'" & trim(arr(k))  & "'," 
				 			next
			if apiflg then
				upstr1=left(upstr1,len(upstr1)-1)
			end if 
				upstr1=upstr1 & ") "
			end if
			
			if chk= "ON"  and apiflg =true then
			   	     sqlfrm= sqlfrm & " and (" & upstr1 & " or ServiceRequest.API_Servicecode is null )"
			elseif chk= "ON"  and apiflg =false then
			   	     sqlfrm= sqlfrm & " and (ServiceRequest.API_Servicecode is null )"
			elseif chk= ""  and apiflg =true then
			   	     sqlfrm = sqlfrm & " and (" & upstr1 & " )"
		   end if 

if ATMID<>"" then
	sqlfrm = sqlfrm & " and servicerequest.Equipid " & ATMID
end if

if ROCode <> "" then
	sqlfrm =sqlfrm & " and ServicerequestLookup.ROCode='" & ROCode & "' "
end if	
	
	''//Modified by Christopher on June 19, 2012 for Equalising 1st and 3rd Report
      'sqlfrm=sqlfrm& " and actualcompdate is not null " 
      sqlfrm=sqlfrm& " and DownCode = 1 "
      ' response.write sqlfrm 
      'response.end
      msqlfrm=""
	


      msqlfrm= sqlfrm 

'msqlfrm=msqlfrm

'response.write msqlfrm
'response.end


      if msqlfrm<>"" then
	      cn.execute(msqlfrm)
	  end if
updateidel =""
updateidel ="update #temp set #temp.idlehrs = v_sr_idlehrs.idlehrs from v_sr_idlehrs where #temp.srno = v_sr_idlehrs.srno"

         if msqlfrm<>"" then
	      cn.execute(updateidel)
	  end if
	 
	  
upcadate="update #temp set r_calldate= '" & fmtdate(txtfrom) & "'  where r_calldate < '" &  fmtdate(txtfrom) & "' and uname = '"& username &"' ;"   
upcadate= upcadate & "update #temp set r_actualcompdate= '" & fmtdate(txtto) & "'  where r_actualcompdate > '" & fmtdate(txtto) & "'  and uname = '"& username & "'" 

     if upcadate<>"" then
	      cn.execute(upcadate)
	  end if

upsql = upsql & " update #temp set C_calldate=r_calldate ,C_actualcompdate=r_actualcompdate "
upsql = upsql & " where equipid in ( "
upsql = upsql & " select equipid from #temp where uname = '"& username &"' group by equipid having count(*) =1) and uname = '"& username &"'"

     if upsql <>"" then
	      cn.execute(upsql)
	  end if
 
 updatequery =""  
 sqlchk = "select r_calldate,r_actualcompdate,EquipId,srno from #temp where C_calldate is null and uname = '"& username &"' order by equipid,r_calldate"
 rscheck.open sqlchk,cn

 CallDate=""
 CallDate1=""
 actualcompdate =""
 EquipId =""
 f_srno =""
 f_date = null
 to_date = null
 updatequery =""
 overlap=""

 do while not rscheck.eof '// loop for grouping the overlap time

	 if EquipId="" then
   		 EquipId = rscheck("EquipId") 
		 f_date = cdate(rscheck("r_calldate"))
		 to_date= cdate(rscheck("r_actualcompdate"))
	     f_srno =rscheck("srno")
	     overlap=""
	 elseif EquipID = rscheck("EquipID") then
		     if cdate(f_date) <= cdate(rscheck("r_calldate"))  and cdate(rscheck("r_calldate"))  <= cdate(to_date) then
       		 	if cdate(to_date) <= cdate(rscheck("r_actualcompdate"))  then
        				 to_date = cdate(rscheck("r_actualcompdate")) 
					    overlap="Yes"
		        	end if 	
       	 else
	       	 '/// Prepare update query.
	       	 	if Overlap ="Yes" then
				       updatequery = updatequery & " update #temp set calldup='Yes',c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date)  & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
	       	 	else
				       updatequery = updatequery & " update #temp set c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date) & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
			end if   
				  '/// Reset the variables - for next Equipment
						 EquipID =rscheck("EquipID")
						 f_date = cdate(rscheck("r_calldate"))
						 to_date= cdate(rscheck("r_actualcompdate"))
					    f_srno =rscheck("srno")
	        end if
	 end if	
	
	 rscheck.movenext
		
	 if not rscheck.eof then
			 if EquipID <> rscheck("EquipID") then
				 		if instr(1,updatequery,f_srno) = 0 and f_srno <>"" then
								updatequery = updatequery & " update #temp set c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date) & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
						end if		

				'/// Reset the variables - for next Equipment

						EquipID =""
						f_date=null
						To_date =null
						f_srno=""	
						overlap=""
				elseif EquipID =rscheck("EquipID") and isnull(f_date) then
					 f_date = cdate(rscheck("r_calldate"))
					 to_date= cdate(rscheck("r_actualcompdate"))
				     f_srno =rscheck("srno")
			end if
	else 
			if overlap="Yes" then
				    updatequery = updatequery & " update #temp set c_calldate= r_calldate,c_actualcompdate = '" & to_date & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
			else
			       updatequery = updatequery & "  update #temp set calldup='yes',c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date) & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
			end if	       

	end if
 loop 
 rscheck.close
 'response.write updatequery
 'response.end

    if updatequery <>"" then
	      cn.execute(updatequery)
	  end if
	 ' response.end
	 
 
 
upsql =""
	'//Updating Slab and Downtime using COALESCE function
upsql = "update #temp set downtime= datediff(n,COALESCE(c_calldate,r_calldate),COALESCE(c_actualcompdate,r_actualcompdate)) where uname = '"& username&"';"
if upsql <>"" then
	      cn.execute(upsql)
	      
  end if
upsql1 = " update #temp set slab= '<2 hours' where downtime < (120-isnull(idlehrs,0)) and slab is null and uname = '"& username &"' ;"
if upsql1 <>"" then
	      cn.execute(upsql1)
end if
	     
upsql2 =  "update #temp set slab= '2-4 hours' where downtime >= (120-isnull(idlehrs,0)) and downtime < (240-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
if upsql2 <>"" then
	      cn.execute(upsql2)
end if
upsql3 =  "update #temp set slab= '4-8 hours' where downtime >= (240-isnull(idlehrs,0)) and downtime < (480-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
if upsql3 <>"" then
	      cn.execute(upsql3)
end if
upsql4 =  "update #temp set slab= '8-12 hours' where downtime >= (480-isnull(idlehrs,0)) and downtime < (720-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
if upsql4 <>"" then
	      cn.execute(upsql4)
end if
upsql5 =  "update #temp set slab= '>12 hours' where downtime  >= (720-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
if upsql4 <>"" then
	      cn.execute(upsql5)
end if
'response.write upsql
'response.end
   
end function 


%>
							
