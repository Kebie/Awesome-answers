// Write some code to make a password field indicate the strength of the password 
// contained within it. As the user types, an indicator of password strength should 
// update beside it (a progress bar, a number, some sort of color, etc).
// A password is considered strong when:

// It has more than 8 characters
// It has at least one lower case character
// It has at least one upper case character
// It has at least one non alphanumeric character
// It has more than 12 characters
// Each of these criteria gives the password 1 point. A password is considered:

// 0 points: terrible
// 1 points: weak
// 2 points: meh meh
// 3 points: good
// 4 points: strong
// 5 points: awesome!
// Bonus
// Mark a password as terrible if it's included in a blacklist. E.g.: 
// password, 123456, 12345678, admin, master, 111111, etc. Maybe even 
// have a witty comment show up, like "Are you kidding me?"
// Add a toggle (checkbox) to display the password (change the field to type=text 
// and populate it with the current value). Unchecking the toggle switches it back 
// to type=password

$(function(){
  $("#password").keyup(function (e) {
    var password = $(this).val();
    var passStrength = passwordStrength(password);
    var passMessage = passwordMessage(passStrength);
    $('#passMessage').text(passMessage);
  });
});

function passwordStrength (password) {
  score = 0;
  if (password.length > 8) {
    ++score;
  };
  if (password.length > 12) {
    ++score;
  };
  //check for lowercase
  if (/[a-z]/.test(password)) {
    ++score;
  };
  //check for uppercase
  if (/[A-Z]/.test(password)) {
    ++score;
  };

  if (/[^\w+-]+/.test(password)) {
    ++score;
  };
  return score;
}

function passwordMessage (strength) {
  switch (strength) {
    case 0:
      return "terrible";
    case 1:
      return "weak";
    case 2:
      return "meh meh";
    case 3: 
      return "good";
    case 4:
      return "strong";
    case 5:
      return "awesome!";
    default:
      return "terrible";
  }
}