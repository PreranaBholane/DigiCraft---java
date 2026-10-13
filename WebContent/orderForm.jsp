<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="r3sys.DigiCraft.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Order Form</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('https://i.pinimg.com/originals/e3/d5/88/e3d5883016f8757cd4b640393f4bcd67.jpg'); /* Warli background */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: 'Segoe UI', sans-serif;
        }

        .overlay {
            background-color: rgba(255, 255, 255, 0.95); /* Light overlay */
            width: 100%;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px 0;
            box-sizing: border-box;
        }

        .form-box {
            background-color: #fffef0; /* Off-white */
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        .form-box h2 {
            margin-bottom: 30px;
            text-align: center;
            color: #5D4037;
        }

        .form-box input[type="text"],
        .form-box input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #aaa;
            border-radius: 8px;
            font-size: 14px;
        }

        .form-box input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #8B4000; /* Reddish-brown */
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-box input[type="submit"]:hover {
            background-color: #6e2f00;
        }
    </style>
</head>
<body>
    <div class="overlay">
        <div class="form-box">
            <h2>Enter Order Details</h2>
            <form action="PlaceOrder" method="post">
                <input type="hidden" name="productid" value="<%= request.getParameter("productid") %>">
                <input type="number" name="quantity" placeholder="Quantity" required>
                <input type="text" name="address" placeholder="Full Address" required>
                <input type="text" name="pincode" placeholder="Pincode" required>
                <input type="text" name="taluka" placeholder="Taluka" required>
                <input type="text" name="district" placeholder="District" required>
                <input type="text" name="state" placeholder="State" required>
                <input type="submit" value="Place Order">
            </form>
        </div>
    </div>
</body>
</html>
