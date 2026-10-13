<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="r3sys.DigiCraft.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Products</title>
    <style>
        body {
            background-color: #8b5e3c; /* Dark Brown */
            font-family: Arial, sans-serif;
            color: #fff;
            margin: 0;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #fff8f0;
            margin-bottom: 25px;
            font-size: 28px;
        }

        table {
            width: 70%; /* Reduced table size */
            margin: auto;
            border-collapse: collapse;
            background-color: #fffaf0; /* Cream */
            box-shadow: 0 0 12px rgba(0,0,0,0.2);
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background-color: #f5e4c3; /* Lighter cream for heading */
            color: #4a3f35;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #d9b99b;
        }

        td {
            padding: 10px;
            text-align: center;
            border: 1px solid #e0c7ac;
            font-size: 15px;
            color: #3a2c1b;
        }

        tr:hover {
            background-color: #f3e6d5;
        }
    </style>
</head>
<body>
    <h2>All Products on DigiCraft</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Artisan ID</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Post Date</th>
        </tr>
        <%
            Connection con = DbConnection.connect();
            PreparedStatement pstmt = con.prepareStatement("select * from products");
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("artisanId") %></td>
            <td><%= rs.getString("productName") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getInt("price") %></td>
            <td><%= rs.getInt("stock") %></td>
            <td><%= rs.getString("postDate") %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
