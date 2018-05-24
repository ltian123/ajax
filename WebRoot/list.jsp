<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript">
  	function show(id,e){
<%--  		alert(id);--%>
  		var xmlHttpRequest = new XMLHttpRequest();
  		xmlHttpRequest.open("get", "${pageContext.request.contextPath}/showUser?id="+id,true);
  		
  		xmlHttpRequest.onreadystatechange=function(){
  			if(xmlHttpRequest.status==200 && xmlHttpRequest.readyState==4){
  				var result = xmlHttpRequest.responseText;
  				var user = eval("("+result+")");
<%--  				alert(user);--%>
<%--				alert(e.clientX);--%>
				document.getElementById("d").style.left=parseInt(e.clientX)+20+"px";
				document.getElementById("d").style.top=e.clientY;
				document.getElementById("d").style.display="block";
				document.getElementById("id").innerHTML=user.id;
				document.getElementById("name").innerHTML=user.username;
				document.getElementById("phone").innerHTML=user.phone;
				document.getElementById("address").innerHTML=user.address;
				
  			}
  		}
  		
  		
  		xmlHttpRequest.send(null);
  	}
  	
  	function hide(){
  		document.getElementById("d").style.display="none";
  	}
  </script>
  </head>
  
  <body>
  	<c:forEach items="${users }" var="user">
	    <li onmouseover="show(${user.id},event)" onmouseout="hide()">${user.username }</li>
  	</c:forEach>
    <hr/>
    <div id="d" style="background: gray;width: 40%;padding: 8px;position: absolute;display: none;">
    	编号:<div id="id" style="display: inline;"></div><br/>
    	姓名:<div id="name" style="display: inline;"></div><br/>
    	电话:<div id="phone" style="display: inline;"></div><br/>
    	地址:<div id="address" style="display: inline;"></div><br/>
    </div>
  </body>
</html>
