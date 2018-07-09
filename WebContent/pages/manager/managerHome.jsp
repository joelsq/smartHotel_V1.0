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
<title>酒店</title>
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
                    <li><a href="pages/manager/managerHome.jsp" onmouseover="this.style.color='#000';" onmouseout="this.style.color='#fff';"  style="color:#fff">客房标准管理</a>
                    </li>
                    <li><a href="pages/manager/managerInfo.jsp" onmouseover="this.style.color='#000';" onmouseout="this.style.color='#fff';"  style="color:#fff">酒店信息管理</a></li>
                    <li><a href="pages/manager/managerFinancial.jsp" onmouseover="this.style.color='#000';" onmouseout="this.style.color='#fff';"  style="color:#fff">财务信息</a></li>
                    <li><a href="pages/manager/managerUser.jsp"  onmouseover="this.style.color='#000';" onmouseout="this.style.color='#fff';" style="color:#fff">用户管理</a></li>
                </ul>
				<div class="list-group">
					<div class="panel-group" id="panel-177841">

						<!-- 增加功能 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title list-group-item collapsed active"
									data-toggle="collapse" data-parent="#panel-177841"
									href="#panel-element-45716">增加客房信息</a>
							</div>
							<!-- 新增房间 -->
							<div id="panel-element-45716"
								class="panel-collapse collapse">
								<form
									action="<%=request.getContextPath()%>/RoomServlet?method=add"
									id="RoomForm" method="post">
									<!-- 输入栏 -->
									<div class="list-group-item">
										房间编号<input name="roomNum" type="text" class="allInput"
											value="${roomNum}" />
									</div>
									<div class="list-group-item">
										房间类型<input name="roomType" type="text" class="allInput"
											value="${roomType}" />
									</div>
									<div class="list-group-item">
										房间可容纳人数<input name="roomMaxnumOfPeople" type="text"
											class="allInput" value="${roomMaxnumOfPeople}" />
									</div>
									<div class="list-group-item">
										面积<input name="roomArea" type="text" class="allInput"
											value="${roomArea}" />
									</div>
									<div class="list-group-item">
										价格<input name="roomPrice" type="text" class="allInput"
											value="${roomPrice}" />
									</div>
									<div class="list-group-item">
										<button type="submit" class="tabSub" value="add">新增</button>
									</div>
								</form>
							</div>
						</div>

						<!-- 查询功能 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title list-group-item collapsed active"
									data-toggle="collapse" data-parent="#panel-177841"
									href="#panel-element-45717">查询客房信息</a>
							</div>
							<!-- 查询房间 -->
							<div id="panel-element-45717"
								class="panel-collapse collapse">
								<form
									action="<%=request.getContextPath()%>/RoomServlet?method=select"
									id="RoomForm" method="post">
									<!-- 输入栏 -->
									<div class="list-group-item">
										房间编号<input name="roomNum" type="text" class="allInput"
											value="${roomNum}" />
									</div>
									<div class="list-group-item">
										房间类型<input name="roomType" type="text" class="allInput"
											value="${roomType}" />
									</div>
									<div class="list-group-item">
										房间可容纳人数<input name="roomMaxnumOfPeople" type="text"
											class="allInput" value="${roomMaxnumOfPeople}" />
									</div>
									<div class="list-group-item">
										是否入住<input name="roomIsStay" type="text" class="allInput"
											value="${roomIsStay}" />
									</div>
									<div class="list-group-item">
										<button type="submit" class="tabSub btn1" value="select">查询</button>
									</div>
								</form>
							</div>
						</div>

						<!-- 更新功能 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title list-group-item collapsed active"
									data-toggle="collapse" data-parent="#panel-177841"
									href="#panel-element-45718">更新客房信息</a>
							</div>
							<!-- 更新房间 -->
							<div id="panel-element-45718"
								class="panel-collapse collapse in">
								<form action="RoomServlet?method=update" method="post">
									<!-- 输入栏 -->
									<div class="list-group-item">
										房间编号<input readonly name="roomNum"
											value="${updateRoom.getRoomNum()}">
									</div>
									<div class="list-group-item">
										房间类型<input name="roomType"
											value="${updateRoom.getRoomType() }">
									</div>
									<div class="list-group-item">
										面积<input name="roomArea"
											value="${updateRoom.getRoomArea() }">
									</div>
									<div class="list-group-item">
										最大容纳人数<input name="roomMaxnumOfPeople"
											value="${updateRoom.getRoomMaxnumOfPeople() }">
									</div>
									<div class="list-group-item">
										价格<input name="roomPrice"
											value="${updateRoom.getRoomPrice()}">
									</div>
									<div class="list-group-item">
										空调<input type="checkbox" name="checkbox1"
											value="${updateRoom.getRoomAircondition()}"> 电视<input
											type="checkbox" name="checkbox2"
											value="${updateRoom.getRoomTV()}"> Wifi<input
											type="checkbox" name="checkbox3"
											value="${updateRoom.getRoomWifi()}"> 浴室<input
											type="checkbox" name="checkbox4"
											value="${updateRoom.getRoomWashroom()}">
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
									<th>房间编号</th>
									<th>类型</th>
									<th>可容纳人数</th>
									<th>是否入住</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${roomlist}" var="data"
									varStatus="status">
									<tr>
										<td>${status.index+1}</td>
										<td>${data.getRoomNum()}</td>
										<td>${data.getRoomType()}</td>
										<td>${data.getRoomMaxnumOfPeople()}</td>
										<td>${data.getRoomIsStay()}</td>
										<td><a
											href="<%=request.getContextPath()%>/RoomServlet?method=detail&num=${data.getRoomNum()}">详细</a>
											<a
											href="<%=request.getContextPath()%>/RoomServlet?method=updateBefore&num=${data.getRoomNum()}"
											class="btn"> 修改</a> <a
											href="<%=request.getContextPath()%>/RoomServlet?method=delete&num=${data.getRoomNum()}"
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
	</div>
</body>
<script>
$(document).ready(function(){
	$(.btn41).click(function(){
		
	})
});
</script>
</html>