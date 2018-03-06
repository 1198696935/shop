<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<link rel="stylesheet" href="css/cn_common.css" type="text/css" />
<link rel="stylesheet" href="css/cn_signUp.css" type="text/css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="lib/layui/layui.all.js" charset="utf-8"></script>
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

.warn {
	color: red;
}
</style>
<base href="${pageContext.request.contextPath}/">
</head>
<body>
	<div class="cn_header">
		<!-- <div class="container">
			<div class="left">
				<a href="#" class="logo"></a>
				<div class="sub_title">欢迎注册</div>
			</div>
		</div> -->
		<div class="container">
    <div class="left">
      <a href="#" class="logo"></a>
     <div class="sub_title">欢迎注册</div>
    </div>
    	    <div class="right">
	      <span>已有账号?直接</span>
	      <a href="/user/userLogin">登录</a>
	    </div>
      </div>
	</div>
	
	<div class="wrap">
		<div class="container">
			<!-- 手机注册 -->
			<div class="h60"></div>
			<div class="main">
				<div class="main_center">
					<div class="signUp_field_tel">
						<div class="section_input" id="sectionTel">
							<label for="signUpTel"
								class="label_input input_user input_border"> <i
								class="icon icon_tel"></i> <input type="text" name="phone"
								id="signUpTel" placeholder="请输入手机号码">
							</label>

						</div>

						<br> <label class="warn" id="phoneLabel"></label>

					</div>
					<br> <label id="acquireCode" class="layui-form-label"
						style="background-color: #79c92e; color: #fff;">获取验证码</label>
					<div class="layui-input-block">
						<input id="signUp_smsCode" type="text" name="title"
							autocomplete="off" placeholder="请输入验证码" class="layui-input">
					</div>
					<br>
					<label id="codeLabel" class="warn"></label> <br>
					<!-- <div class="section_input signUp_field_sms">
						<label for="signUp_smsCode"
							class="label_input input_user input_border"> <i
							class="icon icon_email"></i> <input type="text"
							name="phone_vcode" id="signUp_smsCode" placeholder="请输入短信验证码">
							
						</label><span class="v_btn" id="acquireCode">获取验证码</span> <br> <label id="codeLabel" class="warn"></label>
					</div> -->
					<br>
					<div class="section_input">
						<label for="signUp_username"
							class="label_input input_user input_border"> <i
							class="icon icon_user"></i> <input type="text" name="username"
							id="signUp_username" placeholder="请设置用户名，一经注册不再更改">
						</label> <br> <label class="warn" id="userLabel"></label>
					</div>
					<br>
					<div class="section_input">
						<label for="signUp_password"
							class="label_input input_user input_border"> <i
							class="icon icon_password"></i> <input type="password"
							name="password" id="signUp_password"
							placeholder="请设置登录密码，建议数字+字母">
						</label> <br> <label id="pwdLabel" class="warn"></label>
					</div>
					<br>

					<div class="layui-form-item"></div>
					<form class="layui-form">
						<div class="layui-form-item" pane="">
							<label class="layui-form-label">性别</label>
							<div class="layui-input-block" id="sex">
								<input type="radio" name="sex" value="男" title="男"
									checked="true"><input type="radio" name="sex" value="女"
									title="女">
							</div>
						</div>
					</form>
					<!-- 填写信息 -->
					<div class="options">
						<input type="submit" class="submit" id="signUpTelSubmit"
							value="注册">
					</div>
					<br>
				</div>
			</div>
		</div>
	</div>

	</div>
	<script src="lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript">

	var ok1=false;  
	var ok2=false;  
	var ok3=false;  
	var ok4=false;  
	
	$("#signUpTel").blur(function() {
		ok1=false;
		$("#phoneLabel").html("");
		var reg = /^1[34578]\d{9}$/;
		var str = $(this).val();
		if (!reg.test(str)) {
			var message = "手机号码格式错误";
			var s = $("#phoneLabel");
			var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">'
					+ message + "</span>";
			s.html(a).show()
		} else {
			$.ajax({
				type : "POST",
				url : "/user/findPhone",
				data : {
					phone : str
				},
				dataType : "json",
				success : function(data) {
					if (data == 0) {
						var message = "该号码已存在";
						var s = $("#phoneLabel");
						var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">'
								+ message + "</span>";
						s.html(a).show()
					}
					else{
						ok1=true; 
					}
				}
			});
		}
	});

	
	
	$("#acquireCode").click(function() {
		if(ok1==true)
	   {
		var phone=$("#signUpTel").val();
		$.ajax({
			type : "POST",
			url : "/user/getCode",
			data : {
				phone : phone
			},
			dataType : "json",
			success : function(data) {
				if (data==1)
					{
						var t = 60;
						$("#acquireCode").addClass("disabled"), $("#acquireCode").html(t+"s"), codeTimer = setInterval(function() {
							t--, $("#acquireCode").html( t + "s"), 0 == t && (clearInterval(codeTimer), codeTimer = null, $("#acquireCode").html("重新获取"), $("#acquireCode").removeClass("disabled"))
						}, 1e3)			
					}
			}
		});	
			}
		else 
			{
			var message = "手机号码不符合要求";
			var s = $("#codeLabel");
			var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">'
					+ message + "</span>";
			s.html(a).show()
			}
	});
	
	
	$("#signUp_smsCode").blur(function() {
		
		ok2=false;
		var code = $("#signUp_smsCode").val();
		var phone=$("#signUpTel").val();
		$("#codeLabel").html("");
		$.ajax({
			type : "POST",
			url : "/user/phoneLogin",
			data : {
				code :code,
				phone:phone
			},
			dataType : "json",
			success : function(data) {	
				alert("data"+data);
			 if(data==1)				 		
					 ok2=true;			
			 if(data==2)
				{
				 var message = "验证码出错";
					var s = $("#codeLabel");
					var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">'
							+ message + "</span>";
					s.html(a).show()
				}	
			}
		});
		
	});
	
		 $("#signUp_username").blur(function() {
			ok3=false;
			$("#userLabel").html("");
			var userName=$("#signUp_username").val();
			userName = $.trim(userName);
			if(userName=='')
			{
				var message = "用户名不能为空";
				var s = $("#userLabel");
				var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">'
						+ message + "</span>";
				s.html(a).show()
			}
			else{
				$.ajax({
					type : "POST",
					url : "/user/findUserName",
					data : {
						username:userName
					},
					dataType : "json",
					success : function(data) {				
						if (data == 0) {
							var message = "该用户存在";
							var s = $("#userLabel");
							var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">'
									+ message + "</span>";
							s.html(a).show()
						}
						else if(data==1)
						{
						  ok3=true;
						}
					}
				});
				}
		}); 
		 
		$("#signUp_password").blur(function(){
			 ok4=false;
			$("#pwdLabel").html("");
			  var reg = new RegExp("^.{6,20}$");   
			  var str = $(this).val();
			     
		      if(reg.test(str)){	  
		    	  ok4=true;
		      }else{
		    	  var message = "密码不得少于6位数，高于20位数";
					var s = $("#pwdLabel");
					var a = '<i class="layui-icon">&#xe69c;</i> <span class="text">'
							+ message + "</span>";
					s.html(a).show()
		      }
		});
		
		 $("#signUpTelSubmit").click(function() {	
				var userName = $("#signUp_username").val();
				var pwd = $("#signUp_password").val();
				var code = $("#signUp_smsCode").val();
				var phone=$("#signUpTel").val();
					
				 if(ok1&&ok2&&ok3&&ok4){	
					
				$.ajax({
					type : "POST",
					url : "/user/add",
					data : {
						username : userName,
						pwd : pwd,
						sex : $('input[name="sex"]:checked').val(),
						phone:phone
					},
					dataType : "json",
					success : function(data) {
						if (data.msg = '1')
							location.href = "/admin";
						else
							{					
							 var layer = layui.layer;			
							 layer.msg('注册失败');
							}
							
					}
				});
		      }
				else{
					 var layer = layui.layer;			
					 layer.msg('有输入框未符合要求');
				}
				 $("#signUpTel").val("");
				 $("#signUp_username").val("");
				 $("#signUp_password").val("");
				 $("#signUp_smsCode").val("");
			}); 
	</script>
	<script>
		layui.use([ 'form' ], function() {
			var form = layui.form, layer = layui.layer
		});
	</script>
</body>
</html>