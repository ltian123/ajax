<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
  	<script type="text/javascript">
  	$(function(){
  		$("#username").blur(function(){
  			$.ajax({
  				type:"post",
  				url:"${pageContext.request.contextPath}/checkName",
  				data:{"name":$("#username").val()},
  				dataType:"text",
  				success:function(aaa){
  					$("#s").text(aaa);
  				},
  				error:function(data){
  					$("#s").text("出现异常");
  				}
  			});
  		});
  	});
  	</script>
  	
  </head>
  
  <body>
  <h1>用户注册</h1>
  <hr/>
  
  <form id="f" action="">
  	用户名:<input type="text" name="name" id="username"/>
  	<span id="s"></span><br/>
  	密码:<input type="password" name="password" /><br/>
  	<input type="submit" value="注册"/>
  	<span id="s1"></span>
  </form>
  
  </body>
</html>
