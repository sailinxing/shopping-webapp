<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#pageUl li{
		display: inline;
		font-size:30px;
	}
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
function deletePro(pid) {
	var con = confirm("确定要删除我吗？");
	if (con) {
		location.href = "${pageContext.request.contextPath }/clientDeleteCar?pid="
				+ pid;
		}
	}
 function showCar(oid) {
	var conf = confirm("确定要看看我吗？");
	if (conf) {
		location.href = "${pageContext.request.contextPath}/showCar?oid="+oid;
		}
	} 
window.onload = function() {
	var allBox=document.getElementsByName("allBox");
	var boxes=document.getElementsByName("selectBox");
	allBox[0].onchange=function(){
		if(allBox[0].checked){
			for(var i=0;i<boxes.length;i++){
				boxes[i].checked=true;
			}
		}
		else{
				for(var i=0;i<boxes.length;i++){
					boxes[i].checked=false;
			}					
		}
	}
	for(var i=0;i<boxes.length;i++){
		boxes[i].onchange=function(){
		var res=true;
		for(var j=0;j<boxes.length;j++){
				if(boxes[j].checked!=true){
					res=false;
				}
			}
		if(res){
			allBox[0].checked=true;
			}
		else{
			allBox[0].checked=false;
			}
		}			
	}
}
</script>
</head>
<body>		
<form action="${pageContext.request.contextPath }/clientPay" method="post">
	<table width="100%" cellpadding="0px" cellspacing="0px" border="1px">
		<caption>购物车列表</caption>
		<tr>
			<td align="center" width="5%">序号</td>
			<td align="center" width="10%">图片</td>
			<td align="center" width="40%">名称</td>
			<td align="center" width="10%">门店价格</td>
			<td align="center" width="10%">是否热门</td>
			<td align="center" width="20%">删除</td>
			<td align="center" width="5%">选择</td>
		</tr>				
			<c:forEach items="${car}" var="pro" varStatus="vs">
				<tr>
					<td align="center">${vs.count}</td>
					<td align="center"><img
					src="${pageContext.request.contextPath }/images/${pro.pimage }"
					width="40px" height="45px" /></td>
					<td align="center">${pro.pname}</td>
					<td align="center">${pro.shop_price}</td>
					<td align="center">${pro.is_hot==1?"是":"否"}</td>
					<td align="center">
					<a href="javascript:void(0)"
					onclick="deletePro('${pro.pid}')">删除</a>				
					<td align="center">
						<input type="checkbox" name="selectBox"	value="${pro.pid}" />
					</td>				
				</tr>						
			</c:forEach>
		<tr>
			<td colspan="7" align="right"><input id="allBox" type="checkBox" name="allBox" />
				全选/全不选 &nbsp; &nbsp; &nbsp; <input type="submit" value="结算" />
			</td>
		</tr>
		<tr>
			<td colspan="7" align="center">
			<a href="${pageContext.request.contextPath }/clientShowAllProduct">返回商品</a>
			</td>
		</tr>		
		<tr>
			<td colspan="7" align="center">	
		<font color="red" size="12"><%=request.getAttribute("notice")==null?"":request.getAttribute("notice") %></font>			
			</td>
		</tr>
		 <tr>
			<td colspan="7" align="center">	
				<a href="javascript:void(0)"  onclick="showCar('${order.oid}')">订单详情</a><br/>
			</td>
		</tr>
		<tr>
			<td colspan="7" align="center">	
				<a href="${pageContext.request.contextPath}/showOrderList">历史订单</a><br/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>