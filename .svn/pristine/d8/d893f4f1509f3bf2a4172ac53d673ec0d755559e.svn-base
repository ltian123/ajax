<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript">
  		function f1(){
  			var xmlHttpRequest = new XMLHttpRequest();
  			alert(xmlHttpRequest);
  		}
  		
  		function f2(){
  			var xmlHttpRequest;
  			if(window.ActiveXObject){
  				xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
  				alert("ie下:"+xmlHttpRequest);
  			}else{
  				xmlHttpRequest = new XMLHttpRequest();
  				alert("通用:"+xmlHttpRequest);
  			}
  				
  		}
  		
  	</script>
  
  </head>
  
  <body>
  	<a href="javaScript:;" onclick="f1()">firefox</a><br/>
  	<a href="javaScript:;" onclick="f2()">ie</a>
  </body>
</html>
