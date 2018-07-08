package team.hotel.domain;

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

	private String guestId;

    private String guestName;

    private String guestPhone;

    private String guestPassword;

    private String guestDocumentNum;

    private String guestGender;

    private String guestLastVisit;

    private String guestLastIp;

    public String getGuestId() {
        return guestId;
    }

    public void setGuestId(String guestId) {
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

    public String getGuestLastVisit() {
        return guestLastVisit;
    }

    public void setGuestLastVisit(String guestLastVisit) {
        this.guestLastVisit = guestLastVisit;
    }

    public String getGuestLastIp() {
        return guestLastIp;
    }

    public void setGuestLastIp(String guestLastIp) {
        this.guestLastIp = guestLastIp == null ? null : guestLastIp.trim();
    }

	public Guest(String guestId, String guestName, String guestPhone, String guestPassword, String guestDocumentNum,
			String guestGender, String guestLastVisit, String guestLastIp) {
		super();
		this.guestId = guestId;
		this.guestName = guestName;
		this.guestPhone = guestPhone;
		this.guestPassword = guestPassword;
		this.guestDocumentNum = guestDocumentNum;
		this.guestGender = guestGender;
		this.guestLastVisit = guestLastVisit;
		this.guestLastIp = guestLastIp;
	}

	@Override
	public String toString() {
		return "Guest [guestId=" + guestId + ", guestName=" + guestName + ", guestPhone=" + guestPhone
				+ ", guestPassword=" + guestPassword + ", guestDocumentNum=" + guestDocumentNum + ", guestGender="
				+ guestGender + ", guestLastVisit=" + guestLastVisit + ", guestLastIp=" + guestLastIp + "]";
	}
    
    
}
