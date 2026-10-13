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
 * Servlet implementation class BuyerLogin
 */
public class BuyerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyerLogin() {
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
		
		
		 String email = request.getParameter("email");
	        String password = request.getParameter("password");

	        try {
	            Connection con = DbConnection.connect();
	            PreparedStatement pstmt = con.prepareStatement("select * from buyer where email=? and password=?");
	            pstmt.setString(1, email);
	            pstmt.setString(2, password);

	            ResultSet rs = pstmt.executeQuery();
	            if (rs.next()) {
	            	GetSet.setid(rs.getInt("id"));
	                response.sendRedirect("buyerDashboard.html");
	            } else {
	                response.sendRedirect("error.html");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		doGet(request, response);
	}

}
