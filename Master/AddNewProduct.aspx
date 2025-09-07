<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewProduct.aspx.cs" Inherits="apa_pack.Master.AddNewProduct" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Product</title>
    
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <%--boostrap icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />


   

    <link href="../css/ButtonStyle.css" rel="stylesheet" />
  <%--  <link rel="stylesheet" href="css/home.css" />--%>
        <link href="../css/home.css" rel="stylesheet" />

    <style type="text/css">


        body {
            font-family: 'Calibri','Gill Sans', 'Gill Sans MT', 'Trebuchet MS', sans-serif;
            font-size: medium;
            /*font-weight:bold;*/
        }

        .form-group{
            padding-top:2px;
            margin-bottom:3px;
            font-size: smaller;
            font-weight: 100;
            
        }

    </style>

     

    <script type="text/javascript">



        function pageload() {

            
            
        }


        function changesection(button) {

            // //alert(button)
            //if (button == "btnAdd") {
            //    document.getElementById("main2").style.display = "none";
            //    document.getElementById("main").style.display = "block";
            //    document.getElementById("btnAdd").style.display = "none";
            //    document.getElementById("bnview").style.display = "block";
            //}
            //if (button == "bnview") {
            //    document.getElementById("main2").style.display = "block";
            //    document.getElementById("main").style.display = "none";
            //    document.getElementById("bnview").style.display = "none";
            //    document.getElementById("btnAdd").style.display = "block";
            //}
            
        }

        function EditProd(Code) {
            //alert(Code)

            if (Code != "") {

                document.all.hdnProdcode.value = Code;
                document.getElementById("main2").style.display = "none";
                document.getElementById("main").style.display = "block";
                document.getElementById("btnAdd").style.display = "none";
                document.getElementById("bnview").style.display = "block";
                document.getElementById("btnsubmitProd").value = "Save";
  
            }
        }

        function validateForm() {
           

            var TexProduct = document.getElementById("TexProduct").value;
            if (TexProduct == "" || TexProduct == null) {
                alert(' please Enter the Product.. ');
                //event.PreventDefault();
                document.getElementById("TexProduct").focus();
     
                return false;
                
            }

            
            var TexProdesc = document.getElementById("TexProdesc").value;
            if (TexProdesc == "" || TexProdesc == null) {
                alert(' please Select Prodesc.. ');
                //event.PreventDefault();
                document.getElementById("TexProdesc").focus();
                return false;
            }

            var TexModleNo = document.getElementById("TexModleNo").value;
            if (TexModleNo == "" || TexModleNo == null) {
                alert(' please Select ModleNo.. ');
                //event.PreventDefault();
                document.getElementById("TexModleNo").focus();
                return false;
            }
 
             
        }



        function CloseWindow(msg) {

             alert(msg);
            window.close();
        }




        function handlePageChange(pageIndex) {

            alert(pageIndex);
            // Optionally, you can add logic here to show a loading indicator or similar UI feedback
            <%--__doPostBack('<%= GridView1.UniqueID %>', 'Page$' + pageIndex);--%>
        }

      


    </script>


</head>



    



<body onload="pageload()">

 


    
    <div class="container-fluid">
        <form id="form_logout" runat="server">

            <%-- script manager for grid updatepanel --%>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <%--HEADER ROW--%>
 
          <br/>


   <fieldset id="AddContinfoField" style="border:solid 0px red;height:400px;">
            
 
 
       <nav class="navbar navbar-light">
           <div class="container-fluid" style="background-color: white; border-bottom: solid 1px lightgray; color: white; border-radius: 5px;">
               <img src="../images/product.png" width="35" height="35" />
               <span style="color: #1e2f97; font-family: Calibri; font-size: medium;position: relative;left: -240px;" >Product Master</span>

               <div id="btncontainer">
                   <div id="btnborder"></div>
                   <asp:Button ID="btview" runat="server" OnClientClick="return changesection('btview');" OnClick="btview_Click" Text="View" Value="View" />
                   <asp:Button ID="btAdd" runat="server" OnClientClick="return changesection('btAdd');" OnClick="btAdd_Click" Text="Add" Value="Add" />
         
               </div>
               <%--<button type="button" >Secondary</button>--%>

           </div>
       </nav>


       <%--MAIN ROW 1--%>

            <div class="row">
                <div id="main"  class="container-fluid" runat="server">
                     

