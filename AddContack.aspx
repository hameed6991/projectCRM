<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddContack.aspx.cs" Inherits="apa_pack.AddContack" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Contact</title>
    
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <%--boostrap icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />

     <%-- --- FOR FONT FAMILY --%>

    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

    <%-- --- --%>

    <link rel="stylesheet" href="css/home.css" />
    <link href="css/CommonStyles.css" rel="stylesheet" />

    <style type="text/css">


        body {
            font-family: poppins;
            font-size: medium;
            /*font-weight:bold;*/
            font-size:12px;
        }

        .form-group{
            padding-top:2px;
            
        }

    </style>

    <script type="text/javascript">



        function pageload() {

            if (document.getElementById("hdncontcode").value != "") {

                document.getElementById("lockdiv").style.display = "block";
            }
            else {

                 document.getElementById("btnSubmitdiv").style.marginLeft = "100px";
                
            }
            
        }


        function validateForm() {
           

            var DDSalutation = document.getElementById("DDSalutation").value;
            if (DDSalutation == "" || DDSalutation == null) {
                alert(' Please Select Salutation.. ');
                document.getElementById("DDSalutation").focus();
                event.PreventDefault();
 
                return false;
                
            }

            var txtName = document.getElementById("txtName").value;
            if (txtName == "" || txtName == null) {
                alert(' Please Enter the Name.. ');
                event.PreventDefault();
                document.getElementById("txtName").focus();
                return false;
            }

            var DDDepartment = document.getElementById("DDDepartment").value;
            if (DDDepartment == "" || DDDepartment == null) {
                alert(' Please Select Department.. ');
                event.PreventDefault();
                document.getElementById("DDDepartment").focus();
                return false;
            }

            var DDDesignation = document.getElementById("DDDesignation").value;
            if (DDDesignation == "" || DDDesignation == null) {
                alert(' Please Select Designation.. ');
                event.PreventDefault();
                document.getElementById("DDDesignation").focus();
                return false;
            }

            var Texmobileno = document.getElementById("Texmobileno").value;
            if (Texmobileno == "" || Texmobileno == null) {
                alert(' Please Enter the mobileno.. ');
                event.PreventDefault();
                document.getElementById("Texmobileno").focus();
                return false;
            }

            var TexEmail = document.getElementById("TexEmail").value;
            if (TexEmail == "" || TexEmail == null) {
                alert(' Please Enter the Email.. ');
                event.PreventDefault();
                document.getElementById("TexEmail").focus();
                return false;
            }
             
        }



        function CloseModal(msg) {

             alert(msg);

            window.parent.location.reload();
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


   <fieldset id="AddContinfoField" style="border:solid 0px red;height:500px;">
            
 
 
       <nav class="navbar navbar-light">
           <div class="container-fluid" style="background-color: #FFDB7A; border-bottom: solid 1px lightgray; color: #000000; border-radius: 5px;">
               <a class="navbar-brand" style="font-family: poppins; font-size: medium;" href="#">Contact info</a>
           </div>
       </nav>


       <%--MAIN ROW--%>

            <div class="row">
                <div id="main" class="container-fluid">
                     

<%------------- Contact Info--%>


                    <div class="form-group row">

                        <div class="col-sm-2 col-md-1 col-lg-1 form-lable" align="right"><span style="color: red">* </span>Name </div>
                        <div class="col-sm-10 col-md-3 col-lg-3 form-text" align="left">
                             <div class="row">
                                 <div class="col-sm-4 col-md-4 col-lg-4 form-text" align="left" style="padding-right:0px;">
                                     <asp:DropDownList ID="DDSalutation" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                                 </div>
                                 <div class="col-sm-8 col-md-8 form-text" align="left">
                                     <input type="text" id="txtName" runat="server" class="form-control form-control-sm" />
                                 </div>
                             </div>
                        </div>
                        <div class="col-sm-2 col-md-1 col-lg-1 form-lable" align="right"><span style="color: red">*</span> Department</div>
                        <div class="col-sm-10 col-md-3 col-lg-3 form-text" align="left">
                             <asp:DropDownList ID="DDDepartment" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                        </div>
                        <div class="col-sm-2 col-md-2 col-lg-1 form-lable" align="right"><span style="color: red">*</span> Designation</div>
                        <div class="col-sm-10 col-md-2 col-lg-3 form-text" align="left">
                             <asp:DropDownList ID="DDDesignation" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>
                        </div>

                    </div>




                    <div class="form-group row">

                        <div class="col-sm-2 col-md-1 col-lg-1 form-lable" align="right"><span style="color: red">* </span> Mobile No </div>
                        <div class="col-sm-10 col-md-3 col-lg-3 form-text" align="left">
                             <input type="text" id="Texmobileno" runat="server" class="form-control form-control-sm" />
                        </div>
                        <div class="col-sm-2 col-md-1 col-lg-1 form-lable" align="right"><span style="color: red">*</span> Email</div>
                        <div class="col-sm-10 col-md-3 col-lg-3 form-text" align="left">
                             <input type="text" id="TexEmail" runat="server" class="form-control form-control-sm" />
                        </div>
                        <div class="col-sm-2 col-md-1 col-lg-1 form-lable" align="right"> Phone</div>
                        <div class="col-sm-10 col-md-3 col-lg-3 form-text" align="left">
                             <input type="text" id="txtPhone" runat="server" class="form-control form-control-sm" />
                        </div>

                    </div>
                      

                    <br />
                    <br />

                    <div class="form-group row">

                        <div class="col-sm-2 col-md-4" style="color: black;" align="center">
                            </div>
                        
                        <div class="col-sm-2 col-md-4" style="color: black;" align="center">
                            </div>
                        <div class="col-sm-2 col-md-2" id="lockdiv" style="color: black;display:none;" align="right">
                            <button type="submit" runat="server" id="btnlock" class="btn btn-dark CancelButton" onserverclick="btnlock_ServerClick" >Lock</button>
                        </div>
                        <div class="col-sm-2 col-md-2" id="btnSubmitdiv" style="color: black;" align="left">
                            <button type="submit" runat="server" id="btnSubmit" class="btn btn-warning SubmitButton"  onclick="validateForm();" onserverclick="btnSubmit_ServerClick">Submit</button>
                        </div>
                        

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
            <asp:HiddenField ID="hdncontcode" runat="server" />
            <asp:HiddenField ID="hdnAccCode" runat="server" />
            
            
        </form>
    </div>

 
</body>

</html>
