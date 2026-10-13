package r3sys.DigiCraft;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class artisanRegister
 */
public class artisanRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public artisanRegister() {
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
		
		 int id = 0;
	        String name = request.getParameter("name");
	        String craftType = request.getParameter("craftType");
	        String contact = request.getParameter("contact");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");

	        String status = "Pending"; // new artisans start with Pending

	        try {
	            Connection con = DbConnection.connect();
	            PreparedStatement pstmt = con.prepareStatement("insert into artisan values(?,?,?,?,?,?,?)");
	            pstmt.setInt(1, id);
	            pstmt.setString(2, name);
	            pstmt.setString(3, craftType);
	            pstmt.setString(4, contact);
	            pstmt.setString(5, email);
	            pstmt.setString(6, password);
	            pstmt.setString(7, status);

	            int i = pstmt.executeUpdate();
	            if (i > 0) {
	                response.sendRedirect("index.html"); // or artisanLogin.html
	            } else {
	                response.sendRedirect("error.html");
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("error.html");
	        }
		
		doGet(request, response);
	}

}
