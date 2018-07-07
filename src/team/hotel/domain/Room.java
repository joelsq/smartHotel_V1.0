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

	private Integer roomId;

	private String roomNum;

	private String roomType;

	private Integer roomArea;

	private Integer roomMaxnumOfPeople;

	private Integer roomPrice;

	private Byte roomAircondition;

	private Byte roomTV;

	private Byte roomWifi;

	private Byte roomWashroom;

	private Byte roomIsStay;

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType == null ? null : roomType.trim();
	}

	public Integer getRoomArea() {
		return roomArea;
	}

	public void setRoomArea(Integer roomArea) {
		this.roomArea = roomArea;
	}

	public Integer getRoomMaxnumOfPeople() {
		return roomMaxnumOfPeople;
	}

	public void setRoomMaxnumOfPeople(Integer roomMaxnumOfPeople) {
		this.roomMaxnumOfPeople = roomMaxnumOfPeople;
	}

	public Integer getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(Integer roomPrice) {
		this.roomPrice = roomPrice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Byte getRoomAircondition() {
		return roomAircondition;
	}

	public void setRoomAircondition(Byte roomAircondition) {
		this.roomAircondition = roomAircondition;
	}

	public Byte getRoomTV() {
		return roomTV;
	}

	public void setRoomTV(Byte roomTV) {
		this.roomTV = roomTV;
	}

	public Byte getRoomWifi() {
		return roomWifi;
	}

	public void setRoomWifi(Byte roomWifi) {
		this.roomWifi = roomWifi;
	}

	public Byte getRoomWashroom() {
		return roomWashroom;
	}

	public void setRoomWashroom(Byte roomWashroom) {
		this.roomWashroom = roomWashroom;
	}

	public Byte getRoomIsStay() {
		return roomIsStay;
	}

	public void setRoomIsStay(Byte roomIsStay) {
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

	public Room(Integer id, String roomNum, String roomType, Integer area, Integer maxnum, Integer price,
			Byte roomAircondition, Byte roomTV, Byte roomWifi, Byte roomWashroom, Byte roomIsStay) {
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
