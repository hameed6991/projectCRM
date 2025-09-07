
<!--#include file = "CheckStringalert.asp"-->

<%


set rs1 = Server.CreateObject("Adodb.recordset")
sqlLogData = " Select Isnull(l_ServiceCode,'') as 'ServiceCode',Isnull(l_RegionCode,'') as 'RegionCode', "
sqlLogData = sqlLogData & " Isnull(l_LocationCode,'') as 'LocationCode',Isnull(l_Principal,'') as 'Principal', "
sqlLogData = sqlLogData & "  Isnull(l_ProductCategory,'') as 'ProductCategroy' "
sqlLogData = sqlLogData & ",isnull(l_Productline,'') as 'Productline',isnull(l_ProductSubCategory,'') as 'Product SubCategory' "
sqlLogData = sqlLogData & " From LoginDataAccess where l_UserName='" & UserName & "' order by id desc "


'''Added by Rajesh.S on Sept 29, 2015 for implementing Principal and Product Category wise Data Access.
strAccount = ""

rs1.open sqlLogData,cn
	if not rs1.eof then
		strServiceCode= rs1("ServiceCode")
		strRegionCode= rs1("RegionCode")
		strLocationCode= rs1("LocationCode")
		strPrincipalCode= rs1("Principal")
		strProductCategory= rs1("ProductCategroy")
        strProductline=rs1("Productline")
        strProductsubcategory=rs1("Product SubCategory")



	end if
rs1.close

%>