package team.hotel.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import team.hotel.domain.FinancialReport;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月6日 数据库-财务报表
 */
public class FinancialReportDao extends DBUtil {

	List<FinancialReport> financialReportList = new ArrayList<FinancialReport>();

	// 读取所有财务报表信息
	public List<FinancialReport> FinancialReportRead() {
		financialReportList.clear();

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "CALL proc_select(NULL,@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			DBPrint.PrintReadSQL("FinancialReport", sql);// DBPrint输出
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String id = rs.getString(1);
				String todayIncome = rs.getString(2);
				String todayExpend = rs.getString(3);
				String date = rs.getString(4);
				FinancialReport financialReport = new FinancialReport(id, todayIncome, todayExpend, date);
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
	public List<FinancialReport> FinancialReportSelect(String date) {
		financialReportList.clear();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String sql = "CALL proc_select('" + date + "',@state)";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			DBPrint.PrintSeleteSQL("FinancialReport", sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String id = rs.getString(1);
				String finIncome = rs.getString(2);
				String finExpend = rs.getString(3);
				String finDate = rs.getString(4);

				FinancialReport fin = new FinancialReport(id, finIncome, finExpend, finDate);
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
	public boolean FinancialReportUpdate(FinancialReport report) {
		String id = report.getFinId();
		String income = report.getFinTodayIncome();
		String expend = report.getFinTodayExpend();
		String date = report.getFinDate();

		String sql = "CALL proc_financialReportUpdate(" + id + "," + income + "," + expend + ",'" + date + "',@state)";
		DBPrint.PrintUpdateSQL("FinancialReport", sql);
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
		DBPrint.PrintDelSQL("FinancialReport", sql);
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

	// 新增财务报表信息
	public boolean FinancialReportAdd(FinancialReport report) {
		String id = report.getFinId();
		String income = report.getFinTodayIncome();
		String expend = report.getFinTodayExpend();
		String date = report.getFinDate();

		String sql = "CALL proc_financialReportUpdate(" + id + "," + income + "," + expend + ",'" + date + "',@state)";
		DBPrint.PrintUpdateSQL("FinancialReport", sql);
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

}
