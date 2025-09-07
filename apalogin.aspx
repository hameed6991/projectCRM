<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="apalogin.aspx.cs" Inherits="apa_pack.apalogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>login</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

 <%-- --- FOR FONT FAMILY --%>

    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

    <%-- --- --%>
    
    <link rel="stylesheet" href="css/Styles.css">

    <style type="text/css">
        .btn-primary {
            --bs-btn-color: #fff;
            --bs-btn-bg: #FFC107;
            --bs-btn-border-color: #FF9800;
            --bs-btn-hover-color: #fff;
            --bs-btn-hover-bg: #009688;
            --bs-btn-hover-border-color: #4CAF50;
            width: 100%;
            background-color: #fcb900;
            color: #000;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: poppins;
        }

        body, html {
            height: 100%;
            user-select: none; /* Prevents text selection */
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
        }


        .container {
            display: flex;
            height: 100vh;
            width: 100%;
            flex-direction: row;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);

        }

        .left-panel {
            flex: 1;
            background: url('/images/loginbackground.jpg') center center no-repeat;
            background-size: cover;
             margin: 20px 10px;
             border-radius: 8px;
        }

        .right-panel {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
        }

        .login-box {
            width: 100%;
            max-width: 400px;
            
        }

        .logo {
            /*display: block;*/
            margin: 0 auto 20px auto;
            height: 50px;
        }

        h2 {
            text-align: center;
            margin-bottom: 10px;
        }

        p {
            text-align: left;
             
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            outline:none;
        }

         

        .links {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }

            .links a {
                text-decoration: none;
                color: #007bff;
                margin: 0 5px;
            }

        .footer {
            margin-top: 30px;
            text-align: center;
            font-size: 12px;
            color: #888;
        }

        @media screen and (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .left-panel {
                height: 250px;
            }
        }
    </style>


</head>

<body>
    <div class="container-fluid">

        <%--  <div class="row"> 
            <div id="head" class="col-md-12"> 
                <div class="title">
                    <h1> L O G O </h1> 
                </div>
            </div>
        </div>--%>

        <div class="row">

        <div class="container">
            <div class="left-panel"></div>
            <div class="right-panel">
                <div class="login-box">
                    <img src="/images/Customer_Logo.png" alt="Logo" class="logo" />
                    <br /><br />
                    <h2 style="font-family:poppins;font-weight:700;text-align: left;">Login</h2>
                    <p>Welcome Back !</p>
                    <br />
                    <form id="loginform" runat="server" onsubmit="return validform()">

                        <div class="lab-d">
                            <asp:Label ID="Labun" runat="server" Text="User name"></asp:Label>
                        </div>
                        <div class="txt-d">
                           <%-- <img src="../images/username.png" width="20" height="20" style="margin-left: -25px; margin-top: -5px;" />--%>
                            <asp:TextBox ID="txtun" placeholder="Enter Username" runat="server"></asp:TextBox>
                        </div>

                        <div class="lab-d">
                            <asp:Label ID="Labpass" runat="server" Text="Password"></asp:Label>
                        </div>
                        <div class="txt-d">
                           <%-- <img src="../images/password.png" width="20" height="20" style="margin-left: -25px; margin-top: -5px;" />--%>
                            <asp:TextBox ID="txtpass" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="lab-d" style="color: red">
                            <asp:Label ID="error" runat="server"></asp:Label>
                        </div>

                        <div class="log-d">
                            <asp:Button ID="Login_submit" class="btn btn-primary" runat="server" Text="Login" Width="100%" OnClick="Login_submit_Click" />
                        </div>
                        <%--<img src="../images/Sequrity.png" width="150" height="150" style="margin-left:320px;margin-top:-220px;"/>--%>
                       <%-- <a href="newform.aspx">
                            <p style="text-align: center;">Create a new Login id....! </p>
                        </a>--%>
                    </form>
                     <br /> <br />
                    <div class="links">
                        <a href="#">Forgot Password?</a> |
          <a href="#">Change Password</a>
                        
                    </div>
                    <br /><br /><br />
                    <div class="footer">
                        Version 0.1<br /> <br />
                        Powered by KBS Innovation Pvt Ltd
                    </div>
                </div>
            </div>
        </div>

            </div>
 
        <%--  <div class="row">
            <div id="food" class="col-md-12">
                

            </div>
        </div>--%>
    </div>

    <script type="text/javascript">
        
                 function validform() {
                     var username = document.getElementById("txtun").value;
                     if (username == '' || username == null) {
                         alert(' please enter username.. ');
                         txtun.focus();
                         return false;
                     }
                     var username = document.getElementById("txtpass").value;
                     if (username == '' || username == null) {
                         alert(' please enter password.. ');
                         txtpass.focus();
                         return false;
                     }
                     return true;
                 }
    </script >

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
</body>
</html>
