
function name_check(){
    var goodColor = "#ffb";
    var badColor = "#ff6666";
    if(inputfname.value.length == 0 ){
        inputfname.style.borderColor = badColor;
        inputfname.placeholder = "Name is required";
        return false;
    }
    else{
        inputfname.style.borderColor = goodColor;
        return true
    }

   
}
function email_check(){
    var goodColor = "#ffb";
    var badColor = "#ff6666";
    if(inputEmail4.value.length == 0 ){
        inputEmail4.style.borderColor = badColor;
        inputEmail4.placeholder = "Email is required";
        return false;
    }
    else{
        inputEmail4.style.borderColor = goodColor;
        return true
    }

   
}
function password_check(){
    var goodColor = "#ffb";
    var badColor = "#ff6666";
    if(inputPassword.value.length == 0 ){
        inputPassword.style.borderColor = badColor;
        inputPassword.placeholder = "Password is required";
        return false;
    }
    else{
        inputPassword.style.borderColor = goodColor;
        return true
    }

   
}
function confirm_check(){
    var goodColor = "#ffb";
    var badColor = "#ff6666";
    if(confirmPassword4.value.length == 0 ){
        confirmPassword4.style.borderColor = badColor;
        confirmPassword4.placeholder = "password confirmation is required ";
        return false;
    }
    else{
        confirmPassword4.style.borderColor = goodColor;
        return true
    }

   
}
function empty_check(){
    name_check();
    password_check();
    confirm_check();
    email_check();
}



function checkPass()
      {
          //Store the password field objects into variables ...
          
          //Store the Confimation Message Object ...
          var message = document.getElementById('confirmMessage');
          //Set the colors we will be using ...
          var goodColor = "#66cc66";
          var badColor = "#ff6666";
          //Compare the values in the password field 
          //and the confirmation field
          if(inputPassword.value != confirmPassword4.value){
            inputPassword.style.borderColor = badColor;
            confirmPassword4.style.borderColor = badColor;
            inputPassword.placeholder = "";
            confirmPassword4.placeholder = "";
            message.style.color = badColor;
            message.innerHTML = "password does not match";
            return false;

              
              
          }else{
            inputPassword.style.borderColor = goodColor;
            confirmPassword4.style.borderColor = goodColor;
            return true;
          }
      }

      function ValidateEmail()
      {   var goodColor = "#66cc66";
          var badColor = "#ff6666";
          var message = document.getElementById("emailMessage");
          var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
          if(inputEmail4.value.match(mailformat))
          {   message.innerHTML = "";
              inputEmail4.placeholder = "Email";
              inputEmail4.style.borderColor = "#000";
              return true;
          }
          else
          {
          message.innerHTML = "Invalid Email Address!";
          message.style.color = badColor;
          inputEmail4.placeholder = "Invalid Email Address !";
          inputEmail4.style.borderColor = badColor;
          return false;
          }
      }

      function passwordChecker() {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                var upperCaseLetters = /[A-Z]/g;
                var numbers = /[0-9]/g;
                var message = document.getElementById("passwordMessage");
                
                  if (!inputPassword.value.match(/[a-z]/)) {
                    message.innerHTML ="Must contain a Small letter";
                    message.style.color = "#ff6666";
                    return false;  }
                  if (!inputPassword.value.match(/[A-Z]/)) {
                    message.innerHTML ="Must contain a Capital letter";
                    message.style.color = "#ff6666";
                    return false;  }
                  if (!inputPassword.value.match(/[0-9]/)) {
                    message.innerHTML ="Must contain a Number";
                    message.style.color = "#ff6666";
                    return false;  }
                  if (inputPassword.value.length<12) {
                    message.innerHTML ="Password too short";
                    message.style.color = "#ff6666";
                    return false;  }
                    if(inputPassword.value.match(lowerCaseLetters) && inputPassword.value.match(upperCaseLetters) && inputPassword.value.match(numbers)) { 
                        message.innerHTML = "";
                        return true;
                    }
              
                
                
              }
              function stringlength()
              { 
                  var field = document.getElementById("").value; 
                  var mnlen = 0;
                  var mxlen = 1000;
              
                  if(field.length<mnlen || field.length> mxlen)
                  { 
                  
                  return false;
                  }
                  else
                  { 
                  
                  return true;
                  }
              }
              function allnumeric()
                    {
                       var numbers = /^[0-9]+$/;
                       var message = document.getElementById("ageMessage");
                       if(inputAge.value.match(numbers))
                       {
                        if(inputAge.value >127){
                            message.innerHTML = "Age out of bound exception";
                            message.style.color = "#ff6666";
                           return false
                        }
                        message.innerHTML = "";
                       return true;
                       }
                        

                       
                       else
                       {
                       message.innerHTML = "Invalid age";
                       message.style.color = "#ff6666";
                       return false;
                       }
                    }
            