<script language = javascript>
function rtndateonly1(inobj,inmessage)
{
var slashcount,input,dd,mm,yy,l,i; 
var retdd,retmm,retyyyy;
var message;
var datearr= new Array();
message = inmessage;
input = inobj.value;

if (input == "")
{ return true;
}
slashcount=0;
l = input.length;
for(i=0;i<l;i++)
{ if (input.charAt(i) == "/")
  { slashcount++;
  }
}
if (slashcount != 2)
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY  ");
  inobj.focus();
  return false;
}
datearr = input.split("/")
dd = datearr[0];
mm = datearr[1];
yy = datearr[2];

if ( yy.length > 4 )
{
 alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY  ");
  inobj.focus();
  return false;
}

if (dd == "" || isNaN(dd) ||dd.length == 0 || dd.length > 2 )
{ alert(" Invalid Day value in " + message)
  inobj.focus();
  return false;
}
if (mm == "" || isNaN(mm) || mm.length == 0 || mm.length > 2 )
{ alert(" Invalid Month value in " + message)
  inobj.focus();
  return false;
}
if (yy == "" || isNaN(yy) || yy.length == 0 || yy.length == 1 || yy.length == 3 )
{ alert(" Invalid Year value in " + message)
  inobj.focus();
  return false;
}
if (yy.length == 2)
{
	retyyyy = twodigits(yy);
	if (retyyyy >= "00" && retyyyy <= "50") 
	{ retyyyy = "20" + retyyyy;
	}
	else
	{ retyyyy = "19" + retyyyy;
	}
}
else
{ retyyyy = twodigits(yy.charAt(0) + yy.charAt(1))
  retyyyy = retyyyy + twodigits(yy.charAt(2) + yy.charAt(3))
}
retdd = twodigits(dd)
retmm = twodigits(mm)

if (retdd <= "00" || retdd > "31")
{ alert("Invalid Day value in " + message);
  inobj.focus();
  return false;
}
if (retmm <= "00" || retmm > "12")
{ alert("Invalid month value in " + message);
  inobj.focus();
  return false;
}
if (retyyyy <= "0000" )
{ alert("Invalid year value in "+ message);
  inobj.focus();
  return false;
}
if (retmm == "02" && retdd > "29")
{ alert("Invalid Day value for the Month in "+ message);
  inobj.focus();
  return false;
}
inobj.value = retdd+"/"+retmm+"/"+retyyyy;
return true;
}  


function rtndateonly2(inobj,inmessage)
{
var slashcount,input,dd,mm,yy,l,i; 
var retdd,retmm,retyyyy;
var message;
var datearr= new Array();
message = inmessage;
input = inobj.value;

if (input == "")
{ return true;
}
slashcount=0;
l = input.length;
for(i=0;i<l;i++)
{ if (input.charAt(i) == "/")
  { slashcount++;
  }
}
if (slashcount != 2)
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY  ");
  //inobj.focus();
  return false;
}
datearr = input.split("/")
dd = datearr[0];
mm = datearr[1];
yy = datearr[2];

if ( yy.length > 4 )
{
 alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY  ");
  //inobj.focus();
  return false;
}

if (dd == "" || isNaN(dd) ||dd.length == 0 || dd.length > 2 )
{ alert(" Invalid Day value in " + message)
  //inobj.focus();
  return false;
}
if (mm == "" || isNaN(mm) || mm.length == 0 || mm.length > 2 )
{ alert(" Invalid Month value in " + message)
  //inobj.focus();
  return false;
}
if (yy == "" || isNaN(yy) || yy.length == 0 || yy.length == 1 || yy.length == 3 )
{ alert(" Invalid Year value in " + message)
  //inobj.focus();
  return false;
}
if (yy.length == 2)
{
	retyyyy = twodigits(yy);
	if (retyyyy >= "00" && retyyyy <= "50") 
	{ retyyyy = "20" + retyyyy;
	}
	else
	{ retyyyy = "19" + retyyyy;
	}
}
else
{ retyyyy = twodigits(yy.charAt(0) + yy.charAt(1))
  retyyyy = retyyyy + twodigits(yy.charAt(2) + yy.charAt(3))
}
retdd = twodigits(dd)
retmm = twodigits(mm)

