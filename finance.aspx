<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="finance.aspx.cs" Inherits="apa_pack.finance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <%--boostrap icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/finance.css">

</head>



    



<body onload="load()">

    


       <div class="container-fluid">
        <form id="form_logout" runat="server"> 

<%-- script manager for grid updatepanel --%>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

<%--HEADER ROW--%>

            <div class="row">
               <div id="head" class="col-md-6">   
                   <div class="title">
                       <h1> L O G O </h1> 
                   </div>
                
                   <div class="logout_d">
                         
                        <asp:Button ID="but_Logout" runat="server" Text="Logout" class="btn btn-dark" OnClick="but_Logout_Click"/> <i class="bi bi-person-bounding-box" style="margin-left:20px; margin-top:12px; position: absolute; font-size:50px;"></i>
                        
                   </div>
               </div>
                
                <div id="nav_div" class="col-md-6">
                    <ul id="nav_ul">
                        <li class="nav_li">  <a href="#">  <i class="bi bi-file-earmark-person-fill"></i>  About</a></li>
                        <li class="nav_li">  <a href="#">  <i class="bi bi-person-workspace"></i>          Task</a></li>
                        <li class="nav_li">  <a href="#">  <i class="bi bi-bank2"></i>                     Finance</a></li>
                        <li class="nav_li">  <a href="#">  <i class="bi bi-file-earmark-check"></i>        Report</a></li>
                    </ul>
                </div>
                
            </div>


<%--MAIN ROW--%>

        <div class="row">
            <div id="main" class="container-fluid">

                <div class="row">
                        <div id="main_sub1_div" class="col-md-12 border-bottom">
                       

                            <div id="status-div" class="row" style="height:99px; margin-top:40px;" align="center" >
                                <div class="col-md-1 border-bottom" style="color:black;">JAN</div>
                                <div class="col-md-1 border-bottom" style="color:black;">FIB</div>
                                <div class="col-md-1 border-bottom" style="color:black;">MAR</div>
                                <div class="col-md-1 border-bottom" style="color:black;">APL</div>
                                <div class="col-md-1 border-bottom" style="color:black;">MAY</div>
                                <div class="col-md-1 border-bottom" style="color:black;">JUN</div>
                                <div class="col-md-1 border-bottom" style="color:black;">JUY</div>
                                <div class="col-md-1 border-bottom" style="color:black;">AGS</div>
                                <div class="col-md-1 border-bottom" style="color:black;">SEP</div>
                                <div class="col-md-1 border-bottom" style="color:black;">ACT</div>
                                <div class="col-md-1 border-bottom" style="color:black;">NOV</div>
                                <div class="col-md-1 border-bottom" style="color:black;">DES</div>  
                            </div>

               
                        </div>  
                </div>

                <div class="row border-bottom">
                    <div id="main_sub2_div" class="col-md-12 bg-light">
                        <h3> Finance </h3>  
                                 
                            
                    
                    </div>
                </div>
