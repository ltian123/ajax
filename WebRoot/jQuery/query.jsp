<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
  <style type="text/css">
  	li{
  		list-style: none;
  	}
  	#d{
  		display:none;
  		background-color:gray;
  		width:200px;
  		max-height:100px;
  		overflow: auto;
  		padding: 0px 5px;
  		position: relative;
  	}
  </style>
  <script type="text/javascript">
  $(function(){
	 $("#key").keyup(function(){
		$("#d").empty();
<%--		alert($(this).val());--%>
		
		if($("#key").val() == ""){
			$("#d").hide();
			return;
		}
		
		$.getJSON(
			"${pageContext.request.contextPath}/query",
			{"key":$(this).val()},
			function(datas){
<%--				alert(datas);--%>
				$("#d").show();

				$(datas).each(function(){
<%--					alert(this.message);--%>
					var l = "<li>"+this.message+"</li>";
					$("#d").append($(l));					
					
				});
			});
		
		
	 }); 
  });
  
  </script>
  </head>
  
  <body>
    <input type="text" id="key" style="width:200px" onkeyup="query()"/>
    <div id="d">
    <li>aaa</li>
    </div>
  </body>
</html>
