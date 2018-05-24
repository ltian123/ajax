<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript">
  	function hello(){
  		var xmlHttpRequest = new XMLHttpRequest();
  		
  		xmlHttpRequest.onreadystatechange=function(){
  			if(xmlHttpRequest.status==200 && xmlHttpRequest.readyState==4){
  				var result = xmlHttpRequest.responseText;
  				alert(result);
  			}
  		}
  		
  		xmlHttpRequest.open("get", "${pageContext.request.contextPath}/sayHello", true);
  		xmlHttpRequest.send(null);
  		
  			
  	}
  </script>
  
  </head>
  
  <body>
  	<input type="button" value="点击" onclick="hello()">
  </body>
</html>
