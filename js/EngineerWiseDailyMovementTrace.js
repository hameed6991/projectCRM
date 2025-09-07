function initialize()
{    
    if(document.getElementById("hdnEngineerTrackValues").value != "")
    {
        var geocoder = new google.maps.Geocoder();
         var lineSymbol = {
                          path: 'M 0,-1 0,1',
                          strokeOpacity: 1,
                          scale: 4
                        };
       
         var mapProp = {
            center: new google.maps.LatLng(13.050196,80.261682),
            zoom: 11,            
            mapTypeControl: true,
            mapTypeControlOptions:
	            {
	                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
	            },
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };      
        
        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp); 
        
        var addressess = document.getElementById("hdnEngineerTrackValues").value;
        
        var mobileinfo = addressess.split("^");
        var LineCordinates = new Array();                          
        var titlecontent=new Array();
        var k=0;
        var style="";
        for (var i = 0; i < mobileinfo.length; i++)
         {
            LineCordinates[i] = new Array();            
            var details = mobileinfo[i].split("|");
            for (var j = 0; j < details.length; j++) 
              {
                    
                    var coordinates = details[j].split(",");
                    LineCordinates[i][j] = new google.maps.LatLng(coordinates[0], coordinates[1]);                 
                       style="<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
                        style +=" <tr><td valign='top' colspan='2' style='width: 100%' align='left' ><table border='0' cellpadding='0' cellspacing='0' width='100%'><tr>";
                        style +="<td align='left' background='../Images/pixel_004.gif' class='bodytxt_black_b' valign='middle' style='width: 23px'>"
                        style +="<img id='Entitycontimg' height='26' src='../Images/arrow_03.gif' width='28px' /></td>"
                        style +="<td align='left' background='../Images/pixel_004.gif' class='bodytxt_black_b' valign='middle'"
                        style +="style='width: 91%'>"
                        style +="Engineer Info </td>"
                        style +="<td class='bodytxt_black_b' valign='middle' background='../Images/pixel_004.gif' width='9%'"
                        style +=" align='right'>   </td></tr></table>"               
                        style +=" <tr align='left' valign='middle'> ";
                        style +=" <td class='bodytxt_black_b' align='right' width='25%' valign='middle'><font face='Calibri' size='2' >Name:&nbsp;</font> </td>";
                        style +=" <td class='bodytxt_black' align='left' width='75%' valign='middle'><font face='Calibri' size='2' >"+ coordinates[2] +"</font> </td>";
                        style +=" </tr> ";
                        style +=" <tr align='center' valign='middle'> ";
                        style +=" <td class='bodytxt_black_b' align='right' valign='middle'><font face='Calibri' size='2' >Time At:&nbsp;</font> </td>";
                        style +=" <td class='bodytxt_black' align='left' valign='middle'><font face='Calibri' size='2' >"+ coordinates[3] +"</font> </td>";                
                        style +=" </tr>";
                        style +=" <tr align='center' valign='middle'> ";
                        style +=" <td class='bodytxt_black_b' align='right' valign='middle'><font face='Calibri' size='2' >Distance:&nbsp;</font> </td>";
                        style +=" <td class='bodytxt_black' align='left' valign='middle'><font face='Calibri' size='2' >"+ coordinates[4] +" KM</font> </td>";                
                        style +=" </tr>";
                       
                        titlecontent[k] = style;
                  
                            if(j==details.length-1) 
                              
                            {           
                                                    marker = new google.maps.Marker({
                                                                position: LineCordinates[i][j],
                                                                animation: google.maps.Animation.BOUNCE,
                                                                //animation: google.maps.Animation.DROP,
                                                                icon:"../Images/Engineer1.png",                                                                
                                                                title:"Engineer"
                        
                        
                                                        });  
                                                       

                                                                    
                             }
                             else
                             {
                                                    marker = new google.maps.Marker({
                                                                position: LineCordinates[i][j],
                                                                animation: google.maps.Animation.DROP,
                                                                icon:"../Images/Engineer1.png",                                                               
                                                                title:"Engineer"
                        
                        
                                                     });  
                            }
                                                        marker.setMap(map);                       


                                                        showinfo(marker, k, LineCordinates[i][j]);
                                                      
                                                           
                    k++;
              }
              
                    var line = new google.maps.Polyline({
                                                  path: LineCordinates[i],
                                                  strokeOpacity: 0,
                                                  icons: [{
                                                    icon: lineSymbol,
                                                    offset: '0',
                                                    repeat: '20px'
                                                  }],
                                                  map: map
                                                });      
              
              
   }
        
   

        function showinfo(marker, number,latlng)
         {
            
             var addr = "",content="";
             var styleaddr="";
                
                geocoder.geocode({'latLng': latlng }, function (results, status) {                                                  
                    if (status == google.maps.GeocoderStatus.OK) {                                            
                        if (results[0]) {
                            addr = results[0].formatted_address;
                          
                        }                      
                       
                    }
                       if(addr !="")
                       {
                        styleaddr +=" <tr align='left' valign='middle'> ";
                        styleaddr +=" <td class='bodytxt_black_b' align='right' valign='middle'><font face='Calibri' size='2' >Located on:&nbsp;</font> </td>";
                        styleaddr +=" <td class='bodytxt_black' align='left' valign='middle'><font face='Calibri' size='2' >"+ addr +"</font> </td>";                        
                        styleaddr +=" </tr></table>";
                        content =titlecontent[number] + styleaddr ;
                        }
                        else
                        {
                        content =titlecontent[number]+"</table>";
                        }
                                        
                    
                    var infowindow = new google.maps.InfoWindow(
                                              {
                                                  content: content,
                                                  size: new google.maps.Size(20, 20)
                                              });
                                    google.maps.event.addListener(marker, 'click', function () {
                                    infowindow.open(map, marker);
                    });
                });
        }

  


    }    

}

