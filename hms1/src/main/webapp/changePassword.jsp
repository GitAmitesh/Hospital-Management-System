<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./assets/css/stylelogin.css">
<head>
<meta charset="ISO-8859-1">
<title>Change password</title>
</head>
<body>
	<div class="wrapper">
        
        <form action="./changePassServlet" method="post">
       
        <h1>Change Password</h1>
            <div class="input-box" >
                <input type="text" placeholder="Username" id="username" name="username" required>
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box" >
                <input type="password" placeholder="Old Password" id="password" name="oldPassword" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="input-box" >
                <input type="password" placeholder="New Password" id="password" name="newPassword" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <button type="submit" class="btn">Change password</button>
            <% String errorParam = (String)request.getParameter("error");
            if(errorParam!=null){%>
            		<p style="color:red;"><br><%= errorParam %></p> <%}%>
           
        </form>
    </div>
</body>
</html>