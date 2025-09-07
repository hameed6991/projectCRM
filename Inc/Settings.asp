<%
lBdClr = "#ffffff"
lBdFontClr = "#000000"
lBdTitFontClr = "#2D4E5E"
lBdTitFontSz = "3"
lBdTitFont = "Arial"
lGpInfoFontClr = "#2D4E5E"
lGpInfoFontSz = "2"
lGpInfoFont = "Arial"
lGpIcon = "<Font face='Webdings' color='#FB4700' size='2'>4</font>"
lRdOnlyClr = "#0000FF"
lMandClr = "#ff0000"
lTableHdClr = "#2D4E5E"
lTableHdFontClr = "#CFEBF9"
lTableBRClr="#cfcfcf"
lTableBdClr = "#BCD1D8"
lTableBdFontClr = "#000000"
lAlertHdClr = "Red"
lAlertHdFontClr = "Red"
lAlertBdClr = "Red"
lAlertBdFontClr = "Red"
lAlertBdFontSz = "2"
lAlertBdFont = "Ms Sans Serif"
lMenuBdClr = "#2D4E5E"
lMenuBdFontClr = "#CFEBF9"
lMenuBdFontSz = "2"
lMenuBdFont = "Arial"
lMenuIcon = "<font face='Webdings' color='#FB4700'>4</font>"
lMenuTitFontClr = "#CFEBF9"
lMenuTitFontSz = "2"
lMenuTitFont = "Arial"
lUserNameClr="#FFFF66"
Source1="Internal Error,unable to Fetch Data"
Source2="Invalid Use Of Null"
Source3="Internal Error,save was unsuccessful"
Source4="Internal Error,cannot show Graphical report"
Source5="Internal Error,cannot show Statistical report"


Sub Alert (Img,Msg,Fst,Lst,ActFile,ActTarget)

	If Instr(ActTarget,"|") <> 0 then

		lAdditionalMsg = Split(ActTarget,"*")
		Response.Write "<Div Align = 'Center'><Table CellSpacing = 0 Cellpadding = 0  Align = 'Center'><Tr bgcolor='#cfcfcf' ><Td Align = 'Center'><Img Src='../" & ImgColl(Img) & "' ></Td>"
		Response.Write "<Td Align = 'Left'><Font Face = 'Comic Sans Ms' Size = 2>" & Fst & MsgColl(Msg) & Lst 
		If ActFile <> "" Then
			Response.Write "<a Href = " & ActFile & " Target = " & Mid(ActTarget,1,Instr(ActTarget,"|")-1)  & " > Back </a>"
		End if
		For i = 0 to Ubound(lAdditionalMsg) 
			AlertInfo = Split(lAdditionalMsg(i),"|")
			Response.Write "<BR>"
			Response.Write AlertInfo(1) & AlertInfo(2)
			If AlertInfo(3) <> "" Then
				Response.Write "<a Href = " & AlertInfo(3) & " Target = " & AlertInfo(4) & "> Click here </a>"						
			End if
		Next 
		Response.write "</Font></Td></Tr></Table></Div>"	
	Else
		Response.Write "<Div Align = 'Center'><Table CellSpacing = 0 Cellpadding = 0  Align = 'Center'><Tr bgcolor='#cfcfcf'><Td Align = 'Center'><Img Src='images/" & ImgColl(Img) & "'></Td>"
		Response.Write "<Td Align = 'Left'><Font Face = 'Comic Sans Ms' Size = 2>" & Fst & MsgColl(Msg) & Lst 
		if lcase(ActFile)="javascript:window.close()" then
				Response.Write "<a Href = " & ActFile & " Target = " & ActTarget  & " > Close </a>"
			else
			if ActFile<>"" then
				Response.Write "<a Href = " & ActFile & " Target = " & ActTarget  & " > Back </a>"
			end if 	
		end if 
		Response.write "</Font></Td></Tr></Table></Div>"	
	End if
end sub

Function ImgColl(Img)
	Select Case Img
		Case 1 
			ImgColl = "../images/info.gif"
		Case 2
			ImgColl = "../images/save.gif"
		Case 3 
			ImgColl = "../images/save.gif"
		Case 4
			ImgColl = "../images/del.gif"
		Case 5 
			ImgColl = "../images/info.gif"
		Case 6
			ImgColl = "../images/info.gif"
		Case 7 
			ImgColl = "../images/info.gif"
		Case 8
			ImgColl = "../images/info.gif"
		Case 9 
			ImgColl = "../images/pageexpired.gif"
		Case 10
			ImgColl = "../images/info.gif"
		case 11	
			Imgcol1 = "../images/info.gif"
		case 12	
			Imgcol1 = "../images/common.gif"
		case 13	
			Imgcol1 = "../images/common.gif"
		Case 14
			Imgcol1 ="../images/common.gif"		
		Case 15
			ImgColl ="../images/common.gif"		
		Case 16 
			Imgcol1 = "../images/common.gif"
		Case 17
			Imgcol1 = "../images/common.gif"
		Case 18
			Imgcol1 = "../images/common.gif"

	end Select		
End Function

Function MsgColl(Msg)
	Select Case Msg
		Case 1 
			MsgColl = " Record Not found "
		Case 2
			MsgColl = " Saved Successfully ... "
		Case 3 
			MsgColl = " Updated Successfully ... "
		Case 4
			MsgColl = " Deleted Successfully ... "
		Case 5 
			MsgColl = " Page Expired. Please Log Again "
		Case 6
			MsgColl = " Select a "
		Case 7 
			MsgColl = " Record already Exists "
		Case 8 
			MsgColl = " not found against this "
		Case 9 
			MsgColl = " Page Expired. "
		Case 10 
			MsgColl = " not found "
		Case 11
			MsgColl = " Invalid Operation "
		Case 12 
			MsgColl = " Successfully Logged out. "
		Case 13 
			MsgColl = " Uploaded Successfully ... "	
		Case 14
			MsgColl =" Sharing Violation, Go Back and Click 'New' To Add "		
		Case 15
			MsgColl =" Cannot show satisfactory level "		
		Case 16 
			Msgcol1 = " User Key Not Present ..."
		Case 17
			Msgcol1 = " "
		Case 18
			Msgcol1 = "Search Type Settings Not Defined"
	End Select		
End Function
%>