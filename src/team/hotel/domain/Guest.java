package team.hotel.domain;

import java.util.Date;

/**
* @author Suqiao Lin
* @version 创建时间：2018年7月5日
* 客人实体类
*/

public class Guest implements java.io.Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Short guestId;

    private String guestName;

    private String guestPhone;

    private String guestPassword;

    private String guestDocumentNum;

    private String guestGender;

    private Date gusetLastVisit;

    private String gusetLastIp;

    public Short getGuestId() {
        return guestId;
    }

    public void setGuestId(Short guestId) {
        this.guestId = guestId;
    }

    public String getGuestName() {
        return guestName;
    }

    public void setGuestName(String guestName) {
        this.guestName = guestName == null ? null : guestName.trim();
    }

    public String getGuestPhone() {
        return guestPhone;
    }

    public void setGuestPhone(String guestPhone) {
        this.guestPhone = guestPhone == null ? null : guestPhone.trim();
    }

    public String getGuestPassword() {
        return guestPassword;
    }

    public void setGuestPassword(String guestPassword) {
        this.guestPassword = guestPassword == null ? null : guestPassword.trim();
    }

    public String getGuestDocumentNum() {
        return guestDocumentNum;
    }

    public void setGuestDocumentNum(String guestDocumentNum) {
        this.guestDocumentNum = guestDocumentNum == null ? null : guestDocumentNum.trim();
    }

    public String getGuestGender() {
        return guestGender;
    }

    public void setGuestGender(String guestGender) {
        this.guestGender = guestGender == null ? null : guestGender.trim();
    }

    public Date getGusetLastVisit() {
        return gusetLastVisit;
    }

    public void setGusetLastVisit(Date gusetLastVisit) {
        this.gusetLastVisit = gusetLastVisit;
    }

    public String getGusetLastIp() {
        return gusetLastIp;
    }

    public void setGusetLastIp(String gusetLastIp) {
        this.gusetLastIp = gusetLastIp == null ? null : gusetLastIp.trim();
    }

	public Guest(Short guestId, String guestName, String guestPhone, String guestPassword, String guestDocumentNum,
			String guestGender, Date gusetLastVisit, String gusetLastIp) {
		super();
		this.guestId = guestId;
		this.guestName = guestName;
		this.guestPhone = guestPhone;
		this.guestPassword = guestPassword;
		this.guestDocumentNum = guestDocumentNum;
		this.guestGender = guestGender;
		this.gusetLastVisit = gusetLastVisit;
		this.gusetLastIp = gusetLastIp;
	}

	@Override
	public String toString() {
		return "Guest [guestId=" + guestId + ", guestName=" + guestName + ", guestPhone=" + guestPhone
				+ ", guestPassword=" + guestPassword + ", guestDocumentNum=" + guestDocumentNum + ", guestGender="
				+ guestGender + ", gusetLastVisit=" + gusetLastVisit + ", gusetLastIp=" + gusetLastIp + "]";
	}
    
    
}
