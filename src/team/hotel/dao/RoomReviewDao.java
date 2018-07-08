package team.hotel.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import team.hotel.domain.RoomReview;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月6日 数据库-客户评价
 */
public class RoomReviewDao extends DBUtil {
	List<RoomReview> RoomReviewList = new ArrayList<RoomReview>();
	
	// 读取所有客户评价信息
	public List<RoomReview> RoomReviewRead() {
		RoomReviewList.clear();

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "CALL proc_select(NULL,@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			DBPrint.PrintReadSQL("RoomReview", sql);// DBPrint输出
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String id = rs.getString(1);
				String roomNum= rs.getString(2);
				String guestid = rs.getString(3);
				String score = rs.getString(4);
				String comment=rs.getString(5);
				String photo=rs.getString(6);
			
				RoomReview RoomReview = new RoomReview(id,roomNum,guestid,score,comment,photo);
				RoomReviewList.add(RoomReview);
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
		return RoomReviewList;
	}

	// 查询客户评价——房间
	public List<RoomReview> RoomReviewList(String roomnum) {
		RoomReviewList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String sql = "CALL proc_review_select('" + roomnum + "',@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			DBPrint.PrintSeleteSQL("RoomReview", sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String id = rs.getString(1);
				String roomNum= rs.getString(2);
				String guestid = rs.getString(3);
				String score = rs.getString(4);
				String comment=rs.getString(5);
				String photo=rs.getString(6);
			
				RoomReview RoomReview = new RoomReview(id,roomNum,guestid,score,comment,photo);
				RoomReviewList.add(RoomReview);
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
		return RoomReviewList;
	}

	// 更新客户评价信息
	public boolean RoomReviewUpdate(String id, String income, String expend, String date) {
		String sql = "CALL proc_RoomReviewUpdate(" + id + "," + income + "," + expend + ",'" + date + "',@state)";
		DBPrint.PrintUpdateSQL("RoomReview", sql);
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
				if (state.equals("updateRoomReviewSuccess")) {
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

	// 删除客户评价——根据客户评价编号
	public boolean RoomReviewDelete(String RoomReviewid) {
		String sql = "CALL proc_RoomReviewDel( '" + RoomReviewid + "',@state)";
		DBPrint.PrintDelSQL("RoomReview", sql);
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
				if (state.equals("delRoomReviewSuccess")) {
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
