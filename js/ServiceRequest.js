function submenu(module,srno,defclose)
{

  if (module=="Activity")  
  {
    WinVal=window.showModalDialog("LoadSubmenu.asp?Module=" + module + "&DefClose=" + defclose + "&SRNo=" + srno+"&logid="+document.all.logid.value ,null,"dialogHeight=270Px;dialogWidth=890Px;status:no")
  }

  if (module=="CallClose")  
  {
     WinVal=window.showModalDialog("LoadSubmenu.asp?Module=" + module + "&DefClose=" + defclose + "&SRNo=" + srno +"&logid="+document.all.logid.value,null,"dialogHeight=555Px;dialogWidth=900Px;status:no")
	 //parent.frames['s1'].document.forms['frm'].submit()
	 document.getElementById('textgo').value="1";
	 getdata('','Go','');
	
  }
}

function fnOpenSrSummary(srno)
{
    //window.showModalDialog("srSummaryPage.aspx?SrNo="+srno+"&logid="+document.all.logid.value,null,"dialogwidth=950Px;dialogheight=700px;center:yes");
    document.all.frmSrsummary.src="srSummaryPage.aspx?SrNo="+srno+"&logid="+document.all.logid.value;
}

function checkNum(eveval){
	if (eveval<48 || eveval>57){
		event.keyCode=0;
		return false;
	}
}
function checkNumDot(eveval){
	if ((eveval<46 || eveval>57) && (eveval!=46) ){
		event.keyCode=0;
		return false;
	}
}


  function EndGetData(arg)
    {
    //document.getElementById("pnlgrid").innerHTML = arg;
    document.getElementById("pnladd").innerHTML = arg;
    }

    function getdata(page,gotopage,sortyby)
    {

       if(gotopage=="")
       {
       document.getElementById('hdngotopage').value="";
       }
       else
       {
       if(document.getElementById('textgo').value=="")
       {
       alert("Page No Cant Empty");
       document.getElementById('textgo').focus();
       return false;
       }
       else if(parseInt(document.getElementById('textgo').value)==0)
       {
       alert("Page No Cant be Zero");
       document.getElementById('textgo').focus();
       return false;
       }
       else if(parseInt(document.getElementById('textgo').value)>parseInt(document.getElementById('lnlrecord').innerText))
       {
       alert("Given Page No is Greater than the Total Pages");
       document.getElementById('textgo').focus();
       return false;
       }
       document.getElementById('hdngotopage').value=document.getElementById('textgo').value
       }
       if(sortyby=="")
       {
       document.getElementById('hdnsortyby').value="";
       }
       else
       {
       document.getElementById('hdnsortyby').value=sortyby;
       }
       
       document.getElementById("hdnmovepage").value = page;
       setTimeout(document.getElementById("ltCallback").value, 100);
       
       
    }

