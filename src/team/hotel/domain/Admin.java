package team.hotel.domain;

import java.sql.Timestamp;

/**
* @author Suqiao Lin
* @version 创建时间：2018年7月5日
* 管理员实体
*/
public class Admin implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer adminId;
	private String adminName;
	private String adminPw;
	private Timestamp adminLastVisit;
	private String adminLastIP;
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public Timestamp getAdminLastVisit() {
		return adminLastVisit;
	}
	public void setAdminLastVisit(Timestamp adminLastVisit) {
		this.adminLastVisit = adminLastVisit;
	}
	public String getAdminLastIP() {
		return adminLastIP;
	}
	public void setAdminLastIP(String adminLastIP) {
		this.adminLastIP = adminLastIP;
	}
	
	public Admin(Integer adminId, String adminName, String adminPw, Timestamp adminLastVisit, String adminLastIP) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminPw = adminPw;
		this.adminLastVisit = adminLastVisit;
		this.adminLastIP = adminLastIP;
	}
	
}
