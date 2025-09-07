
<%
dim cn
set cn = Server.CreateObject("ADODB.Connection")
'set obj = Server.CreateObject("constr.connect")
dim cnStr
'cnStr = obj.connectionstr

'cnStr = "Provider=SQLOLEDB; Data Source=192.168.0.70; Initial Catalog=Productizationservice; User ID=UTCICRM; Password=UTC@2542016"
cnStr = "Provider=SQLOLEDB; Data Source=192.168.0.70; Initial Catalog=Schiller2024; User ID=sa; Password=Cogent@123"
set Session("cn") = Server.CreateObject("ADODB.Connection")
Session("cnStr") = cnStr
%>

