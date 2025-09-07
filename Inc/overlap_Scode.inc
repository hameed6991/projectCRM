<%
function overlap(username,field,stwith,txtfrom,txtto,apicode,chk,ROCode,ATMID,Calltype,LocationCode,Customer,ATMStatus)
dim rscheck
set rscheck=server.createobject("ADODB.RecordSet")
set rseq=server.createobject("ADODB.RecordSet")
sqldel= " delete From rep_results where uname = '"& username &"'"
    cn.execute(sqldel)
sqlfrm="" 
sqlfrm1=""
sqlsel=""
sqlfrm= " insert into rep_results (uname,srno,account,r_calldate,r_actualcompdate,servicecode,api_servicecode,equipid,acccode,ServiceDescription,idlehrs,orgcalldate,orgactualcompdate,Subcalltype,AmtLiveDate,ATMStatus) "

sqlsel= sqlsel & " select '" & username 	&"', srno,account,calldate,(case when actualcompdate is not null then actualcompdate else getdate() end) as'actualcompdate', "
sqlsel= sqlsel & " servicecode,api_servicecode,servicerequest.equipid,servicerequest.acccode,servicerequest.Description,(select sum(datediff(n,IdleStartTime,IdleEndTime)) "
sqlsel= sqlsel & " from Sr_IdleHrs where Sr_IdleHrs.srno = servicerequest.srno)  as 'Idelmin',calldate,actualcompdate,subcalltype,purchase.InstallDate,purchase.Status "
sqlsel= sqlsel & " from ((servicerequest inner join accmast on servicerequest.acccode = accmast.acccode) "

if lcase(ATMStatus)="inactive" then
	sqlsel= sqlsel & " inner join inactivepurchase as purchase on purchase.equipid = servicerequest.equipid and purchase.acccode=servicerequest.acccode "
	sqlsel= sqlsel & " inner join ServiceRequestLookup on ServiceRequestLookup.Code = ServiceRequest.SRNo "
	'sqlsel= sqlsel & " and " & MyCond & ") where 1=1 and servicerequest.downcode=1 and servicerequest.parentsrno is null "
	sqlsel= sqlsel & " and " & MyCond & ") where 1=1 and servicerequest.downcode=1 "
Else
	sqlsel= sqlsel & " inner join purchase on purchase.equipid = servicerequest.equipid and purchase.acccode=servicerequest.acccode "
	sqlsel= sqlsel & " inner join ServiceRequestLookup on ServiceRequestLookup.Code = ServiceRequest.SRNo "
	'sqlsel= sqlsel & " and " & MyCond & ") where 1=1 and servicerequest.downcode=1 and servicerequest.parentsrno is null "
	sqlsel= sqlsel & " and " & MyCond & ") where 1=1 and servicerequest.downcode=1 "
End if

'response.write sqlsel
sqlfrm = sqlfrm & sqlsel
sqlfrm1 = sqlsel

if field<>"" and stwith <>"" then
	sqlfrm=sqlfrm& " and  " & field & " like '" &   stwith & "%'"
	sqlfrm1=sqlfrm1& " and  " & field & " like '" &   stwith & "%'"
end if	

if txtfrom<>"" and txtto<>"" then

FromDt=txtfrom
ToDt=txtto


'arrFrom=split(FromDt,"/")
'arrTo=split(ToDt,"/")

'dtsql= " and  CallDate >='" & MonthName(Cint(arrFrom(1))) & " " & arrFrom(0) & ", " & arrFrom(2) & "' and CallDate <='" & MonthName(cint(arrTo(1))) & " " & arrTo(0) & ", " & arrTo(2) & " '"
'tdate = " and  CallDate <='" & MonthName(Cint(arrFrom(1))) & " " & arrFrom(0) & ", " & arrFrom(2) & "' and actualcompdate >='" & MonthName(cint(arrTo(1))) & " " & arrTo(0) & ", " & arrTo(2) & " '"
dtsql= " and  CallDate >='" & fmtdate(txtfrom) & "' and CallDate <='" &  fmtdate(txtto) & "'"
tdate = " and  ((CallDate <'" & fmtdate(txtfrom) & "' and actualcompdate >='" &  fmtdate(txtfrom)  & "')"
tdate = tdate & " or (CallDate <'" & fmtdate(txtfrom) & "' and actualcompdate is null))"
end if


sqlfrm = sqlfrm & dtsql
sqlfrm1 = sqlfrm1 & tdate	
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
			   	     sqlfrm1 = sqlfrm1 & " and (" & upstr1 & " or ServiceRequest.API_Servicecode is null )"
			elseif chk= "ON"  and apiflg =false then
			   	     sqlfrm= sqlfrm & " and (ServiceRequest.API_Servicecode is null )"
			   	     sqlfrm1 = sqlfrm1 & " and (ServiceRequest.API_Servicecode is null )"
			elseif chk= ""  and apiflg =true then
			   	     sqlfrm = sqlfrm & " and (" & upstr1 & " )"
			   	     sqlfrm1 = sqlfrm1 & " and (" & upstr1 & " )"
		        end if 

if ATMID<>"" then
	sqlfrm = sqlfrm & " and servicerequest.Equipid " & ATMID
	sqlfrm1 = sqlfrm1 & " and servicerequest.Equipid " & ATMID
end if

if Customer<> "" then
	sqlfrm =sqlfrm & " and accmast.account='" & Customer& "' "
	sqlfrm1 =sqlfrm1 & " and accmast.account='" & Customer& "' "
end if

