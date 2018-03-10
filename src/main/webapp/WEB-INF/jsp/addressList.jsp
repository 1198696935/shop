<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
</head>
<body>
	<div class="x-body">
		<xblock>
		<button id="delSome" class="layui-btn layui-btn-danger"
			data-type="getCheckData">
			<i class="layui-icon"></i>批量
		</button>
		<button class="layui-btn" onclick="add();">
			<i class="layui-icon"></i>添加
		</button>
		<div style="float: right; margin-right: 200px">
			<div class="layui-inline">
				<input class="layui-input" name="keyword" id="demoReload"
					autocomplete="off">
			</div>
			<button id="search" class="layui-btn layui-btn-normal"
				data-type="reload">搜索</button>
		</div>
		</xblock>
		<table class="layui-hide" id="tableId" lay-filter="demo"></table>
	</div>

	<script>
		layui.use([ 'table' ], function() {
			var table = layui.table;
			table.render({
				elem : '#tableId',
				url : 'address/selectAll?uid=${user.uid}' //数据接口 
				,
				cols : [ [ //表头
				{
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'aid',
					title : 'ID',
					align : 'center',
					width : 120,
					sort : true
				}, {
					field : 'user',
					title : '用户名',
					align : 'center',
					width : 120
				}, {
					field : '',
					title : 'phone',
					align : 'center',
					width : 120
				}, {
					field : 'province',
					title : '性别',
					width : 120,
					align : 'center',
				}, {
					field : 'city',
					title : '城市',
					align : 'center',
					width : 120
				}, {
					field : '区',
					title : '金额',
					align : 'center',
					width : 120
				}, {
					fixed : 'right',
					title : '操作',
					align : 'center',
					width : 120,
					toolbar : '#barDemo'
				}

				] ],
				page : true, //开启分页
				limit : 10,
				skin : 'line',
				height : 400,
				cellMinWidth : 80
			});
			//监听工具条
			table.on('tool(demo)', function(obj) {
				var data = obj.data;
				if (obj.event === 'del') {
					del(obj);
				} else if (obj.event === 'edit') {
					edit(data);
				}
			});
		});
	</script>

	<script type="text/html" id="barDemo">
			<a title="编辑" lay-event="edit" style="color:#1E9FFF">
				<i class="layui-icon">&#xe642;</i>
			</a>
			<a title="删除" lay-event="del" style="color:#FF5722">
				<i class="layui-icon">&#xe640;</i>
			</a>
		</script>

	<script type="text/html" id="sexTpl">
			{{# if(d.sex === '女'){}}
			<span style="color: red;">{{d.sex}}</span> {{#} else {}}
			<span style="color: green;">{{ d.sex }}</span> {{#}}}
		</script>

	<script>
		layui
				.use(
						[ 'table' ],
						function() {
							var table = layui.table;
							$('#delSome')
									.on(
											'click',
											function() {
												var checkStatus = table
														.checkStatus('tableId'), data = checkStatus.data;
												var ids = new Array();
												$.each(data, function(index,
														obj) {
													ids.push(obj.uid);
												});
												$.ajax({
													url : "user/delAll",
													type : "POST",

													data : {
														"ids" : ids
													},
													success : function(state) {
														location.reload();
													}
												});
											});
						});
	</script>

	<script>
		function add() {
			layer.open({
				type : 1, //弹窗类型
				title : '增加', //显示标题 
				btn : '提交',
				btnAlign : 'c',
				closeBtn : 1, //是否显示关闭按钮
				shadeClose : true, //显示模态窗口
				skin : 'layui-layer-rim', //加上边框
				area : [ '550px', '440px' ], //宽高
				content : $('#modal'),
				yes : function(index, layero) {
					$.ajax({
						url : "user/add",
						type : "POST",
						data : {
							"username" : $("#username").val(),
							"pwd" : $("#pwd").val(),
							"sex" : $('input[name="sex"]:checked').val(),
							"phone" : $("#phone").val(),
							"address" : $("#address").val(),
							"money" : $("#money").val()
						},
						dataType : "json",
						success : function(data) {				
							 layer.close(index); 
							  location.reload(); 
						
						}
					});
				}
			});
		}

		function del(obj) {
			layer.confirm('真的删除行吗', function(index) {
				var data = obj.data;
				$.ajax({
					url : "user/del",
					type : "POST",
					data : {
						"uid" : data.uid
					},
					dataType : "json",
					success : function(data) {
						if (data.state == 1) {
							obj.del();
							layer.close(index);
							layer.msg("删除成功", {
								time : 2000, //2s后自动关闭				   
							});
						} else {
							layer.msg("删除失败", {
								icon : 5
							});
						}
					}
				});
			});
		}

		function edit(data) {
			var temp = data.sex;
			var uid = data.uid;
			$("#username").val(data.username);
			$("#pwd").val(data.pwd);
			if (data.sex == "男") {
				$("#man").next().find("i").click();
			} else {
				$("#woman").next().find("i").click();
			}
			$("#phone").val(data.phone);
			$("#address").val(data.address);
			$("#money").val(data.money);
			layer.open({
				type: 1, //弹窗类型
				title: '用户信息', //显示标题 
				btn: '提交',
				btnAlign: 'c',
				closeBtn: 1, //是否显示关闭按钮
				shadeClose: true, //显示模态窗口
				skin: 'layui-layer-rim', //加上边框
				area: ['550px', '440px'], //宽高
				content: $('#modal'),
				yes: function(index, layero) {
					$.ajax({
						url: "user/edit",
						type: "POST",
						data: {
							"uid": uid,
							"username": $("#username").val(),
							"pwd": $("#pwd").val(),
							"sex": $('input[name="sex"]:checked').val(),
							"phone": $("#phone").val(),
							"address": $("#address").val(),
							"money": $("#money").val()
						},
						dataType: "json",
						success: function(data) {
							layer.close(index);
							location.reload();
						}
					});
				}
			});
		}

		$('#search').on('click', function() {
			layui.use([ 'table' ], function() {
				var table = layui.table;
				table.reload('tableId', {
					where : {
						keyword : $('#demoReload').val()
					}
				});
			});
		});
	</script>
</body>
<div id="modal" class="x-body" style="display:none">

	<form class="layui-form" >
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
				<input id="man" type="radio" name="sex" value="男" title="男" >
				<input id="woman" type="radio" name="sex" value="女" title="女">
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">手机</label>
				<div class="layui-input-inline">
					<input id="phone" type="tel" name="phone"
						lay-verify="required|phone" autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">地址</label>
			<div class="layui-input-inline">
				<input id="address" type="text" name="money" lay-verify="money"
					placeholder="请输入" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label for="L_username" class="layui-form-label">金额</label>
			<div class="layui-input-inline">
				<input id="money" type="text" required="" lay-verify="nikename"
					autocomplete="off" class="layui-input">
			</div>
		</div>
	</form>

</div>
</html>