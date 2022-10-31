package login.user.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import login.common.JDBCUtill;
import login.user.UserVO;

public class UserDAO {

	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//SQL 명령어들
	private final String USER_GET = "select * from t_petfood_user where userId=? and userPwd=?";
	private final String USER_FINDID = "select * from t_petfood_user where userName=? and userEmail=?";
	private final String USER_FINDPW = "select * from t_petfood_user where userId=? and userName=? and userEmail=?";
	
	//CRUD 기능의 메소드 구현
	//회원 등록
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		try {
			System.out.println("===> JDBC로 getUser() 기능처리");
			conn = JDBCUtill.getConnection();			
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getUserId());
			stmt.setString(2, vo.getUserPwd());
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				user = new UserVO();
				user.setUserName(rs.getString("userName"));
				user.setUserId(rs.getString("userId"));
				user.setUserPwd(rs.getString("userPwd"));
				user.setUserNickname(rs.getString("userNickname"));
				user.setUserEmail(rs.getString("userEmail"));
				user.setJoinDate(rs.getDate("joinDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtill.close(rs, stmt, conn);
		}
		return user;
	}
	
	//아이디 찾기
	public UserVO findUserId(UserVO vo) {
		UserVO user = null;
		try {
			System.out.println("===> JDBC로 getUser() 기능처리");
			conn = JDBCUtill.getConnection();			
			stmt = conn.prepareStatement(USER_FINDID);
			stmt.setString(1, vo.getUserName());
			stmt.setString(2, vo.getUserEmail());
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				user = new UserVO();
				user.setUserId(rs.getString("userId"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtill.close(rs, stmt, conn);
		}
		return user;
	}
	
	//비밀번호 찾기
		public UserVO findUserPwd(UserVO vo) {
			UserVO user = null;
			try {
				System.out.println("===> JDBC로 getUser() 기능처리");
				conn = JDBCUtill.getConnection();			
				stmt = conn.prepareStatement(USER_FINDPW);
				stmt.setString(1, vo.getUserId());
				stmt.setString(2, vo.getUserName());
				stmt.setString(3, vo.getUserEmail());
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					user = new UserVO();
					user.setUserPwd(rs.getString("userPwd"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtill.close(rs, stmt, conn);
			}
			return user;
		}
	
	
	
	
	
	
	
	
	
	
	
	
}
