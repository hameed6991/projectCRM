<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="apa_pack.Account" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 

 
      
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    

        <%--jquery new version link added for modal popup--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>      
    <script src="http://someothersite.com/external.js"></script>

    <%-- --- FOR FONT FAMILY --%>

    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

    <%-- --- --%>

    <link href="css/home.css" rel="stylesheet" />
    <link href="css/CommonStyles.css" rel="stylesheet" />


<style type="text/css">
 
     
    
    #AccAddBun:active{
        transform:scale(0.96);
    } 
  

    #main{
        /*align-items:center;
        align-content:center;
        align-self:center;*/
        vertical-align: middle;
    }





    #main_sub2_div {
        height: 42px;
        background-color: white;
        margin-top: 00px;
        align-content: center;
    }

    #main_sub2_div h4 {
        color: #0b132b;
        font-family: fantasy;
        text-align: center;
        margin-top: -30px;
        letter-spacing: 0px;
    }

   

 

</style>





                                                                                              <%-- SCRIPT  START --%>

<script type="text/javascript">

    function AddAccountscreen()
    {
        /*alert("Add Account Screen")*/

        //Retvals = window.open("AddContacts.aspx?contid=" +"0000000746"+"&logid="+"dvfzds452lf0wzy1ebe0xl45AA698388"+"&Frm=home&Module=AccountSummary"+ null, "Width=500,Height=350,scroll=no;")

        //Retvals = window.open("../AddAccount.aspx?", null, "width=1300,height=700");
        //Retvals.moveTo((window.screen.width / 2) - (1200 / 2), (window.screen.height / 2) - (600 / 2));


        var URL = "../AddAccount.aspx?From=Account";

        //$('#objAccountSummaryModal').attr("src", URL);
        //$('#AccountSummaryModal').modal('show');

        window.location = URL;
    }





    function OpenpopupModal(AccCode) {

            //alert(AccCode)
             
 
        var URL = "../AccountSummary.aspx?AccCode=" + AccCode + "&From=Account";

        //$('#objAccountSummaryModal').attr("src", URL);
        //$('#AccountSummaryModal').modal('show');
         

        //$('#objAccountSummaryModal').attr("src", URL);
        //$('#AccountSummaryModal').modal('show');

        window.location = URL;
             
    }

     


</script>

                                                                                              <%-- SCRIPT END --%>

