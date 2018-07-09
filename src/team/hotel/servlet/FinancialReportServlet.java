package team.hotel.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team.hotel.dao.FinancialReportDao;
import team.hotel.domain.FinancialReport;

/**
 * Servlet implementation class FinancialReportServlet
 */
@WebServlet("/FinancialReportServlet")
public class FinancialReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FinancialReportServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		FinancialReportDao db = new FinancialReportDao();

		String method = request.getParameter("method");// 请求的操作
		if (method == null || method.equals("")) {
			method = "index";
		}

		/******************* 管理员查看财务报表信息 ******************/
		if (method.endsWith("index")) {
			List<FinancialReport> finList = db.FinancialReportRead();
			session.setAttribute("finList", finList);
			response.sendRedirect("pages/manager/managerFinancial.jsp");
			return;
		}

		/******************* 添加财务报表 ******************/
		else if (method.endsWith("add")) {
			String finTodayIncome = request.getParameter("income");
			String finTodayExpend = request.getParameter("expend");
			String finDate = request.getParameter("Date");
			FinancialReport fin = new FinancialReport(null, finTodayIncome, finTodayExpend, finDate);
			boolean success = db.FinancialReportAdd(fin);
			System.out.println("新增财务报表：" + success);
			if (success)
				out.print("<script>alert('新增成功!');window.location='FinancialReportServlet?method=index';</script>");
			else
				out.print(
						"<script>alert('今日已有报表！请选择更新操作');window.location='FinancialReportServlet?method=index';</script>");
			return;
		}
		/******************* 查询 ******************/
		else if (method.endsWith("select")) {
			System.out.println("进入FinancialReportSelect");
			
			// 查询消息列表并传给页面
			request.setAttribute("finList", db.FinancialReportSelect(request.getParameter("Date")));
			// 向页面跳转(刷新页面)
			request.getRequestDispatcher("pages/manager/managerFinancial.jsp").forward(request, response);
		}
		/******************* 更新页面跳转和数据传输 ******************/
		else if (method.endsWith("updateBefore")) {
			String date = request.getParameter("num");
			System.out.println("updateBefore处理中！财务报表日期为：" + date);

			List<FinancialReport> fin = db.FinancialReportSelect(date);
			System.out.println(fin.get(0));
			session.setAttribute("updateFinList", fin.get(0));// 传到页面的实体，用于提取当前的值
			response.sendRedirect("pages/manager/managerFinancial.jsp");
			return;
		}
		/******************* 更新财务报表操作 ******************/
		else if (method.endsWith("update")) {
			System.out.println("update处理中！");
			String finId = request.getParameter("id");
			String finTodayIncome = request.getParameter("income");
			String finTodayExpend = request.getParameter("expend");
			String finDate = request.getParameter("date");
			FinancialReport finanacialreport = new FinancialReport(finId, finTodayIncome, finTodayExpend, finDate);

			boolean canUpdate = db.FinancialReportUpdate(finanacialreport);
			if (canUpdate) {// 根据登陆情况，跳转页面
				out.print("<script>alert('修改成功！');window.location='FinancialReportServlet?method=index';</script>");
			} else {
				out.print("<script>alert('修改失败！');window.location='FinancialReportServlet?method=index';</script>");
			}
			return;
		}
		/******************* 删除财务报表成功 ******************/
		else if (method.endsWith("delete")) {
			String id = request.getParameter("num");
			boolean success = db.FinancialReportDelete(id);
			if (success)
				out.print("<script>alert('删除成功!');window.location='FinancialReportServlet?method=index'</script>");
			else
				out.print("<script>alert('删除失败!');window.location='FinancialReportServlet?method=index</script>");
		}
	}

}