if ROCode <> "" then
	sqlfrm =sqlfrm & " and ServicerequestLookup.ROCode='" & ROCode & "' "
	sqlfrm1 =sqlfrm1 & " and ServicerequestLookup.ROCode='" & ROCode & "' "
end if	

if LocationCode <> "All" then
	sqlfrm =sqlfrm & " and ServicerequestLookup.LocationCode='" & LocationCode & "' "
	sqlfrm1 =sqlfrm1 & " and ServicerequestLookup.LocationCode='" & LocationCode & "' "
end if	

if Calltype <> "" then
	sqlfrm =sqlfrm & " and Servicerequest.area='" & Calltype & "' "
	sqlfrm1 =sqlfrm1 & " and Servicerequest.area='" & Calltype & "' "
end if
		  
      'sqlfrm=sqlfrm& " and actualcompdate is not null " 
      'sqlfrm1 =sqlfrm1 & " and actualcompdate is not null " 
      ' response.write sqlfrm 
      'response.end
      msqlfrm=""
      msqlfrm = sqlfrm & " union " & sqlfrm1
      
'response.write msqlfrm
'response.end
      if msqlfrm<>"" then
	      cn.execute(msqlfrm)
	  end if
	 
	  
upcadate="update rep_Results set r_calldate= '" & fmtdate(txtfrom) & "'  where r_calldate < '" &  fmtdate(txtfrom) & "' and uname = '"& username &"' ;"   
upcadate= upcadate & "update rep_Results set r_actualcompdate= '" & fmtdate(txtto) & "'  where r_actualcompdate > '" & fmtdate(txtto) & "'  and uname = '"& username & "'" 

     if upcadate<>"" then
	      cn.execute(upcadate)
	  end if

upsql = upsql & " update rep_results set C_calldate=r_calldate ,C_actualcompdate=r_actualcompdate "
upsql = upsql & " where equipid in ( "
upsql = upsql & " select equipid from rep_results where uname = '"& username &"' group by equipid having count(*) =1) and uname = '"& username &"'"

     if upsql <>"" then
	      cn.execute(upsql)	
	  end if
 
 updatequery =""  
 sqlchk = "select r_calldate,r_actualcompdate,EquipId,srno from rep_results where C_calldate is null and uname = '"& username &"' order by equipid,r_calldate"
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
				updatequery = updatequery & " update rep_results set calldup='Yes',c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date)  & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
	       	 	else
				updatequery = updatequery & " update rep_results set c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date) & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
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
				updatequery = updatequery & " update rep_results set c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date) & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
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
			updatequery = updatequery & " update rep_results set c_calldate= r_calldate,c_actualcompdate = '" & to_date & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
		else
			updatequery = updatequery & "  update rep_results set calldup='yes',c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date) & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
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
upsql = "	update rep_results set downtime= datediff(n,COALESCE(c_calldate,r_calldate),COALESCE(c_actualcompdate,r_actualcompdate)) where uname = '"& username&"';"
upsql = upsql & " update rep_results set slab= '<2 hours' where downtime < (120-isnull(idlehrs,0)) and slab is null and uname = '"& username &"' ;"
upsql = upsql & " update rep_results set slab= '2-4 hours' where downtime >= (120-isnull(idlehrs,0)) and downtime < (240-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
upsql = upsql & " update rep_results set slab= '4-8 hours' where downtime >= (240-isnull(idlehrs,0)) and downtime < (480-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
upsql = upsql & " update rep_results set slab= '8-12 hours' where downtime >= (480-isnull(idlehrs,0)) and downtime < (720-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
upsql = upsql & " update rep_results set slab= '>12 hours' where downtime  >= (720-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
     if upsql <>"" then
	      cn.execute(upsql)
	      
     end if



'//Updating Total Avaiable Time

rseq.open "select distinct equipid from rep_results where uname ='"& username &"'",cn
do while not rseq.eof
upl=""
''//Modified by Christopher on September 4th to Avoid - Subquery returned more than 1 value
'upl="update rep_results set totAvatime = (case when rep_results.AmtLiveDate is not null and rep_results.AmtLiveDate > '"&fmtdate(txtfrom)&"' then datediff(n,rep_results.AmtLiveDate,'"&fmtdate(txtto)&"') else datediff(n,'"&fmtdate(txtfrom)&"','"& fmtdate(txtto) &"') end ) where srno in (select top 1 srno from rep_results where equipid ='" & rseq("equipid")& "' and uname='" & username & "')"
upl="update rep_results set totAvatime = (case when rep_results.AmtLiveDate is not null and rep_results.AmtLiveDate > '"&fmtdate(txtfrom)&"' then datediff(n,rep_results.AmtLiveDate,'"&fmtdate(txtto)&"') else datediff(n,'"&fmtdate(txtfrom)&"','"& fmtdate(txtto) &"') end ) where equipid = '" & rseq("equipid")& "' and uname= '" & username & "' "
cn.execute(upl)
upl1="update rep_results set ATMTotAvatime = ((totavatime-(select cast(isnull(sum(case when (c_calldate is null) then 0 else a.downtime-isnull(a.idlehrs,0) end),0) as int) from rep_Results a where a.equipid='" & rseq("equipid")& "' and uname='" & username & "'))*100/(totavatime)) where totavatime is not null and uname='" & username & "' and equipid ='" & rseq("equipid")& "'"
'response.write upl1
cn.execute(upl1)
rseq.movenext
loop 
 rseq.close
 
cn.execute("Update rep_results Set ExcludedDownTime = dbo.fnCalculateNonAccessibleHours(Acccode,C_CallDate,C_ActualCompDate) where uname = '"& username &"'")

end function 


%>
							
