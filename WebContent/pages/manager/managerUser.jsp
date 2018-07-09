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
<title>用户管理</title>
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
					<div class="panel-group" id="panel-1">

						<!-- 增加功能 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title list-group-item collapsed active"
									data-toggle="collapse" data-parent="#panel-177841"
									href="#panel-element-useradd">增加用戶信息</a>
							</div>
							<!-- 新增用戶 -->
							<div id="panel-element-useradd"
								class="panel-collapse collapse">
								<form
									action="<%=request.getContextPath()%>/UserServlet?method=add"
									id="UserForm" method="post">
									<!-- 输入栏 -->
									<div class="list-group-item">
										用戶名<input name="userName" type="text" class="allInput"
											value="${userName}" />
									</div>
									<div class="list-group-item">
										密码<input name="password" type="text" class="allInput"
											value="${password}" />
									</div>
									
									<div class="list-group-item">
										权限<input name="authority" type="text"
											class="allInput" value="${authority}" />
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
									href="#panel-element-userselect">查询用户信息</a>
							</div>
							<!-- 查询用户 -->
							<div id="panel-element-userselect"
								class="panel-collapse collapse">
								<form
									action="<%=request.getContextPath()%>/UserServlet?method=select"
									id="UserForm" method="post">
									<!-- 输入栏 -->
									
									<div class="list-group-item">
										用户名<input name="userName" type="text" class="allInput"
											value="${userName}" />
									</div>
									
									<div class="list-group-item">
										权限<input name="authority" type="text" class="allInput"
											value="${authority}" />
									</div>
									<div class="list-group-item">
										<button type="submit" class="tabSub" value="select">查询</button>
									</div>
								</form>
							</div>
						</div>

						<!-- 更新功能 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title list-group-item collapsed active"
									data-toggle="collapse" data-parent="#panel-177841"
									href="#panel-element-8">更新用户信息</a>
							</div>
							<!-- 更新用户-->
							<div id="panel-element-8"
								class="panel-collapse collapse in">
								<form action="UserServlet?method=update" method="post">
									<!-- 输入栏 -->
									<div class="list-group-item">
										用户名<input readonly name="userName"
											value="${updateUser.getUserName()}">
									</div>
									<div class="list-group-item">
										密码<input name="password"
											value="${updateUser.getPassword() }">
									</div>
									<div class="list-group-item">
										积分<input name="credits"
											value="${updateUser.getCredits() }">
									</div>
									<div class="list-group-item">
										权限<input name="authority"
											value="${updateUser.getAuthority() }">
									</div>
									
									<div class="list-group-item">
										<button type="submit" class="tabSub" value="update">更新</button>
									</div>
								</form>
							</div>
						</div>
						<!-- 下方的表格 -->
						<table class="table">
							<thead>
								<tr class="success">
									<th>序号</th>
									<th>用户ID</th>
									<th>用户名</th>
									<th>密码</th>
									<th>积分</th>
									<th>权限</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userlist}" var="data"
									varStatus="status">
									<tr>
										<td>${status.index+1}</td>
										<td>${data.getUserId()}</td>
										<td>${data.getUserName()}</td>
										<td>${data.getPassword()}</td>
										<td>${data.getCredits()}</td>
										<td>${data.getAuthority()}</td>
										<td><a
											href="<%=request.getContextPath()%>/UserServlet?method=detail&num=${data.getUserName()}">详细</a>
											<a
											href="<%=request.getContextPath()%>/UserServlet?method=updateBefore&num=${data.getUserName()}"
											class="btn"> 修改</a> <a
											href="<%=request.getContextPath()%>/UserServlet?method=delete&num=${data.getUserName()}"
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