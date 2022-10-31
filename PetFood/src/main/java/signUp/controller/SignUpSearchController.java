package signUp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

@WebServlet("/SearchController")
public class SignUpSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignUpSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doHandle(request, response);
		} catch (ClassNotFoundException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doHandle(request, response);
		} catch (ClassNotFoundException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, IOException, SQLException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("userId");

	    // 드라이버를 가져옴
	    Class.forName("org.mariadb.jdbc.Driver");
	    
	    // db접속
	    Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/petfood","root","12345");
	    
	    //db 데이터 검색
	    PreparedStatement pstmt = conn.prepareStatement("select userId from t_petfood_user where userId='"+id+"'");
		ResultSet rs = pstmt.executeQuery();

		out.print(rs.next());
	}
}
