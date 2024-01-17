<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="connection.commonConnection"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<!DOCTYPE html>
<html>
<head>
    <title>Display Patients</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h1>Patients Data</h1>

    <table border="1">
        <tr>
            <th>username</th>
            <th>Name</th>
            <th>Email ID</th>
            <th>Phone No.</th>
            <th>Address</th>
            <th>City</th>
            <th>Father's Name</th>
            <th>Blood Group</th>
            <th>Gender</th>
            <th>Age</th>
            <th>Date of Birth</th>
            <th>Disease</th>
            <th>Medicines</th>
            <th>Test Name</th>
            <th>Test Result</th> 
            <!-- Add more columns as needed -->
        </tr>
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
        String sqlQuery = "SELECT * from patient;";
        rs = stmt.executeQuery(sqlQuery);
        while(rs.next()){
    %>
        <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
            <td><%= rs.getString(7) %></td>
            <td><%= rs.getString(8) %></td>
            <td><%= rs.getString(9) %></td>
            <td><%= rs.getString(10) %></td>
            <td><%= rs.getString(11) %></td>
            <td><%= rs.getString(12) %></td>
            <td><%= rs.getString(13) %></td>
            <td><%= rs.getString(14) %></td>
            <td><%= rs.getString(15) %></td>
            <!-- Add more columns as needed -->
        </tr>
     <%   }} catch (Exception e) {
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
    </table>
   
</body>
</html>
