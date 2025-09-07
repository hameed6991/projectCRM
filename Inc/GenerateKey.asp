<Script Language="VbScript" runat=server>
Function GenKey(FldName,PatternSize)
Dim rsKeyGen
Dim lKey
Set rsKeyGen = Server.CreateObject("ADODB.Recordset")
rsKeyGen.Open "Select " & FldName & " From KeyGeneration ",cn,1,2	
If rsKeyGen.eof Then
	Response.write "<Font Face = 'Ms Sans Serif' Color = 'Navy' Size = '2'>Cannot generate key, Contact Vendor</font>"	
	Response.end
End if
lKey = rsKeyGen(0)
rsKeyGen(0) = CCur(rsKeyGen(0)) + 1
lKey  = Right(String(PatternSize,"0") + Cstr(lKey),PatternSize) 
rsKeyGen.Update
rsKeyGen.Close
Set rsKeyGen = Nothing
GenKey = lKey
End Function


Function GenKey1(FldName,PatternSize)
Dim rsKeyGen
Dim lKey
Set rsKeyGen = Server.CreateObject("ADODB.Recordset")
rsKeyGen.Open "Select " & FldName & " From KeyGeneration ",cn
If rsKeyGen.eof Then
	Response.write "<Font Face = 'Ms Sans Serif' Color = 'Navy' Size = '2'>Cannot generate key, Contact Vendor</font>"	
	Response.end
End if
lKey = rsKeyGen(0)
lKey  = Right(String(PatternSize,"0") + Cstr(lKey),PatternSize) 
rsKeyGen.Close
Set rsKeyGen = Nothing
GenKey1 = lKey
End Function

</Script>