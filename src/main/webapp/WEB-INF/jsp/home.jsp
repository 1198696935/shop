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
				<span>妈妈网</a>
				</span> <span class="sp">|</span> <span>客服热线：18818429757</span>
			</div>
			<div class="login-info fr clearfix">

				<div class="not-login clearfix">
					<span class="username show_qr"> <c:choose>
							<c:when test="${user!=null}"> 您好，${user.username} 
							<i class="icon-down"></i></span> <span> <a href="/user/logout"
						title="退出">退出</a>
					</span> <span class="sp">|</span> <span class="my-order show_qr"> <a
						href="#" target="_blank">我的订单<i class="icon-down"></i></a>
					</span>  
					</c:when>
					<c:otherwise>
						<span>Hi,欢迎来到妈妈网 !</span>
						<span class="sp">|</span>
						<span><a href="/user/userLogin" title="登录">登录</a></span>
						<span class="sp">|</span>
						<span><a href="/user/register" class="reg">免费注册</a></span>
						<span class="sp">|</span>
						<span><a href="#" target="_blank">我的订单</a></span>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<div class="logo-cart-box">
		<div class="wrap clearfix">
			<a class="logo fl"> <img src="img/icon/logo.png" width="152"
				height="65" title="小树熊，妈网官方商城">
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
										target="_blank">妈妈良品</a>
								</div>
								<div id="submenu-0" class="popover">
									<div class="link-list">
										<a href="/item/tid?tid=3" target="_blank" class="link-item">
											<div class="pic-holder">
												<img src="img/item/milk.jpg" title="小树熊，妈网官方商城" width="58"
													height="58">
											</div>
											<p class="title">奶粉</p>
										</a>
									</div>
								</div>
							</li>
							<li data-submenu-id="submenu-1">
								<div class="hd">
									<span class="icon-right"></span> <a
										href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=34"
										target="_blank">喂养用品</a>
								</div>
								<div id="submenu-1" class="popover">
									<div class="link-list">
										<a
											href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=444"
											target="_blank" class="link-item">
											<div class="pic-holder">
												<img
													src="./婴装_童装_棉品_妈妈良品_妈妈良品_妈妈网官方自营母婴品牌_files/1476359444811915956.jpg"
													title="小树熊，妈网官方商城" width="58" height="58">
											</div>
											<p class="title">哺乳护理</p>
										</a>

									</div>
								</div>
							</li>
							<li data-submenu-id="submenu-2">
								<div class="hd">
									<span class="icon-right"></span> <a
										href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=37"
										target="_blank">宝宝洗护</a>
								</div>
								<div id="submenu-2" class="popover">
									<div class="link-list">
										<a href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=86"
											target="_blank" class="link-item">
											<div class="pic-holder">
												<img
													src="./婴装_童装_棉品_妈妈良品_妈妈良品_妈妈网官方自营母婴品牌_files/1495792913435787688.jpg"
													title="小树熊，妈网官方商城" width="58" height="58">
											</div>
											<p class="title">爽身/防晒</p>
										</a>
									</div>
								</div>
							</li>
						</ul></li>
					<li class="nav-item"><a class="nav-url" href="/user/home">首页</a></li>
				</ul>
			</div>
		</div>
		<!--轮播图 -->
		<div id="banner" class="banner">
			<ul class="banner_box">
				<!--  <li style="opacity: 1; filter: alpha(opacity = 100);"><a href=""
				style="background: url(img/1.jpeg) center top no-repeat"></a></li> -->
				<c:forEach items="${newsList}" var="news">
					<li style="opacity: 1; filter: alpha(opacity = 100);"><a
						href="/news/newsShow//?nid=${news.nid}"
						style="background: url(${news.picture}) center top no-repeat"></a></li>
				</c:forEach>
				<!--  <li style="opacity: 1; filter: alpha(opacity = 100);"><a href=""
				style="background: url(img/1.jpeg) center top no-repeat"></a></li> -->
			</ul>
		</div>


		<div class="wrap">
			<div class="countdown-mod-2">
				<dl class="sort-wrap">
					<span>排序</span>
					<dd class="sort-item up">

						<a
							href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=423&amp;page=1">默认</a>
					</dd>
					<dd class="sort-item">
						<a
							href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=423&amp;page=1&amp;sales=1">销量</a>
					</dd>
					<dd class="sort-item">
						<a
							href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=423&amp;page=1&amp;price=1">价格<span
							class="sort-icon"></span></a>
					</dd>
					<dd class="sort-item">
						<a
							href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=423&amp;page=1&amp;discount=1">折扣<span
							class="sort-icon"></span></a>
					</dd>
				</dl>
			</div>
			<ul class="category-list clearfix mb-25">
				<li class="mod-item"><a
					href="https://www.xiaoshuxiong.com/product.php?id=36558"
					class="goods-pic-title mb-10" target="_blank">
						<div class="pic-holder mb-10">
							<img
								src="./婴装_童装_棉品_妈妈良品_妈妈良品_妈妈网官方自营母婴品牌_files/0_thumb_P_1518167708251.jpg"
								title="" width="233" height="233">
						</div>
						<p class="goods-title">妈妈良品 婴幼儿纱布印口水兜28cm*23cm 两条装</p>
				</a>
					<div class="price clearfix mb-10">
						<span class="shop-price">￥29</span>
					</div> <img
					src="./婴装_童装_棉品_妈妈良品_妈妈良品_妈妈网官方自营母婴品牌_files/1518837093965010846.png"
					title="" width="50" height="56" class="hanging "></li>
				<li class="mod-item"><a
					href="https://www.xiaoshuxiong.com/product.php?id=36557"
					class="goods-pic-title mb-10" target="_blank">
						<div class="pic-holder mb-10">
							<img
								src="./婴装_童装_棉品_妈妈良品_妈妈良品_妈妈网官方自营母婴品牌_files/0_thumb_P_1518166803702.jpg"
								title="" width="233" height="233">
						</div>
						<p class="goods-title">妈妈良品 婴幼儿纱布印花三角巾24cm*47cm 两条装</p>
				</a>
					<div class="price clearfix mb-10">
						<span class="shop-price">￥36</span>
					</div> <img
					src="./婴装_童装_棉品_妈妈良品_妈妈良品_妈妈网官方自营母婴品牌_files/1518837093965010846.png"
					title="" width="50" height="56" class="hanging "></li>
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
					<p>版权所有 @小树熊xiaoshuxiong.com 客服热线:18818429757</p>
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
				location.href = "/item/selectTitle?title=" + title;
				$("#searchInput").val("");
			});

			$(".cart-wraper").click(function() {
				var test = ${user != null};
				if (test) {
					location.href = "/cart/cart?uid=${user.uid}";
				} else {
					layer.alert('请先登录', {
						icon : 6
					});
				}
			});
		</script>
</body>
</html>