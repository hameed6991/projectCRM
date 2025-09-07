<%@Language="VBScript"%>
<%Option Explicit%>
<%Response.Buffer = True%>
<html>

<head>

</head>

<body>


<%

dim clientfile 
clientfile = Request.querystring("clientfile")
'response.write(Request.querystring("file"))
'response.end
On Error Resume Next
Dim strPath
strPath = CStr(Request.querystring("file"))
'-- do some basic error checking for the form
If strPath = "" Then
	Response.Clear
	Response.Write("No file specified.")
	Response.End
ElseIf InStr(strPath, "..") > 0 Then
	Response.Clear
	Response.Write("Illegal folder location.")
	Response.End
ElseIf Len(strPath) > 1024 Then
	Response.Clear
	Response.Write("Folder path too long.")
	Response.End
Else
	Call DownloadFile(strPath)
End If

Private Sub DownloadFile(file)
	'--declare variables
	Dim strAbsFile
	Dim strFileExtension
	Dim objFSO
	Dim objFile
	Dim objStream
	'-- set absolute file location

	strAbsFile = Server.MapPath(file)
	'-- create FSO object to check if file exists and get properties
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	'-- check to see if the file exists
	
	'response.write(strAbsFile)
	'response.end
	If objFSO.FileExists(strAbsFile) Then
		Set objFile = objFSO.GetFile(strAbsFile)
		'-- first clear the response, and then set the appropriate headers
		Response.Clear
		'-- the filename you give it will be the one that is shown
		' to the users by default when they save
			

 	

		'Response.AddHeader "Content-Disposition", "attachment; filename=" & objFile.Name
		Response.AddHeader "Content-Disposition","attachment; filename=" & clientfile 
		'//// Commented this Line because it is not working properly in X64 OS 
		'Response.AddHeader "Content-Length", objFile.Size
		Response.ContentType = "application/octet-stream"


		Set objStream = Server.CreateObject("ADODB.Stream")
		
			'response.write	"tess mee.." + cstr(objFile.Size)
	        'response.end

		objStream.Open
		'-- set as binary
		objStream.Type = 1
		Response.CharSet = "UTF-8"
		'-- load into the stream the file
		objStream.LoadFromFile(strAbsFile)
		'-- send the stream in the response
		Response.BinaryWrite(objStream.Read)
		objStream.Close
		Set objStream = Nothing
		Set objFile = Nothing
	Else 'objFSO.FileExists(strAbsFile)
		Response.Clear
		Response.Write("No such file exists.")
	End If
	Set objFSO = Nothing
End Sub
%>

</body>

</html>
