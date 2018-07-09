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
<title>客服管理</title>
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
				<ul class="nav">
					<li><a href="pages/user/userHome.jsp"
						onmouseover="this.style.color='#000';"
						onmouseout="this.style.color='#fff';" style="color: #fff">入住登记信息管理</a>
					</li>
					<li><a href="pages/user/userSettlement.jsp"
						onmouseover="this.style.color='#000';"
						onmouseout="this.style.color='#fff';" style="color: #fff">结算信息管理</a></li>
				</ul>
				<div class="list-group">
					<div class="panel-group" id="panel-UserHome">

						<div class="panel panel-UserHome">
							<div class="panel-heading">
								<a class="panel-title list-group-item collapsed active"
									data-toggle="collapse" data-parent="#panel-UserHome"
									href="#panel-element-checkin">增加入住信息</a>
							</div>
							<!-- 新增入住信息 -->
							<div id="panel-element-checkin" class="panel-collapse collapse">
								<form
									action="<%=request.getContextPath()%>/CheckListServlet?method=add"
									id="CheckinForm1" method="post">
									<!-- 输入栏 -->
									<div class="list-group-item">
										客人姓名<input name="guestName" type="text" class="allInput"
											value="${guestName}" />
									</div>
									<div class="list-group-item">
										手机号<input name="guestPhone" type="text" class="allInput"
											value="${guestPhone}" />
									</div>
									<div class="list-group-item">
										房间编号<input name="roomId" type="text" class="allInput"
											value="${roomId}" />
									</div>
									<div class="list-group-item">
										所选的餐饮标准<input name="checkMealType" type="text"
											class="allInput" value="${userArea}" />
									</div>
									<div class="list-group-item">
										入住时间<input name="checkInDate" type="date" class="allInput"
											value="${checkInDate}" />
									</div>
									<div class="list-group-item">
										<button type="submit" class="tabSub" value="add">新增</button>
									</div>
								</form>
							</div>
						</div>

						<!-- 查询功能 -->
						<div class="panel panel-select">
							<div class="panel-heading">
								<a class="panel-title list-group-item collapsed active"
									data-toggle="collapse" data-parent="#panel-UserHome"
									href="#panel-element-select">查询入住信息</a>
							</div>
							<!-- 查询房间 -->
							<div id="panel-element-select" class="panel-collapse collapse">
								<form
									action="<%=request.getContextPath()%>/CheckListServlet?method=select"
									id="CheckForm2" method="post">
									<!-- 输入栏 -->
									<div class="list-group-item">
										客人姓名<input name="guestName" type="text" class="allInput"
											value="${guestName}" />
									</div>
									<div class="list-group-item">
										手机号<input name="guestPhone" type="text" class="allInput"
											value="${guestPhone}" />
									</div>
									<div class="list-group-item">
										房间编号<input name="roomNum" type="text" class="allInput"
											value="${roomNum}" />
									</div>
									<div class="list-group-item">
										入住时间<input name="checkInDate" type="date" class="allInput"
											value="${checkInDate}" />
									</div>
									<div class="list-group-item">
										餐饮类型<input name="checkMealType" type="text" class="allInput"
											value="${checkMealType}" />
									</div>
									<div class="list-group-item">
									
										<button type="submit" class="tabSub" value="select">查询</button>
									</div>
								</form>
							</div>
						</div>

						<!-- 更新功能 -->
						<div class="panel panel-update">
							<div class="panel-heading">
								<a class="panel-title list-group-item collapsed active"
									data-toggle="collapse" data-parent="#panel-UserHome"
									href="#panel-element-update">更新入住信息</a>
							</div>
							<!-- 更新房间 -->
							<div id="panel-element-update" class="panel-collapse collapse in">
								<form action="CheckListServlet?method=update" method="post">
									<!-- 输入栏 -->
									<div class="list-group-item">
										客人姓名<input name="guestName" type="text" class="allInput"
											value="${guestName}" />
									</div>
									<div class="list-group-item">
										手机号<input name="guestPhone" type="text" class="allInput"
											value="${guestPhone}" />
									</div>
									<div class="list-group-item">
										房间编号<input name="roomNum" type="text" class="allInput"
											value="${roomNum}" />
									</div>
									<div class="list-group-item">
										入住时间<input name="checkInDate" type="date" class="allInput"
											value="${checkInDate}" />
									</div>
									<div class="list-group-item">
										餐饮类型<input name="checkMealType" type="text" class="allInput"
											value="${checkMealType}" />
									</div>
									<div class="list-group-item">
										入住时间<input name="checkOutDate" type="date" class="allInput"
											value="${checkOutDate}" />
									</div>
									<div class="list-group-item">
										<button type="submit" class="tabSub" value="update">更新</button>
									</div>
								</form>
							</div>
						</div>

						<table class="table">
							<thead>
								<tr class="success">
									<th>序号</th>
									<th>客人姓名</th>
									<th>手机号</th>
									<th>房间编号</th>
									<th>入住时间</th>
									<th>退房时间</th>
									<th>所选的餐饮标准</th>
									<th></th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${checklist}" var="data" varStatus="status">
									<tr>
										<td>${status.index+1}</td>
										<td>${data.getGuestName()}</td>
										<td>${data.getGuestPhone()}</td>
										<td>${data.getRoomNum()}</td>
										<td>${data.getCheckInDate()}</td>
										<td>${data.getCheckOutDate()}</td>
										<td>${data.getCheckMealType()}</td>
										<td><a
											href="<%=request.getContextPath()%>/CheckListServlet?method=updateBefore&num=${data.getChecklistId()}"
											class="btn"> 修改</a> <a
											href="<%=request.getContextPath()%>/CheckListServlet?method=delete&num=${data.getChecklistId()}"
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