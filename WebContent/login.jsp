<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
		<script type="text/javascript" src="js/jquery.validate.js" ></script>
		<script type="text/javascript" src="js/messages_zh.js" ></script>
<script type="text/javascript">
$(function(){
	$("#myform").validate({
		rules:{
			username:{
				required:true,
				minlength:2
			},
			password:{
				required:true,
				minlength:6
			}
		} ,
		messages:{
			username:{
				required:"用户名不能为空",
				minlength:"用户名不能少于2位"
			},
			password:{
				required:"密码不能为空",
				minlenthd:"密码不能少于6位"
			}
		}					 
	});
});	
</script>
</head>
<body>
<form id="myform" action="${pageContext.request.contextPath }/loginServlet" onsubmit="return check()" method="post">			
		<table id="mtb" align="center" border="1px" cellpadding="0px" cellspacing="0px" width="80%">				
					<caption>用户登录</caption>				
				<tr id="tr1"  onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="50%" align="center">用户名</td>
					<td width="50%" >
						<input type="text" id="ue" name="username"/>
						<!-- <span id="sp1"></span> -->
					</td>
				</tr>
				<tr id="tr2"  onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="50%" align="center">密码</td>
					<td width="50%" >
						<input type="password" id="pd" name="password"/>
						<!-- <span id="sp2"></span> -->
					</td>
				</tr>
				<tr id="tr3"  onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="50%" align="center">验证码</td>
					<td width="50%" align="center">
						<input type="text" name="checkcode" width="50%">
						<img src="${pageContext.request.contextPath }/checkImgServlet" onclick="changeImg(this)" width="50%"/>
					</td>
				</tr>
				<tr id="tr3"  onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >					
					<td colspan="2" width="50%" align="center">
						<input type="checkbox" name="autologin" value="al"/>   自动登录
					</td>
				</tr>
				<tr id="tr4"   onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td colspan="2" width="100%">
						<table width="100%">
							<tr >
								<td width="33%" align="right">
									<input type="submit" value="登录"/>						
								</td>	
								<td width="33%" align="center">
									<input type="reset"  value="重置"/>
								</td>
								<td width="33%" align="left"> 
										<input type="button"  value="返回"/>
								</td>
							</tr>
						</table>
					</td>
				<tr id="tr5"   onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td colspan="2" width="100%" align="center">
					<font color="red"><%=request.getAttribute("message")==null?"":request.getAttribute("message") %></font>					
					</td>
				</tr>			
			</table>			
		</form>	
</body>
<script>	
		function change(id,info){
			var tr=document.getElementById(id);
			if(info=="over"){
				tr.style.backgroundColor="blueviolet";
			}
			if(info=="out"){
				tr.style.backgroundColor="white";
			}
		}
		function changeImg(obj){
			obj.src="${pageContext.request.contextPath}/checkImgServlet?time="+new Date().getTime();
		}
	</script>
</html>