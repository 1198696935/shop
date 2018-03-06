<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头条页面</title>
<base href="${pageContext.request.contextPath}/">
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>

</head>
<body>
  
  <div class="layui-row">
   
    <div class="layui-col-md8 layui-col-md-offset2">
      <!-- <div class="grid-demo">偏移4列</div> -->
      
         <h1 style="text-align:center">title:<c:out value="${news.title}"/></h1>
         <hr class="layui-bg-green">
        <br>
       <%--  <img src="${news.picture}"> --%>
        description:<c:out value="${news.picture}"/>
        </div>
  
     <div class="layui-col-md2">
      <div class="grid-demo grid-demo-bg1">4/12</div>
    </div>
    
  </div>
      
</body>
</html>