<%--INCOME AMOUNT--%>
                <div class="row" style="">
                      <div id="main_sub3_left_div" class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                          <div>
                              <h3> Income Amount </h3> 
                          </div>
                          
                          <div class="container my-5 " style="color:black;" >

                              <div class="row mt-3">
                                  <div class="col-xs-4 col-sm-4 col-lg-3">
                                  </div>
                                  <div class="col-xs-2 col-sm-2 col-lg-2" align="right">
                                    <span style="color:red;">*</span> <asp:Label ID="Labdate" Class="col-form-label" runat="server" Text="Date"></asp:Label>
                                  </div>
                                  <div class="col-xs-3 col-sm-3 col-lg-3 mb-3">
                                      <asp:TextBox ID="tex_date" Width="200px" Class="form-control" runat="server" placeholder="mm/dd/yyyy" Textmode="Date"></asp:TextBox>
                                  </div>
                                  <div class="col-xs-3 col-sm-3 col-lg-4">
                                  </div>
                              </div>
                                
                              <div class="row">
                                  <div class="col-xs-6 col-sm-6 col-lg-3">
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-2" align="right">
                                    <span style="color:red;">*</span> <asp:Label ID="Labcompany" Class="control-label" runat="server" Text="From"></asp:Label>
                                  </div>
                                <div class="col-xs-6 col-sm-6 col-lg-3 mb-3">
                                    <asp:TextBox ID="txt_company" runat="server" Class="form-control"> </asp:TextBox>
                                </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-4">
                                  </div>
                              </div> 
                                
                              <div class="row">
                                  <div class="col-xs-6 col-sm-6 col-lg-3">
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-2 " align="right">
                                    <span style="color:red;">*</span> <asp:Label ID="Labamount" Class="control-label" runat="server" Text="Amount"></asp:Label>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-lg-3 mb-3">
                                    <asp:TextBox ID="txt_amount" runat="server" Textmode="number" Class="form-control"> </asp:TextBox>
                                </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-4">
                                  </div>
                              </div> 
                                
                              <div class="row">
                                  <div class="col-xs-6 col-sm-6 col-lg-3">
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-2" align="right">
                                    <span style="color:blue;">*</span>  <asp:Label ID="Labtotal" Class="control-label" runat="server" Text="Total Amount"></asp:Label>
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-3 mb-3">
                                      <asp:TextBox ID="txt_totalamount_in" runat="server" Textmode="number" Class="form-control" ReadOnly="true"> </asp:TextBox>
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-4">
                                  </div>
                              </div>
                                
                              <div class="row">
                                  <div class="col-lg-12 mb-3" align="center">
                                      <asp:LinkButton ID="viewincomedtls" runat="server" data-bs-toggle="modal" data-bs-target="#incomedetails">View Details</asp:LinkButton>
                                  </div>
                              </div>

                              <div class="row my-3">
                                  <div class="col-lg-12 mb-3" align="center">
                                      <asp:Button ID="butadd" runat="server" Text="Submit" class="btn btn-primary" Width="250px" OnClick="butadd_Click" OnClientClick="return validformincome()"/>
                                  </div>
                              </div>
                              
                          </div>
                     </div>

<%--INCOME MODUL POPUP--%>

                   <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="incomedetails" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-left:-260px;">
                      <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content" style="width:auto; height:auto;" >
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle" style="color:black;">Incom Details</h5>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="border:none;">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body" style="width:1000px; overflow: scroll;" >
                                      <asp:UpdatePanel ID="updatePanel" runat="server">
                                            <ContentTemplate>
                              <asp:GridView ID="Gridincomeviewdetails" ClientIDMode="Static" style="width:100%;" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="true" EmptyDataText="There are no data records to display." HeaderStyle-BackColor="#3AC0F2" RowStyle-BackColor="#ffffff" AllowPaging="true" PageSize="4" OnPageIndexChanging="Gridincomeviewdetails_PageIndexChanging"  runat="server">
                                  
                              </asp:GridView>
                                         </ContentTemplate>
                                     </asp:UpdatePanel>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            
                          </div>
                        </div>
                      </div>
                    </div>

                    <asp:HiddenField ID="hdnincometotalvalue" runat="server"/>
                    

