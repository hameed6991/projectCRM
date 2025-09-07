<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo.aspx.cs" Inherits="apa_pack.demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
     

    <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>      
    <script src="http://someothersite.com/external.js"></script>



    <script type="text/javascript" >



        function OpenpopupModal() {

 
            var URL = "../EditAccount.aspx?AccCode=";
 
            $('#objAccountSummaryModal').attr("src", URL);
            $('#AccountSummaryModal').modal('show');
            
       
        }
        //$(document).ready(function () {

        //    $('#ModalBtn').on('click', function () {
                
        //        $('#AccountSummaryModal').modal('show') 
        //    })

        //})


        function closemodal(x) {

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

            else if (x == "PMfollow") {
                $("#objPMCalssDetail").attr("data", "Loading.aspx");
                $('#PMCallsDetailModal').modal('hide');
            }
            else if (x == "pmfollowupsubhome") {

                $("#objpmcallmodel").attr("data", "Loading.aspx");
                $('#pmcallmodel').modal('hide');
            }
            else if (x == "pmallocationsubhome") {

                $("#objpmcallmodel").attr("data", "Loading.aspx");
                $('#pmcallmodel').modal('hide');
            }
            else if (x == "PMallocationsummary") {

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

    </script>
   
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-default" id="ModalBtn" data-toggle="modal" data-target="#myModal" onclick="OpenpopupModal()"  >
                Launch demo modal
            </button>

          <%--  <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    ...
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                  </div>
                </div>
              </div>
            </div>--%>




            <%--<div>

                <button type="button" class="close" onclick="OpenpopupModal();">&times;Open Popup Modal</button>

            </div>

   

        </div>--%>

                    <!-- Modal Popup--> 
            <div class="modal fade" id="AccountSummaryModal" role="dialog" >
       
                <div class="modal-dialog AccountSummary-content" style="width: 90%;">
                   
                    <!-- Modal content-->
                    <div class="modal-content AccountSummary-content" style="width:1300px; height:700px;margin-left: -400px;margin-top: 100px;border: 3px solid #1e2f97;border-radius: 5px;">
                        <div class="modal-body AccountSummary-body">

                            <div style="text-align: left;">
                                <div class="container">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Account Info</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Contact info</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link disabled" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Contact</button>
                                    </li>
                                </ul>
                               <%-- <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">...</div>
                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>
                                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
                                </div>--%>
                                </div>
                            </div>
                             
                            <iframe id="objAccountSummaryModal" src="" style="width: 100%; border-width: 0px; height: 90%;">Your browser doesn’t support the object tag. 
                            </iframe>

                        </div>
                    </div>

                </div>
            </div>


    </form>
</body>
</html>
