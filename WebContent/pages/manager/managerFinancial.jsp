<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/media/css/manager.css">
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>财务信息管理</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="page-header">
					<h1>酒店经理管理</h1>
				</div>
				<ul class="nav">
					<li><a href="pages/manager/managerHome.jsp"
						onmouseover="this.style.color='#000';"
						onmouseout="this.style.color='#fff';" style="color: #fff">客房标准管理</a>
					</li>
					<li><a href="pages/manager/managerInfo.jsp"
						onmouseover="this.style.color='#000';"
						onmouseout="this.style.color='#fff';" style="color: #fff">酒店信息管理</a></li>
					<li><a href="pages/manager/managerFinancial.jsp"
						onmouseover="this.style.color='#000';"
						onmouseout="this.style.color='#fff';" style="color: #fff">财务信息</a></li>
					<li><a href="pages/manager/managerUser.jsp"
						onmouseover="this.style.color='#000';"
						onmouseout="this.style.color='#fff';" style="color: #fff">用户管理</a></li>
				</ul>
				<div class="list-group">
					<div class="panel-group" id="panel-财务管理">
						<div class="panel panel-Fin">
							<div class="panel-heading">
								<a class="panel-title list-group-item collapsed active"
									data-toggle="collapse" data-parent="#panel-Fin"
									href="#panel-element-Finadd">增加财务报表</a>
							</div>
							<!-- 新增财务报表 -->
							<div id="panel-element-Finadd" class="panel-collapse collapse">
								<form
									action="<%=request.getContextPath()%>/FinancialReportServlet?method=add"
									id="FinaddForm" method="post">
									<!-- 输入栏 -->
									<div class="list-group-item">
										收入<input name="income" type="text" class="allInput"
											value="${income}" />
									</div>
									<div class="list-group-item">
										支出<input name="expend" type="text" class="allInput"
											value="${expend}" />
									</div>

									<div class="list-group-item">
										日期<input name="Date" type="date" class="allInput"
											value="${Date}" />
									</div>
									<div class="list-group-item">
										<button type="reset" class="tabSub" value="reset"
											style="margin-left: 180px;">重置</button>
										<button type="submit" class="tabSub" value="add">新增</button>
									</div>
								</form>
							</div>
						</div>

						<!-- 查询功能 -->
						<div class="panel panel-finSelect">
							<div class="panel-heading">
								<a class="panel-title list-group-item collapsed active"
									data-toggle="collapse" data-parent="#panel-Fin"
									href="#panel-element-finSelect">查询财务报表</a>
							</div>
							<!-- 查询用户 -->
							<div id="panel-element-finSelect"
								class="panel-collapse collapse">
								<form
									action="<%=request.getContextPath()%>/FinancialReportServlet?method=select"
									id="FinForm2" method="post">
									<!-- 输入栏 -->
									<div class="list-group-item">
										日期<input name="Date" type="date" class="allInput"
											value="${Date}" />
									</div>
									<div class="list-group-item">
										<button type="reset" class="tabSub" value="reset"
											style="margin-left: 180px;">重置</button>
										<button type="submit" class="tabSub" value="select">查询</button>
									</div>
								</form>
							</div>
						</div>

						<!-- 更新功能 -->
						<div class="panel panel-finUpdate">
							<div class="panel-heading">
								<a class="panel-title list-group-item collapsed active"
									data-toggle="collapse" data-parent="#panel-Fin"
									href="#panel-element-8">更新用户信息</a>
							</div>
							<!-- 更新用户-->
							<div id="panel-element-8" class="panel-collapse collapse in">
								<form action="FinancialReportServlet?method=update" method="post">
									<!-- 输入栏 -->
									<div class="list-group-item">
										报表编号（只读）<input readonly name="id" 
											value="${updateFinList.getFinId()}">
									</div>
									<div class="list-group-item">
										收入<input name="income" type="income"
											value="${updateFinList.getFinTodayIncome() }">
									</div>
									<div class="list-group-item">
										支出<input name="expend" value="${updateFinList.getFinTodayExpend() }">
									</div>
									<div class="list-group-item">
										日期（只读）<input readonly name="date"
											value="${updateFinList.getFinDate() }">
									</div>
									<div class="list-group-item">
										<button type="submit" class="tabSub" value="update"
											style="margin-left: 280px;">更新</button>
									</div>
								</form>
							</div>
						</div>
						<!-- 下方的表格 -->
						<table class="table">
							<thead>
								<tr class="success">
									<th>序号</th>
									<th>报表编号</th>
									<th>收入</th>
									<th>支出</th>
									<th>日期</th>
									<th>操作</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${finList}" var="data" varStatus="status">
									<tr>
										<td>${status.index+1}</td>
										<td>${data.getFinId()}</td>
										<td>${data.getFinTodayIncome() }</td>
										<td>${data.getFinTodayExpend()}</td>
										<td>${data.getFinDate()}</td>
										<td><a
											href="<%=request.getContextPath()%>/FinancialReportServlet?method=updateBefore&num=${data.getFinDate()}"
											class="btn"> 修改</a> <a
											href="<%=request.getContextPath()%>/FinancialReportServlet?method=delete&num=${data.getFinId()}"
											onclick="javascript:return confirm('确认删除吗？');">删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>