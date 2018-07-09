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
<title>酒店信息管理</title>
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
			</div>
		</div>
	</div>
</body>
</html>