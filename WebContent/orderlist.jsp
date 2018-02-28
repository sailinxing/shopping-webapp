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
		<caption>历史订单列表</caption>
		<tr>
			<td align="center" width="5%">序号</td>
			<td align="center" width="15%">订单号</td>
			<td align="center" width="10%">订单时间</td>
			<td align="center" width="7%">总价格</td>
			<td align="center" width="63%">订单详情</td>
		</tr>				
			<c:forEach items="${ordermap}" var="entry" varStatus="vs">
				<tr>
					<td align="center">
						${vs.count}
					</td>
					<td align="center">
						${entry.key.oid}
					</td>
					<td align="center">
						${entry.key.ordertime}
					</td>
					<td align="center">
						${entry.key.totalprice}
					</td>															
					<td align="center">
						<table>
							<tr>
								<td align="center" width="10%">序号</td>
								<td align="center" width="10%">图片</td>
								<td align="center" width="40%">名称</td>
								<td align="center" width="10%">门店价格</td>
								<td align="center" width="10%">是否热门</td>							
							</tr>		
						<c:forEach items="${entry.value}" var="pro" varStatus="vs">
						  <tr>
								<td align="center">
									${vs.count}
								</td>
								<td align="center">
									<img src="${pageContext.request.contextPath }/images/${pro.pimage }"
										width="40px" height="45px" />
								</td>
								<td align="center">
									${pro.pname}
								</td>
								<td align="center">
								${pro.shop_price}
								</td>
								<td align="center">
								${pro.is_hot==1?"是":"否"}													
								</td>				
							</tr>						
						</c:forEach>
						</table>						
					</td>				
				</tr>						
			</c:forEach>
		<tr>
			<td colspan="5" align="center">	
				<a href="${pageContext.request.contextPath}/shoppingcar.jsp">返回购物车</a><br/>
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center">
			<a href="${pageContext.request.contextPath }/clientShowAllProduct">返回首页</a>
			</td>
		</tr>		
	</table>
</body>
</html>