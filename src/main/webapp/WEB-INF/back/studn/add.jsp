<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  
  <head>
   <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="static/public/css/font.css">
    <link rel="stylesheet" href="static/public/lib/layui/css/modules/laydate/default/laydate.css">
    <link rel="stylesheet" href="static/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="static/public/lib/layui/layui.all.js" charset="utf-8"></script>
    <script type="text/javascript" src="static/public/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>用户姓名:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="L_email" name="truename" lay-verify="required" autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>登录邮箱:
              </label>
              <div class="layui-input-inline">
                  <input id="L_pass" name="username"  lay-verify="required|email"  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>登录密码:
              </label>
              <div class="layui-input-inline">
                  <input id="L_pass" name="password"  lay-verify="required"  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div>
          	
          </div>
           <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>用户角色:
              </label>
              <div class="layui-input-inline">
                  <select  name="role.roleName" class="valid">
                     <option value="stud">学生</option>
                    <option value="teach">老师</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>用户性别:
              </label>
              <div class="layui-input-inline">
                  <select  name="sex" class="valid">
                    <option value="男">男</option>
                    <option value="女">女</option>
                  </select>
              </div>
          </div>
           <div class="layui-form-item" style="display: none;">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>用户状态:
              </label>
               <div class="layui-input-inline">
                  <select  name="status" class="valid">
                    <option value="考核期">考核期</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>联系电话:
              </label>
              <div class="layui-input-inline">
                  <input id="L_pass" name="phone"  lay-verify="required|phone"  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>紧急电话:
              </label>
              <div class="layui-input-inline">
                  <input id="L_pass" name="urgent"  lay-verify="required"  autocomplete="off" class="layui-input">
              </div>
          </div>
          <input name="liveValue" value="50" hidden="hidden" >
          <input name="learnValue" value="50" hidden="hidden" >
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label"></label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">增加</button>
          </div>
          
      </form>
    </div>
    <script>
     $(function(){
    	   layui.use(['form','layer'], function(){
    	          var $ = layui.jquery;
    	          var form = layui.form;
    	          form.render();
    	         
    	          //监听提交
    	          form.on('submit(add)', function(data){
    	            //发异步，把数据提交给php
    	            $.post("admin/studn/update.jhtml",data.field,function(data){
    	            	layer.alert("增加成功", {icon: 6},function () {
    	                    // 获得frame索引
    	                    var index = parent.layer.getFrameIndex(window.name);
    	                    //关闭当前frame
    	                    parent.layer.close(index);
    	                    parent.location.reload();
    	                });
    	            });
    	            
    	            return false;
    	          });
    	          
    	          
    	          
    	        });
    	 
     });
     
    </script>
    
  </body>

</html>