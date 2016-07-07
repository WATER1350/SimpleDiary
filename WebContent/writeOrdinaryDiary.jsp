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
<script type="text/javascript">
window.onload=function(){	
	if ("${sessionScope.videoName}" != "") {
		changeUploadFileType();
	}
}
    function changeUploadFileType(){
    	if ($('#uploadType').val() == "Picture") {
    		$('#uploadType').val("Video");
    		$('#uploadTitle').html('上传视频');
    	} else {
    		$('#uploadType').val("Picture");
    		$('#uploadTitle').html('上传图片');
    	}
    }
    function uploadFile() {
    	$('#uploadFile').click();
    }
	function previewOrdinaryDiary(form) {
		$('#form1').attr('action',"DiaryServlet?action=preview"+$('#uploadType').val());
		form.submit();
	}
	function saveOrdinaryDiary() {
		instance.post();
		var title = document.getElementById("title").value;
		var detail = document.getElementById("detail").value;
		var detail = instance.t.value;
		var visibility = document.getElementById("visibility").value;
		if("${sessionScope.pictureName}" != "") {
			type = "1"
		} else if("${sessionScope.videoName}" != ""){
			type = "2";
		} else{
			type = "3";
		}
		var param="title="+title+"&detail=" + detail + "&visibility=" + visibility + "&type=" + type;
		var loader=new net.AjaxRequest("DiaryServlet?action=save"+$("#uploadType").val(),deal_saveOrdinaryDiary,onerror,"POST",encodeURI(param));
	}
	function onerror(){
		alert("您的操作有误");
	}
	function deal_saveOrdinaryDiary(){
		/*****************显示提示信息******************************/
		var h=this.req.responseText;
		h=h.replace(/\s/g,"");	//去除字符串中的Unicode空白
		alert(h);
		if(h=="保存成功！"){
			window.location.href="DiaryServlet?action=listAllDiary";
		}else{
			history.back();
		}
	}
</script>
<!-- ******************************* -->
<title>写普通日记</title>
<link rel="stylesheet" href="CSS/style.css">
<link href="CSS/dpl.css" rel="stylesheet">
<link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
<link rel="stylesheet" href="style.css" />
<script type="text/javascript" src="tinyeditor.js"></script>
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
	font-size:12px;
}
.title{									/*设置标题的样式*/
color:#0F6548;
font-weight:bold;
}
.inputDetail select{
  
}
#writeDiary_bg{							/*设置日记背景的样式*/
width:760px;							/*设置宽度*/
padding-top:5px;						/*设置顶边距*/
padding-left:15px;						/*设置左边距*/
margin-left:20px;
margin-bottom:20px;
}
.teheader select {
float: left;
margin-top: 5px;
}
</style>
</head>
<body  style="background-color:#d4d5e0;
             background-image: url('images/body_repeat.png');
             background-repeat: repeat-x;
             background-position: center 0;">
<%@ include file="top.jsp" %>
<div id="box" style="padding:10px">
<c:if test="${empty sessionScope.userName}">
	<c:redirect url="index.jsp"/>
</c:if>
<div style="margin-top:10px">
</div>
<div style="margin:10px 0px 15px 300px;" class="title">
   <input name="title" id="title" type="text" size="20" maxlength="20" value="我的日记" style="text-align:center;font-size:20px;" onFocus="this.select()">
</div>
<div style="margin-top:10px">
<span class="title" style="margin-left:20px;margin-top:20px;color:grey;font-size: 15px">权限：</span>
<select id="visibility" name="visibility" style="margin-left:0px; font-size:10px;width:110px">
  <option value ="1">公开</option>
  <option value ="0">仅自己可见</option>
