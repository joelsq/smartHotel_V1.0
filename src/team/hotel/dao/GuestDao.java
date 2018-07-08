package team.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import team.hotel.domain.Guest;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月6日 数据库-客人
 */
public class GuestDao extends DBUtil {

	List<Guest> guestList = new ArrayList<Guest>();

	// 读取所有客人信息
	public List<Guest> GuestRead() {
		guestList.clear();

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "CALL proc_select(NULL,@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			DBPrint.PrintReadSQL("Guest", sql);// DBPrint输出
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String id = rs.getString("guest_id");
				String guestName = rs.getString("guest_num");
				String guestPhone = rs.getString("guest_phone");
				String guestPassword = rs.getString("guest_password");
				String guestDocNum = rs.getString("guest_document_num");
				String guestGender = rs.getString("guest_gender");
				String guestLastVisit = rs.getString("guest_last_visit");
				String guestLastIP = rs.getString("guest_last_ip");

				Guest guest = new Guest(id, guestName, guestPhone, guestPassword, guestDocNum, guestGender,
						guestLastVisit, guestLastIP);
				guestList.add(guest);
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
		return guestList;
	}

	// 查询客人——自定义语句
	public List<Guest> GuestSelect(Guest guest) {
		//String guestId=guest.getGuestId();
		String Name=guest.getGuestName();
		String Phone=guest.getGuestPhone();
		String docNum=guest.getGuestDocumentNum();
		String gender=guest.getGuestGender();
		guestList.clear();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ptmt = null;
		try {

			conn = getConnection();

			System.out.println("准备 筛选数据库Guest表 数据");
			StringBuilder sql = new StringBuilder(" SELECT * FROM guest   where 1=1 ");
			List<String> paramList = new ArrayList<String>();
			if (Name != null && !"".equals(Name.trim())) {
				sql.append(" and guest_name like '%' ? '%' ");
				paramList.add(Name);
			}
			if (Phone != null && !"".equals(Phone.trim())) {
				sql.append(" and guest_phone=? ");
				paramList.add(Phone);
			}
			if (docNum != null && !"".equals(docNum.trim())) {
				sql.append(" and guest_document_num=? ");
				paramList.add(docNum);
			}
			if (gender != null && !"".equals(gender.trim())) {
				sql.append(" and guest_gender=? ");
				paramList.add(gender);
			}

			ptmt = conn.prepareStatement(sql.toString());
			for (int i = 0; i < paramList.size(); i++) {
				ptmt.setString(i + 1, paramList.get(i));
				System.out.println(paramList.get(i));
			}

			DBPrint.PrintSQL("Guest", ptmt.toString());

			rs = ptmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("guest_id");
				String guestName = rs.getString("guest_Name");
				String guestPhone = rs.getString("guest_phone");
				String guestPassword = rs.getString("guest_password");
				String guestDocNum = rs.getString("guest_document_num");
				String guestGender = rs.getString("guest_gender");
				String guestLastVisit = rs.getString("guest_last_visit");
				String guestLastIP = rs.getString("guest_last_ip");

				Guest g = new Guest(id, guestName, guestPhone, guestPassword, guestDocNum, guestGender,
						guestLastVisit, guestLastIP);
				guestList.add(g);
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
		return guestList;
	}

	// 更新客人信息
	public boolean GuestUpdate(Guest guest) {
		String guestName=guest.getGuestName();
		String guestPhone=guest.getGuestPhone();
		String guestPassword=guest.getGuestPassword();
		String guestDocumentNum=guest.getGuestDocumentNum();
		String guestGender=guest.getGuestGender();
		String gusetLastVisit=guest.getGusetLastVisit();
		String gusetLastIp=guest.getGusetLastIp();
		
		String sql = "CALL proc_guestUpdate('" + guestName + "','" + guestPhone + "','" + guestPassword
				+ "','" + guestDocumentNum + "','" + guestGender + "','" + gusetLastVisit + "','" + gusetLastIp
				+ "',@state)";
		DBPrint.PrintUpdateSQL("Guest", sql);
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
				if (state.equals("updateGuestSuccess")) {
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

	// 删除客人——根据客人编号
	public boolean GuestDelete(String guestName) {
		String sql = "CALL proc_guestDel( '" + guestName + "',@state)";
		DBPrint.PrintDelSQL("Guest", sql);
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
				if (state.equals("delGuestSuccess")) {
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

	// 添加客人
	public boolean GuestAdd(Guest guest) {
		String guestName=guest.getGuestName();
		String guestPhone=guest.getGuestPhone();
		String guestPassword=guest.getGuestPassword();
		String guestDocumentNum=guest.getGuestDocumentNum();
		String guestGender=guest.getGuestGender();
		String gusetLastVisit=guest.getGusetLastVisit();
		String gusetLastIp=guest.getGusetLastIp();
		
		String sql = "CALL proc_guestUpdate('" + guestName + "','" + guestPhone + "','" + guestPassword + "','"
				+ guestDocumentNum + "','" + guestGender + "','" + gusetLastVisit + "','" + gusetLastIp + "',@state)";
		DBPrint.PrintUpdateSQL("Guest", sql);
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
				if (state.equals("addGuestSuccess")) {
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
