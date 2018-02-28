<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lixinxin.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
<script type="text/javascript">	
	function addCar(pid) {
	var con = confirm("确定要把我带回家吗？");
	if (con) {
		location.href = "${pageContext.request.contextPath}/clientAddCar?pid="
				+ pid;
		}
	}
</script>
</head>
<body>
	<div style="width: 100%;">			
		<div style="width: 300px; height: 400px; padding-top: 10px; text-align: left; border: 2px brown; float: left;">
			<br/> <img style="width: 280px; height: 350px; text-align: center;"
						src="images/${product.pimage} " />			
		</div>
		<div style="width: 600px; height: 600px; padding-top: 10px; text-align: left; border: 1px ; float: left;">	
			<div style="width: 100%; text-align: left; border: 1px ; float: left;">		
				<p><font color="red" size="5" >商品名：${product.pname}</font></p><br/>
				<p><font color="brown" size="5" >价格：${product.shop_price}</font></p><br/>
				<p><font color="black" size="4" >商品描述：${product.pdesc}</font></p><br/>
			</div>
			<div style="width: 100%;text-align:left; border: 1px ;float: left;">		
				<a href="${pageContext.request.contextPath}/clientBuy?pid=${product.pid}" >立即购买</a>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
				<a href="javascript:void(0)" onclick="addCar('${product.pid}')">加入购物车</a><br/>
			</div>
			<div style="width: 100%;text-align: left; border: 1px ;padding-top:15px;float: left;">		
				<a href="${pageContext.request.contextPath}/shoppingcar.jsp">我的购物车</a>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;	
				<a href="${pageContext.request.contextPath}/showOrderList">历史订单</a><br/>
			</div>
			<div style="width: 100%;text-align:left; border: 1px ;padding-top:15px;float: left;">		
				<a href="${pageContext.request.contextPath}/clientShowAllProduct">返回首页</a><br/>
			</div>			
		</div>	
	</div>
</body>
</html>