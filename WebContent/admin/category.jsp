<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
		<script>
			$(function(){
				$("tbody tr:even").css("background-color","burlywood");
				$(" tbody tr:odd").css("background-color","blueviolet");
			})
		</script>
</head>
<body>
	<table align="center"  width="50%" cellpadding="0px" cellspacing="0px" border="1px">
		<caption>分类列表</caption>
		<thead>
		<tr>  			
				<td align="center" width="10%">序号</td>
				<td align="center" width="10%">分类名称</td>
				<td align="center" width="10%">分类号</td>			
		</tr>	
		</thead>
		<tbody>							
			<c:forEach items="${categoryList}" var="cate" varStatus="vs">
				<tr>
					<td align="center" width="10%">${vs.count}</td>
					<td align="center" width="10%">${cate.cid}</td>
					<td align="center" width="10%">${cate.cname}</td>						
				</tr>
			</c:forEach>
		</tbody>						
	</table>	
</body>
</html>