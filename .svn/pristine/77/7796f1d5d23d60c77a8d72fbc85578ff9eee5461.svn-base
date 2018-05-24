<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
  	function query(){
  		//获取输入框输入的值
  		var key = document.getElementById("key").value;
  		
  		//找到div的节点
  		var d = document.getElementById("d");
  		
  		//清空div中的内容
  		d.innerHTML="";
  		
  		if("" == key){
  			d.style.display="none";
  			return;
  		}
  		
  		var xmlHttpRequest = new XMLHttpRequest();
  		
  		xmlHttpRequest.open("get", "${pageContext.request.contextPath}/query?key="+key, true);
  		
  		xmlHttpRequest.onreadystatechange=function(){
			if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200){
				var result = xmlHttpRequest.responseText;
<%--				alert(result);--%>
<%--				alert(typeof result);--%>
				var datas = eval("("+result+")");
<%--				alert(datas);--%>
				//显示数据前先将div显示出来
				d.style.display="block";
				for(var i = 0; i < datas.length; i++){
					d.innerHTML=d.innerHTML+"<li>"+datas[i].message+"</li>";
				}
			}		
  		}
  		
  		xmlHttpRequest.send(null);
  		
  	}
  
  </script>
  </head>
  
  <body>
    <input type="text" id="key" style="width:200px" onkeyup="query()"/>
    <div id="d">
<%--    	<li>aaa</li>--%>
<%--    	<li>aaa</li>--%>
<%--    	<li>aaa</li>--%>
<%--    	<li>aaa</li>--%>
<%--    	<li>aaa</li>--%>
<%--    	<li>aaa</li>--%>
<%--    	<li>aaa</li>--%>
<%--    	<li>aaa</li>--%>
    	
    </div>
  </body>
</html>
