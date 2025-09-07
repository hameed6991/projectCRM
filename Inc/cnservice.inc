
<%
dim cn1
set cn1 = Server.CreateObject("ADODB.Connection")
'set obj = Server.CreateObject("constr.connect")
dim cnStr1
'cnStr = obj.connectionstr

'cnStr = "Provider=SQLOLEDB; Data Source=192.168.0.170; Initial Catalog=Productizationservice; User ID=UTCICRM; Password=UTC@2542016"
cnStr1 = "Provider=SQLOLEDB; Data Source=192.168.1.5; Initial Catalog=Spincoservicenew; User ID=SpincoServicenewsep; Password=SpincoServicenewsep"
set Session("cn1") = Server.CreateObject("ADODB.Connection")
Session("cnStr1") = cnStr1
%>

