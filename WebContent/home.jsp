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
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script>
var i=1;
$(function(){
	setInterval(fn,2000);	
	});
function fn(){				
	var roll=document.getElementById("roll");
	roll.src="images/img/bb"+i+".jpg";
	i++;
	if(i==5){
		i=1;
	}
}			
window.onload = function() {
	var cid = "${condition.cid}"
	var sc = document.getElementById("sc");
	var options = sc.getElementsByTagName("option");
	for (var i = 0; i < options.length; i++) {
		if (cid == options[i].value) {
			options[i].selected = true;
		}
	}
	var is_hot = "${condition.is_hot}"
	var si = document.getElementById("si");
	var options1 = si.getElementsByTagName("option");
	for (var i = 0; i < options1.length; i++) {
		if (is_hot == options1[i].value) {
			options1[i].selected = true;
		}
	}
}
//搜索异步刷新提示
			function searchfn(obj){
				$.post(
					"${pageContext.request.contextPath}/searchServlet",
					{"word":obj.value},
					function(data){
						var content="";
						if(data!=null){
							//服务器返回的数据是一个json数组，因此可以使用数组的length属性
							for(var i=0;i<data.length;i++){
								content+=
									"<div> <font onmouseover='overfn(this)' onclick='clickfn(this)' onmouseout='outfn(this)' color='green' size='4'> "
									+data[i].pname+"</font></div>";
							}
							//设置div的开始和结束标签之间的html内容
							$("#searchContentDiv").html(content);
							$("#searchContentDiv").css("display","block");
						}
						
					},
					"json"
				);
			}
			function clickfn(obj){
				//获取obj这个div内的内容
				//$(obj).html()
				//val:是设置表单标签input的value属性的值
				$("#searchInput").val($(obj).html());
				$("#searchContentDiv").css("display","none");				
			}
			function overfn(obj){
				$(obj).css("background-color","#999");
			}
			function outfn(obj){
				$(obj).css("background-color","#fff");
			}
	</script>
</head>
<body>
		<div id="father">
			<div>
				<img id="show" src="images/img/ad.jpg" style="display: none;"/>
			</div>
			<div id="logo" >
				<div id="logo1">
					<img alt="找不到图片" src="images/img/mylogo.png" />
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
					
					<a href="${pageContext.request.contextPath}/register.jsp" target="_blank">注册</a>
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
				<img id="roll" src="images/img/bb1.jpg" alt="找不到此照片" width="100%"/>
		</div>
		<div id="navigation1">
			<form  action="${pageContext.request.contextPath }/clientSearchProductList" method="post">
				<table>
				<tr>
				<td>				
				<div style="float:left">																	
						<div>
							 <font color="darkred" >商品名称</font><input id="searchInput" type="text" name="pname" value="${condition.pname }"  size="40px" onkeyup="searchfn(this)" />
						</div>
						<div  style="position:relative;width:335px;margin-left:64px">
							<div id="searchContentDiv" style="position:absolute;
							border:1px solid #999999;width:271px;display:none">	
							</div>
						</div> &nbsp; &nbsp;&nbsp;
				</div>						
				<div style="float:left">				
			  			<font color="darkred" >是否热门&nbsp;</font><select name="is_hot" id="si">
								<option value="">--请选择--</option>
								<option value="1">是</option>
								<option value="0">否</option>
								</select>&nbsp; &nbsp; &nbsp;
				</div>								
				<div style="float:left">
						<font color="darkred" > 所属分类 </font>
						<select name="cid" id="sc">
								<option value="">--请选择--</option>
									<c:forEach items="${categoryList}" var="cate">
								<option value="${cate.cid }">${cate.cname }</option>
									</c:forEach>
								</select>&nbsp; &nbsp; &nbsp;
						<input type="submit" value="搜索" /> &nbsp;
						<a href="${pageContext.request.contextPath }/clientShowAllProduct">清除</a>
				</div>						
				<div class="clear"> </div>
				</td>
				</tr>	
				</table>									
			</form>			
		</div>
		<div class="clear"> </div>
		<div>				
			<img src="images/img/tittle1.png" alt="找不到此照片" width="100%"/>								
		</div>
		<div style="width: 100%;">
			<c:forEach items="${pageBean.pageData}" var="product">
				<div style="width: 220px; height:300px; padding-top: 10px; text-align: center; border: 1px solid black; float: left;">
					<div><img style="width: 150px; height: 150px; text-align:center;" src="images/${product.pimage} " /></div>
					<div><p><font color="brown" size="4">${product.pname}</font></p></div>
					<div><p><font color="brown" size="4">${product.shop_price}</font></p></div>				
					<div><a href="${pageContext.request.contextPath}/clientShowProduct?pid=${product.pid}">商品详情</a></div>
				</div>				
			</c:forEach>		
		</div>
		<div class="clear"> </div>
			<c:if test="${pageBean.totalCount!=0}">
				<div style="text-algin:center">			
					<ul id="pageUl" style="text-algin:center">
						<c:if test="${pageBean.currentPage==1}">
							<li><a>上一页</a></li>
						</c:if>
						<c:if test="${pageBean.currentPage!=1}">
							<li><a href="${pageContext.request.contextPath}/clientShowAllProduct?currentPage=${pageBean.currentPage-1}">上一页</a></li>
						</c:if>
					<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
						<c:if test="${page==pageBean.currentPage}">
						<li><font size="30px" color="red">${page}</font></li>
						</c:if>
						<c:if test="${page!=pageBean.currentPage}">
							<li><a href="${pageContext.request.contextPath}/clientShowAllProduct?currentPage=${page}">${page}</a></li>
						</c:if>
					</c:forEach>
						<c:if test="${pageBean.currentPage==pageBean.totalPage}">
							<li><a>下一页</a></li>
						</c:if>
						<c:if test="${pageBean.currentPage!=pageBean.totalPage}">
							<li><a
							href="${pageContext.request.contextPath}/clientShowAllProduct?currentPage=${pageBean.currentPage+1}">下一页</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>		
		<div>
				<img alt="找不到照片" src="images/img/tittle2.png" width="100%"/>
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
		</div>
		<div class="last">
				<p>Copyright &copy;2010-2017 千锋商城 版权所有</p>
		</div>
	</div>
	</body>
</html>
