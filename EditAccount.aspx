<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="EditAccount.aspx.cs" Inherits="apa_pack.EditAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <%--boostrap icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"/>

    <link rel="stylesheet" href="css/home.css"/>


    <style type="text/css">


        body {
            font-family: 'Calibri','Gill Sans', 'Gill Sans MT', 'Trebuchet MS', sans-serif;
            font-size: medium;
            /*font-weight:bold;*/
        }


        .form-group{
            padding-top:2px;
            
        }

    </style>



    <script type="text/javascript">



        function Closefun(msg) {

            alert(msg);
 
            window.parent.location.reload();
        }




    </script>

</head>



    



<body onload="load()">

 
    <div class="container-fluid">
        <form id="form_logout" runat="server">

            <%-- script manager for grid updatepanel --%>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <%--HEADER ROW--%>
 
          <br/>
            
  <fieldset style="border:solid 0px red;">
            <nav class="navbar navbar-light">
                <div class="container-fluid" style="background-color:#1e2f97; border-bottom:solid 1px lightgray; color:white; border-radius:5px;">
                    <a class="navbar-brand" style=" color:white;font-family:Calibri;font-size:medium;" href="#" >Account info</a>
                </div>
            </nav>


            <%--MAIN ROW--%>

            <div class="row">
                <div id="main" class="container-fluid">

                  
  
    <legend style="color:red;"> </legend>
    <legend style="color:red;"> </legend>


<%------------- Account Info--%>

    <div class="form-group row">

        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"> <span style="color:red" >*</span> Account</div>
        <div class="col-sm-10 col-md-4" align="left">
            <input type="text"  id="txtAccount" name="txtAccount" style="width:380px;" runat="server" class="form-control form-control-sm" />
        </div>
        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"> Site</div>
        <div class="col-sm-10 col-md-4" align="left">
            <input type="text"  id="txtSite" style="width: 380px;" runat="server" class="form-control form-control-sm" />
        </div>

    </div>
 
     <div class="form-group row">

        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right">  Site ID</div>
        <div class="col-sm-10 col-md-4" align="left">
            <input type="text"  id="txtSiteID" style="width:380px;" runat="server" class="form-control form-control-sm"  />
        </div>
        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">  Account Type</div>
        <div class="col-sm-10 col-md-4" align="left">
             <asp:DropDownList ID="DDAccountType" style="width: 380px;" runat="server" class="form-control form-control-sm" ></asp:DropDownList>
        </div>

    </div>

      <div class="form-group row">

          <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right">  Industry</div>
          <div class="col-sm-10 col-md-4" align="left">
               <asp:DropDownList ID="DDIndustry" style="width: 380px;" runat="server" class="form-control form-control-sm" ></asp:DropDownList>
          </div>
          <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color:red">*</span>  SGSTIN</div>
          <div class="col-sm-10 col-md-4" align="left">
              <input type="text"  id="txtSGSTIN" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
          </div>

      </div>

      <div class="form-group row">

          <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right">  Start Date</div>
          <div class="col-sm-10 col-md-4" align="left">
               
              <input type="text"  id="txtStartDate" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
          </div>
          <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">  Customer Type</div>
          <div class="col-sm-10 col-md-4" align="left">
               <asp:DropDownList ID="DDCustomerType" style="width:380px;" runat="server" class="form-control form-control-sm" ></asp:DropDownList>
          </div>

      </div>

      <br/>

      <div class="form-group row">

          <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right">  Synonyms</div>
          <div class="col-sm-10 col-md-4" align="left">
              <input type="text"  id="txtSynonyms" style="width: 380px;" runat="server" class="form-control form-control-sm"  /> 
          </div>
          <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"> Contact No </div>
          <div class="col-sm-10 col-md-4" align="left">
              <input type="text"  id="txtContactNo" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
          </div>

      </div>

      <div class="form-group row">

          <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color:red">*</span>  Comments</div>
          <div class="col-sm-10 col-md-4" align="left">
              
              <textarea id="txtAComments" style="width: 380px;" rows="3" runat="server" class="form-control form-control-sm" ></textarea>
          </div>
          <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">   </div>
          <div class="col-sm-10 col-md-4" align="left">
          
          </div>

      </div>


      
