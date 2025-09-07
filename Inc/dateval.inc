<script language="javascript">
function dateVal()
{

	if(document.all.txtFrom.value!="")
	{
	
	mm=document.all.txtFrom.value.split("/")
	document.all.d1.value=mm[0]
	document.all.y1.value=mm[2]
	Mn=mm[1]
		if (Mn.length==1)
		{
		Mn="0"+Mn
		}
		obj1=document.all.m1
	
	NtoM(Mn,obj1)
	}		
	else
	{
	document.all.d1.value="DD"
	document.all.y1.value="Year"
	document.all.m1.value="Month"
	}			

		
	if(document.all.txtTo.value!="")
	{
	
	mm=document.all.txtTo.value.split("/")
	document.all.d2.value=mm[0]
	document.all.y2.value=mm[2]
	Mn=mm[1]
		if (Mn.length==1)
		{
		Mn="0"+Mn
		}
		obj2=document.all.m2
	NtoM(Mn,obj2)
   }
	else
	{
	document.all.d2.value="DD"
	document.all.y2.value="Year"
	document.all.m2.value="Month"
	}			
}


function NtoM(Mn,obj){

		switch(Mn)
			{
			case "01":  
			   	{  
				obj.value="January";
				break;
				}      
			case "02":  
				{  
				obj.value="February"; 
				break;
				}        
			case "03":   
				{ 
				obj.value="March";  
				break;
				}    
			case "04":
				{
				obj.value="April";   
				break;
				} 
			case "05": 
				{   
				obj.value="May"; 
				break;
				}     
			case "06":
				{    
				obj.value="June";  
				break;
				}    
			case "07": 
				{  
				obj.value="July"; 
				break;
				}    
			case "08":
			   
				obj.value="August";
				break;	
				
			case "09":
				{
				obj.value="September";  
				 break;  
				 } 
			case "10": 
				{
				obj.value="October";
				break;
				}
			case "11": 
				{   
				obj.value="November"; 
				break;
				}     
			case "12":
				{    
				 obj.value="December"; 
				 break;
				 }     
			}     

}

</script>
