package team.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import team.hotel.domain.CheckList;
import team.hotel.domain.Hotel;

/**
* @author Suqiao Lin
* @version 创建时间：2018年7月8日
* 其他特殊数据库操作
*/
public class HotelDao extends DBUtil{

	List<Hotel> hotelList=new ArrayList<Hotel>();
	// 查询酒店信息
	/**
	 * 
	 * @param checkId 客户id
	 * @param Phone 客户手机
	 * @param roomNum 房间编号	
	 * @param gender 客户性别
	 * @return
	 */
	public List<Hotel> HotelSelect(Hotel h) {
		
		hotelList.clear();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ptmt = null;
		try {

			conn = getConnection();

			System.out.println("HotelSelect 准备 筛选数据库表 数据");
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

}
