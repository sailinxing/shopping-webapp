<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lixinxin.domain.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date;" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>基本模板</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/index_css.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    	#product div{
    		text-align:center;
    		padding:10px
    	}
    	
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script>
		/* 	var i=1;
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
			}		 */	
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
    <div class="container">
    	<!--logo-->
    	<div class="row">
    		<div>
				<img id="show" src="images/img/ad.jpg" style="display: none;"/>
			</div>
    		<div class="col-lg-9">
    			<img alt="找不到图片" src="images/img/mylogo.png" />
    		</div>
    		<div class="col-lg-3" style="padding-top: 20px;">
    				<c:if test="${empty user}">
					<font color="red">请登录!</font>
						<a href="${pageContext.request.contextPath }/login.jsp" target="_blank">登录</a>
					</c:if>
					<c:if test="${!empty user}">
					<font color="red">欢迎您,${user.name}！您是第${Count}位访客;</font>
						<a href="${pageContext.request.contextPath }/quitServlet" >退出</a>
					</c:if>
					
					<a href="${pageContext.request.contextPath}/register.jsp" target="_blank">注册</a>
					<a href="${pageContext.request.contextPath}/shoppingcar.jsp" target="_blank">购物车</a>
    		</div>    		
    	</div>
    	<!--滚播图-->
<div class="row">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
 	 <!-- Indicators -->
  				<ol class="carousel-indicators">
  				  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
   				 <li data-target="#carousel-example-generic" data-slide-to="1"></li>
   				 <li data-target="#carousel-example-generic" data-slide-to="2"></li>
   				 <li data-target="#carousel-example-generic" data-slide-to="3"></li>
  				</ol>

  <!-- Wrapper for slides -->
 	<div class="carousel-inner" role="listbox">
   		<div class="item active">
     	 <img src="images/img/bb1.jpg" alt="...">
     		 <div class="carousel-caption">        
    		</div>
 		</div>
    <div class="item">
      	<img src="images/img/bb2.jpg" alt="...">
      	<div class="carousel-caption">       
     	 </div>
   		 </div>   
 	</div>
  <!-- Controls -->
  	<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  	</a>
  	<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  	</a>
	</div>    		
</div>
    	<!--导航栏-->
  <div class="row" style="height: 50px;">
    <nav class="navbar navbar-default">
      <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">首页</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#">手机数码</a></li>
        <li><a href="#">家用电器</a></li>
        <li><a href="#">鞋帽箱包</a></li>
        <li><a href="#">厨房电器</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">全部分类<span class="caret"></span></a>
        	<ul class="dropdown-menu">
            	<li><a href="#">手机数码</a></li>
            	<li><a href="#">家用电器</a></li>
            	<li><a href="#">鞋帽箱包</a></li>
            	<li role="separator" class="divider"></li>
           		 <li><a href="#">厨房电器</a></li>
         	</ul>
        </li>
      </ul>     
 		<form class="navbar-form navbar-right" >
       		 <div class="form-group">
          		<input type="text" class="form-control" placeholder="Search">
        	</div>
        		<button type="submit" class="btn btn-default">搜索</button>
     	 </form>      
    </div><!-- /.navbar-collapse -->
  		</div><!-- /.container-fluid -->
	</nav>
</div>
    	<!--商品title-->
    	<div class="row" >    		
    		<div>				
				<img src="images/img/tittle1.png" alt="找不到此照片" width="100%"/>								
			</div>		
    	</div>
    	<!--商品列表-->
    	<div class="row">
    		<div class="col-lg-2 col-md-2 hidden-sm hidden-xs" style="padding: 0;">
    			<img src="images/img/banner_left.jpg" width="100%" height="400px"/>    			
    		</div>
    		<div class="col-lg-10 col-md-10">
    			<div id="product" class="row">    		
					<c:forEach items="${pageBean.pageData}" var="product">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
							<br/> 
							<img style="width: 150px; height: 150px; text-align: center;" src="images/${product.pimage} " />
							<p>${product.pname}<br/>${product.shop_price}</p><br/>					
							<a href="${pageContext.request.contextPath}/clientShowProduct?pid=${product.pid}">商品详情</a>
						</div>				
					</c:forEach>		
				</div>	
    		</div>    		
    	</div>  
    	<div class="clear"> </div>	  	
    	<div class="row">
		<c:if test="${pageBean.currentPage==1}">
		<div style="text-algin: center">			
				<ul id="pageUl">
					<c:if test="${pageBean.currentPage==1}">
						<li><a>上一页</a></li>
					</c:if>
					<c:if test="${pageBean.currentPage!=1}">
						<li><a
							href="${pageContext.request.contextPath}/clientShowAllProduct?currentPage=${pageBean.currentPage-1}">上一页</a></li>
					</c:if>
					<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
						<c:if test="${page==pageBean.currentPage}">
						<li><font size="30px" color="red">${page}</font></li>
						</c:if>
						<c:if test="${page!=pageBean.currentPage}">
							<li><a
							href="${pageContext.request.contextPath}/clientShowAllProduct?currentPage=${page}">${page}</a></li>
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
		</div>		
    	<!--商品列表-->
    	<div class="row">
    		<div>
				<img alt="找不到照片" src="images/img/tittle2.png" width="100%"/>
			</div>
    	</div>	    	
    	<!--承诺-->
    	<div class="row">
    		<div>
				<img alt="找不到照片" src="images/img/bottom.png" width="100%"/>
			</div>    		
    	</div>
    	<!--友情链接-->
    	<div class="row">
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
    	</div>
    	<!--copy-->
    	<div class="row">
    		<div class="last">
				<p>Copyright &copy;2010-2017 千锋商城 版权所有</p>
			</div>		
    	</div>
  </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="jquery-1.11.0.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap.min.js"></script>
  </body>
</html>