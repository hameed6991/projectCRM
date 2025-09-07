<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LineChart.ascx.cs" Inherits="apa_pack.UserControl.LineChart" %>




<link href="../css/CommonStyles.css" rel="stylesheet" />
 

<style type="text/css">
    .plus_icon {
        background-image: url('images/plus_icon.png');
        background-repeat: no-repeat;
        width: 22px;
        height: 22px;
    }

    .minus_icon {
        background-image: url('images/minus_icon.png');
        background-repeat: no-repeat;
        width: 22px;
        height: 22px;
    }
    
     .Chart1-content {
            height: 90%;
        }

        .Chart1-body {
            max-height: 100%;
            overflow: hidden;
            height: 100vh;
        }
         #chart.pointer-on-bars .dxc-series rect{
            cursor:pointer;
        }
</style>





<body>
 

    

<!-- jQuery (required) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- DevExtreme Core & Charts -->
<link rel="stylesheet" href="https://cdn3.devexpress.com/jslib/23.1.6/css/dx.light.css">
<script src="https://cdn3.devexpress.com/jslib/23.1.6/js/dx.all.js"></script>
 

 <form runat="server" >

        <div class="row mx-n2" style="padding: 10px 20px 10px 20px;">
            <!-- Heading Section -->
            <div class="col-12 gadget_top_bg">
                <div class="row align-items-center">
                    <!-- Title -->
                    <div class="col-10 col-sm-8 text-left px-0">
                        <span class="Title">Line Chart Design</span>
                        
                    </div>
                     

                    <!-- Collapse Button -->
                    <div class="col-auto col-1 text-right pr-1">
                        
                       <%-- <span style="border-radius: 4px; background-color: mediumvioletred; flex-shrink: 0;">
                            <a href=".trchart1" id="A1" data-toggle="collapse" role="button">
                                <i id="I1" class="minus_icon"></i>
                            </a>
                        </span>--%>
                       
                    </div>

                    <!-- Filter Button -->
                    <div class="col-auto col-3 text-right p-1 d-flex justify-content-center align-items-center">
                        <span style="border-radius: 4px; padding:5px; background: #ACACAC; flex-shrink: 0;">
                            <a href="#" data-toggle="modal" data-target="#basicModal1" style="text-align: center;">
                                <img src="Icons/Filter.svg" alt="Filter" title="Filter">
                            </a>
                        </span>
                    </div>

                </div>
            </div>

            <!-- Chart Section -->
            <div class="col-12 trchart1 collapse show text-center mt-3">
                <div id="LinechartDesign" style="cursor: pointer;">
                    <!-- Chart Content Here -->
                </div>
            </div>
        </div>



        <table style="width: 100%" border="0" cellspacing="0" cellpadding="0">
            <tr align="left" valign="middle" class="gadget_top_bg" style="display:none">
                
                <td style="width: 60%"><span class="gadget_heading_txt">Pending Service Request</span></td>
                <td width="10%" align="right" valign="middle">
                    <div id="chart1parent1" role="tablist" aria-multiselectable="true">
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr align="center" valign="middle">
                                <td width="20">&nbsp;</td>
                                <td width="20">&nbsp;</td>
                                <td width="20"><a href="#" data-toggle="modal" data-target="#basicModal1">
                                    <img src="Icons/Filter.svg" width="16" height="16" border="0" title="Filter"></a></td>
                                <td width="20"><a href=".trchart1" id="chart1Abtn" role="button" data-toggle="collapse" data-parent="#chart1parent">
                                    <%--<img src="images/FilterNew.svg" width="18" height="18" border="0" title="Settings">--%>
                                    <i style="float: right;" id="chart1Ibtn" class="minus_icon"></i>
                                </a></td>
                                <td width="8">&nbsp;</td>
                            </tr>
                        </table>
                </td>
            </tr>
            <tr class="trchart1 collapse in" valign="middle">
                <td colspan="2">
                    <%--<div id="chart">
                    </div>--%>
                </td>
            </tr>
        </table>


        <div class="modal fade" id="basicModal1" tabindex="-1" role="dialog" aria-labelledby="basicModal1" aria-hidden="true">
            <div class="modal-dialog  modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel"></h4>
                    </div>



                    <div class="modal-body">

                        <table style="width: 100%;">


                            <tr>
                                <td align="right" valign="middle" class="bodytxt_black" style="height: 20px; width: 50%; text-align: right;">
                                    <font face="ms sans serif" color='red' size="3"></font>Group By &nbsp;</td>
                                <td align="left" valign="middle" style="height: 20px; text-align: left; float: left; width: 50px;">
                                    <asp:DropDownList ID="ddlfilter1" runat="server" CssClass="inputstyle" ClientIDMode="static">
                                        <asp:ListItem Text="Region" Selected="True" Value="ROName"></asp:ListItem>
                                        <asp:ListItem Text="Location" Value="LocationName"></asp:ListItem>
                                        <asp:ListItem Text="Category" Value="Product"></asp:ListItem>
                                        <asp:ListItem Text="Principal" Value="ps.Prodline"></asp:ListItem>
                                        <asp:ListItem Text="Industry" Value="industry"></asp:ListItem>
                                    </asp:DropDownList>

                                </td>
                            </tr>


                        </table>

                    </div>

                    <div class="modal-footer" style="text-align: center;">
                        <button type="button" class="btn btn-md btn-primary" data-dismiss="modal" onclick="Call1()">Filter</button>
                    </div>
                </div>
            </div>
        </div>

     
      
        <asp:HiddenField ID="hdnUsername1" runat="server" />
 </form>