</asp:Content>



  

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    

    <div style="background-color:#eceeef;padding:0px;">
        <div id="main" class="col-md-12">

            <%--MAIN--%>
            <div class="row border-bottom" style="padding:10px 30px;">
                    <div id="main_sub2_div" class="col-md-12 bg-light" >

                        <div class="col-md-1 BarTitle">
                            Account
                        </div>

                        <div class="col-md-3 BarObjactsLeft">
                            <span><img src="../images/SwitchFull.svg" style="cursor:pointer;" /></span>
                            <span><img src="../images/FilterNew.svg" style="cursor:pointer;" /></span>
                        </div>

                        <div class="col-md-8 BarObjactsRight">
                            <span>
                                <button id="AccAddBun" class="btn btn-outline-warning CommonButton" type="button" onclick="AddAccountscreen()"><i id="AccAddicon" style="letter-spacing: 05px;" class="bi bi-plus"></i>New Account </button>
                            </span>
                            <span><img src="../images/ShortCut.svg" style="cursor:pointer;" /></span>
                            
                            <span><img src="../images/Refresh.svg" runat="server"  style="cursor:pointer;" /></span>
                        </div>
                         
 
                    </div>
                </div>



            <div class="scrollable-content" style="background: #fff!important;padding: 0px 10px;">
                <div class="row border-bottom" >
                    <div id="Grid_div" class="col-md-12" style="background-color: #fff;">

                        <asp:UpdatePanel ID="updatePanel1" runat="server">
                            <ContentTemplate>

                                <div class="gridview-container">

                                    <%--CssClass="table table-striped table-bordered table-hover" --%>
                                    <asp:GridView ID="GridviewAccountSummary" Style="width: 100%;" CssClass="table table-hover gridview-custom" AutoGenerateColumns="false"
                                        EmptyDataText="There are no data records to display." HeaderStyle-BackColor="#FFDB7A" RowStyle-CssClass="th" HeaderStyle-BorderColor="White" RowStyle-HorizontalAlign="left" RowStyle-BackColor="#ffffff"
                                        AllowPaging="true" PageSize="20" OnPageIndexChanging="Gridincomeviewdetails_PageIndexChanging" RowStyle-BorderColor="#eceeef"
                                        RowStyle-Height="00" RowStyle-BorderWidth="0" BorderColor="#eceeef" runat="server" OnInit="GridviewAccountSummary_Init">
                                        <HeaderStyle BackColor="#FFDB7A" ForeColor="#2C2C2C" />
                                        <Columns>

                                            <asp:TemplateField HeaderStyle-VerticalAlign="Middle" ItemStyle-CssClass="common-lable" ItemStyle-HorizontalAlign="Center" HeaderText="">
                                                <ItemTemplate>
                                                    <img src="../images/Account.png" width="20" height="20" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField  HeaderStyle-ForeColor="white" HeaderText="Acccode">
                                            <ItemTemplate>
                                                <a runat="server" href='<%# Eval("Acccode", "https://localhost:44327/EditAccount.aspx?AccCode="+ Eval("Acccode")  ) %>'>
                                                    <%# Eval("Acccode") %>
                                                </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Code" ItemStyle-CssClass="common-lable">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HLAccCode" class="GridFirstColumnStyle" runat="server" onclick='<%# "javascript:OpenpopupModal(\"" +  Eval("Acccode")  +  "\");return false; " %>' Text='<%# Eval("Acccode") %>' NavigateUrl="#" />
                                                </ItemTemplate>
                                                <%--<ItemTemplate>
                                                <asp:HyperLink  runat="server" Font-Size="Small" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" Text='<%# Eval("Acccode") %>' NavigateUrl="#" onclick="CallEditAccountscreen()"/> 
                                             </ItemTemplate>--%>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField HeaderText="Account Code" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="Acccode" ItemStyle-Width="150px" />--%>
                                            <asp:BoundField HeaderText="Account" ItemStyle-CssClass="common-lable" DataField="Account" ItemStyle-Width="200px" />

                                            <asp:BoundField HeaderText="Account Type" ItemStyle-CssClass="common-lable" DataField="AccType" />
                                            <asp:BoundField HeaderText="Customer Type" ItemStyle-CssClass="common-lable" DataField="CustomerType" />
                                            <asp:BoundField HeaderText="Industry" ItemStyle-CssClass="common-lable" DataField="Industry" />
                                            <%--<asp:BoundField HeaderText="Synonyms" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="Synonyms" />--%>
                                            <%-- <asp:BoundField HeaderText="Address" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="Address" ItemStyle-Width="350px" />--%>
                                            <asp:TemplateField HeaderText="Address" ItemStyle-CssClass="common-lable">
                                                <ItemTemplate>
                                                    <div style="width: 150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                        <asp:Label ID="lblEllipsis" runat="server" Text='<%#Eval("Address") %>' ToolTip='<%#Eval("Address") %>'></asp:Label>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Site" ItemStyle-CssClass="common-lable" DataField="Site" ItemStyle-Width="150px" />
                                            <asp:BoundField HeaderText="Site ID" ItemStyle-CssClass="common-lable" DataField="SiteID" ItemStyle-Width="150px" />
                                            <asp:BoundField HeaderText="City" ItemStyle-CssClass="common-lable" DataField="City" ItemStyle-Width="150px" />
                                            <asp:BoundField HeaderText="Contact Number" ItemStyle-CssClass="common-lable" DataField="Contact_Number" ItemStyle-Width="150px" />
                                        </Columns>
                                    </asp:GridView>


                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

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
                            <%--<img src="../images/FollowUp.svg" width="18" height="18" />
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
                            <span style="color:#000000;">Print   </span>--%>
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
            <%--style="height:300px;width:800px!important;"--%>



               



            <!-- Modal -->
            <div>
 
                <!-- Modal -->
            <div class="modal fade" id="AccountSummaryModal" role="dialog"  >
       
                <div class="modal-dialog AccountSummary-content" style="width: 90%;">
 
                    <!-- Modal content-->
                    <div class="modal-content AccountSummary-content" style="width:1300px; height:700px;margin-left: -400px;margin-top: 100px;border: 3px solid #78350f;border-radius: 5px; ">
                        <div class="modal-body AccountSummary-body">
                            <div style="text-align: right;">
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="border:none;background-color:white; height:25px;width:25px;" >
                                 <img src="../images/Cancel.png" width="25" height="25" style="margin-left: -10px;" />
                            </button>
                                </div>

                            
                             
                            <iframe id="objAccountSummaryModal" src="" style="width: 100%; border-width: 0px; height: 90%;display:block;margin-top:2px;overflow:scroll;" >Your browser doesn’t support the object tag. 
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

      