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
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
    
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
            <li class="active"><a href="users.html">&nbsp;&nbsp;Sample List</a></li>
            <!--  <li ><a href="user.html">Sample Item</a></li>
            <li ><a href="media.html">Media</a></li>
            <li ><a href="calendar.html">Calendar</a></li> -->
            
        </ul>

        <!--  <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>Account<span class="label label-info">+3</span></a>
        <ul id="accounts-menu" class="nav nav-list collapse">
            <li ><a href="sign-in.html">Sign In</a></li>
            <li ><a href="sign-up.html">Sign Up</a></li>
            <li ><a href="reset-password.html">Reset Password</a></li>
        </ul>

        <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>Error Pages <i class="icon-chevron-up"></i></a>
        <ul id="error-menu" class="nav nav-list collapse">
            <li ><a href="403.html">403 page</a></li>
            <li ><a href="404.html">404 page</a></li>
            <li ><a href="500.html">500 page</a></li>
            <li ><a href="503.html">503 page</a></li>
        </ul>

        <a href="#legal-menu" class="nav-header" data-toggle="collapse"><i class="icon-legal"></i>Legal</a>
        <ul id="legal-menu" class="nav nav-list collapse">
            <li ><a href="privacy-policy.html">Privacy Policy</a></li>
            <li ><a href="terms-and-conditions.html">Terms and Conditions</a></li>
        </ul>

        <a href="help.html" class="nav-header" ><i class="icon-question-sign"></i>Help</a>
        <a href="faq.html" class="nav-header" ><i class="icon-comment"></i>Faq</a> -->
    </div>
    

    
    <div class="content">
        
        <div class="header">
            
            <h1 class="page-title">Users</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">Users</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid" style="margin-left:10px">
               <div class="row">
				    <div class="span16">
				        <div id="grid">
				        </div>
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
          {title : 'id',dataIndex :'id'},
          {title : 'username', dataIndex :'username'},
          {title : 'pwd',dataIndex :'pwd'},
          {title : 'email',dataIndex :'email'},
          {title : '',width:50,renderer : function(value, obj, index){
              var strArray = new Array();
  			strArray.push("<span class='grid-command btn-delete' extend='");
  			strArray.push(obj.id);
  			strArray.push("'>删除</span>"); 
  			return strArray.join("");
           }}
        ];

        store = new Store({
          url:"AdminServlet?action=listAllUser",
          autoLoad:true,
          pageSize:10
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
  	    S.all('.btn-delete','#grid').on('click',function(event){
  	        event.preventDefault();
  	        var record = S.one(this);
  	        var id = record.attr("extend");
  	        BUI.Message.Confirm('确认要删除吗？',function(){
  	          setTimeout(function(){
  	        	S.io({
 	   			     type : 'POST',
 	   			     url : "AdminServlet?action=deleteUser",
 	   			     data : {"id" : id},
 	   			     dataType : 'json',
 	   			     success : function(data){
 	   			    	 if(data.success){
                          BUI.Message.Alert("删除成功！");
                          //var obj = BUI.FormHelper.serializeToObject($('#J_Form')[0]);
         				 store.load();
 	   			    	 }else{
 	   			    		 BUI.Message.Alert("删除失败");
 	   			    	 }
 	   			     }
 			 	});
  	          });
  	        },'question');
  	    });
      });
    });
    </script>
    
  </body>
</html>

