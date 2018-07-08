package team.hotel.dao;

import java.sql.Connection;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

//import team.hotel.domain.CheckList;
import team.hotel.domain.Hotel;
//import team.hotel.domain.Room;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月8日 其他特殊数据库操作
 */
public class HotelDao extends DBUtil {

	List<Hotel> hotelList = new ArrayList<Hotel>();

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	// 查询酒店信息
	String guestnum=null;
	public List<Hotel> HotelSelect() {

		String sql = "select count(*) from guest";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				guestnum = rs.getString("guestnum");
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

		return hotelList;
	}

}
