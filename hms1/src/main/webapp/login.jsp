<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/stylelogin.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<title>Login</title>
</head>
<body>
	<div class="wrapper">
        
        <form action="./loginServlet" method="post">
       
        <h1>Login</h1>
            <div class="input-box" >
                <input type="text" placeholder="Username" id="username" name="username" required>
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box" >
                <input type="password" id="password" name="password" placeholder="Password" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            
            <button type="submit" class="btn">Login</button>
            
            <% String errorParam = (String)request.getParameter("error");
            if (errorParam!=null && errorParam.equals("true")){%>
            <p style="color:red;"><br>Invalid username or password. Try Again.</p><%}%>
           
        </form>
    </div>
</body>
</html>