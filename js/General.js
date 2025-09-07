//var meta = document.createElement('meta'); 
//meta.httpEquiv="X-UA-Compatible"; meta.content="IE=EmulateIE8"; 
//document.getElementsByTagName('head').item(0).appendChild(meta);


//****************Added By Deepak(START)*************************
/*
function closemodal(x)
{
    alert("yes1");
   window.parent.closeModal(x);
}

window.closeModal = function (x)
{
 alert("close"+x);
if(x=="Allocation"){
        $('#AlocationModel').modal('hide');
    }
else if(x=="Followup"){
    $('#FollowupModel').modal('hide');
}
else if(x=="Clousre"){
    $('#ClosureModel').modal('hide');
}             // NewServiceRequest
else if (x == "NewServiceRequest") {
  // alert($('#NewSRModals').length);
    $('#NewSRModals').modal('hide');
    $("#objNewSRModals").attr("data", "");
}
else if(x=="AddContact")
{   
   // alert($('#AddContactmodals').length);
    $('#AddContactmodals').modal('hide');
}
else if (x == "ReAllocation")
{
    $("#AddReAllocationModal").modal('hide');
}


    //   $('#myModalsContact').modal('hide');
};*/
//****************Added By Deepak(END)*************************



function EndGetData(arg)
{
    document.getElementById("pnlgrid").innerHTML = arg;
    //document.getElementById("pagenavigation").innerHTML = arg;
}

