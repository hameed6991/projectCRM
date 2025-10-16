<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceRequest.aspx.cs" Inherits="apa_pack.ServiceRequest" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    

        <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>      
    <script src="http://someothersite.com/external.js"></script>

    <link href="css/home.css" rel="stylesheet" />
    <link href="css/CommonStyles.css" rel="stylesheet" />

<style type="text/css">
 
    #AccAddicon{
       /* font-size: 25px;
        padding:0px;
        margin-left: -30px;*/
       letter-spacing: 05px;
    }
   /* #AccAddBun{
        height:25px;
        width: 100px;
        padding:0px;
        margin-top: 10px;
        margin-left:80px;
        text-indent: -2px;
        border-radius:3px;
        font-size: small;
        transition:transform 0.2s ease;
    }*/
    #AccAddBun:active{
        transform:scale(0.96);
    } 
  

    #main{
        /*align-items:center;
        align-content:center;
        align-self:center;*/
        vertical-align: middle;
    }
 
    

 

</style>





                                                                                              <%-- SCRIPT  START --%>

<script type="text/javascript">

    function AddServiceRequest()
    {
        /*alert("Add Account Screen")*/

        //Retvals = window.open("AddContacts.aspx?contid=" +"0000000746"+"&logid="+"dvfzds452lf0wzy1ebe0xl45AA698388"+"&Frm=home&Module=AccountSummary"+ null, "Width=500,Height=350,scroll=no;")

        //Retvals = window.open("../AddInstallation.aspx?", null, "width=1300,height=700");
        //Retvals.moveTo((window.screen.width / 2) - (1200 / 2), (window.screen.height / 2) - (600 / 2));

        //var URL = "../AddInstallation.aspx?From=Installation";

        //$('#objInstallSummaryModal').attr("src", URL);
        //$('#InstallSummaryModal').modal('show');

        var URL = "AddServiceRequest.aspx?From=ServiceRequest";
        
        window.location = URL;

 
    }

    



    function OpenpopupModal(InsCode) {

            //alert(InsCode)
             
 
        var URL = "../ServiceRequestSummary.aspx?Sr=" + InsCode + "&From=Installation";

        $('#objInstallSummaryModal').attr("src", URL);
        $('#InstallSummaryModal').modal('show');

             
    }

    function CallInsFollowUp(InsCode,From) {

        //alert(From)

        if (From == "Followup") {

            var URL = "../ServiceRequestSummary.aspx?sr=" + InsCode + "&From=" + From;

            $('#objInstallFollowUp').attr("src", URL);
            $('#InstallFollowUp').modal('show');

        }

        if (From == "Closure") {

            var URL = "../InstallFollowUp.aspx?InstallCode=" + InsCode + "&From=" + From;

            $('#objInstallFollowUp').attr("src", URL);
            $('#InstallFollowUp').modal('show');

        }

        
    }


    //function onMouseOver(rowIndex) {
    //    //alert(rowIndex)
    //    var gv = document.getElementById("GridviewAccountSummary");
    //    var rowElement = gv.rows[rowIndex];
    //    rowElement.style.backgroundColor = "#ffffff";
    //    rowElement.style.border = "solid 1px #00BFFF";
    //    //rowElement.cells[1].style.backgroundColor = "green";
    //}

    //function onMouseOut(rowIndex) {
    //    var gv = document.getElementById("GridviewAccountSummary");
    //    var rowElement = gv.rows[rowIndex];
    //    rowElement.style.backgroundColor = "#ffffff";
    //    rowElement.style.border = "";
    //    //rowElement.cells[1].style.backgroundColor = "#fff";
    //}


</script>

    


