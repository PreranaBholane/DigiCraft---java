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
 * Servlet implementation class update_OrderStatus
 */
public class update_OrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_OrderStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("UpdateOrderStatus servlet running (GET)");
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String orderIdStr = request.getParameter("orderId");
        String status = request.getParameter("status");
		
        if (orderIdStr == null || status == null || orderIdStr.trim().isEmpty() || status.trim().isEmpty()) {
            response.getWriter().println("<script>alert('Invalid input'); window.location='viewArtisanOrders.jsp';</script>");
            return;
        }
		
		
        try {
            int orderId = Integer.parseInt(orderIdStr);

            Connection con = DbConnection.connect();
            PreparedStatement ps = con.prepareStatement("UPDATE orders SET status = ? WHERE id = ?");
            ps.setString(1, status);
            ps.setInt(2, orderId);

            int rows = ps.executeUpdate();
            con.close();

            if (rows > 0) {
                response.sendRedirect("viewArtisanOrders.jsp");
            } else {
                response.getWriter().println("<script>alert('Failed to update order'); window.location='viewArtisanOrders.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); window.location='viewArtisanOrders.jsp';</script>");
        }
    }

}