function getdata(page,gotopage,sortyby,refresh)
{
    if(refresh!="")
    {
        document.getElementById('hdnrefresh').value='refresh';
    }
    else

    {
        document.getElementById('hdnrefresh').value='';
    }
    if(gotopage=="")
    {
        document.getElementById('hdngotopage').value="";
    }
    else
    {
        if(document.getElementById('textgo').value=="")
        {
            alert("Page No Can't be Empty");
            document.getElementById('textgo').focus();
            return false;
        }
        else if(parseInt(document.getElementById('textgo').value)==0)
        {
            alert("Page No Can't be Zero");
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

function checkNum(eveval)
{
    if (eveval<48 || eveval>57)
    {
        event.keyCode=0;
		return false;
	}
}

function checkNumDot(eveval)
{
    if ((eveval<46 || eveval>57) && (eveval!=46) )
    {
		event.keyCode=0;
		return false;
	}
}

function isempty(obj,name)
{
    if (obj.value=="")
    {
        alert(name + " Can't be Empty....");
        obj.focus();
        return false
	}
	else
	{
	    var n=obj.value.length;
	    flg=false
	    for(i=0;i<n;i++)
	    {
	        if (obj.value.charCodeAt(i)==32)
	            flg=true
            else
            {
                flg=false
                break
            }	
		}
		if(flg)
		{
		    alert(name + " Can't be Empty....")
		    obj.focus()
		    return false
        }
        else
            return  true
    }
}


function isempty2(obj,name)
{
	if (obj.value=="")
	{
		alert(name + " Can't be Empty....")
		//obj.focus()	
		return false
	}
	else
	{
		var n=obj.value.length
		flg=false
		for(i=0;i<n;i++)
		{
			if (obj.value.charCodeAt(i)==32)
				flg=true
			else
			{
				flg=false
				break
	  		}
		}
		if(flg)
		{
			alert(name + " Can't be Empty....")
			//obj.focus()	
			return false 
		}
		else
			return  true
	}	
}

function isnum(ss,s)
{
    var tv
    tv=ss.value
    if (tv=="")
        return true;
    else
    {
        if (isNaN(tv)==true)
        {
            alert("  Not a Valid " +s+ " ......")
            ss.focus()
            return false;
        }
        return true;
    }
}

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
        {
            pos = ss.indexOf("@",0);
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


//Validating Email address
function validate_email(obj,name)
{
    //var mail=document.getElementById("contactInfo1_Mail").value;
	var mail=obj.value;
	apos=mail.indexOf("@"); //Index of @ position
	dotpos=mail.lastIndexOf("."); //Index of . position
	lent=mail.length; //Checking getting length
	if (apos<1||(dotpos-apos<2)||(lent-dotpos<2))
	{
	    alert("Invalid " + name);//"Invalid Email Address");
	    obj.focus();
	    return false;
    }
    else
    {
        return true;
    }
}

//function fnBindDropDown(cmbDropDown, Mandatory)
//{
//    optn = document.createElement("option");
//    document.getElementById(cmbDropDown).options.length=0;
//    if (Mandatory == "Mandatory")
//    	optn.text="<--Select-->";
//    else
//    	optn.text="None";
//    optn.value="";
//    document.getElementById(cmbDropDown).options.add(optn);
//    if(lsval!="")
//    {
//        arReceived = lsval.split("^^^");
//        for(i=0;i<arReceived.length-1;i++)
//        {
//            arToBind = arReceived[i].split("|");
//            optn = document.createElement("option");
//            optn.text=arToBind[0];
//            optn.value=arToBind[1];
//            document.getElementById(cmbDropDown).options.add(optn);
//        }
//    }
//}

function fnBindDropDown(cmbDropDown, Mandatory)
{

 
    optn = document.createElement("option");
    document.getElementById(cmbDropDown).options.length=0;
    if (Mandatory == "Mandatory")
    {
    	optn.text="<--Select-->";
    	optn.value="";
    	document.getElementById(cmbDropDown).options.add(optn);
    }
    else if (Mandatory == "All")
    {
    	optn.text="All";
    	optn.value="";
    	document.getElementById(cmbDropDown).options.add(optn);
    }
    else if (Mandatory == "No")
    {
//    	optn.text="All";
//    	optn.value="";
//    	document.getElementById(cmbDropDown).options.add(optn);
    }
    else
    {
    	optn.text="None";
    	optn.value="";
    	document.getElementById(cmbDropDown).options.add(optn);
    }
    
    if(lsval!="")
    {
      
        arReceived = lsval.split("^^^");
        for(i=0;i<arReceived.length-1;i++)
        {
            arToBind = arReceived[i].split("|");
            optn = document.createElement("option");
            optn.text=arToBind[0];
            optn.value=arToBind[1];
            document.getElementById(cmbDropDown).options.add(optn);
        }
    }
}

function fnOpenWindow(url,Height,Width)
{
   // alert("yes");
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
	
    url=url.replace(".", "$");
    //var position = "dialogWidth="+Width+"px;dialogHeight="+Height+"px;scroll=yes;";
    //position = position +"status:no;";
    //var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url="+url+"&Height="+Height+"&Width="+Width,null,position);
    
    if(window.showModalDialog)
    {
    	var position = "dialogWidth="+Width+"px;dialogHeight="+Height+"px;scroll=yes;";
	    position = position +"status:no;";
	    var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url="+url+"&Height="+Height+"&Width="+Width,null,position);
    }
    else
    { 
	    var position = "width="+Width+",height="+Height+",status=no";
	    
	    var rtnvalue = window.open("PopOverlay.aspx?Url="+url+"&Height="+Height+"&Width="+Width,"pop",position);
	    rtnvalue.moveTo((window.screen.width / 2) - (Width / 2), (window.screen.height / 2) - (Height / 2));

    }
    
    
    try
    {
        document.getElementById("Layer1").focus();
        getdata('','','','refresh');
    }
    catch(ers)
    {
        
    }
    return true;
    
}



function fnOpenWindowUpdated(url, Height, Width) {

    var rtnvalue; var position;
    //url=url.replace(".", "$");
    // modified by premkumar on 13Feb17
    if (window.showModalDialog) {
        url = url.replace(".", "$");
        position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=yes;";
        position = position + "status:no;";
        rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);
        //alert(rtnvalue);
    }
    else {
        position = "width=" + Width + ",height=" + Height + ",status=no";
        //var rtnvalue = window.open("PopOverlay.aspx?Url="+url+"&Height="+Height+"&Width="+Width,"pop",position); //Mukesh changed "pop" as null on 22/03/2017           
        rtnvalue = window.open(url, "_blank", position);

        //alert(rtnvalue);
    }

    try {
        document.getElementById("Layer1").focus();
        getdata('', '', '', 'refresh');
    }
    catch (ers) {

    }
    return true;
}



function fnOpenWindowGridRefreshUpdated(url, Height, Width) {

    var rtnvalue; var position;
    //url=url.replace(".", "$");
    // modified by premkumar on 13Feb17
    if (window.showModalDialog) {
        url = url.replace(".", "$");
        position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=yes;";
        position = position + "status:no;";
        rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);
        grid.Refresh();
        //alert(rtnvalue);
    }
    else {
        position = "width=" + Width + ",height=" + Height + ",status=no";
        //var rtnvalue = window.open("PopOverlay.aspx?Url="+url+"&Height="+Height+"&Width="+Width,"pop",position); //Mukesh changed "pop" as null on 22/03/2017           
        rtnvalue = window.open(url, "_blank", position);

        //alert(rtnvalue);
    }

    try {
        document.getElementById("Layer1").focus();
        getdata('', '', '', 'refresh');
    }
    catch (ers) {

    }
    return true;
}


function fnOpenWindow_OneStepBack(url,Height,Width)
{
    url = url.replace(".", "$");

    if (window.showModalDialog) {
        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;";
        position = position + "status:no;scrollbar=no;";
        var rtnvalue = window.showModalDialog("../PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);
    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";
        var rtnvalue = window.open("../PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, "pop", position);
        rtnvalue.moveTo((window.screen.width / 2) - (Width / 2), (window.screen.height / 2) - (Height));
        //rtnvalue.moveTo((window.screen.width / 2) - (Width / 2), (window.screen.height / 2) - (Height / 2));
    }

    try {
        document.getElementById("Layer1").focus();
        getdata('', '', '', 'refresh');
    }
    catch (ers) {
        try {
            document.all.cmbfield.focus();
        }
        catch (eers) {
        }
    }
    try {
        getdata('', '', '', 'refresh');
    }
    catch (exc) {
    }
    return true;
}



//Following Function is To Avoid Copy and Paste...
function noCopyMouse(e)
{
    var isRight = (e.button) ? (e.button == 2) : (e.which == 3);
    if(isRight)
    {
//        alert('Copy & Paste is Restricted!'); 
        return false;
    }
    return true;
}
function noCopyKey(e)
{
    var forbiddenKeys = new Array('c','x','v');
    var keyCode = (e.keyCode) ? e.keyCode : e.which;
    var isCtrl;
    if(window.event)
    isCtrl = e.ctrlKey
    else
    isCtrl = (window.Event) ? ((e.modifiers & Event.CTRL_MASK) == Event.CTRL_MASK) : false; 
    if(isCtrl)
    {
        for(i = 0; i < forbiddenKeys.length; i++)
        {
            if(forbiddenKeys[i] == String.fromCharCode(keyCode).toLowerCase())
            {
//                alert('Copy & Paste is Restricted');
                return false;
            }
        }
    }
    return true;
}


function dx_isempty(obj, name) {
    if (obj.GetText() == "") {
        alert(name + " Can't be Empty....");
        obj.Focus();
        return false
    }
    else {
        var n = obj.GetText().length;
        flg = false
        for (i = 0; i < n; i++) {
            if (obj.GetText().charCodeAt(i) == 32)
                flg = true
            else {
                flg = false
                break
            }
        }
        if (flg) {
            alert(name + " Can't be Empty....")
            obj.SetText('')
            obj.Focus();
            return false
        }
        else
            return true
    }
}
function dx_isempty_comb(obj, name) {
    if (obj.GetValue() == null) {
        alert(name + " Can't be Empty....");
        obj.Focus();
        return false;
    }
    else {
        return true;
    }
}

// To Call the above Function
//    Textbox1.Attributes.Add("onmousedown", "return noCopyMouse(event);") 
//    Textbox1.Attributes.Add("onkeydown", "return noCopyKey(event);")
 
////////addded by chandrasekar for contact (department and designation add)

function fnOpenWindowOpp(url, Height, Width) {

    var rtnvalue; var position;
    //url=url.replace(".", "$");
    // modified by premkumar on 13Feb17
    if (window.showModalDialog) {
        url = url.replace(".", "$");
        position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=yes;";
        position = position + "status:no;";
        rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);
        //alert(rtnvalue);
    }
    else {
        position = "width=" + Width + ",height=" + Height + ",status=no";
        //var rtnvalue = window.open("PopOverlay.aspx?Url="+url+"&Height="+Height+"&Width="+Width,"pop",position); //Mukesh changed "pop" as null on 22/03/2017           
        rtnvalue = window.open(url, "_blank", position);

        //alert(rtnvalue);
    }

    try {
        document.getElementById("Layer1").focus();
        getdata('', '', '', 'refresh');
    }
    catch (ers) {

    }
    return true;
}
function fnOpenWindowIns(url, Height, Width) {
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }

   // url = url.replace(".", "$");
    //var position = "dialogWidth="+Width+"px;dialogHeight="+Height+"px;scroll=yes;";
    //position = position +"status:no;";
    //var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url="+url+"&Height="+Height+"&Width="+Width,null,position);
    alert(url)
    if (window.showModalDialog) {
        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=yes;";
        position = position + "status:no;";
        var rtnvalue = window.showModalDialog(url + "&Height=" + Height + "&Width=" + Width, null, position);
    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";

        var rtnvalue = window.open(url + "&Height=" + Height + "&Width=" + Width, "pop", position);
        rtnvalue.moveTo((window.screen.width / 2) - (Width / 2), (window.screen.height / 2) - (Height / 2));
    }


    try {
        document.getElementById("Layer1").focus();
        getdata('', '', '', 'refresh');
    }
    catch (ers) {

    }
    return true;
}

function checkstring(obj)
{
   
    var specialchars = "`~#%^&+=|'><*"
    var retval;
    var inobj, message;
    inobj = obj;
    a = inobj.value;
    if (a == "") {
        return;
    }
    l = a.length;
    retval = "";
    for (i = 0; i < l; i++)
    {
        if (specialchars.indexOf(a.charAt(i)) == -1) {
            if (a.charCodeAt(i) != 34) {
                retval = retval + a.charAt(i)
            }
        }
    }
    inobj.value = retval;
    return;
}

