<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOPSOld.aspx.cs" Inherits="SalesCRM.AddOPSOld" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx1" %>

<%@ Register Assembly="DevExpress.Web.v17.1" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <script src="path/to/jquery.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta id="IE8CompatibilityMeta" runat="server" http-equiv="X-UA-Compatible" content="IE=Edge" />
    <link href="CSS/style.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link href="CSS/new_styles1.css" rel="stylesheet" type="text/css" />
  
    <link href="CSS/style_new.css" rel="stylesheet" type="text/css" />
    <link href="CSS/style_new_btn.css" rel="stylesheet" type="text/css" />
    <link href="CSS/DevexpressGridStyle.css" rel="stylesheet" />
    <script type="text/javascript" src="JS/datefun.js"></script>
    <script type="text/javascript" src="JS/DateCompare.js"></script>
    <script type="text/javascript" src="JS/SearchTicketCalender.js"></script>

   
    <link href="CSS/DevexpressStyle.css" rel="stylesheet" type="text/css" />
 
    <link href="CSS/Bootstrap_Modified_3.3.7.css" rel="stylesheet" />
 
    <link href="CSS/new_styles1.css" rel="stylesheet" type="text/css" />

    <script src="JS/Modal.js"></script>
  
    <script src="JS/Modal.js"></script>




    <style type="text/css">

        #CBProcessCompletediv{
            position:absolute;
            top:20px;
            left:570px;
        }

        .dxflCLLSys dxflItemSys dxflTextEditItemSys dxflItem dxflElConSys{
            display:none!important;
            background-color:orange;
        }

        /*#grdsearch_DXMainTable
        {
            background-color:white;
        }
        #grdsearch_DXEFL_DXCBtn4
        {
            color:orange;
        }*/

        #grdsearch{
            border-radius: 10px;
        }
        #grdsearch_DXMainTable{
            border-radius: 10px;
        }
        #ASPxGridView1{
            border-radius: 10px;
        }
        #ASPxGridView1_DXMainTable{
            border-radius: 10px;
        }
        #ASPxGridView2{
            border-radius: 10px;
        }
        #ASPxGridView2_DXMainTable{
            border-radius: 10px;
        }

        /*::-webkit-file-upload-button {
            background: white;
            color: Black;
            padding: 1em;
            width:100px;
            border-radius:5px;
            border-style: dashed;
            border-color:gray;
        }*/


        /* Hide the actual file input */
        input[type="file"] {
            display: none;
        }

        /* Style the label to look like a button */
        .custom-file-upload {
            display: inline-block;
             
             background: white;
            color: gray;
            padding: 0px;
            width:300px;
            border-radius:5px;
            /*border-style: dashed;*/
            border: dashed 1px #000;
            border-color:gray;
            text-align:center;
        }
 

    </style>

    <script type="text/javascript">
       
        function pageload()
        {
            //grid.Refresh();
            
            //const updateButton = document.querySelector('a.dxbButton.dxbButtonSys span');
    
            //// Check if the button is found and update its text
            //if (updateButton && updateButton.textContent.trim() == 'Edit') {
            //    updateButton.textContent = 'New Caption'; // Change 'New Caption' to your desired text
            //}



            //const updateButton = document.getElementById('ASPxGridView2_DXEFL_DXCBtn4');
            ////alert(updateButton)
            //if (updateButton) {
            //    updateButton.querySelector('span').textContent = 'Submit'; // Change 'Save Changes' to your desired text
            //}

            
            
            document.getElementById('FileAttach1').addEventListener('change', function () {
                 
                var fileName = this.value.split('\\').pop(); // Extract the file name from the full path
                var maskedFileName = maskString(fileName);
                document.getElementById('ChooseFile1').innerText = "" + maskedFileName;
            });

            document.getElementById('FileAttach2').addEventListener('change', function () {

                var fileName = this.value.split('\\').pop(); // Extract the file name from the full path
                var maskedFileName = maskString(fileName);
                document.getElementById('ChooseFile2').innerText = "" + maskedFileName;
            });

            document.getElementById('FileAttach3').addEventListener('change', function () {

                var fileName = this.value.split('\\').pop(); // Extract the file name from the full path
                var maskedFileName = maskString(fileName);
                document.getElementById('ChooseFile3').innerText = "" + maskedFileName;
            });

            function maskString(value) {
                 //alert(value + "...." + value.length)
                if (value.length <= 20) {
                    return value;
                } else {
                   
                    return value.slice(0, 20) + '...';
                }
            }


        }
        


        function POInfoAlert()
        {
            alert("test")
 
            return false;
        }


 
        function onHtmlCommandCellPrepared(s, e) {
            //alert(s + "...." + e)
            //if (e.commandColumn.type === 'New') {
            //    e.cell.innerHTML = '<a class="dxgvCommand dxgv__Command dxgv__CommandNew" href="javascript:void(0)">My Custom New Button</a>';
            //}


            var cellValue = s.GetRowKey(e.visibleIndex);
             
                e.button.visible = false;
             
        }
   
        
        function OnGridInit(s, e) {
        

           


            //alert("test")
            //s.ValidateEditorsInContainer = function (container) {
            //    var isValid = true;
            //    var nameEditor = s.GetEditor("Name");
            //    var nameValue = nameEditor.GetValue();

            //    if (!nameValue || nameValue.trim() === "") {
            //        nameEditor.SetIsValid(false);
            //        nameEditor.SetErrorText("Name field cannot be empty.");
            //        isValid = false;
            //    }

            //    return isValid;
            //};
        }



    </script>


    <script type="text/javascript">

        
 
       
        function onBeginCallback()
        {
      
            
            //alert(document.all.hdnValidationError.value)
            //document.all.hdnpaymentFDvalue.value = document.all.ASPxGridView2_DXEFL_DXEditor5_I.value;
            //alert(document.all.hdnpaymentFDvalue.value + "------- BEGINBACK")
 
            // ---------------------------------------- Future Date Validation Start
            //current date   
            //var today = new Date();
            //// alert(document.all.hdndate.value)
            //var dd = today.getDate();
            //var mm = today.getMonth() + 1; //January is 0!

            //var yyyy = today.getFullYear();
            //if (dd < 10) {
            //    dd = '0' + dd;
            //}
            //if (mm < 10) {
            //    mm = '0' + mm;
            //}
            //var today = dd + '/' + mm + '/' + yyyy;

 
            //var FD = document.all.hdnpaymentFDvalue.value.split("/");
         
            //if (FD[1] < 10) {
            //    FD[1] = '0' + FD[1];
            //}
            //if (FD[0] < 10) {
            //    FD[0] = '0' + FD[0];
            //}

            //var FDPayment = FD[1] + '/' + FD[0] + '/' + FD[2];
            // //alert(FDPayment)

            //if (document.all.hdnpaymentFDvalue.value != "") {
            //    if (checkdatevalue(FDPayment, today) == 1) {
            //        alert("Activity Date Can't be Greater than Current Date");
            //        document.all.hdnpaymentFDvalue.focus();
            //        document.all.hdnValidationError.value = "Validation-Error";
            //        alert(document.all.hdnValidationError.value)
            //        return false;
            //    }
            //}

            // ---------------------------------------- Future Date Validation End
             
            
        }

         


        function onEndCallback(s, e) {
            //alert(s.cpReloadPage)

            if (s.cpReloadPage) {
                window.location.reload();
            }






            // ----------------------- PO Info Validation Start

             
            var buttons1 = document.querySelectorAll('a.dxbButton.dxbButtonSys');

            // Attach a click event listener to each button
            buttons1.forEach(function (button) {

                button.addEventListener('click', function (event) {

                    // Get the span element inside the button
                    var spanElement = button.querySelector('span');
                    // Get the text content of the span element

                    document.all.hdnPOSubmitName.value = spanElement.textContent.trim();

                    // Perform further actions with the button text if needed
                });
            });

             
             

            try {

                
                 
                const buttons = document.querySelectorAll('a.dxbButton.dxbButtonSys');

                // Add a click event listener to each button
                buttons.forEach(function (button) {
                    button.addEventListener('click', function (event) {
                        document.all.hdnPOSubmitID.value = event.target.id || event.target.parentElement.id; // Get the ID of the clicked button
                        //alert(document.all.hdnPOSubmitID.value)
                        //alert('Button clicked with ID:' + buttonId);

                        //alert(document.all.hdnPOSubmitName.value)
                        if (document.all.hdnPOSubmitName.value == "Update") {

                            //alert("Edit-Update")

                            var editorPoNo = ASPxClientControl.GetControlCollection().GetByName('grdsearch_DXEFL_DXEditor2');

                            if (editorPoNo.GetValue() == "" || editorPoNo.GetValue() == null) {
                                alert("Po No Can't be empty");
                                editorPoNo.SetValue("");
                                editorPoNo.Focus();
                                return false;
                            }

                            var editorPoDate = ASPxClientControl.GetControlCollection().GetByName('grdsearch_DXEFL_DXEditor3');

                            if (editorPoDate.GetValue() == "" || editorPoDate.GetValue() == null) {
                                alert("Po Date Can't be empty");
                                editorPoDate.SetValue("");
                                //editorPoDate.Focus();
                                return false;
                            }

                            var editorPoValue = ASPxClientControl.GetControlCollection().GetByName('grdsearch_DXEFL_DXEditor4');

                            if (editorPoValue.GetValue() == "" || editorPoValue.GetValue() == null) {
                                alert("Po Value Can't be empty");
                                editorPoValue.SetValue("");
                                editorPoValue.Focus();
                                return false;
                            }




                        }



                    });
                });


                   
            }

            catch (error) {
                //alert("An error occurred: ", error);
                //return false;
            }

 



            // ----------------------- PO Info Validation End


           

            ////alert(document.all.hdnpaymentFDvalue.value + "------- ENDBACK")


            // ----------------------- Get Invoice Exist value
            var xml;

            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var sURL = "WebRequest.asmx/GetOPSInvoiceval";
            xml.open("POST", sURL, false);
            xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var str = "OPSReferenceNo=" + document.all.hdnTrackNo.value;
            xml.send(str);
            //alert(str)
            lsval = xml.responseText;

            //alert(lsval)

            if (lsval != "") {


                arReceived = lsval.split("^^^");
                document.all.hdnInvoiceValue.value = arReceived[0];

            }





            // ----------------------- Get Payment Exist value
            var PayRowValCount = 0;

            var xml;

            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var sURL = "WebRequest.asmx/GetOPSPaymentval";
            xml.open("POST", sURL, false);
            xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var str = "OPSReferenceNo=" + document.all.hdnTrackNo.value;
            xml.send(str);
            //alert(str)
            lsval = xml.responseText;

            //alert(lsval)
            if (lsval != "") {


                arReceived = lsval.split("^^^");
                for (i = 0; i < arReceived.length - 1; i++) {
                    var PayRowVal = arReceived[i].split("^^^");


                    PayRowValCount = PayRowValCount + Number(PayRowVal);
                    //alert(PayRowValCount)

                }

            }


            // ----------------------- Get Minus Selected Value Exist value Start

            var editorPayCode = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView2_DXEFL_DXEditor1');
            var ResultPayselectedVal = 0;

            //alert(editorPayCode.GetValue())

            var xml;

            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var sURL = "WebRequest.asmx/GetselectedEditVal";
            xml.open("POST", sURL, false);
            xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var str = "SelectedPayCode=" + editorPayCode.GetValue();
            xml.send(str);
            //alert(str)
            lsval = xml.responseText;

            //alert(lsval)

            if (lsval != "") {


                arReceived1 = lsval.split("^^^");
                ResultPayselectedVal = Number(arReceived1[0]);

            }

            // ----------------------- Get Minus Selected Value Exist value End



            var editorAmount = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView2_DXEFL_DXEditor5');
            //alert(editorAmount.GetValue())
            var value = editorAmount.GetValue();

            document.all.hdnInvoiceValue.value = Number(document.all.hdnInvoiceValue.value);
            value = Number(value);
            var a = Number(document.all.hdnInvoiceValue.value);
            var b = value;

            //alert(a)


            var FPayRowValCount = PayRowValCount + (b - ResultPayselectedVal);
            //alert(FPayRowValCount)

            if (a < FPayRowValCount) {

                alert("The Amount should not be greater than Invoice Value..");
                //editorAmount.SetValue(""); // Clear the invalid input
                //editorAmount.Focus(); // Set focus back to the editorAmount
            }

        }


        function onEndCallback1(s, e) {

            // ---------------------- For New Buton hide Start

            //alert(s.cpReloadPage)

            if (s.cpReloadPage) {
                window.location.reload();
            }

            // ---------------------- For New Buton hide End


            // ----------------------- Invoice Info Validation Start



            var buttons1 = document.querySelectorAll('a.dxbButton.dxbButtonSys');

            // Attach a click event listener to each button
            buttons1.forEach(function (button) {

                button.addEventListener('click', function (event) {

                    // Get the span element inside the button
                    var spanElement = button.querySelector('span');
                    // Get the text content of the span element

                    document.all.hdnINSubmitName.value = spanElement.textContent.trim();

                    // Perform further actions with the button text if needed
                });
            });



            try
            {


            const buttons = document.querySelectorAll('a.dxbButton.dxbButtonSys');

            // Add a click event listener to each button
            buttons.forEach(function (button) {
                button.addEventListener('click', function (event) {
                    document.all.hdnINSubmitID.value = event.target.id || event.target.parentElement.id; // Get the ID of the clicked button
                    //alert(document.all.hdnSubmitID.value)
                    //alert('Button clicked with ID:' + buttonId);
                    
                    //alert(document.all.hdnSubmitName.value)
                    if (document.all.hdnINSubmitName.value == "Update")
                    {


                    var editorInNo = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView1_DXEFL_DXEditor2');
                    //alert(editorInNo.GetValue())
                    if (editorInNo.GetValue() == "" || editorInNo.GetValue() == null) {
                        alert("Invoice No Can't be empty");
                        editorInNo.SetValue("");
                        editorInNo.Focus();
                        return false;
                    }

                    var editorInDate = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView1_DXEFL_DXEditor3');

                    if (editorInDate.GetValue() == "" || editorInDate.GetValue() == null) {
                        alert("Invoice Date Can't be empty");
                        editorInDate.SetValue("");
                        //editorInDate.Focus();
                        return false;
                    }

                    var editorInVal = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView1_DXEFL_DXEditor4');

                    if (editorInVal.GetValue() == "" || editorInVal.GetValue() == null) {
                        alert("Invoice Value Can't be empty");
                        editorInVal.SetValue("");
                        editorInVal.Focus();
                        return false;
                    }

                    var editorInRe = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView1_DXEFL_DXEditor5');

                    if (editorInRe.GetValue() == "" || editorInRe.GetValue() == null) {
                        alert("Remark Can't be empty");
                        editorInRe.SetValue("");
                        editorInRe.Focus();
                        return false;
                    }

                    var editorInPT = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView1_DXEFL_DXEditor6');

                    if (editorInPT.GetValue() == "" || editorInPT.GetValue() == null) {
                        alert("Payment Terms Can't be empty");
                        editorInPT.SetValue("");
                        editorInPT.Focus();
                        return false;
                    }



                    }

                        

                });
            });

 
            }
            catch (error) {
                //alert("An error occurred: ", error);
                //return false;
            }


           
  

            // ----------------------- Invoice Info Validation End



            ////alert(document.all.hdnpaymentFDvalue.value + "------- ENDBACK")


            // ----------------------- Get Invoice Exist value
            var xml;

            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var sURL = "WebRequest.asmx/GetOPSInvoiceval";
            xml.open("POST", sURL, false);
            xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var str = "OPSReferenceNo=" + document.all.hdnTrackNo.value;
            xml.send(str);
            //alert(str)
            lsval = xml.responseText;

            //alert(lsval)

            if (lsval != "") {


                arReceived = lsval.split("^^^");
                document.all.hdnInvoiceValue.value = arReceived[0];

            }





            // ----------------------- Get Payment Exist value
            var PayRowValCount = 0;

            var xml;

            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var sURL = "WebRequest.asmx/GetOPSPaymentval";
            xml.open("POST", sURL, false);
            xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var str = "OPSReferenceNo=" + document.all.hdnTrackNo.value;
            xml.send(str);
            //alert(str)
            lsval = xml.responseText;

            //alert(lsval)
            if (lsval != "") {


                arReceived = lsval.split("^^^");
                for (i = 0; i < arReceived.length - 1; i++) {
                    var PayRowVal = arReceived[i].split("^^^");


                    PayRowValCount = PayRowValCount + Number(PayRowVal);
                    //alert(PayRowValCount)

                }

            }


            // ----------------------- Get Minus Selected Value Exist value Start

            var editorPayCode = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView2_DXEFL_DXEditor1');
            var ResultPayselectedVal = 0;

            //alert(editorPayCode.GetValue())

            var xml;

            if (window.XMLHttpRequest) {
                // code for all new browsers
                xml = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                // code for IE5 and IE6
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var sURL = "WebRequest.asmx/GetselectedEditVal";
            xml.open("POST", sURL, false);
            xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var str = "SelectedPayCode=" + editorPayCode.GetValue();
            xml.send(str);
            //alert(str)
            lsval = xml.responseText;

            //alert(lsval)

            if (lsval != "") {


                arReceived1 = lsval.split("^^^");
                ResultPayselectedVal = Number(arReceived1[0]);

            }

            // ----------------------- Get Minus Selected Value Exist value End



            var editorAmount = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView2_DXEFL_DXEditor5');
            //alert(editorAmount.GetValue())
            var value = editorAmount.GetValue();

            document.all.hdnInvoiceValue.value = Number(document.all.hdnInvoiceValue.value);
            value = Number(value);
            var a = Number(document.all.hdnInvoiceValue.value);
            var b = value;

            //alert(a)


            var FPayRowValCount = PayRowValCount + (b - ResultPayselectedVal);
            //alert(FPayRowValCount)

            if (a < FPayRowValCount) {

                alert("The Amount should not be greater than Invoice Value..");
                //editorAmount.SetValue(""); // Clear the invalid input
                //editorAmount.Focus(); // Set focus back to the editorAmount
            }

        }


        function onEndCallback2(s, e) {

              
            // ---------------------- For New Buton hide Start

             //alert(s.cpReloadPage)
             
            if (s.cpReloadPage) {
                window.location.reload();
            }

            // ---------------------- For New Buton hide End

           

            // ----------------------- Payment Info Validation Start
 
         
                
            try {


                var buttons1 = document.querySelectorAll('a.dxbButton.dxbButtonSys');

                // Attach a click event listener to each button
                buttons1.forEach(function (button) {

                    button.addEventListener('click', function (event) {
             
                        // Get the span element inside the button
                        var spanElement = button.querySelector('span');
                        // Get the text content of the span element
                         
                        document.all.hdnPaySubmitName.value = spanElement.textContent.trim();
 
                        // Perform further actions with the button text if needed
                    });
                });






                const buttons = document.querySelectorAll('a.dxbButton.dxbButtonSys');

                // Add a click event listener to each button
                buttons.forEach(function (button) {
                    button.addEventListener('click', function (event) {
                        document.all.hdnPaySubmitID.value = event.target.id || event.target.parentElement.id; // Get the ID of the clicked button
                        //alert(document.all.hdnSubmitID.value)
                        //alert('Button clicked with ID:' + buttonId);
                    
                        //alert(document.all.hdnSubmitName.value)
                        if (document.all.hdnPaySubmitName.value == "Update")
                        {


                            var editorPayNo = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView2_DXEFL_DXEditor3');

                            //alert(editorPayNo.GetValue())
                            if (editorPayNo.GetValue() == "" || editorPayNo.GetValue() == null) {
                                alert("Payment No Can't be empty");
                                editorPayNo.SetValue("");
                                editorPayNo.Focus();
                                return false;
                            }

                            var editorPayDate = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView2_DXEFL_DXEditor4');

                            if (editorPayDate.GetValue() == "" || editorPayDate.GetValue() == null) {
                                alert("Payment Date Can't be empty");
                                editorPayDate.SetValue("");
                                //editorPayDate.Focus();
                                return false;
                            }

                            var editorPayVal = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView2_DXEFL_DXEditor5');

                            if (editorPayVal.GetValue() == "" || editorPayVal.GetValue() == null) {
                                alert("Payment Value Can't be empty");
                                editorPayVal.SetValue("");
                                editorPayVal.Focus();
                                return false;
                            }

                            var editorPayRM = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView2_DXEFL_DXEditor6');

                            if (editorPayRM.GetValue() == "" || editorPayRM.GetValue() == null) {
                                alert("Remark Can't be empty");
                                editorPayRM.SetValue("");
                                editorPayRM.Focus();
                                return false;
                            }



                        }

                        

                    });
                });



                    
                } catch (error) {
                    //alert("An error occurred: ", error);
                }



             
             
            // ----------------------- Payment Info Validation End
   



            // ----------------------- Get Invoice Exist value
    var xml;

    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }
    var sURL = "WebRequest.asmx/GetOPSInvoiceval";
    xml.open("POST", sURL, false);
    xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var str = "OPSReferenceNo=" + document.all.hdnTrackNo.value;
    xml.send(str);
            //alert(str)
    lsval = xml.responseText;

            //alert(lsval)

    if (lsval != "") {


        arReceived = lsval.split("^^^");
        document.all.hdnInvoiceValue.value = arReceived[0];

    }





            // ----------------------- Get Payment Exist value
    var PayRowValCount = 0;

    var xml;

    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }
    var sURL = "WebRequest.asmx/GetOPSPaymentval";
    xml.open("POST", sURL, false);
    xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var str = "OPSReferenceNo=" + document.all.hdnTrackNo.value;
    xml.send(str);
            //alert(str)
    lsval = xml.responseText;

            //alert(lsval)
    if (lsval != "") {


        arReceived = lsval.split("^^^");
        for (i = 0; i < arReceived.length - 1; i++) {
            var PayRowVal = arReceived[i].split("^^^");


            PayRowValCount = PayRowValCount + Number(PayRowVal);
            //alert(PayRowValCount)

        }

    }


            // ----------------------- Get Minus Selected Value Exist value Start

    var editorPayCode = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView2_DXEFL_DXEditor1');
    var ResultPayselectedVal = 0;

            //alert(editorPayCode.GetValue())

    var xml;

    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }
    var sURL = "WebRequest.asmx/GetselectedEditVal";
    xml.open("POST", sURL, false);
    xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var str = "SelectedPayCode=" + editorPayCode.GetValue();
    xml.send(str);
            //alert(str)
    lsval = xml.responseText;

            //alert(lsval)

    if (lsval != "") {


        arReceived1 = lsval.split("^^^");
        ResultPayselectedVal = Number(arReceived1[0]);

    }

            // ----------------------- Get Minus Selected Value Exist value End



    var editorAmount = ASPxClientControl.GetControlCollection().GetByName('ASPxGridView2_DXEFL_DXEditor5');
            //alert(editorAmount.GetValue())
    var value = editorAmount.GetValue();

    document.all.hdnInvoiceValue.value = Number(document.all.hdnInvoiceValue.value);
    value = Number(value);
    var a = Number(document.all.hdnInvoiceValue.value);
    var b = value;

            //alert(a)


    var FPayRowValCount = PayRowValCount + (b - ResultPayselectedVal);
            //alert(FPayRowValCount)

    if (a < FPayRowValCount) {

        alert("The Amount should not be greater than Invoice Value..");
        //editorAmount.SetValue(""); // Clear the invalid input
        //editorAmount.Focus(); // Set focus back to the editorAmount
    }





 

        }






        function checkdatevalue(v1, v2) {
            var d1, d2, m1, m2, y1, y2, h1, h2, mm1, mm2;
            
            d1 = v1.charAt(0) + v1.charAt(1);
            m1 = v1.charAt(3) + v1.charAt(4);
            y1 = v1.charAt(6) + v1.charAt(7) + v1.charAt(8) + v1.charAt(9);

            d2 = v2.charAt(0) + v2.charAt(1);
            m2 = v2.charAt(3) + v2.charAt(4);
            y2 = v2.charAt(6) + v2.charAt(7) + v2.charAt(8) + v2.charAt(9);

            if (d1 == d2 && m1 == m2 && y1 == y2) {
                return 0;
            }

            if (y2 == y1)  // same year
            {
                if (m2 > m1)  // if month exceeds then ok	 
                {
                    return 2;
                }
                else {
                    if (m2 == m1) // if same month
                    {
                        if (d2 > d1) // if day grater then ok
                        {
                            return 2;
                        }
                        else {
                            return 1; //wrong go back
                        }
                    }
                    else {
                        return 1;
                    }
                }
            }
            else {
                if (y2 > y1) {
                    return 2;
                }
                else {
                    return 1;
                }
            }
            
        } // end function







        function validform() {

            var checkedValue = document.getElementById('CBProcessComplete');
 
            //if (checkedValue.checked) {
            //    alert("CBProcessComplete checkbox is checked.");
            //} else {
            //    alert("CBProcessComplete checkbox is not checked.");
            //}

            //return false;
        }



        function OnRowInserted() {

            // Your client-side logic
            alert(document.all.hdnValidationError.value)

            // Example: Accessing the grid and performing some action
            if (typeof grid !== 'undefined') {
                grid.Refresh();
            }
        }




        



        function FunClose(msg)
        {
            alert(msg)
            window.close();
        }





    </script>




   


