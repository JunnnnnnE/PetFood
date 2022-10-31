

package signUp.controller.fix;

import java.sql.Date;

public class FixVO {
	private String userName;
	private String userId;
	private String userPwd;
	private String userNickname;
	private String userEmail;
	private Date joinDate;
	private String petName;
	private String petAge;
	private String petKind;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	public String getpetName() {
		return petName;
	}
	public void setpetName(String petName) {
		this.petName = petName;
	}
	
	public String getpetAge() {
		return petAge;
	}
	public void setpetAge(String petAge) {
		this.petAge = petAge;
	}
	
	public String getpetKind() {
		return petKind;
	}
	public void setpetKind(String petKind) {
		this.petKind = petKind;
	}
	@Override
	public String toString() {
		return "UserVO [userName=" + userName + ", userId=" + userId + ", userPwd=" + userPwd + ", userNickname="
				+ userNickname + ", userEmail=" + userEmail + ", joinDate=" + joinDate + "]";
	}

}