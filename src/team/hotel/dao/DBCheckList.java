package team.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import team.hotel.domain.CheckList;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月6日 数据库-入住表
 */
public class DBCheckList extends DBUtil {

	List<CheckList> checklistList = new ArrayList<CheckList>();
	DBPrint printer = new DBPrint();

	// 读取所有入住表信息
	public List<CheckList> CheckListRead() {
		checklistList.clear();

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "CALL proc_selectAll('checklist',@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			printer.PrintReadSQL("CheckList", sql);// printer输出
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Short id = rs.getShort(1);
				Short guestid = rs.getShort(2);
				String guestphone = rs.getString(3);
				Short roomid = rs.getShort(4);
				Date checkinDate = rs.getDate(5);
				Short checkDays = rs.getShort(6);
				Date checkoutDate = rs.getDate(7);
				String checkMealType = rs.getString(8);
				Byte checkNumofPeople = rs.getByte(9);
				Byte checkRoomConsume = rs.getByte(10);
				Byte checkTotalConsume = rs.getByte(11);

				CheckList checklist = new CheckList(id, guestid, guestphone, roomid, checkinDate, checkDays,
						checkoutDate, checkMealType, checkNumofPeople, checkRoomConsume, checkTotalConsume);
				checklistList.add(checklist);
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
		return checklistList;
	}

	// 查询入住表——自定义语句
	public List<CheckList> CheckListSelect(String guestId, String Phone, String docNum, String gender) {
		checklistList.clear();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ptmt = null;
		try {

			conn = getConnection();

			System.out.println("准备 筛选数据库CheckList表 数据");
			StringBuilder sql = new StringBuilder(
					"SELECT checklist_id, guest_id, guest_phone,guest_name,guest_gender,room_id,room_num,check_in_date,"
							+ "check_in_date,check_days,check_out_date,check_meal_type,check_num_of_people,check_room_consume,check_total_consume"
							+ "FROM checklist LEFT JOIN `guest` ON `check_guest_id`=`guest_id`"
							+ "LEFT JOIN room ON `check_room_id`=`room_id` WHERE 1=1;");
			List<String> paramList = new ArrayList<String>();
			if (guestId != null && !"".equals(guestId.trim())) {
				sql.append(" and check_guest_id like '%' ? '%' ");
				paramList.add(guestId);
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

			printer.PrintSQL("CheckList", ptmt.toString());

			rs = ptmt.executeQuery();
			while (rs.next()) {
				Short id = rs.getShort(1);
				Short guestid = rs.getShort(2);
				String guestphone = rs.getString(3);
				Short roomid = rs.getShort(4);
				Date checkinDate = rs.getDate(5);
				Short checkDays = rs.getShort(6);
				Date checkoutDate = rs.getDate(7);
				String checkMealType = rs.getString(8);
				Byte checkNumofPeople = rs.getByte(9);
				Byte checkRoomConsume = rs.getByte(10);
				Byte checkTotalConsume = rs.getByte(11);

				CheckList checklist = new CheckList(id, guestid, guestphone, roomid, checkinDate, checkDays,
						checkoutDate, checkMealType, checkNumofPeople, checkRoomConsume, checkTotalConsume);
				checklistList.add(checklist);
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
		return checklistList;
	}

	// 更新入住表信息
	public boolean CheckListUpdate(String id, String guestid, String roomid, String checkinDate, String Days,
			String checkoutDate, String mealType, String numOfPeople, String roomConsume, String totalConsume) {
		String sql = "CALL proc_checklistUpdate(" + id + "," + guestid + "," + roomid + ",'" + checkinDate + "'," + Days
				+ ",'" + checkoutDate + "','" + mealType + "','" + "','" + numOfPeople + "," + roomConsume + ","
				+ totalConsume + ",@state)";
		printer.PrintUpdateSQL("CheckList", sql);
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
				if (state.equals("updateCheckListSuccess")) {
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

	// 删除入住表——根据入住表编号
	public boolean CheckListDelete(String checklistid) {
		String sql = "CALL proc_checklistDel( '" + checklistid + "',@state)";
		printer.PrintDelSQL("CheckList", sql);
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
				if (state.equals("delCheckListSuccess")) {
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
