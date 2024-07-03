<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Doctor Registration</title>
	<link rel="stylesheet" href="./assets/css/registerStyle.css">
	
  <script>
 var allClear=1;
    //event listener for the whole document is added
document.addEventListener('DOMContentLoaded', function () {
	
	function usernameValidate(usernameValue) {
	    var formData = new FormData();
	    return fetch('/hms1/usernameCheckServlet', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/x-www-form-urlencoded',
	        },
	        body: 'username=' + encodeURIComponent(usernameValue),
	    })
	    .then(response => {
	        if (!response.ok) {
	            throw new Error(`HTTP error! Status: ${response.status}`);
	        }
	        return response.text(); // Extract text content from the response
	    })
	    .then(data => {
	        return data === 'true';
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        // Ensure the function returns a rejected promise with an appropriate value
	        return false;
	    });
	}

	var username = document.getElementById('username');
	username.addEventListener('change', function () {
	    var usernameValue = document.getElementById('username').value;
	    // Ensure that usernameValidate returns a Promise
	    usernameValidate(usernameValue)
	        .then(check => {
	        console.log(check);
	            var error = document.getElementById('errorUser');
	            if (check==true) {
	            	allClear=0;
	                error.innerText = 'Username already exists. Try using @ / numbers.';
	            } else {
	            	allClear=1;
	                error.innerText = '';
	            }
	        })
	        .catch(error => {
	            console.error('Error during validation:', error);
	            // Handle the error appropriately, e.g., display a message to the user
	        });
	});

	
    //event listener for validating phone number
    var phone = document.getElementById('phone');
    phone.addEventListener('change',function(){
        var num = document.getElementById('phone').value;
        var error = document.getElementById('errorPhone');
        if(num.length!=10){
        	allClear=0;
            error.innerText = 'Enter a valid phone number.';
        }
        else{
        	allClear=1;
            error.innerText = '';
        }
    });
    
    //event listener for validating password
    var pass = document.getElementById('confirmPassword');
    pass.addEventListener('change',function(){
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirmPassword').value;
        var error = document.getElementById('errorPass');
        if (password !== confirmPassword) {
        	allClear=0;
            error.innerText = 'Password and Confirm Password must match.';
        }
        else{
        	allClear=1;
            error.innerText = '';
        }
    });
});


    
    function formatAndSubmit() {
        if(allClear==1){
        // Get the date value from the date picker
        var rawDate = document.getElementById("dob").value;

        // Format the date (change the format as needed)
        var formattedDate = formatToYYYYMMDD(rawDate);

        // Set the formatted date back to the input field
        document.getElementById("dob").value = formattedDate;

        // Now, you can submit the form
        document.forms["registerDoctor"].submit();
        }
    }
    function formatToYYYYMMDD(inputDate) {
        var date = new Date(inputDate);
        var year = date.getFullYear();
        var month = ("0" + (date.getMonth() + 1)).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        return year + "-" + month + "-" + day;
    }
</script>
    
</head>
<body>

    <div class="wrapper">
  
        <form id="registerDoctor" action="./registerServlet" method="post">
         <h2>Doctor Registration</h2>
        
         <input type="hidden" name="userType" value="doctor">
        
          <div class="input-field">
            <input type="text" id="name" name="name" placeholder="Name" required>
          </div>
          <div class="input-field">
            <input type="text" id="username" name="username" placeholder="Username" required>
          </div>
          <p id="errorUser" style="font-size: 14px; color: red;"></p>
          <div class="input-field">
            <input type="email" id="email" name="email" placeholder="Email" required>
          </div>
          <div class="input-field">
            <input type="number" id="phone" name="phone" placeholder="Phone" required>

          </div>
          <p id="errorPhone" style="font-size: 14px; color: red;"></p>
          <div class="input-field">
            <input type="text" id="address" name="address" placeholder="Address" required>
          </div>
          <div class="input-field">
              <input type="date" placeholder="Date Of Birth" style="color: white;"  id="dob" name="dob" required>
          </div>
          
          <label for="gender">Gender:</label>
          <div class="gender">
          <label><input type="radio" name="gender" value="male" required>Male</label>
          <label><input type="radio" name="gender" value="female" required>Female</label>
          </div>
              
          <label for="bloodGroup">Blood Group:</label>
      <div class="input-field">
          <select id="bloodGroup" name="bloodGroup" required>
              <option value="A+">A+</option>
              <option value="A-">A-</option>
              <option value="B+">B+</option>
              <option value="B-">B-</option>
              <option value="O+">O+</option>
              <option value="O-">O-</option>
              <option value="AB+">AB+</option>
              <option value="AB-">AB-</option>
          </select>
      </div>
      
      
              <div class="input-field">
                  <input type="text" placeholder="Specilization" id="specialisation" name="specialisation" required>
              </div>
      
              <div class="input-field">
                  <input type="password" id="password" name="password" placeholder="Password" required>
                  
              </div>
              <div class="input-field">
                  <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
                  
              </div>
      
          <p id="errorPass" style="font-size: 15px; color: red;"></p>
          
          <button type="button" style="font-weight: bold; display: block; margin: auto;" onclick="formatAndSubmit()">Submit</button>
        </form>
      </div>
    </body>
</html>