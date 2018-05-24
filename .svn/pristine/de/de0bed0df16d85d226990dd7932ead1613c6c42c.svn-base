<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript">
  	var xmlHttpRquest;
  	function checkName(){
  		//获取Ajax引擎
  		xmlHttpRquest = new XMLHttpRequest();
  		
  		var name = document.getElementById("username").value;
  		
  		//准备请求信息
  		xmlHttpRquest.open("post", "${pageContext.request.contextPath}/checkName", true);
  		
  		//设置请求头
  		xmlHttpRquest.setRequestHeader("content-type", "application/x-www-form-urlenconded");
  		
  		//注册事件,当前状态改变,会自动调用注册的方法
		xmlHttpRquest.onreadystatechange=callBack;
  		//发送请求
  		xmlHttpRquest.send("name="+name);
  	}
  	
  	function callBack(){
	  	//当服务器已经响应结束的时候处理
		if(xmlHttpRquest.readyState==4){
			//当服务器响应的状态码是200时处理
			if(xmlHttpRquest.status==200){
				var result = xmlHttpRquest.responseText;
				document.getElementById("s").innerHTML=result;
			}else{
				document.getElementById("s").innerHTML="当前服务器响应失败";
			}
		}else{
<%--			document.getElementById("s1").innerHTML="正在执行中";--%>
		}
  	}
  </script>
  </head>
  
  <body>
  <h1>用户注册</h1>
  <hr/>
  
  <form action="">
  	用户名:<input type="text" name="username" id="username" onblur="checkName()"/>
  	<span id="s"></span><br/>
  	密码:<input type="password" name="password" /><br/>
  	<input type="submit" value="注册"/>
  	<span id="s1"></span>
  </form>
  
  </body>
</html>
