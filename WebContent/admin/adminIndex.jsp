<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商城后台管理系统首页</title>
</head>
	<frameset rows="18%,*,10%">
		<frame src="${pageContext.request.contextPath}/admin/top.jsp" />
		<frameset cols="15%,*">
			<frame src="${pageContext.request.contextPath}/admin/left.jsp" />
			<frame src="${pageContext.request.contextPath }/admin/right.jsp" name="right" />
		</frameset >
		<frame src="${pageContext.request.contextPath}/admin/bottom.jsp" />	
	</frameset>
</html>