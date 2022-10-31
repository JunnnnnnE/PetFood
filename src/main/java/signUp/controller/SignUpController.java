package signUp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.Date; 
import java.text.SimpleDateFormat;

@WebServlet("/SignUpController")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public SignUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doHandle(request, response);
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doHandle(request, response);
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		boolean sw=false;
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	
		//회원가입 창에서 값 받아오기
		String id = request.getParameter("userId");
		String password = request.getParameter("userPwd1");
		String password2 = request.getParameter("userPwd2");
		String name = request.getParameter("userName");
		String nickname = request.getParameter("userNickname");
		String email = request.getParameter("userEmail");
		String date = sf.format(nowTime);
		
		//애완동물 관련 정보 받아오기
		String petName = request.getParameter("petName");
		String petAge = request.getParameter("petAge");
		String petKind = request.getParameter("petType");
		
		//db사용 준비
		Class.forName("org.mariadb.jdbc.Driver"); 
			
		//db연결
		Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/petfood","root","12345");  
	
		//db 값 불러오기
		PreparedStatement stmt = conn.prepareStatement("select * from t_petfood_user"); 
		ResultSet rs = stmt.executeQuery();
			
		//아이디 중복 확인
		while(rs.next()){
			if(rs.getString("userId").equals(id)){  //중복
				sw=true;
				break;
			}
			else{  //가입 완료
				sw=false;
			}
		}
		
			
		//중복확인 결과값으로 행동
		if(sw==true){
			out.println("<script>");
			out.println("alert(\"중복된 아이디입니다!\");");
			response.sendRedirect("failjoin.jsp");
			out.println("</script>");
				
		}
		else{
			//db값 넣기
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO t_petfood_user(userId, userPwd, userName, userNickname, userEmail, joinDate) VALUES(?,?,?,?,?,?)");
			pstmt.setString(1,id);
			pstmt.setString(2,password);
			pstmt.setString(3,name);
			pstmt.setString(4,nickname);
			pstmt.setString(5,email);
			pstmt.setString(6,date);
				
			pstmt.executeUpdate();
				
			if(petName !="" || petAge !="" || petKind !=""){
				PreparedStatement pstmt_pet = conn.prepareStatement("INSERT INTO t_petfood_pet(userId, petName, petAge, petKind, petProfile) VALUES(?,?,?,?,?)");
				pstmt_pet.setString(1,id);
				pstmt_pet.setString(2,petName);
				pstmt_pet.setString(3,petAge);
				pstmt_pet.setString(4,petKind);
				pstmt_pet.setString(5,"");
					
				pstmt_pet.executeUpdate();
			}
		}
			
		//db사용 마지막
		conn.close();
		
		out.println("<script>");
		out.println("alert('회원가입이 완료 되었습니다.');");
		out.println("document.location.href='view/main.jsp';");
		out.println("</script>");
		
	}
	
}