<%------------- Address Info--%>


      <br />

      <nav class="navbar navbar-light">
          <div class="container-fluid" style="background-color: #1e2f97; border-bottom:solid 1px lightgray; color: white; border-radius:5px;">
              <a class="navbar-brand" style="color:white;font-family:Calibri;font-size:medium;" href="#">Address info</a>
          </div>
      </nav>

      <br />

      <div class="form-group row">

        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color:red">*</span> Address</div>
        <div class="col-sm-10 col-md-4" align="left">
            <input type="text"  id="txtAddress" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
        </div>
        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color:red">*</span> Pincode</div>
        <div class="col-sm-10 col-md-4" align="left">
            <input type="text"  id="txtPincode" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
        </div>

    </div>
 
     <div class="form-group row">

        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"><span style="color:red">*</span>  City</div>
        <div class="col-sm-10 col-md-4" align="left">
            <input type="text"  id="txtCity" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
        </div>
        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"><span style="color:red">*</span>  State</div>
        <div class="col-sm-10 col-md-4" align="left">
             <asp:DropDownList ID="DDState" style="width:380px;" runat="server" class="form-control form-control-sm" ></asp:DropDownList>
        </div>

    </div>

      <div class="form-group row">

          <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right">  Area</div>
          <div class="col-sm-10 col-md-4" align="left">
              <input type="text"  id="txtArea" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
          </div>
          <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">  </div>
          <div class="col-sm-10 col-md-4" align="left">
              
          </div>

      </div>



<%-- ----------- Area Info--%>

       
      <br/>

      <nav class="navbar navbar-light">
          <div class="container-fluid" style="background-color: #1e2f97; border-bottom:solid 1px lightgray; color: white;border-radius:5px;">
              <a class="navbar-brand" style="color:white;font-family:Calibri;font-size:medium;" href="#">Area info</a>
          </div>
      </nav>

       <br />

      <div class="form-group row">

        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right"> Region</div>
        <div class="col-sm-10 col-md-4" align="left">
            <input type="text"  id="txtRegion" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
        </div>
        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right"> Location</div>
        <div class="col-sm-10 col-md-4" align="left">
            <input type="text"  id="txtLocation" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
        </div>

    </div>
 
     <div class="form-group row">

        <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right">  Grop Leader</div>
        <div class="col-sm-10 col-md-4" align="left">
            <input type="text"  id="txtGropLeader" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
        </div>
        <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">  Accessibility</div>
        <div class="col-sm-10 col-md-4" align="left">
            <input type="text"  id="txtAccessibility" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
        </div>

    </div>

      <div class="form-group row">

          <div class="col-sm-2 col-md-2" style="color: black; width: 200px;" align="right">  Accessibility Time From</div>
          <div class="col-sm-10 col-md-4" align="left">
              <input type="text"  id="txtAccessibilityTimeFrom" style="width: 380px;" runat="server" class="form-control form-control-sm" />
          </div>
          <div class="col-sm-2 col-md-2" style="color: black; width: 150px;" align="right">  Accessibility Time To</div>
          <div class="col-sm-10 col-md-4" align="left">
              <input type="text"  id="txtAccessibilityTimeTo" style="width: 380px;" runat="server" class="form-control form-control-sm"  />
          </div>

      </div>

      <br/><br/>

      <div class="form-group row">

          <div class="col-sm-2 col-md-12" style="color: black;" align="center"> 
               <button type="submit" runat="server" id="btnSave" style="width:150px" class="btn btn-primary" onserverclick="btnSave_ServerClick">Save</button>
          </div>
 
      </div>

      <br /><br /><br />
      
  
 


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







           <%--Hidden Field--%>

            <asp:HiddenField ID="hdnAccCode" runat="server" />


        </form>
    </div>


 
</body>

</html>
