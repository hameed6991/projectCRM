<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Samples.aspx.cs" Inherits="apa_pack.SampleDesign.Samples" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    

        <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>      
    <script src="http://someothersite.com/external.js"></script>

    <link href="../css/home.css" rel="stylesheet" />
    <link href="../css/CommonStyles.css" rel="stylesheet" />


 

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

    function SampleRequestscreen()
    {
        /*alert("Add Account Screen")*/

        //Retvals = window.open("AddContacts.aspx?contid=" +"0000000746"+"&logid="+"dvfzds452lf0wzy1ebe0xl45AA698388"+"&Frm=home&Module=AccountSummary"+ null, "Width=500,Height=350,scroll=no;")

        //Retvals = window.open("../AddInstallation.aspx?", null, "width=1300,height=700");
        //Retvals.moveTo((window.screen.width / 2) - (1200 / 2), (window.screen.height / 2) - (600 / 2));

        var URL = "../SampleDesign/SampleRequests.aspx?From=Samples";

        window.location = URL;
        //$('#objInstallSummaryModal').attr("src", URL);
        //$('#InstallSummaryModal').modal('show');

 
    }

    



    function OpenpopupModal(SampleCode) {

            //alert(InsCode)
             
 
        var URL = "../SampleDesign/SampleSummary.aspx?SampleCode=" + SampleCode + "&From=SampleEngin";

        window.location = URL;
        //$('#objInstallSummaryModal').attr("src", URL);
        //$('#InstallSummaryModal').modal('show');

             
    }

    function CallSampleFollowUp(SampleCode,From) {

        //alert(From)

        if (From == "Followup") {

             
            var URL = "../SampleDesign/SampleFollowUp.aspx?SampleCode=" + SampleCode + "&From=" + From;

            $('#objSampleFollowUp').attr("src", URL);
            $('#SampleFollowUp').modal('show');

        }

        if (From == "Closure") {

            var URL = "../SampleDesign/SampleFollowUp.aspx?SampleCode=" + SampleCode + "&From=" + From;

            $('#objSampleFollowUp').attr("src", URL);
            $('#SampleFollowUp').modal('show');

        }

        if (From == "Close Sample Follow up") {

            $('#objSampleFollowUp').attr("src", "");
            $('#SampleFollowUp').modal('hide');

        }

        
    }

    function CallSamplePrint() {
        window.print();
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


            <div class="scrollable-content" style="background: #fff!important;  padding: 0px 10px;">

                <div class="row border-bottom" style="padding: 0px 10px;">
                    <div id="Grid_div" class="col-md-12" style="background-color: #fff;">

                        <div class="gridview-container">

                            <asp:UpdatePanel ID="updatePanel1" runat="server">
                                <ContentTemplate>

                                    

                                    <%--CssClass="table table-striped table-bordered table-hover" --%>
                                    <asp:GridView ID="GridviewSampleSummary" Style="width: 100%;height:auto" CssClass="table table-hover" AutoGenerateColumns="false" ClientIDMode="Static"
                                        EmptyDataText="There are no data records to display." HeaderStyle-BackColor="#FFDB7A" RowStyle-CssClass="rowHover" HeaderStyle-BorderColor="White" RowStyle-HorizontalAlign="left" RowStyle-BackColor="#ffffff"
                                        AllowPaging="true" PageSize="19" OnPageIndexChanging="Gridincomeviewdetails_PageIndexChanging"
                                        RowStyle-Height="00" RowStyle-BorderWidth="0" runat="server"  OnRowDataBound="GridviewSampleSummary_RowDataBound" >

                                        <%--RowStyle-BorderColor="#eceeef"  
                                    BorderColor="#1e2f97"--%>

                                        <Columns>

                                            <asp:TemplateField HeaderStyle-Width="50" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="Actions">
                                                <HeaderStyle />
                                                <ItemTemplate>
                                                    <a href="#" onclick='<%# "javascript:CallSampleFollowUp(\"" +  Eval("SampleCode")  +  "\",\"" + "Followup" + "\");return false; " %>'>
                                                        <img src="../images/FollowUp.svg" width="18" height="18" /></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderStyle-Width="50" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText=" ">
                                                <HeaderStyle />
                                                <ItemTemplate>
                                                    <a href="#" onclick='<%# "javascript:CallSampleFollowUp(\"" +  Eval("SampleCode")  +  "\",\"" + "Closure" + "\");return false; " %>'>
                                                        <img src="../images/Closure.svg" width="20" height="20" /></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <%--<asp:TemplateField  HeaderStyle-ForeColor="white" HeaderText="Acccode">
                                            <ItemTemplate>
                                                <a runat="server" href='<%# Eval("Acccode", "https://localhost:44327/EditAccount.aspx?AccCode="+ Eval("Acccode")  ) %>'>
                                                    <%# Eval("Acccode") %>
                                                </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Sample Code" HeaderStyle-Width="130">
                                                <HeaderStyle />
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HLAccCode" class="GridFirstColumnStyle" runat="server" onclick='<%# "javascript:OpenpopupModal(\"" +  Eval("SampleCode")  +  "\");return false; " %>' Text='<%# Eval("SampleCode") %>' NavigateUrl="#" />
                                                </ItemTemplate>
                                                <%--<ItemTemplate>
                                                <asp:HyperLink  runat="server" Font-Size="Small" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" Text='<%# Eval("Acccode") %>' NavigateUrl="#" onclick="CallEditAccountscreen()"/> 
                                             </ItemTemplate>--%>
                                            </asp:TemplateField>

                                            <asp:BoundField HeaderText="Customer Name" DataField="CustomerName" ItemStyle-Width="10%" />

                                            <asp:TemplateField HeaderText="Request Date" HeaderStyle-Width="130">
                                                <HeaderStyle />
                                                <ItemTemplate>
                                                    <div style="width: 100px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                        <asp:Label ID="lblRequestDate" runat="server" Text='<%#Eval("RequestDate") %>' ToolTip='<%#Eval("RequestDate") %>'></asp:Label>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                           <%-- <asp:BoundField HeaderText="Contact Person" DataField="ContactPerson" />--%>
                                            <asp:BoundField HeaderText="Sales Executive" DataField="SalesExecutive" HeaderStyle-Width="130" />
                                            <asp:BoundField HeaderText="Request Type" DataField="SampleRequestType" HeaderStyle-Width="130" />
                                            <asp:BoundField HeaderText="Priority" DataField="Priority" HeaderStyle-Width="100" />
                                            <asp:BoundField HeaderText="Sub Status" DataField="SubStatus" HeaderStyle-Width="130" />

                                            <%-- <asp:BoundField HeaderText="Address" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="Address" ItemStyle-Width="350px" />--%>

                                            <asp:BoundField HeaderText="Sample Description" DataField="SampleDescription" ItemStyle-Width="200px" />
                                            <asp:BoundField HeaderText="Box Type" DataField="DesignType" ItemStyle-Width="200px" />

                                            <asp:TemplateField HeaderStyle-Width="200" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="left" HeaderText="Box Size (MM)">
                                                <HeaderStyle />
                                                <ItemTemplate>
                                                    <div style="width: 100px; text-overflow: ellipsis; white-space: nowrap;">
                                                        <asp:Label ID="lblLengthMM" runat="server" Text='<%#Eval("LengthMM") %>' ToolTip='<%#Eval("LengthMM") %>'></asp:Label> X 
                                                        <asp:Label ID="lvlWidthMM" runat="server" Text='<%#Eval("WidthMM") %>' ToolTip='<%#Eval("LengthMM") %>'></asp:Label> X
                                                        <asp:Label ID="lblHeightMM" runat="server" Text='<%#Eval("HeightMM") %>' ToolTip='<%#Eval("LengthMM") %>'></asp:Label> 
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>



                                            <asp:TemplateField HeaderStyle-Width="50" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="Expected Date">
                                                <ItemTemplate>
                                                    <div style="width: 180px; display: flex; gap: 10px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                        <a href="#" onclick='<%# "javascript:CallInsFollowUp(\"" +  Eval("SampleCode")  +  "\",\"" + "Closure" + "\");return false; " %>'>
                                                            <asp:Image ID="imgStatus" runat="server" Width="20px" Height="20px" />
                                                        </a>

                                                        <asp:Label ID="lblEllipsis1" runat="server"
                                                            Text='<%# Eval("ExpectedOrderWonDate") %>'
                                                            ToolTip='<%# Eval("ExpectedOrderWonDate") %>'></asp:Label>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                            <%-- <asp:TemplateField HeaderStyle-Width="50" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText=" Expected Date ">
                                                <HeaderStyle />
                                                <ItemTemplate>
                                                    <div style="width: 100px; display: flex; gap:10px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">

                                                         <a href="#" onclick='<%# "javascript:CallSampleFollowUp(\"" +  Eval("SampleCode")  +  "\",\"" + "Closure" + "\");return false; " %>'>
                                                        <img src="../images/Pasitive.svg" /></a>

                                                        <asp:Label ID="lblEllipsis" runat="server" Text='<%#Eval("ExpectedOrderWonDate") %>' ToolTip='<%#Eval("ExpectedOrderWonDate") %>'></asp:Label>
                                                       
                                                    </div>
                                                    
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>

                                            <asp:TemplateField HeaderStyle-Width="80" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="Print">
                                                <HeaderStyle />
                                                <ItemTemplate>
                                                    <a href="#" onclick='<%# "javascript:CallSamplePrint(\"" +  Eval("SampleCode")  +  "\",\"" + "SampleDetails" + "\");return false; " %>'>
                                                        <img src="../images/Print.svg" width="18" height="18" /></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                        </Columns>
                                    </asp:GridView>

                                    <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True"); %>"
                                    SelectCommand=" Select InstallCode from purchase">

                                </asp:SqlDataSource>--%>

                                  
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            
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
                        <div class="footer-center" style="display:flex;gap:10px;">
                            <img src="../images/FollowUp.svg" width="18" height="18" />
                            <span style="color:#000000;">Follow Up</span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <img src="../images/Closure.svg" width="18" height="18" />
                            <span style="color:#000000;">Closure   </span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <img src="../images/Print.svg" width="18" height="18" />
                            <span style="color:#000000;">Print   </span>
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
          


            <%--style="height:300px;width:800px!important;"--%>


            <!-- Modal -->
            
          <%--  <div class="modal fade" id="InstallSummaryModal" role="dialog"  >
       
                <div class="modal-dialog InstallSummary-content" style="width: 90%;">
 
                    <!-- Modal content-->
                    <div class="modal-content InstallSummary-content" style="min-width: 1300px;width:auto; height: 700px; margin-left: -400px; margin-top: 100px; border: 3px solid #78350f; border-radius: 5px; ">
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
            </div>--%>
 
             


            <!-- Follow Up Modal -->
            
                <!-- Modal -->
            <div class="modal fade" id="SampleFollowUp" role="dialog"  >
       
                <div class="modal-dialog InstallSummary-content" style="width: 90%;">
 
                    <!-- Modal content-->
                    <div class="modal-content InstallSummary-content" style="min-width: 1300px;width:auto; height: 700px; margin-left: -400px; margin-top: 100px; border: 3px solid #78350f; border-radius: 5px; ">
                        <div class="modal-body AccountSummary-body">
                            <div style="text-align: right;">
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="border:none;background-color:white; height:25px;width:25px;" >
                                 <img src="../images/Cancel.png" width="25" height="25" style="margin-left: -10px;" />
                            </button>
                                </div>

                            
                             
                            <iframe id="objSampleFollowUp" src="" style="width: 100%; border-width: 0px; height: 90%;display:block;margin-top:2px;overflow:scroll;" >Your browser doesn’t support the object tag. 
                            </iframe>

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