if (retdd <= "00" || retdd > "31")
{ alert("Invalid Day value in " + message);
  //inobj.focus();
  return false;
}
if (retmm <= "00" || retmm > "12")
{ alert("Invalid month value in " + message);
  //inobj.focus();
  return false;
}
if (retyyyy <= "0000" )
{ alert("Invalid year value in "+ message);
  //inobj.focus();
  return false;
}
if (retmm == "02" && retdd > "29")
{ alert("Invalid Day value for the Month in "+ message);
  //inobj.focus();
  return false;
}
inobj.value = retdd+"/"+retmm+"/"+retyyyy;
return true;
}  

function rtndatetime1(inobj,inmessage)
{
var slashcount,colcount,input,dd,mm,yy,min,hrs,yearslash,l,i,colpos,spacepos; 
var retdd,retmm,retyyyy,retmin,rethrs;
var message;
var datearr= new Array();
message = inmessage;
input = inobj.value;

if (input == "")
{ return true;
}

slashcount=0;
l = input.length;
for(i=0;i<l;i++)
{ if (input.charAt(i) == "/")
  { slashcount++;
    yearslash = i;
  }
}
if (slashcount != 2 )
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  inobj.focus();
  return false;
}
spacepos = 0;
for (i=yearslash;i<l;i++)
{ if (input.charAt(i) == " ")
  { spacepos = i;
  }
}

if (spacepos==0)
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  inobj.focus();
  return false;
}

colcount=0; // check for :
l = input.length;
for(i=0;i<l;i++)
{ if (input.charAt(i) == ":")
  { colpos = i;
    colcount++;
  }
}

if (colcount != 1)
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  inobj.focus();
  return false;
}

if ((colpos - spacepos )> 3) // dist between space and hour
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  inobj.focus();
  return false;
}

datearr = input.split("/")
dd  = datearr[0];
mm  = datearr[1];


if ((spacepos-yearslash) == 5)
 { yy  = input.charAt(yearslash+1) + input.charAt(yearslash+2) + input.charAt(yearslash+3) + input.charAt(yearslash+4);
 }
 else 
 { if ((spacepos-yearslash) ==3)
   { yy  = input.charAt(yearslash+1) + input.charAt(yearslash+2);
   }
   else
   { alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
     inobj.focus();
     return false;
   }
 }
  
hrs = input.charAt(colpos - 2) + input.charAt(colpos - 1);
min = input.charAt(colpos + 1) + input.charAt(colpos + 2);   

if (dd == "" || isNaN(dd) ||dd.length == 0 || dd.length > 2 )
{ alert(" Invalid Day value in " + message)
  inobj.focus();
  return false;
}

if (mm == "" || isNaN(mm) || mm.length == 0 || mm.length > 2 )
{ alert(" Invalid Month value in " + message)
  inobj.focus();
  return false;
}

if (yy == "" || isNaN(yy) || yy.length == 0 || yy.length > 4 || yy.length == 1 || yy.length == 3 )
{ alert(" Invalid Year value in " + message)
  inobj.focus();
  return false;
}

if (min == "" || isNaN(min) ||min.length == 0 || min.length > 2 )
{ alert(" Invalid minute value in " + message)
  inobj.focus();
  return false;
}

if (hrs == "" || isNaN(hrs) ||hrs.length == 0 || hrs.length > 2 )
{ alert(" Invalid hour value in " + message)
  inobj.focus();
  return false;
}

