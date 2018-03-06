<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.contextPath}/">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>

</head>
<body>
	<div class="x-body">
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名 </label>
				<div class="layui-input-inline">
					<input id="username" type="text" required="" lay-verify="nikename"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"></span>密码 </label>
				<div class="layui-input-inline">
					<input id="pwd" type="password" required="" lay-verify="pass"
						autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">6到16个字符</div>
			</div>

			<div class="layui-form-item" pane="">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block" id="sex">
					<input type="radio" name="sex" value="男" title="男" checked="">
					<input type="radio" name="sex" value="女" title="女">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">手机</label>
					<div class="layui-input-inline">
						<input id="phone" type="tel" name="phone"
							lay-verify="required|phone" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button style="margin-left: 60px" class="layui-btn" lay-filter="add"
					lay-submit="">增加</button>
			</div>
		</form>
	</div>
</body>
<script>
	layui.use([ 'form', 'layer' ], function() {
		$ = layui.jquery;
		var form = layui.form, layer = layui.layer;
		//监听提交
		form.on('submit(add)', function(data) {
			var formData = data.field;
			$.extend(formData, {
				username : $("#username").val(),
				pwd : $("#pwd").val(),
				sex : $('input[name="sex"]:checked').val(),
				phone : $("#phone").val(),
			});
			$.ajax({
				url : "/user/add",
				type : "POST",
				data : formData,
				dataType : "json",
				success : function(state) {
					if (state == 1) {
							
									// 获得frame索引
									var index = parent.layer
											.getFrameIndex(window.name);
									//关闭当前frame
									parent.layer.close(index);
									parent.location.reload();
								

					} else {
						var index = parent.layer.getFrameIndex(window.name);
						//关闭当前frame
						parent.layer.close(index);
						parent.location.reload();

					}
				}
			});
			return false;
		});
	});
</script>
</html>