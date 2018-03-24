<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品增加</title>
<base href="${pageContext.request.contextPath}/">

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.all.js"
	charset="utf-8"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<style>
#center {
	margin-left: 100px;
	margin-top: 20px;
	width: 600px;
	height: 400px;
}
</style>
</head>
<body>
	<div id="center">
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
		<div class="layui-form-item">
			<input id="title" type="text" name="title" lay-verify="title"
				autocomplete="off" placeholder="请输入标题" class="layui-input">
		</div>

		<div class="layui-form-item">
			<input id="num" type="text" lay-verify="required" placeholder="请输入数量"
				autocomplete="off" class="layui-input">
		</div>
       
		<div class="layui-form-item">
			<input id="price" type="text" lay-verify="required"
				placeholder="请输入价格" autocomplete="off" class="layui-input">
		</div>
           <div class="layui-upload-drag" id="picture">
			<i class="layui-icon"></i>
			<p>点击上传，或将文件拖拽到此处</p>
			
		</div>
	       <br><br>
		<div class="layui-form-item layui-form-text">
			<textarea  id="description" placeholder="请输入详细描述" class="layui-textarea"></textarea>
		</div>
		<br>
		
		<div style="margin: 0 auto; text-align: center;">
			<button id="add" class="layui-btn">提交</button>
		</div>
	</div>
	<script>
		layui.use('form', function() {
			var form = layui.form;
			$.ajax({
				url : 'type/selectAll',
				type : 'post',
				data : {
					'pid' : 0
				},
				dataType : 'json',
				success : function(data) {
					var t = "<option value='-1' disabled>----请选择种类</option>";
					for (var i = 0; i < data.length; i++) {
						t += "<option value="+data[i].tid+">" + data[i].tname
								+ "</option>"
					}
					$("#p").html(t);
					form.render('select'); //这个很重要
				}
			})
		});

		layui
				.use(
						'form',
						function() {
							var form = layui.form;
							form
									.on(
											'select(p)',
											function(data) {
												var bid = data.value;
												$
														.ajax({
															url : 'type/selectAll',
															type : 'post',
															data : {
																'pid' : bid
															},
															dataType : 'json',
															success : function(
																	data) {

																var t = "<option value='-1' disabled>----请选择分支</option>";
																for (var i = 0; i < data.length; i++) {

																	t += "<option value="+data[i].tid+">"
																			+ data[i].tname
																			+ "</option>"
																}
																$("#b").html(t);
																form.render('select'); //这个很重要
															}
														})
											});
						});
	</script>
	<script>
		layui.use('upload', function() {
			var $ = layui.jquery, upload = layui.upload; 
			upload.render({
				elem : '#picture',
				url : 'item/pictureUpload',
				accept : 'file',
				done : function(res) {	
					/* if (res == 1)
						layer.msg('图片上传成功'); */
				}
			});
		});
		
		
		$("#add").click(function(){
			    var title=$("#title").val();
	            var num=$("#num").val();
	            var price=$("#price").val();
	            var description=$("#description").val();
	            var tid=$("#b").val();
			
			$.ajax({
				url:'item/add',
				type:'post',
				data:{
					'title':title,
					'num':num,
					'price':price,
					'description':description,
					'tid':tid
				},
				dataType : "json",
			success:function(data){
				
				layer.msg('商品上传成功');
				window.location.reload();//刷新当前页面			
			}
				
			});		
});
	</script>
</body>
</html>