// Password and Password Confirm match
var check = function() {
  if (document.getElementById('password').value ==
    document.getElementById('confirm_password').value && document.getElementById('confirm_password').value.length != 0) {
    // document.getElementById('message').style.color = 'green';
    // document.getElementById('message').innerHTML = 'matching';
    document.getElementById('password').style.borderColor = '#5cb85c';
    document.getElementById('confirm_password').style.borderColor = '#5cb85c';
  } else if (document.getElementById('password').value !=
      document.getElementById('confirm_password').value && document.getElementById('password').value.length != 0) {
    // document.getElementById('message').style.color = 'red';
    // document.getElementById('message').innerHTML = 'not matching';
    document.getElementById('password').style.borderColor = '#d9534f';
    document.getElementById('confirm_password').style.borderColor = '#d9534f';
  } else {
    document.getElementById('password').style.borderColor = '#5cb85c';
    document.getElementById('confirm_password').style.borderColor = '#5cb85c';
  }
}

// create green function
// create  red function
// empty password filled confirmation shows green - to fix
// add else logic???