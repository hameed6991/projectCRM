function passvalues(x) {
    //alert($("#ASPxContactComboBox").val());
    alert(x);
    // $("#ASPxContactComboBox").val(x);
    //document.getElementById("ASPxContactComboBox").selectedIndex = x;
    //var val = document.getElementById("txtIssueRefNo").value;
    //alert(val);
    //document.getElementById("txtIssueRefNo").value = x;
    
    passvalues2(x);
}
function checkstring(obj) {
    
    var specialchars = "`~#%^&+=|'><*"
    var retval;
    var inobj, message;
    inobj = obj;
    a = inobj.value;
    if (a == "") {
        return;
    }
    l = a.length;
    retval = "";
    for (i = 0; i < l; i++) {
        if (specialchars.indexOf(a.charAt(i)) == -1) {
            if (a.charCodeAt(i) != 34) {
                retval = retval + a.charAt(i)
            }          
        }
     }
    inobj.value = retval;
    return
}
//function checkstring1(obj) {

//    var iChars = "!`@#$%^&*()+=-[]\\\';,./{}|\":<>?~_";

//    //var data = document.getElementById("TextBox1").value;

//    for (var i = 0; i < obj.length; i++) {

//        if (iChars.indexOf(obj.charAt(i)) != -1) {

//            alert("Your string has special characters. \nThese are not allowed.");
                     
//            return false;

//        }

//    }
//    return true;
//}
