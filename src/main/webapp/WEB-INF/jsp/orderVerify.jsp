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
<script type="text/javascript" src="lib/layui/layui.all.js"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
<script type="text/javascript" src="js/address.js"></script>
<style type="text/css">
		#addressdiv select{width: 80px;height: 30px;border: 1px solid #c0c0c0;border-radius: 5px;outline: none;}
		#addressdiv select option{width: 80px;max-width: 100px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
</head>

<body>
	<div class="x-body">
		<br>
		<table class="layui-hide" id="tableId" lay-filter="demo"></table>
	</div>
   
	<script>
		layui.use([ 'table' ], function() {
			var table = layui.table;
			table.render({
				elem : '#tableId',
				url : 'order/select',
				cols : [ [ 
					 {
						field : 'oid',
						title : '订单号',
						align : 'center',
						width : 160,
						sort : true
					}, {
						field : 'createTime',
						title : '创建时间',
						align : 'center',
						width : 160
					}, {
						field : 'payment',
						title : '金额',
						align : 'center',
						width : 160
					}, {
						field : 'username',
						title : '收货人',
						width : 160,
						align : 'center',
						templet : '#sexTpl'
					}, {
						field : 'area',
						title : '地区',
						align : 'center',
						width : 160
					}, {
						field : 'site',
						title : '详细地址',
						align : 'center',
						width : 160
					},{
						field : 'state',
						title : '状态',
						width : 120,
						align : 'center',
						templet : '#stateTpl'
					},{
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
				} else if (obj.event === 'selectOid') {
					selectOid(obj);
				}
			});
		});
	</script>

	<script type="text/html" id="barDemo">
    	 <a title="确认" lay-event="selectOid" style="color:#1E9FFF">
				<i class="layui-icon">&#xe618;</i>
			</a>
           	<a title="查看" lay-event="selectOid" style="color:#1E9FFF">
				<i class="layui-icon">&#xe615;</i>
			</a>
			<a title="删除" lay-event="del" style="color:#FF5722">
				<i class="layui-icon">&#xe640;</i>
			</a>
		</script>

 <script type="text/html" id="stateTpl">
   {{ d.state }}
</script> 
	<script>
         function selectOid(obj)
         {
        	 var data = obj.data;
        
        	 var oid=data.oid;
        	 alert(oid);
             location.href="detail/selectOid?oid="+data.oid; 
         }
		function del(obj) {
			layer.confirm('真的删除行吗', function(index) {
				var data = obj.data;
				$.ajax({
					url : "order/delOid",
					type : "POST",
					data : {
						"oid" : data.oid
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
	</script>
</body>
</html>