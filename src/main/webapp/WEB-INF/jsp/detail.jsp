<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<base href="${pageContext.request.contextPath}/">
<title>我的购物车</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/shopping_cart.css">
<link rel="stylesheet" href="css/goods_order.css">
<link rel="stylesheet" type="text/css" href="css/jquery.step.css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<script type="text/javascript" src="lib/layui/layui.all.js"></script>
<script src="js/jquery.step.min.js"></script>
</head>
<html>
<body>
<br>
<br>
	<div id="cart" class="wrap xsx-cart">
		<div class="row thead clearfix">
			<div class="col col-1">
			</div>
			<div class="col col-2">
				<span class="t">商品信息</span>
			</div>
			<div class="col col-3">单价 ( 元 )</div>
			<div class="col col-4">
				<span class="t"> 数量 </span>
			</div>
			<div class="col col-5">金额 ( 元 )</div>
		</div>

		<div class="goods-item-list">
				<div class="row thead-2">
				<!-- <input type="checkbox" class="checkbox"> -->
				<div class="goods-classify fl">
					<span class="text">满88元包邮</span> <span class="trigon"></span>
				</div>
			</div>
			<!-- 购物车列表 -->
			<c:forEach items="${detailList}" var="detail">
				<div class="row goods-row clearfix">
					
					<div class="col col-2 clearfix cart-goods-info">
						<a href="item/selectIid?iid=${detail.iid}"
							 target="_Blank" class="pic-holder fl"> <img src="${detail.picture}"
							width="78">
						</a>
						<div class="texts">
							<a href="item/selectIid?iid=${detail.iid}"
							target="_Blank"	class="goods-title">${detail.description}</a>
							<p class="size">属性：均码</p>
							<p class="size"></p>
						</div>
					</div>
					<div class="col col-3">
						<p class="price">${detail.price}</p>

					</div>
					<div class="col col-4">
						<div class="clearfix mod-limit ">
							<div class="clearfix">
								<a class="reduce limit-control fl">-</a> <input type="text"
									class="limit-input fl num" 
									readonly="readonly" value="${detail.num}"><a
									class="increase limit-control fl">+</a>
							</div>
						</div>
					</div>
					<div class="col col-5 one-goods-cost">
						<span class="account">${detail.price*detail.num}</span>
					</div>
				
				</div>
			</c:forEach>
		</div>
	</div>
	<script src="js/h.js" type="text/javascript"></script>
	<script src="js/jquery.menu-aim.js"></script>
	<script src="js/common_pc.js"></script>
	<script src="js/cart.js"></script>
</body>

</html>