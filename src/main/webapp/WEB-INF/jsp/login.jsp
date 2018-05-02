<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<link rel="stylesheet" href="css/cn_common.css" type="text/css" />
<link rel="stylesheet" href="css/cn_signIn.css" type="text/css" />
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<script src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.all.js"
	charset="utf-8"></script>
<style>
.submit {
	display: block;
	width: 100%;
	height: 40px;
	line-height: 40px;
	text-align: center;
	font-size: 16px;
	color: #fff;
	background-color: #79c92e;
	border-radius: 3px;
	margin-top: 10px
}

.submit.disabled {
	background-color: #b6b8b9
}
</style>
</head>
<body>
	<div class="cn_header">
		<div class="container">
			<div class="left">
				<a href="#" class="logo"></a>
				<div class="sub_title">欢迎登录</div>
			</div>
		</div>
	</div>

	<div class="wrap bg_big">
		<div class="container">
			<div class="login_wrap">
				<div class="tab_nav">
					<span class="tab_item" data-context="account" data-status="active">
						<em>账号登录</em>
					</span> <span class="tab_item" data-context="quick" data-status="">
						<em>快捷登录</em>
					</span>
				</div>
				<div class="tab_content tab_content_account" style="display: block;">
					<div class="message warning" id="warning"></div>
					<label for="account" class="label_input input_user input_border">
						<i class="icon icon_user"></i> <input name="userName"
						id="userName" placeholder="用户名" type="text"> <i
						class="icon icon_close"></i>
					</label> <label for="password"
						class="label_input input_password input_border"> <i
						class="icon icon_password"></i> <input name="display_password"
						id="password" placeholder="请输入密码" style="width: 75%"
						type="password"> <input name="password" id="password"
						type="hidden"> <i class="icon icon_password_hide"></i> <i
						class="icon icon_close"></i>
					</label> <input class="submit" id="submitAccount" value="登录" type="submit">


					<div class="options">
						<div class="right">
							<a href="user/register" target="_blank" class="sign_in">立即注册</a>
						</div>
					</div>
				</div>

				<div class="tab_content tab_content_quick" style="display: none;">
					<div class="message warning" id="warningQuick"></div>
					<!-- <h id="warningQuick"></h> -->
					<!-- 第一步 -->

					<label class="input_border label_input input_tel"> <i
						class="icon icon_tel"></i> <input id="setp2_tel" name="phone"
						placeholder="请输入手机号码" type="text">
					</label>

					<div class="vcode sms">
						<span class="v_input input_border"> <input
							class="input_border" name="sms_code" placeholder="输入验证码"
							id="sms_code" type="text">
						</span> <span class="v_btn" id="quickSmsCode">获取短信验证码</span>
					</div>

					<input class="submit" id="submitQuickStep2" value="登录"
						type="submit">
					<div class="tips">
						<p>温馨提示：验证码会发到您的手机，请注意查看</p>

					</div>
				</div>
			</div>
		</div>

		<div class="footer">
			<div class="container">
				<div class="content">Copyright © 2018-2018 MaMa.cn All Right
					Reserved 版权所有：妈妈网 粤ICP备xxxxxxxx号</div>
			</div>
		</div>
		<script type="text/javascript">
		$(document).ready(function(){
		var ok1=false;
		 $("#userName").blur(function() {	
			 
			ok1=false;
			$("#warning").html("");
			$("#warning").hide();
			var userName=$("#userName").val();
			userName = $.trim(userName);
			if(userName=='')
			{
				var message = "用户名不能为空";
				var s = $("#warning");
				var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">'
						+ message + "</span>";
				s.html(a).show()
			}
			else{
				
				$.ajax({
					type : "POST",
					url : "user/findUserName",
					data : {
						username:userName
					},
					dataType : "json",
					success : function(data) {	
						if (data == 0) {
							ok1=true;
						}
						else if(data==1)
						{		  
						  var message = "用户名还没注册";
							var s = $("#warning");
							var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">'
									+ message + "</span>";
							s.html(a).show()
						}
					}
				});
				}
		}); 
		 
		 $("#submitAccount").click(function() {	
				$("#warning").html("");
				$("#warning").hide();
			 if(ok1)
				 {
				var userName = $("#userName").val();
				var pwd = $("#password").val();
				$.ajax({
					type : "POST",
					url : "user/login",
					data : {
						userName : userName,
						pwd : pwd
					},
					dataType : "json",
					success : function(data) {
						if (data==0)
							location.href = "user/home";
						else if(data==1)
							{
							var message = "您的密码错误，请重新输入";
							var s = $("#warning");
							var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">'
									+ message + "</span>";
							s.html(a).show()
							}					
					}
				});
				 }
			 else
				 {
				 var layer = layui.layer;
				 layer.msg('用户名还未注册');
				 }
			});  
		});	
		</script>


		<script type="text/javascript">
		var ok1=false;
		var ok2=false;
		$("#setp2_tel").blur(function(){
			ok1=false;
			$("#warningQuick").html("");    
			$("#warningQuick").hide();
			var phone=$("#setp2_tel").val();
			  var reg = /^1[34578]\d{9}$/;
			  var str = $(this).val();
		      if(!reg.test(str)){    
		    	 var message="不是有效的手机格式";
			     var s = $("#warningQuick");
			     var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">' +message+ "</span>";
			    	s.html(a).show()
		      }
		      else
		    	  {
		    		$.ajax({
		    			type : "POST",
		    			url : "user/findPhone",
		    			data : {
		    				phone : phone
		    			},
		    			dataType : "json",
		    			success : function(data) {
		    				if (data==1)
		    					{
		    					 var message="该号码不存在";
		    			    	 var s = $("#warningQuick");
		    			    	 var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">' +message+ "</span>";
		    			    	 s.html(a).show()
		    					}
		    				else{
		    					ok1=true;
		    				}
		    			}
		    		});
		    	  }
		});
	
	$(".tab_item").click(function(e) {
		var t = $(e.currentTarget).attr("data-context");
		 $(".tab_item").attr("data-status", ""), "account" == t && ($(e.currentTarget).attr("data-status", "active"), $(".tab_content_" + t).show().siblings(".tab_content").hide()), "quick" == t && ($(e.currentTarget).attr("data-status", "active"), $(".tab_content_" + t).show().siblings(".tab_content").hide())
	})
		
	$("#quickSmsCode").click(function() {
		$("#warningQuick").html("");    
		$("#warningQuick").hide();
		var phone=$("#setp2_tel").val();
		
		if(ok1)
			{
		$.ajax({
			type : "POST",
			url : "user/getCode",
			data : {
				phone : phone
			},
			dataType : "json",
			success : function(data) {
				if (data==1)
					{
						var t = 60;
						$("#quickSmsCode").addClass("disabled"), $("#quickSmsCode").html("重新获取 ( " + t + "s )"), codeTimer = setInterval(function() {
							t--, $("#quickSmsCode").html("重新获取 ( " + t + "s )"), 0 == t && (clearInterval(codeTimer), codeTimer = null, $("#quickSmsCode").html("重新获取"), $("#quickSmsCode").removeClass("disabled"))
						}, 1e3)			
					}
			}
		});
			}
		else 
			{
			 var message="请注意手机格式";
	    	 var s = $("#warningQuick");
	    	 var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">' +message+ "</span>";
	    	 s.html(a).show()
			}
		
	});

		
		$("#submitQuickStep2").click(function(){	
		    var phone=$("#setp2_tel").val();
			var sms_code = $("#sms_code").val();
			
			$.ajax({
				type : "POST",
				url : "user/phoneLogin",
				data : {
					code : sms_code,
					phone:phone
				},
				dataType : "json",
				success : function(data) {		
				 if(data==1)				 		
						 location.href = "user/home";			
				 if(data==2)
					{
					 var message="验证码错误";
			    	 var s = $("#warningQuick");
			    	 var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">' +message+ "</span>";
			    	 s.html(a).show()
					}	
				}
			});
			
		});
	</script>
</body>
</html>