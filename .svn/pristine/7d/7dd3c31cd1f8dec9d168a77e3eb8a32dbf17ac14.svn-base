<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript">
  		function fn(){
  			var d = document.getElementById("d");
  			var user = {"name":"admin","age":28,"gender":"男"};
<%--  				alert(user.name);--%>
<%--  			d.innerHTML=user["name"];--%>
<%--  			d.innerHTML=user["age"];--%>
<%--  			d.innerHTML=d.innerHTML+"----"+user["gender"];--%>
			
			var user1 = {"name":{"first":"z","last":"n"}};
<%--			alert(user1.name.first);--%>
<%--			alert(user1.name["first"]);--%>
<%--			alert(user1["name"].first);--%>

			var people={"job":"it","User":user};
<%--			alert(people.job);--%>
<%--			alert(people["job"]);--%>
<%--			alert(people["User"].name);--%>
		
			var users = [{"name":"tom","gender":"男"},{"name":"alice","gender":"女"}];
<%--			alert(users[1].name);--%>
			
			var user2 = "{'name':'jack','gender':'man'}";
			alert(typeof user2);
			
			var u = eval("("+user2+")");
			alert(typeof u);
			
  		}
  	</script>
  </head>
  
  <body>
  <h1>JSON</h1>
  <hr/>
  
  <a href="javaScript:;" onclick="fn()">点击</a>
  <div id="d"></div>
  </body>
</html>
