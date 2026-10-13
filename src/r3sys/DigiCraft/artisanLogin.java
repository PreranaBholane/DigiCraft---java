package r3sys.DigiCraft;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class artisanLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public artisanLogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection con = DbConnection.connect();
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM artisan WHERE email=? AND password=? AND status=?");
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setString(3, "Approved");

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                GetSet.setid(rs.getInt("id"));
                response.sendRedirect("artisanDashboard.html");
            } else {
                response.sendRedirect("artisan_login.html");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("artisanLogin.html");
        }
    }
}