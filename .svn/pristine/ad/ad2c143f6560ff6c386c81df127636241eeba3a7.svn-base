<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
  <script type="text/javascript">
  $(function(){
	  $("li").mouseover(function(){
		  $("#d").show();
		  $.getJSON(
			"${pageContext.request.contextPath}/showUser",
			{"id":$(this).attr("id")},
			function(user){
				$("#id").text(user.id);
				$("#name").text(user.username);
				$("#phone").text(user.phone);
				$("#address").text(user.address);
			}
		  );
	  });
	  
	  $("li").mouseout(function(){
		  $("#d").hide();
	  });
  });
  </script>
  
  </head>
  
  <body>
  	<c:forEach items="${users }" var="user">
	    <li id="${user.id }">${user.username }</li>
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
