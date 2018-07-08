package team.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import team.hotel.domain.CheckList;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月6日 数据库-入住表
 */
public class CheckListDao extends DBUtil {

	List<CheckList> checklistList = new ArrayList<CheckList>();
	DBPrint DBPrint = new DBPrint();

	// 读取所有入住表信息
	public List<CheckList> CheckListRead() {
		checklistList.clear();

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "CALL proc_select(NULL,@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			team.hotel.dao.DBPrint.PrintReadSQL("CheckList", sql);// DBPrint输出
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String id = rs.getString(1);
				String checkid = rs.getString(2);
				String roomid = rs.getString(3);
				String checkinDate = rs.getString(4);
				String checkDays = rs.getString(5);
				String checkoutDate = rs.getString(6);
				String checkMealType = rs.getString(7);
				String checkNumofPeople = rs.getString(8);
				String checkRoomConsume = rs.getString(9);
				String checkTotalConsume = rs.getString(10);

				CheckList checklist = new CheckList(id, checkid, roomid, checkinDate, checkDays,
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

	// 查询入住表
	/**
	 * 
	 * @param checkId 客户id
	 * @param Phone 客户手机
	 * @param docNum	客户证件号
	 * @param gender 客户性别
	 * @return
	 */
	public List<CheckList> CheckListSelect(String checkId, String Phone, String docNum, String gender) {
		checklistList.clear();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ptmt = null;
		try {

			conn = getConnection();

			System.out.println("准备 筛选数据库CheckList表 数据");
			StringBuilder sql = new StringBuilder(
					"SELECT checklist_id, check_id, check_phone,check_name,check_gender,room_id,room_num,check_in_date,"
							+ "check_in_date,check_days,check_out_date,check_meal_type,check_num_of_people,check_room_consume,check_total_consume"
							+ "FROM checklist LEFT JOIN `check` ON `check_check_id`=`check_id`"
							+ "LEFT JOIN room ON `check_room_id`=`room_id` WHERE 1=1;");
			List<String> paramList = new ArrayList<String>();
			if (checkId != null && !"".equals(checkId.trim())) {
				sql.append(" and check_check_id like '%' ? '%' ");
				paramList.add(checkId);
			}
			if (Phone != null && !"".equals(Phone.trim())) {
				sql.append(" and check_phone=? ");
				paramList.add(Phone);
			}
			if (docNum != null && !"".equals(docNum.trim())) {
				sql.append(" and check_document_num=? ");
				paramList.add(docNum);
			}
			if (gender != null && !"".equals(gender.trim())) {
				sql.append(" and check_gender=? ");
				paramList.add(gender);
			}

			ptmt = conn.prepareStatement(sql.toString());
			for (int i = 0; i < paramList.size(); i++) {
				ptmt.setString(i + 1, paramList.get(i));
				System.out.println(paramList.get(i));
			}

			team.hotel.dao.DBPrint.PrintSQL("CheckList", ptmt.toString());

			rs = ptmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString(1);
				String checkid = rs.getString(2);
				String roomid = rs.getString(3);
				String checkinDate = rs.getString(4);
				String checkDays = rs.getString(5);
				String checkoutDate = rs.getString(6);
				String checkMealType = rs.getString(7);
				String checkNumofPeople = rs.getString(8);
				String checkRoomConsume = rs.getString(9);
				String checkTotalConsume = rs.getString(10);

				CheckList checklist = new CheckList(id, checkid, roomid, checkinDate, checkDays,
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
	public boolean CheckListUpdate(CheckList check) {
		String id=check.getGuestId();
		String Roomid=check.getRoomId();
		String InDate=check.getCheckInDate();
		String days=check.getCheckDays();
		String outDate=check.getCheckOutDate();
		String mealType=check.getCheckMealType();
		String numOfPeople=check.getCheckNumOfPeople();
		String roomConsume=check.getCheckRoomConsume();
		String totalConsume=check.getCheckTotalConsume();
		
		String sql = "CALL proc_checklistUpdate(" + id + "," +Roomid + ",'" + InDate + "','" + days	+ 
				",'" + outDate + "','" + mealType + "','" + "'," + numOfPeople + "," + roomConsume + ","	+ totalConsume + ",@state)";
		team.hotel.dao.DBPrint.PrintUpdateSQL("CheckList", sql);
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

	//根据id删除入住表
	// 删除入住表——根据入住表编号
	public boolean CheckListDelete(String checklistid) {
		String sql = "CALL proc_checklistDel( '" + checklistid + "',@state)";
		team.hotel.dao.DBPrint.PrintDelSQL("CheckList", sql);
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

	//添加入住表
	public boolean CheckListAdd(CheckList check) {
		String checkguestid=check.getGuestId();
		String checkRoomid=check.getRoomId();
		String checkInDate=check.getCheckInDate();
		String checkDays=check.getCheckDays();
		String checkOutDate=check.getCheckOutDate();
		String checkMealType=check.getCheckMealType();
		String checkNumOfPeople=check.getCheckNumOfPeople();
		//String checkRoomConsume=check.getCheckRoomConsume();
		//String checkTotalConsume=check.getCheckTotalConsume();
		
		String sql = "CALL proc_checkAdd(" + checkguestid+","+checkRoomid + ",'" +checkInDate + "',"
				+ checkDays + ",'" + checkOutDate + "','" + checkMealType + "'," + checkNumOfPeople +","
				+0+","+0+",@state)";
		
		team.hotel.dao.DBPrint.PrintAddSQL("CheckList", sql);
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
				if (state.equals("addCheckListSuccess")) {
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
