<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="login-container">
		<div>
			<input type="text" id="userName" name="userName" class="username"
				placeholder="用户名" autocomplete="off" /> <br> <label
				id="userNameError"></label>
		</div>
		<div>
			<input type="password" id="password" name="password" class="password"
				placeholder="密码" oncontextmenu="return false" onpaste="return false" />
			<br> <label id="passwordError"></label>
		</div>
		<button id="submit" type="submit">登 陆</button>
		<br>
	</div>
	
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/jquery.backstretch.js"></script>
	<script>
		$.backstretch([ "img/1.jpg", "img/2.jpg" ], {
			fade : 750,
			duration : 3000,
			preload : 0,
			start : 2
		});

		var userNameCheck = false;
		var passwordCheck = false;

		$(function() {
			$("#userName").blur(function() {
				userNameVerification();
			});
			$("#password").blur(function() {
				passwordVerification();
			});
			$("#submit").click(function() {
				var adminName = $("#userName").val();
				var pwd = $("#password").val();
				$.ajax({
					type : "POST",
					url : "/login",
					data : {
						adminName : adminName,
						pwd : pwd
					},
					dataType : "json",
					success : function(data) {
						if (data.msg = '1')
							location.href = "/admin";
						else
							alert("登录失败");
					}
				});
			});
		});

		function userNameVerification() {
			var userName = $("#userName").val();

			if (userName == "" || userName == null) {
				userNameError.innerHTML = "<font color='red'  style='font-size:small'>请输入您的用户名！</font>";
				userNameCheck = false;
			} else {
				userNameError.innerHTML = "";
				userNameCheck = true;
			}
		}

		function passwordVerification() {
			var password = $("#password").val();

			if (password == "" || password == null) {
				passwordError.innerHTML = "<font color='red'  style='font-size:small'>请输入您的密码！</font>";
				passwordCheck = false;
			} else {
				passwordError.innerHTML = "";
				passwordCheck = true;
			}
		}
	</script>
</body>
</html>