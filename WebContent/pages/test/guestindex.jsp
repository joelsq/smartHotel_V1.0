<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="team.hotel.dao.GuestDao,	team.hotel.domain.Guest,	java.util.List"%>
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
<title>客人信息</title>
</head>
<body>
	<h3 class="text-center">Guest 增删查改 测试 Good Luck</h3>

	<!-- 添加客人-->
	<form action="<%=request.getContextPath()%>/GuestServlet?method=add"
		id="GuestForm" method="post">
		<!-- 输入栏 -->
		<table class="tab1">
			<tbody>
				<tr>
					<td align="justify">客人姓名</td>

					<td><input name="guestName" type="text" class="allInput"
						value="${guestName}" /></td>

					<td align="justify">手机号</td>
					<td><input name="guestPhone" type="text" class="allInput"
						value="${guestPhone}" /></td>

					<td align="justify">证件号</td>
					<td><input name="docNum" type="text" class="allInput"
						value="${docNum}" /></td>

					<td align="justify">性别</td>
					<td><input name="gender" type="text" class="allInput"
						value="${gender}" /></td>

					<td align="justify">
						<button type="submit" class="tabSub" value="add">添加</button>
				</tr>
			</tbody>
		</table>
	</form>


	<!-- 查询客人-->
	<form action="<%=request.getContextPath()%>/GuestServlet?method=select"
		id="RoomForm" method="post">
		<!-- 查询输入栏 -->
		<table class="tab2">
			<tbody>
				<tr>
					<td align="justify">客人姓名</td>
					<td><input name="guestName" type="text" class="allInput"
						value="${guestName}" /></td>

					<td align="justify">手机号</td>
					<td><input name="phoneNum" type="text" class="allInput"
						value="${phoneNum}" /></td>

					<td align="justify">证件号</td>
					<td><input name="docNum" type="text" class="allInput"
						value="${docNum}" /></td>

					<td align="justify">性别</td>
					<td><input name="gender" type="text" class="allInput"
						value="${gender}" /></td>

					<td align="justify">
						<button type="submit" class="tabSub" value="select">查询</button>
				</tr>
			</tbody>
		</table>
	</form>

	<!-- 所有客人信息 -->
	<table border="1px">
		<tr>
			<th>序号</th>
			<th>客人编号</th>
			<th>客人姓名</th>
			<th>手机号</th>
			<th>证件号</th>
			<th>性别</th>
		</tr>
		<c:forEach items="${guestlist}" var="data" varStatus="status">
			<tr>
				<td>${status.index+1}</td>
				<td>${data.getGuestId()}</td>
				<td>${data.getGuestName()}</td>
				<td>${data.getGuestPhone()}</td>
				<td>${data.getGuestDocumentNum()}</td>
				<td>${data.getGuestGender()}</td>
				<td><a
					href="GuestServlet?method=detail&num=${data.getGuestId()}">详细</a> <a
					href="GuestServlet?method=updateBefore&num=${data.getGuestId()}">更新</a>
					<a href="GuestServlet?method=delete&num=${data.getGuestId()}"
					onclick="javascript:return confirm('确认删除吗？');">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>