function fnOpenCallDetail()
{
    
    try
    {
        document.getElementById("form1").reset()
        document.getElementById("cmbstatus").value="Open";
        document.getElementById("cmbsubstatus").value="All Pending";              
        document.getElementById("btnSearchATMID").click();
    }
    catch(exception)
    {
    }
    
}
function fnPendingActivity()
{
   try
    {
        document.getElementById("form1").reset()
        document.getElementById("cmbstatus").value="Open";
        document.getElementById("cmbsubstatus").value="All Pending";
        document.getElementById("chkPendingActivty").checked=true;  
        document.getElementById("btnSearchATMID").click();
    }
    catch(exception)
    {
    } 
}
function fnDisPatchDetail()
{
    
    try
    {
        document.getElementById("form1").reset()
        document.getElementById("cmbstatus").value="Open";
        document.getElementById("cmbsubstatus").value="All Pending";
        document.getElementById("chkdispatch").checked=true;  
        document.getElementById("btnSearchATMID").click();
    }
    catch(exception)
    {
    }
}
function fnGetScoreCardDetails()
{
	if (window.XMLHttpRequest) 
    {
		// code for all new browsers
		xml=new XMLHttpRequest(); 
	}
	else if (window.ActiveXObject) 
	{
		// code for IE5 and IE6
		xml=new ActiveXObject("Microsoft.XMLHTTP"); 
	}
    var sURL = "WebRequest.asmx/GetScoreCardDetails";
    xml.open( "POST", sURL, false );
    xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    var str="UserPrevilageConfiguration="+document.getElementById("hdnUserPrevilageConfiguration").value;
    xml.send(str);
    lsval=xml.responseText;
    var arRtnValue = lsval.split("|");
 
    var str = "";
    str = "<table border='0' cellpadding='0' cellspacing='0'>";
    str += "<tr>";
    str += "<td align='left' valign='top'>";
    str += "<table width='200' border='0' cellspacing='0' cellpadding='0'>";
    str += "<tr>";
    str += "<td width='16' align='left' valign='top'>";
    str += "<img src='images/side_box_left_t.gif' width='16' height='38'></td>";
    str += "<td width='65' align='left' valign='top' class='side_box_heading' style='background-image: url(images/side_box_top_m.gif);background-repeat: repeat-x;'>";
    str += "Scorecard</td>";
    str += "<td width='82' align='left' valign='top' class='side_box_heading' style='background-image: url(images/side_box_top_m.gif);";
    str += " background-repeat: repeat-x;'>";
    str += "<a title='Click here to Update Scorecard' href='#' onclick='fnGetScoreCardDetails()' style='border-style:none;border-width:0px;'><img src='images/refresh_icon.png' style='border-width:0px;' width='10' height='10' vspace='3'></a></td>";
    str += "<td width='37' align='right' valign='top'>";
    str += "<img src='images/side_box_left_t1.gif' width='37' height='38'></td>";
    str += "</tr>";
    str += "<tr align='center' valign='middle'>";
    str += "<td height='24' colspan='4' class='side_box_bg'>";
    str += "<table width='200' border='0' cellspacing='0' cellpadding='0'>";
    str += "<tr>";
    str += "<td height='1' align='center' valign='middle' class='side_box_line'>";
    str += "<img src='images/spacer.gif' width='1' height='1'></td>";
    str += "</tr>";
    str += "<tr>";
    str += "<td height='18' align='center' valign='middle'>";
    str += "<table width='160' border='0' cellspacing='0' cellpadding='0'>";
    str += "<tr>";
    str += "<td width='128' align='left' valign='middle' class='bodytxt_black'>";
    str += "No of open calls:</td>";
    str += "<td width='32' align='center' valign='middle' bgcolor='#E6E6E6' class='heading2'><a class='grid_link_txt' href='#' onclick='fnOpenCallDetail()'>"+arRtnValue[0]+"</a>";
    str += "</td>";
    str += "</tr>";
    str += "</table>";
    str += "</td>";
    str += "</tr>";
    str += "<tr>";
    str += "<td height='1' align='center' valign='middle' class='side_box_line'>";
    str += "<img src='images/spacer.gif' width='1' height='1'></td>";
    str += "</tr>";
    str += "<tr>";
    str += "<td height='18' align='center' valign='middle'>";
    str += "<table width='160' border='0' cellspacing='0' cellpadding='0'>";
    str += "<tr>";
    str += "<td width='128' align='left' valign='middle' class='bodytxt_black'>";
    str += "Pending for Allocation :</td>";//Pending for Dispatch
    str += "<td width='32' align='center' valign='middle' class='heading2'><a class='grid_link_txt'  href='#' onclick='fnDisPatchDetail()'>"+arRtnValue[1]+"</a>";
    str += "</td>";
    str += "</tr>";
    str += "</table>";
    str += "</td>";
    str += "</tr>";
    str += "<tr>";
    str += "<td height='1' align='center' valign='middle' class='side_box_line'>";
    str += "<img src='images/spacer.gif' width='1' height='1'></td>";
    str += "</tr>";
    str += "<tr>";
    str += "<td height='18' align='center' valign='middle'>";
    str += "<table width='160' border='0' cellspacing='0' cellpadding='0'>";
    str += "<tr>";
    str += "<td width='128' align='left' valign='middle' class='bodytxt_black'>";
    str += "Update pending for more than " + arRtnValue[3] + " Days :</td>";
    str += "<td width='32' align='center' valign='middle' class='heading2'><a  class='grid_link_txt'  href='#' onclick='fnPendingActivity()'>"+arRtnValue[2]+"</a>";
    str += "</td>";
    str += "</tr>";
    str += "</table>";
    str += "</td>";
    str += "</tr>";
    str += "<tr>";
    str += "<td height='1' align='center' valign='middle' class='side_box_line'>";
    str += "<img src='images/spacer.gif' width='1' height='1'></td>";
    str += "</tr>";
    str += "<tr>";
    str += "<td height='1' align='center' valign='middle' class='side_box_line'>";
    str += "<img src='images/spacer.gif' width='1' height='1'></td>";
    str += "</tr>";
    str += "</table>";
    str += "</td>";
    str += "</tr>";
    str += "<tr>";
    str += "<td align='left' valign='top'>";
    str += "<img src='images/side_box_left_b.gif' width='16' height='12'></td>";
    str += "<td colspan='2' align='center' valign='top' class='side_box_bg'>";
    str += "</td>";
    str += "<td align='right' valign='top'>";
    str += "<img src='images/side_box_right_b.gif' width='37' height='12'></td>";
    str += "</tr>";
    str += "</table>";
    //document.all.spanScoreCard.innerHTML = str;
    try
    {
        document.getElementById('loading').style.display='none';
    }
    catch(ers)
    {
        var strErsMessage = ers;
    }
}