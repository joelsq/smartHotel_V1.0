package team.hotel.domain;
/**
* @author Suqiao Lin
* @version 创建时间：2018年7月5日
* 系统登录日志-未使用
*/
import java.io.Serializable;

public class LoginLog implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int loginLogId;

	private int userId;

	private String ip;

	private String loginDate;

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}

	public int getLoginLogId() {
		return loginLogId;
	}

	public void setLoginLogId(int loginLogId) {
		this.loginLogId = loginLogId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "LoginLog [loginLogId=" + loginLogId + ", userId=" + userId + ", ip=" + ip + ", loginDate=" + loginDate
				+ "]";
	}

}

