<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Smart Hotel</title>
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
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<!-- 导航 -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="#">首页</a></li>
					<li><a href="pages/info/info.jsp">项目简介</a></li>

					<ul class="nav navbar-nav navbar-right">
						<li><a id="modal-269755" href="#modal-container-269754"
							role="button" class="btn" data-toggle="modal"><span
								class="glyphicon glyphicon-user"></span> 注册</a>
						<li><a id="modal-269755" href="#modal-container-269755"
							role="button" class="btn" data-toggle="modal"><span
								class="glyphicon glyphicon-log-in"></span> 登录</a>
					</ul>
				</ul>


				<!-- 幻灯片 -->
				<div class="carousel slide" id="carousel-655212">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0"
							data-target="#carousel-655212"></li>
						<li data-slide-to="1" data-target="#carousel-655212"></li>
						<li data-slide-to="2" data-target="#carousel-655212"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img alt="" src="media/image/mainPage/hotel-home-001.jpg" />
							<div class="carousel-caption">
								<h4>花园之家</h4>
								<p>怡然自得所，路迎八方客。</p>
							</div>
						</div>
						<div class="item">
							<img alt="" src="media/image/mainPage/hotel-home-002.jpg" />
							<div class="carousel-caption">
								<h4>盛情之旅</h4>
								<p>倾城一笑，醉在金怀。</p>
							</div>
						</div>
						<div class="item">
							<img alt="" src="media/image/mainPage/hotel-home-003.jpg" />
							<div class="carousel-caption">
								<h4>万客青睐</h4>
								<p>博众家之长，迎天下来客。</p>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-655212"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-655212"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>



				<!-- 房型缩略图 -->
				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="media/image/mainPage/room1-1.png" />
							<div class="caption">
								<h3>客房</h3>
								<p>高雅的豪华客房装修典雅、风格现代，充满亚洲风情。客房搭配豪华床上用品，包括舒达床垫和床架、柔软羽绒床褥、羽绒被与羽绒枕以及特制装饰床尾巾。室内全景落地玻璃窗为您带来辽阔的视野空间。客房的有线和无线高速互联网与先进室内多媒体……</p>
								<p>
									<a class="btn btn-primary" href="pages/room/room1.jsp">查看详情</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="media/image/mainPage/room2-1.jpg" />
							<div class="caption">
								<h3>行政房</h3>
								<p>入住较高楼层的行政套房，获得8层行政酒廊的专属礼遇，免费享用欧陆早餐、以及晚间鸡尾酒与开胃小菜。客房搭配豪华床上用品，包括舒达床垫和床架、柔软羽绒床褥、羽绒被与羽绒枕以及特制装饰床尾巾。房间设计新颖独特，室内全景落地玻璃窗为……</p>
								<p>
									<a class="btn btn-primary" href="pages/room/room2.jsp">查看详情</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="media/image/mainPage/room3-1.jpg" />
							<div class="caption">
								<h3>总统套房</h3>
								<p>面积336平方米的总统套房内设有一应俱全的起居厅、会客厅、两间卧室及配有厨房的用餐区，是舒逸、奢华与雅致品位的理想诠释。套房采用希尔顿订制的Serenity
									Bed，搭配豪华床上用品，包括舒达床垫和床架、柔软羽绒床褥、羽绒被与羽绒枕以及特制……</p>
								<p>
									<a class="btn btn-primary" href="pages/room/room3.jsp">查看详情</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 友情链接 -->
		<div class="friendLink">
			<div class="linkContent">
				<dl>
					<dt>
						<h4>消费者保障</h4>
					</dt>
					<dd>
						<a href="#">保障范围</a>
					</dd>
					<dd>
						<a href="#">退货退款流程</a>
					</dd>
					<dd>
						<a href="#">服务中心</a>
					</dd>
					<dd>
						<a href="#">更多特色服务</a>
					</dd>
				</dl>
			</div>
			<div class="linkContent">
				<dl>
					<dt>
						<h4>新手上路</h4>
					</dt>
					<dd>
						<a href="#">新手专区</a>
					</dd>
					<dd>
						<a href="#">消费警示</a>
					</dd>
					<dd>
						<a href="#">交易安全</a>
					</dd>
					<dd>
						<a href="#">24小时在线帮助</a>
					</dd>
					<dd>
						<a href="#">免费开店</a>
					</dd>
				</dl>
			</div>
			<div class="linkContent">
				<dl>
					<dt>
						<h4>付款方式</h4>
					</dt>
					<dd>
						<a href="#">快捷支付</a>
					</dd>
					<dd>
						<a href="#">信用卡</a>
					</dd>
					<dd>
						<a href="#">余额包</a>
					</dd>
					<dd>
						<a href="#">蜜蜂花啊</a>
					</dd>
					<dd>
						<a href="#">货到付款</a>
					</dd>
				</dl>
			</div>
			<div class="linkContent">
				<dl>
					<dt>
						<h4>酒店特色</h4>
					</dt>
					<dd>
						<a href="#">手机酒店</a>
					</dd>
					<dd>
						<a href="#">酒店信</a>
					</dd>
					<dd>
						<a href="#">大众评审</a>
					</dd>
					<dd>
						<a href="#">B格指南</a>
					</dd>
				</dl>
			</div>
		</div>


		<!-- 尾部 -->
		<div class="footer">
			<div class="footerContent">
				<ul>
					<li><a href="#">关于酒店</a></li>
					<li><a href="#">合作伙伴</a></li>
					<li><a href="#">廉正举报</a></li>
					<li><a href="#">联系客服</a></li>
					<li><a href="#">开放平台</a></li>
					<li><a href="#">诚征英才</a></li>
					<li><a href="#">联系我们</a></li>
					<li><a href="#">网站地图</a></li>
					<li><a href="#">法律声明</a></li>
					<li><a href="#">知识产权</a></li>
				</ul>
				<div style="clear: both"></div>
				<div>&copy; 2018 smartHotel_V1.0.com All Rights Reserved</div>
			</div>
		</div>

		<!-- 登录 -->
		<!--登陆窗口遮罩层-->
		<div class="modal fade" id="modal-container-269755" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h5 class="modal-title" id="myModalLabel">登录页面</h5>
					</div>
					<div class="modal-body">
						<form action="Login?method=login" method="post"
							class="form-horizontal" role="form">
							<div style="text-align: center" class="form-group">
								<label for="adminName" class="col-sm-3 control-label">用户名</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="adminName"
										name="adminName" />
								</div>
							</div>
							<div style="text-align: center" class="form-group">
								<label for="adminPassword" class="col-sm-3 control-label">密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="password"
										name="password" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-7">
									<div class="checkbox">
										<label><input type="checkbox" />记住我</label>
									</div>
								</div>


								<div class="col-sm-offset-3 col-sm-7" style="margin-top: 15px;">
									<button type="submit" class="btn btn-default">Sign in</button>

								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- 注册 -->
		<!--注册窗口遮罩层，两个遮罩层结构一样，需要改注册的操作-->
		<div class="modal fade" id="modal-container-269754" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h5 class="modal-title" id="myModalLabel">注册页面</h5>
					</div>
					<div class="modal-body">
						<form action="Login?method=register" method="post"
							class="form-horizontal" role="form">
							<div style="text-align: center" class="form-group">
								<label for="Name" class="col-sm-3 control-label">用户名</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="Name" name="Name" />
								</div>
							</div>
							<div style="text-align: center" class="form-group">
								<label for="pw1" class="col-sm-3 control-label">密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="pw1" name="pw1" />
								</div>
							</div>
							<div style="text-align: center" class="form-group">
								<label for="pw2" class="col-sm-3 control-label">再次输入密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="pw2" name="pw2" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-7">
									<button type="submit" class="btn btn-default">注册</button>

								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script> 
var errori ='<%=request.getParameter("error")%>';
	if (errori == 'noname') {
		alert("用户名不存在！");
	} else if (errori == 'wrongPw') {
		alert("密码错误！");
	} else if (errori == 'loginUnknowAu') {
		alert("未知权限登录!");
	}
</script>

<script>
var errRegister='<%=request.getParameter("Eregister")%>';
	if(errRegister=='Eregister'){
		alert("用户名已存在！请更改");
	}else if(errRegister=='differentPw'){
		alert("两次密码不同！");	
	}else if(errRegister=='registerSuccess'){
		alert("注册成功");
	}
</script>
</html>