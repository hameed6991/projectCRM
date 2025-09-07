<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEngineer.aspx.cs" Inherits="apa_pack.Master.AddEngineer" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Engineer</title>
    
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <%--boostrap icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />



     <%-- --- FOR FONT FAMILY --%>

    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

    <%-- --- --%>


    <%--For Select Date--%>
    <script type="text/javascript" src="../js/SearchCalender.js"></script>
    <link href="../css/Calender.css" rel="stylesheet" />
    <%--For Select Date--%>
   

    <link href="../css/ButtonStyle.css" rel="stylesheet" />
    <link href="../css/home.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/home.css" />
    <link href="../css/CommonStyles.css" rel="stylesheet" />

    <style type="text/css">


        body {
            font-family: Poppins;
            font-size: medium;
            /*font-weight:bold;*/
        }

        .form-group{
            padding-top:2px;
            margin-bottom:3px;
            font-size: smaller;
            font-weight: 100;
            
        }

        table#GridViewEngDetails {
            overflow: hidden;
            border-radius: 8px;
            border: lightgray;
        }


        

    </style>

     

    <script type="text/javascript">



        function pageload() {

        
            //// For using Postback issue created when we bind location Dropdown Code line is : document.all.DDLocationZone.add(obj);
            //string location = Request.Form["DDLocationZone"];
           
            
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

         

        function LocationBind() {
            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (document.getElementById("DDRegion").value != "") {
                var sURL = "../WebService.asmx/GetLocation"
                xml.open("POST", sURL, false);
                xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var str = "RegionCode=" + document.getElementById("DDRegion").value;
                xml.send(str)
                lsval = xml.responseText;
                //  alert(document.getElementById("cmbRegion").value)
               //alert(lsval)

                l = document.all.DDLocationZone.length;
                for (j = 0; j < l; j++) {
                    document.all.DDLocationZone.remove(0);
                }
                obj = new Option();
                obj.text = "<-Select->";
                obj.value = "";
                document.all.DDLocationZone.add(obj);
              
                final = 0
                if (lsval != "") {
                    tempsval = lsval.split("^^^");
                    final = tempsval.length - 1;
                }
                 
                for (i = 0; i < final; i++) {
                    obj = new Option();
                    lseng = tempsval[i].split("|");
                    obj.text = lseng[0];
                    obj.value = lseng[1];
                    document.all.DDLocationZone.add(obj);
                }
                 
            }
             
        }

        function Validation() {
           
        
            var txtEngineerName = document.getElementById("txtEngineerName").value;
            if (txtEngineerName == "" || txtEngineerName == null) {
                alert(' please Enter the Engineer Name ');
                //event.PreventDefault();
                document.getElementById("txtEmployeeName").focus();
     
                return false;
                
            }
         
            
            var txtEngineerCode = document.getElementById("txtEngineerCode").value;
            if (txtEngineerCode == "" || txtEngineerCode == null) {
                alert(' please Enter the Engineer Code ');
                //event.PreventDefault();
                document.getElementById("txtEmployeeCode").focus();
                return false;
            }

            //var DDDesignation = document.getElementById("DDDesignation").value;
            //if (DDDesignation == "" || DDDesignation == null) {
            //    alert(' please Select Designation ');
            //    //event.PreventDefault();
            //    document.getElementById("DDDesignation").focus();
            //    return false;
            //}

            //var DDDepartment = document.getElementById("DDDepartment").value;
            //if (DDDepartment == "" || DDDepartment == null) {
            //    alert(' please Select Department ');
            //    //event.PreventDefault();
            //    document.getElementById("DDDepartment").focus();
            //    return false;
            //}
            
            
            var txtDateofJoining = document.getElementById("txtDateofJoining").value;
            if (txtDateofJoining == "" || txtDateofJoining == null) {
                alert(' please Select Date of Joining ');
                //event.PreventDefault();
                document.getElementById("txtDateofJoining").focus();
                return false;
            }

            var txtMobileNumber = document.getElementById("txtMobileNumber").value;
            if (txtMobileNumber == "" || txtMobileNumber == null) {
                alert(' please Enter the Mobile Number ');
                //event.PreventDefault();
                document.getElementById("txtMobileNumber").focus();

                return false;

            }   
           
            var mobileInput = document.getElementById("txtMobileNumber").value;
            
            if (mobileInput != "") {

                var mobileRegex = /^[6-9]\d{9}$/;

                if (mobileRegex.test(mobileInput)) {


                } else {
                    alert("Please enter a valid 10-digit mobile number.");
                    return false;
                }

            }
            
            
            var mobileInput1 = document.getElementById("txtAlternateNumber").value;

            if (mobileInput1 != "") {

                var mobileRegex1 = /^[6-9]\d{9}$/;

                if (mobileRegex1.test(mobileInput1)) {


                } else {
                    alert("Please enter a valid 10-digit mobile number.");
                    return false;
                }

            }
            
         
             
            var txtEmail = document.getElementById("txtEmail").value;
            if (txtEmail == "" || txtEmail == null) {
                alert(' please Enter the Email ');
                //event.PreventDefault();
                document.getElementById("txtEmail").focus();

                return false;

            }
             
            var email = document.getElementById("txtEmail").value.trim();

            // Basic email pattern
            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$/;
            
            if (emailRegex.test(email)) {
                 
                
            } else {
                alert("Please enter a valid email address.");
                return false;
            }


            document.all.hdnDDLocationZone.value = document.all.DDLocationZone.value;
            document.all.hdnDDRegion.value = document.all.DDRegion.value;
            
            //alert(document.all.hdnDDLocationZone.value)
            //alert(document.all.hdnDDRegion.value)
            //return false;
        }

         

        function handlePageChange(pageIndex) {

            alert(pageIndex);
            // Optionally, you can add logic here to show a loading indicator or similar UI feedback
            <%--__doPostBack('<%= GridView1.UniqueID %>', 'Page$' + pageIndex);--%>
        }

      



        function funReset() {

            document.all.txtEngineerName.value = "";
            document.all.txtEngineerCode.value = "";
            document.all.DDDesignation.value = "";
            document.all.DDDepartment.value = "";
            document.all.txtDateofJoining.value = "";
            document.all.txtMobileNumber.value = "";
            document.all.txtAlternateNumber.value = "";
            document.all.txtEmail.value = "";
            document.all.DDRegion.value = "";
            document.all.DDLocationZone.value = "";
            document.all.DDCity.value = "";


            document.all.DDSate.value = "";
            document.all.txtPresentAddress.value = "";
 


            return false;

        }


        function CloseWindow(msg) {

            alert(msg);
            //window.close();
            window.parent.Closepopup();
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
               <span style="color: #000000; font-family: Calibri; font-size: medium;position: relative;left: -475px;font-weight: 600;" >Engineer Master</span>

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
           <div id="main" class="scrollable-content" style="background:#fff;top: 70px;" runat="server">


               <%------------- Enginner Info--%>



               <div class="accordion" id="accordionPanelsStayOpenExample">

                   <div class="accordion-item">
                       <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                           <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                               Engineer Info
                           </button>
                       </h2>
                       <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingTwo">
                           <div class="accordion-body">


                               <div class="row">
                                   <div id="main1" class="container-fluid">


                                       <%------------- Engineer Info--%>

                                       <div class="form-group row">

                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Engineer Name</div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">
                                               <input type="text" id="txtEngineerName" runat="server" class="formcontrol form-control-sm" />
                                           </div>

                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Engineer Code</div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">

                                               <input type="text" id="txtEngineerCode" runat="server" class="formcontrol form-control-sm" />

                                           </div>
                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Designation</div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">

                                               <asp:DropDownList ID="DDDesignation" runat="server" class="formcontrol form-control-sm"  ></asp:DropDownList>

                                           </div>

                                       </div>





                                       <div class="form-group row">

                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Department </div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">
                                               <asp:DropDownList ID="DDDepartment" runat="server" class="formcontrol form-control-sm" ></asp:DropDownList>
                                           </div>
                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span>  Date of Joining </div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">
                                               <div class="row">
                                                   <div class="col-sm-9 col-md-9 form-text" style="padding-right: 3px;">
                                                       <input type="text" id="txtDateofJoining" runat="server" class="formcontrol form-control-sm" />
                                                   </div>
                                                   <div class="col-sm-3 col-md-3 form-text" style="padding: 0px;">
                                                       <img border="0" src="../images/Calender.svg" style="cursor: pointer;" align="middle" onclick="showCal(document.all.txtDateofJoining,1)" />
                                                   </div>
                                               </div>

                                           </div>
                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Mobile Number</div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">
                                               <input type="text" id="txtMobileNumber" runat="server" maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, '')" class="formcontrol form-control-sm" />
                                           </div>
                                            
                                       </div>


                                       <div class="form-group row">

                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red"> </span> Alternate Number</div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">
                                               <input type="text" id="txtAlternateNumber" runat="server" maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, '')" class="formcontrol form-control-sm" />
                                           </div>

                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red">*</span> Email</div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">

                                               <input type="text" id="txtEmail" runat="server" class="formcontrol form-control-sm" />

                                           </div>
                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red"> </span> Region</div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">

                                               <asp:DropDownList ID="DDRegion" runat="server" class="formcontrol form-control-sm" onchange="LocationBind()" AutoPostBack="false"></asp:DropDownList>

                                           </div>

                                       </div>

                                       <div class="form-group row">

                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red"> </span> Location / Zone</div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">
                                              <%-- <asp:DropDownList ID="DDLocationZone" runat="server" class="formcontrol form-control-sm"></asp:DropDownList>--%>
                                               <select id="DDLocationZone" name="DDLocationZone" class="formcontrol form-control-sm">
                                                   <option value=""><- Select -></option>
                                               </select>
                                           </div>

                                           <%--<div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red"> </span> City</div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">

                                               <asp:DropDownList ID="DDCity" runat="server" class="formcontrol form-control-sm" onchange="GetProductDetail()"></asp:DropDownList>


                                           </div>
                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red"> </span> Sate</div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">

                                               <asp:DropDownList ID="DDSate" runat="server" class="formcontrol form-control-sm" onchange="GetProductDetail()"></asp:DropDownList>

                                           </div>--%>

                                       </div>


                                      <%-- <div class="form-group row">

                                           <div class="col-sm-2 col-md-2 form-lable" align="right"><span style="color: red"> </span> Present Address</div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">
                                               <textarea id="txtPresentAddress" rows="3" runat="server" class="formcontrol_Area form-control-sm" maxlength="500" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></textarea>
                                           </div>
                                           <div class="col-sm-2 col-md-2 form-lable" align="right"></div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">
                                           </div>
                                           <div class="col-sm-2 col-md-2 form-lable" align="right"></div>
                                           <div class="col-sm-10 col-md-2 form-text" align="left">
                                           </div>
                                       </div>--%>

                                       
                                   </div>
                               </div>


                           </div>
                       </div>
                   </div>


                   <div class="accordion-item">
                       <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                           <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                           </button>
                       </h2>
                       <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingThree">
                           <div class="accordion-body">

                               <br />
                               <div class="form-group row">
                                   <div class="col-sm-2 col-md-6" style="color: black;" align="right">
                                   </div>
                                   <div class="col-sm-2 col-md-6" style="color: black;" align="right">
                                       <button type="submit" runat="server" id="btnreset" onclick="funReset()" class="btn btn-dark CancelButton">Reset</button>
                                       &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnsubmitIns" runat="server" OnClientClick="return Validation();" OnClick="btnsubmitIns_Click" class="btn btn-warning SubmitButton" Text="Submit" />
                                   </div>

                               </div>


                           </div>
                       </div>
                   </div>


               </div>



           </div>
       </div>


       <%--MAIN ROW 2--%>

       <div calss="row">
           <div id="main2" class="container-fluid" runat="server">



                <div class="grid-d" align="center">

                       <asp:GridView ID="GridViewEngDetails" style="" runat="server" width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" 
                           DataKeyNames="EngineerCode" PageSize="10" OnPageIndexChanging="GridViewEngDetails_PageIndexChanging"  EmptyDataText="There are no data records to display." HeaderStyle-BackColor="#FFEEC0" RowStyle-BackColor="#ffffff" AllowPaging="true" Height="0" >
                            
                           <Columns>

                               <asp:TemplateField ItemStyle-CssClass="GridColumnStyle" HeaderStyle-ForeColor="white" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="" ItemStyle-Width="80px">
                                   <ItemTemplate>
                                       
                                       
                                       <asp:LinkButton ID="GridEngCode" runat="server" Font-Size="Small"  OnClientClick=' <%# "javascript:EditProd(\"" +  Eval("EngineerCode")  +  "\");  "  %> ' OnClick="GridEngCode_Click" OnInit="GridEngCode_Init"  >Edit</asp:LinkButton>

                                   </ItemTemplate>
                               </asp:TemplateField>
                               <asp:BoundField ItemStyle-CssClass="GridColumnStyle" HeaderText="Engineer Name" HeaderStyle-ForeColor="black" ItemStyle-Font-Size="Small" DataField="EngineerName" ItemStyle-Width="180px" />
                               <asp:BoundField ItemStyle-CssClass="GridColumnStyle" HeaderText="Mobile No" HeaderStyle-ForeColor="black" ItemStyle-Font-Size="Small" DataField="MobileNumber" ItemStyle-Width="150px" />
                               <asp:BoundField ItemStyle-CssClass="GridColumnStyle" HeaderText="Email" HeaderStyle-ForeColor="black" ItemStyle-Font-Size="Small" DataField="Email" ItemStyle-Width="180px" />
                               <asp:BoundField ItemStyle-CssClass="GridColumnStyle" HeaderText="Date Of Join" HeaderStyle-ForeColor="black" ItemStyle-Font-Size="Small" DataField="DateOfJoin" ItemStyle-Width="150px" />
                               <asp:BoundField ItemStyle-CssClass="GridColumnStyle" HeaderText="Department" HeaderStyle-ForeColor="black" ItemStyle-Font-Size="Small" DataField="Department" ItemStyle-Width="180px" />
                               <asp:BoundField ItemStyle-CssClass="GridColumnStyle" HeaderText="Designation" HeaderStyle-ForeColor="black" ItemStyle-Font-Size="Small" DataField="Designation" ItemStyle-Width="180px" />
                               <asp:BoundField ItemStyle-CssClass="GridColumnStyle" HeaderText="Status" HeaderStyle-ForeColor="black" ItemStyle-Font-Size="Small" DataField="Status" ItemStyle-Width="80px" />
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

            <input type="hidden" name="hdnDDLocationZone" id="hdnDDLocationZone" runat="server" />
            <input type="hidden" name="hdnDDRegion" id="hdnDDRegion" runat="server" />
            
            
        </form>
    </div>

 
</body>

</html>