if (yy.length == 2)
{
	retyyyy = twodigits(yy);
	if (retyyyy >= "00" && retyyyy <= "50") 
	{ retyyyy = "20" + retyyyy;
	}
	else
	{ retyyyy = "19" + retyyyy;
	}
}
else
{ retyyyy = twodigits(yy.charAt(0) + yy.charAt(1))
  retyyyy = retyyyy + twodigits(yy.charAt(2) + yy.charAt(3))
}

retdd  = twodigits(dd)
retmm  = twodigits(mm)
retmin = twodigits(min)
rethrs = twodigits(hrs)

if (retdd <= "00" || retdd > "31")
{ alert("Invalid Day value in " + message);
  inobj.focus();
  return false;
}

if (retmm <= "00" || retmm > "12")
{ alert("Invalid Month value in " + message);
  inobj.focus();
  return false;
}
if (retyyyy <= "0000" )
{ alert("Invalid Year value in "+ message);
  inobj.focus();
  return false;
}
if (retmm == "02" && retdd > "29")
{ alert("Invalid Day value for the Month in "+ message);
  inobj.focus();
  return false;
}
if (retmin > "59" )
{ alert("Invalid minute value in "+ message);
  inobj.focus();
  return false;
}
if (rethrs > "23" )
{ alert("Invalid hour value in "+ message);
  inobj.focus();
  return false;
}

inobj.value = retdd + "/" + retmm + "/" + retyyyy + " "  + rethrs +  ":"+ retmin ;
return true;
}


function rtndatetime2(inobj,inmessage)
{
var slashcount,colcount,input,dd,mm,yy,min,hrs,yearslash,l,i,colpos,spacepos; 
var retdd,retmm,retyyyy,retmin,rethrs;
var message;
var datearr= new Array();
message = inmessage;
input = inobj.value;

if (input == "")
{ return true;
}

slashcount=0;
l = input.length;
for(i=0;i<l;i++)
{ if (input.charAt(i) == "/")
  { slashcount++;
    yearslash = i;
  }
}
if (slashcount != 2 )
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  //inobj.focus();
  return false;
}
spacepos = 0;
for (i=yearslash;i<l;i++)
{ if (input.charAt(i) == " ")
  { spacepos = i;
  }
}

if (spacepos==0)
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  //inobj.focus();
  return false;
}

colcount=0; // check for :
l = input.length;
for(i=0;i<l;i++)
{ if (input.charAt(i) == ":")
  { colpos = i;
    colcount++;
  }
}

if (colcount != 1)
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  //inobj.focus();
  return false;
}

if ((colpos - spacepos )> 3) // dist between space and hour
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  //inobj.focus();
  return false;
}

datearr = input.split("/")
dd  = datearr[0];
mm  = datearr[1];


if ((spacepos-yearslash) == 5)
 { yy  = input.charAt(yearslash+1) + input.charAt(yearslash+2) + input.charAt(yearslash+3) + input.charAt(yearslash+4);
 }
 else 
 { if ((spacepos-yearslash) ==3)
   { yy  = input.charAt(yearslash+1) + input.charAt(yearslash+2);
   }
   else
   { alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
    // inobj.focus();
     return false;
   }
 }
  
hrs = input.charAt(colpos - 2) + input.charAt(colpos - 1);
min = input.charAt(colpos + 1) + input.charAt(colpos + 2);   

if (dd == "" || isNaN(dd) ||dd.length == 0 || dd.length > 2 )
{ alert(" Invalid Day value in " + message)
 // inobj.focus();
  return false;
}

if (mm == "" || isNaN(mm) || mm.length == 0 || mm.length > 2 )
{ alert(" Invalid Month value in " + message)
  //inobj.focus();
  return false;
}

if (yy == "" || isNaN(yy) || yy.length == 0 || yy.length > 4 || yy.length == 1 || yy.length == 3 )
{ alert(" Invalid Year value in " + message)
  //inobj.focus();
  return false;
}

if (min == "" || isNaN(min) ||min.length == 0 || min.length > 2 )
{ alert(" Invalid minute value in " + message)
  //inobj.focus();
  return false;
}