</body>



<script type="text/javascript">


    


    $(document).ready(function () {
        
        waitForDxChart();
    });

 

    // dxChart not loading some time so his multiple time
    function waitForDxChart(callback, retries = 10, delay = 500) {
        //alert("dxChart loaded!");
        if ($.fn.dxChart) {
            //alert("dxChart loaded!");
            procDrawDoughNutDesign();
            procDrawBarChart();
            procDrawLineChart();
            procDrawPieChart();
            procDrawScatterChart();
            procDrawgaugeChart();

        } else if (retries > 0) {
            //alert("dxChart not ready. Retrying...");
            setTimeout(() => waitForDxChart(callback, retries - 1, delay), delay);
        } else {
            alert("Failed to load dxChart after multiple attempts.");
        }
    }


    function procDrawLineChart() {


        debugger;
        var obj = [
            { Name: "Region A", Complaint: 10, Demo: 5, "Additional PM": 3 },
            { Name: "Region B", Complaint: 7, Demo: 8, "Additional PM": 2 },
            { Name: "Region C", Complaint: 12, Demo: 6, "Additional PM": 4 }
        ];
        //alert(obj)
        var isFirstLevel = true;
        var chartContainer = $("#LinechartDesign");
        //alert(obj)
        var chart = chartContainer.dxChart({
            dataSource: obj,
            commonSeriesSettings: {
                argumentField: 'Name',
                type: 'Spline',
            },
            series: [
                { valueField: 'Complaint', name: 'Complaint', color: "#FFB900", cornerRadius: 5 },
                { valueField: 'Demo', name: 'Demo', color: "#006FB6", cornerRadius: 5 },
                { valueField: 'Additional PM', name: 'Additional PM', color: "#3F4D6F", cornerRadius: 5 }
            ],
            /*size: { height: 330, width: 600 },*/
            size: { height: 330 },
            legend: {
                verticalAlignment: "bottom",
                horizontalAlignment: "center",
                itemTextPosition: 'top'
            },
            tooltip: { enabled: true, location: "edge" },
            loadingIndicator: {
                show: true,
                backgroundColor: 'lightcyan',
                font: { weight: 700, size: 16 }
            },
            onPointClick: function (e) {
                if (isFirstLevel) {
                    isFirstLevel = false;
                    removePointerCursor(chartContainer);
                }
            },
            label: {
                visible: true,
                connector: { visible: true, width: 1 }
            }



        });
        


        addPointerCursor(chartContainer);
    }



    function addPointerCursor(Container) {
        Container.addClass("pointer-on-bars");
    }

    function removePointerCursor(Container) {
        Container.removeClass("pointer-on-bars");
    }



</script>