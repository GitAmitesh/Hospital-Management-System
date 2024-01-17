<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>Doctor Registration</title>
  <style>
     body {
      font-family: Arial, sans-serif;
      background-image: url('path_to_your_image.jpg'); /* Replace 'path_to_your_image.jpg' with the actual path to your image */
      background-size: cover; /* Ensures the image covers the entire background */
      margin: 0;
      padding: 0;
    }

    .container {
      width: 50%;
      margin: 50px auto;
      background-color: rgba(255, 255, 255, 0.8); /* Optional: Adds a semi-transparent white background to the form */
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
      text-align: center;
    }

    form {
      max-width: 600px;
      margin: 0 auto;
    }

    label {
      display: block;
      margin-bottom: 5px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="date"],
    input[type="number"],
    select,
    textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    select {
      padding: 10px 5px;
    }

    .gender{
        display: flex;
        margin-bottom: 15px;
        justify-content:space-evenly;
    }

    button {
      background-color: black;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      margin: 20px 0 20px 250px;
    }

    button:hover {
      background-color: #45a049;
    }

    p{
        margin: 0;
        padding: 0;
        margin-bottom: 10px;
    }
  </style>
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

<div class="container">
  <h2>Doctor Registration</h2>
  <form id="registerDoctor" action="./registerServlet" method="post">
  
  	<input type="hidden" name="userType" value="doctor">
  	
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    
    <p id="errorUser" style="font-size: 14px; color: red;"></p>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>

    <label for="phone">Phone Number:</label>
    <input type="number" id="phone" name="phone" required>

    <p id="errorPhone" style="font-size: 14px; color: red;"></p>

    <label for="address">Address:</label>
    <textarea id="address" name="address" required></textarea>

    <label for="dob">Date of Birth:</label>
    <input type="date" id="dob" name="dob" required>
    
    <label for="gender">Gender:</label>
    <div class="gender">
    <label><input type="radio" name="gender" value="male" required>Male</label>
    <label><input type="radio" name="gender" value="female" required>Female</label>
    </div>
        
    <label for="bloodGroup">Blood Group:</label>
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

    <label for="specialisation">Specialisation:</label>
    <input type="text" id="specialisation" name="specialisation" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    
    <label for="confirmPassword">Confirm Password:</label>
    <input type="password" id="confirmPassword" name="confirmPassword" required>

    <p id="errorPass" style="font-size: 15px; color: red;"></p>
    
    <button type="button" style="font-weight: bold;" onclick="formatAndSubmit()">Submit</button>
  </form>
</div>


</body>
</html>