<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<jsp:useBean id="pagination" class="com.wgh.tools.MyPagination" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="CSS/dpl.css" rel="stylesheet">
<link href="CSS/bui.css" rel="stylesheet">
<link rel="stylesheet" href="CSS/audioplayer.css" />
<script type="text/javascript" src="JS/excanvas-modified.js"></script>
<script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
<script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
<script src="JS/audioplayer.js"></script>
<title>显示简言日记列表</title>
<%String tmp=request.getRequestURL().toString();%>
<script language="javascript">
//展开或收缩图片的方法
function goToReply(whoid, whoname, id){
    $("#comment"+id).attr("whoesid", whoid);
    $("#comment"+id).attr("whoesname", whoname);
	$("#comment"+id).focus();
}

function zoom(id,url){
	//document.getElementById('reDefault'+id).onclick();//执行reDefault的单击事件
	document.getElementById("diary"+id).style.display = "";//显示图片
	if(flag[id]){//用于展开图片
		document.getElementById("diary"+id).src="images/diary/"+url+".png";	//设置要显示的图片
		document.getElementById("diary"+id).style.cursor="url(images/ico02.ico)";//为图片添加自定义鼠标样式
		document.getElementById("control"+id).style.display="";	//显示控制工具栏
		document.getElementById("diaryImg"+id).style.width=400;	//设置日记图片的宽度
		document.getElementById("diaryImg"+id).style.height=400;	//设置日记图片的高度
		document.getElementById("canvas"+id).style.cursor="url(images/ico02.ico)";	//为画布添加自定义鼠标样式
		document.getElementById("diary"+id).width=400;	//设置图片的宽度
		document.getElementById("diary"+id).height=400;//设置图片的高度
		flag[id]=false;
	}else{//用于收缩图片
		document.getElementById("diary"+id).src="images/diary/"+url+".png";//设置图片显示为缩略图
		document.getElementById("control"+id).style.display="none";	//设置控制工具栏不显示
		document.getElementById("diary"+id).style.cursor="url(images/ico01.ico)";//为图片添加自定义鼠标样式
		document.getElementById("diaryImg"+id).style.width=200;	//设置日记图片的宽度
		document.getElementById("diaryImg"+id).style.height=200;	//设置日记图片的高度		
		document.getElementById("canvas"+id).style.cursor="url(images/ico01.ico)";	//为画布添加自定义鼠标样式
		document.getElementById("diary"+id).width=200;	//设置图片的宽度
		document.getElementById("diary"+id).height=200;//设置图片的高度
		flag[id]=true;
		document.getElementById("canvas"+id).style.display="none";	//设置面板不显示
		
	}
}
function clickReply() {
    
}

function showMusicBoard() {
	if ($('#musicboard').css("visibility") == 'hidden') {
		$('#musicboard').css("visibility", 'visible');
	} else {
		$('#musicboard').css("visibility", 'hidden');
	}
		
}

function commit(id) {
   //alert(id);
   var whoid = document.getElementById("comment"+id).getAttribute("whoid");
   var whoname = document.getElementById("comment"+id).getAttribute("whoname");
   var whoesid = document.getElementById("comment"+id).getAttribute("whoesid");
   var whoesname = document.getElementById("comment"+id).getAttribute("whoesname");
   var diaryid = document.getElementById("comment"+id).getAttribute("diaryid");
   var reply = document.getElementById("comment"+id).value;
   //alert(reply);
   //alert(whoid+','+whoname+','+whoesid+','+whoesname);
   var param="whoid="+whoid+"&whoname=" + whoname + "&whoesid=" + whoesid + "&whoesname=" + whoesname + "&diaryid=" + diaryid + "&reply=" + reply; 	//将登录信息连接成字符串，作为发送请求的参数
   var loader=new net.AjaxRequest("DiaryServlet?action=comment",deal_comment,onerror,"POST",encodeURI(param));
   var newReply = '<div style="font-size:14px;padding-bottom:10px" id="reply" whoid="'+whoid+'" whoname="'+whoname+'" whoesid="'+whoesid+'" whoesname="'+whoesname+'">'
	              +'<b style="color:#3300FF">'+whoname+'</b>'
   if (whoesid > 0) {
       newReply = newReply+'<b> 回复 </b>'+'<b style="color:#3300FF">'+whoesname+'</b>'; 
   }
	   newReply = newReply+'<b> : </b>'+'<b onClick=\'goToReply("'+whoid+'","'+whoname+'","'+id+'")\'>'+reply+'</b>'+'</div>';
   $("#allReplyList"+id).append(newReply);
   $('#comment'+id).val("我也写一句");
}
var i=0;	//标记变量，用于记录当前页共几条日记
</script>
</head>
<body style="background-color:#d4d5e0;
             background-image: url('images/body_repeat.png');
             background-repeat: repeat-x;
             background-position: center 0;
             ">
