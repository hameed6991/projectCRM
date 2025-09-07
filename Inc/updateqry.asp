<%
function UPdateQry(site,code,hdnsite)
cn.execute("update AccAddress set Site='" & site & "' Where AccCode = '" & Code & "' and SiteCode='" & hdnSite & "'")
cn.execute("update Accmast set Site='" & site & "' Where AccCode = '" & Code & "' and SiteCode ='" & hdnSite & "'")
end function
%>
