 <%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="home.aspx.cs" Inherits="apa_pack.home" %>

 
<%@ Register Src="~/UserControl/BarChart.ascx" TagPrefix="Shortcuts" TagName="BarChart" %>

<%@ Register Src="~/UserControl/DoughNutChart.ascx" TagPrefix="Shortcuts" TagName="DoughNutChart" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 


    <%-- --- --%>

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/home.css"/>  
    

    <%-- --- --%>
     
 

     <%--<meta id="IE8CompatibilityMeta" runat="server" http-equiv="X-UA-Compatible" content="IE=Edge" />--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <%--<meta http-equiv="X-UA-Compatible" content="IE=8" />--%><%--Edge--%>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="css/CommonStyle.css" rel="stylesheet" />
 
    <%-- --- --%>

    <%-- --- FOR FONT FAMILY --%>

    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

    <%-- --- --%>


         <%--Scroll style Start--%>
    <style type="text/css">
        /* Target the entire scrollbar */
        ::-webkit-scrollbar {
            width: 8px; /* Width of the scrollbar */
            height: 6px; /* Height of the scrollbar (for horizontal scroll) */
        }

        /* Scrollbar track (background) */
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        /* Scrollbar thumb (the draggable part) */
        ::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 10px;
        }

            /* Scrollbar thumb hover effect */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }



        .scrollable-content {
            
            padding: 0px 10px!important;
            
        }

    </style>
    <%--Scroll style End--%>


    <style type="text/css">


       

    




    </style>

    <script type="text/javascript">


        



    </script>

 


    <script type="text/javascript">




        function FunOnLoad(){ 

            //Call1();
            BarChart();
            DoughNutChart();
            LineChart();
            PieChart();
            ScatterChart();
            GaugeChart();
        }

        //Pending service request
        function BarChart() {
          
            

            $(document).ready(function () {

                //alert("yyy")


                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/BarChartControl",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {

                      
                        $("#Chart1").append(r.d);
                         


                    },
                    error: function (err) {
                       
                        alert("err2" + err.responseText);
                        
                    }

                });

               
                
            });

  

        }



        //Pending service request
        function DoughNutChart() {



            $(document).ready(function () {

                
                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/DoughNutChartControl",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {


                        $("#Chart2").append(r.d);



                    },
                    error: function (err) {

                        alert("err2" + err.responseText);

                    }

                });



            });



        }



        //Pending service request
        function LineChart() {



            $(document).ready(function () {

                //alert("yyy")


                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/LineChartControl",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {


                        $("#Chart3").append(r.d);



                    },
                    error: function (err) {

                        alert("err2" + err.responseText);

                    }

                });



            });



        }



        //Pending service request
        function PieChart() {



            $(document).ready(function () {

                //alert("yyy")


                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/PieChartControl",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {


                        $("#Chart4").append(r.d);



                    },
                    error: function (err) {

                        alert("err2" + err.responseText);

                    }

                });



            });



        }



        //Pending service request
        function ScatterChart() {



            $(document).ready(function () {

                //alert("yyy")


                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/ScatterChartControl",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {


                        $("#Chart5").append(r.d);



                    },
                    error: function (err) {

                        alert("err2" + err.responseText);

                    }

                });



            });



        }

        
        //Pending service request
        function GaugeChart() {



            $(document).ready(function () {

         
                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/GaugeChartControl",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {


                        $("#Chart6").append(r.d);



                    },
                    error: function (err) {

                        alert("err2" + err.responseText);

                    }

                });



            });



        }
        


 
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <body onload="FunOnLoad()">

       
        <div id="main" class="col-md-12">

            <div class="row border-bottom" style="padding:10px 30px;">
                <div id="main_sub2_div" class="col-md-12">

                    <div class="col-md-1 BarTitle">
                        DashBoard
                    </div>

                    <div class="col-md-3 BarObjactsLeft">
                        
                    </div>

                    <div class="col-md-8 BarObjactsRight">
                         
                        <span>
                            <img src="../images/NotificationAlert.svg" style="cursor: pointer;" /></span>

                        <span>
                            <img src="../images/ShortCut.svg" style="cursor: pointer;" /></span>

                        <span>
                            <img src="../images/Refresh.svg" style="cursor: pointer;" /></span>
                    </div>

                </div>
            </div>



            <div class="scrollable-content" style="background: #fff!important;">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px;">

                        <div class="container-fluid" id="maindivclass" style="background-color: #f1f1f1; margin: 0px;">


                            <div class="row" style="padding: 10px 10px 0px 10px;">

                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-5 divheight" id="Chart1" style="height: 450px; padding: 10px; background-color: #ffffff; border-radius: 12px; border: 5px solid #f1f1f1;">
                                    <%--  <Shortcuts:BarChart runat="server" ID="BarChart" />--%>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 divheight" id="Chart2" style="height: 450px; padding: 10px; background-color: #ffffff; border-radius: 12px; border: 5px solid #f1f1f1;">
                                    <%--<Shortcuts:DoughNutChart runat="server" id="DoughNutChart" />--%>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 divheight" id="Chart3" style="height: 450px; padding: 10px; background-color: #ffffff; color: yellowgreen; border-radius: 12px; border: 5px solid #f1f1f1;">
                                </div>



                            </div>




                            <div style="height: 5px">&nbsp;</div>




                            <div class="row" style="padding: 0px 10px 0px 10px;">

                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 divheight" id="Chart6" style="height: 450px; padding: 10px; background-color: #ffffff; border-radius: 12px; border: 5px solid #f1f1f1;"></div>

                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-5 divheight" id="Chart5" style="height: 450px; padding: 10px; background-color: #ffffff; border-radius: 12px; border: 5px solid #f1f1f1;">
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 divheight" id="Chart4" style="height: 450px; padding: 10px; background-color: #ffffff; border-radius: 12px; border: 5px solid #f1f1f1;">
                                </div>


                            </div>

                            <div style="height: 5px">&nbsp;</div>




                            <%-- <div class="row" style="padding: 0px 10px 40px 10px;">

                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 divheight" id="7" style="height: 360px; padding: 10px; background-color: #ffffff; border-radius: 12px;">
                                    </div>

                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 divheight" id="2" style="height: 360px; padding: 10px; background-color: #ffffff; border-radius: 12px;">
                                    </div>

                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 divheight" id="1" style="height: 360px; padding: 10px; background-color: #ffffff; border-radius: 12px;">
                                    </div>

                                </div>--%>



                            <div style="height: 5px">&nbsp;</div>



                            <%--                             <div class="row" style="padding: 2px 0px; margin-top: -3px;">

                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 divheight" id="2" style="margin-bottom: 61px;">
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 divheight" id="11">
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 divheight" id="12" style="margin-bottom: 43px; height: 282px;">
                                </div>

                            </div>--%>
                        </div>

                    </div>
                </div>



                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    </div>
                </div>




                <div class="container">
                </div>



            </div>
        </div>

         

    </body>

   
</asp:Content>


