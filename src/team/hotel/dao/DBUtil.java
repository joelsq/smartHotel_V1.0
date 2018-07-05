package team.hotel.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import team.hotel.domain.*;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月5日 数据库操作
 */
public class DBUtil {
	boolean bInited = false;
	List<Room> roomList = new ArrayList<Room>();

	// 加载驱动，连接数据库
	public void initJDBC() throws ClassNotFoundException {
		// 加载MYSQL JDBC驱动程序
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		bInited = true;
		System.out.println("Success loading Mysql Driver!");
	}

	// 用户名和密码登录数据库
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		if (!bInited) {
			initJDBC();
		}
		// 连接URL为 jdbc:mysql//服务器地址/数据库名
		// 后面的2个参数分别是登陆用户名和密码
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "root");
		return conn;
	}

	// 管理人员登录验证
	public boolean loginSuccess(String Name, String password) {
		boolean returnValue = false;
		// 调用数据库的proc_login存储过程
		String sql = "CALL proc_login('" + Name + "','" + password + "',@state)";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			System.out.println("准备登录！" + sql);
			stmt.executeQuery(sql);
			rs = stmt.executeQuery("SELECT @state");
			while (rs.next()) {
				String state = rs.getString(1);
				if (state.equals("1")) {
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
					/* ignored */}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					/* ignored */}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					/* ignored */}
			}
		}

		return returnValue;

	}

	// 读取所有房间信息
	public List<Room> readRoom() {
		roomList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String sql = "CALL proc_selectAll('room',@state)";
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
					/* ignored */}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					/* ignored */}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					/* ignored */}
			}
		}
		return roomList;
	}

	// 查询房间——根据房间编号
	public List<Room> queryRoomList(String inputRoomNum) {
		roomList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String sql = "CALL proc_select('" + inputRoomNum + "',@state)";
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
					/* ignored */}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					/* ignored */}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					/* ignored */}
			}
		}
		return roomList;
	}

	// 更新房间信息
	public boolean updateRoom(Short roomId, String roomNum, String roomType, Byte roomArea, Byte roomMaxnumOfPeople,
			Short roomPrice, Byte roomAircondition, Byte roomTV, Byte roomWifi, Byte roomWashroom, Byte roomIsStay) {
		String sql = "CALL proc_roomUpdate(," + roomId + ",'" + roomNum + "'," + roomType + "," + roomArea + ","
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
					/* ignored */}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					/* ignored */}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					/* ignored */}
			}
		}

		return returnValue;
	}

}
