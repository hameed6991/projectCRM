<%
Dim SearchScr
Function SearchQuery(SelectList,SearchScreenTable,UserType)
						'/////////////Constructing Query
SearchScr = SearchScreenTable
Dim rsSearchQry
Set rsSearchQry = Server.CreateObject("ADODB.Recordset")
Dim rsMapped
Set rsMapped = Server.CreateObject("ADODB.Recordset")
Dim TableList()
Redim TableList(0)
Cnt = 0
TblFlag = "True"
For i = Lbound(SelectList) to Ubound(SelectList)
	TblFlag = "True"
	If Instr(SelectList(i),"|") <> 0  Then
		strChkTable =  Mid(SelectList(i),1,Instr(SelectList(i),"|"))
		strChkTable =  Trim(Mid(SelectList(i),1,Len(strChkTable)+ Instr(Mid(SelectList(i),Len(strChkTable)+1),".")-1))
	Else
		strChkTable =  Trim(Mid(SelectList(i),1,Instr(SelectList(i),".")-1))
	End if	
	If lcase(strChkTable) <> SearchScreenTable Then
		For J = LBound(TableList) To UBound(TableList)
			If lCase(TableList(j)) = lCase(strChkTable) Then
				TblFlag = "False"
				Exit For
			End If
		Next
		If 	TblFlag = "True" Then
			TableList(Cnt) = strChkTable
			Cnt = Cnt + 1
			ReDim Preserve TableList(Cnt)
		End if
	End If
Next
lstrTables = ""
'Response.write TableList(0) & "," & TableList(1) & "," 
'Response.end
For i = Lbound(TableList) to Ubound(TableList)
	If Instr(TableList(i),"|") <> 0 Then
		ChkScreenTable =  Lcase(Mid(TableList(i),1,Instr(TableList(i),"|")-1))
	Else
		ChkScreenTable =  Lcase(TableList(i))
	End if
	If ChkScreenTable <> LCase(SearchScreenTable) Then
		If Instr(TableList(i),"|") <> 0 Then
			rsSearchQry.Open "Select SearchSettings.*,SearchSetDetails.DefaultDisplay From SearchSettings Inner Join SearchSetDetails On SearchSettings.SearchScreenTable = SearchSetDetails.SearchScreenTable and SearchSettings.FldName = SearchSetDetails.FldName Where SearchSettings.SearchScreenTable = '" & SearchScreenTable & "' and SearchSetDetails.UserType = '" & UserType & "' and SearchSettings.TypeOfJoin Is Not Null and SearchSettings.TypeOfJoin <> '' and SearchSettings.TypeOfJoin <> 'SubQuery' and SearchSettings.FldOwner + '.' + SearchSettings.FldName  = '" & Mid(TableList(i),1,Instr(TableList(i),"|")-1) & "' ",cn,1,3
		Else
			rsSearchQry.Open "Select SearchSettings.*,SearchSetDetails.DefaultDisplay From SearchSettings Inner Join SearchSetDetails On SearchSettings.SearchScreenTable = SearchSetDetails.SearchScreenTable and SearchSettings.FldName = SearchSetDetails.FldName Where SearchSettings.SearchScreenTable = '" & SearchScreenTable & "' and SearchSetDetails.UserType = '" & UserType & "' and SearchSettings.TypeOfJoin Is Not Null and SearchSettings.TypeOfJoin <> ''  and SearchSettings.TypeOfJoin <> 'SubQuery' and SearchSettings.FldOwner = '" & TableList(i) & "' ",cn,1,3
		End if
		If Not rsSearchQry.Eof Then
			If rsSearchQry("Mapped") = True Then 
		   		rsMapped.Open "Select AllocateTo From AllMap Where UserType = '" & Trim(rsSearchQry("MapFld")) & "'",cn,1,3
			   if not rsMapped.EOF then
					lAllocateTo = rsMapped("AllocateTo")
				   If lCase(Left(Trim(rsSearchQry("JoinCondition")),2)) = "as" Then
					   lstrTables = lstrTables & rsSearchQry("TypeOfJoin") & " " & lAllocateTo & "Mast " & rsSearchQry("JoinCondition") & Mid(rsSearchQry("JoinCondition"),Instr(rsSearchQry("JoinCondition"),"["),Instr(rsSearchQry("JoinCondition"),"]")-Instr(rsSearchQry("JoinCondition"),"[")+1) & "." & lAllocateTo & "Code ) "
				   Else
					   lstrTables = lstrTables & rsSearchQry("TypeOfJoin") & " " & lAllocateTo & "Mast " & rsSearchQry("JoinCondition") & lAllocateTo & "Mast." & lAllocateTo & "Code ) "
				   End if
		   			MyBrackets = MyBrackets  & "("
			   end if
			   rsMapped.Close	
			Else
			   lstrTables = lstrTables & rsSearchQry("TypeOfJoin") & " " & rsSearchQry("JoinCondition") & " ) "
	   			MyBrackets = MyBrackets  & "("			   
			End if	
		End if
		rsSearchQry.Close
	End if