<%--PAY AMOUNT--%>

                      <div id="main_sub4_right_div" class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                          <div>
                              <h3> Pay Amount </h3> 
                          </div>
                       
                          
                              <div class="container my-5" style="color:black;" >

                              <div class="row mt-3">
                                  <div class="col-xs-6 col-sm-6 col-lg-3">
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-2" align="right">
                                    <span style="color:red;">*</span> <asp:Label ID="Label3" Class="col-form-label" runat="server" Text="Date"></asp:Label>
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-3 mb-3">
                                      <asp:TextBox ID="txt_dateoutgo" Width="200px" Class="form-control" runat="server" placeholder="mm/dd/yyyy" Textmode="Date" ReadOnly = "false"></asp:TextBox>
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-4">
                                  </div>
                              </div>
                                
                              <div class="row">
                                  <div class="col-xs-6 col-sm-6 col-lg-3">
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-2" align="right">
                                    <span style="color:red;">*</span> <asp:Label ID="Label4" Class="control-label" runat="server" Text="To"></asp:Label>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-lg-3 mb-3">
                                    <asp:TextBox ID="txt_tooutgo" runat="server" Class="form-control"> </asp:TextBox>
                                </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-4">
                                  </div>
                              </div> 
                                
                              <div class="row">
                                  <div class="col-xs-6 col-sm-6 col-lg-3">
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-2 " align="right">
                                    <span style="color:red;">*</span> <asp:Label ID="Label5" Class="control-label" runat="server" Text="Amount"></asp:Label>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-lg-3 mb-3">
                                    <asp:TextBox ID="txt_amountoutgo" runat="server" Textmode="number" Class="form-control"> </asp:TextBox>
                                </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-4">
                                  </div>
                              </div> 
                                
                              <div class="row">
                                  <div class="col-xs-6 col-sm-6 col-lg-3">
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-2" align="right">
                                      <span style="color:blue;">*</span> <asp:Label ID="Label6" Class="control-label" runat="server" Text="Total Amount"></asp:Label>
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-3 mb-3">
                                      <asp:TextBox ID="Tex_totalamount_out" runat="server" Textmode="number" Class="form-control" ReadOnly="true"> </asp:TextBox>
                                  </div>
                                  <div class="col-xs-6 col-sm-6 col-lg-4">
                                  </div>
                              </div>

                               <div class="row">
                                  <div class="col-lg-12 mb-3" align="center">
                                      <asp:LinkButton ID="viewoutgodtls" runat="server" data-bs-toggle="modal" data-bs-target="#paydetails">View Details</asp:LinkButton>
                                  </div>
                              </div> 


                              <div class="row my-3">
                                  <div class="col-lg-12 mb-3" align="center">
                                      <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary" Width="250px" OnClientClick="return validformoutgo()" OnClick="Button1_Click"/>
                                  </div>
                              </div>
                              
                          </div>
 
                      </div>


<%--PAY MODUL POPUP--%>

                   <div class="modal fade" id="paydetails" data-bs-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-left:-260px;">
                      <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content" style="width:auto; height:auto;" >
                          <div class="modal-header">
                            <h5 class="modal-title" id="paytitle" style="color:black;">Pay Details</h5>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="border:none;">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body" style="width:1000px; overflow: scroll;" >
                                       <asp:UpdatePanel ID="updatePanel1" runat="server">
                                            <ContentTemplate>
                              <asp:GridView ID="Gridviewpaydetails" style="width:100%;" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" EmptyDataText="There are no data records to display." HeaderStyle-BackColor="#3AC0F2" RowStyle-BackColor="#ffffff" AllowPaging="true" PageSize="4" OnPageIndexChanging="Gridincomeviewdetails_PageIndexChanging" runat="server">
                                  <Columns>
                                     <asp:BoundField HeaderText="ID" DataField="Outgo_id" />
                                       <asp:BoundField HeaderText="Date" DataField="Out_Date" />
                                       <asp:BoundField HeaderText="Pay" DataField="Out_To" />
                                       <asp:BoundField HeaderText="Pay Amount" DataField="Outgo_Amount" />
                                       <asp:BoundField HeaderText="Total Amount" DataField="Totaloutgo_Amoount" />
                                  <%--    <asp:BoundField DataField="Outgo_id" HeaderText="Brithday" ItemStyle-Width="50px" />--%>
                                  </Columns>
                              </asp:GridView>
                                             </ContentTemplate>
                                       </asp:UpdatePanel>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            
                          </div>
                        </div>
                      </div>
                    </div>

                    <asp:HiddenField ID="hdnoutgototalvalue" runat="server"/>
                
                </div>

