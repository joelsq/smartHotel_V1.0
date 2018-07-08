package team.hotel.domain;

import java.io.Serializable;

/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月5日 财务报表
 */

public class FinancialReport implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String finId;

	private String finTodayIncome;

	private String finTodayExpend;

	private String finDate;

	public String getFinId() {
		return finId;
	}

	public void setFinId(String finId) {
		this.finId = finId;
	}

	public String getFinTodayIncome() {
		return finTodayIncome;
	}

	public void setFinTodayIncome(String finTodayIncome) {
		this.finTodayIncome = finTodayIncome;
	}

	public String getFinTodayExpend() {
		return finTodayExpend;
	}

	public void setFinTodayExpend(String finTodayExpend) {
		this.finTodayExpend = finTodayExpend;
	}

	public String getFinDate() {
		return finDate;
	}

	public void setFinDate(String finDate) {
		this.finDate = finDate;
	}

	public FinancialReport(String finId, String finTodayIncome, String finTodayExpend, String finDate) {
		super();
		this.finId = finId;
		this.finTodayIncome = finTodayIncome;
		this.finTodayExpend = finTodayExpend;
		this.finDate = finDate;
	}

	@Override
	public String toString() {
		return "FinancialReport [finId=" + finId + ", finTodayIncome=" + finTodayIncome + ", finTodayExpend="
				+ finTodayExpend + ", finDate=" + finDate + "]";
	}

}
