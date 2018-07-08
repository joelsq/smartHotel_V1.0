package team.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import team.hotel.dao.DBPrint;
import team.hotel.domain.User;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月6日 数据库-user
 */
public class UserDao extends DBUtil {

	List<User> userList = new ArrayList<User>();
	DBPrint DBPrint = new DBPrint();

	// 读取所有用户信息
	public List<User> UserRead() {
		userList.clear();

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "CALL proc_select(NULL,@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			team.hotel.dao.DBPrint.PrintReadSQL("User", sql);// DBPrint输出
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String id = rs.getString(1);
				String userName = rs.getString(2);
				String userPassword = rs.getString(3);
				String userCredit = rs.getString(4);
				String userAu = rs.getString(5);
				String userLastVisit = rs.getString(6);
				String userLastIP = rs.getString(7);

				User user = new User(id, userName, userPassword, userCredit, userAu, userLastVisit, userLastIP);
				userList.add(user);
				System.out.println(user.toString());
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
		return userList;
	}

	// 查询用户——自定义语句
	public List<User> UserSelect(User user) {
		String Name=user.getUserName();
		String auth=user.getAuthority();
		
		userList.clear();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ptmt = null;
		try {
			conn = getConnection();
			System.out.println("准备 筛选数据库User表 数据");
			System.out.println("参数：" + Name + "," + auth);
			StringBuilder sql = new StringBuilder("SELECT * FROM `user` where 1=1");
			List<String> paramList = new ArrayList<String>();

			if (Name != null && !"".equals(Name.trim())) {
				sql.append(" and user_name like '%' ? '%' ");
				paramList.add(Name);
			}
			if (auth != null && !"".equals(auth.trim())) {
				sql.append(" and user_authority=? ");
				paramList.add(auth);
			}
			
			ptmt = conn.prepareStatement(sql.toString());
			for (int i = 0; i < paramList.size(); i++) {
				ptmt.setString(i + 1, paramList.get(i));
				System.out.println(paramList.get(i));
			}
			team.hotel.dao.DBPrint.PrintSQL("User", ptmt.toString());

			rs = ptmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString(1);
				String userName = rs.getString(2);
				String userPassword = rs.getString(3);
				String userCredit = rs.getString(4);
				String userAu = rs.getString(5);
				String userLastVisit = rs.getString(6);
				String userLastIP = rs.getString(7);

				User u = new User(id, userName, userPassword, userCredit, userAu, userLastVisit, userLastIP);
				userList.add(u);
				//System.out.println(u);
			}
			//System.out.println("UserDao测试");
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
			if (ptmt != null) {
				try {
					ptmt.close();
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
		return userList;
	}

	// 更新用户信息
	public boolean UserUpdate(User user) {
		String userName=user.getUserName();
		String userPassword=user.getPassword();
		String auth=user.getAuthority();
		
		String sql = "CALL proc_userUpdate('" + userName + "','" + 
			userPassword + "'," + null + ",'"+ auth+"'," +null + "," +null+ ",@state)";
		team.hotel.dao.DBPrint.PrintUpdateSQL("User", sql);
		boolean returnValue = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			stmt = conn.createStatement();

			stmt.executeQuery(sql);
			rs = stmt.executeQuery("SELECT @state");
			while (rs.next()) {
				String state = rs.getString(1);
				if (state.equals("updateUserSuccess")) {
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

	// 删除用户——根据用户编号
	public boolean UserDelete(String userId) {
		String sql = "CALL proc_userDel( '" + userId + "',@state)";
		team.hotel.dao.DBPrint.PrintDelSQL("User", sql);
		boolean returnValue = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			rs = stmt.executeQuery("SELECT @state");
			while (rs.next()) {
				String state = rs.getString(1);
				if (state.equals("delUserSuccess")) {
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

	//新增用户（客服或者管理员）
	public boolean UserAdd(User user) {
		String userName=user.getUserName();
		String userPassword=user.getPassword();
		String auth=user.getAuthority();
		
		String sql = "CALL proc_userAdd('" + userName + "','" + 
			userPassword + "'," + null + ",'"+ auth+"'," +null + "," +null+ ",@state)";
		team.hotel.dao.DBPrint.PrintAddSQL("User", sql);
		boolean returnValue = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			stmt = conn.createStatement();

			stmt.executeQuery(sql);
			rs = stmt.executeQuery("SELECT @state");
			while (rs.next()) {
				String state = rs.getString(1);
				if (state.equals("addUserSuccess")) {
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
