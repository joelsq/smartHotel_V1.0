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

				CheckList checklist = new CheckList(id, checkid, null,null,null,roomid, null,checkinDate, checkDays,
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
	 * @param roomNum 房间编号	
	 * @param gender 客户性别
	 * @return
	 */
	public List<CheckList> CheckListSelect(CheckList list) {
		checklistList.clear();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ptmt = null;
		try {

			conn = getConnection();

			System.out.println("准备 筛选数据库CheckList表 数据");
			StringBuilder sql = new StringBuilder(
					"SELECT checklist_id, check_guest_id, guest_name,guest_phone,guest_gender,"
					+ "room_id, room_num,check_in_date, check_days,check_out_date,check_meal_type,"
					+ "check_num_of_people,check_room_consume,check_total_consume"
					+ "FROM checklist LEFT JOIN `guest` ON `check_guest_id`=`guest_id`"
					+ "LEFT JOIN room ON `check_room_id`=`room_id` WHERE 1=1;");
			List<String> paramList = new ArrayList<String>();
			if (list.getGuestName() != null && !"".equals(list.getGuestName().trim())) {
				sql.append(" and guest_name = ? ");
				paramList.add(list.getGuestName());
			}
			if (list.getGuestPhone() != null && !"".equals(list.getGuestPhone().trim())) {
				sql.append(" and guest_phone=? ");
				paramList.add(list.getGuestPhone());
			}
			if (list.getRoomNum()!= null && !"".equals(list.getRoomNum().trim())) {
				sql.append(" and room_num=? ");
				paramList.add(list.getRoomNum());
			}
			if (list.getCheckInDate() != null && !"".equals(list.getCheckInDate().trim())) {
				sql.append(" and check_in_date=? ");
				paramList.add(list.getCheckInDate());
			}
			if (list.getCheckOutDate() != null && !"".equals(list.getCheckOutDate().trim())) {
				sql.append(" and check_out_date=? ");
				paramList.add(list.getCheckOutDate());
			}	
			if (list.getCheckDays() != null && !"".equals(list.getCheckDays().trim())) {
				sql.append(" and check_days=? ");
				paramList.add(list.getCheckDays());
			}
			if (list.getCheckMealType() != null && !"".equals(list.getCheckMealType().trim())) {
				sql.append(" and check_meal_type=? ");
				paramList.add(list.getCheckMealType());
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
				String guestName=rs.getString(3);
				String phone=rs.getString(4);
				String guestGender=rs.getString(5);
				String roomid = rs.getString(6);
				String roomNum2=rs.getString(7);
				String checkinDate = rs.getString(8);
				String checkDays = rs.getString(9);
				String checkoutDate = rs.getString(10);
				String checkMealType = rs.getString(11);
				String checkNumOfPeople = rs.getString(12);
				String checkRoomConsume = rs.getString(13);
				String checkTotalConsume = rs.getString(14);

				CheckList checklist = new CheckList(id, checkid, guestName, phone, 
						guestGender, roomid, roomNum2, checkinDate,checkDays, 
						checkoutDate, checkMealType, checkNumOfPeople, 
						checkRoomConsume, checkTotalConsume);
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
	/**
	 * 
	 * @param check 
	 * @return
	 */
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
		
		String sql = "CALL proc_checklistUpdate(" + id + "," +Roomid + ",'" + InDate + "'," + days	+ 
				",'" + outDate + "','" + mealType + "'," + numOfPeople + "," + roomConsume +
				","  + totalConsume + ",@state)";
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

	// 删除入住表——根据入住表编号
	/**
	 * 
	 * @param checklistid
	 * @return
	 */
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
	/**
	 * 
	 * @param check
	 * @return
	 */
	public boolean CheckListAdd(CheckList check) {
		String checkguestid=check.getGuestId();
		String checkRoomid=check.getRoomId();
		String checkInDate=check.getCheckInDate();
		String checkDays=check.getCheckDays();
		String checkOutDate=check.getCheckOutDate();
		String checkMealType=check.getCheckMealType();
		String checkNumOfPeople=check.getCheckNumOfPeople();
	
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
