<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <style>
#notClickDiv{
	filter:alpha(Opacity=35);opacity:0.35;		/*设置不透明度为35%*/
	background:#000000;						/*设置背景为黑色*/
	position:absolute;							/*设置定位方式为绝对位置*/
	display:none;								/*设置该<div>标记显示*/
	z-index:9;									/*设置层叠顺序*/
	top:0px;									/*设置顶边距*/
	left:0px;									/*设置左边距*/
	margin: 0px;
	padding: 0px;
}
.W_nologin .loginBox {
  position: relative;
  padding: 0 15px;
  height: 300px;
  width: 270px;
}
.W_fl {
  float: left;
  _display: inline;
}
.clearfix {
  display: block;
}
</style>
<script language="javascript" src="JS/AjaxRequest.js"></script>


<script language="javascript">
$(document).ready(function(){
	
 if ("${sessionScope.userName}" != '') {
	 $('#pl_login_form').css('display','none');
	 $("#top").css('height', '300px');
 } else {
	 $('#pl_login_form').css('display','');
	 $("#top").css('height', '500px');
 }
});

function myClose(divID){
	 divID.style.display='none';			//设置id为login的层隐藏
     //设置id为notClickDiv的层隐藏
	 document.getElementById("notClickDiv").style.display='none';	
}
function Myopen(divID){ 								//根据传递的参数确定显示的层
     var notClickDiv=document.getElementById("notClickDiv");	//获取id为notClickDiv的层
	 notClickDiv.style.display='block';						//设置层显示
	 document.getElementById("notClickDiv").style.width=document.body.clientWidth;
	 document.getElementById("notClickDiv").style.height=document.body.clientHeight;
     document.getElementById(divID).style.display='block';							//设置由divID所指定的层显示	 
     document.getElementById(divID).style.left=(document.body.clientWidth-240)/2;		//设置由divID所指定的层的左边距
     document.getElementById(divID).style.top=(document.body.clientHeight-139)/2;		//设置由divID所指定的层的顶边框
}
function loginSubmit(form2){
	if(form2.username.value==""){		//验证用户名是否为空
		//alert("请输入用户名！");form2.username.focus();
		return false;
	}
	if(form2.pwd.value==""){		//验证密码是否为空
		//alert("请输入密码！");form2.pwd.focus();
		return false;
	}	
	var param="username="+form2.username.value+"&pwd="+form2.pwd.value; 	//将登录信息连接成字符串，作为发送请求的参数
	var loader=new net.AjaxRequest("UserServlet?action=login",deal_login,onerror,"POST",encodeURI(param));
}
function onerror(){
	alert("您的操作有误");
}
function deal_login(){
	/*****************显示提示信息******************************/
	var h=this.req.responseText;
	h=h.replace(/\s/g,"");	//去除字符串中的Unicode空白
	//alert(h);
	if(h=="登录成功！"){
		window.location.href="DiaryServlet?action=listAllDiary";
	}else{
		form2.username.value="";//清空用户名文本框 
		form2.pwd.value="";//清空密码文本框
		form2.username.focus();//让用户名文本框获得焦点
	}
	
}
</script>
<style>
#top{					/*设置页面头部的DIV样式*/
	background-image:url(images/bg_nologin2.jpg);
	//width:800px;
	//height:176px;
	width:100%;
	height:300px;
	margin-bottom:10px;
	border-bottom: 4px solid #ddd;
	background-repeat: repeat-x;
	background-size: cover;
}
#navigation{			/*设置导航条的样式*/
	background-image:url(images/navigation_bg.jpg);
	width:790px;
	height:26px;
	padding:5px 5px 0px 5px;
	margin: 0px;
}
#loginUl{				/*设置登录所用的<ul>标记的样式*/
	list-style:none;
	margin: 0px;
}
#loginUl li{			/*设置登录所用的<li>标记的样式*/
	padding: 5px;
}
#loginTitle{			/*设置登录窗口的标题样式*/
	padding:15px;
	background-color:#FCFBF0;
	color:#1B7F5D;
	font-size: 14px;
	font-weight:bold;
	margin:0px;
}
#login{
	position:absolute;	/*设置布局方式*/
	width:332px;		/*设置宽度*/
	height:260px;		/*设置高度*/
	display:none; 		/*设置显示方式*/
	z-index:10;		    /*设置层叠顺序*/
	//padding:4px;		/*设置内边距*/
	//background-color:#546B51;	/*设置背景颜色*/
	left:50%;
	top:50%;
	margin-left:-166px;  
    margin-top:-130px; 
}
.W_btn_a {
  background: #ff8140;
  border: 1px solid #f77c3d;
  color: #fff;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.25);
}
.W_nologin .btn_40px {
  height: 38px;
  line-height: 38px;
}
.W_nologin .W_login_form .login_btn .W_btn_a {
  padding: 0;
  width: 268px;
  font-size: 16px;
}
.W_label span, .W_label span {
  vertical-align: middle;
}
.W_nologin .S_txt2 {
  color: #ccc;
}
.W_nologin .W_login_form .auto_login span {
  margin-left: 3px;
}
input, textarea, select {
  font-family: inherit;
  font-size: inherit;
  font-weight: inherit;
}
.W_checkbox, .W_radio {
  vertical-align: middle;
  margin-right: 3px;
}
::selection {
  background: #eb7350;
  color: #fff;
}
.W_nologin .S_txt2 {
  color: #ccc;
}
.W_fr {
  float: right;
  _display: inline;
}
.W_nologin .W_login_form .auto_login {
  margin-bottom: 9px;
}
.W_nologin .W_login_form .password .enter_psw {
  position: absolute;
  top: 12px;
  left: 36px;
  color: #808080;
}
.W_nologin .W_login_form .password .input_wrap {
  position: relative;
  width: 268px;
  background-position: -39px -88px;
}
.W_nologin .W_login_form .info_list {
  margin-bottom: 10px;
}
.W_nologin .W_login_form .input_wrap .W_input {
  margin-left: 34px;
  width: 230px;
  border: none;
  box-shadow: none;
}
.W_nologin .W_login_form .input_wrap {
  padding: 5px 0;
  border: 1px solid transparent;
  border-radius: 2px;
  background-color: #FFF;
}
.W_nologin .W_login_form .username .input_wrap {
  width: 268px;
  background-position: 11px -88px;
}
.W_nologin .W_login_form .info_list {
  margin-bottom: 10px;
}
.W_nologin .W_login_form {
  position: relative;
  top: 0;
  left: 0;
}
.clearfix {
  display: block;
}
.W_nologin .info_header .tab a {
  float: left;
  margin-bottom: -1px;
  width: 50%;
  border-bottom: 3px solid transparent;
  color: #ccc;
  text-align: center;
  font-size: 16px;
  line-height: 30px;
  -webkit-transition: border .2s cubic-bezier(0.43, 0.37, 1, 1);
  -moz-transition: border .2s cubic-bezier(0.43, 0.37, 1, 1);
  transition: border .2s cubic-bezier(0.43, 0.37, 1, 1);
}
.W_nologin .def_slogan, .W_nologin .info_header .qrcode_target, .W_nologin .W_login_qrcode .qrcode, .W_nologin .W_login_form .username .input_wrap, .W_nologin .W_login_form .password .input_wrap, .W_nologin .W_login_form .phone .input_wrap, .W_nologin .cp_logo, .W_login_download .icon_common_b, .W_login_qrcode_v2 .bg, .W_nologin .info_header .qrcode_phone {
  background-image: url("images/sprite_login.png");
  background-repeat: no-repeat;
}
a {
  cursor: pointer;
}
.W_nologin .info_header .tab a.cur {
  border-bottom: 3px solid #fa7d3c;
  color: #FFF;
}
.W_nologin .info_header .tab {
  margin-bottom: 20px;
  padding-top: 11px;
  border-bottom: 1px solid #ccc;
  border-bottom-color: rgba(204,204,204,.5);
}
.W_nologin .info_header {
  position: relative;
}
.W_nologin .W_login_form .login_btn .W_btn_a {
  padding: 0;
  width: 268px;
  font-size: 16px;
}
.W_btn_a {
  background: #ff8140;
  border: 1px solid #f77c3d;
  color: #fff;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.25);
}
.W_btn_a, .W_btn_b, .W_btn_c, .W_btn_d {
  padding: 0 10px 0 10px;
  white-space: nowrap;
  display: inline-block;
  border-radius: 2px;
  height: 24px;
  line-height: 25px;
  text-decoration: none;
  font-size: 12px;
  min-width: 40px;
  text-align: center;
  outline: none;
}
.W_nologin .loginBox { position: relative; padding: 0 15px; height: 300px; width: 270px;}
.W_nologin .opacity { position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: #000; opacity: 0.3;}
.W_ficon { font-family: "wbficonregular" !important;  display: inline-block;  -webkit-font-smoothing: antialiased;}
.WB_global_nav{position:fixed;_position:absolute;top:0;left:0;z-index:9999;width:100%;height:48px; border-top:2px solid #fa7d3c;box-shadow:0 0 1px 0px rgba(0,0,0,0.15); background:#fff;}
</style>
<link rel="stylesheet" href="CSS/style.css" />
<link rel="stylesheet" type="text/css" href="CSS/reset.css">
<link rel="stylesheet" type="text/css" href="CSS/structure.css">
<div id="notClickDiv"></div>
<div style="padding-right:100px;text-align: right;height:40px;padding-top:12px;font-size:15px;font: 12px/18px Lucida Sans, sans-serif;filter:alpha(opacity=50); opacity: 0.85; " class="WB_global_nav WB_global_nav_alpha">
<c:if test="${empty sessionScope.userName}">
    <b style="color:#CC0000;">您还未登录！</b>
    <a href="DiaryServlet?action=listAllDiary"style="font-size:15px;margin-right:5px;margin-left:5px;"><img src="images/home.png"style="vertical-align:middle;margin-right:5px;"/>首页</a>	
	|<a href="javascript:void(0)" onClick="$('#pl_login_form').css('display','');"style="font-size:15px;margin-right:5px;margin-left:5px;">登录</a>
    |<a href="#" onClick="Regopen('register');$('#pl_login_form').css('display','none');"style="font-size:15px;margin-right:5px;margin-left:5px;">注册</a>
	|<a href="forgetPwd_1.jsp"style="font-size:15px;padding-right:50px;margin-right:5px;margin-left:5px;">找回密码</a>	 
</c:if>
<c:if test="${!empty sessionScope.userName}">
    <b style="font-size: 18px">${sessionScope.userName}</b>
    <a href="DiaryServlet?action=listAllDiary"style="font-size:16px;margin-right:5px;margin-left:5px;"><img src="images/home.png"style="vertical-align:middle;margin-right:2px;"/>首页</a>
    <i style="background-image: url(images/35.32-man160317105410.png);background-position:-458px-130px;"></i>		
	|<a href="DiaryServlet?action=listMyDiary"style="font-size:16px;margin-right:5px;margin-left:5px;"><img src="images/me.png"style="vertical-align:middle;margin-right:2px"/>我的日记</a>
	|<a href="DiaryServlet?action=writeDiary"style="font-size:16px;margin-right:5px;margin-left:5px;"><img src="images/simple.png"style="vertical-align:middle;margin-right:2px"/>写简言日记</a>
	|<a href="writeOrdinaryDiary.jsp"style="font-size:16px;margin-right:5px;margin-left:5px;"><img src="images/ordinary.png"style="vertical-align:middle;margin-right:2px"/>写普通日记</a>
	|<a href="setting.jsp"style="font-size:16px;margin-right:5px;margin-left:5px;">设置</a>
	|<a href="UserServlet?action=exit"style="font-size:16px;padding-right:50px;margin-left:5px;">退出登录</a>
</c:if>
</div>
<div id="top" class="W_nologin">
<div class="loginBox W_fl" id="pl_login_form" style="float: right; margin-top: 120px; margin-right:15%; width:300px; height: 280px;display:none">
  <!--<div class="module_loading" node-type="module_loading"></div> -->
  <div class="opacity"></div>
		              
  <!-- 登陆模块 -->
  <div class="login_switch">
	<div class="info_header">
      <div class="tab clearfix" style="width:350px">
        <a href="javascript:void(0);" node-type="normal_tab" action-type="switchTab" action-data="type=normal" suda-uatrack="key=tblog_weibologin3&amp;value=ordinary_login" class=" cur" style="font-size:20px">帐号登录</a>
      </div>
	</div>
	<!-- /_info_header end-->

    <!-- 帐号登陆 -->
    <form method="post" action="UserServlet?action=login" id="form31" autocomplete="off">
    <div class="W_login_form" node-type="normal_form" style="width:300px;">
      <!--<div class="info_list pre_info clearfix" node-type="prename_box" style="display:none"></div>-->
      <div class="info_list username" node-type="username_box" style="">
        <div class="input_wrap " style="width:300px;height:35px;">
          <input style="width:230px;" id="loginname" type="text" class="W_input " autocomplete="off" action-data="text=邮箱/会员帐号/手机号" action-type="text_copy" name="username" node-type="username" tabindex="1" value="">
        </div>
      </div>
      <div class="info_list password" node-type="password_box">
        <div class="input_wrap " style="width:300px;height:35px;">
          <input style="width:230px;" id="loginpassword" type="password" class="W_input " autocomplete="off" value="" action-type="text_copy" name="pwd" node-type="password" tabindex="2" onchange="" onfocus="$('#enter_psw').html('');" onblur="if($(this).val() == '')$('#enter_psw').html('请输入密码');">
          <!--  <span class="enter_psw" id="enter_psw">请输入密码</span> -->
        </div>
      </div>

      <div class="info_list auto_login clearfix">
        <div class="right W_fr"><a href="javascript:void(0);" onclick="var loginname=document.getElementById('loginname').value;window.open('https://security.weibo.com/iforgot/loginname?entry=weibo&amp;loginname='+loginname);" node-type="btn_password_recover" suda-data="key=tblog_weibologin3&amp;value=click_forgetpwd" class="S_txt2">忘记密码</a></div>
        <label for="login_form_savestate" class="W_fl W_label" title="建议在网吧或公共电脑上取消该选项。" action-data="content=建议在网吧或公共电脑上取消该选项。" action-type="customTip"><input type="checkbox" id="login_form_savestate" checked="checked" node-type="savestate" tabindex="5" class="W_checkbox"><span class="S_txt2">记住我</span></label>
      </div>

      <div class="info_list login_btn" onClick="$('#form31').submit()">
        <a href="javascript:void(0)" class="W_btn_a btn_40px" action-type="btn_submit" node-type="submitBtn" suda-data="key=tblog_weibologin3&amp;value=click_sign" tabindex="6" style="width:300px;"><span node-type="submitStates">登录</span></a>
      </div>

    </div> 
    </form>
    <!-- /普通登陆 -->

  </div>
  <!-- /登陆模块 -->
</div>
</div>
<!-- <div id="navigation">
<marquee scrollamount=3 FONT style="COLOR=FF0000; FILTER: shadow(color=FFFF33 ); FONT-FAMILY: 微软雅黑; FONT-SIZE: 10pt; WIDTH: 100%">欢迎光临简言日记网，简言留住匆匆岁月！</marquee>
</div> -->
<div id="login">
<!-- <form name="form2" method="post" action="" id="form2">
	<div id="loginTitle">清爽夏日九宫格日记网--用户登录</b></div>
	<div id="loginContent" style="background-color:#FFFEF9; margin:0px;">
	<ul id="loginUl"><li>
	用户名：<input type="text" name="username" style="width:120px" onkeydown="if(event.keyCode==13){this.form.pwd.focus();}">
	</li><li>
	密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="pwd"  style="width:120px" onkeydown="if(event.keyCode==13){loginSubmit(this.form)}">&nbsp;<a href="forgetPwd_1.jsp">找回密码</a>
	</li><li style="padding-left:40px;">
	<input name="Submit" type="button"  onclick="loginSubmit(this.form)" value="登录">
      &nbsp;
        <input name="Submit2" type="button" value="关闭" onClick="myClose(login)">
	</li></ul>
	</div>
 	<div style="background-color:#FEFEFC;height:10px;"></div>
</form> -->
<form class="box login" name="form2" method="post" action="UserServlet?action=login" id="form2">
	<fieldset class="boxBody">
	  <label style='float:right;' onClick="myClose(login)">关闭</label>
	  <label>用户名</label>
	  <input type="text" name="username" tabindex="1" placeholder="PremiumPixel" required>
	  <label><a href="forgetPwd_1.jsp" class="rLink" tabindex="5">忘记密码?</a>密码</label>
	  <input type="password" name="pwd" tabindex="2" required>
	</fieldset>
	<footer>
	  <label><input type="checkbox" tabindex="3">记住我</label>
	  <input type="submit" class="btnLogin" value="登录" tabindex="4" > <!-- onclick="loginSubmit(this.form)"> -->
	</footer>
</form>
 </div>