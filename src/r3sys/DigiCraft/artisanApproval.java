package r3sys.DigiCraft;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import r3sys.DigiCraft.GetSet;

/**
 * Servlet implementation class artisanApproval
 */
public class artisanApproval extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public artisanApproval() {
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
		
		int id = Integer.parseInt(request.getParameter("id"));
		int status = Integer.parseInt(request.getParameter("status"));
		
		try {
			Connection con = DbConnection.connect();
			PreparedStatement pstmt = con.prepareStatement("Update artisan set approves=? where id=?");
			pstmt.setBoolean(1,  status == 1);
			pstmt.setInt(2,  id);
			pstmt.executeUpdate();
			response.sendRedirect("artisanApproval.jsp");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
