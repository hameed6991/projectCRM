<script language = javascript>
function datediff2(s,e,i)
{
 var bufferA = Date.parse(s) ; 
 var bufferB = Date.parse(e) ;
 var number = bufferB - bufferA ; 
 
    switch (i)
    {
        case 'd': case 'D': 
            iOut = parseInt(number / 86400000) ;
            iOut += parseInt((number % 86400000)/43200001) ;
            break ;
        case 'h': case 'H':
            iOut = parseInt(number / 3600000 ) ;
            iOut += parseInt((number % 3600000)/1800001) ;
            break ;
        case 'm': case 'M':
            iOut = parseInt(number / 60000 ) ;
            iOut += parseInt((number % 60000)/30001) ;
            break ;
        case 's': case 'S':
            iOut = parseInt(number / 1000 ) ;
            iOut += parseInt((number % 1000)/501) ;
            break ;
        default:
        return null ;
    }
    
    return iOut;

}
function datediff1(ww,ee,int)
{
  var i,s,j,m,t; 
  var a = new Array()  
  var b = new Array()  
  s = ww
  m = ee
  tt= int 
 
 
    s1=s.charAt(2);
    if ((s1=="/")||(s1=="-")||(s1==","))
    {
       j=s.split(s1)
     for(i=0;i<=2;i++)
     a[i]=j[i];
     }
    
    s2=m.charAt(2);
    if ((s2=="/")||(s2=="-")||(s2==","))
     {
      k=m.split(s2);
     for(i=0;i<=2;i++)
      b[i]=k[i];    
     }
 
           if(tt=='d')
            {  
            t =Math.abs(b[0]-a[0]);
            return t;
              }
            
            if(tt=='m')
            {
             
            t =Math.abs(b[1]-a[1]);
            return t;
            } 
 
            if(tt=='y')
            { 
             t =Math.abs(b[2]-a[2]);
            return t;
            } 
 }
</script>