<div style="background: url('images/body_bg_page.jpg') no-repeat top center;width:100%;">
<%String url=request.getRequestURL().toString();%>
<%url=url.substring(0,url.lastIndexOf("/"));%>
<%@ include file="top.jsp" %>
<%@ include file="register.jsp" %>
<div id="box1">
<div style="margin-bottom:10px">
<c:if test="${!empty sessionScope.userName}">
 <a id="addfriend" name="addfriend" style="float:right; margin-right:20px"><img src="images/addFriend.png"style="vertical-align:middle;"/></a> 
 <c:choose>
   <c:when test="${!empty sessionScope.music}">
      <a id="showMusicBoard" style="float:right; margin-right:20px" onClick="showMusicBoard()"><img src="images/music-icon.png"style="vertical-align:middle;"/></a>
   </c:when>
   <c:otherwise>
      <a id="addmusic" name="addmusic" style="float:right; margin-right:20px"><img src="images/music-icon.png"style="vertical-align:middle;"/></a>
   </c:otherwise>
 </c:choose>
</c:if>
</div>
<!--  <embed autostart="true" loop=100 height="0" width="0" src="<%=url %>/music/${sessionScope.music}"/> -->
<div id="musicboard" style="margin:10px 0 0 260px;visibility:hidden;width:800px;">
 <c:choose>
    <c:when test="${!empty sessionScope.auto}">
	<audio loop="loop" autoplay="${sessionScope.auto}" preload="auto" controls>
		<source src="<%=url %>/music/${sessionScope.music}">
	</audio>
	</c:when>
	<c:otherwise>
	<audio loop="loop" preload="auto" controls>
	<source src="<%=url %>/music/${sessionScope.music}">
	</audio>
	</c:otherwise>
</c:choose>
	<a id="addmusic" name="addmusic" style="margin-right:0px"></a>
</div>
 <div id="content" class="hidden">
      <form id="form3" class="form-horizontal" action=""> 
        <div class="row">
          <div class="control-group span8">
            <label class="control-label">用户帐号：</label>
            <div class="controls">
              <input type="text" class="input-normal control-text" name="friend" id="friend">
            </div>
          </div>
		</div>
      </form>
 </div>
 <div id="content2" class="hidden">
      <form id="form4" name="form4" class="form-horizontal" action="DiaryServlet?action=uploadMusic" method="post" enctype="multipart/form-data"> 
        <div class="row">
          <div class="control-group span8">
            <img class="control-label" src="images/music.png" style="width:30px;height:30px;margin-right: 10px"></img>
            <div class="controls">
              <input type="file" class="input-normal control-text" name="music" id="music" style="margin-top: 5px">
            </div>
          </div>
		</div>
      </form>
 </div>
 <div id="diaryList" style="min-height:800px;margin-top:10px">
