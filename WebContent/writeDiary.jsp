<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.userName}">
	<c:redirect url="index.jsp"/>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 使用JQuery解决PNG图片背景不透明的问题 -->
	<script type="text/javascript" src="JS/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="JS/pluginpage.js"></script>
	<script type="text/javascript" src="JS/jquery.pngFix.pack.js"></script>
	<link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function(){
		$('div.examples').pngFix( );
	});
</script>
<!-- ******************************* -->
<title>写碎片日记</title>
<link rel="stylesheet" href="CSS/style.css">
<style>
#gridLayout { /*设置写日记的九宫格的<ul>标记的样式*/
	float: left; /*设置浮动方式*/
	list-style: none; /*不显示项目符号*/
	width: 99%; /*设置宽度为100%*/
	margin: 0px; /*设置外边距*/
	padding: 75px 0 0 0; /*设置内边距*/
	display: inline; /*设置显示方式*/
}

#gridLayout li { /*设置写日记的九宫格的<li>标记的样式*/
	width: 33%; /*设置宽度*/
	float: left; /*设置浮动方式*/
	height: 219px; /*设置高度*/
	padding: 0px; /*设置内边距*/
	margin: 0px; /*设置外边距*/
	display: inline; /*设置显示方式*/
}
#opt{									/*设置默认选项相关的<ul>标记的样式 */
	padding:0px 0px 0px 10px;	/*设置上、右、下内边距为0，左内边距为10*/
	margin:0px;					/*设置外边距*/
}
#opt li{								/*设置默认选项相关的<li>标记的样式 */
	width:99%;
	padding-top:5px 0px 0px 0px;
	font-size:14px;				/*设置字体大小为14像素*/
	height:25px;				/*设置高度*/
	clear:both;					/*左、右两侧不包含浮动内容*/
}
.cssContent{							/*设置内容的样式*/
	float:left;
	padding:0px 0px;					/*设置上、下内边距为40，左、右内边距为0*/
	display:inline;						/*设置显示方式*/
}
#weather{								/*设置天气相关<ul>标记的样式*/
	border:0px;
	padding:15px 0px 0px 30px;
	margin:20px;
	display:inline;

}
#weather li{							/*设置天气相关<li>标记的样式*/
	border:0px;
	width:90%;
	padding:10px;
	margin:0px;
	display:inline;	
}
.title text{
	   border-bottom:#666 1px solid;
	   border-left-width:0px;
	   border-right-width:0px;
	   border-top-width:0px;
	   text-align:center;
       margin:0 auto;
}
input{									/*设置输入框的样式*/
	font-size:20px;
	border-bottom:#666 1px dashed;
	border-left-width:0px;
	border-right-width:0px;
	border-top-width:0px;
	height:20px;
}
.title{									/*设置标题的样式*/
color:#0F6548;
font-weight:bold;
}
#writeDiary_bg{							/*设置日记背景的样式*/
width:760px;							/*设置宽度*/
height:760px;						/*设置高度*/
background-repeat:no-repeat;							/*设置背景不重复*/
background-image:url(images/diaryBg_00.jpg);						/*设置默认的背景图片*/
padding-top:30px;						/*设置顶边距*/
padding-left:15px;						/*设置左边距*/
margin-left:20px;
}
</style>
<script language="javascript">
function setTemplate(style){
	if(style=="Ocean"){
		document.getElementById("writeDiary_bg").style.backgroundImage="url(images/diaryBg_00.jpg)";
		/*document.getElementById("writeDiary_bg").style.width="738px";	//宽度
		document.getElementById("writeDiary_bg").style.height="751px";	//高度
		document.getElementById("writeDiary_bg").style.paddingTop="50px";//顶边距
		document.getElementById("writeDiary_bg").style.paddingLeft="53px";//左边距
		document.getElementById("template").value="默认";*/
	}else if(style=="Bear"){
		document.getElementById("writeDiary_bg").style.backgroundImage="url(images/diaryBg_01.jpg)";
		/*document.getElementById("writeDiary_bg").style.width="750px";	//宽度
		document.getElementById("writeDiary_bg").style.height="629px";	//高度
		document.getElementById("writeDiary_bg").style.paddingTop="160px";//顶边距
		document.getElementById("writeDiary_bg").style.paddingLeft="50px";//左边距
		document.getElementById("template").value="女孩";*/
	}else{
		/*document.getElementById("writeDiary_bg").style.backgroundImage="url(images/diaryBg_02.jpg)";
		document.getElementById("writeDiary_bg").style.width="740px";	//宽度
		document.getElementById("writeDiary_bg").style.height="728px";	//高度
		document.getElementById("writeDiary_bg").style.paddingTop="30px";//顶边距
		document.getElementById("writeDiary_bg").style.paddingLeft="60px";	//左边距
		document.getElementById("template").value="怀旧";*/
	}
}
window.onload=function(){
	//alert("${sessionScope.grid}");
	var date=new Date();		//创建日期对象
	year=date.getFullYear();	//获取当前日期中的年份
	month=date.getMonth();		//获取当前日期中的月份
	day=date.getDate();			//获取当时日期中的日
	week=date.getDay();			//获取当前日期中的星期
	var arr=new Array("星期日","日期一","星期二","星期三","星期四","星期五","星期六");
	document.getElementById("now").innerHTML=year+"年"+(month+1)+"月"+day+"日 "+arr[week];
}

