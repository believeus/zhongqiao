<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="date" uri="/tag/datetag.tld"%>  
<!DOCTYPE html>
<html>
  
  <head>
   <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>分布式师徒积分制管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="static/public/css/font.css">
    <link rel="stylesheet" href="static/public/css/xadmin.css">
    <link rel="stylesheet" href="static/public/lib/layui/css/layui.css">
    <link rel="stylesheet" href="static/public/lib/layui/css/modules/layer/default/layer.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="static/public/lib/layui/layui.all.js" charset="utf-8"></script>
    <script type="text/javascript" src="static/public/js/xadmin.js"></script>
	 <script>
	 $(function(){
		 layui.use(['form','element'],
				    function() {
				       layer = layui.layer;
				       element = layui.element;
				    });
	 });
    </script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <xblock>
      	  <c:if test="${sessionScope.sessionUser.username eq 'admin'}">
        	<button class="layui-btn" onclick="x_admin_show('添加程序员','admin/studn/addView.jhtml',400,550)"><i class="layui-icon"></i>添加</button>
         </c:if>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
          	<th>用户编号</th>
            <th>用户名</th>
            <th>性别</th>
            <th>用户角色</th>
            <th>报名时间:</th>
            <th>状态</th>
            <th>生活分</th>
            <th>学习分</th>
            <th>操作</th>
           </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userlist.content}">
        		<tr>
        			<td><span>${user.id}</span></td>
	        		<td><span>${user.truename}</span></td>
	        		<td><span>${user.sex}</span></td>
	        		<td>
	        			<c:choose>
	        				<c:when test="${user.role.roleName eq 'stud'}">
	        					<span>学员小菜鸟</span>
	        				</c:when>
	        				<c:otherwise>
	        					<span>核心程序猿</span>
	        				</c:otherwise>
	        			</c:choose>
	        		</td>
	        		<td><date:date value="${user.createTime}" pattern="yyyy-MM-dd"/></td>
	        		<td><span>${user.status}</span></td>
	        		<td><span>${user.liveValue}</span><a href="javascript:;" onclick="x_admin_show('生活积分详情','admin/studn/doneView.jhtml?userId=${user.id}&type=live',850,500)" >&nbsp;&nbsp;[生活积分详情]</a></td>
	        		<td><span>${user.learnValue}</span><a href="javascript:;" onclick="x_admin_show('学习积分详情','admin/studn/doneView.jhtml?userId=${user.id}&type=learn',850,500)" >&nbsp;&nbsp;[学习积分详情]</a></td>
	        		<td class="td-manage">
	        			 <a title="编辑"  onclick="x_admin_show('编辑','admin/studn/editView.jhtml?id=${user.id}',400,580)" href="javascript:;">[编辑]</a>
		        		 <c:if test="${sessionScope.sessionUser.username eq 'admin'}">
				               <a href="javascript:;" onclick="x_admin_show('绑定事件','admin/studn/eventView.jhtml?userId=${user.id}',850,500)" >&nbsp;&nbsp;[绑定事件]</a>
			               	   <a href="javascript:;" onclick="del(this,${user.id})">[删除]</a>
			             </c:if>
		      
	            	</td>
        		</tr>
        	
        </c:forEach>
          
         
        </tbody>
      </table>
      <div class="page">
        <div>
        </div>
      </div>
        <script type="text/javascript">
            var url = 'admin/studn/list.jhtml?pageNumber=';
            var totalPage = "${userlist.totalPages}";
            var pageNumber = "${userlist.pageNumber}";
            initPage(url,totalPage,pageNumber);
        </script>

    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

      
      /*用户-删除*/
      function del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              var url="admin/studn/del.jhtml?id="+id;
              $.post(url,function(){
            	  $(obj).parents("tr").remove();
                  layer.msg('已删除!',{icon:1,time:1000});
                  window.location.reload();
              });
              
          });
      }



      function delAll(argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
  </body>

</html>