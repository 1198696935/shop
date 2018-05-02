<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="css/font.css">
	<link rel="stylesheet" href="css/xadmin.css">
</head>
<body>
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a>  <i class="layui-icon">&#xe68e;</i> <cite>Admin</cite></a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item to-index"><a href="user/home">商城首页</a></li>
          <li class="layui-nav-item to-index"><a href="admin/logout">退出</a></li> 
        </ul>    
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
          <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6ce;</i>
                    <cite>报表统计</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                 <ul class="sub-menu">
                    <li>
                        <a _href="detail/saleEchart">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>热销榜</cite>     
                        </a>
                    </li >
                </ul>
            </li>
            
             <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>商品管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
            
                <ul class="sub-menu">
                  <li>
                        <a _href="item/itemList">
                           <i class="iconfont">&#xe697;</i>
                            <cite>商品列表</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="item/itemAdd">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>商品增加</cite>
                        </a>
                    </li >
                </ul>
            </li>
            
              <li>
                <a href="javascript:;">
              <i class="layui-icon">&#xe634;</i>   
                    <cite>头条管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
              
                    <li>
                        <a _href="news/newsList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>头条列表</cite>     
                        </a>
                    </li >
                    
                      <li>
                        <a _href="news/newsAdd">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>头条增加</cite>     
                        </a>
                    </li >
                </ul>
            </li>
                  
             <li>
                <a href="javascript:;">
                <i class="layui-icon"> &#xe65e;</i> 
                    <cite>订单管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="order/orderList">
                           <i class="iconfont">&#xe6a7;</i>
                            <cite>订单列表</cite>
                        </a>
                       <!--   <a _href="order/orderVerify">
                           <i class="iconfont">&#xe6a7;</i>
                            <cite>审核订单</cite>
                        </a> -->
                    </li >
                </ul>
            </li>    
            
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>用户管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="user/userList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>用户列表</cite>     
                        </a>
                    </li >
                </ul>
            </li>
          
        </ul>
      </div>
    </div>
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li>首页</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='admin/welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright">Copyright ©2018 Chen Xiaobo v2.3 All Rights Reserved</div>  
    </div>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script src="lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>
</body>
</html>