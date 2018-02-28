<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
		<script type="text/javascript" src="js/jquery.validate.js" ></script>
		<script type="text/javascript" src="js/messages_zh.js" ></script>
		<script>
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
						},
						repd:{
							required:true,
							equalTo:$("input[name='password']")
						},
						name:{
							required:true
						},
						email:{
							required:true,
							email:true
						},
						birthday:{
							required:true,
							dateISO:true
						},					
						sex:{
							required:true
						},						
						telephone:{
							required:true
						}, 
						introduce:{
							required:true
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
						},
						repd:{
							required:"确认密码不能为空",
							equalTo:"密码不一致"
						},
						name:{
							required:"真实姓名不能为空"
						},
						email:{
							required:"邮箱不能为空",
							email:"邮箱格式不正确"
						},
						birthday:{
							required:"生日不能为空",
							dateISO:"格式不正确"
						},					
						sex:{
							required:"性别不能为空"
						},						
						telephone:{
							required:"电话不能为空"
						}, 
						introduce:{
							required:"简介不能为空"
						}			
					}					 
				});
			});	
			$(function(){
				$("#ue").blur(
					function(){
						$.get(
							"${pageContext.request.contextPath}/checkUser",
							{"username":this.value},
							function(data){
								if(data!=null){
									var val = data.username;
									$("#span1").html("用户名已被注册");
								}else{
									$("#span1").html("用户名可以使用");
								}	
							},
							"json"
						);						
					}		
				);				
			});
		</script>
	<style type="text/css">
	#mtb{	
	width:80%;
	}
</style>
	</head>
	<body>		
		<form id="myform" action="${pageContext.request.contextPath }/registerServlet" onsubmit="return check()" method="post" >
			<table id="mtb"   border="1" align="center"  style="cellpadding:0px cellspacing:0px">				
					<caption>用户注册</caption>
				<tr id="tr1"  onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="20%" align="center">用户名</td>
					<td width="80%" >
						<input type="text" id="ue" name="username"/>
						<span id="span1"></span>
					</td>
				</tr>
				<tr id="tr2" onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')">
					<td width="20%" align="center">密码</td>
					<td width="80%" >
						<input type="password" id="pd" name="password"/>
					</td>
				</tr>
				<tr id="tr3" onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="20%" align="center" >确认密码</td>
					<td width="80%" >
						<input type="password" name="repd" />
					</td>
				</tr>
				<tr id="tr4" onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')">
					<td width="20%" align="center">真实姓名</td>
					<td width="80%" >
						<input type="text" name="name" id="ne"/>
					</td>
				</tr>
				<tr id="tr5" onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="20%" align="center">邮箱</td>
					<td width="80%" >
						<input type="email" id="el" name="email"/>
					</td>
				</tr>
				<tr id="tr6"   onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="20%" align="center">
					生日
					</td>
					<td width="80%" > 
						<input type="date" id="by" name="birthday"/>
					</td>
				</tr>
				<tr id="tr7"   onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="20%" align="center">性别</td>
					<td width="80%" >
						<input type="radio" name="sex" value="male"/>男
						<input type="radio" name="sex" value="female"/>女
						<label for="sex" class="error"></label>
					</td>
				</tr>
				<tr id="tr8"  onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="20%" align="center">电话号码</td>
					<td width="80%" >
						<input type="text"  name="telephone"/>
						<label for="telephone" class="error"></label>
					</td>					
				</tr>
				<tr  id="tr9"   onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="20%" align="center">简介</td>
					<td width="80%" >
						<textarea name="introduce"></textarea>
					</td>
				</tr>
				<tr id="tr10"  onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="20%" align="center">职业</td>
					<td width="80%" >
						<select name="job">
							<option>--请选择--</option>
							<option value="teacher">教师</option>
							<option value="student">学生</option>
							<option value="coder">程序猿</option>							
						</select>
					</td>
				</tr>
				<tr id="tr11"  onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="20%" align="center">城市</td>
					<td width="80%" >
						<select onchange="upd(this.value)" >
							<option>--请选择--</option>
							<option value="0">浙江省</option>
							<option value="1">江苏省</option>
							<option value="2">安徽省</option>
							<option value="3">北京市</option>
							<option value="4">上海市</option>
							<option value="5">广东省</option>
						</select>
						<select id="provice" name="adr">							
						</select>
					</td>
				</tr>	
				<tr id="tr12"   onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td width="20%" align="center">验证码</td>
					<td width="80%" align="center">
						<input type="text" name="checkcode" width="50%">
						<img src="${pageContext.request.contextPath}/checkImgServlet" onclick="changeImg(this)" width="50%"/>
						<c:if test="${empty message }">
						</c:if>
						<c:if test="${!empty message }">
							<font color="red">${message }</font>
						</c:if>
					</td>
				</tr>
				<tr id="tr13"  onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')" >
					<td colspan="2" width="100%">
						<table style="width:100%">
							<tr>
								<td width="33%" align="right">
									<input type="submit" value="提交"/>
						
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
		function upd(val){
			var provice=document.getElementById("provice");
			provice.length=0;
			var city=new Array();
			city[0]=new Array("杭州市","宁波市","温州市","嘉兴市","湖州市","绍兴市","金华市","衢州市","舟山市","台州市","丽水市");
			city[1]=new Array("南京市","无锡市","徐州市","常州市","苏州市","南通市","连云港市","淮安市","盐城市","扬州市","镇江市","泰州市","宿迁市");
			city[2]=new Array("合肥市","芜湖市","蚌埠市","淮南市","马鞍山市","淮北市","铜陵市","安庆市","黄山市","滁州市","阜阳市","宿州市","巢湖市","六安市","亳州市","池州市","宣城市");			
			city[3]=new Array("东城区","西城区","崇文区","宣武区","朝阳区","丰台区","石景山区","海淀区门","头沟区","房山区","通州区","顺义区","昌平区","大兴区","怀柔区","平谷区","密云县","延庆县");
			city[4]=new Array("黄浦区","卢湾区","徐汇区","长宁区","静安区","普陀区","闸北区","虹口区","杨浦区","闵行区","宝山区","嘉定区","浦东新区","金山区","松江区","青浦区","南汇区","奉贤区","崇明县");
			city[5]=new Array("广州市","韶关市","深圳市","珠海市","汕头市","佛山市","江门市","湛江市","茂名市","肇庆市","惠州市","梅州市","汕尾市","河源市","阳江市","清远市","东莞市","中山市","潮州市","揭阳市","云浮市");
			for(var i=0;i<city[val].length;i++){
				var textNode=document.createTextNode(city[val][i]);
				var optNode=document.createElement("option");
				optNode.appendChild(textNode);
				provice.appendChild(optNode);
			}			
		}
	</script>
</html>
