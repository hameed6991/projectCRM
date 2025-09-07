window.findAddressFromZip = function(zipcode) {
  var city, state, zip;
  zip = zipcode;
 alert(zip);
  city = '';
  state = '';
 // alert("test1")
  if (zip.length === 6) {
 // alert("test2")
    $.ajax({
      type: 'POST',
      url: "http://maps.googleapis.com/maps/api/geocode/json?address=" + zip + "?key=XXXXXXXXXXXXXXXXXXXX",
     
      success: (function(_this) {
      debugger;
      alert(_this)
        return function(data) {
          if (data["status"] === "OK") {
        alert("test4")
            $('input#user_account_attributes_address_attributes_city').val(data["results"][0]["address_components"][1]["long_name"]);
           
            return $('select#user_account_attributes_address_attributes_state').val(data["results"][0]["address_components"][4]["long_name"]);
          }
        };
      })(this)
      
    });
  }
};