

function checkdate(v1,v2)
{ 
  var d1,d2,m1,m2,y1,y2,hh1,hh2,mm1,mm2;
  
  d1 = v1.charAt(0) + v1.charAt(1);
  m1 = v1.charAt(3) + v1.charAt(4);
  y1 = v1.charAt(6) + v1.charAt(7) + v1.charAt(8) + v1.charAt(9);

  d2 = v2.charAt(0) + v2.charAt(1);
  m2 = v2.charAt(3) + v2.charAt(4);
  y2 = v2.charAt(6) + v2.charAt(7) + v2.charAt(8) + v2.charAt(9);

  if (y2 == y1)  // same year
  {    if (m2 > m1)  // if month exceeds then ok	 
     	{ 	return true;
     	}
     	else
     	{ 	if (m2 == m1) // if same month
       		{ 	if (d2 >= d1 ) // if day grater then ok
         		{	return true;
         		}
         		else
         		{  	return false; //wrong go back
	 			}
       		}
       		else
       		{ 	return false;
       		} 
     	}
  }
  else
  {  if (y2 > y1)
     {  return true;
     }
     else
     { 	return false;
     }
  }  
} // end function

function checkdatevalue(v1,v2)
{ 
  var d1,d2,m1,m2,y1,y2,h1,h2,mm1,mm2;
  
  d1 = v1.charAt(0) + v1.charAt(1);
  m1 = v1.charAt(3) + v1.charAt(4);
  y1 = v1.charAt(6) + v1.charAt(7) + v1.charAt(8) + v1.charAt(9);

  d2 = v2.charAt(0) + v2.charAt(1);
  m2 = v2.charAt(3) + v2.charAt(4);
  y2 = v2.charAt(6) + v2.charAt(7) + v2.charAt(8) + v2.charAt(9);

  if (d1 == d2 && m1 == m2 && y1 == y2 )	
  { return 0;
  }
  
  if (y2 == y1)  // same year
  {    if (m2 > m1)  // if month exceeds then ok	 
     	{ 	return 2;
     	}
     	else
     	{ 	if (m2 == m1) // if same month
       		{ 	if (d2 > d1 ) // if day grater then ok
         		{	return 2;
         		}
         		else
         		{  	return 1; //wrong go back
	 			}
       		}
       		else
       		{ 	return 1;
       		} 
     	}
  }
  else
  {  if (y2 > y1)
     {  return 2;
     }
     else
     { 	return 1;
     }
  }  
} // end function

function checkdatetime(v1,v2)
{ 
  var d1,d2,m1,m2,y1,y2,hh1,hh2,mm1,mm2;
  
  d1 = v1.charAt(0) + v1.charAt(1);
  m1 = v1.charAt(3) + v1.charAt(4);
  y1 = v1.charAt(6) + v1.charAt(7) + v1.charAt(8) + v1.charAt(9);
  
  hh1 = v1.charAt(11) + v1.charAt(12);
  mm1 = v1.charAt(14) + v1.charAt(15); 
  
  d2 = v2.charAt(0) + v2.charAt(1);
  m2 = v2.charAt(3) + v2.charAt(4);
  y2 = v2.charAt(6) + v2.charAt(7) + v2.charAt(8) + v2.charAt(9);

  hh2 = v2.charAt(11) + v2.charAt(12);
  mm2 = v2.charAt(14) + v2.charAt(15); 
  
  if (y2 == y1)  // same year
  {    if (m2 > m1)  // if month exceeds then ok	 
     	{ 	return true;
     	}
     	else
     	{ 	if (m2 == m1) // if same month
       		{ 	if (d2 > d1 ) // if day grater then ok
         		{	return true;
         		}
         		else
         		{ 	if(d2 == d1) 
                          	{	if (hh2 > hh1)
					{ return true;	
					}    
					else
					{ 	if (hh2 == hh1)
						{ 	if (mm2 > mm1)
							{	return true;
							}
							else
							{ 	return false;	 
							}
						}
						else
						{	return false;
						}	
					}
                          	}
                          	else
                          	{ 	return false;
                          	}
	 		}
       		}
       		else
       		{ 	return false;
       		} 
     	}
  }
  else
  {  if (y2 > y1)
     {  return true;
     }
     else
     { 	return false;
     }
  }  
} // end function

function checkdatetimevalue(v1,v2)
{ 
  var d1,d2,m1,m2,y1,y2,hh1,hh2,mm1,mm2;
  
  d1 = v1.charAt(0) + v1.charAt(1);
  m1 = v1.charAt(3) + v1.charAt(4);
  y1 = v1.charAt(6) + v1.charAt(7) + v1.charAt(8) + v1.charAt(9);
  
  hh1 = v1.charAt(11) + v1.charAt(12);
  mm1 = v1.charAt(14) + v1.charAt(15); 

  d2 = v2.charAt(0) + v2.charAt(1);
  m2 = v2.charAt(3) + v2.charAt(4);
  y2 = v2.charAt(6) + v2.charAt(7) + v2.charAt(8) + v2.charAt(9);

  hh2 = v2.charAt(11) + v2.charAt(12);
  mm2 = v2.charAt(14) + v2.charAt(15); 


  if (d1 == d2 && m1 == m2 && y1 == y2 && hh1 == hh2 && mm1 == mm2)	
  { return 0;
  }
  
  if (y2 == y1)  // same year
  {    if (m2 > m1)  // if month exceeds then ok	 
     	{ 	return 2;
     	}
     	else
     	{ 	if (m2 == m1) // if same month
       		{ 	if (d2 > d1 ) // if day grater then ok
         		{	return 2;
         		}
         		else
         		{ 	if(d2 == d1) 
                          	{	if (hh2 > hh1)
					{ return 2;	
					}    
					else
					{ 	if (hh2 == hh1)
						{ 	if (mm2 > mm1)
							{	return 2;
							}
							else
							{ 	return 1;	 
							}
						}
						else
						{	return 1;
						}	
					}
                          	}
                          	else
                          	{ 	return 1;
                          	}
	 		}
       		}
       		else
       		{ 	return 1;
       		} 
     	}
  }
  else
  {  if (y2 > y1)
     {  return 2;
     }
     else
     { 	return 1;
     }
  }  
} // end function

