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
 * Servlet implementation class buyerRegister
 */
public class buyerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buyerRegister() {
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
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			Connection con = DbConnection.connect();
			PreparedStatement pstmt = con.prepareStatement("insert into buyer values(?,?,?,?,?,?)");

			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, contact);
			pstmt.setString(4, address);
			pstmt.setString(5, email);
			pstmt.setString(6, password);

			int i = pstmt.executeUpdate();
			if (i > 0) {
				response.sendRedirect("buyerLogin.html");
			} else {
				response.sendRedirect("error.html");
				System.out.println("Registration FAILED!!!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
