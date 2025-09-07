<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutoCompleteTextbox.aspx.cs" Inherits="apa_pack.AutoCompleteTextbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <link rel="Stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/redmond/jquery-ui.css" />
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>

    <script type="text/javascript">


        $(function () {

            $("#txtCompanyName").autocomplete({
                source: function (request, response) {
                    /*debugger;*/
                    const input = "A00001,~,KB Super Market,A00002,~,Apa Package,A00004,~,A2Z Icon Enterprise,A00007,~,VMR Traders,A00009,~,Torrent pharmaceuticals limited";
                    $.ajax({
                        url: "AutoCompleteTextbox.aspx/GetAccountName",
                        data: "{ 'pre':'" + request.term + "'}",

                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                             

                             
                            alert("s")
                            //var input = data.d;
                            alert(input)
                            
                            // Split the input into an array by commas
                            var splitArray = input.split(',');
                            alert(splitArray)
                            // Initialize an array for the 2nd value and the next value
                            var resultArray = "";

                            // Loop through `splitArray` to get every 2nd and next value
                            for (let i = 2; i < splitArray.length; i += 3) {
                                resultArray = splitArray[i];
                            }

                            alert("Array of 2nd values and the next:", resultArray);


                            response($.map(data.d, function (item) {
                                
                                return { value: item }
                            }))
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(textStatus);
                        }
                    });
                },

            });
        });


    </script>

</head>

    <script language="javascript" type="text/javascript">

        

        
       <%-- $(function () {
     
                $('#<%=txtCompanyName.ClientID%>').autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "AutoCompleteTextbox.aspx/GetCompanyName",
                    data: "{ 'pre':'" + request.term + "'}",
                    
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return { value: item }
                        }))
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(textStatus);
                    }
                });
            }
        });
        });--%>
    </script>


<body>
    <form id="form1" runat="server">
        <div>

            <h3>Auto Complete Textbox without using Web Service</h3>
            <table>
                <tr>
                    <td>Type Printer Name: </td>
                    <td>
                        <div class="ui-widget" style="text-align:left">
                                <asp:TextBox ID="txtCompanyName" runat="server" Width="350px" CssClass="textboxAuto"  Font-Size="12px" OnTextChanged="txtCompanyName_TextChanged" />
                        </div>
                    </td>
                </tr>        
            </table>


        </div>
    </form>
</body>
</html>
