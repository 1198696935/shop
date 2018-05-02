<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
  <meta charset="utf-8">
 <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
 <link rel="stylesheet" href="css/xadmin.css">

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
</head>
<body>

 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend class="layui-bg-blue" style="margin-left:60px">个人信息</legend>
</fieldset> 
<div style="margin-left:50px">
<ul class="layui-timeline">
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title" >用户名：${personal.username}</div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title">性别： ${personal.sex}</div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title" >手机号码：${personal.phone}</div>
    </div>
  </li>
 
  <li class="layui-timeline-item">
    <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title"></div>
    </div>
  </li>

</ul>
  <button class="layui-btn" id=editUid>修改信息</button>
 </div>

<script>
$('#editUid').on('click', function() {
    var username="${user.username}";
	var phone="${user.phone}";
	var pwd="${user.pwd}";
	var sex="${user.sex}";
	$("#username").val(username);
	$("#phone").val(phone);
	$("#pwd").val(pwd);
	$("#sex").val(sex);
	var uid="${user.uid}";
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
			$.ajax({
				url: "user/edit",
				type: "POST",
				data: {
					"uid":uid,
					"username": $("#username").val(),
					"phone": $("#phone").val(),
					"sex": $("#sex").val(),
					"pwd":$("#pwd").val()
				},
				dataType: "json",
				success: function(data) {
					layer.close(index);
					location.reload();
				}
			});
		}
	});
});
</script>




<div id="modal" class="x-body" style="display:none">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
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
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input id="pwd"   class="layui-input">
				</div>
			</div>
		</div> 
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-inline">
				<input id="sex" type="text" required="" lay-verify="nikename"
					autocomplete="off" class="layui-input">
			</div>
		</div>   
</div>
</body>
</html>