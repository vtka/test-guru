// Password and Password Confirm match
var match = function() {
  var confirmPasswordElement = document.getElementById('confirm_password').value
  var passwordElement = document.getElementById('password').value

  if (confirmPasswordElement == passwordElement) {
      matchResult('#5cb85c', 'Совпадает')
  } 
  else if (confirmPasswordElement != passwordElement) {
      matchResult('#d9534f', 'Не совпадает')
  }
  
  function matchResult(color, message) {
    document.getElementById('message').style.color = color;
    document.getElementById('message').innerHTML = message;
    document.getElementById('password').style.borderColor = color;
    document.getElementById('confirm_password').style.borderColor = color;
  }
}