Next 	
SearchQuery = " From " & MyBrackets & SearchScreenTable & " " & lStrTables
'/////////////'End of Constructing Query
End Function



Function WhereClause(FieldValue,StartWith)
	Dim rsSubQry
	Set rsSubQry = Server.CreateObject("ADODB.Recordset")
	StrCond = ""
	SubQryBracket	= ""
	strTableFld = ""
	If Instr(FieldValue,"|") <> 0 Then
		StrCond = " and " & Mid(FieldValue,Instr(FieldValue,"|")+1) 
		strTableFld = Mid(FieldValue,Instr(FieldValue,":")+1,Instr(FieldValue,"|")-Instr(FieldValue,":")-1)
	Else
		StrCond = " and " & Mid(FieldValue,Instr(FieldValue,":")+1)
		strTableFld = Mid(FieldValue,Instr(FieldValue,":")+1)
	End if
	rsSubQry.Open "Select JoinCondition From SearchSettings Where TypeOfJoin = 'SubQuery' and SearchScreenTable = '" & SearchScr & "' and RTrim(FldOwner) + '.' + RTrim(FldName) = '" & strTableFld & "' ",cn,1,3
	If Not rsSubQry.eof Then
		StrCond = " and " & rsSubQry("JoinCondition")
		SubQryBracket	 = ")"
	End if
	DataTyp = Lcase(Mid(FieldValue,1,Instr(FieldValue,":")-1))
	If DataTyp = "char" Or DataTyp = "varchar" Then
		WhereClause  = StrCond  & " like '" & StartWith & "%' " & SubQryBracket
	Elseif DataTyp = "datetime" Then
		If Isdate(StartWith) = true Then
			WhereClause  = StrCond & " = '" & Trim(fmtdate(StartWith)) & "' " & SubQryBracket
		Else
			Alert "17","17","Invalid "," Date ","javascript:window.history.back()",""
			Response.end 
'			WhereClause  = StrCond & " = 'January 1,1976'"
		End if
	Elseif DataTyp = "numeric" or DataTyp = "int" or DataTyp = "money" or DataTyp = "smallmoney" then
		If IsNumeric(StartWith) = true Then
			WhereClause = StrCond & " = "	& StartWith & SubQryBracket
		Else
			Alert "17","17","Invalid "," Value ","javascript:window.history.back()",""
			Response.end 
		End if	
	Elseif DataTyp = "bit" Then
		If Lcase(StartWith) = "true" Then
			WhereClause  = StrCond & " =1 " & SubQryBracket
		Elseif Lcase(StartWith) = "false" Then
			WhereClause  = StrCond & " =0 " & SubQryBracket
		Elseif Lcase(StartWith) = "yes" Then
			WhereClause  = StrCond & " =1 " & SubQryBracket
		Elseif Lcase(StartWith) = "no" Then
			WhereClause  = StrCond & " =0 " & SubQryBracket
		Elseif Lcase(StartWith) = "on" Then
			WhereClause  = StrCond & " =1 " & SubQryBracket
		Elseif Lcase(StartWith) = "off" Then
			WhereClause  = StrCond & " =0 " & SubQryBracket
		Elseif StartWith = "1" Then
			WhereClause  = StrCond & " = 1" & SubQryBracket
		Elseif StartWith = "0" Then
			WhereClause  = StrCond & " = 0" & SubQryBracket
		else
			Alert "17","17","Invalid Value ","","javascript:window.history.back()",""
			Response.end 
