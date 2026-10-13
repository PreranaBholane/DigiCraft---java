<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="r3sys.DigiCraft.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Buyers</title>
    <style>
        body {
            background-color: #8b5e3c; /* Brown background */
            font-family: Arial, sans-serif;
            color: #4a3f35;
            margin: 0;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #fffaf0;
            margin-bottom: 30px;
            font-size: 26px;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fffaf0; /* Cream white table */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            font-size: 16px;
        }

        th {
            background-color: #dcb89f; /* Slightly reddish-brown heading */
            color: #3a2c1b;
            padding: 12px;
            border: 1px solid #cfae94;
        }

        td {
            padding: 10px;
            text-align: center;
            border: 1px solid #e0c7ac;
            color: #4a3f35;
        }

        tr:hover {
            background-color: #f8f1e6;
        }
    </style>
</head>
<body>

    <h2>All Registered Buyers</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Contact</th>
            <th>Address</th>
            <th>Email</th>
        </tr>
        <%
            Connection con = DbConnection.connect();
            PreparedStatement pstmt = con.prepareStatement("select * from buyer");
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("contact") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("email") %></td>
        </tr>
        <%
            }
        %>
    </table>

</body>
</html>
