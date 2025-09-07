function initialize() {

    if(document.all.hdnlat.value!="" && document.all.hdnlong.value!="")
    {
        var zoom="11";
        if(document.all.hdnzoomlevel.value=="1")
        {
           zoom="05"; 
        }
        var  LineCordinates = new google.maps.LatLng(document.all.hdnlat.value,document.all.hdnlong.value);
        var mapProp = {
                center: new google.maps.LatLng(document.all.hdnlat.value,document.all.hdnlong.value),
                zoom: parseInt(zoom),            
                mapTypeControl: true,
                mapTypeControlOptions:
	                {
	                    style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
	                },
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var k=0;
            var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
             var iconURL='Images/ATM.png'; 
            
          
           if(document.all.hdnmarkertype.value=="true")
           {
            var marker = new google.maps.Marker({
                    position: LineCordinates,
                    animation: google.maps.Animation.BOUNCE,
                    icon:iconURL, 
                    draggable:true ,               
                    title:"Your Installation Site Is Here"
                                              });
            }
            else
           {
            var marker = new google.maps.Marker({
                    position: LineCordinates,
                    animation: google.maps.Animation.BOUNCE,
                    icon:iconURL, 
                    draggable:false ,               
                    title:"Your Installation Is Here"
                                              });
            }
                        marker.setMap(map);
                        showinfo(marker,k);  
            
            var draglat="",draglng="";
            google.maps.event.addListener(marker, 'dragend', function(event){             
            draglat=event.latLng.lat();
            draglng=event.latLng.lng();
                //window.returnValue=draglat+"|"+draglng;            
                /* New code for chrome */
            if (window.showModalDialog)
            {
                window.returnValue = draglat + "|" + draglng; 
            }
            else
            {
                window.opener.fnsetMapDetails(draglat + "|" + draglng);
            }
                /* New code for chrome */
        
    });
            function showinfo(marker, k)
             {
                 var markerinfo="";    
                 var markerinfodetails="";
                 var style="";                                               
                    if(document.all.hdnmarker.value!="")
                    {
                         markerinfo=document.all.hdnmarker.value.split("|");
                        style="<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
                        style +=" <tr><td valign='top' colspan='2' style='width: 100%' align='left' ><table border='0' cellpadding='0' cellspacing='0' width='100%'><tr>";
                        style +="<td align='left' background='images/pixel_004.gif' class='bodytxt_black_b' valign='middle' style='width: 23px'>"
                        style +="<img id='Entitycontimg' height='26' src='images/arrow_03.gif' width='28px' /></td>"
                        style +="<td align='left' background='images/pixel_004.gif' class='bodytxt_black_b' valign='middle'"
                        style +="style='width: 91%'>"
                        style +="Your Installation is here</td>"
                        style +="<td class='bodytxt_black_b' valign='middle' background='images/pixel_004.gif' width='9%'"
                        style +=" align='right'>   </td></tr></table>"              
                         for (var i = 0; i< markerinfo.length - 1; i++)
                            {
                            style +=" <tr align='left' valign='middle'> ";
                            style +=" <td class='bodytxt_black_b' align='left' width='30%' colspan='2' valign='middle'><font face='Calibri' size='2' >"+markerinfo[i]+"</font> </td>";
                            style +=" </tr> ";
                 
                            }
                            style +=" </table>";
                            markerinfodetails=style;
                     }
                                          
                             var infowindow = new google.maps.InfoWindow(
                                          { 
                                            content:markerinfodetails,
                                            size: new google.maps.Size(10,10)
                                          });
                                      google.maps.event.addListener(marker, 'click', function() {
                                        infowindow.open(map,marker);
                                      });

                                       
                                  
        
                }        
  
    }
    else
    {
       alert("Please Enter Latitude,Longitude");
       
    }
}    

  
