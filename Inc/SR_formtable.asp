<%
dim EquipId,Model,Module,SiteID,CSE,Complaint,Description,Install,ActualStartDate,lstatus,le,lmyengineer
dim stridlehrs,lmyteam,Site,lstrTeamMap,lstrEngMap,lBillFlag,lJustification,Uname,AccCode
dim ContCode,popup,srvendorcode,servicecode,subcalltype,strService,reallocatedateman
dim api_servicecode,rocode,LocationCode,bankdocno,srvendorname,HubLocationCode
dim Custodian1Mobile,Custodian2Mobile

''///Added by Christopher on April 28, 2012 for Storing DownCode in Sr_Time Table
Dim DownCode

function FormSRTable(SrNo,FnFromModule)
	sql1 = " select "

    '''''///Changed By Christopher on Feb 3, 2012 to Increase the Perfomance
	'sql1=sql1 & " ServiceRequest.*, "    	
	sql1=sql1 & " ServiceRequest.CallDate,ServiceRequest.EquipId, "
	sql1=sql1 & " ServiceRequest.Module,ServiceRequest.ContactPerson, "
	sql1=sql1 & " ServiceRequest.api_servicecode,ServiceRequest.status, "
	sql1=sql1 & " ServiceRequest.substatus,ServiceRequest.ActualStartDate, "
	sql1=sql1 & " ServiceRequest.teamcode,ServiceRequest.engcode, "
	sql1=sql1 & " ServiceRequest.abstract,ServiceRequest.DownCode, "
	sql1=sql1 & " ServiceRequest.Description,ServiceRequest.DownTime, "
	sql1=sql1 & " ServiceRequest.servicecode,ServiceRequest.vendorcode, "
	sql1=sql1 & " ServiceRequest.subcalltype,ServiceRequest.Area, "
	sql1=sql1 & " ServiceRequest.flag,ServiceRequest.issuerefno, "
	sql1=sql1 & " ServiceRequest.SerialNo, "
	
	
	sql1=sql1 & " VendorMast.vendorname,servicerequestlookup.Locationcode,servicerequestlookup.ROCode, ProdMast.Proddesc, ProdMast.ProdCode, CSEMast.CSEName as CSE,"
	sql1=sql1 & " CSEMast2.CSEName as [CSE2],accmast.hublocation as [Hublocationcode],AccMast.Site,AccMast.SiteId,AccMast.Account,AccMast.Bank,AccMast.AccCode,"
	'sql1=sql1 & " CSEMast2.CSEName as [CSE2],accmast.hublocation as [Hublocationcode],AccMast.Site,AccMast.SiteId,AccountMaster.AccountName,BankMaster.BankName,AccMast.AccCode,"
	sql1=sql1 & " Purchase.InstallDate,Purchase.brandname, Accmast.Address, Roname, locationname, sublocationname,"
	sql1=sql1 & " hublocationname,CSEMast.[CELL PHONE] as Custodian1Mobile,"
	sql1=sql1 & " CSEMast2.[CELL PHONE] as Custodian2Mobile "
	sql1=sql1 & " from (((((((((((ServiceRequest with(nolock) "
	sql1=sql1 & " Left Join CSEMast on ServiceRequest.EngCode = CSEMast.CSECode)"
	sql1=sql1 & " Left Join CSEMast as [CSEMast2] on ServiceRequest.EngCode2 = CSEMast2.CSECode)"
	sql1=sql1 & " Left Join servicerequestlookup with(nolock) on ServiceRequest.srno=servicerequestlookup.code) "
	sql1=sql1 & " Left Join AccMast with(nolock) on ServiceRequest.AccCode =AccMast.AccCode) "
	sql1=sql1 & " Left Join ProdMast on ServiceRequest.ProdCode =ProdMast.ProdCode)"
	sql1=sql1 & " Left Join Purchase with(nolock) on ServiceRequest.EquipId =Purchase.EquipId)"
	sql1=sql1 & " Left Join locationmast on locationmast.locationcode =Servicerequestlookup.locationcode)"
	sql1=sql1 & " Left Join Sublocationmast on Sublocationmast.Sublocationcode =Accmast.Sublocation)"
	sql1=sql1 & " Left Join Hublocationmast on Hublocationmast.Hublocationcode =Accmast.Hublocation)"
	sql1=sql1 & " Left Join romast on romast.rocode=Servicerequestlookup.rocode)"
	sql1=sql1 & " Left Join vendormast on vendormast.vendorcode=Servicerequest.vendorcode)"
	sql1=sql1 & " where Srno ='"& Srno &"'"

	rs.open sql1,cn,3,1

	if not rs.EOF then

		AccCode = rs("AccCode")
		Complaint = ShowDate(rs("CallDate"))
		Account = rs("Account")
		Bank = rs("Bank")
		Address = rs("Address")
		EquipId= rs("EquipId")
		Model=rs("Proddesc")
		Module=rs("Module")
		Contact = rs("ContactPerson")
		SiteId=rs("SiteID")
		Site= rs("Site")
		CSE=rs("CSE")
		CSE2=rs("CSE2")
		
        api_servicecode = rs("api_servicecode")
		rocode = rs("ROCode")
		
		lstatus=rs("status")
		lsubstatus=rs("substatus")
		ActualStartDate = rs("ActualStartDate")
		lmyteam = rs("teamcode")
		lt = rs("teamcode")
		lmyengineer = rs("engcode")
		le = rs("engcode")
		lAbstract = rs("abstract")
		SerialNo=rs("SerialNo")
		ProdDesc=rs("ProdDesc")
		ProdCode=rs("ProdCode")
		DownCode=rs("DownCode")
		Install=ShowDate(rs("InstallDate"))
		Description=rs("Description")
		DownTime=rs("DownTime")
		Brand = rs("brandname")
		servicecode=rs("servicecode")
		srvendorcode=rs("vendorcode")
		LocationCode=rs("LocationCode")
		subcalltype=rs("subcalltype")
		calltype=rs("Area")
		nextactdate=rs("flag")
		Roname = rs("Roname")
		srvendorname = rs("vendorname")
		locationname = rs("locationname")
		sublocationname = rs("sublocationname")
		hublocationname = rs("hublocationname")
		HubLocationCode = rs("Hublocationcode")
		bankdocno =rs("issuerefno")
		'Comments = rs("Comments")
		Custodian1Mobile =rs("Custodian1Mobile")
		Custodian2Mobile =rs("Custodian2Mobile")
	end if
	rs.Close

strTableValue = "<table cellspacing='0' cellpadding='0' border='0' width='100%' height='34' bgcolor='#F5F5F5' bordercolor='#cfcfcf'>"
strTableValue = strTableValue & "<tr>"
strTableValue = strTableValue & "<td align='right' valign='middle' class='bodytxt_black'>"
strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>"
strTableValue = strTableValue & "<font face='MS Sans Serif' color='Red' size='3'></font>Docket&nbsp;No&nbsp;</td>"
strTableValue = strTableValue & "<td>"
strTableValue = strTableValue & "<input value='"
strTableValue = strTableValue & Srno & "' maxlength='12' readonly name='txtSrno' size='12' class='inputstyle'>"
strTableValue = strTableValue & "<input value='"& no &"' type='hidden' maxlength='12'"
strTableValue = strTableValue & " readonly name='txtReferenceNo' size='12' class='inputstyle'></td>"
'strTableValue = strTableValue & "<td align='right' class='bodytxt_black'>"
'strTableValue = strTableValue & "<font color='#0000FF' face='MS Sans Serif' size='3'>*</font>"
'strTableValue = strTableValue & "Created Dt&nbsp;</td>"
'strTableValue = strTableValue & "<td>"
'strTableValue = strTableValue & "<input name='txtCreateDate' readonly value='"
'strTableValue = strTableValue & Date1 & "' size='16' class='inputstyle'"
'strTableValue = strTableValue & "maxlength='16'></td>"
strTableValue = strTableValue & "<td class='bodytxt_black' >"
strTableValue = strTableValue & "<p align='right'>"
strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font> Call&nbsp;Date</p>"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "<td>"
strTableValue = strTableValue & "<input name='txtComplaint' readonly size='16' class='inputstyle' value='"& trim(Complaint) &"' "
strTableValue = strTableValue & "maxlength='16'></font></td>"
strTableValue = strTableValue & "<td class='bodytxt_black' width='90'>"
strTableValue = strTableValue & "<p align='right'>"
strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>"
strTableValue = strTableValue & "Product&nbsp;Description&nbsp;</td>"
strTableValue = strTableValue & "<td>"
strTableValue = strTableValue & "<input name='txtModel' readonly size='30' class='inputstyle' value='"& Model &"'></font></td>"
strTableValue = strTableValue & "<td align='right' class='bodytxt_black' >"
strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>&nbsp;Dispatch&nbsp;Date&nbsp;</td>"
strTableValue = strTableValue & "<td>"
strTableValue = strTableValue & "<input name='txtdisdate' readonly value='"& showdate(ActualStartDate) &"' "
strTableValue = strTableValue & "size='30' class='inputstyle' maxlength='30'>"
strTableValue = strTableValue & "</td>"
'strTableValue = strTableValue & "<td class='bodytxt_black' valign='middle' align='right'>"
'strTableValue = strTableValue & "Ref No</td>"
'strTableValue = strTableValue & "<td class='bodytxt_black' align='right'>"
'strTableValue = strTableValue & "<input name='txtIssueRefNo' size='30' class='inputstyle' value='"& bankdocno &"' readonly "
'strTableValue = strTableValue & "maxlength='20'>"
'strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "</tr>"
strTableValue = strTableValue & "<tr>"

'strTableValue = strTableValue & "<td align='right' class='bodytxt_black'>"
'strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>Serial No&nbsp;"
'strTableValue = strTableValue & "</td>"
'strTableValue = strTableValue & "<td>"
'strTableValue = strTableValue & "<input name='txtDueDate' size='16' class='inputstyle' value='"& EquipID &"' readonly></font></td>"

strTableValue = strTableValue & "<td align='right' class='bodytxt_black'>"
strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>Account&nbsp;"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "<td>"
strTableValue = strTableValue & "<input readonly name='txtAccount' value='"& Account &"' size='30' class='inputstyle'"
strTableValue = strTableValue & " maxlength='30'></td>"
strTableValue = strTableValue & "<input type='hidden' name='txtSiteID' value='"& SiteID &"'>"
'strTableValue = strTableValue & "<td class='bodytxt_black'>"
'strTableValue = strTableValue & "<p align='right'>"
'strTableValue = strTableValue & "<font face='MS Sans Serif' size='3' color='blue'>*</font>"
'strTableValue = strTableValue & "Site&nbsp;</td>"
'strTableValue = strTableValue & "<td>"
'strTableValue = strTableValue & "<input name='txtSite' readonly value='"& Site &"' size='20' class='inputstyle' maxlength='20'></font></td>"
strTableValue = strTableValue & "<td align='right' class='bodytxt_black' width='131'>"
strTableValue = strTableValue & "&nbsp;&nbsp;<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>Contact&nbsp;"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "<td >"
strTableValue = strTableValue & "<input readonly name='txtcontacts' size='20' value='"& Contact & "' class='inputstyle' "
strTableValue = strTableValue & "maxlength='20'>"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "<td align='right' class='bodytxt_black'>"
strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>Call&nbsp;Type&nbsp;&nbsp;</td>"
strTableValue = strTableValue & "<td>"
strTableValue = strTableValue & "<input name='txtcalltype' size='16' class='inputstyle' value='"& Calltype &"' readonly>"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "<td class='bodytxt_black'>"
strTableValue = strTableValue & "<p align='right'>"
strTableValue = strTableValue & "<font face='MS Sans Serif' size='3' color='blue'>*</font> Sub&nbsp;Call&nbsp;Type</p>"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "<td>"
strTableValue = strTableValue & "<input name='txtsubcalltype' size='16' class='inputstyle' value='"& Subcalltype &"' "
strTableValue = strTableValue & " readonly>"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "</tr>"

strTableValue = strTableValue & "<tr>"
strTableValue = strTableValue & "<td align='right' class='bodytxt_black'>"
strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>Region&nbsp;"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "<td >"
strTableValue = strTableValue & "<input name='txtregion' size='16' class='inputstyle' value='"&Roname&"' readonly>"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "<td align='right' class='bodytxt_black'>"
strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>Location&nbsp;</td>"
strTableValue = strTableValue & "<td >"
strTableValue = strTableValue & "<input name='txtlocation' size='16' class='inputstyle' value='"& locationname&"' "
strTableValue = strTableValue & " readonly>"
strTableValue = strTableValue & "</td>"

strTableValue = strTableValue & "<td align='right' class='bodytxt_black' style='visibility: hidden'>"
strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>Serial&nbsp;No&nbsp;"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "<td style='visibility: hidden'>"
strTableValue = strTableValue & "<input name='txtDueDate' size='16' class='inputstyle' value='"& EquipID &"' readonly></font></td>"


'strTableValue = strTableValue & "<td class='bodytxt_black' valign='middle'>"
'strTableValue = strTableValue & "<p align='right'>"
'strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>Hub Location</p>"
'strTableValue = strTableValue & "</td>"
'strTableValue = strTableValue & "<td class='bodytxt_black'>"
'strTableValue = strTableValue & "<input name='txthublocation' size='16' class='inputstyle' value='"& hublocationname &"' "
'strTableValue = strTableValue & " readonly>"
'strTableValue = strTableValue & "</td>"
'strTableValue = strTableValue & "<td class='bodytxt_black'>"
'strTableValue = strTableValue & "<p align='right'>"
'strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>Sub Location&nbsp;</p>"
'strTableValue = strTableValue & "</td>"
'strTableValue = strTableValue & "<td>"
'strTableValue = strTableValue & "<input name='txtsublocation' size='16' class='inputstyle' value='"& sublocationname &"' "
'strTableValue = strTableValue & " readonly>"
'strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "</tr>"
strTableValue = strTableValue & "<tr>"
strTableValue = strTableValue & "<td class='bodytxt_black' valign='middle'>"
strTableValue = strTableValue & "<p align='right'>"
strTableValue = strTableValue & "<font face='MS Sans Serif' size='3' color='blue'>*</font>Diagnosis</p>"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "<td colspan='3'>"
strTableValue = strTableValue & "<textarea readonly name='txtdescription' class='inputstyle' style='width: 365; height: 50'"
strTableValue = strTableValue & " rows='2' cols='20' tabindex='1'>"&Description&"</textarea></td>"
strTableValue = strTableValue & "<td class='bodytxt_black'>"
strTableValue = strTableValue & "<p align='right'>"
strTableValue = strTableValue & "<font face='MS Sans Serif' size='3' color='blue'>*</font>Address</p>"
strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "<td colspan='3'>"
strTableValue = strTableValue & "<textarea readonly name='txtaddress' class='inputstyle' style='width: 358; height: 50'"
strTableValue = strTableValue & " rows='2' cols='20' tabindex='1'>"&Address&"</textarea></td>"
'strTableValue = strTableValue & "<td>"
'strTableValue = strTableValue & "<input name='txtaddress' size='16' class='inputstyle' value='"& Address &"' readonly "
'strTableValue = strTableValue & "style='width: 140; height: 19'>"
'strTableValue = strTableValue & "</td>"
strTableValue = strTableValue & "</tr>"

if FnFromModule <> "Dispatch" then
    strTableValue = strTableValue & "<tr>"
    strTableValue = strTableValue & "<td align='right' height='23px' class='bodytxt_black' >"
    strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>&nbsp;Engineer1"
    strTableValue = strTableValue & "</td>"
    strTableValue = strTableValue & "<td align='left'>"
    strTableValue = strTableValue & "<input name='txtCSE' readonly value='"& CSE &"' size='30' class='inputstyle' maxlength='30'>"
    strTableValue = strTableValue & "</td>"
    strTableValue = strTableValue & "<td align='right' class='bodytxt_black' >"
    strTableValue = strTableValue & "&nbsp;&nbsp;<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>&nbsp;Mobile No</td>"
    strTableValue = strTableValue & "<td  class='bodytxt_black' align='left'>"
    strTableValue = strTableValue & "<input name='txtCSEMobile' readonly value='"& Custodian1Mobile &"' size='30' class='inputstyle'"
    strTableValue = strTableValue & " maxlength='30'>"
    strTableValue = strTableValue & "</td>"
    strTableValue = strTableValue & "<td align='right' height='23px' class='bodytxt_black' >"
    strTableValue = strTableValue & "<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>&nbsp;Engineer2"
    strTableValue = strTableValue & "</td>"
    strTableValue = strTableValue & "<td class='bodytxt_black' align='left'>"
    strTableValue = strTableValue & "<input name='txtCSE2' readonly value='"& CSE2 &"' size='30' class='inputstyle' maxlength='30'>"
    strTableValue = strTableValue & "</td>"
    strTableValue = strTableValue & "<td align='right' class='bodytxt_black' >"
    strTableValue = strTableValue & "&nbsp;&nbsp;<font face='MS Sans Serif' color='#0000FF' size='3'>*</font>&nbsp;Mobile No</td>"
    strTableValue = strTableValue & "<td class='bodytxt_black' align='left'>"
    strTableValue = strTableValue & "<input name='txtCSEMobile2' readonly value='"& Custodian2Mobile &"' size='30' class='inputstyle'"
    strTableValue = strTableValue & " maxlength='30'>"
    strTableValue = strTableValue & "</td>"
    strTableValue = strTableValue & "</tr>"
else
    strTableValue = strTableValue & "<tr>"
    strTableValue = strTableValue & "<td colspan='4'></td>"
    strTableValue = strTableValue & "</tr>"
End if


strTableValue = strTableValue & "</table>"

response.Write strTableValue

end function
%>

