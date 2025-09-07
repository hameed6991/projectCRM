<Script Language="VbScript" runat=server>

function zone_Now()
    od = now() 
    set oShell = CreateObject("WScript.Shell") 
    atb = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\" &_ 
        "Control\TimeZoneInformation\ActiveTimeBias" 
    offsetMin = oShell.RegRead(atb) 
    nd = dateadd("n", offsetMin, od)
    
   dim Diffmins 
   Dim rsCountryDate
   
    Set rsCountryDate= Server.CreateObject("ADODB.Recordset")
    rsCountryDate.Open "Select isnull(subval,0) from submaster where [key]='CountryUTCDiffMins'",cn,1,1

	if(not rsCountryDate.EOF ) then
	     Diffmins= rsCountryDate(0) 
    end if
	rsCountryDate.Close
    Set rsCountryDate= Nothing

   ' //offsetmin =120   '// Cust Country time is GMT +2:00 hrs.
    offsetmin =Diffmins  
    nd = dateadd("n", offsetMin, nd)
    zone_now= nd	
end function

</Script>