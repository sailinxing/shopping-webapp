<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/adminAddProduct" method="post">
	<table width="100%" cellpadding="0px" cellspacing="0px" border="1px">
		<caption>添加商品</caption>
		<tr>
			<td align="center">商品名称</td>
			<td align="left"><input type="text" name="pname" size="50"/></td>
		</tr>
		<tr>
			<td align="center">商场价格</td>
			<td align="left"><input type="text" name="market_price" size="50"/></td>
		</tr>
		<tr>
			<td align="center">门店价格</td>
			<td align="left"><input type="text" name="shop_price" size="50"/></td>
		</tr>
		<tr>
			<td align="center">商品图片</td>
			<td align="left"><input type="file" name="pimage" size="50"/></td>
		</tr>
		<tr>
			<td align="center">所属分类</td>
			<td align="left">
				<select name="cid">
					<c:forEach items="${categoryList}" var="cate">
						<option value="${cate.cid }">${cate.cname }</option>
					</c:forEach>				
				</select>			
			</td>
		</tr>
		<tr>
			<td align="center">商品描述</td>
			<td align="left">
				<textarea rows="10" cols="30" name="pdesc"></textarea>
			
			</td>
		</tr>
		<tr>
			<td align="center">是否上架</td>
			<td align="left">
				<select name="pflag">
					<option value="1">否</option>
					<option value="0">是</option>
				</select>			
			</td>
		</tr>
		<tr>
			<td align="center">是否热门</td>
			<td align="left">
				<select name="is_hot">
					<option value="1">是</option>
					<option value="0">否</option>
				</select>
			
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">确定</button>
				<button type="reset">重置</button>
				<button type="button" onclick="history.go(-1)">返回</button>
			</td>
		</tr>
	</table>
  </form>
</body>
</html>