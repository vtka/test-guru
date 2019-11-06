// Password and Password Confirm match
var match = function() {
  var confirmPasswordElement = document.getElementById('confirm_password').value
  var passwordElement = document.getElementById('password').value

  if (confirmPasswordElement == passwordElement && matchCondition()) {
      matchResult('#5cb85c', 'matching')
  } 
  else if (confirmPasswordElement != passwordElement && matchCondition()) {
      matchResult('#d9534f', 'not matching')
  }

  function matchCondition() {
    if (confirmPasswordElement.length != 0 && passwordElement.length != 0) {
      return true
    }
  }

  function matchResult(color, message) {
    document.getElementById('message').style.color = color;
    document.getElementById('message').innerHTML = message;
    document.getElementById('password').style.borderColor = color;
    document.getElementById('confirm_password').style.borderColor = color;
  }
}