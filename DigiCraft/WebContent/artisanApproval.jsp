<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "r3sys.DigiCraft.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Artisan Approval</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=1600&q=80'); /* CHANGE if needed */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: 'Segoe UI', sans-serif;
        }

        .overlay {
            background-color: rgba(200, 80, 0, 0.65);
            width: 100%;
            height: 100vh;
            padding: 40px;
            box-sizing: border-box;
        }

        .container {
            background-color: #fff;
            border-radius: 16px;
            padding: 30px;
            max-width: 90%;
            margin: auto;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.3);
        }

        h1 {
            text-align: center;
            color: #8B0000;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        th {
            background-color: #5c0000; /* dark reddish brown */
            color: white;
            padding: 10px;
            text-align: center;
        }

        td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        a {
            margin: 0 8px;
            color: #0066cc;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
            color: #003366;
        }
    </style>
</head>
<body>
    <div class="overlay">
        <div class="container">
            <h1>Artisan Approval</h1>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Craft Type</th>
                    <th>Contact</th>
                    <th>Status</th>
                    <th>Approval</th>
                </tr>
                <%
                    Connection con = DbConnection.connect();
                    int id = GetSet.getid();
                    PreparedStatement pstmt = con.prepareStatement("select * from artisan where id=?");
                    pstmt.setInt(1, id);
                    ResultSet rs = pstmt.executeQuery();
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getInt(5) %></td>
                    <td><%= rs.getBoolean("approved") ? "Approved" : "Pending" %></td>
                    <td>
                        <a href="artisanApproval?id=<%=rs.getInt("id")%>&status=1">Approve</a>
                        <a href="artisanApproval?id=<%=rs.getInt("id")%>&status=0">Disapprove</a>
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
