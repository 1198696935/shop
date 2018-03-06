<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.contextPath}/">
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<style>
#carousel {center top no-repeat;
	position: absolute;
	top: 0px;
	left: 0px;
	z-index: 1;
}
</style>
</head>
<body>



	<script src="lib/layui/layui.js"></script>
	<script>
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			carousel.render({
				elem : '#carousel'

				,
				left : '200px',
				top : '100px',
				width : '1600px',
				height : '640px',
				interval : 2500
			});
		});
	</script>
</body>
</html>