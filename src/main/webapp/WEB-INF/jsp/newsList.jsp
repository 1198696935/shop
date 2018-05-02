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
<script type="text/javascript" src="js/address.js"></script>
<style type="text/css">
		#addressdiv select{width: 80px;height: 30px;border: 1px solid #c0c0c0;border-radius: 5px;outline: none;}
		#addressdiv select option{width: 80px;max-width: 100px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
   
  
</head>
<body>
	<div class="x-body">
		<xblock>
		
		<div style="margin-right: 200px">
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
				url : 'news/selectSome' //数据接口 
				,
				cols : [ [ //表头
				{
					field : 'nid',
					title : 'ID',
					align : 'center',
					width : 120,
					sort : true
				}, {
					field : 'title',
					title : '标题',
					align : 'center',
					width : 120
				}, {
					field : 'picture',
					title : '图片',
					align : 'center',
					width : 120
				}, {
					field : 'description',
					title : '描述',
					align : 'center',
					width : 120
				},
				   {
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
			<a title="删除" lay-event="del" style="color:#FF5722">
				<i class="layui-icon">&#xe640;</i>
			</a>
		</script>

	<script>
	
	
	
		function del(obj) {
			layer.confirm('真的删除行吗', function(index) {
				var data = obj.data;
				$.ajax({
					url : "news/delNid",
					type : "POST",
					data : {
						"nid" : data.nid
					},
					dataType : "json",
					success : function(data) {
						if (data==1) {
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
</html>