
<%
dim cninv
set cninv = Server.CreateObject("ADODB.Connection")
'set obj = Server.CreateObject("constr.connect")
dim cninvStr
'cnStr = obj.connectionstr


'cnStr = "Provider=SQLOLEDB; Data Source=localhost; Initial Catalog=Schiller; User ID=; Password="
cninvStr = "Provider=SQLOLEDB; Data Source=CRM\CRMServer; Initial Catalog=Schiller_Inventory; User ID=sa; Password=Admin123"



set Session("cninv") = Server.CreateObject("ADODB.Connection")
Session("cninvStr") = cninvStr
%>

