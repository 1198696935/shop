<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.contextPath}/">

<title>商城首页</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/banner.css" />
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/banner.js"></script>
<script type="text/javascript">
	$(function() {
		$(".banner").banner({});
	})
</script>
<style>
#search:after {
	content: "";
	clear: both;
	display: table
}

#search {
	width: auto;
	float: right;
	margin-right: 30px;
	height: 70px;
}

#searchInput {
	width: 250px;
	height: 40px;
	padding-left: 15px;
	border-top-left-radius: 42px;
	border-bottom-left-radius: 42px;
	border: 1px solid #00a1d6;
	outline: none;
	position: relative;
	transition: .3s linear;
}

#searchInput:focus {
	width: 300px;
}

#searchBtn {
	width: 52px;
	height: 43px;
	margin-left: -4px;
	background: #00a1d6;
	border: 0;
}

#searchBtn:hover {
	background: #fb7299;
}
</style>
</head>
<body>
	<div class="top-nav">
		<div class="wrap clearfix">
			<div class="fl clearfix nav-about">
				<span>妈妈网 </span> <span class="sp">|</span> <span>客服热线：18818429757</span>
			</div>
			<div class="login-info fr clearfix">
				<div class="not-login clearfix">
					<span class="username show_qr"> <c:choose>
							<c:when test="${user!=null}"> 您好，${user.username} 
							<i class="icon-down"></i></span> <span> <a href="user/logout"
						title="退出">退出</a>
					</span> <span class="sp">|</span> <span class="my-order show_qr"> <a
						href="user/personal">个人中心<i class="icon-down"></i></a>
					</span>  
					</c:when>
					<c:otherwise>
						<span>Hi,欢迎来到妈妈网 !</span>
						<span class="sp">|</span>
						<span><a href="user/userLogin" title="登录">登录</a></span>
						<span class="sp">|</span>
						<span><a href="user/register" class="reg">免费注册</a></span>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<div class="logo-cart-box">
		<div class="wrap clearfix">
			<a class="logo fl"> <img src="img/icon/logo.png" width="152"
				height="65">
			</a>

			<div class="safety-cart fr clearfix">
				<div id="search">
					<input id="searchInput" type="text" placeholder="搜索从这里开始...">
					<button id="searchBtn">
						<i id="searchIcon" class="layui-icon" style="color: white">&#xe615;</i>
					</button>
				</div>
			</div>
		</div>
		<div class="main-nav">
			<div class="main-nav-wrap">
				<ul class="nav-list">
					<li class="nav-item dropdown-box clearfix"><span
						class="icon-category"></span> <a href="javascript://"
						class="dropdown-toggle nav-url" data-toggle="dropdown">商品分类</a> <span
						class="icon-arrow-down"></span>
						<ul class="dropdown-menu" role="menu">
							<li data-submenu-id="submenu-0">
								<div class="hd">
									<span class="icon-right"></span> <a
										href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=397"
										target="_blank">喂养用品</a>
								</div>
								<div id="submenu-0" class="popover">
									<div class="link-list">
										<a href="item/tid?tid=3" target="_Self" class="link-item">
											<p class="title">奶粉</p>
										</a>
									</div>
								</div>
							</li>
							<li data-submenu-id="submenu-1">
								<div class="hd">
									<span class="icon-right"></span> <a href="item/tid?tid=6">尿裤湿巾</a>
								</div>
								<div id="submenu-1" class="popover">
									<div class="link-list">
									<a class="link-item" href="item/tid?tid=6">					
											<p class="title">婴儿尿裤</p>
										</a> <a class="link-item">
										
											<p class="title">婴儿湿巾</p>
										</a>
										<a class="link-item">
											<p class="title">拉拉裤</p>
										</a>
									</div>
								</div>
								
								
							</li>
							<li data-submenu-id="submenu-2">
								<div class="hd">
									<span class="icon-right"></span> <a
										href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=37"
										target="_blank">洗护用品</a>
								</div>
								<div id="submenu-2" class="popover">
									<div class="link-list">
										<a  class="link-item">
											<p class="title">宝宝护肤</p>
										</a>
										<a  class="link-item">
											<p class="title">洗发沐浴</p>
										</a>
										<a  class="link-item">
											<p class="title">奶瓶清洗</p>
										</a>
										<a  class="link-item">
											<p class="title">驱蚊防晒</p>
										</a>
										<a href="item/tid?tid=14" class="link-item">
											<p class="title">洗澡用具</p>
										</a>
											<a  class="link-item">
											<p class="title">口腔清洁</p>
										</a>
									</div>
								</div>
							</li>
						</ul></li>
					<li class="nav-item"><a class="nav-url" href="user/home">首页</a></li>
				</ul>
			</div>
		</div>

		<!--轮播图 -->
		<div id="banner" class="banner">
			<ul class="banner_box">
				<c:forEach items="${newsList}" var="news">
					<li style="opacity: 1; filter: alpha(opacity = 100);"><a
						href="news/newsShow?nid=${news.nid}"
						style="background: url(${news.picture}) center top no-repeat"></a></li>
				</c:forEach>

			</ul>
		</div>
		<br>
		<br>
		<div
			class="  act-block act-pdb act-fl-common act-fl-2 act-fl-good4_1 ">
			<div class="wrap">
				<div class="block-title act-mrb">
					<img class="lazy loaded"
						data-src="https://cdn.xiaoshuxiong.com//images/201610/activity/5816e6eab92bf.jpg"
						src="https://cdn.xiaoshuxiong.com//images/201610/activity/5816e6eab92bf.jpg"
						style="display: block;">
				</div>
			</div>
		</div>
		<br><br>
		<div class="wrap">
			<c:forEach items="${detailList}" var="detail">
				<ul class="category-list clearfix mb-25">
					<li class="mod-item"><a
						href="item/selectIid?iid=${detail.iid}"
						class="goods-pic-title mb-10" target="_blank">
							<div class="pic-holder mb-10">
								<img src="${detail.picture}" title="" width="233" height="233">
							</div>
							<p class="goods-title">${detail.title}</p>
					</a>
						<div class="price clearfix mb-10">
							<span class="shop-price">${detail.price}</span>
						</div> </li>
			</c:forEach>
			</ul>
		</div>

		<div class="footer">
			<div class="wrap">
				<ul class="safety clearfix">
					<li class="item clearfix"><span class="ico"></span> <span
						class="txt">正品保障</span></li>
					<li class="item item-2 clearfix"><span class="ico"></span> <span
						class="txt">现货直达</span></li>
					<li class="item item-3 clearfix"><span class="ico"></span> <span
						class="txt">官方授权</span></li>
					<li class="item item-4 clearfix"><span class="ico"></span> <span
						class="txt">七天包退</span></li>
				</ul>

				<div class="copyright">
					<a class="kx-logo" tabindex="-1" id="urlknet" target="_blank"
						rel="nofollow"><img src="img/icon/kxlogo.gif" title="可信网站"></a>
					<p>100+网站版权所有 © 2018-2018 客服热线:18818429757</p>
				</div>
			</div>
		</div>

		<div class="fixed-side">
			<div class="inside">
				<div class="cart-wraper">
					<div class="icon-cart"></div>
					<p class="txt">
						<span><br>购<br>物<br>车 </span>
					</p>
					</a>
				</div>
				<a id="to_top"> <span class="icon-top"></span> <span
					class="text">TOP</span>
				</a>
			</div>
		</div>
		<script src="js/jquery.menu-aim.js"></script>
		<script src="js/common_pc.js"></script>
		<script src="js/h.js" type="text/javascript"></script>
		<script>
			$("#searchBtn").click(function() {
				var title = $("#searchInput").val();
				location.href = "item/selectTitle?title=" + title;
				$("#searchInput").val("");
			});

			$(".cart-wraper").click(function() {
				var test = ${user != null}
				;
				if (test) {
					location.href = "cart/cart?uid=${user.uid}";
				} else {
					layer.alert('请先登录', {
						icon : 6
					});
				}
			});
		</script>
</body>
</html>