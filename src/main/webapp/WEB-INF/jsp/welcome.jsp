<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
 <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
</head>
<body>

 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend class="layui-bg-blue" style="margin-left:60px">准备计划</legend>
</fieldset> 
<div style="margin-left:50px">
<ul class="layui-timeline">
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title">2018年4月准备答辩</div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title">2018年3月完成论文</div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title">2018年2月底完成母婴商城</div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title">2018年1月底完成商品后台管理</div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title">更久前，技术积累</div>
    </div>
  </li>
</ul>      
 </div>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>

</body>
</html>