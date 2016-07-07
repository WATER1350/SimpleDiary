<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Bootstrap Admin</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

	<script src="http://g.tbcdn.cn/kissy/k/1.4.2/seed.js"></script>
	<script src="http://g.alicdn.com/bui/bui/1.1.17/adapter.js"></script>
	<script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
 

    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body class=""> 
  <!--<![endif]-->
    
    <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                    <li><a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">设置</a></li>
                    <li id="fat-menu" class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i> ${sessionScope.username}
                            <i class="icon-caret-down"></i>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">My Account</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>
                            <li class="divider visible-phone"></li>
                            <li><a tabindex="-1" href="sign-in.html">Logout</a></li>
                        </ul>
                    </li>
                    
                </ul>
                <a class="brand" href="index.html"><span class="first">后台</span> <span class="second">管理</span></a>
        </div>
    </div>
    


    
    <div class="sidebar-nav">
        <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>Dashboard</a>
        <ul id="dashboard-menu" class="nav nav-list collapse in">
            <li><a href="index.jsp">&nbsp;&nbsp;Home</a></li>
            <li ><a href="users.jsp">&nbsp;&nbsp;Sample List</a></li>
        </ul>
    </div>
    

    
    <div class="content">
        
        <div class="header">
            <h1 class="page-title">Dashboard</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">Dashboard</li>
        </ul>
            
        <div class="container-fluid">
			 <div class="row-fluid">
				  <div class="demo-content" style="margin-left:10px">
				    <div class="row">
				      <div class="span16">
				        <div id="grid">
				          
				        </div>
				      </div>
				    </div>
				    <!-- 初始隐藏 dialog内容 -->
				    <div id="content" class="hide">
				      <form class="form-horizontal">
				        <div class="row">
				          <div class="control-group span8">
				            <label class="control-label"><s>*</s>话题：</label>
				            <div class="controls">
				              <input id="admin_grid" type="text" data-rules="{required:true}" class="input-normal control-text">
				            </div>
				          </div>
				          <div class="control-group span8">
				            <label class="control-label"><s>*</s>第一行：</label>
				            <div class="controls">
				              <input id="admin_firstline" type="text" data-rules="{required:true,number : true}" class="input-normal control-text">
				            </div>
				          </div>
				        </div>  
				        <div class="row">
				          <div class="control-group span8">
				            <label class="control-label"><s>*</s>第二行：</label>
				            <div class="controls">
				              <input id="admin_secondline" type="text" data-rules="{required:true,number : true}" class="input-normal control-text">
				            </div>
				          </div>
				          <div class="control-group span8">
				            <label class="control-label"><s>*</s>第三行：</label>
				            <div class="controls">
				              <input id="admin_thirdline" type="text" data-rules="{required:true,number : true}" class="input-normal control-text">
				            </div>
				         </div>
				         <div class="row">
				          <div class="control-group span8">
				            <label class="control-label"><s>*</s>第四行：</label>
				            <div class="controls">
				              <input id="admin_fourthline" type="text" data-rules="{required:true,number : true}" class="input-normal control-text">
				            </div>
				          </div>
				         </div>  
				      </form>
				    </div>
				 </div>   
             </div>
         </div>
    </div>
    


    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
    KISSY.use(['bui/grid','bui/data','bui/form','bui/overlay','bui/calendar','event'],function(S,Grid,Data,Form, Overlay,Calendar,Event){
      var Grid = Grid,
      Store = Data.Store,
      columns = [
        {title : '话题',dataIndex :'grid'}, //editor中的定义等用于 BUI.Form.Field.Text的定义
        {title : '第一行', dataIndex :'firstline'},
        {title : '第二行',dataIndex :'secondline'},
        {title : '第三行',dataIndex :'thirdline'},
        {title : '第四行',dataIndex :'fourthline'},
        {title : '操作',renderer : function(value, obj, index){
            var strArray = new Array();
			strArray.push("<span class='grid-command btn-edit' grid='");
			strArray.push(obj.grid);
			strArray.push("' firstline='");
			strArray.push(obj.firstline);
			strArray.push("' secondline='");
			strArray.push(obj.secondline);
			strArray.push("' thirdline='");
			strArray.push(obj.thirdline);
			strArray.push("' fourthline='");
			strArray.push(obj.fourthline);
			strArray.push("'>编辑</span>"); 
			return strArray.join("");
            }}
      ];

      store = new Store({
        url:"AdminServlet?action=listAllGrid",
        autoLoad:true
      }),
      grid = new Grid.Grid({
        render:'#grid',
        columns : columns,
        width : 700,
        forceFit : true,
        tbar:{ //添加、删除
            items : []
        },
        bbar:{
             pagingBar:true
        },
        store : store
      });

    grid.render();
    
    grid.on('aftershow',function(){
	    S.all('.btn-edit','#grid').on('click',function(event){
	        event.preventDefault();
	        var record = S.one(this);
    	 	$("#admin_grid").val(record.attr("grid"));
    		$("#admin_firstline").val(record.attr("firstline"));
    		$("#admin_secondline").val(record.attr("secondline"));
    		$("#admin_thirdline").val(record.attr("thirdline"));
    		$("#admin_fourthline").val(record.attr("fourthline"));
	   		dialog.show();
	    });
    });
    var dialog = new Overlay.Dialog({
        title:'编辑话题标签',
        width:700,
        height:280,
        contentId:'content',
        success:function () {
        	var grid = $("#admin_grid").val();
        	var firstline = $("#admin_firstline").val();
			var secondline = $("#admin_secondline").val();
            var thirdline = $("#admin_thirdline").val();
            var fourthline = $("#admin_fourthline").val();
            S.io({
	   			     type : 'POST',
	   			     url : "AdminServlet?action=updateGrid",
	   			     data : {"grid":grid, "firstline":firstline, "secondline":secondline, "thirdline":thirdline,"fourthline":fourthline},
	   			     dataType : 'json',
	   			     success : function(data){
	   			    	 if(data.success){
                         BUI.Message.Alert("更新成功！");
                         //var obj = BUI.FormHelper.serializeToObject($('#J_Form')[0]);
        				 store.load();
	   			    	 }else{
	   			    		 BUI.Message.Alert("更新失败");
	   			    	 }
	   			     }
			 	});
			 	this.close();
        }
    });
  });
    </script>
    
  </body>
</html>

