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
public class RoomDao extends DBUtil {

	List<Room> roomList = new ArrayList<Room>();
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	// 读取所有房间信息
	public List<Room> readRoom() {
		roomList.clear();
		String sql = "CALL proc_roomSelect(NULL,@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String id = rs.getString("room_id");
				String roomNum = rs.getString("room_num");
				String roomType = rs.getString("room_type");
				String area = rs.getString("room_area");
				String maxnum = rs.getString("room_maxnum_of_people");
				String price = rs.getString("room_price");
				String roomAircondition = rs.getString("room_aircondition");
				String roomTV = rs.getString("room_aircondition");
				String roomWifi = rs.getString("room_wifi");
				String roomWashroom = rs.getString("room_washroom");
				String roomIsStay = rs.getString("room_is_stay");

				Room r = new Room(id, roomNum, roomType, area, maxnum, price, roomAircondition, roomTV, roomWifi,
						roomWashroom, roomIsStay);
				roomList.add(r);
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
	public List<Room> RoomList(Room room) {
		PreparedStatement ptmt = null;
		String room_num = room.getRoomNum();
		String type = room.getRoomType();
		String maxnum = room.getRoomMaxnumOfPeople();
		String isStay = room.getRoomIsStay();

		roomList.clear();
		try {

			conn = getConnection();

			System.out.println("准备 筛选数据库Room表 数据");
			System.out.println("参数：" + room_num + "," + type + "," + maxnum + "," + isStay);
			StringBuilder sql = new StringBuilder(" SELECT * FROM room where 1=1");
			List<String> paramList = new ArrayList<String>();
			if (room_num != null && !"".equals(room_num.trim())) {
				sql.append(" and room_num= ?");
				paramList.add(room_num);
			}
			if (type != null && !"".equals(type.trim())) {
				sql.append(" and room_type like '%' ? '%' ");
				paramList.add(type);
			}
			if (maxnum != null && !"".equals(maxnum.trim())) {
				sql.append(" and room_maxnum_of_people=? ");
				paramList.add(maxnum);
			}
			if (isStay != null && !"".equals(isStay.trim())) {
				sql.append(" and room_is_stay=? ");
				paramList.add(isStay);
			}

			ptmt = conn.prepareStatement(sql.toString());
			for (int i = 0; i < paramList.size(); i++) {
				ptmt.setString(i + 1, paramList.get(i));
				System.out.println(paramList.get(i));
			}

			DBPrint.PrintSQL("Room", ptmt.toString());

			rs = ptmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("room_id");
				String roomNum = rs.getString("room_num");
				String roomType = rs.getString("room_type");
				String area = rs.getString("room_area");
				String maxNum = rs.getString("room_maxnum_of_people");
				String price = rs.getString("room_price");
				String roomAircondition = rs.getString("room_aircondition");
				String roomTV = rs.getString("room_aircondition");
				String roomWifi = rs.getString("room_wifi");
				String roomWashroom = rs.getString("room_washroom");
				String roomIsStay = rs.getString("room_is_stay");

				Room r = new Room(id, roomNum, roomType, area, maxNum, price, roomAircondition, roomTV, roomWifi,
						roomWashroom, roomIsStay);
				roomList.add(r);
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
	public boolean RoomUpdate(Room room) {
		// String id = room.getRoomId();
		String roomNum = room.getRoomNum();
		String roomType = room.getRoomType();
		String area = room.getRoomArea();
		String maxnum = room.getRoomMaxnumOfPeople();
		String price = room.getRoomPrice();
		String roomAircondition = room.getRoomAircondition();
		String roomTV = room.getRoomTV();
		String roomWifi = room.getRoomWifi();
		String roomWashroom = room.getRoomWashroom();
		String roomIsStay = room.getRoomIsStay();

		String sql = "CALL proc_roomUpdate('" + roomNum + "','" + roomType + "'," + area + "," + maxnum + "," + price
				+ "," + roomAircondition + "," + roomTV + "," + roomWifi + "," + roomWashroom + "," + roomIsStay
				+ ",@state)";
		System.out.println("更新房间的sql语句=" + sql);
		boolean returnValue = false;

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

	// 新增房间
	public boolean RoomAdd(Room room) {
		// String id = room.getRoomId();
		String roomNum = room.getRoomNum();
		String roomType = room.getRoomType();
		String area = room.getRoomArea();
		String maxnum = room.getRoomMaxnumOfPeople();
		String price = room.getRoomPrice();
		String roomAircondition = room.getRoomAircondition();
		String roomTV = room.getRoomTV();
		String roomWifi = room.getRoomWifi();
		String roomWashroom = room.getRoomWashroom();
		String roomIsStay = room.getRoomIsStay();

		String sql = "CALL proc_roomAdd('" + roomNum + "','" + roomType + "'," + area + "," + maxnum
				+ "," + price + "," + roomAircondition + "," + roomTV + "," + roomWifi + "," + roomWashroom + ","
				+ roomIsStay + ",@state)";
		System.out.println("新增房间的sql语句=" + sql);
		boolean returnValue = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			System.out.println("准备 新增房间 到数据库");
			DBPrint.PrintSQL(sql);
			stmt.executeQuery(sql);
			rs = stmt.executeQuery("SELECT @state");
			while (rs.next()) {
				String state = rs.getString(1);
				if (state.equals("addRoomSuccess")) {
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
}
