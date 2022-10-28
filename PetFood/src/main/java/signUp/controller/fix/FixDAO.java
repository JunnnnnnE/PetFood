package signUp.controller.fix;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import login.common.JDBCUtill;
import login.user.UserVO;

public class FixDAO {

	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//SQL 명령어들
	private final String USER_GET = "select * from t_petfood_user where userId=?";

	
	//CRUD 기능의 메소드 구현
	//회원 등록
	public FixVO getFix(FixVO vo) {
		FixVO fix = null;
		try {
			System.out.println("===> JDBC로 getUser() 기능처리 FixC");
			conn = JDBCUtill.getConnection();			
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getUserId());
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("정보 저장 시작");
				fix = new FixVO();
				fix.setUserName(rs.getString("userName"));
				fix.setUserId(rs.getString("userId"));
				fix.setUserNickname(rs.getString("userNickname"));
				fix.setUserEmail(rs.getString("userEmail"));
				fix.setJoinDate(rs.getDate("joinDate"));
				
				String PET_GET = "select * from t_petfood_pet where userId=?";
				conn = JDBCUtill.getConnection();			
				stmt = conn.prepareStatement(PET_GET);
				stmt.setString(1, vo.getUserId());
				rs = stmt.executeQuery();
				if(rs.next()) {
					fix.setpetName(rs.getString("petName"));
					fix.setpetAge(rs.getString("petAge"));
					fix.setpetKind(rs.getString("petKind"));
				}
				System.out.println("정보 저장 완료");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtill.close(rs, stmt, conn);
		}
		return fix;
	}
	
	
}