</head>
<body onload="pageload()">
    <form id="form1" runat="server">

        <asp:ScriptManager ID="spr" runat="server">
        </asp:ScriptManager>


        <div class="container">

            <br/><div style="font-weight:bold;">Po Info</div> 

            <div id="CBProcessCompletediv"> <asp:CheckBox ID="CBProcessComplete" runat="server"/>&nbsp;&nbsp;Process Completed </div><br/> 

        <div>
    
        <asp:Panel ID="pnlgrid" runat="server" Width="100%">
                    
                            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                <ContentTemplate>

                                    <%--OnRowDeleting="grdsearch_RowDeleting"--%>
                                
                                    <dx1:ASPxGridView ID="grdsearch" runat="server"  OnRowUpdating="grdsearch_RowUpdating" OnRowInserting="grdsearch_RowInserting"  SettingsText-ConfirmDelete="true" ClientInstanceName="grid" AutoGenerateColumns="False" Width="100%"  OnRowValidating="grdsearch_RowValidating" ClientSideEvents-EndCallback="onEndCallback">

                                    
                                        <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                        <EditFormLayoutProperties>
                                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
                                        </EditFormLayoutProperties>
                                        <SettingsEditing Mode="EditForm"></SettingsEditing>
                                        <Settings ShowFooter="false" ShowColumnHeaders="true"   />

                                        <Columns>

                                            <%--<dx:GridViewCommandColumn Caption="Edit"  ShowEditButton="true" VisibleIndex="0" />--%>
                                            <%--<dx:GridViewCommandColumn Caption="Delete"   ShowDeleteButton="true" VisibleIndex="0" />--%>
                                        
                                            <dx:GridViewCommandColumn Name="CommandColumn" HeaderStyle-HorizontalAlign="Center"  ShowNewButtonInHeader="true" ShowEditButton="true" VisibleIndex="0" Width="80" />
                                             
                                            <dx1:GridViewDataTextColumn Visible="false" Caption="Reference No" FieldName="ReferenceNo" VisibleIndex="1">
                                                <CellStyle Wrap="True"></CellStyle>
                                                <EditFormSettings VisibleIndex="1" />
                                                <PropertiesTextEdit EncodeHtml="false"></PropertiesTextEdit>
                                            </dx1:GridViewDataTextColumn>

                                            <dx1:GridViewDataTextColumn Visible="true" Caption="PONo" FieldName="PONo" Width="150" VisibleIndex="2">
                                                <CellStyle Wrap="True"></CellStyle>
                                                <EditFormSettings VisibleIndex="2" />
                                                <PropertiesTextEdit EncodeHtml="false"></PropertiesTextEdit>
                                            </dx1:GridViewDataTextColumn>

                                            <%--<dx:GridViewDataSpinEditColumn FieldName="PONo" Caption="PO No" Width="150">
                                            </dx:GridViewDataSpinEditColumn>--%>

                                            <dx:GridViewDataColumn FieldName="PODate" Caption="PO Date" Width="150" VisibleIndex="3">
                                                <EditFormSettings VisibleIndex="3" />
                                            </dx:GridViewDataColumn>
 

                                            <dx1:GridViewDataTextColumn Visible="true" Caption="PO Value" FieldName="POValue" Width="150" VisibleIndex="4">
                                                 
                                                <EditFormSettings VisibleIndex="4" />
                                                <PropertiesTextEdit DisplayFormatString="n0" ValidationSettings-ValidationGroup="ValidationGroup">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="false" ErrorText="Value is required" />
                                                        <RegularExpression ValidationExpression="^\d+$" ErrorText="Only numeric values are allowed" />
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>

                                            </dx1:GridViewDataTextColumn>

                                            <%--<dx:GridViewDataSpinEditColumn FieldName="POValue" Caption="PO Value" Width="150" VisibleIndex="4">
                                            </dx:GridViewDataSpinEditColumn>--%>

                                            <%--<dx:GridViewCommandColumn VisibleIndex="5">
                                                <HeaderTemplate>
                                                    Commands
                                                </HeaderTemplate>
                                                <CustomButtons>
                                                    <dx:GridViewCommandColumnCustomButton ID="CustomButton1" Text="Action" />
                                                </CustomButtons>
                                            </dx:GridViewCommandColumn>--%>


                                        </Columns>
                                       <%-- <ClientSideEvents RowClick="onHtmlCommandCellPrepared" />--%>
                                        <ClientSideEvents CustomButtonClick="onHtmlCommandCellPrepared" />
                                        <SettingsPager PageSize="10" NumericButtonCount="6" />
                                        <Styles>
                                            <Cell Wrap="False" />
                                        </Styles>

                                    <%--<SettingsPager Mode="ShowAllRecords"/>--%>

                                        <EditFormLayoutProperties ColCount="3">
                                            <Items>
                                                 
                                                
                                                <dx:GridViewColumnLayoutItem runat="server" Caption="* PO No"  ColumnName="PONo"  />
                                                <dx:GridViewColumnLayoutItem runat="server" Caption="* PO Date" ColumnName="PODate" />
                                                <dx:GridViewColumnLayoutItem runat="server" Caption="* PO Value" ColumnName="POValue" />

 
                                                <dx:EditModeCommandLayoutItem  Width="100%"  HorizontalAlign="Right"  ShowCancelButton="true" ShowUpdateButton="true" />

                                                 

                                              
                                            </Items>
                                        </EditFormLayoutProperties>
                                         

                                        <EditFormLayoutProperties>
                                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
                                        </EditFormLayoutProperties>

                                        <SettingsBehavior ConfirmDelete="True" />
                                        <SettingsText ConfirmDelete="Are you sure, you want to delete this record?" />


                                    </dx1:ASPxGridView>
                                   
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </asp:Panel>

    </div>

        <br/><div style="font-weight:bold">Invoice Info</div><br/> 


        <div>
    
        <asp:Panel ID="Panel1" runat="server" Width="100%">
                    
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>

                                    <%--OnRowDeleting="grdsearch_RowDeleting"--%>
                                
                                    <dx1:ASPxGridView ID="ASPxGridView1"  runat="server" OnRowUpdating="ASPxGridView1_RowUpdating" OnRowInserting="ASPxGridView1_RowInserting" SettingsText-ConfirmDelete="true" ClientInstanceName="grid" AutoGenerateColumns="False" Width="100%" ClientSideEvents-EndCallback="onEndCallback1">

                                    
                                        <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                        <EditFormLayoutProperties>
                                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
                                        </EditFormLayoutProperties>
                                        <SettingsEditing Mode="EditForm"></SettingsEditing>

                                        <Columns>

                                           <%-- <dx:GridViewCommandColumn Caption="Edit"  ShowEditButton="true" VisibleIndex="0" />
                                            <dx:GridViewCommandColumn Caption="Delete"   ShowDeleteButton="true" VisibleIndex="0" />--%>
                                        
                                            <dx:GridViewCommandColumn Name="CommandColumn1" HeaderStyle-HorizontalAlign="Center"  ShowNewButtonInHeader="true" ShowEditButton="true" VisibleIndex="0" Width="80" />

                                            <dx1:GridViewDataTextColumn Visible="false" Caption="Reference No" FieldName="ReferenceNo" VisibleIndex="1">
                                                <CellStyle Wrap="True"></CellStyle>
                                                <EditFormSettings VisibleIndex="1" />
                                                <PropertiesTextEdit EncodeHtml="false"></PropertiesTextEdit>
                                            </dx1:GridViewDataTextColumn>

                                            <dx1:GridViewDataTextColumn Visible="true" Caption="Invoice No" FieldName="InvoiceNo" Width="150" VisibleIndex="2">
                                                <CellStyle Wrap="True"></CellStyle>
                                                <EditFormSettings VisibleIndex="2" />
                                                <PropertiesTextEdit EncodeHtml="false"></PropertiesTextEdit>
                                            </dx1:GridViewDataTextColumn>

                                            <%--<dx:GridViewDataSpinEditColumn FieldName="PONo" Caption="PO No" Width="150">
                                            </dx:GridViewDataSpinEditColumn>--%>

                                            <dx:GridViewDataColumn FieldName="InvoiceDate" Caption="Invoice Date" Width="150" VisibleIndex="3">
                                                <EditFormSettings VisibleIndex="3" />
                                            </dx:GridViewDataColumn>
 
                                            <%--<dx:GridViewDataSpinEditColumn FieldName="InvoiceValue" Caption="Invoice Value" Width="150" VisibleIndex="4">
                                            </dx:GridViewDataSpinEditColumn>--%>

                                            <dx1:GridViewDataTextColumn Visible="true" Caption="Invoice Value" FieldName="InvoiceValue" Width="150" VisibleIndex="4">
                                                 
                                                <EditFormSettings VisibleIndex="4" />
                                                <PropertiesTextEdit DisplayFormatString="n0" ValidationSettings-ValidationGroup="ValidationGroup">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="false" ErrorText="Value is required" />
                                                        <RegularExpression ValidationExpression="^\d+$" ErrorText="Only numeric values are allowed" />
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>

                                            </dx1:GridViewDataTextColumn>
 
                                            <dx:GridViewDataMemoColumn FieldName="Remark" Caption="Remark"  VisibleIndex="5"  Width="200" >
                                                <EditFormSettings VisibleIndex="5" Visible="True" />
                                            </dx:GridViewDataMemoColumn>

 
 
                                            <%--<dx:GridViewDataComboBoxColumn FieldName="PaymentTerms" Name="paymentid"  VisibleIndex="3"  Width="150" >
                                                <PropertiesComboBox ValueType="System.String"  >
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>--%>


                                            <dx:GridViewDataComboBoxColumn Caption="PaymentTerms" FieldName="PaymentTerms" Width="150">
                                                <PropertiesComboBox>
                                                    <Items>
                                                        <dx:ListEditItem Text="100% Advance" Value="100% Advance" />
                                                        <dx:ListEditItem Text="100% Against Delivery" Value="100% Against Delivery" />
                                                        <dx:ListEditItem Text="30 Days from Invoice Date" Value="30 Days from Invoice Date" />
                                                    </Items>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>

                                           <%--  <dx:GridViewDataColumn Caption="Payment Terms" FieldName="PaymentTerms">
                                                <DataItemTemplate>
                                                    <asp:DropDownList DataTextField="PaymentTerms" ID="DDpaymentterms" runat="server">
                                                        <asp:listitem>name</asp:listitem>
                                                        <asp:listitem>id</asp:listitem>
                                                    </asp:DropDownList>
                                                </DataItemTemplate>
                                            </dx:GridViewDataColumn>--%>

 
  
                                        </Columns>

                                        <SettingsPager PageSize="10" NumericButtonCount="6" />
                                        <Styles>
                                            <Cell Wrap="False" />
                                        </Styles>

                                    <%--<SettingsPager Mode="ShowAllRecords"/>--%>
                                        <EditFormLayoutProperties ColCount="3">
                                            <Items>

  
                                               <%-- <dx:GridViewColumnLayoutItem runat="server"  ColumnName="ReferenceNo" />--%>
                                                <dx:GridViewColumnLayoutItem runat="server" Caption="* Invoice No" ColumnName="InvoiceNo" />
                                                <dx:GridViewColumnLayoutItem runat="server" Caption="* Invoice Date" ColumnName="InvoiceDate" />
                                                <dx:GridViewColumnLayoutItem runat="server" Caption="* Invoice Value" ColumnName="InvoiceValue" />
                                                <dx:GridViewColumnLayoutItem runat="server"  Caption="* Remark" ColumnName="Remark" />
                                                <dx:GridViewColumnLayoutItem runat="server" Caption="* Payment Terms" ColumnName="PaymentTerms" />
                                                

 
                                                <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right"  />
                                              
                                            </Items>
                                        </EditFormLayoutProperties>
                                        <EditFormLayoutProperties>
                                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
                                        </EditFormLayoutProperties>

                                        <SettingsBehavior ConfirmDelete="True" />
                                        <SettingsText ConfirmDelete="Are you sure, you want to delete this record?" />


                                    </dx1:ASPxGridView>
 
                                   

                                  <%--  <asp:SqlDataSource ID="PaymentTerms" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select Subval as 'ID',Subval as 'Name' from submaster where  [key]='PaymentTerms'"></asp:SqlDataSource>--%>
 
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </asp:Panel>

    </div>



        <br/><br/><div style="font-weight:bold">Payment Info</div>
            
         <%--   <div class="panel-heading gadget_top_bg" style="padding: 3px;border:1px solid Gray; border-radius: 0px;" role="tab" id="ProductInfoHeading">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" data-parent="#AccountInfoParent"  onclick="expanddiv5()" aria-expanded="true" aria-controls="InstallContainer">
                                    <i id="icon5" style="float: right;margin-top:3px;" class="more-less plus_icon"></i>
                                    <font face="MS Sans Serif" size="4" tabindex="45"><span style="padding-left: 4px; vertical-align: middle" class="gadget_heading_txt">Payment Info</span></font>
                                </a>
                            </h4>
                        </div>--%>
            <br/> 


        <div>
    
        <asp:Panel ID="Panel2" runat="server" Width="100%">
                    
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>

                                    <%--OnRowDeleting="grdsearch_RowDeleting"--%>
                                
                                    <dx1:ASPxGridView ID="ASPxGridView2" runat="server"  OnRowInserting="ASPxGridView2_RowInserting" OnRowUpdating="ASPxGridView2_RowUpdating" SettingsText-ConfirmDelete="true" ClientInstanceName="grid" AutoGenerateColumns="False" Width="100%" ClientSideEvents-EndCallback="onEndCallback2" ClientSideEvents-BeginCallback="onBeginCallback" >

                                    
                                        <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                                        <EditFormLayoutProperties>
                                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
                                        </EditFormLayoutProperties>
                                        <SettingsEditing Mode="EditForm"></SettingsEditing>
                                      
                                        <ClientSideEvents Init="OnGridInit" />

                                        <Columns>

                                           <%-- <dx:GridViewCommandColumn Caption="Edit"  ShowEditButton="true" VisibleIndex="0" />
                                            <dx:GridViewCommandColumn Caption="Delete"   ShowDeleteButton="true" VisibleIndex="0" />--%>
                                        
                                            <dx:GridViewCommandColumn ShowNewButtonInHeader="true" HeaderStyle-HorizontalAlign="Center" Name="CommendColumn2" ShowEditButton="true" ButtonRenderMode="Link"  VisibleIndex="0" Width="80" >
                                                 
                                            </dx:GridViewCommandColumn>

                                            <dx1:GridViewDataTextColumn Visible="false" ReadOnly="true" Caption="Payment Code" FieldName="PaymentCode" VisibleIndex="1">
                                                <CellStyle Wrap="True"></CellStyle>
                                                <EditFormSettings VisibleIndex="1" />
                                                <PropertiesTextEdit EncodeHtml="false"></PropertiesTextEdit>
                                            </dx1:GridViewDataTextColumn>

                                            <dx1:GridViewDataTextColumn Visible="false" Caption="Reference No" FieldName="ReferenceNo" VisibleIndex="1">
                                                <CellStyle Wrap="True"></CellStyle>
                                                <EditFormSettings VisibleIndex="1" />
                                                <PropertiesTextEdit EncodeHtml="false"></PropertiesTextEdit>
                                            </dx1:GridViewDataTextColumn>

                                            <dx1:GridViewDataTextColumn Visible="true" Caption="Payment Ref No" FieldName="PaymentRefNo" Width="150" VisibleIndex="2">
                                                <CellStyle Wrap="True"></CellStyle>
                                                <EditFormSettings VisibleIndex="2" />
                                                <PropertiesTextEdit EncodeHtml="false"></PropertiesTextEdit>
                                            </dx1:GridViewDataTextColumn>

                                            <%--<dx:GridViewDataSpinEditColumn FieldName="Amount" Caption="Amount" Width="150" VisibleIndex="4">
                                            </dx:GridViewDataSpinEditColumn>--%>

                                            <dx:GridViewDataColumn FieldName="PaymentDate" Caption="Payment Date" Width="150" VisibleIndex="3">
                                                <EditFormSettings VisibleIndex="3" />
                                            </dx:GridViewDataColumn>

                                            <dx1:GridViewDataTextColumn Visible="true" Caption="Amount" FieldName="Amount" Width="150" VisibleIndex="3">
                                                 
                                                <EditFormSettings VisibleIndex="3" />
                                                <PropertiesTextEdit DisplayFormatString="n0" ValidationSettings-ValidationGroup="ValidationGroup">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="false" ErrorText="Value is required" />
                                                        <RegularExpression ValidationExpression="^\d+$" ErrorText="Only numeric values are allowed" />
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>

                                            </dx1:GridViewDataTextColumn>

                                             <dx:GridViewDataMemoColumn FieldName="Remark" Caption="Remark"  Visible="true" Width="200" VisibleIndex="4">
                                                <EditFormSettings VisibleIndex="4" Visible="True" />
                                            </dx:GridViewDataMemoColumn>

                                            <%--<dx:GridViewDataSpinEditColumn FieldName="PONo" Caption="PO No" Width="150">
                                            </dx:GridViewDataSpinEditColumn>--%>

                                            <%--<dx:GridViewDataColumn FieldName="InvoiceDate" Caption="Invoice Date" Width="150" VisibleIndex="3">
                                                <EditFormSettings VisibleIndex="3" />
                                            </dx:GridViewDataColumn>--%>
 
                                            
  
                                        </Columns>
                                        <%--<ClientSideEvents  ToolbarItemClick="onCellValueChanged2" />--%>
                                        <SettingsPager PageSize="10" NumericButtonCount="6" />
                                        <Styles>
                                            <Cell Wrap="False" />
                                        </Styles>

                                    <%--<SettingsPager Mode="ShowAllRecords"/>--%>
                                        <EditFormLayoutProperties ColCount="3">
                                            <Items>
 
                                                <dx:GridViewColumnLayoutItem runat="server" Caption="* Payment RefNo" ColumnName="PaymentRefNo" />
                                                <dx:GridViewColumnLayoutItem runat="server" Caption="* Payment Date" ColumnName="PaymentDate" />
                                                <dx:GridViewColumnLayoutItem runat="server" Caption="* Amount" ColumnName="Amount" />
                                                <dx:GridViewColumnLayoutItem runat="server" Caption="* Remark" Width="67%" ColumnName="Remark" />
                                                <dx:GridViewColumnLayoutItem runat="server" CssClass="hide"  Visible="true" ColumnName="PaymentCode" />

 
                                                <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right"  />
                                              
                                            </Items>
                                        </EditFormLayoutProperties>
                                        <EditFormLayoutProperties>
                                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
                                        </EditFormLayoutProperties>

                                        <SettingsBehavior ConfirmDelete="True" />
                                        <SettingsText ConfirmDelete="Are you sure, you want to delete this record?" />


                                    </dx1:ASPxGridView>
                                   
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </asp:Panel>
 
    </div>


        <br/><br/> 

        <div class="panel-group" id="ProductInfoParent" role="tablist" aria-multiselectable="true" style="margin: 0px 10px;">
                    <div class="panel" style="border-radius: 0px;">
                        <div class="panel-heading gadget_top_bg" style="padding: 3px; border-radius: 0px;" role="tab" id="ProductInfoHeading">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" data-parent="#AccountInfoParent"  onclick="expanddiv5()" aria-expanded="true" aria-controls="InstallContainer">
                                    <i id="icon5" style="float: right;margin-top:3px;" class="more-less plus_icon"></i>
                                    <font face="MS Sans Serif" size="4" tabindex="45"><span style="padding-left: 4px; vertical-align: middle" class="gadget_heading_txt">Attachment</span></font>
                                </a>
                            </h4>
                        </div>

                         <%--class="panel-collapse collapse"--%>
                        <div id="ProductInfoContainer" role="tabpanel" aria-expanded="true" aria-labelledby="AccountInfoHeading">
                        <div class="panel-body">
                            <div class="container-fluid">

                                <div class="row">

                                    <div class="col-xs-3 col-sm-2 col-md-2 text-left bodytxt_black" style="padding-right: 0px; position: relative; top: 5px;"><font face="MS Sans Serif" color='red' size="4">&nbsp;</font>Po&nbsp;Attachment&nbsp;</div>

                                    <div class="col-xs-5 col-sm-4 col-md-4">
                                        
                                        <label class="custom-file-upload">
                                          <asp:FileUpload ID="FileAttach1" TabIndex="32" Style="padding: 4px;" Width="100%" Font-Size="12px" runat="server" />
                                            <img src="images/Icon feather-upload-cloud.png" style="vertical-align: middle;height:15px;width:15px;position: relative;top: 2px;left: 0px;"  alt="In Progress" border="0"/><br/>
                                            <span id="ChooseFile1" style="font-size: 11px;position: relative;top: -5px;left: 0px;" runat="server">Choose File</span>
       
                                        </label>
                                    </div>

                                    <div class="col-xs-3 col-sm-2 col-md-2 text-left bodytxt_black" style="padding-right: 0px; position: relative; top: 5px;">
                                        <font face="MS Sans Serif" color='red' size="4">&nbsp;</font>Invoice&nbsp;Attachment&nbsp; 
                                    </div>

                                    <div class="col-xs-5 col-sm-4 col-md-4">
                                        <label class="custom-file-upload">
                                        <asp:FileUpload ID="FileAttach2" TabIndex="32" Style="padding: 4px;" Font-Size="12px" Width="100%" runat="server" />
                                            <img src="images/Icon feather-upload-cloud.png" style="vertical-align: middle;height:15px;width:15px;position: relative;top: 2px;left: 0px;" alt="In Progress"  border="0"><br/>
                                            <span id="ChooseFile2" style="font-size: 11px;position: relative;top: -5px;left: 0px;" runat="server">Choose File</span>
                                            </label>
                                    </div>

                                </div>


                                <%--<div class="row">

                                    <div class="col-xs-3 col-sm-2 col-md-2 text-left bodytxt_black" style="padding-right: 0px; position: relative; top: 10px;"><font face="MS Sans Serif" color='red' size="4">&nbsp;</font>Invoice&nbsp;Attachment&nbsp;</div>
                                    <div class="col-xs-5 col-sm-4 col-md-4">
                                        
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-2">
                                    </div>
                                </div>--%>
                                <div class="row">

                                    <div class="col-xs-3 col-sm-2 col-md-2 text-left bodytxt_black" style="padding-right: 0px; position: relative; top: 5px;"><font face="MS Sans Serif" color='red' size="4">&nbsp;</font>Payment&nbsp;Attachment&nbsp;</div>
                                    <div class="col-xs-5 col-sm-4 col-md-4">
                                        <label class="custom-file-upload">
                                        <asp:FileUpload ID="FileAttach3" TabIndex="32" Style="padding: 4px;" Font-Size="12px" Width="100%" runat="server" />
                                            <img src="images/Icon feather-upload-cloud.png" style="vertical-align: middle;height:15px;width:15px;position: relative;top: 2px;left: 0px;"  alt="In Progress" border="0"><br/>
                                            <span id="ChooseFile3" style="font-size: 11px;position: relative;top: -5px;left: 0px;">Choose File</span>
                                            </label>
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-2">
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="col-xs-3 col-sm-2 col-md-2 text-left bodytxt_black" style="padding-right: 0px;"><font face="MS Sans Serif" color='red' size="4">&nbsp;&nbsp;</font>&nbsp; &nbsp;</div>
                                    <div class="col-xs-5 col-sm-4 col-md-4">

                                        <div class="col-xs-4 col-sm-4 col-md-2">
                                        </div>
                                    </div>

                                </div>
                            </div>


                                <div class="" align="center" style="padding: 10px;">

                                    <asp:Button ID="btnsave" runat="server" OnClientClick="return validform();" Width="80px" TabIndex="47" class="login_button" Text="Submit" OnClick="btnsave_Click" />

                                </div>


                        </div>
                    </div>
                </div>
                    </div>


        </div>


        <%--Hidden fields--%>

            <input type="hidden" id="hdnTrackNo" runat="server" value="" />
            <input type="hidden" id="hdnPOCode" runat="server" value="" />
            <input type="hidden" id="hdnInvoiceCode" runat="server" value="" />
            <input type="hidden" id="hdnPaymentCode" runat="server" value="" />
            <input type="hidden" id="hdnpaymentFDvalue" runat="server" value="" />
            <input type="hidden" id="hdnValidationError" runat="server" value="" />
            <input type="hidden" id="hdnInvoiceValue" runat="server" value="" />
            
        <input type="hidden" id="hdnPaySubmitID" runat="server" value="" />
        <input type="hidden" id="hdnPaySubmitName" runat="server" value="" />
        <input type="hidden" id="hdnPOSubmitID" runat="server" value="" />
        <input type="hidden" id="hdnPOSubmitName" runat="server" value="" />
        <input type="hidden" id="hdnINSubmitID" runat="server" value="" />
        <input type="hidden" id="hdnINSubmitName" runat="server" value="" />
        
        
    </form>
</body>
</html>
