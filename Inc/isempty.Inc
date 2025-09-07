<script language = javascript >
function isempty(obj,name){
	if (obj.value==""){
	 alert(name + " Can't be Empty....")
	 obj.focus()	
	 return false
	}
	else{
	var n=obj.value.length	
	flg=false
		for(i=0;i<n;i++){
	  	if (obj.value.charCodeAt(i)==32)
	  		flg=true
	  	else{
	  		flg=false	
	  		break
	  	}	
		}
	if(flg){
	 alert(name + " Can't be Empty....")
	 obj.focus()	
	 return false 
	}	
	else
		return  true
		
	}	

}


function isempty2(obj,name)
{
	if (obj.value=="")
	{
		alert(name + " Can't be Empty....")
		//obj.focus()	
		return false
	}
	else
	{
		var n=obj.value.length
		flg=false
		for(i=0;i<n;i++)
		{
			if (obj.value.charCodeAt(i)==32)
				flg=true
			else
			{
				flg=false
				break
	  		}
		}
		if(flg)
		{
			alert(name + " Can't be Empty....")
			//obj.focus()	
			return false 
		}
		else
			return  true
	}	
}
 
</script>
