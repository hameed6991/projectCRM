<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SampleSummary.aspx.cs" Inherits="apa_pack.SampleDesign.SampleSummary" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sample Summary</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">


      <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>      
    <script src="http://someothersite.com/external.js"></script>

    <link href="../css/home.css" rel="stylesheet" />
    <link href="../css/CommonStyles.css" rel="stylesheet" />


  <style>

      /* Scrollable content area */
.scrollable-content1 {
    position: absolute;
    top: 0px;
    bottom: 0;
    left: 0;
    right: 0;
    overflow-y: auto;
    padding: 20px;
    /* background: #f2f2f2; */
}


   <%--For over small strucher Style start--%>
    body {
      background: #fff!important;
      font-family: poppins;
     
    }
    .card {
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
    }
    p{
        margin:5px!important;
    }
    .section-title {
      font-size: 1rem;
      font-weight: 700;
      margin-bottom: .5rem;
      font-family: poppins;
    }
    .status-open {
      background: #ffefc5;
      padding: 2px 8px;
      border-radius: 8px;
      font-size: 0.8rem;
      font-weight: 600;
      color: #8a6d00;
    }
    .ticket-status-step {
      display: flex;
      align-items: center;
      margin-bottom: 1rem;
    }
    .ticket-status-step span {
      margin-left: 8px;
    }
    @media (max-width: 768px) {
      .card-body {
        padding: 1rem;
      }
    }
    <%--For over small strucher Style end--%>



      .SDvalusLable {
          text-align: right;
          font-weight: 600;
          color: #000000;
          font-feature-settings: 'liga' off, 'clig' off;
          font-family: Poppins;
          font-size: 12px;
          font-style: normal;
      }
      .SDHeaderLable {
          text-align: left;
          font-weight: 500;
          color: #000000;
          font-feature-settings: 'liga' off, 'clig' off;
          font-family: Poppins;
          font-size: 12px;
          font-style: normal;
      }
      .ActionBtn {
          text-align: left;
          font-weight: 500;
          color: #000000;
          font-feature-settings: 'liga' off, 'clig' off;
          font-family: Poppins;
          font-size: 12px;
          font-style: normal;
          width: 200px;
          text-align: center;
          display: flex;
          gap: 10px;
          justify-content: center;
      }
      .ActionBtn:hover {
          color: #000000!important;
          background-color: #FFDB7A!important;
          border-color: #FFDB7A!important;
      }
      .btn:active {
          color: #000000!important;
          background-color: #FFDB7A!important;
          border-color: #FFDB7A!important;
      }


  </style>

     
    <%--For Sample Status Style start--%>

    <style type="text/css">


        .dot {
            height: 15px;
            width: 15px;
            background-color: #ccc;
            border-radius: 50%;
            display: inline-block;
        }

        .big-dot {
            height: 25px;
            width: 25px;
        }

        .active-dot {
            background-color: #488978 !important; /* green */
        }

        .track-line {
            height: 2px;
            background-color: #ccc;

        }

        .track-line-active {
            height: 2px;
            background-color: #488978;
            opacity: 1;
        }

        </style>

    <%--For Sample Status Style End--%>
 
    <script type="text/javascript">

        function CallBackPage() {

            var URL = "../SampleDesign/Samples.aspx";
            window.location = URL;
        }

    </script>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <body>



         <%--MAIN--%>
            <div class="row border-bottom" style="padding:10px 30px;">
                <div id="main_sub2_div" class="col-md-12 bg-light">

                    <div class="col-md-1 BarTitle">
                       <%-- <span>
                            <a href="#" onclick="CallBackPage()">
                                <img src="../images/Back.svg" style="cursor: pointer;" />
                            </a>
                        </span>--%>
                        Samples
                    </div>

                    <div class="col-md-3 BarObjactsLeft">
                        <span>
                            <img src="../images/SwitchFull.svg" style="cursor: pointer;" /></span>
                        <span>
                            <img src="../images/FilterNew.svg" style="cursor: pointer;" /></span>
                        <span>
                            <img src="../images/MyCallAllCall.svg" style="cursor: pointer;" /></span>
                    </div>

                    <div class="col-md-8 BarObjactsRight">
                           <span>
                            <img src="../images/Switch.svg" style="cursor: pointer;" /></span>
                        <span>
                            <button id="AccAddBun" class="btn btn-warning CommonButton" type="button" onclick="SampleRequestscreen()"><i id="AccAddicon" class="bi bi-plus"></i> Sample Request </button>
                        </span>
                        <span>
                            <img src="../images/ShortCut.svg" style="cursor: pointer;" /></span>

                        <span>
                            <img src="../images/Refresh.svg" style="cursor: pointer;" /></span>
                    </div>



                </div>
            </div>


        <div class="scrollable-content" style="background: #fff!important; padding: 0px 10px;">
            <div class="container-fluid p-10" style="padding: 0.5rem 2rem;">
                <div class="row g-3">

                    <!-- Left Column: Call Details -->
                    <div class="col-lg-3 col-md-12">
                        <div class="card p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <h6 class="section-title">Sample Details</h6>
                                <button class="btn btn-sm btn-dark CommonButton_Auto" style="align-items: center;gap: 10px;"><img src="../images/Edit.svg" style="cursor: pointer;height: 15px;width: 15px;"> Edit</button>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Sample Code: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblSampleCode" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Customer Name: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblCustomerName" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Request Date: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblRequestDate" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                           <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Contact Parsion: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblContactPerson" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Sales Executive: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblSalesExecutive" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                           <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Sample Request Type: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblSampleRequestType" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Priority: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblPriority" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                           <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Sample Description: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblSampleDescription" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Status: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblStatus" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                             <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Comments: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblComments" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Expected Order Date: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblExpectedOrderDate" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                         
                             
                            <br />
                            <hr />

                            <h6 class="section-title mt-3">Box Info</h6>

                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Box Size: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <%--<asp:Label ID="lblBoxSize" runat="server"></asp:Label>--%> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Box Type: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblBoxType" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Reel Size: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblReelSize" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Cutting Size: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblCuttingSize" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Box Weight: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblBoxWeight" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Paper Combination: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblPaperCombination" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 SDHeaderLable">
                                    <p> <span>Flute: </span> </p>
                                </div>
                                <div class="col-lg-6 col-md-6 SDvalusLable">
                                    <p> <span> <asp:Label ID="lblFlute" runat="server"></asp:Label> </span>  </p>
                                </div>
                            </div>
  
                            
                             

                            <br />
                            <hr />
                            <br />
                           <%-- <h6 class="section-title mt-3">Contact Info</h6>
                            <p> <span>Contact: Mr. Rashmikant</span> </p>
                            <p> <span>Mobile: 98745 61230</span> </p>
                            <p> <span>Designation: Manager</span> </p>--%>
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div class="col-lg-9 col-md-12">
                        <div class="card p-3 mb-3">
                            <h6 class="section-title">Actions</h6>
                            <div class="d-flex flex-wrap gap-2">
                                
                                <button class="btn btn-outline-dark btn-sm ActionBtn"><img src="../images/Followup.svg" style="cursor: pointer; height:15px;width:15px;" />Follow Up</button>
                                <button class="btn btn-outline-dark btn-sm ActionBtn"><img src="../images/Closure.svg" style="cursor: pointer; height:15px;width:15px;" />Closure</button>
                                <button class="btn btn-outline-dark btn-sm ActionBtn"><img src="../images/quotation.png" style="cursor: pointer; height:15px;width:15px;" />Quotation Request</button>
                                <button class="btn btn-outline-dark btn-sm ActionBtn"><img src="../images/attach-file.png" style="cursor: pointer; height:15px;width:15px;" />Attachment </button>
                            </div>
                        </div>

                        <div class="row g-3">
                          
 
                            <div class="col-lg-5 col-md-12">
                                
                                <div class="card p-3">
                                    <h6 class="section-title">Sample Status</h6>
                                    <br />
                                    <div class="d-flex flex-row justify-content-between align-items-center align-content-center">
                                        <span id="dot1" runat="server" class="dot"></span>
                                        <hr id="line1" runat="server" class="flex-fill track-line"/>

                                        <span id="dot2" runat="server" class="dot"></span>
                                        <hr id="line2" runat="server" class="flex-fill track-line"/>

                                        <span id="dot3" runat="server" class="dot big-dot">
                                            <i class="fa fa-check text-white"></i>
                                        </span>
                                    </div>

                                    <br />
                                    <div class="d-flex flex-row justify-content-between align-items-center align-content-center SDHeaderLable">
                                        <span class="lbl">Sample Requested</span>
                                        <span class="lbl">Sample Completed</span>
                                        <span class="lbl">Opportunity Completed</span>
                                    </div>

                                    <br />
                                    <div class="d-flex flex-row justify-content-between align-items-center align-content-center SDvalusLable">
                                        <span id="lblRequested" runat="server" class="lbl"></span>
                                        <span id="lblCompleted" runat="server" class="lbl"></span>
                                        <span id="lblOpportunity" runat="server" class="lbl"></span>
                                    </div>
                                    <br />
                                </div>
                                
                            </div>

                            <!-- Activity History -->
                            <div class="col-lg-7 col-md-12">
                                
                                <div class="card p-3">
 
                                    <h6 class="section-title">Activity History</h6>

                                    <div style="overflow-y: auto;height:230px;">

                                    <asp:Repeater ID="rptActivity" runat="server">
                                        
                                        <ItemTemplate>
                                            <div class="card p-3">
                                                
                                                <!-- Row 1: Main Activity Info -->
                                                <div class="row text-center text-md-start">
                                                    <div class="col-6 col-md-3 mb-2">
                                                        <p class="mb-1 SDHeaderLable">Activity Date</p>
                                                        <span class="p-1 SDvalusLable">
                                                            <%# Eval("ActivityDate", "{0:dd/MM/yyyy hh:mm tt}") %>
                                                        </span>
                                                    </div>
                                                    <div class="col-6 col-md-3 mb-2">
                                                        <p class="mb-1 SDHeaderLable">Activity Type</p>
                                                        <span class="p-1 SDvalusLable">
                                                            <%# Eval("ActivityType") %>
                                                        </span>
                                                    </div>
                                                    <div class="col-6 col-md-3 mb-2">
                                                        <p class="mb-1 SDHeaderLable">Quantity</p>
                                                        <span class="p-1 SDvalusLable">
                                                            <%# Eval("SuccessQuantity") %>
                                                        </span>
                                                    </div>
                                                    <div class="col-6 col-md-3 mb-2">
                                                        <p class="mb-1 SDHeaderLable">User Name</p>
                                                        <span class="p-1 SDvalusLable">
                                                            <%# Eval("UserName") %>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Row 2: Description -->
                                                <div class="row mt-3">
                                                    <div class="col-12">
                                                        <p class="mb-1 SDHeaderLable">Activity Description</p>
                                                        <span class="p-1 SDvalusLable">
                                                            <%# Eval("ActivityDescription") %>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Row 3: Duration Badge -->
                                                <div class="row mt-3">
                                                    <div class="col text-end">
                                                        <span class="badge bg-warning text-dark p-2">Total Duration : <%# GetDuration(Eval("ActivityDate")) %>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                         
                                            <br />
                                        </ItemTemplate>
                                             
                                    </asp:Repeater>

                                        </div>
                                     </div>
                            </div>
                        </div>

                        <!-- Tabs -->
                        <div class="card p-3 mt-3">
                            <ul class="nav nav-tabs">
                                <li class="nav-item"><a class="nav-link active" href="#">Activity Details</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">Closure Details</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">Spares Used</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">RMA</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">Quotation Request</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">Allocated Details</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">Attachments</a></li>
                            </ul>
                            <div class="mt-3">
                                <p> <span>Created by: Karthick</span> </p>
                                <p> <span>Engineer Name: Test APA Engineer</span> </p>
                                <p> <span>Sub Status: Allocated to Engineer</span> </p>
                                <p> <span>Action Taken: Lorem Ipsum dummy text...</span> </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Footer -->
            <div>
                <footer class="footer">
                    <div class="footer-container">
                        <!-- Left side -->
                        <div class="footer-left">
                            <span class="footer-logo">B</span>
                            <span>© 2020 Company, Inc</span>
                        </div>
                        <div class="footer-center" style="display: flex; gap: 10px;">
                            <img src="../images/FollowUp.svg" width="18" height="18" />
                            <span style="color: #000000;">Follow Up</span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <img src="../images/Closure.svg" width="18" height="18" />
                            <span style="color: #000000;">Closure   </span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <img src="../images/Print.svg" width="18" height="18" />
                            <span style="color: #000000;">Print   </span>
                        </div>
                        <!-- Right side -->
                        <div class="footer-right">
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-facebook"></i></a>
                        </div>
                    </div>
                </footer>
            </div>

        </div>


        <asp:HiddenField ID="hdnsampleCode" runat="server" />


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>


</asp:Content>
