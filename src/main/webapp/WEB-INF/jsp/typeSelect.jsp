<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="${pageContext.request.contextPath}/">

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.all.js"
	charset="utf-8"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
</head>

<body>

	<form class="layui-form" action="">
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<select id="p" lay-filter="p">
				</select>
			</div>
			<div class="layui-input-inline">
				<select id="b" lay-filter="b">
				</select>
			</div>
		</div>
		</form>
		<script>
			layui.use('form', function() {
				var form = layui.form;
				$.ajax({
					url : '/type/selectAll',
					type : 'post',
					data : {
						'pid' : 0
					},
					dataType : 'json',
					success : function(data) {
						var t = "<option value='-1' disabled>----请选择种类</option>";
						for (var i = 0; i < data.length; i++) {
							t += "<option value="+data[i].tid+">"
									+ data[i].tname + "</option>"
						}
						$("#p").html(t);
						form.render('select'); //这个很重要
					}
				})
			});

			layui.use('form', function() {
				var form = layui.form;
				form.on('select(p)', function(data) {
					var bid = data.value;
					$.ajax({
						url : '/type/selectAll',
						type : 'post',
						data : {
							'pid' : bid
						},
						dataType : 'json',
						success : function(data) {

							var t = "<option value='-1' disabled>----请选择分支</option>";
							for (var i = 0; i < data.length; i++) {

								t += "<option value="+data[i].tid+">"
										+ data[i].tname + "</option>"
							}
							$("#b").html(t);
							form.render('select'); //这个很重要
						}
					})
				});
			});
		</script>
</body>
</html>
