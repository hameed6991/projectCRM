<script language = javascript >
function hdnempty(obj1,obj2,name){

	if (obj1.value==""){
	 alert(name + " Not Selected!.Use Help....")
	 obj2.focus()	
	 return false
	}
	else{
	var n=obj1.value.length	
	flg=false
		for(i=0;i<n;i++){
	  	if (obj1.value.charCodeAt(i)==32)
	  		flg=true
	  	else{
	  		flg=false	
	  		break
	  	}	
		}
	if(flg){
	 alert(name + " Not Selected!.Use Help....")
	 obj2.focus()	
	 return false 
	}	
	else
		return  true
		
	}	

}
 
</script>
