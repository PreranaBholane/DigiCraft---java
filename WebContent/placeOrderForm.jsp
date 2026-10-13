<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String pidStr = request.getParameter("productid");
    int productid = 0;
    if (pidStr != null) {
        productid = Integer.parseInt(pidStr);
    }
%>
<html>
<head>
    <title>Place Order</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #b8860b; /* Dark golden brown */
            font-family: 'Segoe UI', sans-serif;
        }

        .overlay {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-box {
            background-color: #fffdf0; /* Off-white */
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        .form-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #4d2600;
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
            <h2>Place Your Order</h2>
            <form action="PlaceOrder" method="post">
                <input type="hidden" name="productid" value="<%= productid %>">
                
                <input type="text" name="quantity" placeholder="Quantity" required>
                <input type="text" name="address" placeholder="Address" required>
                <input type="text" name="taluka" placeholder="Taluka" required>
                <input type="text" name="district" placeholder="District" required>
                <input type="text" name="state" placeholder="State" required>

                <input type="submit" value="Submit Order">
            </form>
        </div>
    </div>
</body>
</html>