<%--MONTHWISE DATA--%>

                <div class="row">
                    <div class="container-fluid" style="text-align:center; background-color:white;">

                        <div class="row border-top border-bottom bg-light" style="height:25px; width:auto; text-align:center; color:black;">
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                 <asp:Label ID="Labjan" runat="server" Text="JAN"></asp:Label>
                            </div>
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                <asp:Label ID="Labfib" runat="server" Text="FIB"></asp:Label>
                            </div>
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                <asp:Label ID="Labmar" runat="server" Text="MAR"></asp:Label>
                            </div>
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                <asp:Label ID="Labapl" runat="server" Text="APL"></asp:Label>
                            </div>
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                <asp:Label ID="Labmay" runat="server" Text="MAY"></asp:Label>
                            </div>
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                <asp:Label ID="Labjun" runat="server" Text="JUN"></asp:Label>
                            </div>
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                <asp:Label ID="Labjuy" runat="server" Text="JUY"></asp:Label>
                            </div>
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                <asp:Label ID="Labags" runat="server" Text="AGS"></asp:Label>
                            </div>
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                <asp:Label ID="Labsep" runat="server" Text="SEP"></asp:Label>
                            </div>
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                <asp:Label ID="Labact" runat="server" Text="ACT"></asp:Label>
                            </div>
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                <asp:Label ID="Labnov" runat="server" Text="NOV"></asp:Label>
                            </div>
                            <div class="col-md-1 " style="color:black; font-size:13px; margin-top:2px;">
                                <asp:Label ID="Labdes" runat="server" Text="DES"></asp:Label>
                            </div>
                        </div>
                        

                        <div id="monthwise-div" class="row border-bottom" style="height:80px; text-align:left;">
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Labjanin1" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Labjanpay1" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Labjansave1" runat="server" Text="saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Labjanina1" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labjanpaya1" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labjansavea1" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Labfebin2" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Labfebpay2" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Labfebsave2" runat="server" Text="Saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Labfebina2" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labfebpaya2" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labfebsavea2" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Labmarin3" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Labmarpay3" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Labmarsave3" runat="server" Text="Saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Labmarina3" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labmarpaya3" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labmarsavea3" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Labaplin4" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Labaplpay4" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Labaplsave4" runat="server" Text="Saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Labaplina4" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labaplpaya4" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labaplsavea4" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Labmayin5" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Labmaypay5" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Labmaysave5" runat="server" Text="Saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Labmayina5" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labmaypaya5" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labmaysavea5" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Labjunin6" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Labjunpay6" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Labjunsave6" runat="server" Text="Saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Labjunina6" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labjunpaya6" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labjunsavea6" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Labjuyin7" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Labjuypay7" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Labjuysave7" runat="server" Text="Saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Labjuyina7" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labjuypaya7" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labjuysavea7" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Labaugin8" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Labaugpay8" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Labaugsave8" runat="server" Text="Saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Labaugina8" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labaugpaya8" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labaugsavea8" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Labsepin9" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Labseppay9" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Labsepsave9" runat="server" Text="Saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Labsepina9" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labseppaya9" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labsepsavea9" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Laboctin10" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Laboctpay10" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Laboctsave10" runat="server" Text="Saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Laboctina10" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Laboctpaya10" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Laboctsavea10" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Labnovin11" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Labnovpay11" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Labnovsave11" runat="server" Text="Saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Labnovina11" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labnovpaya11" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labnovsavea11" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 " style="color:black; font-size:13px;">
                            <div class="row">
                                <div class="col-md-6" align="right" style="margin-top:10px;">
                                    <asp:Label ID="Labdesin12" runat="server" Text="Income :"></asp:Label>
                                    <asp:Label ID="Labdespay12" runat="server" Text="Pay :"></asp:Label>
                                    <asp:Label ID="Labdessave12" runat="server" Text="Saving :"></asp:Label>
                                </div>
                                <div class="col-md-6" style="margin-top:10px;">
                                    <asp:Label ID="Labdesina12" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labdespaya12" runat="server" ></asp:Label><br />
                                    <asp:Label ID="Labdessavea12" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div> 
                        </div>

                    </div>
                 </div>

            </div>
        </div>


<%--FOOTER ROW--%>

        <div class="row">
            <div id="food" class="col-md-12 border">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                
            </div>
             
            
        </div>