if (hrs == "" || isNaN(hrs) ||hrs.length == 0 || hrs.length > 2 )
{ alert(" Invalid hour value in " + message)
  //inobj.focus();
  return false;
}

if (yy.length == 2)
{
	retyyyy = twodigits(yy);
	if (retyyyy >= "00" && retyyyy <= "50") 
	{ retyyyy = "20" + retyyyy;
	}
	else
	{ retyyyy = "19" + retyyyy;
	}
}
else
{ retyyyy = twodigits(yy.charAt(0) + yy.charAt(1))
  retyyyy = retyyyy + twodigits(yy.charAt(2) + yy.charAt(3))
}

retdd  = twodigits(dd)
retmm  = twodigits(mm)
retmin = twodigits(min)
rethrs = twodigits(hrs)

if (retdd <= "00" || retdd > "31")
{ alert("Invalid Day value in " + message);
  //inobj.focus();
  return false;
}

if (retmm <= "00" || retmm > "12")
{ alert("Invalid Month value in " + message);
  //inobj.focus();
  return false;
}
if (retyyyy <= "0000" )
{ alert("Invalid Year value in "+ message);
  //inobj.focus();
  return false;
}
if (retmm == "02" && retdd > "29")
{ alert("Invalid Day value for the Month in "+ message);
  //inobj.focus();
  return false;
}
if (retmin > "59" )
{ alert("Invalid minute value in "+ message);
  //inobj.focus();
  return false;
}
if (rethrs > "23" )
{ alert("Invalid hour value in "+ message);
  //inobj.focus();
  return false;
}

inobj.value = retdd + "/" + retmm + "/" + retyyyy + " "  + rethrs +  ":"+ retmin ;
return true;
}

function twodigits(inval)
{
var ret;
if (inval.length ==1) // if single digit 
{ if( issingledigit(inval.charAt(0)))
  { ret = "0" + inval;
  }
}
else				 //  if two digit
{ if(issingledigit(inval.charAt(0)))
  { ret = inval.charAt(0);
    if(issingledigit(inval.charAt(1)))
    { ret = inval;
    }
    else
    { ret = "0"+ ret;
    }
  }
  else
  { if(issingledigit(inval.charAt(1)))
    ret = "0" + inval.charAt(1);
  }
}
return ret;
}


function issingledigit(val)
{  if ( val >= "0" && val <= "9" )
    { return true;
    }
    else return false;
}

function rtndateonly(ww,na)
{
var i,s,j,c,s2,s1; 
var a = new Array();  
var j = new Array();
s =ww;
s2=s.length;
if (s=="")
return true;
j=s.split("/");
for(i=0;i<=2;i++)
a[i]=j[i];
 
 if ((isNaN(a[0])==false)&&(isNaN(a[1])==false)&&(isNaN(a[2])==false))
   if ((a[0].length<=2)&&(a[1].length<=2))
       if (((a[0]<=31)&&(a[0]!=""))&&((a[1]<=12)&&(a[1]!="")))
        {
          return true;
        } 
   else
         {
         
         alert( na + "   Not A Valid Date \n  Format :dd/mm/yyyy  ");
         return false;
         }
     else
         {
         
         alert( na + "   Not A Valid Date \n  Format :dd/mm/yyyy  ");
         return false;
         }
 else          
        {
        
        alert( na + "   Not A Valid Date \n  Format :dd/mm/yyyy  ");
        return false;
        }
 }   


function rtndatetime3(inobj,focobj,inmessage)
{
var slashcount,colcount,input,dd,mm,yy,min,hrs,yearslash,l,i,colpos,spacepos; 
var retdd,retmm,retyyyy,retmin,rethrs;
var message;
var datearr= new Array();
message = inmessage;
input = inobj.value;

if (input == "")
{ return true;
}

slashcount=0;
l = input.length;
for(i=0;i<l;i++)
{ if (input.charAt(i) == "/")
  { slashcount++;
    yearslash = i;
  }
}
if (slashcount != 2 )
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  focobj.focus();
  return false;
}
spacepos = 0;
for (i=yearslash;i<l;i++)
{ if (input.charAt(i) == " ")
  { spacepos = i;
  }
}

