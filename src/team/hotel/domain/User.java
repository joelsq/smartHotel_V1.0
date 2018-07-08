package team.hotel.domain;

import java.io.Serializable;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月5日 类说明
 */

public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int userId;

	private String userName;

	private String password;

	private int credits;

	private String authority;

	private String lastIp;

	private String lastVisit;

	public String getLastIp() {
		return lastIp;
	}

	public void setLastIp(String lastIp) {
		this.lastIp = lastIp;
	}

	public String getLastVisit() {
		return lastVisit;
	}

	public void setLastVisit(String lastVisit) {
		this.lastVisit = lastVisit;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getCredits() {
		return credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public User(int userId, String userName, String password, int credits, String authority, String lastVisit,
			String lastIp) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.credits = credits;
		this.authority = authority;
		this.lastIp = lastIp;
		this.lastVisit = lastVisit;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", credits=" + credits
				+ ", authority=" + authority + ", lastIp=" + lastIp + ", lastVisit=" + lastVisit + "]";
	}

}
