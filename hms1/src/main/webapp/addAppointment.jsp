<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="connection.commonConnection"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add appointment</title>

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
      border-color: #45a049;
    }

    p{
        margin: 0;
        padding: 0;
        margin-bottom: 10px;
    }
  </style>
  
    <script>
    <% String check = (String)request.getParameter("check");
    if(check==null){%>
    window.onload = function() {
        document.getElementById("checkAvailability").submit();
    };<%}%>

function getCurrentDate() {
    var today = new Date();
    var year = today.getFullYear();
    var month = (today.getMonth() + 1).toString().padStart(2, '0');
    var day = today.getDate().toString().padStart(2, '0');
    return year + '-' + month + '-' + day;
}
function getCurrentTime() {
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    return `${hours}:${minutes}:${seconds}`;
}
function formatToYYYYMMDD(inputDate) {
    var date = new Date(inputDate);
    var year = date.getFullYear();
    var month = ("0" + (date.getMonth() + 1)).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    return year + "-" + month + "-" + day;
}
function formatTohhmmss(inputTime) {
	 var timeParts = inputTime.split(":");
     var hours = timeParts[0];
     var minutes = timeParts[1];
    return hours+":"+minutes;
}
function formatAndSubmit() {
    // Get the date value from the date picker
    var rawDate = document.getElementById("date").value;
	var rawTime = document.getElementById("time").value;
    // Format the date (change the format as needed)
    var formattedDate = formatToYYYYMMDD(rawDate);
	var formattedTime = formatTohhmmss(rawTime);
    // Set the formatted date back to the input field
    document.getElementById("date").value = formattedDate;
    document.getElementById("time").value = formattedTime;
    // Now, you can submit the form
    document.getElementById("addAppointment").submit();
    console.log("form submittted");
    
}
</script>
  
</head>
<body>

<div class="container">
  <h2>Book Appointment</h2>
  <%String puname = (String)session.getAttribute("username"); %>
  <form id="checkAvailability" action="./checkAvailability" method="post">

    <!-- <label for="puname">Patient Username:</label> -->
    <input type="hidden" id="puname" name="puname" value="<%=puname%>">
    
  <!--   <p id="errorUser" style="font-size: 14px; color: red;"></p>
     -->
   <!--  <button type="submit" style="font-weight: bold;">Check availability of doctors</button> -->
  </form>
    <%  
  List<String> names = (List<String>) session.getAttribute("names");
  		if(check!=null && names.size()!=0){%>
  <form id="addAppointment" action="./addAppointment" method="post"> 
 	<label for="puname">Patient Username:</label>
    <input type="text" id="puname" name="puname" value="<%=puname%>" readonly>
    <label for="doctor">Select from available doctors:</label>
        <select id="doctor" name="doctor" required>
            <% for(String name:names){ %>
            <option value="<%=name%>"><%=name%></option>
            <%} %>
        </select>

    <label for="date">Date of appointment:</label>
    <input type="date" id="date" name="date" min="getCurrentDate()" required>
	
	<label for="time">Time of appointment:</label>
    <input type="time" id="time" name="time" min="getCurrentTime()" required>
    
	<input type="hidden" name="status" value="scheduled">
    
    <button type="button" style="font-weight: bold;" onclick="formatAndSubmit()">Submit</button>
  </form>
  <%}else{ %>
  <p id="error" style="font-size: 14px; color: red;">No doctors available currently.</p>
  <%} %>
</div>

</body>
</html>