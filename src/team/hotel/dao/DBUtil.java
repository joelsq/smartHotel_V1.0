package team.hotel.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月5日 数据库连接
 */
public class DBUtil {

	public static final String DRIVER = "com.mysql.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/hotel?useUnicode=true&characterEncoding=utf-8&useSSL=false";
	public static final String USER = "root";
	public static final String PASSWORD = "root";
	boolean bInited = false;

	/**
	 * 加载数据库驱动
	 * @throws ClassNotFoundException
	 */
	public void initJDBC() throws ClassNotFoundException {
	try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		bInited = true;
		System.out.println("Success loading Mysql Driver!");
	}

	/**
	 * 连接数据库
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		if (!bInited) {
			initJDBC();
		}
		Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
		return conn;
	}

}
