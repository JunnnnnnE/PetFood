package signUp.controller.fix;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.user.UserVO;
import login.user.impl.UserDAO;


@WebServlet("/FixGood")
public class UserFixGood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserFixGood() {
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
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		boolean usersw=false;
		boolean petsw=false;
		UserVO vo = new UserVO();
  		UserDAO userDAO = new UserDAO();
	
		//회원가입 창에서 값 받아오기
		HttpSession session = request.getSession();
  		UserVO user = (UserVO)session.getAttribute("user");
  		String id = user.getUserId();
		String password = request.getParameter("userPwd1");
		String password2 = request.getParameter("userPwd2");
		String name = request.getParameter("userName");
		String nickname = request.getParameter("userNickname");
		String email = request.getParameter("userEmail");
		
		//애완동물 관련 정보
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
		PreparedStatement stmt_p = conn.prepareStatement("select * from t_petfood_pet");
		ResultSet rs_p = stmt_p.executeQuery();
			
		//user아이디 중복 확인
		while(rs.next()){
			if(rs.getString("userId").equals(id)){  //db에 user아이디 있는지 확인
				usersw=true;
				break;
			}
			else{  //db에 아이디 없어
				usersw=false;
			}
		}
		
		//pet아이디 중복 확인
		while(rs_p.next()){
			if(rs_p.getString("userId").equals(id)){  //db에 pet아이디 있는지 확인
				petsw=true;
				break;
			}
			else{  //db에 아이디 없어
				petsw=false;
			}
		}
			
		//중복확인 결과값으로 행동
		if(usersw==true){
			//db값 업데이트
			PreparedStatement pstmt = conn.prepareStatement("UPDATE t_petfood_user SET userPwd='"+password+"', userNickname='"+nickname+"', userEmail='"+email+"' WHERE userId='"+id+"';");
			pstmt.executeUpdate();
			
			if(petsw==true){
				PreparedStatement pstmt_pet = conn.prepareStatement("UPDATE t_petfood_pet SET petName='"+petName+"', petAge='"+petAge+"', petKind='"+petKind+"' WHERE userId='"+id+"';");
				pstmt_pet.executeUpdate();
			}
			else{
				PreparedStatement pstmt_pet = conn.prepareStatement("INSERT INTO t_petfood_pet(userId, petName, petAge, petKind, petProfile) VALUES(?,?,?,?,?)");
				pstmt_pet.setString(1,id);
				pstmt_pet.setString(2,petName);
				pstmt_pet.setString(3,petAge);
				pstmt_pet.setString(4,petKind);
				pstmt_pet.setString(5,"");
				pstmt_pet.executeUpdate();
			}
		}
		else{		
			out.println("<script>");
			out.println("alert('해당 아이디가 존재하지않습니다.');");
			out.println("document.location.href='view/main.jsp';");
			out.println("</script>");
		}
			
		//db사용 마지막
		conn.close();
		out.println("<script>");
		out.println("alert('회원정보가 정상적으로 변경 되었습니다.');");
		out.println("document.location.href='view/main.jsp';");
		out.println("</script>");
	}
}
