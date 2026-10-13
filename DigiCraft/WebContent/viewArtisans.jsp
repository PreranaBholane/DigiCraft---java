<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="r3sys.DigiCraft.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Artisans</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fdfbf5;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: #4d2600;
        }

        table {
            margin: 30px auto;
            border-collapse: collapse;
            width: 90%;
            background-color: #fffdf5;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 18px;
            border: 1px solid #ddd;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #b8860b;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f4e7;
        }

        tr:hover {
            background-color: #f0e7d5;
        }

        select {
            padding: 6px 10px;
            border-radius: 6px;
            border: 1px solid #aaa;
            font-size: 14px;
        }

        select option[value="Approved"] {
            color: green;
            font-weight: bold;
        }

        select option[value="Disapproved"] {
            color: red;
            font-weight: bold;
        }

        input[type="submit"] {
            padding: 8px 12px;
            margin-left: 10px;
            border: none;
            border-radius: 6px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
            background-color: #0066cc;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #004b99;
        }
    </style>
</head>
<body>
    <h2>View / Approve Artisans</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Craft Type</th>
            <th>Contact</th>
            <th>Email</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            Connection con = DbConnection.connect();
            PreparedStatement pstmt = con.prepareStatement("select * from artisan");
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("craftType") %></td>
            <td><%= rs.getString("contact") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <form action="update_ArtisanStatus" method="post">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    <select name="status">
                        <option value="Approved" style="color:green;">Approve</option>
                        <option value="Disapproved" style="color:red;">Disapprove</option>
                    </select>
                    <input type="submit" value="Update">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
