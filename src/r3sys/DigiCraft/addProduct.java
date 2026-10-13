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
	 * Servlet implementation class addProduct
	 */
	public class addProduct extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public addProduct() {
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
			String productName = request.getParameter("productName");
			String description = request.getParameter("description");
			String price = request.getParameter("price");
			String stock = request.getParameter("stock");
			String postDate = request.getParameter("postDate");

			String artisanId = String.valueOf(GetSet.getid());  

			try {
				Connection con = DbConnection.connect();
				PreparedStatement pstmt = con.prepareStatement("insert into products values(?,?,?,?,?,?,?)");
				pstmt.setInt(1, id);
				pstmt.setString(2, artisanId);
				pstmt.setString(3, productName);
				pstmt.setString(4, description);
				pstmt.setString(5, price);
				pstmt.setString(6, stock);
				pstmt.setString(7, postDate);

				int i = pstmt.executeUpdate();
				if (i > 0) {
					response.sendRedirect("artisanDashboard.html");
					System.out.println("Product Posted Successfully!");
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
