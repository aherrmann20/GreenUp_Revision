function checkInput(){
  var name = $("#user_name").val();
  var email = $("#user_email").val();
  
  // Verify name field isn't blank
  if(name == null || name == "") {
    $("#email_input_response").html();
  }// Verify email valid
  else if(!validateEmail(email)) {
    $("#email_input_response").html('Please enter your valid email address.');
  } // Old User
  else {
    $("#email_input_response").html('<input class="button" name="commit" type="submit" value="Get Started >>">');
  }
}

function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
} 

$(document).ready(function() {
  $("#user_name").bind("keyup paste click", checkInput);
  $("#user_email").bind("keyup paste click", checkInput);
});