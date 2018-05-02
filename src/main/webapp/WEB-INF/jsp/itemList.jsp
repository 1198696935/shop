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
		
		<div style=" margin-right: 200px">
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
				url : 'item/selectSome' //数据接口 
				,
				cols : [ [ //表头
				{
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'iid',
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
					field : 'description',
					title : '描述',
					align : 'center',
					width : 120
				}, {field: 'picture',title: '图片',height: 150,style:'height:100%;max-width:100%;',templet:'<div><img src="{{ d.picture}}"></div>'
				},{
					field : 'num',
					title : '库存数量',
					align : 'center',
					width : 160
				}, {
					field : 'price',
					title : '价格',
					align : 'center',
					width : 160
				}, {
					fixed : 'right',
					title : '操作',
					align : 'center',
					width : 160,
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

	<script>
	function add() {
		layer.open({
			type: 1, //弹窗类型
			title: '用户信息', //显示标题 
			btn: '提交',
			btnAlign: 'c',
			closeBtn: 1, //是否显示关闭按钮
			shadeClose: true, //显示模态窗口
			skin: 'layui-layer-rim', //加上边框
			area: ['450px', '380px'], //宽高
			content: $('#modal'),
			yes: function(index, layero) {
				var province=$("#province").val();
				  var city=$("#city").val();
				  var town=$("#town").val();
				  area=province+" "+city+" "+town;
				$.ajax({
					url: "address/add",
					type: "POST",
					data: {
						"username": $("#username").val(),
						"phone": $("#phone").val(),
						"area": area,
						"site": $("#site").val()
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
	
	
		function del(obj) {
			layer.confirm('真的删除行吗', function(index) {
				var data = obj.data;
				$.ajax({
					url : "item/delIid",
					type : "POST",
					data : {
						"iid" : data.iid
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

		function edit(data) {
			var aid = data.aid;
			$("#username").val(data.username);
			$("#phone").val(data.phone);
			$("#site").val(data.site);
			layer.open({
				type: 1, //弹窗类型
				title: '用户信息', //显示标题 
				btn: '提交',
				btnAlign: 'c',
				closeBtn: 1, //是否显示关闭按钮
				shadeClose: true, //显示模态窗口
				skin: 'layui-layer-rim', //加上边框
				area: ['450px', '380px'], //宽高
				content: $('#modal'),
				yes: function(index, layero) {
					var province=$("#province").val();
					  var city=$("#city").val();
					  var town=$("#town").val();
					  area=province+" "+city+" "+town;
					$.ajax({
						url: "address/edit",
						type: "POST",
						data: {
							"aid":aid,
							"username": $("#username").val(),
							"phone": $("#phone").val(),
							"area": area,
							"site": $("#site").val()
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
	
	<script type="text/javascript">
		$(function(){
			$("#addressdiv").selectAddress()
			$("#town").focusout(function(){
				var province = $("#province option:selected").html()
				var city = $("#city option:selected").html()
				var town = $("#town option:selected").html()
				if(province!= '选择省份' && city!="选择城市" && town!='选择区域'){
				}	
			})
		})
	</script>
	
</body>
<div id="modal" class="x-body" style="display:none">

	
		<div class="layui-form-item">
			<label class="layui-form-label">收货人</label>
			<div class="layui-input-inline">
				<input id="username" type="text" required="" lay-verify="nikename"
					autocomplete="off" class="layui-input">
			</div>
		</div>
			<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">手机</label>
				<div class="layui-input-inline">
					<input id="phone" type="tel" name="phone"  class="layui-input">
				</div>
			</div>
		</div>

     <div id="addressdiv" style="margin: 10px auto auto 70px;">
		<select class="select" id="province" name="province">
			<option value="">选择省份</option>
		<option value="北京">北京</option><option value="上海">上海</option><option value="天津">天津</option><option value="重庆">重庆</option><option value="广东">广东</option><option value="福建">福建</option><option value="湖北">湖北</option><option value="湖南">湖南</option><option value="河北">河北</option><option value="河南">河南</option><option value="山西">山西</option><option value="陕西">陕西</option><option value="江苏">江苏</option><option value="浙江">浙江</option><option value="安徽">安徽</option><option value="江西">江西</option><option value="山东">山东</option><option value="辽宁">辽宁</option><option value="吉林">吉林</option><option value="黑龙江">黑龙江</option><option value="四川">四川</option><option value="贵州">贵州</option><option value="云南">云南</option><option value="西藏">西藏</option><option value="甘肃">甘肃</option><option value="青海">青海</option><option value="宁夏">宁夏</option><option value="新疆">新疆</option><option value="内蒙古">内蒙古</option><option value="广西">广西</option><option value="海南">海南</option><option value="香港">香港</option><option value="澳门">澳门</option><option value="台湾">台湾</option></select>	
	
		<select name="city" id="city">
			<option value="">选择城市</option>
		</select>
      
		<select name="town" id="town">
			<option value="">选择区域</option>
		</select>
	</div>
         <br><br>
		<div class="layui-form-item">
			<label class="layui-form-label">详细地址</label>
			<div class="layui-input-inline">
				<input id="site" type="text" name="site" placeholder="请输入" autocomplete="off" class="layui-input">
			</div>
		</div>	

</div>
</html>