<%--HIDDEN FIELD--%>

            <asp:HiddenField ID="hdncorrentdate" runat="server" />
            <asp:HiddenField ID="hdncorrentmonth" runat="server" />

            <asp:HiddenField ID="hdnLabjanina1" runat="server" />
            <asp:HiddenField ID="hdnLabjanpaya1" runat="server" />
            <asp:HiddenField ID="hdnLabjansavea1" runat="server" />

            <asp:HiddenField ID="hdnLabfebina2" runat="server" />
            <asp:HiddenField ID="hdnLabfebpaya2" runat="server" />
            <asp:HiddenField ID="hdnLabfebsavea2" runat="server" />

            <asp:HiddenField ID="hdnLabmarina3" runat="server" />
            <asp:HiddenField ID="hdnLabmarpaya3" runat="server" />
            <asp:HiddenField ID="hdnLabmarsavea3" runat="server" />

            <asp:HiddenField ID="hdnLabaplina4" runat="server" />
            <asp:HiddenField ID="hdnLabaplpaya4" runat="server" />
            <asp:HiddenField ID="hdnLabaplsavea4" runat="server" />

            <asp:HiddenField ID="hdnLabmayin5" runat="server" />
            <asp:HiddenField ID="hdnLabmaypay5" runat="server" />
            <asp:HiddenField ID="hdnLabmaysave5" runat="server" />

            <asp:HiddenField ID="hdnLabjunin6" runat="server" />
            <asp:HiddenField ID="hdnLabjunpay6" runat="server" />
            <asp:HiddenField ID="hdnLabjunsave6" runat="server" />

            <asp:HiddenField ID="hdnLabjuyina7" runat="server" />
            <asp:HiddenField ID="hdnLabjuypaya7" runat="server" />
            <asp:HiddenField ID="hdnLabjuysavea7" runat="server" />

            <asp:HiddenField ID="hdnLabaugina8" runat="server" />
            <asp:HiddenField ID="hdnLabaugpaya8" runat="server" />
            <asp:HiddenField ID="hdnLabaugsavea8" runat="server" />

            <asp:HiddenField ID="hdnLabsepina9" runat="server" />
            <asp:HiddenField ID="hdnLabseppaya9" runat="server" />
            <asp:HiddenField ID="hdnLabsepsavea9" runat="server" />

            <asp:HiddenField ID="hdnLaboctina10" runat="server" />
            <asp:HiddenField ID="hdnLaboctpaya10" runat="server" />
            <asp:HiddenField ID="hdnLaboctsavea10" runat="server" />

            <asp:HiddenField ID="hdnLabnovina11" runat="server" />
            <asp:HiddenField ID="hdnLabnovpaya11" runat="server" />
            <asp:HiddenField ID="hdnLabnovsavea11" runat="server" />

            <asp:HiddenField ID="hdnLabdesina12" runat="server" />
            <asp:HiddenField ID="hdnLabdespaya12" runat="server" />
            <asp:HiddenField ID="hdnLabdessavea12" runat="server" />

           </form>
        </div>  


<%--SCRIPT--%>    

       <script type="text/javascript">

           function load()
           {
               /*document.getElementById("hdnincometotalvalue").value;*/
           }

          
           function validformincome() {
               
               var date = document.getElementById("tex_date").value;
               if (date == '' || date == null) {
                   alert(' please select date.. ');
                   tex_date.focus();
                   return false;
               }
               var from = document.getElementById("txt_company").value;
               if (from == '' || from == null) {
                   alert(' please enter from name.. ');
                   txt_company.focus();
                   return false;
               }
               var amount = document.getElementById("txt_amount").value;
               if (amount == '' || amount == null) {
                   alert(' please enter amount.. ');
                   txt_amount.focus();
                   return false;
               }
  
           }
           function validformoutgo()
           {

               var date = document.getElementById("txt_dateoutgo").value;
               if (date == '' || date == null) {
                   alert(' please select date.. ');
                   txt_dateoutgo.focus();
                   return false;
               }
               var to = document.getElementById("txt_tooutgo").value;
               if (to == '' || to == null) {
                   alert(' please enter from name.. ');
                   txt_tooutgo.focus();
                   return false;
               }
               var amount = document.getElementById("txt_amountoutgo").value;
               if (amount == '' || amount == null) {
                   alert(' please enter amount.. ');
                   txt_amountoutgo.focus();
                   return false;
               }
           }

           //$('#myModal').on('shown.bs.modal', function () {
           //    $('#myInput').trigger('focus')
           //})

       </script>  
</body>

</html>
