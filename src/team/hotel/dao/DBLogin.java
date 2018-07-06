package team.hotel.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月6日 
 * 登录系统
 */
public class DBLogin extends DBUtil {

	// 管理人员登录验证
	public String loginSuccess(String Name, String password) {
		String returnValue = "loginInit";
		// 调用数据库的proc_login存储过程
		//String sql = "CALL proc_login('" + Name + "','" + password + "',@state)";
		String sql = "CALL proc_login_au('" + Name + "','" + password + "',@state)";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			System.out.println("准备登录！登录sql语句为：" + sql);
			stmt.executeQuery(sql);
			rs = stmt.executeQuery("SELECT @state");
			while (rs.next()) {
				returnValue = rs.getString(1);
//				if (returnValue.equals("loginNameError")) {
//					returnValue = ;
//					break;
//				}
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
