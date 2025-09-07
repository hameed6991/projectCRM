<script language ="javascript">
function checkstring(obj)
{ var specialchars = "`~#%^&+=|'><*" 
  var retval;
  var inobj,message;
  inobj = obj;
  a = inobj.value ;  
  if (a == "")
  { return ;   
  }
  l = a.length;
  retval = "";
  for(i=0;i<l;i++)
  { if (specialchars.indexOf(a.charAt(i)) == -1)
    { 	if (a.charCodeAt(i) != 34)
		{ retval = retval + a.charAt(i)
		}	
    }  
  }
  inobj.value = retval;
  return ;   
}
</script>