if (spacepos==0)
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  focobj.focus();
  return false;
}

colcount=0; // check for :
l = input.length;
for(i=0;i<l;i++)
{ if (input.charAt(i) == ":")
  { colpos = i;
    colcount++;
  }
}

if (colcount != 1)
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  focobj.focus();
  return false;
}

if ((colpos - spacepos )> 3) // dist between space and hour
{ alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
  focobj.focus();
  return false;
}

datearr = input.split("/")
dd  = datearr[0];
mm  = datearr[1];


if ((spacepos-yearslash) == 5)
 { yy  = input.charAt(yearslash+1) + input.charAt(yearslash+2) + input.charAt(yearslash+3) + input.charAt(yearslash+4);
 }
 else 
 { if ((spacepos-yearslash) ==3)
   { yy  = input.charAt(yearslash+1) + input.charAt(yearslash+2);
   }
   else
   { alert( message + "   Not A Valid Date \n  Format : DD/MM/YYYY HH:MM ");
     focobj.focus();
     return false;
   }
 }
  
hrs = input.charAt(colpos - 2) + input.charAt(colpos - 1);
min = input.charAt(colpos + 1) + input.charAt(colpos + 2);   

if (dd == "" || isNaN(dd) ||dd.length == 0 || dd.length > 2 )
{ alert(" Invalid Day value in " + message)
  focobj.focus();
  return false;
}

if (mm == "" || isNaN(mm) || mm.length == 0 || mm.length > 2 )
{ alert(" Invalid Month value in " + message)
  focobj.focus();
  return false;
}

if (yy == "" || isNaN(yy) || yy.length == 0 || yy.length > 4 || yy.length == 1 || yy.length == 3 )
{ alert(" Invalid Year value in " + message)
  focobj.focus();
  return false;
}

if (min == "" || isNaN(min) ||min.length == 0 || min.length > 2 )
{ alert(" Invalid minute value in " + message)
  focobj.focus();
  return false;
}

if (hrs == "" || isNaN(hrs) ||hrs.length == 0 || hrs.length > 2 )
{ alert(" Invalid hour value in " + message)
  focobj.focus();
  return false;
}

if (yy.length == 2)
{
	retyyyy = twodigits(yy);
	if (retyyyy >= "00" && retyyyy <= "50") 
	{ retyyyy = "20" + retyyyy;
	}
	else
	{ retyyyy = "19" + retyyyy;
	}
}
else
{ retyyyy = twodigits(yy.charAt(0) + yy.charAt(1))
  retyyyy = retyyyy + twodigits(yy.charAt(2) + yy.charAt(3))
}

retdd  = twodigits(dd)
retmm  = twodigits(mm)
retmin = twodigits(min)
rethrs = twodigits(hrs)

if (retdd <= "00" || retdd > "31")
{ alert("Invalid Day value in " + message);
  focobj.focus();
  return false;
}

if (retmm <= "00" || retmm > "12")
{ alert("Invalid Month value in " + message);
  focobj.focus();
  return false;
}
if (retyyyy <= "0000" )
{ alert("Invalid Year value in "+ message);
  focobj.focus();
  return false;
}
if (retmm == "02" && retdd > "29")
{ alert("Invalid Day value for the Month in "+ message);
  focobj.focus();
  return false;
}
if (retmin > "59" )
{ alert("Invalid minute value in "+ message);
  focobj.focus();
  return false;
}
if (rethrs > "23" )
{ alert("Invalid hour value in "+ message);
  focobj.focus();
  return false;
}

inobj.value = retdd + "/" + retmm + "/" + retyyyy + " "  + rethrs +  ":"+ retmin ;
return true;
}

</script>

