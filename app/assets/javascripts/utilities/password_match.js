// Password and Password Confirm match
var match = function() {
  var confirmPasswordElement = document.getElementById('confirm_password')
  var passwordElement = document.getElementById('password')

  if (confirmPasswordElement.value == passwordElement.value && matchCondition()) {
      matchResult('#5cb85c', 'matching')
  } 
  else if (confirmPasswordElement.value != passwordElement.value && matchCondition()) {
      matchResult('#d9534f', 'not matching')
  }

  function matchCondition() {
    if (confirmPasswordElement.value.length != 0 && passwordElement.value.length != 0) {
      return true
    }
  }

  function matchResult(color, message) {
    document.getElementById('message').style.color = color;
    document.getElementById('message').innerHTML = message;
    passwordElement.style.borderColor = color;
    confirmPasswordElement.style.borderColor = color;
  }
}