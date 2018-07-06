package team.hotel.dao;

import java.sql.*;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月5日 数据库连接
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
}
