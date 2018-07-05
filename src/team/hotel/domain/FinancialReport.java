package team.hotel.domain;

import java.io.Serializable;
/**
 * @author Suqiao Lin
 * @version 创建时间：2018年7月5日 财务报表
 */

public class FinancialReport implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Short finId;

	private Short finTodayIncome;

	private Short finTodayExpend;

	public Short getFinId() {
		return finId;
	}

	public void setFinId(Short finId) {
		this.finId = finId;
	}

	public Short getFinTodayIncome() {
		return finTodayIncome;
	}

	public void setFinTodayIncome(Short finTodayIncome) {
		this.finTodayIncome = finTodayIncome;
	}

	public Short getFinTodayExpend() {
		return finTodayExpend;
	}

	public void setFinTodayExpend(Short finTodayExpend) {
		this.finTodayExpend = finTodayExpend;
	}

	public FinancialReport(Short finId, Short finTodayIncome, Short finTodayExpend) {
		super();
		this.finId = finId;
		this.finTodayIncome = finTodayIncome;
		this.finTodayExpend = finTodayExpend;
	}

	@Override
	public String toString() {
		return "FinancialReport [finId=" + finId + ", finTodayIncome=" + finTodayIncome + ", finTodayExpend="
				+ finTodayExpend + "]";
	}
	
}