<c:if test="${!empty requestScope.diaryList}">
<c:forEach items="${requestScope.diaryList}" var="diaryList" varStatus="id">
<script type="text/javascript">
i++;	//标记变量，用于记录当前页共几条日记
function rotate${id.count }(){
		var param${id.count } = {
			right: document.getElementById("rotRight${id.count }"),
			left: document.getElementById("rotLeft${id.count }"),
			reDefault: document.getElementById("reDefault${id.count }"),			
			img: document.getElementById("diary${id.count }"),
			cv: document.getElementById("canvas${id.count }"),
			rot: 0
		};
		var rotate = function(canvas,img,rot){
			//获取图片的高宽
			var w = 400;						//设置图片的宽度
			var h = 400;						//设置图片的高度
			//角度转为弧度
			if(!rot){
				rot = 0;	
			}
			var rotation = Math.PI * rot / 180;
			var c = Math.round(Math.cos(rotation) * 1000) / 1000;
			var s = Math.round(Math.sin(rotation) * 1000) / 1000;
			//旋转后canvas面板的大小
			canvas.height = Math.abs(c*h) + Math.abs(s*w);
			canvas.width = Math.abs(c*w) + Math.abs(s*h);
			//绘图开始
			var context = canvas.getContext("2d");
			
			context.save();
			//改变中心点
			if (rotation <= Math.PI/2) {	//旋转角度小于等90度时
				context.translate(s*h,0);
			} else if (rotation <= Math.PI) {	//旋转角度小于等180度时
				context.translate(canvas.width,-c*h);
			} else if (rotation <= 1.5*Math.PI) {	//旋转角度小于等270度时
				context.translate(-c*w,canvas.height);
			} else {
				rot=0;
				context.translate(0,-s*w);
			}
			//旋转90°
			context.rotate(rotation);
			//绘制
			context.drawImage(img, 0, 0, w, h);
			context.restore();
			img.style.display = "none";	//设置图片不显示
		}
		var fun = {
			right: function(){//向右转的方法
				param${id.count }.rot += 90;
				rotate(param${id.count }.cv, param${id.count }.img, param${id.count }.rot);
				if(param${id.count }.rot === 270){
					param${id.count }.rot = -90;	
				}else if(param${id.count }.rot > 270){
					param${id.count }.rot = -90;	
					fun.right();//调用向右转的方法
				}	
			},

			reDefault: function(){//恢复默认的方法
				param${id.count }.rot = 0;	
				rotate(param${id.count }.cv, param${id.count }.img, param${id.count }.rot);	
			},

			left: function(){//向左转的方法
				param${id.count }.rot -= 90;
				if(param${id.count }.rot <= -90){
					param${id.count }.rot = 270;
				}
				rotate(param${id.count }.cv, param${id.count }.img, param${id.count }.rot);	//旋转指定角度		
			}
		};
		param${id.count }.right.onclick = function(){	//向右转
			param${id.count }.cv.style.display="";//显示画图面板
			fun.right();
			return false;
		};
		param${id.count }.left.onclick = function(){		//向左转
			param${id.count }.cv.style.display="";//显示画图面板
			fun.left();
			return false;
		};
		param${id.count }.reDefault.onclick = function(){//恢复默认
			fun.reDefault();	//恢复默认
			return false;
		};		
}
</script>
    <div style="background-color: #FFFFFF;border-bottom-color:#CBCBCB;border-bottom-style:solid;border-bottom-width: 1px;
	border-left-color:#CBCBCB;border-left-style:solid;border-left-width: 1px;
	border-right-color:#CBCBCB;border-right-style:solid;border-right-width: 1px;
	border-top-color:#CBCBCB;border-top-style:solid;border-top-width: 1px;margin: 10px 0 10px 0;padding: 0 0 0 0">
	<div style="border-bottom-color:#DDDDDD;padding:15px 0px 5px 5px;border-bottom-style:solid;border-bottom-width: 1px;margin: 10px 10px 10px 10px;color:#0F6548">
	  <a href="<%=url %>/images/diary/${diaryList.address }.png" target="_blank">
		 <font style="font-weight: solid;font-size:17px;">${diaryList.username}</font>
      </a>
      <div style="padding:10px 5px 0px 0px;background-color:#FFFFFF;color:#999999;font-size:10px">
	      <fmt:formatDate value="${diaryList.writeTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/> 
		  <b>${diaryList.title}</b>
		  <c:if test="${sessionScope.userName==diaryList.username}">
		  <a href="DiaryServlet?action=delDiary&id=${diaryList.id }&url=${requestScope.url}&imgName=${diaryList.address }">[删除]</a> 
		  </c:if>
	  </div>
    </div>
	<div style="padding: 0 0px 0 25px;margin:0px 0px 0px 0px;background-color:#FFFFFF; 
	border-bottom-color:#CBCBCB;border-bottom-style:solid;border-bottom-width: 0px;
	border-left-color:#CBCBCB;border-left-style:solid;border-left-width: 0px;
	border-right-color:#CBCBCB;border-right-style:solid;border-right-width: 0px;
	border-top-color:#CBCBCB;border-top-style:solid;border-top-width: 0px;">
		<div style="padding:5px;background-color:#FFFFFF;text-align:right;color:#999999;">
			<!-- <fmt:formatDate value="${diaryList.writeTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
			<c:if test="${sessionScope.userName==diaryList.username}">
			<a href="DiaryServlet?action=delDiary&id=${diaryList.id }&url=${requestScope.url}&imgName=${diaryList.address }"><i class="icon icon-trash"></i>[删除]</a> 
			</c:if> -->
		</div>
		<div id="diaryImg${id.count }" style="border:0px #DDDDDD solid;width:550px">
			<div id="control${id.count }" style="display:none;">
				<a href="#" onClick="zoom('${id.count }','${diaryList.address }')" style="display:none">收缩</a>
		 		<a href="<%=url %>/images/diary/${diaryList.address }.png" target="_blank" style="display:none">查看原图</a>
			    <a id="rotLeft${id.count }" href="#" style="display:none">左转</a>
				<a id="rotRight${id.count }" href="#" style="display:none">右转</a>
				<a id="reDefault${id.count }" href="#" style="display:none">恢复默认</a>
			</div>
			<div style="font-size:14px;width:770px;padding-bottom:10px;line-height:1.5;letter-spacing:2px"><b>${diaryList.detail }</b></div>
			<c:choose>
			<c:when test="${diaryList.type == 1}">
			<img src="images/upload/${diaryList.address}" style="margin:0 0 10px 0px;max-width:400px;max-height:400px"/>	
			</c:when>
			<c:when test="${diaryList.type == 3}">
			</c:when>
			<c:when test="${diaryList.type == 2}">
				<video controls="controls" poster="http://sandbox.thewikies.com/vfe-generator/images/big-buck-bunny_poster.jpg" width="400" height="225" style="margin: 0 0 10px 0px">
	              <source src="videos/upload/${diaryList.address}" type="video/mp4" />
	              <object type="application/x-shockwave-flash" data="http://releases.flowplayer.org/swf/flowplayer-3.2.1.swf" width="400" height="225">
		            <param name="movie" value="http://releases.flowplayer.org/swf/flowplayer-3.2.1.swf" />
		            <param name="allowFullScreen" value="true" />
		            <param name="wmode" value="transparent" />
		            <param name="flashVars" value="config={'playlist':['http%3A%2F%2Fsandbox.thewikies.com%2Fvfe-generator%2Fimages%2Fbig-buck-bunny_poster.jpg',{'url':'http%3A%2F%2Fclips.vorwaerts-gmbh.de%2Fbig_buck_bunny.mp4','autoPlay':false}]}" />
		            <img alt="Big Buck Bunny" src="http://sandbox.thewikies.com/vfe-generator/images/big-buck-bunny_poster.jpg" width="640" height="360" title="No video playback capabilities, please download the video below" />
	              </object>
               </video>
			</c:when>
			<c:otherwise>
			<img id="diary${id.count }" src="images/diary/${diaryList.address }scale.jpg" style="margin:0 0 10px 0" onClick="zoom('${id.count }','${diaryList.address }')"/>
            </c:otherwise>
            </c:choose>
			<canvas id="canvas${id.count }" style="display:none;" onClick="zoom('${id.count }','${diaryList.address }')"></canvas>
		</div>
	</div>
		<div style="background-color:#fafafa;padding:20px 0px 10px 20px;">
		<div id="allReplyList${id.count }">
		<c:if test="${!empty diaryList.replyList}">
          <c:forEach items="${diaryList.replyList}" var="replyList" varStatus="i">
			 <div style="font-size:14px;padding-bottom:10px" id="reply" whoid="${replyList.whoid}" whoname="${replyList.whoname}" whoesid="${replyList.whoesid}" whoesname="${replyList.whoesname}">
				<b style="color:#3300FF">${replyList.whoname }</b>
			    <c:if test="${replyList.whoesid >0}">
				   <b>回复</b>
				   <b style="color:#3300FF">${replyList.whoesname}</b>
                </c:if>
				   <b>:</b>
			       <b onClick='goToReply("${replyList.whoid}", "${replyList.whoname}", "${id.count}")'>${replyList.replyContent }</b>
			 </div>
		  </c:forEach>
		</c:if>
		</div>
		<div style="margin:0px 0px 5px 0px;">
		    <input name="comment${id.count}" id="comment${id.count}" type="text" style="height:15px; width:300px; font-size:10px" value="我也说一句" whoid="${sessionScope.uid}" whoesid="0" whoname="${sessionScope.userName}" whoesname="" diaryid=${diaryList.id}   onFocus="javascript:if(this.value=='我也说一句')this.value='';">
			<a href="javascript:void(0)" style="padding-left:10px" onClick="commit(${id.count})">发表</a>
    	</div>
    </div>
    </div>
