<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
		a{
		text-decoration: none;
		}
		a:link{
				color: green;
			}
			a:visited{
				color: blue;
			}
			a:hover{
				color: red;
			}
			a:active{
				color: green;
			}
</style>
</head>
<body>		
	<table width="100%" cellpadding="0px" cellspacing="0px" border="1px">
		<caption>订单详情列表</caption>
		<tr>
			<td align="center" width="4%">序号</td>
			<td align="center" width="6%">姓名</td>
			<td align="center" width="25%">订单号</td>
			<td align="center" width="10%">订单时间</td>
			<td align="center" width="20%">名称</td>			
			<td align="center" width="10%">图片</td>			
			<td align="center" width="10%">门店价格</td>
			<td align="center" width="8%">是否热门</td>
			<td align="center" width="7%">地址</td>
		</tr>				
			<c:forEach items="${carList}" var="car" varStatus="vs">
				<tr>
					<td align="center">
						${vs.count}
					</td>
					<td align="center">
						${car.name}
					</td>
					<td align="center">
						${car.oid}
					</td>
					<td align="center">
						${car.ordertime}
					</td>
					<td align="center">
						${car.pname}
					</td>	
					<td align="center">
						<img src="${pageContext.request.contextPath }/images/${car.pimage}"
							width="40px" height="45px" />
					</td>														
					<td align="center">
						${car.shop_price}
					</td>
					<td align="center">
						${car.is_hot==1?"是":"否"}													
					</td>							
					<td align="center">
						${car.adr}
					</td>												
			</c:forEach>
		<tr>
			<td colspan="9" align="center">				
					总价格：${carList[0].totalprice}
			</td>
		</tr>			
		<tr>
			<td colspan="9" align="center">	
				<a href="${pageContext.request.contextPath}/showOrderList">历史订单</a><br/>
			</td>
		</tr>
		<tr>
			<td colspan="9" align="center">
			<a href="${pageContext.request.contextPath }/clientShowAllProduct">返回首页</a>
			</td>
		</tr>		
	</table>
</body>
</html>