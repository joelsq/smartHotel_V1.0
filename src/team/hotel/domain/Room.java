package team.hotel.domain;

import java.io.Serializable;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月5日 房间实体
 */
public class Room implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String roomId;

	private String roomNum;

	private String roomType;

	private String roomArea;

	private String roomMaxnumOfPeople;

	private String roomPrice;

	private String roomAircondition;

	private String roomTV;

	private String roomWifi;

	private String roomWashroom;

	private String roomIsStay;

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType == null ? null : roomType.trim();
	}

	public String getRoomArea() {
		return roomArea;
	}

	public void setRoomArea(String roomArea) {
		this.roomArea = roomArea;
	}

	public String getRoomMaxnumOfPeople() {
		return roomMaxnumOfPeople;
	}

	public void setRoomMaxnumOfPeople(String roomMaxnumOfPeople) {
		this.roomMaxnumOfPeople = roomMaxnumOfPeople;
	}

	public String getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(String roomPrice) {
		this.roomPrice = roomPrice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getRoomAircondition() {
		return roomAircondition;
	}

	public void setRoomAircondition(String roomAircondition) {
		this.roomAircondition = roomAircondition;
	}

	public String getRoomTV() {
		return roomTV;
	}

	public void setRoomTV(String roomTV) {
		this.roomTV = roomTV;
	}

	public String getRoomWifi() {
		return roomWifi;
	}

	public void setRoomWifi(String roomWifi) {
		this.roomWifi = roomWifi;
	}

	public String getRoomWashroom() {
		return roomWashroom;
	}

	public void setRoomWashroom(String roomWashroom) {
		this.roomWashroom = roomWashroom;
	}

	public String getRoomIsStay() {
		return roomIsStay;
	}

	public void setRoomIsStay(String roomIsStay) {
		this.roomIsStay = roomIsStay;
	}

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", roomNum=" + roomNum + ", roomType=" + roomType + ", roomArea=" + roomArea
				+ ", roomMaxnumOfPeople=" + roomMaxnumOfPeople + ", roomPrice=" + roomPrice + ", roomAircondition="
				+ roomAircondition + ", roomTv=" + roomTV + ", roomWifi=" + roomWifi + ", roomWashroom=" + roomWashroom
				+ ", roomIsStay=" + roomIsStay + "]";
	}

	public Room(String id, String roomNum, String roomType, String area, String maxnum, String price,
			String roomAircondition, String roomTV, String roomWifi, String roomWashroom, String roomIsStay) {
		super();
		this.roomId = id;
		this.roomNum = roomNum;
		this.roomType = roomType;
		this.roomArea = area;
		this.roomMaxnumOfPeople = maxnum;
		this.roomPrice = price;
		this.roomAircondition = roomAircondition;
		this.roomTV = roomTV;
		this.roomWifi = roomWifi;
		this.roomWashroom = roomWashroom;
		this.roomIsStay = roomIsStay;
	}

}
