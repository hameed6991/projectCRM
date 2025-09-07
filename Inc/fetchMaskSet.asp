<%

	dim rsMaskPat
	set rsMaskPat=Server.CreateObject("ADODB.RecordSet")
	rsMaskPat.Open "select distinct(conttype),MaskPat,len(MaskPat) as 'Maxset' from UserCnoMask Inner join Submaster on Submaster.subVal=UserCnoMask.ContType  order by UserCnoMask.ContType",cn

%>

<script>
var arrMaskPattern=new Array()
var FlgChk=false
<% 
i=0
do while not rsMaskPat.eof %>
	arrMaskPattern[<%=i%>]="<%=rsMaskPat("conttype")%>" + "||" +"<%=Replace(rsMaskPat("MaskPat"),"X","")%>" + "||" + "<%=rsMaskPat("Maxset")%>"
	
<%
	i=i+1
	rsMaskPat.moveNext
	loop
	rsMaskPat.close
	set rsMaskPat=nothing
	cn.close
%>



function getMaskPat(Ctype,obj){
	for(m=0;m<=arrMaskPattern.length-1;m++){
		arrtemp=arrMaskPattern[m].split("||")
		if(arrtemp[0]==Ctype)
		{
			obj.focus()
			obj.value=arrtemp[1]
			obj.focus()
			obj.maxLength=arrtemp[2]
			break
			
		}
		else
		{
			obj.value=""
			obj.focus()
			
		}	
	}
	
}


function setMaskPat(Ctype,obj){

if (!FlgChk) {
	var strtemp=obj.value
	var strVal=""
	for(m=0;m<=arrMaskPattern.length-1;m++){
		arrtemp=arrMaskPattern[m].split("||")
		if(arrtemp[0]==Ctype)
		{
			n=0			
			for(k=0;k<=strtemp.length-1;k++){
				if((arrtemp[1].charAt(n)=="-") && (strtemp.charAt(k)!="-"))
				{
					strVal = strVal + "-"  + strtemp.charAt(k)
					 n=n+2
				}	
				else{
						strVal = strVal + strtemp.charAt(k)
						n=n+1
					}
			}
			
			obj.value=strVal.substr(0,parseInt(arrtemp[2]))
			break
			
		}
		
	}
}
FlgChk=true	
}

</script>