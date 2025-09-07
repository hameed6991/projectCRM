/// <reference path="drilldownmodal.js" />

function opendrilldownmodal(chartid, condition, chartname) {
        
    
    url = "Drilldowndetail.aspx?&ChartId=" + chartid + "&Condition=" + condition + "&ChartName=" + chartname + "";

    $("#objChart1").attr("src", url);
    $('#Chart1Modals').modal('show');
}
function CloseModal() {
    $("#objChart1").attr("src", "Loading.aspx");
    $('#Chart1Modals').modal('hide');
}
function Scorecardmodal(Sdate, Edate, Extype) {
   // alert(Sdate + "," + Edate + "," + Extype);

    url = "DrilldownScorecard.aspx?&Sdate=" + Sdate + "&Edate=" + Edate + "&Exptype=" + Extype + "";

    $("#objChart1").attr("src", url);
    $('#Chart1Modals').modal('show');
}


function DrilldownScoreCard(e) {
    var input = e;
  //  alert(input);
    var fields = input.split(',');
    var Startdate =fields[0];
    
    var Enddate = fields[1];
    
    var Exptype = fields[2];
    

    $.ajax({
        data: "{'Sdate':'" + Startdate + "','Edate':'" + Enddate + "','Exptype':'" + Exptype + "'}",
        // data: "{}",
        url: "WebService1.asmx/DrillDownUserScorecard",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            // alert(data.d);
            var input = data.d;
           
            var fields = input.split('|');
            var Sdate = fields[0];
            // var Enccondition = fields[1];
            var Edate = encodeURIComponent(fields[1]);

            // alert(Enccondition);

            var Extype = encodeURIComponent(fields[2]);
           //  alert(Encchartname);

            Scorecardmodal(Sdate, Edate, Extype);

        },
        error: function (err) {
            //   $("#1").append(err.responseText);
            alert("err4" + err.responseText);
        }

    });

}

function Drilldowncontrol(chartid, condition, chartname) {
  
    $.ajax({
        data: "{'chartid':'" + chartid + "','condition':'" + condition + "','chartname':'" + chartname + "'}",
       // data: "{}",
        url: "WebService1.asmx/DrillDownUserControl",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            // alert(data.d);
            var input = data.d;
            // alert(input);
            var fields = input.split('|');
            var Encchartid = fields[0];
           // var Enccondition = fields[1];
            var Enccondition = encodeURIComponent(fields[1]);

           // alert(Enccondition);

            var Encchartname = encodeURIComponent(fields[2]);
            // alert(Encchartname);

            opendrilldownmodal(Encchartid, Enccondition, Encchartname);

        },
        error: function (err) {
         //   $("#1").append(err.responseText);
            alert("err4" + err.responseText);
        }

    });

     // document.getElementById("hdndiv6").value = "hide";

}

function NPSDrilldowncontrol(chartid, condition, chartname) {

    $.ajax({
        data: "{'chartid':'" + chartid + "','condition':'" + condition + "','chartname':'" + chartname + "'}",
        // data: "{}",
        url: "WebService1.asmx/DrillDownUserControl",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            // alert(data.d);
            var input = data.d;
            // alert(input);
            var fields = input.split('|');
            var Encchartid = fields[0];
            // var Enccondition = fields[1];
            var Enccondition = encodeURIComponent(fields[1]);

            // alert(Enccondition);

            var Encchartname = encodeURIComponent(fields[2]);
            // alert(Encchartname);

            Npsopendrilldownmodal(Encchartid, Enccondition, Encchartname);

        },
        error: function (err) {
            //   $("#1").append(err.responseText);
            alert("err4" + err.responseText);
        }

    });

    // document.getElementById("hdndiv6").value = "hide";

}

function Npsopendrilldownmodal(chartid, condition, chartname) {


    url = "NPSDrilldown.aspx?&ChartId=" + chartid + "&Condition=" + condition + "&ChartName=" + chartname + "";

    $("#objChart1").attr("src", url);
    $('#Chart1Modals').modal('show');
}


function ActivityCountDetail(Monthnames, year, location, engineer, principal) {
    url = "Activitydetails.aspx?&Monthnames=" + Monthnames + "&year=" + year + "&location=" + location + "&engineer=" + engineer + "&principal=" + principal + "";

    $("#objChart1").attr("src", url);
    $('#Chart1Modals').modal('show');
}


function ContractDrilldowncontrol(chartid, condition, chartname) {

    $.ajax({
        data: "{'chartid':'" + chartid + "','condition':'" + condition + "','chartname':'" + chartname + "'}",
        // data: "{}",
        url: "WebService1.asmx/DrillDownUserControl",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            // alert(data.d);
            var input = data.d;
            // alert(input);
            var fields = input.split('|');
            var Encchartid = fields[0];
            // var Enccondition = fields[1];
            var Enccondition = encodeURIComponent(fields[1]);
            var Encchartname = encodeURIComponent(fields[2]);
            contractopendrilldownmodal(Encchartid, Enccondition, Encchartname);

        },
        error: function (err) {            
            alert("err4" + err.responseText);
        }
    });
}


function contractopendrilldownmodal(chartid, condition, chartname) {


    url = "WarAmcDrilldown.aspx?&ChartId=" + chartid + "&Condition=" + condition + "&ChartName=" + chartname + "";

    $("#objChart1").attr("src", url);
    $('#Chart1Modals').modal('show');
}


function RMADrilldowncontrol(chartid, condition, chartname) {

    $.ajax({
        data: "{'chartid':'" + chartid + "','condition':'" + condition + "','chartname':'" + chartname + "'}",
        // data: "{}",
        url: "WebService1.asmx/DrillDownUserControl",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {           
            var input = data.d;           
            var fields = input.split('|');
            var Encchartid = fields[0];
            
            var Enccondition = encodeURIComponent(fields[1]);
            var Encchartname = encodeURIComponent(fields[2]);
            RMAopendrilldownmodal(Encchartid, Enccondition, Encchartname);
        },
        error: function (err) {           
            alert("err4" + err.responseText);
        }

    });
}


function RMAopendrilldownmodal(chartid, condition, chartname) {


    url = "RMADrilldown.aspx?&ChartId=" + chartid + "&Condition=" + condition + "&ChartName=" + chartname + "";

    $("#objChart1").attr("src", url);
    $('#Chart1Modals').modal('show');
}