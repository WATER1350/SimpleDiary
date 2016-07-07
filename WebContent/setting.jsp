<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设置</title>

<link href="CSS/dpl.css" rel="stylesheet">
<link href="CSS/bui.css" rel="stylesheet">
<script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
<script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
<script language="javascript">
function checkForm(form){
	if(form.username.value==""){
		alert("请输入用户名！");form.username.focus();return false;
	}
}
</script>
<style>
#forgetPwd1{
	float:left;
	list-style: none;
	padding:50px 0px 0px 200px;
}
#forgetPwd1 li{
	float:left;

}
.settingList{
    padding:10px 0px 0px 5px;
}
</style>
<body  style="background-color:#d4d5e0;
             background-image: url('images/body_repeat.png');
             background-repeat: repeat-x;
             background-position: center 0;">
<%@ include file="top.jsp" %>
<%@ include file="register.jsp" %>
<div id="box">
 <div id="content2" class="hidden">
      <form id="form4" name="form4" class="form-horizontal" action="DiaryServlet?action=uploadMusic" method="post" enctype="multipart/form-data"> 
        <div class="row">
          <div class="control-group span5">
            <img class="control-label" src="images/music.png" style="width:30px;height:30px;margin-right: 10px"></img>
            <div class="controls">
              <input type="file" class="input-normal control-text" name="music" id="music" style="margin-top: 5px">
            </div>
           </div>
		</div>
      </form>
 </div>
<div id="setting" style="height:350px; padding: 20px 0px 0px 30px;background-image:url('images/bear.png');">
<div class="settingList">
<ul>
<a href="resetPwd.jsp" style="font-size:15px">◎ 修改密码</a>
</ul>
<ul style="margin-top: 10px" id="modifyMusic">
<a href="javascript:void(0)" style="font-size:15px">◎ 更换音乐</a>
</ul>
<ul style="margin-top: 10px">
<a href="playSetting.jsp" style="font-size:15px">◎ 音乐设置</a>
</ul>
</div>
</div>
</div>
<!-- <div id="forgetPwd" style="height:356px;">
<form name="form_forgetPwd" method="post" action="UserServlet?action=forgetPwd1" onsubmit="return checkForm(this)">
<ul id="forgetPwd1">
	<li style="padding-top:5px;">请输入用户名： </li>
	<li><input type="text" name="username"> </li>
	 <li style="padding-left:10px;">
	 <input name="Submit" type="submit"  value="下一步">
	</li>
</ul>
</form>
 </div> -->
</div>
<div id="box1">
<%@ include file="bottom.jsp" %>
</div>
<script language="javascript">
BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
	  
	  var form = new Form.HForm({
	    srcNode : '#form4'
	  }).render();

    var dialog2 = new Overlay.Dialog({
          title:'Music',
          width:400,
          height:150,
          //配置DOM容器的编号
          contentId:'content2',
          success:function () {
             $("#form4").submit();
          }
        });
		$('#modifyMusic').on('click',function () {
		  dialog2.show();
		});
});
</script>
</body>
</html>