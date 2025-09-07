
var Lactivitycode = ""


$(document).ready(function () {
    $(".nav-tabs a").click(function () {
        $(this).tab('show');
    });
});


//function fnOpenEdit()
//{
//   var url="mdservicerequest.aspx?srno=" + document.all.hdnSRNo.value + "&Summary=True&logid=" + document.all.logid.value;
//    //window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;
//   //$("#objServiceSummary").attr("data", url);
//   //$("#ServiceSummaryModel").modal("show");

//   //$('#ServiceSummaryModel').on('hidden.bs.modal', function () {
//   //    window.location = "srSummaryNew.aspx?SrNo=" + document.all.hdnSRNo.value;
//   //})
//   window.location = url;
//}

function fnOpenAllocateToEng() {

    var rtnvalues, url, Height, Width;
    var Lmode = "summary"

    url = "AddDispatch.aspx?srno=" + document.all.hdnSRNo.value + "&Frm=ServiceRequestSummary";// + "&logid=" + document.all.logid.value;

   /* Height = "550";
    Width = "1000";//900
    if (window.showModalDialog) {
        url = url.replace(".", "$");

        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=no;";
        position = position + "status:no;";
        var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);


        //window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;

    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";
        var rtnvalue = window.open(url, "_blank", position);

       // window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;



    }*/

   // $("#objServiceSummary").attr("data", "");

    $("#objServiceSummary").attr("data", url);
    $("#ServiceSummaryModel").modal("show");

    $('#ServiceSummaryModel').on('hidden.bs.modal', function () {
        window.location = "srSummaryNew.aspx?SrNo=" + document.all.hdnSRNo.value;
    })



    //  return true;
}


function fnOpenFollowup() {
    var rtnvalues, url, Height, Width;
    var Lmode = "summary"


    url = "AddFollowup.aspx?srno=" + document.all.hdnSRNo.value + "&activitycode=" + Lactivitycode + "&Frm=ServiceRequestSummary";//+ "&logid=" + document.all.logid.value

 /*   Height = "350";//700
    Width = "1000";//900
    if (window.showModalDialog) {
        url = url.replace(".", "$");

        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=no;";
        position = position + "status:no;";
        var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);


       // window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;

    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";
        var rtnvalue = window.open(url, "_blank", position);


       // window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;

 }      */


   // $("#objServiceSummary").attr("data", "");

    $("#objServiceSummary").attr("data", url);
    $("#ServiceSummaryModel").modal("show");

    $('#ServiceSummaryModel').on('hidden.bs.modal', function () {
        window.location = "srSummaryNew.aspx?SrNo=" + document.all.hdnSRNo.value;
    })


}

//function fnOpenSRClosure() {
  
//    if (document.getElementById("hdnEngineer").value == "") {
//        alert("Engineer cannot be empty");
//        return false;
//    }
//    else {
//        //For PM calls closure screen will get differ from complaint call closure.Dec 01,2017

//        /*    Commented By Deepak on 18May2018
//        if (document.all.hdncalltype.value == "PM") {
//            WinVal = fnOpenWindowUpdated("PMclosure.aspx?JS=False&srno=" + document.all.hdnSRNo.value + "&Summary=True&RedirectedFrom=ServiceRequest&logid=" + document.all.logid.value, "660", "1000");//935//+ "&logid=" + document.all.logid.value
//        }
//        else {
//            WinVal = fnOpenWindowUpdated("AddClosureActivity.aspx?JS=False&srno=" + document.all.hdnSRNo.value + "&Summary=True&RedirectedFrom=ServiceRequest&activitycode=" + Lactivitycode + "&logid=" + document.all.logid.value, "660", "1000");//935//logid=" + document.all.logid.value + "&
//        }

       
//        window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;*/

//        if (document.all.hdncalltype.value == "PM") {
//            var url = "PMclosure.aspx?JS=False&srno=" + document.all.hdnSRNo.value + "&Summary=True&RedirectedFrom=ServiceRequest&logid=" + document.all.logid.value + "&Frm=ServiceRequestSummary";

//         //   $("#objServiceSummary").attr("data", "");

//            //$("#objServiceSummary").attr("data", url);
//            //$("#ServiceSummaryModel").modal("show");

//            //$('#ServiceSummaryModel').on('hidden.bs.modal', function () {
//            //    window.location = "srSummaryNew.aspx?SrNo=" + document.all.hdnSRNo.value;
//            //})


//        }
//        else {
//            var url = "AddClosureActivity.aspx?JS=False&srno=" + document.all.hdnSRNo.value + "&Summary=True&RedirectedFrom=ServiceRequest&activitycode=" + Lactivitycode + "&logid=" + document.all.logid.value + "&Frm=ServiceRequestSummary";

//          //  $("#objServiceSummary").attr("data", "");

//            //$("#objServiceSummary").attr("data", url);
//            //$("#ServiceSummaryModel").modal("show");

//            //$('#ServiceSummaryModel').on('hidden.bs.modal', function () {
//            //    window.location = "srSummaryNew.aspx?SrNo=" + document.all.hdnSRNo.value;
//            //})


//        }
//        window.location = url;

//    }


//}

