<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>

<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.contextPath}/">

<title>展示商品</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<link rel="stylesheet" href="css/goods.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="lib/layui/layui.all.js" charset="utf-8"></script>

<style>
.g-area {
	width: 1000px;
	margin: 0 auto;
}
</style>
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
						<!-- <div class="had-login clearfix"> -->
						<span>Hi,欢迎来到妈妈网 !</span>
						<span class="sp">|</span>
						<span><a href="/user/userLogin" title="登录">登录</a></span>
						<span class="sp">|</span>
						<span><a href="/user/register" class="reg">免费注册</a></span>
						<span class="sp">|</span>
						<span><a href="#" target="_blank">我的订单</a></span>
						<!-- 	</div> -->
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<div class="logo-cart-box">
		<div class="wrap clearfix">
		    <a href="/user/home" class="logo fl">
				<img src="img/icon/logo.png" width="152" height="65"
				title="小树熊，妈网官方商城">
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
									<a href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=423"
										target="_blank" class="link-item">
										<div class="pic-holder">
											<img
												src="./婴装_童装_棉品_妈妈良品_妈妈良品_妈妈网官方自营母婴品牌_files/1464855191781825809.jpg"
												title="小树熊，妈网官方商城" width="58" height="58">
										</div>
										<p class="title">婴装/童装/棉品</p>
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
									<a href="https://www.xiaoshuxiong.com/cat_goods.php?cat_id=444"
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

	<div class="g-content">

		<div class="goods-detail g-area">
			<div class="goods-info clearfix">

				<div class="focus-picture fl">
					<div class="pic-holder" id="gallery">
						<img style="display: block;"> <img id="productPic"
							src="${item.picture}">
						<div class="video-wrap" id="J_video"></div>
					</div>
				</div>


				<div class="text-info">
					<h1 class="goods-title">${item.title}</h1>
					<div class="price-bar">
						<span class="cur-price"> <em class="J_priceName">特卖价</em> :
							<span class="price-wrap">¥<span id="shop_price"
								data-price="29">${item.price}</span></span>
						</span> <span class="old-price"> </span>
						<div class="countdown-mod-1 fr" id="J_actCountDown"
							style="display: none;"></div>
					</div>



					<dl class="info-item">
						<dt class="item-hd">运费 :</dt>
						<dd class="item-bd clearfix">
							<div class="express fl clearfix">
								<span class="text">小树熊发货</span>
							</div>
							<p class="fl express-cost">
								运费<em>10</em>元，满<em>88</em>元免运费
							</p>
						</dd>
					</dl>
					<dl class="info-item">
						<dt class="item-hd">服务 :</dt>
						<dd class="item-bd">7天无理由退货</dd>
					</dl>
					<dl class="info-item">
						<dt class="item-hd">属性 :</dt>
						<dd class="item-bd">均码</dd>
					</dl>


					<form action="cart.php" method="post" onsubmit="return false;"
						id="J_attrWrap">
						<dl class="info-item J_attrWrap none">
							<dt class="item-hd J_attrName">
								<span>库存</span> :
							</dt>
							<dd class="item-bd clearfix J_attrList">
								<span class="size-prop J_sku selected">${item.num}</span>
							</dd>
						</dl>
						<dl class="info-item">
							<dt class="item-hd">数量 :</dt>
							<dd class="item-bd clearfix">
								<div class="fl clearfix mod-limit item-numbox">
									<a class="reduce limit-control fl sub J_sub" id="sub">-</a> <input
										type="text" class="limit-input fl item-txt-val J_num"
										value="1" id="J_count" autocomplete="off"> <a
										class="increase limit-control fl J_add" id="add">+</a>
								</div>
							</dd>
						</dl>
						<span class="stock" style="display: none;">库存: <span
							id="J_stock" data-extprice="0.00">196</span></span>
						<div class="btns">
							<span id="J_btnGroup"> <a href="javascript://"
								class="btn btn-buynow J_buyNow" name="buynow">立即购买</a> <a
								class="btn btn-add J_addToCart" name="addcart" id="addcart">加入购物车</a>
							</span> <input type="hidden" name="goods_id" value="36558"> <input
								type="hidden" name="act" value="addtocart">
						</div>
					</form>
				</div>
			</div>

			<div class="sub-content mb-20 clearfix" id="anchor_1">
				<div class="fr goods-content">
					<div class="hd" id="tab_list">
						<ul class="tab-list clearfix">
							<li class="tab-item actived"><a href="javascript://"></a></li>
							<li class="tab-item"><a href="javascript://">图文详情</a></li>
							<li class="tab-item"><a href="javascript://">正品保证</a></li>
							<li class="tab-item last"><a href="javascript://">配送流程</a></li>
						</ul>
					</div>
					<div class="bd" id="J_contentWrap">
						<div class="detail-box editor-recommend ">
							<div class="recommend-wrap clearfix">
								<div class="fl">
									<div class="editor-img">
										<img
											src="https://cdn.xiaoshuxiong.com/images/ms/1479959570460853630.jpg">
									</div>
									<p>良姐姐</p>
								</div>
								<p class="ctn"></p>
							</div>
						</div>
						<div class="detail-box pic-text" id="pic-text">
							<div class="box-title">图文详情</div>
							<div class="J_detailContainer">
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167663273907.jpg"
										style="display: block;" title="1518167663273907.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167663273907.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167665821393.jpg"
										style="display: block;" title="1518167665821393.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167665821393.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167665428420.jpg"
										style="display: block;" title="1518167665428420.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167665428420.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167665243798.jpg"
										style="display: block;" title="1518167665243798.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167665243798.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167665168551.jpg"
										style="display: block;" title="1518167665168551.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167665168551.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167666684690.jpg"
										style="display: block;" title="1518167666684690.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167666684690.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167666403069.jpg"
										style="display: block;" title="1518167666403069.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167666403069.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167668860483.jpg"
										style="display: block;" title="1518167668860483.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167668860483.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167669708255.jpg"
										style="display: block;" title="1518167669708255.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167669708255.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167669478750.jpg"
										style="display: block;" title="1518167669478750.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167669478750.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167670636885.jpg"
										style="display: block;" title="1518167670636885.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167670636885.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167671639951.jpg"
										style="display: block;" title="1518167671639951.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167671639951.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167672515146.jpg"
										style="display: block;" title="1518167672515146.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167672515146.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167673473228.jpg"
										style="display: block;" title="1518167673473228.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167673473228.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167673877548.jpg"
										style="display: block;" title="1518167673877548.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167673877548.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167675788975.jpg"
										style="display: block;" title="1518167675788975.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167675788975.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167675150522.jpg"
										style="display: block;" title="1518167675150522.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167675150522.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167675485442.jpg"
										style="display: block;" title="1518167675485442.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167675485442.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167676879395.jpg"
										style="display: block;" title="1518167676879395.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167676879395.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167676226726.jpg"
										style="display: block;" title="1518167676226726.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167676226726.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167677171271.jpg"
										style="display: block;" title="1518167677171271.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167677171271.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167676716237.jpg"
										style="display: block;" title="1518167676716237.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167676716237.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167677786228.jpg"
										style="display: block;" title="1518167677786228.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167677786228.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167677346277.jpg"
										style="display: block;" title="1518167677346277.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167677346277.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167677692755.jpg"
										style="display: block;" title="1518167677692755.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167677692755.jpg"
										class="loaded">
								</p>
								<p>
									<img
										data-src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167677110483.jpg"
										style="display: block;" title="1518167677110483.jpg"
										src="https://cdn.xiaoshuxiong.com/images/presentation/20180209/1518167677110483.jpg"
										class="loaded">
								</p>
								<p>
									<br>
								</p>
							</div>
						</div>
						<div class="detail-box" id="pic-text">
							<div class="box-title">正品保证</div>
							<p>
								<img
									src="https://static.xiaoshuxiong.com//pc/dist/images/promise.png">
							</p>
						</div>

						<div class="delivery" id="delivery">
							<div class="box-title">配送流程</div>
							<div class="process">
								<img
									src="https://static.xiaoshuxiong.com//pc/dist/images/ship/shipping_33.png"
									width="750">
							</div>
						</div>
					</div>

					<div id="J_mamaTryDialog" style="display: none;">
						<div class="editor-info">
							<div class="img-wrap g-imgBg">
								<img class="J_img" src="">
							</div>
							<p class="m"></p>
							<p class="s"></p>
						</div>
						<div class="content-wrap"></div>
					</div>
				</div>
				<div class="fl hot-recommend">
					<div class="hd">热卖推荐</div>
					<ul class="bd">
						<li class="goods-item"><a href="product.php?id=33771"
							target="_blank">
								<div class="pic-holder">
									<img class="J_lazyImg loaded"
										data-src="https://cdn.xiaoshuxiong.com/images/201801/goods_img/0_P_1516938436231.jpg"
										width="168" height="168" alt=""
										src="https://cdn.xiaoshuxiong.com/images/201801/goods_img/0_P_1516938436231.jpg"
										style="display: inline;">
								</div>
								<p class="goods-title">每天补充VC</p>
						</a>

							<p>
								<span class="shop-price">￥18.9</span> <span class="market-price">￥25.00</span>
							</p></li>
						<li class="goods-item"><a href="product.php?id=33772"
							target="_blank">
								<div class="pic-holder">
									<img class="J_lazyImg loaded"
										data-src="https://cdn.xiaoshuxiong.com/images/201703/goods_img/0_P_1490058650109.jpg"
										width="168" height="168" alt=""
										src="https://cdn.xiaoshuxiong.com/images/201703/goods_img/0_P_1490058650109.jpg"
										style="display: inline;">
								</div>
								<p class="goods-title">辅食制作神器</p>
						</a>

							<p>
								<span class="shop-price">￥35</span> <span class="market-price">￥139.00</span>
							</p></li>
						<li class="goods-item"><a href="product.php?id=29524"
							target="_blank">
								<div class="pic-holder g-imgBg">
									<img class="J_lazyImg"
										data-src="https://cdn.xiaoshuxiong.com/images/201801/goods_img/0_P_1517297730371.jpg"
										width="168" height="168" alt=""
										src="https://static.xiaoshuxiong.com/mobile/dist/images/img_error.png">
								</div>
								<p class="goods-title">聚拢不压胸</p>
						</a>

							<p>
								<span class="shop-price">￥89</span> <span class="market-price">￥239.00</span>
							</p></li>
						<li class="goods-item"><a href="product.php?id=22485"
							target="_blank">
								<div class="pic-holder g-imgBg">
									<img class="J_lazyImg"
										data-src="https://cdn.xiaoshuxiong.com/images/201701/goods_img/0_P_1484289369776.jpg"
										width="168" height="168" alt=""
										src="https://static.xiaoshuxiong.com/mobile/dist/images/img_error.png">
								</div>
								<p class="goods-title">买一送一</p>
						</a>

							<p>
								<span class="shop-price">￥39</span> <span class="market-price">￥68.00</span>
							</p></li>
					</ul>
				</div>
			</div>
		</div>
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

	<!--网页右侧栏购物车 -->
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
	<script src="js/jquery.cxslide.js"></script>
	<script src="js/common_pc.js"></script>
	<script src="js/h.js" type="text/javascript"></script>
	<script>
		$("#add").click(function() {
			var num = "${item.num}";
			var count = parseInt($("#J_count").val());
			if (count < num) {
				$('#J_count').val(count + 1);
			}
		});

		$("#sub").click(function() {
			var count = parseInt($("#J_count").val());
			if (count > 1) {
				$('#J_count').val(count - 1);
			}
		});

		$("#addcart").click(function() {
			var test = ${user!=null};
			
			if (test) {
				var iid = "${item.iid}";
				var uid = "${user.uid}";
				var count = parseInt($("#J_count").val());
				$.ajax({
					type : "POST",
					url : "/cart/add",
					data : {
						'iid' : iid,
						'uid' : uid,
						'count' : count
					},
					dataType : "json",
					success : function(data) {
						if (data == 1) {
							var layer = layui.layer;
							/*  layer.msg('注册失败'); */
							layer.msg('成功加入购物车', {
								time : 0 //不自动关闭
								,
								btn : [ '去购物车结算', '再逛逛' ],
								yes : function(index) {
									layer.close(index);
									location.href = "/cart/cart?uid=${user.uid}";
								}
							});
						}
					}
				});
			} else {
				layer.alert('请先登录', {icon: 6});
			}
		});
	</script>
	<script>
		layui.use([ 'form' ], function() {
			var form = layui.form, layer = layui.layer
		});
	</script>
	<script>
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