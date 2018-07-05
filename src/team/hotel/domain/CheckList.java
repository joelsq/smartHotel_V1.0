package team.hotel.domain;

import java.util.Date;
import java.io.Serializable;
/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月5日 入住登记信息
 */
public class CheckList implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Short checklistId;

	private Short guestId;

	private String guestPhone;

	private Short roomId;

	private Date checkInDate;

	private Short checkDays;

	private Date checkOutDate;

	private String checkMealType;

	private Byte checkNumOfPeople;

	private Byte checkRoomConsume;

	private Byte checkTotalConsume;

	public Short getChecklistId() {
		return checklistId;
	}

	public void setChecklistId(Short checklistId) {
		this.checklistId = checklistId;
	}

	public Short getGuestId() {
		return guestId;
	}

	public void setGuestId(Short guestId) {
		this.guestId = guestId;
	}

	public String getGuestPhone() {
		return guestPhone;
	}

	public void setGuestPhone(String guestPhone) {
		this.guestPhone = guestPhone == null ? null : guestPhone.trim();
	}

	public Short getRoomId() {
		return roomId;
	}

	public void setRoomId(Short roomId) {
		this.roomId = roomId;
	}

	public Date getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}

	public Short getCheckDays() {
		return checkDays;
	}

	public void setCheckDays(Short checkDays) {
		this.checkDays = checkDays;
	}

	public Date getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public String getCheckMealType() {
		return checkMealType;
	}

	public void setCheckMealType(String checkMealType) {
		this.checkMealType = checkMealType == null ? null : checkMealType.trim();
	}

	public Byte getCheckNumOfPeople() {
		return checkNumOfPeople;
	}

	public void setCheckNumOfPeople(Byte checkNumOfPeople) {
		this.checkNumOfPeople = checkNumOfPeople;
	}

	public Byte getCheckRoomConsume() {
		return checkRoomConsume;
	}

	public void setCheckRoomConsume(Byte checkRoomConsume) {
		this.checkRoomConsume = checkRoomConsume;
	}

	public Byte getCheckTotalConsume() {
		return checkTotalConsume;
	}

	public void setCheckTotalConsume(Byte checkTotalConsume) {
		this.checkTotalConsume = checkTotalConsume;
	}

	public CheckList(Short checklistId, Short guestId, String guestPhone, Short roomId, Date checkInDate,
			Short checkDays, Date checkOutDate, String checkMealType, Byte checkNumOfPeople, Byte checkRoomConsume,
			Byte checkTotalConsume) {
		super();
		this.checklistId = checklistId;
		this.guestId = guestId;
		this.guestPhone = guestPhone;
		this.roomId = roomId;
		this.checkInDate = checkInDate;
		this.checkDays = checkDays;
		this.checkOutDate = checkOutDate;
		this.checkMealType = checkMealType;
		this.checkNumOfPeople = checkNumOfPeople;
		this.checkRoomConsume = checkRoomConsume;
		this.checkTotalConsume = checkTotalConsume;
	}

	@Override
	public String toString() {
		return "CheckList [checklistId=" + checklistId + ", guestId=" + guestId + ", guestPhone=" + guestPhone
				+ ", roomId=" + roomId + ", checkInDate=" + checkInDate + ", checkDays=" + checkDays + ", checkOutDate="
				+ checkOutDate + ", checkMealType=" + checkMealType + ", checkNumOfPeople=" + checkNumOfPeople
				+ ", checkRoomConsume=" + checkRoomConsume + ", checkTotalConsume=" + checkTotalConsume + "]";
	}
	
}
