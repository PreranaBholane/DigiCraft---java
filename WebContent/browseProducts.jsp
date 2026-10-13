<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="r3sys.DigiCraft.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Browse Products</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('https://i.pinimg.com/originals/e3/d5/88/e3d5883016f8757cd4b640393f4bcd67.jpg'); /* Warli painting background */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: 'Segoe UI', sans-serif;
        }

        .overlay {
            background-color: rgba(255, 255, 255, 0.8);
            width: 100%;
            min-height: 100vh;
            padding: 40px;
            box-sizing: border-box;
        }

        .container {
            background-color: #fff;
            border-radius: 16px;
            padding: 30px;
            max-width: 95%;
            margin: auto;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.3);
        }

        h2 {
            text-align: center;
            color: #5c0000;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        th {
            background-color: #8B0000;
            color: white;
            padding: 10px;
            text-align: center;
        }

        td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 6px 12px;
            border: none;
            background-color: #228B22;
            color: white;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1a661a;
        }
    </style>
</head>
<body>
    <div class="overlay">
        <div class="container">
            <h2>Available Products</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Post Date</th>
                    <th>Action</th>
                </tr>
                <%
                    Connection con = DbConnection.connect();
                    PreparedStatement pstmt = con.prepareStatement("select * from products");
                    ResultSet rs = pstmt.executeQuery();
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("productName") %></td>
                    <td><%= rs.getString("description") %></td>
                    <td><%= rs.getString("price") %></td>
                    <td><%= rs.getInt("stock") %></td>
                    <td><%= rs.getString("postDate") %></td>
                    <td>
                        <form action="orderForm.jsp" method="get">
                            <input type="hidden" name="productid" value="<%= rs.getInt("id") %>">
                            <input type="submit" value="Order">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </div>
</body>
</html>
