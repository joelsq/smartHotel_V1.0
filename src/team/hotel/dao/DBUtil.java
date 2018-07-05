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
		//调用数据库的proc_login存储过程
		String sql = "CALL proc_login('" +Name + "','" + password + "',@state)";
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

}