</c:forEach>
</c:if>
<!-- <c:if test="${empty requestScope.diaryList}">
暂无日记!
</c:if> -->
<script type="text/javascript">
function onerror(){
	alert("您的操作有误");
}
function deal_friend(){
	/*****************显示提示信息******************************/
	var h=this.req.responseText;
	h=h.replace(/\s/g,"");	//去除字符串中的Unicode空白
	alert(h);
	if(h=="添加好友成功！"){
		window.location.href="DiaryServlet?action=listAllDiary";
	}else{
		form3.friend.value="";//清空用户名文本框 
	}
	
}
function deal_comment(){
	/*****************显示提示信息******************************/
	var h=this.req.responseText;
	h=h.replace(/\s/g,"");	//去除字符串中的Unicode空白
	//alert(h);
	if(h=="发表成功！"){
		//window.location.href="DiaryServlet?action=listAllDiary";
	}else{
		//form3.friend.value="";//清空用户名文本框 
	}
	
}
var flag=new Array(i);//定义一个标记数组
//window.onload = function(){
	while(i>0){
		eval("rotate"+i)();//执行旋转图片的方法
		flag[i]=true;//初始化一维数组的各个元素
		i--;
	}
//}
BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
      var form = new Form.HForm({
        srcNode : '#form3'
      }).render();
	  
	  var form = new Form.HForm({
	    srcNode : '#form4'
	  }).render();
	  
	  var dialog = new Overlay.Dialog({
            title:'Friend',
            width:400,
            height:150,
            //配置DOM容器的编号
            contentId:'content',
            success:function () {
                    if(form3.friend.value==""){		//验证用户名是否为空
            		   return false;
            	    }
            	    var param="friend="+form3.friend.value; 	//将登录信息连接成字符串，作为发送请求的参数
            	    var loader=new net.AjaxRequest("DiaryServlet?action=addfriend",deal_friend,onerror,"POST",encodeURI(param));
                    this.close();
            }
          });
	  
 
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
        $('#addfriend').on('click',function () {
          dialog.show();
        });
		$('#addmusic').on('click',function () {
		  dialog2.show();
		});
});


</script>
<c:if test="${!empty requestScope.diaryList}">
	<div style="">
	 <%=pagination.printCtrl(Integer.parseInt(request.getAttribute("Page").toString()),"DiaryServlet?action="+request.getAttribute("url"),"")%> 
	</div>
</c:if>
</div>
<div id="box1">
<%@ include file="bottom.jsp" %>
</div>
</body>
</html>