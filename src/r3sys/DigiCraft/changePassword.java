package r3sys.DigiCraft;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class changePassword
 */
public class changePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String role = request.getParameter("role"); // buyer or artisan
        String email = request.getParameter("email");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        String tableName = "";
        String redirectPage = "";

        if (role.equals("buyer")) {
            tableName = "buyer";
            redirectPage = "buyerDashboard.html";
        } else if (role.equals("artisan")) {
            tableName = "artisan";
            redirectPage = "artisanDashboard.html";
        } else {
            response.sendRedirect("error.html");
            return;
        }

        try {
            Connection con = DbConnection.connect();
            PreparedStatement pstmt = con.prepareStatement("select * from " + tableName + " where email=? and password=?");
            pstmt.setString(1, email);
            pstmt.setString(2, oldPassword);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                PreparedStatement updateStmt = con.prepareStatement("update " + tableName + " set password=? where email=?");
                updateStmt.setString(1, newPassword);
                updateStmt.setString(2, email);
                int i = updateStmt.executeUpdate();
                if (i > 0) {
                    response.sendRedirect(redirectPage);
                } else {
                    response.sendRedirect("error.html");
                }
            } else {
                response.sendRedirect("error.html");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		doGet(request, response);
	}

}
