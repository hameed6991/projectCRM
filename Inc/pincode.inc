<script language=javascript>
function pincode1(ww,val)
{ 
   var s1,ss; 
   ss=ww.value 
   
 if (ss=="")
    return true;
 else  
  {
    if (isNaN(ss)==false)
     {
      if (ss.length==6)
         return true 
       else
          {
           alert("  Not a Valid Pincode \n Pincode must be 6 digits.... ");
           //for the Purpose of Multiple Address Screen
           if (val==1)
			   ShowCur(k,0)
		   // end of it	   
           ww.focus()
           return false;
          }
      } 
    else
      { 
       alert("  Not a Valid  Pincode \n pincode must be a number.... ");
       //for the Purpose of Multiple Address Screen
       if (val==1)
			ShowCur(k,0)
	  // end of it		
       ww.focus()
       return false;
     }
   }
}
</script>


