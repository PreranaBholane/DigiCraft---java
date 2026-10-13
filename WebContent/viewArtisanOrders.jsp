<%@ page import="java.sql.*, r3sys.DigiCraft.*" %>
<%
    int artisanId = GetSet.getid();
    if (artisanId == 0) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <style>
        body {
            background-color: #fff8f0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #6b3f20;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin: 30px 0;
            font-size: 32px;
            color: #6b3f20;
        }

        table {
            margin: 0 auto 50px auto;
            width: 90%;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 14px;
            text-align: center;
            font-size: 16px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #d6a86b;
            color: white;
            font-weight: bold;
        }

        td {
            background-color: #ffffff;
        }

        select, input[type=submit] {
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            outline: none;
        }

        select {
            background-color: #fef7f1;
            color: #6b3f20;
        }

        input[type=submit] {
            background-color: #b87a45;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type=submit]:hover {
            background-color: #a86433;
        }
    </style>
</head>
<body>

<h2>My Orders</h2>

<table>
    <tr>
        <th>Order ID</th>
        <th>Buyer ID</th>
        <th>Product ID</th>
        <th>Quantity</th>
        <th>Status</th>
        <th>Update Status</th>
    </tr>

<%
    try {
        Connection con = DbConnection.connect();

        PreparedStatement ps = con.prepareStatement(
            "SELECT o.* FROM orders o JOIN products p ON o.productId = p.id WHERE p.artisanId = ?"
        );
        ps.setInt(1, artisanId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getInt("buyerId") %></td>
        <td><%= rs.getInt("productId") %></td>
        <td><%= rs.getInt("quantity") %></td>
        <td><%= rs.getString("status") %></td>
        <td>
            <form action="update_OrderStatus" method="post">
                <input type="hidden" name="orderId" value="<%= rs.getInt("id") %>">
                <select name="status">
                    <option value="Pending">Pending</option>
                    <option value="Dispatched">Dispatched</option>
                    <option value="Delivered">Delivered</option>
                </select>
                <input type="submit" value="Update">
            </form>
        </td>
    </tr>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</table>
</body>
</html>