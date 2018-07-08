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
	href="${pageContext.request.contextPath }/media/css/mainPageStyle.css">
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
<title>入住表操作</title>
</head>
<body>
	<h3 class="text-center">checklist 增删查改 测试 Good Luck</h3>
	<!-- 新增入住表 -->
	<form
		action="<%=request.getContextPath()%>/CheckListServlet?method=add"
		id="CheckListForm" method="post">
		<!-- 输入栏 -->
		<table class="tab1">
			<tbody>
				<tr>
					<th align="justify">入住客人编号</th>
					<td><input name="checkguestid" type="text" class="allInput"
						value="${checkguestid}" /></td>
					<th align="justify">房间号</th>
					<td><input name="checkRoomid" type="text" class="allInput"
						value="${checkRoomid}" /></td>

					<th align="justify">入住时间</th>
					<td><input name="checkinDate" type="date" class="allInput"
						value="${checkinDate}" /></td>

					<th align="justify">入住天数</th>
					<td><input name="checkDays" type="text" class="allInput"
						value="${checkDays}" /></td>

					<th align="justify">退房时间</th>
					<td><input name="checkoutDate" type="date" class="allInput"
						value="${checkoutDate}" /></td>

					<th align="justify">餐饮类型</th>
					<td><input name="checkMealType" type="text" class="allInput"
						value="${checkMealType}" /></td>

					<th align="justify">入住人数</th>
					<td><input name="checkNumOfPeople" type="text"
						class="allInput" value="${checkNumOfPeople}" /></td>

					<td align="justify">
						<button type="submit" class="tabSub" value="add">新增</button>
				</tr>
			</tbody>
		</table>
	</form>


	<!-- 查询房间 -->
	<h3>所有房间</h3>

	<!-- 房间查询 -->
	<form
		action="<%=request.getContextPath()%>/CheckListServlet?method=select"
		id="CheckListForm" method="post">
		<!-- 查询输入栏 -->
		<table class="tab2">
			<tbody>
				<tr>
					<td align="justify">入住客人编号</td>
					<td><input name="guestId" type="text" class="allInput"
						value="${guestId}" /></td>

					<td align="justify">入住客人姓名</td>
					<td><input name="guestName" type="text" class="allInput"
						value="${guestName}" /></td>

					<td align="justify">电话</td>
					<td><input name="phone" type="text" class="allInput"
						value="${phone}" /></td>

					<td align="justify">房间号</td>
					<td><input name="roomid" type="text" class="allInput"
						value="${roomid}" /></td>

					<td align="justify">入住时间</td>
					<td><input name="checkinDate" type="date" class="allInput"
						value="${checkinDate}" /></td>

					<td align="justify">退房时间</td>
					<td><input name="checkoutDate" type="date" class="allInput"
						value="${checkoutDate}" /></td>

					<td align="justify">
						<button type="submit" class="tabSub" value="select">查询</button>
				</tr>
			</tbody>
		</table>
	</form>

	<table border="1px">
		<tr>
			<th>序号</th>

			<th>入住客人编号</th>
			<th>房间号</th>
			<th>入住时间</th>
			<th>入住天数</th>
			<th>退房时间</th>
			<th>餐饮类型</th>
			<th>入住人数</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${checklist}" var="data" varStatus="status">
			<tr>
				<td>${status.index+1}</td>

				<td>${data.getGuestId()}</td>
				<td>${data.getRoomId()}</td>
				<td>${data.getCheckInDate()}</td>
				<td>${data.getCheckDays()}</td>
				<td>${data.getCheckOutDate()}</td>
				<td>${data.getCheckMealType()}</td>
				<td>${data.getCheckNumOfPeople()}</td>
				<td><a href=#>详细</a> <a
					href="CheckListServlet?method=updateBefore&num=${data.getChecklistId()}">更新</a>
					<a
					href="CheckListServlet?method=delete&num=${data.getChecklistId()}"
					onclick="javascript:return confirm('确认删除吗？');">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>