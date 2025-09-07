<Script Language="VbScript" runat=server>
Function UpdateGenKey(FldName,KeyValue)
Dim rsKeyGen
Dim lKey
Set rsKeyGen = Server.CreateObject("ADODB.Recordset")
rsKeyGen.Open "Select " & FldName & " From KeyGeneration ",cn,1,2	
If rsKeyGen.eof Then
	Response.write "<Font Face = 'Ms Sans Serif' Color = 'Navy' Size = '2'>Cannot Update key, Contact Vendor</font>"	
	Response.end
End if
lKey  = Right(KeyValue,len(KeyValue)-instrrev(KeyValue,"-"))

rsKeyGen(0) = CCur(lKey) + 1

rsKeyGen.Update
rsKeyGen.Close
Set rsKeyGen = Nothing

End Function


</Script>