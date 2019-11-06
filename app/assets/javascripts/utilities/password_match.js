// Password and Password Confirm match
var match = function() {
  var confirmPasswordElement = document.getElementById('confirm_password').value
  var passwordElement = document.getElementById('password').value

  if (confirmPasswordElement == passwordElement) {
      matchResult('#5cb85c', 'matching')
  } 
  else if (confirmPasswordElement != passwordElement) {
      matchResult('#d9534f', 'not matching')
  }
  
  function matchResult(color, message) {
    document.getElementById('message').style.color = color;
    document.getElementById('message').innerHTML = message;
    document.getElementById('password').style.borderColor = color;
    document.getElementById('confirm_password').style.borderColor = color;
  }
}