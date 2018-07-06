<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Hotel</title>
        <!-- 新 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/media/css/mainPageStyle.css">
        <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
         
        <!-- 可选的Bootstrap主题文件（一般不使用） -->
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
         
        <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
        <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
         
        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                	<!-- 导航 -->
                    <ul class="nav nav-tabs">
                        <li class="active">
                             <a href="#">首页</a>
                        </li>
                        <li>
                             <a href="#">简介</a>
                        </li>
                        <li class="disabled">
                             <a href="#">信息</a>
                        </li>
                        
                        <ul class="nav navbar-nav navbar-right">
                          <li> <a id="modal-269755" href="#modal-container-269754" role="button" class="btn" data-toggle="modal"><span class="glyphicon glyphicon-user"></span> 注册</a>
                          <li><a id="modal-269755" href="#modal-container-269755" role="button" class="btn" data-toggle="modal"><span class="glyphicon glyphicon-log-in"></span> 登录</a>
                        </ul>
                    </ul>
                    
                    
                    <!-- 幻灯片 -->
                    <div class="carousel slide" id="carousel-655212">
						<ol class="carousel-indicators">
							<li class="active" data-slide-to="0" data-target="#carousel-655212">
							</li>
							<li data-slide-to="1" data-target="#carousel-655212">
							</li>
							<li data-slide-to="2" data-target="#carousel-655212">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img alt="" src="media/image/hotel-home-001.jpg" />
								<div class="carousel-caption">
									<h4>
										First Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="media/image/hotel-home-002.jpg" />
								<div class="carousel-caption">
									<h4>
										Second Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="media/image/hotel-home-003.jpg" />
								<div class="carousel-caption">
									<h4>
										Third Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
						</div> <a class="left carousel-control" href="#carousel-655212" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-655212" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
                </div>
            </div>
            
            <!-- 友情链接 -->
            <div class="friendLink">
				<div class="linkContent">
					<dl>
						<dt><h4>消费者保障</h4></dt>
						<dd><a href="#">保障范围</a></dd>
						<dd><a href="#">退货退款流程</a></dd>
						<dd><a href="#">服务中心</a></dd>
						<dd><a href="#">更多特色服务</a></dd>
					</dl>
				</div>
				<div class="linkContent">
					<dl>
						<dt><h4>新手上路</h4></dt>
						<dd><a href="#">新手专区</a></dd>
						<dd><a href="#">消费警示</a></dd>
						<dd><a href="#">交易安全</a></dd>
						<dd><a href="#">24小时在线帮助</a></dd>
						<dd><a href="#">免费开店</a></dd>
					</dl>
				</div>
				<div class="linkContent">
					<dl>
						<dt><h4>付款方式</h4></dt>
						<dd><a href="#">快捷支付</a></dd>
						<dd><a href="#">信用卡</a></dd>
						<dd><a href="#">余额包</a></dd>
						<dd><a href="#">蜜蜂花啊</a></dd>
						<dd><a href="#">货到付款</a></dd>
					</dl>
				</div>
				<div class="linkContent">
					<dl>
						<dt><h4>慕淘特色</h4></dt>
						<dd><a href="#">手机慕淘</a></dd>
						<dd><a href="#">慕淘信</a></dd>
						<dd><a href="#">大众评审</a></dd>
						<dd><a href="#">B格指南</a></dd>
					</dl>
				</div>
			</div>
			
			
			<!-- 尾部 -->
			<div class="footer">
				<div class="footerContent">
					<ul>
						<li><a href="#">关于慕淘</a></li>
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
					<div>&copy; 2016 imooc.com All Rights Reserved</div>
				</div>
			</div>

            <!--登陆窗口遮罩层-->
            <div class="modal fade" id="modal-container-269755" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="Login" method="post" class="form-horizontal"
                            role="form">
                            <div style="text-align: center" class="form-group">
                                <label for="adminName" class="col-sm-2 control-label">管理员姓名</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="adminName"
                                        name="adminName" />
                                </div>
                            </div>
                            <div style="text-align: center" class="form-group">
                                <label for="adminPassword" class="col-sm-2 control-label">管理员密码</label>
                                <div class="col-sm-4">
                                    <input type="password" class="form-control" id="password"
                                        name="password" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-2">
                                    <div class="checkbox">
                                        <label><input type="checkbox" />记住我</label>
                                    </div>
                                </div>


                                <div class="col-sm-offset-0 col-sm-1">
                                    <button type="submit" class="btn btn-default">Sign in</button>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <!--注册窗口遮罩层，两个遮罩层结构一样，需要改注册的操作-->
            <div class="modal fade" id="modal-container-269754" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="Login" method="post" class="form-horizontal"
                            role="form">
                            <div style="text-align: center" class="form-group">
                                <label for="adminName" class="col-sm-2 control-label">管理员姓名</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="adminName"
                                        name="adminName" />
                                </div>
                            </div>
                            <div style="text-align: center" class="form-group">
                                <label for="adminPassword" class="col-sm-2 control-label">管理员密码</label>
                                <div class="col-sm-4">
                                    <input type="password" class="form-control" id="password"
                                        name="password" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-2">
                                    <div class="checkbox">
                                        <label><input type="checkbox" />记住我</label>
                                    </div>
                                </div>


                                <div class="col-sm-offset-0 col-sm-1">
                                    <button type="submit" class="btn btn-default">注册</button>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script> 
      var errori ='<%=request.getParameter("error")%>';
        if (errori == 'yes') {
            alert("登录失败!");

        }
    </script>
</html>