<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<base href="${pageContext.request.contextPath}/">
<title>我的购物车</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/shopping_cart.css">
<link rel="stylesheet" href="css/goods_order.css">
<link rel="stylesheet" type="text/css" href="css/jquery.step.css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.step.min.js"></script>
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
			<a href="/user/home" class="logo fl">
				<img src="img/icon/logo.png" width="152" height="65"
				title="小树熊，妈网官方商城">
			</a>

			<div class="page-title fl clearfix"></div>
			<div class="step-bar-out">
				<div id="step"></div>


			</div>
		</div>
	</div>

	<div id="cart" class="wrap xsx-cart">
		<div class="row thead clearfix">
			<div class="col col-1">
				<input type="checkbox" class="checkbox" id="select_all_1"> <label
					for="select_all_1">全选</label>
			</div>
			<div class="col col-2">
				<span class="t">商品信息</span>
			</div>
			<div class="col col-3">单价 ( 元 )</div>
			<div class="col col-4">
				<span class="t"> 数量 </span>
			</div>
			<div class="col col-5">金额 ( 元 )</div>
			<div class="col col-6">操作</div>
		</div>

		<div class="goods-item-list">
			<div class="row thead-2">
				<input type="checkbox" class="checkbox">
				<div class="goods-classify fl">
					<span class="text">满88元包邮</span> <span class="trigon"></span>
				</div>
			</div>
			<!-- 购物车列表 -->
			<c:forEach items="${cartList}" var="cart">
				<div class="row goods-row clearfix" id="107512" value="123456">
					<div class="col col-1">
						<input type="checkbox" class="checkbox gc">
					</div>
					<div class="col col-2 clearfix cart-goods-info">
						<a href="/item/selectIid?iid=${cart.item.iid}"
							class="pic-holder fl"> <img src="${cart.item.picture}"
							width="78">
						</a>
						<div class="texts">
							<a href="/item/selectIid?iid=${cart.item.iid}"
								class="goods-title">${cart.item.description}</a>
							<p class="size">属性：均码</p>
							<p class="size"></p>
						</div>
					</div>
					<div class="col col-3">
						<p class="price">${cart.item.price}</p>

					</div>
					<div class="col col-4">
						<div class="clearfix mod-limit ">
							<div class="clearfix">
								<a class="reduce limit-control fl">-</a> <input type="text"
									class="limit-input fl" data-limit="50" data-cid="5432755"
									readonly="readonly" value="${cart.count}"><a
									class="increase limit-control fl">+</a>
							</div>
						</div>
					</div>
					<div class="col col-5 one-goods-cost">
						<span class="account">${cart.item.price*cart.count}</span>
					</div>
					<div class="col col-6 operation">
						<span class="icon-del" onclick="delCart(${cart.cid})"></span>
						<div class="popup-delete-goods">
							<i class="triangle"></i>
							<p class="sure-text">确定删除所选商品吗 ?</p>
							<div class="btns" data-del="">
								<a href="javascript://" class="btn-del"
									onclick="confirmDelCart()">删除</a> <a href="javascript://"
									class="btn-cancle">取消</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<div class="row total clearfix">
				<div class="fl">
					<input type="checkbox" class="checkbox" id="select_all_2">
					<label for="select_all_2">全选</label>
				</div>
				<div class="fr total-box clearfix">
					<span class="text">已选商品 : </span> <span id="total-count" class="total-count">
						0 </span> <span class="text">件 合计 ( 不含邮费 ) :￥ </span> <span
						class="total-price"> 0</span> <a id="cartBtn"
						class="go-to-pay btn-go">去结算</a>
				</div>
			</div>
		</div>
	</div>
	<!--结算页面 -->
	<div id="balance" style="display: none">
	   <div class="wrap">
			<div class="common-box address-box">
				<div class="hd"><span class="tit">选择收货地址</span></div>
				<div class="bd">
					<ul class="address-list clearfix">
						<li class="">
							<div class="address-list-bd" address="521497">
								<i class="clk"></i>
								<div class="hdbox">
									<a href="javascript:;" target="_self" class="" style="display: none;">设为默认地址</a>
									<span class="name">陈晓波</span>
									<span>18818429757</span>
								</div>
								<div class="bdbox">
									<p class="address-info"><span>广东省</span><span>广州市</span><span>天河区</span></p>
									<p>天上人间</p>
								</div>
								<a href="javascript:;" class="change-btn" data-address="521497" style="display: none;">修改</a>
							</div>
						</li>
									
						<li class="selected">
							<div class="address-list-bd" address="529023">
								<i class="clk"></i>
								<div class="hdbox">
									<a href="javascript:;" target="_self" style="display: block;" class="default">默认地址</a>
									<span class="name">陈晓芬</span>
									<span>18818429757</span>
								</div>
								<div class="bdbox">
									<p class="address-info"><span>广东省</span><span>东莞市</span><span>黄江镇</span></p>
									<p>1111111</p>
								</div>
								<a href="javascript:;" class="change-btn" data-address="529023" style="display: inline;">修改</a>
							</div>
						</li>
					</ul>
					<div class="address-lit-btns clearfix">
						<a href="javascript:;" class="add-address" data-addstyle="1">新增收货地址</a>
					</div>
				</div>
			</div>
			<input type="hidden" name="address_id" id="address_id" value="529023">
			
			<div class="common-box cost-box">
				<div class="hd"><span class="tit">费用详情</span></div>
				<div class="bd clearfix">
					<div class="cost-info fr">
						<p>共<span class="goods-nums red total-count">0</span>件商品，商品金额：<i class="cost-box-about">¥ 22.9</i></p>
						<p>优惠金额：<i class="cost-box-about" id="discount_val"> - ¥ 0</i></p>
						<p>运费：<i class="cost-box-about" id="shipping_fee_val"> + ¥ 10</i></p>
						<p>总金额：<i class="cost-box-about red" id="total1"> ￥32.90</i></p>
					</div>
				</div>
				<div class="bd">
					<div class="cost-all clearfix">
						<button class="cost-submit-btn fr" id="orderBtn">提交订单</button>
						<div class="cost-all-price fr">应付金额：<span id="total2">￥32.90</span></div>
					</div>
					<div class="post-goods-address">
						<p id="receiver-name">寄送至： 陈晓芬 18818429757</p>
						<p id="receiver-address">广东省东莞市黄江镇 1111111</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 成功页面 -->
	<div class="wrap xsx-cart">
	 <div id="success" class="about-error-tips" style="display:none">
            <div class="about-error-tips-bd">
                <img class="face" src="img/icon/bear.jpg" style="height:200px;width:200px;" alt="">
                <p class="p1">亲，您已完成购物流程 <br>我们将尽快为您派送商品</p>
                <a class="error-tips-btn" id="personalBtn">个人中心</a>
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

	<script src="js/h.js" type="text/javascript"></script>
	<script src="js/jquery.menu-aim.js"></script>
	<script src="js/common_pc.js"></script>
	<script src="js/cart.js"></script>

	<script type="text/javascript">
				var $step = $("#step");
				var $index = $("#index");
				$step.step({
					index : 0,
					time : 500,
					title : [ "我的购物车", "提交订单", "开始派送商品" ]
				});

				$index.text($step.getIndex());
				$("#cartBtn").on("click", function() {
					$step.nextStep();
					$index.text($step.getIndex());
					$("#cart").hide();
					$("#balance").show();
				});
				
				$("#orderBtn").on("click", function() {
					$step.nextStep();
					$index.text($step.getIndex());
					$("#cart").hide();
					$("#balance").hide();
					$("#success").show();
				});
				
				
				$("#prevBtn").on("click", function() {
					$step.prevStep();
					$index.text($step.getIndex());
				});

				$("#nextBtn").on("click", function() {
					$step.nextStep();
					$index.text($step.getIndex());
				});

				
				$("#btn2").on("click", function() {
					$step.toStep(2);
					$index.text($step.getIndex());
				});
			</script>
	<script>
				$(".mod-limit").on(
						"click",
						".increase",
						function() {
							var input = $(this).siblings(".limit-input");
							var limit = input.data('limit');
							var count = parseInt($(this).prev().val()) + 1;
							input.val(count);
							var price = $(this).parent().parent().parent()
									.prev().find(".price").text(); 
							
							var account = parseFloat(price).toFixed(2) * count;
							var accountText = $(this).parent().parent()
									.parent().next().find(".account").text(
											account);
							var flag=$(this).parent().parent().parent().parent().find(".gc").is(":checked");	
							if(flag)
								{
								   var  totalPrice=parseFloat($(".total-price").text())+parseFloat(price);
								   var  totalCount=parseInt($("#total-count").text())+1;
								   $(".total-price").text(totalPrice);
								   $(".total-count").text(totalCount);
								}
						});

				$(".mod-limit").on(
						"click",
						".reduce",
						function() {
							var input = $(this).siblings(".limit-input");
							if (input.val() <= 1) {
								return false;
							}
							var count = parseInt($(this).next().val()) - 1;
							input.val(count);
							var price = $(this).parent().parent().parent()
									.prev().find(".price").text();
							var account = parseFloat(price).toFixed(2) * count;
							var accountText = $(this).parent().parent()
									.parent().next().find(".account").text(
											account);
							var flag=$(this).parent().parent().parent().parent().find(".gc").is(":checked");
							if(flag)
							{
							   var  totalPrice=parseFloat($(".total-price").text())-parseFloat(price);
							   var  totalCount=parseInt($("#total-count").text())-1;
							   $(".total-price").text(totalPrice);
							   $(".total-count").text(totalCount);
							}
						
						});

				function total() {
					var sum = 0;
					$(".account").each(function() {
						sum += parseFloat($(this).text());
						$(".total-price").text(sum);
					})
				}

				$(".gc").click(function() {
					var sum=0; var count=0;
					$(".account").css("color", "D3D3D3");
					$("[class*='gc']:checked").each(function() {	
						$(this).parent().parent().find(".account").css("color", "#ff7f9d");
					 sum=sum+parseFloat($(this).parent().parent().find(".account").text());
					 count=count+parseInt($(this).parent().parent().find(".limit-input").val());
					});
					$(".total-price").text(sum);
					$(".total-count").text(count);
					
				});
				
				function abc()
                  {
					var sum=0;var count=0;
					$(".account").css("color", "D3D3D3");
					$("[class*='gc']:checked").each(function() {	
						$(this).parent().parent().find(".account").css("color", "#ff7f9d");
					 sum=sum+parseFloat($(this).parent().parent().find(".account").text());
					 count=count+parseInt($(this).parent().parent().find(".limit-input").val());
					});
					$(".total-price").text(sum);
					$(".total-count").text(count);
					
                  }				
				$(".checkbox").click(function() {
					abc();
				});
				
				function delCart()
				{
					
				}
			</script>

</body>

</html>