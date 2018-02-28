<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*" %>
<%@ page import="com.lixinxin.domain.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date;" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
	<script>
			var i=1;
			var timer;
			$(function(){
				setInterval(fn,2000);	
				timer =setTimeout(showAd,10000);
			});
			function fn(){				
				var roll=document.getElementById("roll");
				roll.src="images/img/b"+i+".jpg";
				i++;
				if(i==5){
					i=1;
				}
			}			
			function showAd(){
				//显式图片
				$("#show").slideDown(5000);
				clearTimeout(timer);
				//设置定时器
				timer = setTimeout(hiddenAd,10000);
			}
			function hiddenAd(){
				//隐藏图片
				$("#show").fadeOut(5000);
				clearTimeout(timer);
			}
	</script>
</head>
<body>
		<div id="father" style="width:100%;">
			<div>
				<img id="show" src="images/img/ad.jpg" style="display: none;"/>
			</div>
			<div id="logo" >
				<div id="logo1">
					<img alt="找不到图片" src="images/img/mylogo.png" style="width:100%;"/>
				</div>
				<div id="logo2">
					<c:if test="${empty user}">
					<font color="red">请登录！</font>					
						<a href="${pageContext.request.contextPath }/login.jsp" target="_blank">登录</a>
					</c:if>
					<c:if test="${!empty user}">
					<font color="red">欢迎您，${user.name}！您是第${Count}位访客！</font>
						<a href="${pageContext.request.contextPath }/quitServlet" >退出</a>
					</c:if>			
					<a href="${pageContext.request.contextPath}/registerServlet" target="_blank">注册</a>
					<a href="${pageContext.request.contextPath}/shoppingcar.jsp" target="_blank">购物车</a>
				</div>
			</div>
			<div class="clear"></div>
			<div id="navigation">
				<ul>
					<li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
					<li><a href="${pageContext.request.contextPath}/clientShowAllProduct">电子商品</a></li>
					<li><a href="${pageContext.request.contextPath}/index.jsp" target="_blank">家用电器</a></li>
					<li><a href="#">鞋帽箱包</a></li>
				</ul>				
			</div>
			<div>
				<img id="roll" src="images/img/b1.jpg" alt="找不到此照片" width="100%"/>
			</div>
			<div>				
				<img src="images/img/tittle1.png" alt="找不到此照片" width="100%"/>								
			</div>
			<div style="width:100%;">
				<c:forEach items="${listProduct }" var="product">
					<div style="width:220px;height: 250px;padding-top:10px;text-align:center;border:1px solid black;float: left;"><br/>
						<img style="width:150px;height:150px;text-align:center;" src="${product.pimage}" />
						<p>${product.pname}<br/>${product.shop_price}</p>
					</div>
				</c:forEach>
			</div>			
			
			<div class="clear"></div>
			<div>
				<div id="product_left">
					<img alt="找不到此照片"  src="images/img/banner_left.jpg"/>
				</div>
				<div id="product_right">
					<div class="product">
						<img src="images/img/small01.jpg" />							
						<p>咖啡机<br/>￥666</p>
					</div>
					<div class="product">
						<img src="images/img/small03.jpg" />							
						<p>电磁炉<br/>￥888</p>
					</div>
					<div class="product">
						<img src="images/img/small04.jpg" />							
						<p>电饭锅<br/>￥999</p>
					</div>
					<div class="product">
						<img src="images/img/small05.jpg" />							
						<p>饮水机<br/>￥1212</p>
					</div><br />
					<div class="product">
						<img src="images/img/small06.jpg" />							
						<p>洗衣机<br/>￥6666</p>
					</div>
					<div class="product">
						<img src="images/img/small07.jpg" />							
						<p>电磁炉<br/>￥999</p>
					</div>
					<div class="product">
						<img src="images/img/small08.jpg" />							
						<p>电饭锅<br/>￥1818</p>
					</div>
					<div class="product">
						<img src="images/img/small09.jpg" />							
						<p>电磁炉<br/>￥8888</p>
					</div>
				</div>
			</div>
			<div>
				<img alt="找不到照片" src="images/img/bottom.png" width="100%"/>
			</div>
			<div class="last">
				<a href="#">关于我们</a>
				<a href="#">联系我们 </a>
				<a href="#">招贤纳士</a>
				<a href="#">法律声明</a>
				<a href="#">友情链接</a>
				<a href="#">支付方式</a>
				<a href="#">配送方式</a>
				<a href="#">广告声明</a>
				<a href="${pageContext.request.contextPath }/admin/adminIndex.jsp">后台登录</a>				
			</div>
			<div class="last">
				<p>Copyright &copy;2010-2017 千锋商城 版权所有</p>
			</div>
		</div>
	</body>	
</html>
