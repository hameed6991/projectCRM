<script language = "vbscript" runat = "server" >
function NextID(mykey)
lsval = right(mykey,1)
lboollastkey = false
if lsval = "Z" then
   lboollastkey = true
   lsval = "0"
elseif lsval >= "A" then
		lsval = chr(asc(lsval ) +1)
    elseif lsval = "9" then
			lsval = "A"
 	elseif lsval < "9" then
			lsval = cstr(cint(lsval) +1)
	end if 
if lboollastkey then
   if left(mykey,1) <> "Z" then
		NextID = chr(asc(left(mykey,1)) +1) & lsval
		exit function
   else
		NextId = ""
		exit function
   end if
else
	NextID = left(mykey,1) & lsval
	exit function
end if 
end function	
</script>