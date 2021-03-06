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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客房详情</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css" href="../../media/css/room.css">
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

<base href="<%=basePath%>">
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column nav"></div>
		</div>
		<div class="row clearfix">
			<div class="col-md-8 column">
				<div class="carousel slide" id="carousel-590534">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0"
							data-target="#carousel-590534"></li>
						<li data-slide-to="1" data-target="#carousel-590534"></li>
						<li data-slide-to="2" data-target="#carousel-590534"></li>
						<li data-slide-to="3" data-target="#carousel-590534"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img alt=""
								src="${pageContext.request.contextPath }/media/image/room/room1/room1-1.jpg" />
						</div>
						<div class="item">
							<img alt=""
								src="${pageContext.request.contextPath }/media/image/room/room1/room1-2.jpg" />
						</div>
						<div class="item">
							<img alt=""
								src="${pageContext.request.contextPath }/media/image/room/room1/room1-3.jpg" />
						</div>
						<div class="item">
							<img alt=""
								src="${pageContext.request.contextPath }/media/image/room/room1/room1-4.jpg" />
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-590534"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-590534"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
			<div class="col-md-4 column">
				<h2>客房</h2>
				<p class="roomText">
					高雅的豪华客房装修典雅、风格现代，充满亚洲风情。客房搭配豪华床上用品，包括舒达床垫和床架、柔软羽绒床褥、羽绒被与羽绒枕以及特制装饰床尾巾。室内全景落地玻璃窗为您带来辽阔的视野空间。客房的有线和无线高速互联网与先进室内多媒体技术，使您生活工作更加轻松便利。浴室设施齐全。
				</p>
				<div class="order">
					<div class="order_item">
						<span>客房（大床）</span>
						<button class="button1">立即预订</button>
					</div>
					<div>
						<span>客房（双床）</span>
						<button class="button2">立即预订</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>