</script>
</head>
<body  style="background-color:#d4d5e0;
             background-image: url('images/body_repeat.png');
             background-repeat: repeat-x;
             background-position: center 0;">
<div style="background: url('images/body_bg_page.jpg') no-repeat top center;width:100%;">
<%@ include file="top.jsp" %>
<div id="box" style="padding-top:10px">
<c:if test="${empty sessionScope.userName}">
	<c:redirect url="index.jsp"/>
</c:if>
<form name="form1" method="post" action="DiaryServlet?action=preview">
<!--  <div style="margin:10px;"><span class="title">主题：</span><a href="#" onClick="setTemplate('默认')">默认</a> <a href="#" onClick="setTemplate('女孩')">女孩</a> <a href="#" onClick="setTemplate('怀旧')">怀旧</a>
	<input id="template" name="template" type="hidden" value="默认">
</div> -->
<div><span class="title" style="margin-left:20px;margin-top:30px;color:grey;">主题：</span>
<select onchange="setTemplate(this.value)" id="template" name="template" style="margin-left:0px; font-size: 14px;height:30px;">
  <option value ="Ocean">Ocean</option>
  <option value ="Bear">Bear</option>
</select>
</div>
<div style="margin-top:10px">
<span class="title" style="margin-left:20px;margin-top:20px;color:grey">权限：</span>
<select id="visibility" name="visibility" style="margin-left:0px; font-size:10px;height:30px">
  <option value ="1">公开</option>
  <option value ="0">仅自己可见</option>
</select>
</div>
<div style="margin:10px 0px 15px 300px;" class="title">
   <input name="title" type="text" size="20" maxlength="20" value="我的简言日记" style="text-align:center;font-size:20px;" onFocus="javascript:if(this.value=='我的简言日记')this.value='';">
   <b style="margin-left:20px;" onClick="document.getElementById('writemore').style.display='';document.getElementById('detail').focus();"><u>write more</u></b>
</div>
<div id="writeDiary_bg">

<span id="now" style="font-size: 14px;font-weight:bold;padding-left:5px;">正在获取日期</span>
<select name="weather" style="margin-left:10px; font-size: 10px;font-weight: bold;padding:0 0 0 0; width:80px;">
  <option value ="晴">晴</option>
  <option value ="阴">阴</option>
  <option value="晴转多云">晴转多云</option>
  <option value="雾">雾</option>
  <option value="雷阵雨">雷阵雨</option>
  <option value="小雨">小雨</option>
  <option value="大雨">大雨</option>
  <option value="中雨">中雨</option>
  <option value="暴雨">暴雨</option>
  <option value="大雪">大雪</option>
  <option value="小雪">小雪</option>
  <option value="中雪">中雪</option>
  <option value="雨">雨</option>
  <option value="冰雹">冰雹</option>
  <option value="多云">多云</option>
  <option value="雨夹雪">雨夹雪</option>
