<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
<link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预览九宫格日记</title>
<style>
ul{		/*设置<ul>标记的样式*/
	list-style: none;
}
li{		/*设置<li>标记的样式*/
	padding:5px;
}
</style>
<script language="javascript">
window.onload=function(){								//当页面载入后
	document.getElementById("diaryImg").src="CreateImg";
}
var i = false;
</script>
<script language="javascript">
function readmore(){
	//document.getElementById('reDefault'+id).onclick();//执行reDefault的单击事件
	//document.getElementById("diary"+id).style.display = "";//显示图片
	if(i){
	  document.getElementById('detail').style.display='none';
	  document.getElementById('diaryImg').style.display='';
	  document.getElementById('readmore').innerHTML='detail';
	  i = false;
	}else{
	  document.getElementById('detail').style.display='';
	  document.getElementById('diaryImg').style.display='none';
	  document.getElementById('readmore').innerHTML='back';
	  i = true;
	}
}
</script>
</head>
<body  bgcolor="#F0F0F0">
<div id="box">
<%@ include file="top.jsp" %>
<div>
<ul>
<li style="font-family:楷体; font-size:24px; margin: 10px 0 20px 310px">${sessionScope.title }
</li>
<li><b id="detail" name="detail" readonly="readonly" style="width:600px;height:600px;margin-left:80px;margin-bottom:20px;">${sessionScope.detail }</b></li>
<li style="padding-left:80px;margin-top:10px"><img src="images/loading.gif" name="diaryImg" id="diaryImg"/></li>
<li style="padding-left:350px;">
	<a href="#" onclick="history.back();">编辑</a> &nbsp;&nbsp;
	<a href="DiaryServlet?action=save">保存</a>
</li>
</ul>
</div>
<c:if test="${empty sessionScope.userName}">
	<c:redirect url="index.jsp"/>
</c:if>
 <%@ include file="bottom.jsp" %>
</div>
</body>
</html>