

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 * Servlet implementation class Controller_servlet
 */
@WebServlet("/Controller_servlet")
public class Controller_servlet extends HttpServlet {
	
		private static final long serialVersionUID = 1L;
		
		// JDBC URL, username and password of MySQL server
	    private static final String url = "jdbc:mysql://localhost:3306/RealEstate_JEE";
	    private static final String user = "root";
	    private static final String password = "root";
	
	    // JDBC variables for opening and managing connection
	    private static Connection con;
	    private static Statement stmt;
	    private static ResultSet rs;
	    
    public Controller_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String query = "select count(*) from Property";

	        try {
	            // opening database connection to MySQL server
	            con = DriverManager.getConnection(url, user, password);

	            // getting Statement object to execute query
	            stmt = con.createStatement();

	            // executing SELECT query
	            rs = stmt.executeQuery(query);

	            while (rs.next()) {
	                int count = rs.getInt(1);
	                System.out.println("Total number of Properties : " + count);
	            }

	        } catch (SQLException sqlEx) {
	            sqlEx.printStackTrace();
	        } finally {
	            //close connection ,stmt and resultset here
	            try { con.close(); } catch(SQLException se) { /*can't do anything */ }
	            try { stmt.close(); } catch(SQLException se) { /*can't do anything */ }
	            try { rs.close(); } catch(SQLException se) { /*can't do anything */ }
	        }
	        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
