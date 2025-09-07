<script language = javascript >
function isnumber(obj,name){
	if (obj.value!=""){
		if (isNaN(obj.value))
		{
			 alert (" Enter valid Amount....")	
			obj.value=""
			obj.focus()	
 			return false;	
        	}
	}
if (obj.value==""){
		
			
			obj.value=0
	}
       else{
		var n=obj.value.length	
		for(i=0;i<n;i++){
	  	if (obj.value.charCodeAt(i)==32)
	  		obj.value=0
			
		}
	}

return  true
		
		

}
 
</script>
