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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">	
	function deletePro(pid) {
	var con = confirm("确定要删除我吗？");
	if (con) {
		location.href = "${pageContext.request.contextPath }/adminDeleteProduct?pid="
				+ pid;
		}
	}
	function addProduct() {
		location.href = "${pageContext.request.contextPath }/adminShowAddProduct";
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
		var allBox=document.getElementsByName("allBox");
		var boxes=document.getElementsByName("deleteBox");
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
							"<div onmouseover='overfn(this)' onclick='clickfn(this)' onmouseout='outfn(this)'>"
							+data[i].pname+"</div>";
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
	<table width="100%" cellpadding="0px" cellspacing="0px" border="1px">
		<caption>商品列表</caption>
		<tr>
			<td align="left" colspan="7" width="100%">
			
			<form  action="${pageContext.request.contextPath }/adminSearchProductList" method="post">
				<table>
				<tr>
				<td>				
				<div style="float:left">																	
						<div>
							 商品名称<input id="searchInput" type="text" name="pname" value="${condition.pname }"  size="100px" onkeyup="searchfn(this)" />
						</div>
						<div style="position:relative;width:275px">
							<div id="searchContentDiv" style="position:absolute;
							border:1px solid #999999;width:231px;display:none">	
							</div>
						</div>	
				</div>	
						&nbsp; &nbsp; &nbsp;
				<div style="float: left">
			  			是否热门<select name="is_hot" id="si">
								<option value="">--请选择--</option>
								<option value="1">是</option>
								<option value="0">否</option>
								</select>	
								&nbsp; &nbsp; &nbsp;
						 所属分类 <select name="cid" id="sc">
								<option value="">--请选择--</option>
									<c:forEach items="${categoryList}" var="cate">
								<option value="${cate.cid }">${cate.cname }</option>
									</c:forEach>
								</select>&nbsp; &nbsp; &nbsp; 
							<input type="submit" value="搜索" /> 
							<a href="${pageContext.request.contextPath }/adminShowProductListByLimit">清除</a>		
				</div>
				</td>
				</tr>	
				</table>									
				</form>				
			</td>
		</tr>
		<tr align="right">
			<td colspan="7" width="100%">
				<button onclick="addProduct()">添加商品</button>
			</td>
		</tr>
		<tr>
		<td>		
		<form action="${pageContext.request.contextPath }/adminDeleteAllProduct" >
		<table width="100%">
		<tr>
			<td align="center" width="10%">序号</td>
			<td align="center" width="10%">图片</td>
			<td align="center" width="40%">名称</td>
			<td align="center" width="10%">门店价格</td>
			<td align="center" width="10%">是否热门</td>
			<td align="center" width="10%">编辑</td>
			<td align="center" width="10%">删除</td>
		</tr>		
			<c:forEach items="${pageBean.pageData}" var="pro" varStatus="vs">
				<tr>
					<td align="center">${(pageBean.currentPage-1)*pageBean.currentCount+vs.count}</td>
					<td align="center"><img
					src="${pageContext.request.contextPath }/images/${pro.pimage }"
					width="40px" height="45px" /></td>
					<td align="center">${pro.pname}</td>
					<td align="center">${pro.shop_price}</td>
					<td align="center">${pro.is_hot==1?"是":"否"}</td>
					<td align="center"><a
					href="${pageContext.request.contextPath}/adminShowEditProduct?pid=${pro.pid }">编辑</a>
					</td>
					<td align="center"><a href="javascript:void(0)"
					onclick="deletePro('${pro.pid}')">删除</a>
					<input type="checkbox" name="deleteBox" value="${pro.pid}" />
					</td>
				</tr>				
			</c:forEach>
			<c:if test="${pageBean.totalCount!=0}">
			<tr>
			<td colspan="7" width="100%" >
			<div style="text-algin: center">			
				<ul id="pageUl" >
					<c:if test="${pageBean.currentPage==1}">
						<li><a>上一页</a></li>
					</c:if>
					<c:if test="${pageBean.currentPage!=1}">
						<li><a
							href="${pageContext.request.contextPath}/adminShowProductListByLimit?currentPage=${pageBean.currentPage-1}">上一页</a></li>
					</c:if>
					<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
						<c:if test="${page==pageBean.currentPage}">
						<li><font size="30px" color="red">${page}</font></li>
						</c:if>
						<c:if test="${page!=pageBean.currentPage}">
							<li><a
							href="${pageContext.request.contextPath}/adminShowProductListByLimit?currentPage=${page}">${page}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageBean.currentPage==pageBean.totalPage}">
							<li><a>下一页</a></li>
					</c:if>
					<c:if test="${pageBean.currentPage!=pageBean.totalPage}">
							<li><a
							href="${pageContext.request.contextPath}/adminShowProductListByLimit?currentPage=${pageBean.currentPage+1}">下一页</a></li>
					</c:if>
				</ul>
			</div>			
			</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="7" align="right"><input id="allBox" type="checkBox" name="allBox" />
				全选/全不选 &nbsp; &nbsp; &nbsp; <input type="submit" value="删除" /></td>
			</tr>
			</table>
		</form>
		</td>
		</tr>		
		<%-- <tr>
		<td>	
				<form action="${pageContext.request.contextPath }/clientShowAllProduct">
					<table>
					<tr>
					<td>
					${pageBean.totalpage}
					选择每页显示页数<select name="currentCount">					
						<c:forEach begin="1" end="${pageBean.totalpage}"   var="page">
							<option  value="${page*10}" > ${page*10}</option>
						</c:forEach>
					</select>
					<input type="submit" value="选择"/>
					</td>
					</tr>
					</table>
				</form>
		</td>
		</tr> --%>		
		<tr>
			<td colspan="7" align="right">
			<a href="${pageContext.request.contextPath }/adminShowProductList">全部显示</a>
			</td>
		</tr>			
	</table>
</body>
</html>