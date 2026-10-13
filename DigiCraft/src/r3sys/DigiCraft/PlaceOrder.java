package r3sys.DigiCraft;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PlaceOrder
 */
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceOrder() {
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
        String productidStr = request.getParameter("productid");
        String quantityStr = request.getParameter("quantity");
        String address = request.getParameter("address");
        String pincode = request.getParameter("pincode");
        String taluka = request.getParameter("taluka");
        String district = request.getParameter("district");
        String state = request.getParameter("state");

        if (productidStr == null || quantityStr == null ||
            productidStr.isEmpty() || quantityStr.isEmpty()) {
            response.sendRedirect("error.html");
            return;
        }

        int productid = Integer.parseInt(productidStr);
        int quantity = Integer.parseInt(quantityStr);
        int buyerid = GetSet.getid();
        String orderDate = LocalDate.now().toString();

        Connection con = DbConnection.connect();

        try {
            PreparedStatement pstmt = con.prepareStatement("insert into orders values(?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, id);
            pstmt.setInt(2, buyerid);
            pstmt.setInt(3, productid);
            pstmt.setInt(4, quantity);
            pstmt.setString(5, orderDate);
            pstmt.setString(6, "Pending");
            pstmt.setString(7, address);
            pstmt.setString(8, pincode);
            pstmt.setString(9, taluka);
            pstmt.setString(10, district);
            pstmt.setString(11, state);

            int i = pstmt.executeUpdate();
            if (i > 0) {
                response.sendRedirect("viewMyOrders.jsp");
            } else {
                response.sendRedirect("error.html");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		doGet(request, response);
	}

}
