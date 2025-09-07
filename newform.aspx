<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newform.aspx.cs" Inherits="apa_pack.newform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/newforms.css">
</head>
<body>
    <div class="container-fluid">
        
        <div class="row"> 
            <div id="head" class="col-md-12" well> 
                <div class="title">
                    <h1> S E L F MANAGEMANT </h1> 
                </div>
            </div>
            <div id="main" class="col-md-12" well>  
                <div class="main-form"> 
                    <form id="loginform" runat="server" onsubmit="return validform()">
                        <h1 class="create_new"> Create new ID </h1> 
                        <div class="lab-d">   <asp:Label ID="Label1" runat="server" Text="Student Name"></asp:Label> </div>
                        <div class="txt-d">   <asp:TextBox ID="txt_name" runat="server"></asp:TextBox> </div>
                        <div class="lab-d">  <asp:Label ID="Label2" runat="server" Text="Class"></asp:Label> </div>
                        <div class="txt-d">   <asp:DropDownList ID="drop_class" runat="server" value="">
                                                    
                                              </asp:DropDownList> </div>
                        <div class="lab-d">  <asp:Label ID="Label3" runat="server" Text="DOB"></asp:Label> </div>
                        <div class="txt-d">   <asp:TextBox ID="txt_dob" runat="server" placeholder="mm/dd/yyyy" Textmode="Date" ReadOnly = "false"></asp:TextBox> </div>
                        <div class="lab-d">  <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label> </div>
                        <div class="txt-d">   <asp:RadioButton ID="Radio_gender_m" Text="Male" groupname="gender" runat="server"/> 
                                              <asp:RadioButton ID="Radio_gender_f" Text="Female" groupname="gender" runat="server"/> </div>
                        <div class="lab-d">  <asp:Label ID="Label5" runat="server" Text="Email id"></asp:Label> </div>
                        <div class="txt-d">   <asp:TextBox ID="txt_mail" runat="server"></asp:TextBox> </div>
                        <div class="lab-d">  <asp:Label ID="Label6" runat="server" Text="New password"></asp:Label> </div>
                        <div class="txt-d">   <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox> </div>

                        <div class="submit-d">   <asp:Button ID="submit_form" runat="server" Text="Submit" class="btn btn-primary" Width="200px" OnClick="submit_form_Click"/> </div>
                       
                    </form> 
                </div>
            </div>
            <div id="food" class="col-md-12" well>
                hrthe
            </div>
        </div>
    </div>

    
       <script type="text/javascript">

           function validform() {
               
               var name = document.getElementById("txt_name").value;
               if (name == '' || name == null) {
                   alert(' please enter name.. ');
                   txt_name.focus();
                   return false;
               }
               var name = document.getElementById("drop_class").value;
               if (name == '0' || name == null) {
                   alert(' please select class.. ');
                   txt_name.focus();
                   return false;
               }
               var name = document.getElementById("txt_dob").value;
               if (name == '' || name == null) {
                   alert(' please select date of birth.. ');
                   txt_name.focus();
                   return false;
               }
               var genderM = document.getElementById("Radio_gender_m");
               var genderF = document.getElementById("Radio_gender_f");
               
               if (genderM.checked == false && genderF.checked == false) {
                   alert("You must select male or female");
                   return false;
               }
               var mail = document.getElementById("txt_mail").value;
               var mail_format = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

               if (mail.match(mail_format))
               {
                   //return true;
               } else {
                   alert("You have entered an invalid email address!")
                   txt_mail.focus();
                   return false;
               }
               var password = document.getElementById("txt_password").value;
               var passw = /^[A-Za-z]\w{7,14}$/;
               
               if (password.match(passw))
               {
                   return true;
               }
               else {
                   alert(' Invalid password...!')
                   
                   return false;
               }
           }
           
       </script>  

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
</body>
</html>