'			WhereClause  = StrCond & " = 1 "
		end if
	Else
		WhereClause = StrCond & " like '" & StartWith & "%' "	& SubQryBracket
	End if
End Function

Function SearchQuery1(FavID,SelectList,SearchScreenTable,UserType)
		'/////////////Constructing Query
lAddSelectLst = ""
Dim lFavourTables
SearchScr = SearchScreenTable
Dim rsMapped
Set rsMapped = Server.CreateObject("ADODB.Recordset")
If Cint(FavID) > 15 Then
Dim rsFavour
Set rsFavour = Server.CreateObject("ADODB.Recordset")
rsFavour.Open "Select * from Favourites Where FavId = '"& FavID &"' and SearchScreenTable = '" & SearchScreenTable & "' and UserType = '" & UserType & "' and TypeOfJoin Is Not Null and TypeOfJoin <> ''",cn,1,3
If Not rsFavour.eof Then
	If rsFavour("Mapped") = True Then 
		lAddSelectLst = "T"
		If Instr(rsFavour("MapFld"),"|") <> 0 Then
				MapFldSplit = Split(rsFavour("MapFld"),"|")
				FldOwnerSplit = Split(rsFavour("FldOwner"),"|")
				JoinConditionSplit = Split(rsFavour("JoinCondition"),"|")
				For i = LBound(FldOwnerSplit) To UBound(FldOwnerSplit)
			   		If Lcase(FldOwnerSplit(i)) <> "subquery" Then
				   		If MapFldSplit(i) = "" Then
							Redim Preserve SelectList(Ubound(SelectList)+1)
							SelectList(Ubound(SelectList)) = FldOwnerSplit(i) & "."
			   			Else
				   			rsMapped.Open "Select AllocateTo From AllMap Where UserType = '" & Trim(MapFldSplit(i)) & "'",cn,1,3
						   if not rsMapped.EOF then
		   						lAllocateTo = rsMapped("AllocateTo")
								Redim Preserve SelectList(Ubound(SelectList)+1)
						   		If lCase(Left(Trim(JoinConditionSplit(i)),2)) = "as" Then
							   		SelectList(Ubound(SelectList)) = FldOwnerSplit(i) & "." & rsMapped("AllocateTo") & "Name"	
							   Else
									SelectList(Ubound(SelectList)) = rsMapped("AllocateTo") & "Mast." & rsMapped("AllocateTo") & "Name"	
							   End if		
							End if	
							rsMapped.Close	
						End if
					End if
				Next
		Else
			If Lcase(rsFavour("FldOwner")) <> "subquery" Then
				If lCase(Left(Trim(rsFavour("JoinCondition")),2)) = "as" Then
					Redim Preserve SelectList(Ubound(SelectList)+1)
					SelectList(Ubound(SelectList)) = rsFavour("FldOwner") & "."
				Else
			   		rsMapped.Open "Select AllocateTo From AllMap Where UserType = '" & Trim(rsFavour("MapFld")) & "'",cn,1,3
				   if not rsMapped.EOF then
   						lAllocateTo = rsMapped("AllocateTo")
						Redim Preserve SelectList(Ubound(SelectList)+1)
						SelectList(Ubound(SelectList)) = rsMapped("AllocateTo") & "Mast." & rsMapped("AllocateTo") & "Name"	
					End if	
					rsMapped.Close	
				End if
			End if
		End if
	Else
		If Instr(rsFavour("FldOwner"),"|") <> 0 Then
			FldOwnerSplit = Split(rsFavour("FldOwner"),"|")
			For  i = LBound(FldOwnerSplit) To UBound(FldOwnerSplit)
				If Lcase(FldOwnerSplit(i)) <> "subquery" Then
					Redim Preserve SelectList(Ubound(SelectList)+1)
					SelectList(Ubound(SelectList)) = FldOwnerSplit(i) & "."
					lAddSelectLst = "T"
				End if
			Next
		Else
			If Lcase(rsFavour("FldOwner")) <> "subquery" Then
				lAddSelectLst = "T"
				Redim Preserve SelectList(Ubound(SelectList)+1)
				SelectList(Ubound(SelectList)) = rsFavour("FldOwner") & "." 
			End if	
		End if
	End if	
