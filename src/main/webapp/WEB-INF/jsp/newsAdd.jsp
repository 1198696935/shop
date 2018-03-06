<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
<script charset="utf-8" src="kindeditor/kindeditor-all.js"></script>
<link rel="stylesheet" href="kindeditor/themes/qq/qq.css" />
<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
<script charset="utf-8" src=kindeditor/lang/zh_CN.js"></script>
<style>
#center {
	margin-left: 100px;
	margin-top: 20px;
	width: 600px;
	height: 400px;
}
</style>

<script>
	KindEditor.ready(function(K) {
		window.editor = K.create('#editor_id');
	});
</script>
</head>
<body>
	<div id="center">

		<div class="layui-form-item">
			<input id="ntitle" type="text" name="title" lay-verify="title"
				autocomplete="off" placeholder="请输入标题" class="layui-input">
		</div>

		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 30px;">
			<legend>拖拽上传</legend>
		</fieldset>
		<div class="layui-upload-drag" id="picture">
			<i class="layui-icon"></i>
			<p>点击上传，或将文件拖拽到此处</p>
		</div>
		<br>
		<br>
		<textarea id="editor_id" name="content">
        </textarea>
        <br>
		<div style="margin: 0 auto; text-align: center;">
			<button id="add" class="layui-btn">提交</button>
		</div>
	</div>
	<script>
		layui.use('upload', function() {
			var $ = layui.jquery, upload = layui.upload;
			upload.render({
				elem : '#picture',
				url : '/news/pictureUpload',
				accept : 'file',
				done : function(res) {
					if (res == 1)
						layer.msg('上传成功');
				}
			});

		});

		$("#add").click(function() {
			alert("ddd");
			$.ajax({
				url : '/news/add',
				type : 'post',
				data : {
					"title" : $("#ntitle").val(),
					"description" : $("#editor_id").val()
				},
				dataType : "json",
				success : function(data) {

					layer.msg('商品上传成功');
					window.location.reload();//刷新当前页面			
				}

			});
		});
	</script>

</body>

</html>