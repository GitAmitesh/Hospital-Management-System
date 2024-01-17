<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="hospital.css">
        <style>
            body {
                background: url(bg5.jpg) 50%;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-image: 100%;
                background-size: cover;
            }
    
            /* .about-content h2 {
                font-size: 23px;
                margin-bottom: 15px;
                color: #666;
            }
    
            .about-content p {
                font-size: 18px;
                line-height: 1.5;
                color: #666;
            }
    
            .about-content .read-more {
                display: inline-block;
                padding: 10px 20px;
                color: #7a71f6;
                font-size: 19px;
                text-decoration: none;
                border-radius: 25px;
                margin-top: 15px;
                transition: 0.7s ease;
                background-color: #cdcdcd6f;
            }
    
            .about-content .read-more:hover {
                background-color: #70bf73;
            } */
        </style>
    </head>
    
    <body>
    
    
    
        <div class="" style="text-align: center; padding-top: 60px;">
            <h1 style="font-size: 50px;">DOCTOR</h1>
        </div>
        <div class="container">
            <section class="about">
                <div class="about-image">
                    <a href="new.html"><img src="appointment2.jpg" alt=""></a>
                    <h3>APPOINTMENTS</h3>
                </div>
    
                <div class="about-image">
                    <a href="new.html"><img src="patient.jpg" alt=""></a>
                    <h3>PATIENTS</h3>
                </div>
    
                <div class="about-image">
                    <a href="new.html"><img src="pro.webp" alt=""></a>
                    <h3>PROFILE</h3>
                </div>
    
            </section>
        </div>
    
    
    </body>
</html>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Establish a database connection
       	conn = commonConnection.getConnection();
        // Create a statement and execute a query
        stmt = conn.createStatement();
        String username = (String)session.getAttribute("username");
        String sqlQuery = "SELECT name from doctor where username='"+username+"'";
        rs = stmt.executeQuery(sqlQuery);
		rs.next();
		String name = (String)rs.getString(1);
		session.setAttribute("name",name);
		
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
		%>
		<%@ page import="connection.commonConnection"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>