</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    <div style="background-color:#eceeef;padding:0px;">
        <div id="main" class="col-md-12">

            <%--MAIN--%>
            <div class="row border-bottom" style="padding:10px 30px;">
                <div id="main_sub2_div" class="col-md-12 bg-light">

                    <div class="col-md-1 BarTitle">
                        Service 
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
                            <button id="AccAddBun" class="btn btn-warning CommonButton" type="button" onclick="AddServiceRequest()"><i id="AccAddicon" class="bi bi-plus"></i>New Ticket </button>
                        </span>
                        <span>
                            <img src="../images/ShortCut.svg" style="cursor: pointer;" /></span>

                        <span>
                            <img src="../images/Refresh.svg" style="cursor: pointer;" /></span>
                    </div>



                </div>
            </div>


            <div class="scrollable-content" style="background: #fff!important; padding: 0px 10px;">
                <div class="row border-bottom">
                    <div id="Grid_div" class="col-md-12" style="background-color: #fff;">

                        <div class="gridview-container">

                            <asp:UpdatePanel ID="updatePanel1" runat="server">
                                <ContentTemplate>
                                    <%--CssClass="table table-striped table-bordered table-hover" --%>
                            <asp:GridView ID="GridviewInstallSummary" runat="server"
    Style="width:100%" CssClass="table table-hover"
    AutoGenerateColumns="false" AllowPaging="true" PageSize="20"
    OnPageIndexChanging="Gridincomeviewdetails_PageIndexChanging">

    <Columns>

        <asp:TemplateField HeaderText="Actions" HeaderStyle-Width="50" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="#" onclick='<%# "javascript:CallInsFollowUp(\"" + Eval("DocketNo") +  "\",\"" + "Followup" + "\");return false;" %>'>
                    <img src="../images/FollowUp.svg" width="18" height="18" />
                </a>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText=" " HeaderStyle-Width="50" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="#" onclick='<%# "javascript:CallInsFollowUp(\"" + Eval("DocketNo") +  "\",\"" + "Closure" + "\");return false;" %>'>
                    <img src="../images/Closure.svg" width="20" height="20" />
                </a>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Docket No">
            <ItemTemplate>
                <asp:HyperLink ID="lnkDocket" runat="server" CssClass="GridFirstColumnStyle"
                    Text='<%# Eval("DocketNo") %>'
                    NavigateUrl="#" 
                    onclick='<%# "javascript:OpenpopupModal(\"" + Eval("DocketNo") + "\");return false;" %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField HeaderText="Account" DataField="Account" ItemStyle-Width="200px" />

        <asp:TemplateField HeaderText="Address">
            <ItemTemplate>
                <div style="width: 150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                    <asp:Label ID="lblAddr" runat="server" Text='<%# Eval("Address") %>'
                               ToolTip='<%# Eval("Address") %>' />
                </div>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField HeaderText="Product" DataField="Product" />
        <asp:BoundField HeaderText="Call Date" DataField="CallDate" />
        <asp:BoundField HeaderText="Serial No" DataField="SerialNo" />
        <asp:BoundField HeaderText="Site" DataField="Site" ItemStyle-Width="150px" />
        <asp:BoundField HeaderText="Substatus" DataField="SubStatus" ItemStyle-Width="150px" />
    </Columns>
</asp:GridView>


                                    <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True"); %>"
                                    SelectCommand=" Select InstallCode from purchase">

                                </asp:SqlDataSource>--%>

                                    <p>
                                        <label id="lbl_RowCount">Test</label>
                                    </p>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
            </div>
            <%--style="height:300px;width:800px!important;"--%>


            <!-- Modal -->
            <div>
 
                <!-- Modal -->
            <div class="modal fade" id="InstallSummaryModal" role="dialog"  >
       
                <div class="modal-dialog InstallSummary-content" style="width: 90%;">
 
                    <!-- Modal content-->
                    <div class="modal-content InstallSummary-content" style="width:1300px; height:700px;margin-left: -400px;margin-top: 100px;border: 3px solid #1e2f97;border-radius: 5px; ">
                        <div class="modal-body AccountSummary-body">
                            <div style="text-align: right;">
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="border:none;background-color:white; height:25px;width:25px;" >
                                 <img src="../images/Cancel.png" width="25" height="25" style="margin-left: -10px;" />
                            </button>
                                </div>

                            
                             
                            <iframe id="objInstallSummaryModal" src="" style="width: 100%; border-width: 0px; height: 90%;display:block;margin-top:2px;overflow:scroll;" >Your browser doesn’t support the object tag. 
                            </iframe>

                        </div>
                    </div>

                </div>
            </div>
 
            </div>



            <!-- Follow Up Modal -->
            <div>
 
                <!-- Modal -->
            <div class="modal fade" id="InstallFollowUp" role="dialog"  >
       
                <div class="modal-dialog InstallSummary-content" style="width: 90%;">
 
                    <!-- Modal content-->
                    <div class="modal-content InstallSummary-content" style="width:1300px; height:700px;margin-left: -400px;margin-top: 100px;border: 3px solid #1e2f97;border-radius: 5px; ">
                        <div class="modal-body AccountSummary-body">
                            <div style="text-align: right;">
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="border:none;background-color:white; height:25px;width:25px;" >
                                 <img src="../images/Cancel.png" width="25" height="25" style="margin-left: -10px;" />
                            </button>
                                </div>

                            
                             
                            <iframe id="objInstallFollowUp" src="" style="width: 100%; border-width: 0px; height: 90%;display:block;margin-top:2px;overflow:scroll;" >Your browser doesn’t support the object tag. 
                            </iframe>

                        </div>
                    </div>

                </div>
            </div>
 
            </div>




        </div>
    </div>

      
     <%--HIDDEN FIELD--%>
    <%-- <asp:HiddenField id="hdnAccCode" runat="server" />--%>
     <input type="hidden" id="hdnAccCode"  />




</asp:Content>
