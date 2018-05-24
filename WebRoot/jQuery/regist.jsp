<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
  	
  	<script type="text/javascript">
  	$(function(){
  		$("#username").blur(function(){
  			var name = $(this).val();
<%--  			$.get("${pageContext.request.contextPath}/checkName?name="+name,--%>
<%--  					//message就是后台传过来的响应数据--%>
<%--  					function(message){--%>
<%--  				$("#s").text(message);--%>
<%--  			});--%>
			
<%--			$.post("${pageContext.request.contextPath}/checkName",--%>
<%--				{"name":name},--%>
<%--				function(message){--%>
<%--					$("#s").text(message);	--%>
<%--			});--%>

			$.post("${pageContext.request.contextPath}/checkName",
				$("#f").serialize(),
				function(message){
					$("#s").text(message);	
			});	

  		});
		$("#s").ajaxError(function(){
			$(this).html("<font color='red'>出现异常</font>")
		});
		
		$("#s").ajaxSuccess(function(){
			$(this).html("<font color='blue'>正确响应</font>")
		});
		$("#s1").ajaxStart(function(){
			$(this).html("<font color='green'>正在处理....</font>")
		});
		
		$("#s1").ajaxStop(function(){
			$(this).html("<font color='pink'>处理完成</font>")
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
