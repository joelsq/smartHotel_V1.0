package team.hotel.domain;

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

	private String checklistId;

	private String guestId;

	private String roomId;

	private String checkInDate;

	private String checkDays;

	private String checkOutDate;

	private String checkMealType;

	private String checkNumOfPeople;

	private String checkRoomConsume;

	private String checkTotalConsume;

	public String getChecklistId() {
		return checklistId;
	}

	public void setChecklistId(String checklistId) {
		this.checklistId = checklistId;
	}

	public String getGuestId() {
		return guestId;
	}

	public void setGuestId(String guestId) {
		this.guestId = guestId;
	}
//
//	public String getGuestPhone() {
//		return guestPhone;
//	}
//
//	public void setGuestPhone(String guestPhone) {
//		this.guestPhone = guestPhone == null ? null : guestPhone.trim();
//	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}

	public String getCheckDays() {
		return checkDays;
	}

	public void setCheckDays(String checkDays) {
		this.checkDays = checkDays;
	}

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public String getCheckMealType() {
		return checkMealType;
	}

	public void setCheckMealType(String checkMealType) {
		this.checkMealType = checkMealType == null ? null : checkMealType.trim();
	}

	public String getCheckNumOfPeople() {
		return checkNumOfPeople;
	}

	public void setCheckNumOfPeople(String checkNumOfPeople) {
		this.checkNumOfPeople = checkNumOfPeople;
	}

	public String getCheckRoomConsume() {
		return checkRoomConsume;
	}

	public void setCheckRoomConsume(String checkRoomConsume) {
		this.checkRoomConsume = checkRoomConsume;
	}

	public String getCheckTotalConsume() {
		return checkTotalConsume;
	}

	public void setCheckTotalConsume(String checkTotalConsume) {
		this.checkTotalConsume = checkTotalConsume;
	}

	public CheckList(String checklistId, String guestId, String roomId, String checkInDate,
			String checkDays, String checkOutDate, String checkMealType, String checkNumOfPeople, String checkRoomConsume,
			String checkTotalConsume) {
		super();
		this.checklistId = checklistId;
		this.guestId = guestId;
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
		return "CheckList [checklistId=" + checklistId + ", guestId=" + guestId + ", roomId=" + roomId + ", checkInDate=" + checkInDate + ", checkDays=" + checkDays + ", checkOutDate="
				+ checkOutDate + ", checkMealType=" + checkMealType + ", checkNumOfPeople=" + checkNumOfPeople
				+ ", checkRoomConsume=" + checkRoomConsume + ", checkTotalConsume=" + checkTotalConsume + "]";
	}
	
}
