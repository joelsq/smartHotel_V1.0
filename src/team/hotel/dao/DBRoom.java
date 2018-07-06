package team.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import team.hotel.domain.Room;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月6日 数据库-房间
 */
public class DBRoom extends DBUtil {

	List<Room> roomList = new ArrayList<Room>();
	DBPrint printer=new DBPrint();
	
	// 读取所有房间信息
	public List<Room> readRoom() {
		roomList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String sql = "CALL proc_select(NULL,@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			System.out.println("准备读取数据库room表数据");
			System.out.println("执行的sql语句=" + sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Short id = rs.getShort("room_id");
				String roomNum = rs.getString("room_num");
				String roomType = rs.getString("room_type");
				Byte roomArea = rs.getByte("room_area");
				Byte roomMaxnumOfPeople = rs.getByte("room_maxnum_of_people");
				Short roomPrice = rs.getShort("room_price");
				Byte roomAircondition = rs.getByte("room_aircondition");
				Byte roomTV = rs.getByte("room_aircondition");
				Byte roomWifi = rs.getByte("room_wifi");
				Byte roomWashroom = rs.getByte("room_washroom");
				Byte roomIsStay = rs.getByte("room_is_stay");

				Room room = new Room(id, roomNum, roomType, roomArea, roomMaxnumOfPeople, roomPrice, roomAircondition,
						roomTV, roomWifi, roomWashroom, roomIsStay);
				roomList.add(room);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return roomList;
	}

	// 查询房间——混杂查询
	public List<Room> RoomList(String room_num,String type,String maxnum,String isStay) {
		roomList.clear();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ptmt = null;
		try {

			conn = getConnection();

			System.out.println("准备 筛选数据库Room表 数据");
			StringBuilder sql = new StringBuilder(" SELECT * FROM room   where 1=1 ");
			List<String> paramList = new ArrayList<String>();
			if (room_num != null && !"".equals(room_num.trim())) {
				sql.append(" and room_name like '%' ? '%' ");
				paramList.add(room_num);
			}
			if (type != null && !"".equals(type.trim())) {
				sql.append(" and room_phone=? ");
				paramList.add(type);
			}
			if (maxnum != null && !"".equals(maxnum.trim())) {
				sql.append(" and room_document_num=? ");
				paramList.add(maxnum);
			}
			if (isStay != null && !"".equals(isStay.trim())) {
				sql.append(" and room_isStay=? ");
				paramList.add(isStay);
			}

			ptmt = conn.prepareStatement(sql.toString());
			for (int i = 0; i < paramList.size(); i++) {
				ptmt.setString(i + 1, paramList.get(i));
				System.out.println(paramList.get(i));
			}

			printer.PrintSQL("Room", ptmt.toString());

			rs = ptmt.executeQuery();
			while (rs.next()) {
				Short id = rs.getShort("room_id");
				String roomNum = rs.getString("room_num");
				String roomType = rs.getString("room_type");
				Byte roomArea = rs.getByte("room_area");
				Byte roomMaxnumOfPeople = rs.getByte("room_maxnum_of_people");
				Short roomPrice = rs.getShort("room_price");
				Byte roomAircondition = rs.getByte("room_aircondition");
				Byte roomTV = rs.getByte("room_aircondition");
				Byte roomWifi = rs.getByte("room_wifi");
				Byte roomWashroom = rs.getByte("room_washroom");
				Byte roomIsStay = rs.getByte("room_is_stay");

				Room room = new Room(id, roomNum, roomType, roomArea, roomMaxnumOfPeople, roomPrice, roomAircondition,
						roomTV, roomWifi, roomWashroom, roomIsStay);
				roomList.add(room);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return roomList;
	}

	// 更新房间信息
	public boolean RoomUpdate(Short roomId, String roomNum, String roomType, Byte roomArea, Byte roomMaxnumOfPeople,
			Short roomPrice, Byte roomAircondition, Byte roomTV, Byte roomWifi, Byte roomWashroom, Byte roomIsStay) {
		String sql = "CALL proc_roomUpdate(," + roomId + ",'" + roomNum + "','" + roomType + "'," + roomArea + ","
				+ roomMaxnumOfPeople + "," + roomPrice + "," + roomAircondition + "," + roomTV + "," + roomWifi + ","
				+ roomWashroom + "," + roomIsStay + ",@state)";
		System.out.println("更新房间的sql语句=" + sql);
		boolean returnValue = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			System.out.println("准备 更新房间信息 到数据库");
			stmt.executeQuery(sql);
			rs = stmt.executeQuery("SELECT @state");
			while (rs.next()) {
				String state = rs.getString(1);
				if (state.equals("updateRoomSuccess")) {
					returnValue = true;
					break;
				}
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return returnValue;
	}

	// 删除房间——根据房间编号
	public boolean RoomDelete(String roomNum) {
		String sql = "CALL proc_roomDel( '" + roomNum + "',@state)";
		System.out.println("更新房间的sql语句=" + sql);
		boolean returnValue = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			System.out.println("准备 从数据库删除房间" + roomNum);
			stmt.executeQuery(sql);
			rs = stmt.executeQuery("SELECT @state");
			while (rs.next()) {
				String state = rs.getString(1);
				if (state.equals("delRoomSuccess")) {
					returnValue = true;
					break;
				} else if (state.equals("delRoomFailed")) {
					returnValue = false;
					break;
				}
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return returnValue;
	}
}
