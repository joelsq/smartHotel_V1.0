package team.hotel.domain;
import java.io.Serializable;
/**
* @author Suqiao Lin
* @version 创建时间：2018年7月5日
* 房间实体
*/
public class Room implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Short roomId;
	
	private String roomNum;
	
    private String roomType;

    private Byte roomArea;

    private Byte roomMaxnumOfPeople;

    private Short roomPrice;

    private Byte roomAircondition;

    private Byte roomTV;

    private Byte roomWifi;

    private Byte roomWashroom;

    private Byte roomIsStay;

    public Short getRoomId() {
        return roomId;
    }

    public void setRoomId(Short roomId) {
        this.roomId = roomId;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType == null ? null : roomType.trim();
    }

    public Byte getRoomArea() {
        return roomArea;
    }

    public void setRoomArea(Byte roomArea) {
        this.roomArea = roomArea;
    }

    public Byte getRoomMaxnumOfPeople() {
        return roomMaxnumOfPeople;
    }

    public void setRoomMaxnumOfPeople(Byte roomMaxnumOfPeople) {
        this.roomMaxnumOfPeople = roomMaxnumOfPeople;
    }

    public Short getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(Short roomPrice) {
        this.roomPrice = roomPrice;
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

	public Room(Short roomId, String roomNum, String roomType, Byte roomArea, Byte roomMaxnumOfPeople, Short roomPrice,
			Byte roomAircondition, Byte roomTV, Byte roomWifi, Byte roomWashroom, Byte roomIsStay) {
		super();
		this.roomId = roomId;
		this.roomNum = roomNum;
		this.roomType = roomType;
		this.roomArea = roomArea;
		this.roomMaxnumOfPeople = roomMaxnumOfPeople;
		this.roomPrice = roomPrice;
		this.roomAircondition = roomAircondition;
		this.roomTV = roomTV;
		this.roomWifi = roomWifi;
		this.roomWashroom = roomWashroom;
		this.roomIsStay = roomIsStay;
	}


	
    
}
