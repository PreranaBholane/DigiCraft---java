<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="r3sys.DigiCraft.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>My Orders</title>
    <style>
        body {
            background-color: #f9f6f2; /* Off-white background */
            font-family: Arial, sans-serif;
            color: #4a3f35;
            margin: 0;
            padding: 30px;
        }

        h1 {
            text-align: center;
            color: #5e3c2c;
            margin-bottom: 30px;
        }

        table {
            width: 85%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fffaf0;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-size: 16px;
        }

        th {
            background-color: #dcb89f; /* Slight reddish-brown heading */
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

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #5e3c2c;
            font-weight: bold;
            border: 1px solid #bfa58c;
            padding: 8px 16px;
            border-radius: 5px;
            background-color: #fcecd6;
        }

        a:hover {
            background-color: #edd4bb;
        }
    </style>
</head>
<body>

    <h1>My Orders</h1>

    <table>
        <tr>
            <th>Order ID</th>
            <th>Product ID</th>
            <th>Quantity</th>
            <th>Status</th>
            <th>Address</th>
            <th>Taluka</th>
            <th>District</th>
            <th>State</th>
        </tr>
        <%
            int id = GetSet.getid();
            Connection con = DbConnection.connect();
            PreparedStatement pstmt = con.prepareStatement("select * from orders where buyerid=?");
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getInt("productid") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td><%= rs.getString("status") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("taluka") %></td>
            <td><%= rs.getString("district") %></td>
            <td><%= rs.getString("state") %></td>
        </tr>
        <%
            }
        %>
    </table>

    <center>
        <a href="buyerDashboard.html">Back</a>
    </center>

</body>
</html>
