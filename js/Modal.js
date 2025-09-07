function closemodal(x)
{
    
   // alert("yes" + x);
    window.parent.closeModal(x);
}

window.closeModal = function (x) {
    if (x == "Service") {
        $("#objServiceRequest").attr("data", "Loading.aspx");
        $('#ServiceRequestModals').modal('hide');
    }
    else if (x == "Account") {
        $("#objAccount").attr("data", "Loading.aspx");
        $('#AccountModal').modal('hide');
    }
    else if (x == "ServiceRequestSummary") {
        //  alert("yes");
        $("#objServiceSummary").attr("data", "Loading.aspx");
        $("#ServiceSummaryModel").modal("hide");
    }
    else if (x == "ServiceRequest") {
        //  alert("yes");
        $("#objServiceRequest").attr("data", "Loading.aspx");
        $('#ServiceRequestModel').modal('hide');
    }
    else if (x == "AccountSummary") {
        $("#objAccountModal").attr("data", "Loading.aspx");
        $('#AccountModal').modal('hide');
    }
    else if (x == "Installation") {
        $("#objInstallation").attr("data", "Loading.aspx");
        $('#Installationmodel').modal('hide');

    }
    else if (x == "InstallationDetail") {
        $("#objInstallationDetail").attr("data", "Loading.aspx");
        $('#InstallationDetailModal').modal('hide');
    }
    else if (x == "ServiceRequests") {

        $("#objNewSRModals").attr("data", "Loading.aspx");
        $('#NewSRModals').modal('hide');
    }
    else if (x == "Addpurchase") {
        $("#objAddinstall").attr("data", "Loading.aspx");
        $("#AddinstallModals").modal("hide");
    }
    else if (x == "AccountSubhomepage") {
        $('#objAddAccModals').attr("data", "Loading.aspx")
        $('#AddAccModals').modal('hide');
    }
    else if (x == "AccMast") {
        $('#objAddAccount').attr("data", "Loading.aspx");
        $('#AddAccountModals').modal('hide');
    }

    else if(x == "PMfollow")
    {
        $("#objPMCalssDetail").attr("data", "Loading.aspx");
        $('#PMCallsDetailModal').modal('hide');
    }
    else if (x == "pmfollowupsubhome")
    {
       
        $("#objpmcallmodel").attr("data", "Loading.aspx");
        $('#pmcallmodel').modal('hide');
    }
    else if (x == "pmallocationsubhome")
    {

        $("#objpmcallmodel").attr("data", "Loading.aspx");
        $('#pmcallmodel').modal('hide');
    }
    else if (x == "PMallocationsummary")
    {
        
        $("#objPMCalssDetail").attr("data", "Loading.aspx");
        $('#PMCallsDetailModal').modal('hide');
    }
   
    //else if (x == "InstallationSubhome") {
    //    //Sales Order sub modal in Addpurchase
    //    //Not in use By deepak on 08JUN2018
    //    alert("yes");
    //    $("#objAddPurchase").attr("data", "Loading.aspx");
    //    $('#AddPurchaseModal').modal('hide');

    //}
    //else if (x == "ServiceRequest") {
    //    alert("YES");
    //    $('#ObjAddContact').attr("data", "Loading.aspx");
    //    $('#AddContactmodals').modal('hide');
    //}

}