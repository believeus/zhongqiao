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
      <div class="layui-row">
      <xblock>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
      </xblock>
      <form class="layui-form">
	      <table class="layui-table">
	        <thead>
	          <tr>
	            <th>学员名</th>
	            <th>事件名</th>
	            <th>事件发生时间</th>
	            <th>积分值</th>
	            <th>状态</th>
	            <th>操作</th>
	           </tr>
	        </thead>
	        <tbody>
		        <c:forEach var="userEvent" items="${userEventList.content}">
		        	<tr>
		        		<td><span>${userEvent.truename}</span><a href="javascript:;" onclick="x_admin_show('积分详情','admin/studn/doneView.jhtml?userId=${userEvent.userId}',850,500)" >&nbsp;&nbsp;[积分详情]</a></td>
		        		<td><span>${userEvent.title}</span></td>
		        		<td><span><date:date value="${userEvent.createTime}" pattern="yyyy-MM-dd"></date:date></span></td>
		        		<td><span>${userEvent.value}</span></td>
		        		<td><span>${userEvent.status}</span></td>
		        		<td class="td-manage">
		        		  <c:choose>
		        		    <c:when test="${sessionScope.sessionUser.username !='admin' }">
		        		    	<a href="javascript:;" >无权操作</a>
		        		    </c:when>
        		  			<c:when test="${userEvent.status != '证据确凿定案' }">
        		    			<a href="javascript:;"  onclick="del(this,${userEvent.id})" >&nbsp;&nbsp;[删除]</a>
        		    			<a href="javascript:;"  onclick="x_admin_show('编辑','admin/review/editview.jhtml?userEventId=${userEvent.id}',500,450)" >[详情]</a>
        		  			</c:when>
		        		  	<c:otherwise>
		        		  		<a href="javascript:;" >已定案不得操作</a>
		        		    </c:otherwise>
		        		  </c:choose>
		        		  
			             
		            	</td>
		        	</tr>
		         </c:forEach>
	        </tbody>
	      </table>
      </form>
      
      <div class="page">
        <div>
        </div>
      </div>
          <script type="text/javascript">
              var url = 'admin/review/list.jhtml?pageNumber=';
              var totalPage = "${userEventList.totalPages}";
              var pageNumber = "${userEventList.pageNumber}";
              initPage(url,totalPage,pageNumber);
          </script>
    </div>
    <script>
	 function del(obj,userEventId){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            var url='admin/studn/delBindEvent.jhtml?userEventId='+userEventId;
            $.post(url,function(){
	            	 $(obj).parents("tr").remove();
	                 layer.msg('已删除!',{icon:1,time:1000});
	                 window.location.reload();
           	 }
            );
            
        });
    };
	</script>
  </body>

</html>