</select>
<div style="width:760px; height:760px;" >
<ul id="gridLayout">
<li>
	<div class="cssContent">
		<ul id="opt">
		<li>
	 	 <input style="height: 10px; font-size: 10px" name="content" type="text" size="28" maxlength="30" value="请在此输入文字" onFocus="javascript:if(this.value=='请在此输入文字')this.value='';">
	  	</li>
	   	<li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[0].value='${sessionScope.grid[0].firstline}'">◎ ${sessionScope.grid[0].firstline}</a></li>
	   	<li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[0].value='${sessionScope.grid[0].secondline}'">◎ ${sessionScope.grid[0].secondline}</a></li>
	   	<li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[0].value='${sessionScope.grid[0].thirdline}'">◎ ${sessionScope.grid[0].thirdline}</a></li>
	  	<li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[0].value='${sessionScope.grid[0].fourthline}'">◎ ${sessionScope.grid[0].fourthline}</a></li>
	  	</ul>
	</div>
</li>
<li>
	<div class="cssContent">
		<ul id="opt">
		<li>
	  <input style="height: 10px; font-size: 10px" name="content" type="text" size="28" maxlength="30" value="请在此输入文字" onFocus="javascript:if(this.value=='请在此输入文字')this.value='';">
	  </li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[1].value='${sessionScope.grid[1].firstline}'">◎ ${sessionScope.grid[1].firstline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[1].value='${sessionScope.grid[1].secondline}'">◎ ${sessionScope.grid[1].secondline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[1].value='${sessionScope.grid[1].thirdline}'">◎ ${sessionScope.grid[1].thirdline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[1].value='${sessionScope.grid[1].fourthline}'">◎ ${sessionScope.grid[1].fourthline}</a></li></ul>
	</div>
</li>
<li>
	<div class="cssContent">
		<ul id="opt">
		<li>
	  <input style="height: 10px; font-size: 10px" name="content" type="text" size="28" maxlength="30" value="请在此输入文字" onFocus="javascript:if(this.value=='请在此输入文字')this.value='';">
	  </li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[2].value='${sessionScope.grid[2].firstline}'">◎ ${sessionScope.grid[2].firstline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[2].value='${sessionScope.grid[2].secondline}'">◎ ${sessionScope.grid[2].secondline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[2].value='${sessionScope.grid[2].thirdline}'">◎ ${sessionScope.grid[2].thirdline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[2].value='${sessionScope.grid[2].fourthline}'">◎ ${sessionScope.grid[2].fourthline}</a></li></ul>
	</div>
</li>
<li>
	<div class="cssContent">
		<ul id="opt">
		<li>
	  <input style="height: 10px; font-size: 10px" name="content" type="text" size="28" maxlength="30" value="请在此输入文字" onFocus="javascript:if(this.value=='请在此输入文字')this.value='';">
	  </li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[3].value='${sessionScope.grid[3].firstline}'">◎ ${sessionScope.grid[3].firstline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[3].value='${sessionScope.grid[3].secondline}'">◎  ${sessionScope.grid[3].secondline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[3].value='${sessionScope.grid[3].thirdline}'">◎ ${sessionScope.grid[3].thirdline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[3].value='${sessionScope.grid[3].fourthline}'">◎ ${sessionScope.grid[3].fourthline}</a></li></ul>
	</div>
</li>
<li>
	<ul id="weather"><li style="height:27px;"> <!-- <span id="now" style="font-size: 14px;font-weight:bold;padding-left:5px;">正在获取日期</span> -->
		<input name="content" type="hidden" value="weathervalue"><br></br>
		<div class="examples">
		<!-- <input name="weather" type="radio" value="1">
		<img src="images/1.png" width="30" height="30">
		<input name="weather" type="radio" value="2">
  		<img src="images/2.png" width="30" height="30">
		<input name="weather" type="radio" value="3">
  		<img src="images/3.png" width="30" height="30">
		<input name="weather" type="radio" value="4">
  		<img src="images/4.png" width="30" height="30">
		<input name="weather" type="radio" value="5" checked="checked">
  		<img src="images/5.png" width="30" height="30">
		<input name="weather" type="radio" value="6">
  		<img src="images/6.png" width="30" height="30">
		<input name="weather" type="radio" value="7">
  		<img src="images/7.png" width="30" height="30">
		<input name="weather" type="radio" value="8">
  		<img src="images/8.png" width="30" height="30">
		<input name="weather" type="radio" value="9">
  		<img src="images/9.png" width="30" height="30">
  		</div> --> 
	</li>
  	</ul>
</li>
<li>
	<div class="cssContent">
		<ul id="opt">
		<li>
	  <input style="height: 10px; font-size: 10px" style="height: 10px; font-size: 10px" name="content" type="text" size="15" maxlength="30" value="请在此输入文字" onFocus="javascript:if(this.value=='请在此输入文字')this.value='';">
	  </li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[5].value='${sessionScope.grid[4].firstline}'">◎ ${sessionScope.grid[4].firstline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[5].value='${sessionScope.grid[4].secondline}'">◎ ${sessionScope.grid[4].secondline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[5].value='${sessionScope.grid[4].thirdline}'">◎ ${sessionScope.grid[4].thirdline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[5].value='${sessionScope.grid[4].fourthline}'">◎ ${sessionScope.grid[4].fourthline}</a></li></ul>
	</div>
</li>
<li>
	<div class="cssContent">
		<ul id="opt">
		<li>
	  <input style="height: 10px; font-size: 10px" name="content" type="text" size="28" maxlength="30" value="请在此输入文字" onFocus="javascript:if(this.value=='请在此输入文字')this.value='';">
	  </li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[6].value='${sessionScope.grid[5].firstline}'">◎ ${sessionScope.grid[5].firstline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[6].value='${sessionScope.grid[5].secondline}'">◎ ${sessionScope.grid[5].secondline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[6].value='${sessionScope.grid[5].thirdline}'">◎ ${sessionScope.grid[5].thirdline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[6].value='${sessionScope.grid[5].fourthline}'">◎ ${sessionScope.grid[5].fourthline}</a></li></ul>
	</div>
</li>
<li>
	<div class="cssContent">
		<ul id="opt">
		<li>
	  <input style="height: 10px; font-size: 10px" name="content" type="text" size="28" maxlength="30" value="请在此输入文字" onFocus="javascript:if(this.value=='请在此输入文字')this.value='';">
	  </li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[7].value='${sessionScope.grid[6].firstline}'">◎ ${sessionScope.grid[6].firstline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[7].value='${sessionScope.grid[6].secondline}'">◎ ${sessionScope.grid[6].secondline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[7].value='${sessionScope.grid[6].thirdline}'">◎ ${sessionScope.grid[6].thirdline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[7].value='${sessionScope.grid[6].fourthline}'">◎ ${sessionScope.grid[6].fourthline}</a></li></ul>
	</div>
</li>
<li>
	<div class="cssContent">
		<ul id="opt">
		<li>
	  <input style="height: 10px; font-size: 10px" name="content" type="text" size="28" maxlength="30" value="请在此输入文字" onFocus="javascript:if(this.value=='请在此输入文字')this.value='';">
	  </li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[8].value='${sessionScope.grid[7].firstline}'">◎ ${sessionScope.grid[7].firstline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[8].value='${sessionScope.grid[7].secondline}'">◎ ${sessionScope.grid[7].secondline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[8].value='${sessionScope.grid[7].thirdline}'">◎ ${sessionScope.grid[7].thirdline}</a></li>
	   <li><a href="javascript:void(0)" onClick="document.getElementsByName('content')[8].value='${sessionScope.grid[7].fourthline}'">◎ ${sessionScope.grid[7].fourthline}</a></li></ul>
	</div>
</li>
</ul>
</div>



</div>
<div id="writemore" style="display:none">
   <textarea id="detail" name="detail" style="width:730px;height:150px;margin-left:20px;margin-bottom:20px;"></textarea>
</div>
<div style="height:30px;padding-bottom:10px;">
   <input type="submit" value="预览" class="button button-primary" style="margin-left:370px;">
   <!-- <input formaction="DiaryServlet?action=save" type="submit" value="保存" style="margin-left:10px;"> -->
</div>
</form>
</div>
</div>
<div id="box1">
<%@ include file="bottom.jsp" %>
</div>
</body>
</html>