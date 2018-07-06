package team.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import team.hotel.domain.FinancialReport;
import team.hotel.domain.FinancialReport;

/**
* @author Suqiao Lin
* @version 创建时间：2018年7月6日
* 数据库-财务报表
*/
public class DBFinancialReport extends DBUtil{

	List<FinancialReport> financialReportList = new ArrayList<FinancialReport>();
	DBPrint printer = new DBPrint();

	// 读取所有财务报表信息
	public List<FinancialReport> FinancialReportRead() {
		financialReportList.clear();

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "CALL proc_selectAll('financialReport',@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			printer.PrintReadSQL("FinancialReport", sql);// printer输出
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Short id = rs.getShort(1);
				Short todayIncome = rs.getShort(2);
				Short todayExpend = rs.getShort(3);

				FinancialReport financialReport = new FinancialReport(id, todayIncome,todayExpend);
				financialReportList.add(financialReport);
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
		return financialReportList;
	}

	// 查询财务报表——日期
	public List<FinancialReport> FinancialReportList(String date) {
		financialReportList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String sql = "CALL proc_select('" + date+ "',@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			printer.PrintSeleteSQL("FinancialReport" ,sql);
			
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Short id = rs.getShort(1);
				Short finIncome = rs.getShort(2);
				Short finExpend = rs.getShort(3);
				Date finDate=rs.getDate(4);
			

				FinancialReport fin = new FinancialReport(id,finIncome,finExpend,finDate);
				financialReportList.add(fin);
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
		return financialReportList;
	}


	// 更新财务报表信息
	public boolean FinancialReportUpdate(String id,String guestid,String finid, String checkinDate,String Days,
			String checkoutDate,String mealType,String numOfPeople,String finConsume,String totalConsume) {
		String sql = "CALL proc_financialReportUpdate(" + id + "," + guestid+ "," + finid + ",'"
				+ checkinDate+ "'," +Days + ",'" + checkoutDate + "','" + mealType + "','"
				+"','"+numOfPeople+","+finConsume+","+totalConsume+",@state)";
		printer.PrintUpdateSQL("FinancialReport", sql);
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
				if (state.equals("updateFinancialReportSuccess")) {
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

	// 删除财务报表——根据财务报表编号
	public boolean FinancialReportDelete(String financialReportid) {
		String sql = "CALL proc_financialReportDel( '" + financialReportid + "',@state)";
		printer.PrintDelSQL("FinancialReport", sql);
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
				if (state.equals("delFinancialReportSuccess")) {
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
