$(document).ready(function(){
	
	//获取JS传递的语言参数
	var utils = new Utils();
	var args = utils.getScriptArgs();	
	
	//加载国际化语言包资源
	utils.loadProperties(args.lang);
	
	//输入框激活焦点、移除焦点
	jQuery.focusblur = function(focusid) {
		var focusblurid = $(focusid);
		var defval = focusblurid.val();
		focusblurid.focus(function(){
			var thisval = $(this).val();
			if(thisval==defval){
				$(this).val("");
			}
		});
		focusblurid.blur(function(){
			var thisval = $(this).val();
			if(thisval==""){
				$(this).val(defval);
			}
		});
	 
	};
	/*下面是调用方法*/
	$.focusblur("#email");
	
	//输入框激活焦点、溢出焦点的渐变特效
	if($("#email").val()){
		$("#email").prev().fadeOut();
	};
	$("#email").focus(function(){
		$(this).prev().fadeOut();
	});
	$("#email").blur(function(){
		if(!$("#email").val()){
			$(this).prev().fadeIn();
		};		
	});
	if($("#pwd").val()){
		$("#pwd").prev().fadeOut();
	};
	$("#pwd").focus(function(){
		$(this).prev().fadeOut();
	});
	$("#pwd").blur(function(){
		if(!$("#pwd").val()){
			$(this).prev().fadeIn();
		};		
	});
	if($("#repwd").val()){
		$("#repwd").prev().fadeOut();
	};
	$("#repwd").focus(function(){
		$(this).prev().fadeOut();
	});
	$("#repwd").blur(function(){
		if(!$("#repwd").val()){
			$(this).prev().fadeIn();
		};		
	});
	if($("#user").val()){
		$("#user").prev().fadeOut();
	};
	$("#user").focus(function(){
		$(this).prev().fadeOut();
	});
	$("#user").blur(function(){
		if(!$("#user").val()){
			$(this).prev().fadeIn();
		};		
	});
	
	//ajax提交注册信息
	$("#submit").bind("click", function(){
		regist(validate);
	});
	
	$("body").each(function(){
		$(this).keydown(function(){
			if(event.keyCode == 13){
				regist(validate);
			}
		});
	});
	
});

var Utils = function(){};

Utils.prototype.loadProperties = function(lang){
	jQuery.i18n.properties({// 加载资浏览器语言对应的资源文件
		name:'ApplicationResources',
		language: lang,
		path:'resources/i18n/',
		mode:'map',
		callback: function() {// 加载成功后设置显示内容
		} 
	});	
};

Utils.prototype.getScriptArgs = function(){//获取多个参数
    var scripts=document.getElementsByTagName("script"),
    //因为当前dom加载时后面的script标签还未加载，所以最后一个就是当前的script
    script=scripts[scripts.length-1],
    src=script.src,
    reg=/(?:\?|&)(.*?)=(.*?)(?=&|$)/g,
    temp,res={};
    while((temp=reg.exec(src))!=null) res[temp[1]]=decodeURIComponent(temp[2]);
    return res;
};
