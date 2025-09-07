
var initial = "0";
var cur_id;
function setId(cid) {
    var val = document.getElementById(cid).value;
    cur_id = cid;
    if (cid == "txtHours") {
        if (val > 23 | val == "") {
            val = "00";
        }
        document.all.txtHours.value = val;
    }
    if (cid == "txtMinutes") {
        if (val > 59 | val == "") {
            val = "00";
        }
        document.all.txtMinutes.value = val;
    }

}
function enableScroll(evt) {
    if (event.preventDefault)
        event.preventDefault();

    event.returnValue = evt;
}
function handle(delta) {
    if (delta < 0) {
        var act = document.activeElement;
        if (act.id == "txtHours") {

            decHours();

            enableScroll(false);

        }
        else if (act.id == "txtMinutes") {

            decMins();

            enableScroll(false);

        }
        else {

            enableScroll(true);

        }

    }
    else {
        var act = document.activeElement;
        if (act.id == "txtHours") {

            incHours();

            enableScroll(false);

        }
        else if (act.id == "txtMinutes") {

            incMins();

            enableScroll(false);

        }
        else {

            enableScroll(true);

        }
    }

}

/** Event handler for mouse wheel event.
 */
function wheel(event) {
    var delta = 0;

    if (!event) /* For IE. */
        event = window.event;
    if (event.wheelDelta) { /* IE/Opera. */
        delta = event.wheelDelta / 120;
    } else if (event.detail) { /** Mozilla case. */
        /** In Mozilla, sign of delta is different than in IE.
         * Also, delta is multiple of 3.
         */
        delta = -event.detail / 3;
    }

    /** If delta is nonzero, handle it.
     * Basically, delta is now positive if wheel was scrolled up,
     * and negative, if wheel was scrolled down.
     */
    if (delta)
        handle(delta);
    /** Prevent default actions caused by mouse wheel.
     * That might be ugly, but we handle scrolls somehow
     * anyway, so don't bother here..
     */
    var charCode = (event.which) ? event.which : event.keyCode // check the keypress

    if (charCode == 38) // key up arrow event
    {
        var element = document.activeElement;
        if (element.id == "txtHours") {
            incHours();
        }
        if (element.id == "txtMinutes") {
            incMins();
        }
    }
    if (charCode == 40) // key down arrow event
    {
        var element = document.activeElement;
        if (element.id == "txtHours") {
            decHours();
        }
        if (element.id == "txtMinutes") {
            decMins();
        }
    }
}

/** Initialization code. 
 * If you use your own event management code, change it as required.
 */
if (window.addEventListener)
    /** DOMMouseScroll is for mozilla. */
    window.addEventListener('DOMMouseScroll', wheel, false);
/** IE/Opera. */
window.onmousewheel = document.onmousewheel = wheel;
window.onkeyup = document.onkeyup = wheel;

function incHM() {

    if (cur_id == "txtHours") {
        incHours();

    }
    if (cur_id == "txtMinutes") {
        incMins();

    }
}
function decHM() {

    if (cur_id == "txtHours") {
        decHours();

    }
    if (cur_id == "txtMinutes") {

        decMins();
    }
}
function incHours() {
    var val = document.all.txtHours.value;
    if (val >= 23) {
        val = 0;
    }
    else {
        val++;
    }
    //                if(val<10)
    //                {   

    //                    val=initial+parseInt(val);
    //                }
    document.all.txtHours.value = val;
    document.all.txtHours.select();
}
function incMins() {
    var val = document.all.txtMinutes.value;
    if (val >= 59) {
        val = 0;
    }
    else {
        val++;
    }

    if (val < 10) {
        val = initial + parseInt(val);
    }
    document.all.txtMinutes.value = val;
    document.all.txtMinutes.select();
    return false;

}
function decHours() {
    var val = document.all.txtHours.value;
    if (val <= 0) {
        val = 23;
    }
    else {
        val--;
    }
    //                if(val<10)
    //                {   
    //                    val=initial+parseInt(val);
    //                }
    document.all.txtHours.value = val;
    document.all.txtHours.select();
    return false;
}
function decMins() {
    var val = document.all.txtMinutes.value;

    if (val <= 0) {
        val = 59;
    }
    else {
        val--;
    }
    if (val < 10) {
        val = initial + parseInt(val);
    }
    document.all.txtMinutes.value = val;
    document.all.txtMinutes.select();
}
function select(val) {
    val.select();
}
function NumOnlyTimer(evt) {

    var charCode = (evt.which) ? evt.which : event.keyCode

    if (charCode != 46 && charCode > 31
        && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function createTimecontrol(val) {
    var timerControl = "<span id='sim' style='color:black;text-align:top;'>";
    timerControl += " <input type='text' class='inputstyle' id='txtHours' onBlur='setId(this.id)' maxlength='2' onkeypress='return NumOnlyTimer(event)' onfocus='select(document.all.txtHours)' value='00' style='border:0px;width:20px;text-align:center;' />"
    timerControl += ": <input type='text' class='inputstyle' id='txtMinutes' maxlength='2' onBlur='setId(this.id)' onkeypress='return NumOnlyTimer(event)' onfocus='select(document.all.txtMinutes)' value='00' style='border:0px;width:20px;text-align:left;' />";

    document.getElementById(val.id).innerHTML = timerControl;
}
function defaultvalues() {
    createTimecontrol(document.all.TimerControl);
    defaultDate();
}
function defaultDate() {
    var date = new Date()
    var month = date.getMonth() + 1
    var day = date.getDate()
    var year = date.getFullYear()
    if (day < 10) day = "0" + day;
    if (month < 10) month = "0" + month;
    var currentDate = day + "/" + month + "/" + year;

    document.all.txtStartDate.value = currentDate;
    document.all.txtEndDate.value = currentDate;

}