End if
End If
Dim rsSearchQry
Set rsSearchQry = Server.CreateObject("ADODB.Recordset")
Dim TableList()
Redim TableList(0)
Cnt = 0
TblFlag = "True"
For i = Lbound(SelectList) to Ubound(SelectList)
	TblFlag = "True"
	If Instr(SelectList(i),"|") <> 0  Then
		strChkTable =  Mid(SelectList(i),1,Instr(SelectList(i),"|"))
		strChkTable =  Trim(Mid(SelectList(i),1,Len(strChkTable)+ Instr(Mid(SelectList(i),Len(strChkTable)+1),".")-1))
	Else
		strChkTable =  Trim(Mid(SelectList(i),1,Instr(SelectList(i),".")-1))
	End if	
	If lcase(strChkTable) <> SearchScreenTable Then
		For J = LBound(TableList) To UBound(TableList)
			If lCase(TableList(j)) = lCase(strChkTable) Then
				TblFlag = "False"
				Exit For
			End If
		Next
		If 	TblFlag = "True" Then
			TableList(Cnt) = strChkTable
			Cnt = Cnt + 1
			ReDim Preserve TableList(Cnt)
		End if
	End If
Next
lstrTables = ""



For i = Lbound(TableList) to Ubound(TableList)
	If Instr(TableList(i),"|") <> 0 Then
		ChkScreenTable =  Lcase(Mid(TableList(i),1,Instr(TableList(i),"|")-1))
	Else
		ChkScreenTable =  Lcase(TableList(i))
	End if
	If ChkScreenTable <> LCase(SearchScreenTable) Then
		If Instr(TableList(i),"|") <> 0 Then
			rsSearchQry.Open "Select SearchSettings.*,SearchSetDetails.DefaultDisplay From SearchSettings Inner Join SearchSetDetails On SearchSettings.SearchScreenTable = SearchSetDetails.SearchScreenTable and SearchSettings.FldName = SearchSetDetails.FldName Where SearchSettings.SearchScreenTable = '" & SearchScreenTable & "' and SearchSetDetails.UserType = '" & UserType & "' and SearchSettings.TypeOfJoin Is Not Null and SearchSettings.TypeOfJoin <> '' and SearchSettings.TypeOfJoin <> 'SubQuery' and SearchSettings.FldOwner + '.' + SearchSettings.FldName  = '" & Mid(TableList(i),1,Instr(TableList(i),"|")-1) & "' ",cn,1,3
		Else
			rsSearchQry.Open "Select SearchSettings.*,SearchSetDetails.DefaultDisplay From SearchSettings Inner Join SearchSetDetails On SearchSettings.SearchScreenTable = SearchSetDetails.SearchScreenTable and SearchSettings.FldName = SearchSetDetails.FldName Where SearchSettings.SearchScreenTable = '" & SearchScreenTable & "' and SearchSetDetails.UserType = '" & UserType & "' and SearchSettings.TypeOfJoin Is Not Null and SearchSettings.TypeOfJoin <> ''  and SearchSettings.TypeOfJoin <> 'SubQuery' and SearchSettings.FldOwner = '" & TableList(i) & "' ",cn,1,3
		End if
		If Not rsSearchQry.Eof Then
			If rsSearchQry("Mapped") = True Then 
		   		rsMapped.Open "Select AllocateTo From AllMap Where UserType = '" & Trim(rsSearchQry("MapFld")) & "'",cn,1,3
			   if not rsMapped.EOF then
					lAllocateTo = rsMapped("AllocateTo")
				   If lCase(Left(Trim(rsSearchQry("JoinCondition")),2)) = "as" Then
					   lstrTables = lstrTables & rsSearchQry("TypeOfJoin") & " " & lAllocateTo & "Mast " & rsSearchQry("JoinCondition") & Mid(rsSearchQry("JoinCondition"),Instr(rsSearchQry("JoinCondition"),"["),Instr(rsSearchQry("JoinCondition"),"]")-Instr(rsSearchQry("JoinCondition"),"[")+1) & "." & lAllocateTo & "Code ) "
				   Else
					   lstrTables = lstrTables & rsSearchQry("TypeOfJoin") & " " & lAllocateTo & "Mast " & rsSearchQry("JoinCondition") & lAllocateTo & "Mast." & lAllocateTo & "Code ) "
				   End if
		   			MyBrackets = MyBrackets  & "("
			   end if
			   rsMapped.Close	
			Else
			   lstrTables = lstrTables & rsSearchQry("TypeOfJoin") & " " & rsSearchQry("JoinCondition") & " ) "
	   			MyBrackets = MyBrackets  & "("			   
			End if	
		Else
				''''Previous code taken down
		End if
		rsSearchQry.Close
	End if
Next 	

If Cint(FavID) > 15 Then
If lAddSelectLst = "T" Then
	If rsFavour("Mapped") = True Then
		If InStr(rsFavour("MapFld"),"|") <> 0 Then
			MapFldSplit = Split(rsFavour("MapFld"),"|")
     		TypeOfJoinSplit = Split(rsFavour("TypeOfJoin"),"|")
			JoinConditionSplit = Split(rsFavour("JoinCondition"),"|")
			FldOwnerSplit = Split(rsFavour("FldOwner"),"|")
			For i = lBound(MapFldSplit) To UBound(MapFldSplit)
				If 	Lcase(FldOwnerSplit(i)) <> "subquery" Then		
					If MapFldSplit(i)	 = "" Then
						lstrTables = lstrTables & TypeOfJoinSplit(i) & " " & JoinConditionSplit(i) & " ) "
						MyBrackets = MyBrackets  & "("			   
					Else
						rsMapped.Open "Select AllocateTo From AllMap Where UserType = '" & Trim(MapFldSplit(i)) & "'",cn,1,3
						if not rsMapped.EOF then
							lAllocateTo = rsMapped("AllocateTo")
							If lCase(Left(Trim(JoinConditionSplit(i)),2)) = "as" Then
							   lstrTables = lstrTables & TypeOfJoinSplit(i) & " " & lAllocateTo & "Mast " & JoinConditionSplit(i) & FldOwnerSplit(i) & "." & lAllocateTo & "Code ) "
							Else
								lstrTables = lstrTables & TypeOfJoinSplit(i) & " " & lAllocateTo & "Mast " & JoinConditionSplit(i) & lAllocateTo & "Mast." & lAllocateTo & "Code ) "
							End if   
							MyBrackets = MyBrackets  & "("			   
						End if
						rsMapped.Close	
					End if
				End if
			Next
		Else
			If 	Lcase(rsFavour("FldOwner")) <> "subquery" Then
				rsMapped.Open "Select AllocateTo From AllMap Where UserType = '" & Trim(rsFavour("MapFld")) & "'",cn,1,3
				if not rsMapped.EOF then
					lAllocateTo = rsMapped("AllocateTo")
					If lCase(Left(Trim(rsFavour("JoinCondition")),2)) = "as" Then
						lstrTables = lstrTables & rsFavour("TypeOfJoin") & " " & lAllocateTo & "Mast " & rsFavour("JoinCondition") & rsFavour("FldOwner") & "." & lAllocateTo & "Code ) "
						MyBrackets = MyBrackets  & "("			   
					Else
					   lstrTables = lstrTables & rsFavour("TypeOfJoin") & " " & lAllocateTo & "Mast " & rsFavour("JoinCondition") & lAllocateTo & "Mast." & lAllocateTo & "Code ) "
						MyBrackets = MyBrackets  & "("			   
					End if	
				End if	
				rsMapped.Close
			End if	
		End if
	Else
		If InStr(rsFavour("TypeOfJoin"),"|") <> 0 Then
     		TypeOfJoinSplit = Split(rsFavour("TypeOfJoin"),"|")
			JoinConditionSplit = Split(rsFavour("JoinCondition"),"|")
			FldOwnerSplit = Split(rsFavour("FldOwner"),"|")
			For i = lBound(TypeOfJoinSplit) To UBound(TypeOfJoinSplit)
				If 	Lcase(FldOwnerSplit(i)) <> "subquery" Then
					lstrTables = lstrTables & TypeOfJoinSplit(i) & " " & JoinConditionSplit(i) & " ) "
					MyBrackets = MyBrackets  & "("			   
				End if
			Next
		Else
			If 	Lcase(rsFavour("FldOwner")) <> "subquery" Then
				lstrTables = lstrTables & rsFavour("TypeOfJoin") & " " & rsFavour("JoinCondition") & " ) "
				MyBrackets = MyBrackets  & "("			   
			End if	
		End if
	End if
lAddSelectLst = "F"
End if
END IF

'Response.write " From " & MyBrackets & SearchScreenTable & " " & lStrTables
'Response.end
SearchQuery1 = " From " & MyBrackets & SearchScreenTable & " " & lStrTables
'/////////////'End of Constructing Query
End Function

Function FavourWhereClause(FavID,UserType)
	If FavID = "None" Or Cint(FavID) <= 15 Then
		FavourWhereClause = ""
		Exit Function
	End if
	UserType = "Default"
	StrFavourCond = ""
	Dim rsMapped
	Set rsMapped = Server.CreateObject("ADODB.Recordset")
	Dim rsFavour
	Set rsFavour = Server.CreateObject("ADODB.Recordset")
	rsFavour.Open "Select * from Favourites Where FavID = "& FavID &" and UserType = '" & UserType & "' ",cn,1,3
	If Not rsFavour.Eof Then
		If rsFavour("Mapped") = True Then
   			If Instr(rsFavour("FldOwner"),"|") <> 0 Then
				MapFldSplit = Split(rsFavour("MapFld"),"|")
				FldOwnerSplit = Split(rsFavour("FldOwner"),"|")
				ConditionValuesSplit = Split(rsFavour("ConditionValues"),"|")
				JoinConditionSplit = Split(rsFavour("JoinCondition"),"|")
				CondOperatorSplit = Split(rsFavour("CondOperator"),"|")
				For i = lBound(FldOwnerSplit) To UBound(FldOwnerSplit)
					If MapFldSplit(i)	 <> ""  Then
							rsMapped.Open "Select AllocateTo From AllMap Where UserType = '" & Trim(MapFldSplit(i)) & "'",cn,1,3
							If Not rsMapped.Eof Then
								If  ConditionValuesSplit(i) <> "" Then
									If lCase(Left(Trim(JoinConditionSplit(i)),2)) = "as" Then
										StrFavourCond  = StrFavourCond & " " & CondOperatorSplit(i) & " " & FldOwnerSplit(i) & "." & rsMapped("AllocateTo") & "Name"  & " " & ConditionValuesSplit(i)
									Else
										StrFavourCond  = StrFavourCond & " " & CondOperatorSplit(i) & " " & rsMapped("AllocateTo") & "Mast." & rsMapped("AllocateTo") & "Name" & " " & ConditionValuesSplit(i)
									End if
								End if
							End if
							rsMapped.Close
					Else
						If  ConditionValuesSplit(i) <> "" Then
							StrFavourCond  = StrFavourCond & ConditionValuesSplit(i)
						End if	
					End if	
				Next
				If StrFavourCond <> "" Then
					StrFavourCond = " and " & StrFavourCond
				End if
   			Else
					rsMapped.Open "Select AllocateTo From AllMap Where UserType = '" & Trim(rsFavour("MapFld")) & "'",cn,1,3
			   		if not rsMapped.EOF then
				   		If rsFavour("ConditionValues") <> "" Then
							If lCase(Left(Trim(rsFavour("JoinCondition")),2)) = "as" Then
								StrFavourCond  = " and " & rsFavour("FieldOwner") & "." & rsMapped("AllocateTo") & "Name" & rsFavour("ConditionValues")
							Else
								StrFavourCond  = " and " & rsMapped("AllocateTo") & "Mast." & rsMapped("AllocateTo") & "Name" & rsFavour("ConditionValues")
							End if
						End if	
					End if	
					rsMapped.Close	
			End if
		Else
			If rsFavour("ConditionValues") <> "" Then
				StrFavourCond  = " and " & rsFavour("ConditionValues")
			End if
		End if
		
	End if
	FavourWhereClause = StrFavourCond
End Function


%>