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
 * Servlet implementation class viewArtisans
 */
public class viewArtisans extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewArtisans() {
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
        String status = request.getParameter("status");

        try {
            Connection con = DbConnection.connect();
            PreparedStatement pstmt = con.prepareStatement("update artisan set status=? where id=?");
            pstmt.setString(1, status);
            pstmt.setInt(2, id);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                response.sendRedirect("viewArtisans.jsp");
            } else {
                response.sendRedirect("error.html");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		doGet(request, response);
	}

}
