<script language=javascript>
function mail1(a)
{
  var y;
  
  var i,j;
  var ss = new String()
  var s1 = new String()
  ss = a     
  y = ss.length;
      if (ss!="")
  {
      i = ss.search("@");
       if (i!=-1)      
         {   pos = ss.indexOf("@",0);
             pos = pos+1;
             s1 =ss.substring(pos,y);
                for(i=0;i<=s1.length;i++)
                 {
                  s = s1.substring(i,i+1);
                  if(s==".")
                  {
                   return true; 
                   break;                        
                  } 
                   else 
                   { 
                   if (i==s1.length-1)
                   return false;            
                   }  
               }       
           }
        else
         {
          return false;
         }
    }
  }
</script>







