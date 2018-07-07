package team.hotel.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月6日 数据库-登录系统
 */
public class LoginDao {
	boolean bInited = false;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

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

	// 连接数据库
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		if (!bInited) {
			initJDBC();
		}
		// 连接URL为 jdbc:mysql//服务器地址/数据库名
		// 后面的2个参数分别是登陆用户名和密码
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "root");
		return conn;
	}

	// 用户登录
	public String loginSuccess(String Name, String password) throws ClassNotFoundException {
		String returnValue = "loginInit";
		// 调用数据库的proc_login_au存储过程
		String sql = "CALL proc_login_au('" + Name + "','" + password + "',@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			System.out.println("准备登录！登录sql语句为：" + sql);
			stmt.executeQuery(sql);
			rs = stmt.executeQuery("SELECT @state");
			while (rs.next()) {
				System.out.println("loginReturn=" + returnValue);
				returnValue = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
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

	// 用户注册
	public String Register(String Name, String pw1, String pw2) throws ClassNotFoundException {
		String returnValue = "registerInit";
		// 调用数据库的proc_register存储过程
		String sql = "CALL proc_register('" + Name + "','" + pw1 + "','" + pw2 + "',@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			DBPrint.PrintSQL("User", sql);

			stmt.executeQuery(sql);
			rs = stmt.executeQuery("SELECT @state");
			while (rs.next()) {
				System.out.println("registerReturn=" + returnValue);
				returnValue = rs.getString(1);
			}
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
