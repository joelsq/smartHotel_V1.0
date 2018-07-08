package team.hotel.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.PreparedStatement;

//import com.mysql.jdbc.PreparedStatement;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月5日 数据库连接
 */
public class DBUtil {
	
	public static final String DRIVER = "com.mysql.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/mybatis";
	public static final String USER = "root";
	public static final String PASSWORD = "";
 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
// 
//	public void getConnection() {
//		try {
//			Class.forName(DRIVER);
//			conn = DriverManager.getConnection(URL, USER, PASSWORD);
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
// 
//	public int executeUpdate(String sql, Object... obj) {
//		int num = 0;
//		getConnection();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			for (int i = 0; i < obj.length; i++) {
//				pstmt.setObject(i + 1, obj[i]);
//			}
//			num = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			closeAll();
//		}
//		return num;
//	}
// 
//	public ResultSet executeQuery(String sql, Object... obj) {
//		getConnection();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			for (int i = 0; i < obj.length; i++) {
//				pstmt.setObject(i + 1, obj[i]);
//			}
//			rs = pstmt.executeQuery();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return rs;
//	}
// 
//	public void closeAll() {
//		try {
//			rs.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		try {
//			pstmt.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		try {
//			conn.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}


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
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?useUnicode=true&characterEncoding=utf-8&useSSL=false", "root", "root");
		return conn;
	}	
	
}
