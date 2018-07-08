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
<title>入住表更新</title>
<base href="<%=basePath%>">
</head>
<body>

	<h3>更新入住表信息</h3>
	<form action="<%=request.getContextPath()%>/GuestServlet?method=update"
		id="RoomForm" method="post">
		<!-- 更新输入栏 -->
		<table class="tab2">
			<tbody>
				<tr>
					<td align="justify">入住表编号</td>
					<td><input readonly name="guestName" type="text" class="allInput"
						value="${updateGuest.getGuestName()}" /></td>

					<td align="justify">手机号</td>
					<td><input name="phoneNum" type="text" class="allInput"
						value="${updateGuest.getGuestPhone()}" /></td>

					<td align="justify">证件号</td>
					<td><input name="docNum" type="text" class="allInput"
						value="${updateGuest.getGuestDocumentNum()}" /></td>

					<td align="justify">性别</td>
					<td><input name="gender" type="text" class="allInput"
						value="${updateGuest.getGuestGender()}" /></td>

					<td align="justify">
						<button type="submit" class="tabSub" value="update">更新</button>
				</tr>
			</tbody>
		</table>
	</form>

</body>
</html>