<%------------- Product Info--%>
                    <br/>  
                     
                    <div class="form-group row">

                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: red">*</span>Product</div>
                        <div class="col-sm-2 col-md-2" align="left">
                            <%-- autofocus="autofocus"--%>
                            <input type="text" id="TexProduct" style="width: 150px;" runat="server" class="form-control form-control-sm" />
                        </div>
                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: red"></span>Principal</div>
                        <div class="col-sm-2 col-md-2" align="left">
                             <input type="text" id="TexPrincipal" style="width: 150px;" runat="server" class="form-control form-control-sm" />
                        </div>

                    </div>

                    <div class="form-group row">

                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: red">*</span>Product Discription</div>
                        <div class="col-sm-2 col-md-2" align="left">
                            <input type="text" id="TexProdesc" style="width: 150px;" runat="server" class="form-control form-control-sm" />
                        </div>
                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color: red">*</span>Modle No</div>
                        <div class="col-sm-2 col-md-2" align="left">
                             <input type="text" id="TexModleNo" style="width: 150px;" runat="server" class="form-control form-control-sm" />
                        </div>

                    </div>

                    <div class="form-group row">

                        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color: red"></span>Amount</div>
                        <div class="col-sm-2 col-md-2" align="left">
                            <input type="number" id="TexAmount" style="width: 150px;" runat="server" class="form-control form-control-sm" />
                        </div>
                        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"> HSNCode </div>
                        <div class="col-sm-2 col-md-2" align="left">
                            <input type="text" id="TexHSNCode1" style="width: 150px;" runat="server" class="form-control form-control-sm" />
                        </div>

                    </div>
 


                    <br />
                    <br />

                    <div class="form-group row">

                         
                        <div class="col-sm-12 col-md-12" id="btnSubmitdiv" style="color: black;" align="center">
                             <%--<button type="submit" runat="server" id="btnSubmit" style="width: 100px;border-radius:100px;" class="btn btn-primary"  onclick="validateForm();" onserverclick="btnSubmit_ServerClick">Submit</button> --%>
                            <asp:Button ID="btnsubmitProd" runat="server" style="width:100px;border-radius:100px;display:block;" OnClientClick="return validateForm();" value="Submit" OnClick="btnsubmitProd_Click" class="btn btn-primary btn-sm" Text="Submit" />
                             

                        </div>
                        

                    </div>
 
      
  

                </div>
            </div>


       <%--MAIN ROW 2--%>

       <div calss="row">
           <div id="main2" class="container-fluid" runat="server">



                <div class="grid-d" align="center">

                       <asp:GridView ID="GridViewProdDetails" style="" runat="server" width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" 
                           DataKeyNames="ProdCode" PageSize="5" OnPageIndexChanging="GridViewProdDetails_PageIndexChanging"    EmptyDataText="There are no data records to display." HeaderStyle-BackColor="#3AC0F2" RowStyle-BackColor="#ffffff" AllowPaging="true" Height="80" >
                            
                           <Columns>

                               <asp:TemplateField HeaderStyle-ForeColor="white" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="">
                                   <ItemTemplate>
                                       
                                       <%--<img src="../images/edit-info.png" width="20" height="20" style="margin-top: -5px;" />--%>
                                       <%--<asp:HyperLink ID="GridProdCode"   runat="server" Font-Size="Small"  data-bs-toggle="modal" data-bs-target="#exampleModalCenter" Text='Edit' NavigateUrl="#" onclick='<%# "javascript:EditProd(\"" +  Eval("ProdCode")  +  "\");return false; "  %>' /> --%>
                                       <asp:LinkButton ID="GridProdCode" runat="server" Font-Size="Small"  OnClientClick=' <%# "javascript:EditProd(\"" +  Eval("ProdCode")  +  "\");  "  %> ' OnClick="GridProdCode_Click" OnInit="GridProdCode_Init"  >Edit</asp:LinkButton>

                                   </ItemTemplate>
                               </asp:TemplateField>
                               <asp:BoundField HeaderText="Product" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="Product" ItemStyle-Width="100px" />
                               <asp:BoundField HeaderText="Product Description" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="ProdDesc" />
                               <asp:BoundField HeaderText="Modle No" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="ModleNo" />
                               <asp:BoundField HeaderText="PSCode" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="PSCode" />
                               <asp:BoundField HeaderText="Rupees" HeaderStyle-ForeColor="white" ItemStyle-Font-Size="Small" DataField="Rupees" ItemStyle-Width="80px" />
         
                           </Columns>
                       </asp:GridView>  

                </div>


           </div>
       </div>

 </fieldset>

            <%--FOOTER ROW--%>

            <%--<div class="row">
                <div id="food" class="col-md-12 border">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>--%>

            <%--HIDDEN FIELD--%>
             <input type="hidden" name="hdnProdcode" id="hdnProdcode" runat="server" />
            <input type="hidden" name="hdnFrom" id="hdnFrom" runat="server" />
            
            
            
        </form>
    </div>

 
</body>

</html>
