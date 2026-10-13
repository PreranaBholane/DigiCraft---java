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
 * Servlet implementation class update_ArtisanStatus
 */
public class update_ArtisanStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_ArtisanStatus() {
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
		
		 String idStr = request.getParameter("id");
	        String status = request.getParameter("status");

	        if (idStr == null || status == null || idStr.isEmpty() || status.isEmpty()) {
	            response.sendRedirect("error.html");
	            return;
	        }

	        try {
	            int id = Integer.parseInt(idStr);
	            Connection con = DbConnection.connect();
	            PreparedStatement pstmt = con.prepareStatement("UPDATE artisan SET status=? WHERE id=?");
	            pstmt.setString(1, status);
	            pstmt.setInt(2, id);

	            int i = pstmt.executeUpdate();
	            if (i > 0) {
	                response.sendRedirect("viewArtisans.jsp");
	            } else {
	                response.sendRedirect("error.html");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("error.html");
	        }
		doGet(request, response);
	}

}
