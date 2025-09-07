<%
function overlap_1(username,field,stwith,txtfrom,txtto,apicode,chk,ROCode,ATMID,tablename,locationcode)			






sqlfrm="" 
sqlfrm1=""
sqlsel=""
sqlt="select uname,a.srno,account,r_calldate,r_actualcompdate ,cast(null as varchar(10)) as 'downtime',servicecode,api_servicecode,cast(null as varchar(20)) as 'slab',equipid,acccode,cast(null as varchar(20)) as 'calldup',cast(null as datetime) as 'C_calldate',cast(null as datetime) as 'C_actualcompdate',ServiceDescription,0 as 'idlehrs',orgcalldate,orgactualcompdate,Subcalltype,cast(null as numeric(18,2)) as 'TotAvaTime',AmtLiveDate,cast(null as real) as 'ATMTotAvatime' into " & tablename & " from ("
sqlsel= sqlsel & " select '" & username 	&"' as 'uname', srno,account,calldate as 'r_calldate',actualcompdate as 'r_actualcompdate',"
sqlsel= sqlsel & " servicecode,api_servicecode,servicerequest.equipid,servicerequest.acccode,servicerequest.Description as 'ServiceDescription',calldate as 'orgcalldate',actualcompdate as 'orgactualcompdate',subcalltype as 'Subcalltype',purchase.InstallDate as 'AmtLiveDate' from ((servicerequest inner join accmast on servicerequest.acccode = accmast.acccode) "
sqlsel= sqlsel & " inner join purchase on purchase.equipid = servicerequest.equipid inner join ServiceRequestLookup on ServiceRequestLookup.Code = ServiceRequest.SRNo and " & MyCond & ") where 1=1 "
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
tdate = " and  (CallDate <'" & fmtdate(txtfrom) & "' and actualcompdate >='" &  fmtdate(txtfrom)  & "')"
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

if ROCode <> "" then
	sqlfrm =sqlfrm & " and ServicerequestLookup.ROCode='" & ROCode & "' "
	sqlfrm1 =sqlfrm1 & " and ServicerequestLookup.ROCode='" & ROCode & "' "
end if	

if locationcode<> "All" then
	sqlfrm =sqlfrm & " and ServicerequestLookup.LocationCode='" & locationcode& "' "
	sqlfrm1 =sqlfrm1 & " and ServicerequestLookup.LocationCode='" & locationcode& "' "
end if	
		  
      sqlfrm=sqlfrm& " and actualcompdate is not null " 
      sqlfrm1 =sqlfrm1 & " and actualcompdate is not null " 
      ' response.write sqlfrm 
      'response.end
      msqlfrm=""
      msqlfrm=sqlfrm & " union " & sqlfrm1
'response.write msqlfrm
'response.end
msqlfrm = sqlt & msqlfrm & " ) as a"
      
    
      if msqlfrm<>"" then
	      cn.execute(msqlfrm)
	  end if
	 

end function 


function overlap_2(tablename,txtfrom,txtto,username)		

'//// Updating the Closedate for opencalls
	  
upcadate="update " & tablename & " set r_calldate= '" & fmtdate(txtfrom) & "'  where r_calldate < '" &  fmtdate(txtfrom) & "' and uname = '"& username &"' ;"   
upcadate= upcadate & "update " & tablename & " set r_actualcompdate= '" & fmtdate(txtto) & "'  where r_actualcompdate > '" & fmtdate(txtto) & "'  and uname = '"& username & "'" 

     if upcadate<>"" then
	      cn.execute(upcadate)
	  end if

'//// If call is occuring only once then mark this call as non overlapping calls

upsql = upsql & " update " & tablename & " set C_calldate=r_calldate ,C_actualcompdate=r_actualcompdate "
upsql = upsql & " where equipid in ( "
upsql = upsql & " select equipid from " & tablename & " where uname = '"& username &"' group by equipid having count(*) =1) and uname = '"& username &"'"

     if upsql <>"" then
	      cn.execute(upsql)	
	  end if

end function 
	




function overlap_4(tablename,username)

dim rscheck
set rscheck=server.createobject("ADODB.RecordSet")
set rseq=server.createobject("ADODB.RecordSet")


 
 updatequery =""  
 sqlchk = "select r_calldate,r_actualcompdate,EquipId,srno from " & tablename & " where C_calldate is null and uname = '"& username &"' order by equipid,r_calldate"
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

'//// Identify Overlapping calls
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
				updatequery = updatequery & " update " & tablename & " set calldup='Yes',c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date)  & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
	       	 	else
				updatequery = updatequery & " update " & tablename & " set c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date) & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
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
				updatequery = updatequery & " update " & tablename & " set c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date) & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
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
			updatequery = updatequery & " update " & tablename & " set c_calldate= r_calldate,c_actualcompdate = '" & to_date & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
		else
			updatequery = updatequery & "  update " & tablename & " set calldup='yes',c_calldate= '" & cdate(f_date) & "',c_actualcompdate = '" & cdate(to_date) & "' where srno= '" & f_srno & "' and uname = '"& username &"';"
		end if	       

	end if
loop 
 rscheck.close
 'response.write updatequery
 'response.end

'//// execute overlapping query
    if updatequery <>"" then
	      cn.execute(updatequery)
    end if

	 

end function 



function overlap_5(tablename,username)


 '///// update the slab
upsql =""
	'//Updating Slab and Downtime using COALESCE function
upsql = "	update " & tablename & " set downtime= datediff(n,COALESCE(c_calldate,r_calldate),COALESCE(c_actualcompdate,r_actualcompdate)) where uname = '"& username&"';"
upsql = upsql & " update " & tablename & " set slab= '<2 hours' where downtime < (120-isnull(idlehrs,0)) and slab is null and uname = '"& username &"' ;"
upsql = upsql & " update " & tablename & " set slab= '2-4 hours' where downtime >= (120-isnull(idlehrs,0)) and downtime < (240-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
upsql = upsql & " update " & tablename & " set slab= '4-8 hours' where downtime >= (240-isnull(idlehrs,0)) and downtime < (480-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
upsql = upsql & " update " & tablename & " set slab= '8-12 hours' where downtime >= (480-isnull(idlehrs,0)) and downtime < (720-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
upsql = upsql & " update " & tablename & " set slab= '>12 hours' where downtime  >= (720-isnull(idlehrs,0)) and slab is null and uname = '"& username &"';"
     if upsql <>"" then
	      cn.execute(upsql)
	      
     end if

end function 
%>
							
