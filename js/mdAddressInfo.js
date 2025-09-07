




//R4_4_0 - CHanges
//added by Padmanaban for Filling State from Google API
function GetState_GoogleAPIPincode() {


    if (document.getElementById("txtPincode").value == "") {
        document.getElementById("txtCity").value = "";
    }



    if (document.getElementById("txtPincode").value != "" && document.getElementById("txtPincode").value != document.getElementById("hdnpincode").value) {
        //alert('affect1')
        document.getElementById("txtPincode").value = document.getElementById("txtPincode").value;
        try {
            var city = document.getElementById("txtPincode").value;
            document.all.txtCity.value = "";
            city = city + "+India";
            //  alert('1=' + city)
            var state = "";
            //var country=document.getElementById("cmbCountry").value;
            var country = "";
            //  alert(country)
            var city1 = "";
            var addr = {};
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'address': city }, function (result, status) {
                // alert('2'+ city)
                if (status == google.maps.GeocoderStatus.OK) {
                    // alert('3'+ status)
                    for (var component in result[0]['address_components']) {
                        for (var i in result[0]['address_components'][component]['types']) {
                            if (result[0]['address_components'][component]['types'][i] == "administrative_area_level_1") {
                                // alert(result[0]['address_components'][component]['long_name'])                   
                                state = result[0]['address_components'][component]['long_name'];
                                //  alert(state)
                                lsval = state + "|" + state + "^^^";
                                fnBindDropDown_GoogleAPI("cmbState")
                            }
                            // debugger;
                            if (result[0]['address_components'][component]['types'][i] == "locality" || result[0]['address_components'][component]['types'][i] == "administrative_area_level_2" || result[0]['address_components'][component]['types'][i] == "administrative_area_level_3")
                                // if ( result[0]['address_components'][component]['types'][i] == "locality,political" ||  result[0]['address_components'][component]['types'][i] == "sublocality,political"   || result[0]['address_components'][component]['types'][i] == "neighborhood,political" || result[0]['address_components'][component]['types'][i] =="administrative_area_level_2,political" || result[0]['address_components'][component]['types'][i] =="administrative_area_level_3,political"  ) 
                                // if ( result[0]['address_components'][component]['types'][i] == "administrative_area_level_2,political" || result[0]['address_components'][component]['types'][i] == "administrative_area_level_3,political" ||result[0]['address_components'][component]['types'][i] == "locality,political" )
                                //if ( result[0]['address_components'][component]['types'][i] == "ctl00_ContentPlaceHolder1_txtCity_I") 
                            {

                                city1 = result[0]['address_components'][component]['long_name'];
                                //  alert(city1)
                                if (city1 != "Kutch") {
                                    document.all.txtCity.value = city1;
                                }
                            }

                        }


                    }

                    if (state == "") {
                        fnGetState();
                    }

                }
                else {
                    fnGetState();
                }
            });
        }
        catch (ex) {
            fnGetState();
        }
    }

    else {
        if (document.getElementById("txtPincode").value == "") {
            fnGetState();
        }

    }
}
function GetState_GoogleAPIPincode2() {
    if (document.getElementById("txtsPincode").value != "" && document.getElementById("txtsPincode").value != document.getElementById("hdnspincode").value) {
        //    document.getElementById("txtsPincode").value = document.getElementById("txtsPincode").value;

        try {
            var city = document.getElementById("txtsPincode").value;
            document.all.txtsCity.value = "";
            city = city + "+India";
            //  alert('1=' + city)
            var state = "";
            //var country=document.getElementById("cmbCountry").value;
            var country = "";
            //  alert(country)
            var city1 = "";
            var addr = {};
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'address': city }, function (result, status) {
                // alert('2'+ city)
                if (status == google.maps.GeocoderStatus.OK) {
                    // alert('3'+ status)
                    for (var component in result[0]['address_components']) {
                        for (var i in result[0]['address_components'][component]['types']) {
                            if (result[0]['address_components'][component]['types'][i] == "administrative_area_level_1") {
                                // alert(result[0]['address_components'][component]['long_name'])                   
                                state = result[0]['address_components'][component]['long_name'];
                                //  alert(state)
                                lsval = state + "|" + state + "^^^";
                                fnBindDropDown_GoogleAPI("ddlshipstate")
                            }
                            // debugger;
                            if (result[0]['address_components'][component]['types'][i] == "locality" || result[0]['address_components'][component]['types'][i] == "administrative_area_level_2" || result[0]['address_components'][component]['types'][i] == "administrative_area_level_3")
                                // if ( result[0]['address_components'][component]['types'][i] == "locality,political" ||  result[0]['address_components'][component]['types'][i] == "sublocality,political"   || result[0]['address_components'][component]['types'][i] == "neighborhood,political" || result[0]['address_components'][component]['types'][i] =="administrative_area_level_2,political" || result[0]['address_components'][component]['types'][i] =="administrative_area_level_3,political"  ) 
                                // if ( result[0]['address_components'][component]['types'][i] == "administrative_area_level_2,political" || result[0]['address_components'][component]['types'][i] == "administrative_area_level_3,political" ||result[0]['address_components'][component]['types'][i] == "locality,political" )
                                //if ( result[0]['address_components'][component]['types'][i] == "ctl00_ContentPlaceHolder1_txtCity_I") 
                            {

                                city1 = result[0]['address_components'][component]['long_name'];
                                //  alert(city1)
                                if (city1 != "Kutch") {
                                    document.all.txtsCity.value = city1;
                                }
                            }

                        }


                    }

                    if (state == "") {
                        fnGetState();
                    }

                }
                else {
                    fnGetState();
                }
            });
        }
        catch (ex) {
            fnGetState();
        }
    }
    else {
        if (document.getElementById("txtPincode").value == "") {

            fnGetState();
            document.all.txtCity.value = "";

        }

    }
}


function fnGetState() {
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xml = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    }
    lsval = "";
    var sURL = "WebRequest.asmx/GetStateName"
    xml.open("POST", sURL, false);
    xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xml.send()
    lsval = xml.responseText;

    fnBindDropDown("cmbState");

}
function fnBindDropDown_GoogleAPI(cmbDropDown) {
    var optn_GoogleAPI = document.createElement("option");
    document.getElementById(cmbDropDown).options.length = 0;

    if (lsval != "") {
        var arReceived_GoogleAPI = lsval.split("^^^");
        for (i = 0; i < arReceived_GoogleAPI.length - 1; i++) {
            var arToBind_GoogleAPI = arReceived_GoogleAPI[i].split("|");
            optn_GoogleAPI = document.createElement("option");
            optn_GoogleAPI.text = arToBind_GoogleAPI[0];
            optn_GoogleAPI.value = arToBind_GoogleAPI[1];
            document.getElementById(cmbDropDown).options.add(optn_GoogleAPI);
        }
    }
}


function fnBindDropDown(cmbDropDown) {
    optn = document.createElement("option");
    document.getElementById(cmbDropDown).options.length = 0;
    optn.text = "<-Select->";
    optn.value = "";
    document.getElementById(cmbDropDown).options.add(optn);
    if (lsval != "") {
        arReceived = lsval.split("^^^");
        for (i = 0; i < arReceived.length - 1; i++) {
            arToBind = arReceived[i].split("|");
            optn = document.createElement("option");
            optn.text = arToBind[0];
            optn.value = arToBind[1];
            document.getElementById(cmbDropDown).options.add(optn);

        }
    }
}