function fnOpenRMARequest() {
  
    var rtnvalues, url, Height, Width;
    var Lmode = "summary"

    //url = "addsrRMARequestnew.asp?SRNo=" + document.all.hdnSRNo.value + "&From=service&Frm=ServiceRequestSummary";//&logid=" + document.all.logid.value;
    url = "PopOverlay.aspx?Url=addsrRMARequestnew.asp?SRNo=" + document.all.hdnSRNo.value+"&logid=" + document.all.logid.value + "&From=service&Frm=ServiceRequestSummary";//&logid=" + document.all.logid.value;


   // alert(url);
  /*  Height = "600";
    Width = "920";//900
    if (window.showModalDialog) {
        url = url.replace(".", "$");

        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=no;";
        position = position + "status:no;";
        var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);


       // window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;

    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";
        var rtnvalue = window.open(url, "_blank", position);

      //  window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;
    }*/

  //  $("#objServiceSummary").attr("data", "");

    $("#objServiceSummary").attr("data", url);
    $("#ServiceSummaryModel").modal("show");


    $('#ServiceSummaryModel').on('hidden.bs.modal', function () {
        window.location = "srSummaryNew.aspx?SrNo=" + document.all.hdnSRNo.value;
    })


}



function fnOpenSparesUsed(PartID,Mode) {


    var rtnvalues, url, Height, Width;
    var Lmode = "summary"


    if (Mode=="Add")
        url = "Addspartscon.aspx?srno=" + document.all.hdnSRNo.value + "&Product=" + document.all.hdnproduct.value + "&Frm=ServiceRequestSummary&Mode=Add";// + "&logid=" + document.all.logid.value;
    else if (Mode == "Edit")
        url = "Addspartscon.aspx?srno=" + document.all.hdnSRNo.value + "&Product=" + document.all.hdnproduct.value + "&Frm=ServiceRequestSummary&ID=" + PartID + "&Mode=Edit";// + "&logid=" + document.all.logid.value;


    /* Commented By Deepak on 21/05/2018

    Height = "410";
    Width = "1050";//720
    if (window.showModalDialog) {
        url = url.replace(".", "$");

        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=no;";
        position = position + "status:no;";
        var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);


      //  window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;

    }
    else {
        var position = "width=" + Width + ",height=" + Height + ",status=no";
        var rtnvalue = window.open(url, "_blank", position);

      //  window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;

    }*/


   // $("#objServiceSummary").attr("data", "");

    $("#objServiceSummary").attr("data", url);
    $("#ServiceSummaryModel").modal("show");



    $('#ServiceSummaryModel').on('hidden.bs.modal', function () {
        window.location = "srSummaryNew.aspx?SrNo=" + document.all.hdnSRNo.value;
    })


}
function SparesUsedclose(x) {
    
    $("#objServiceSummary").attr("data", "Loading.aspx");
    $('#ServiceSummaryModel').modal('hide');
}


//function fnOpenQuotationReq() {

  
//    var rtnvalues, url, Height, Width;
//    var Lmode = "summary"

//    //url = "AddSQuotation.asp?Refcode=" + document.all.hdnSRNo.value + "&Reftype=service request&cancelbut=remove&Summary=True&logid=" + document.all.logid.value+"&Frm=ServiceRequestSummary";
//    url = "PopOverlay.aspx?Url=AddSQuotation.asp?Refcode=" + document.all.hdnSRNo.value + "&Reftype=service request&cancelbut=remove&Summary=True&logid=" + document.all.logid.value + "&Frm=ServiceRequestSummary&Height=700";


//    //By koripriyan Height = "620";

//    /* Commented By Deepak on 21May2018 
//    Height = "620";
//    //Width = "820";

//    Width = "1070";

//    if (window.showModalDialog) {
//        url = url.replace(".", "$");

//        var position = "dialogWidth=" + Width + "px;dialogHeight=" + Height + "px;scroll=no;";
//        position = position + "status:no;";
//        var rtnvalue = window.showModalDialog("PopOverlay.aspx?Url=" + url + "&Height=" + Height + "&Width=" + Width, null, position);


//      //  window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;

//    }
//    else {
//        var position = "width=" + Width + ",height=" + Height + ",status=no";
//        var rtnvalue = window.open(url, "_blank", position);
//      //  window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;



//    }
//    */
//   // $("#objServiceSummary").attr("data", "");

//    $("#objServiceSummary").attr("data", url);
//    $("#ServiceSummaryModel").modal("show");

//    $('#ServiceSummaryModel').on('hidden.bs.modal', function () {
//        window.location = "srSummaryNew.aspx?SrNo=" + document.all.hdnSRNo.value;
//    })


//}

//function fnOpenAttachments()
//{
//    fnOpenWindowUpdated("PopSaveAttachment.asp?srno=" + document.all.hdnSRNo.value + "&Summary=True&logid=" + document.all.logid.value, 270, 550)
//    window.location = "srSummary.aspx?srno=" + document.all.hdnSRNo.value;
//}


//function fnPopAttachment(traveltype) {

//    //  var retval;            
//    //  fnOpenWindowOpp("Attachments.aspx?EnqNo=" + document.all.hdnAccCode.value + "&logid=" + document.all.logid.value + "&TravelType=" + traveltype + "&From=AccountSummary", "300", "500");

//    var url = "Attachments.aspx?EnqNo=" + document.all.hdnSRNo.value + "&logid=" + document.all.logid.value + "&TravelType=" + traveltype + "&From=SrSummaryNew";

//    //var url = "Attachments.aspx?EnqNo=" + document.all.hdnSRNo.value + "&logid=" + document.all.logid.value + "&TravelType=&From=SrSummaryNew", "300", "500" ;

//    $("#objAttachmentModal").attr("data", "");
//    $("#objAttachmentModal").attr("data", url);
//    $('#AttachmentModal').modal('show');

//}