</select>
</div>
<div style="font-size: 18px; font-weight: bold; margin:10px 20px 10px 20px; border-bottom:1px solid #DDDDDD;padding-bottom:10px">
<b id="uploadTitle">上传图片</b>
<!-- <img src="images/changeUploadType.gif" name="changeUploadType" id="changeUploadType" style="margin-left:20px;max-length:20px;max-width: 20px" onClick="changeUploadFileType()"/>-->
<button class="button" style="width:20px;height:20px;padding:0;margin-left:15px;" onClick="changeUploadFileType()">换</button>
</div>
<input type='hidden' id="uploadType" value="Picture"/>
<c:if test="${(empty sessionScope.pictureName) and (empty sessionScope.videoName)}">
<div style="padding-bottom:0px; margin:5px 20px 0px 25px;">
<input type='image' name="imageField" src="images/uploadFile.png" style="width:200px;height:200px;margin-top:0px" OnClick='uploadFile()'/>
</div>
</c:if>
<form name="form1" id="form1" method="post" action="DiaryServlet?action=preview" enctype="multipart/form-data">
<div id="writeDiary_bg">
<input type="file" style="display:none" class="input-normal control-text" name="uploadFile" id="uploadFile" onChange="previewOrdinaryDiary(this.form)">
</div>
</form>
<c:if test="${!empty sessionScope.pictureName}">
<div style="align:center">
<img src="images/upload/${sessionScope.pictureName}" name="diaryImg" id="diaryImg" style="max-length:300px;max-width: 300px;margin:0 0 10px 50px;"/>
</div>
</c:if>
<!-- "Video For Everybody" http://camendesign.com/code/video_for_everybody -->
<%String url=request.getRequestURL().toString();%>
<%url=url.substring(0,url.lastIndexOf("/"));%>
<c:if test="${!empty sessionScope.videoName}">
<video controls="controls" poster="images/big-buck-bunny_poster.jpg" width="320" height="180" style="margin: 0 0 10px 50px">
	<source src="<%=url %>/videos/upload/${sessionScope.videoName}" type="video/mp4" />
	<!-- <source src="http://clips.vorwaerts-gmbh.de/big_buck_bunny.webm" type="video/webm" /> -->
	<!-- <source src="http://clips.vorwaerts-gmbh.de/big_buck_bunny.ogv" type="video/ogg" /> -->
	<object type="application/x-shockwave-flash" data="http://releases.flowplayer.org/swf/flowplayer-3.2.1.swf" width="640" height="360">
		<param name="movie" value="http://releases.flowplayer.org/swf/flowplayer-3.2.1.swf" />
		<param name="allowFullScreen" value="true" />
		<param name="wmode" value="transparent" />
		<param name="flashVars" value="config={'playlist':['http%3A%2F%2Fsandbox.thewikies.com%2Fvfe-generator%2Fimages%2Fbig-buck-bunny_poster.jpg',{'url':'http%3A%2F%2Fclips.vorwaerts-gmbh.de%2Fbig_buck_bunny.mp4','autoPlay':false}]}" />
		<img alt="Big Buck Bunny" src="http://sandbox.thewikies.com/vfe-generator/images/big-buck-bunny_poster.jpg" width="640" height="360" title="No video playback capabilities, please download the video below" />
	</object>
</video>
</c:if>
<div id="writemore" style="display:none">
   <!-- <textarea id="detail" name="detail" style="width:730px;height:150px;margin-left:20px;margin-bottom:20px;"></textarea> -->
</div>
<textarea id="detail" name="detail" style="width:400px; height:200px" class="inputDetail"></textarea>
<script type="text/javascript">
var instance = new TINY.editor.edit('editor',{
	id:'detail',
	width:750,
	height:300,
	cssclass:'te',
	controlclass:'tecontrol',
	rowclass:'teheader',
	dividerclass:'tedivider',
	controls:['bold','italic','underline','strikethrough','|','subscript','superscript','|',
			  'orderedlist','unorderedlist','|','outdent','indent','|','leftalign',
			  'centeralign','rightalign','blockjustify','|','unformat','|','undo','redo','n',
			  'font','size','style','|','image','hr','link','unlink','|','cut','copy','paste','print'],
	footer:true,
	fonts:['Verdana','Arial','Georgia','Trebuchet MS'],
	xhtml:true,
	cssfile:'style.css',
	bodyid:'editor',
	footerclass:'tefooter',
	toggle:{text:'source',activetext:'wysiwyg',cssclass:'toggle'},
	resize:{cssclass:'resize'}
});
</script>
<div style="height:30px;">
   <!-- <input type="submit" value="预览" style="margin-left:350px;" onClick="previewPicture()"> -->
   <input formaction="DiaryServlet?action=saveOrdinary" type="submit" value="保存" style="margin-left:360px;" onClick="saveOrdinaryDiary()">
</div>
</div>
<div id="box1">
<%@ include file="bottom.jsp" %>
</div>
</body>
</html>