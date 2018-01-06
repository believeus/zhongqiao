<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="date" uri="/tag/datetag.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<meta content="" name="description">
	<meta content="" name="keywords">
	<link rel="shortcut icon"
		  href="http://xingyun.oss-cn-hangzhou.aliyuncs.com/b/crv/images/favicon.ico">
	<title>中桥能源欢迎您</title>
	<link rel="stylesheet" href="static/public/css/2013_base.css">
	<link rel="stylesheet" href="static/public/css/2013_mainbusiness.css">
	<script src="static/public/js/jquery-1.8.0.min.js"></script>
	<style>
		body{background:none; background-color:transparent;}
		.pages .box {
			margin: 0 2px;
			width:100%;
		}
		.pages .box span{

			float: left;

		}

		.title {
			color: #7B7A7A;
			text-decoration: none;
			height: 33px;
			line-height: 33px;
		}
		.title_text {
			color: #F26522;
			text-decoration: none;
			height: 33px;
			line-height: 33px;
		}

		.pages .box a {
			background-color: #EAE6E2;
			border: 1px solid #FFFFFF;
			color: #7B7A7A;
			height: 33px;
			line-height: 33px;
			width: 83px;
		}
		.othersmain{width:740px;}

	</style>

</head>

<body>

<div class="othersmain newsmain">

	<div class="newslist">
		<ul>

			<c:forEach items="${zqdatas.content}" var="data">

			<li>
				<div class="time"><span class="day"><date:date value="${data.createTime}" pattern="dd"/></span><span class="date"><date:date value="${data.createTime}" pattern="yyyy-MM"/></span></div>
				<div class="conts">
					<h3><a href="detail/${data.id}.jhtml" target="_blank">${data.title}</a></h3>
					<p>${fn:substring(data.description,0,60)}
						<a class="more" href="detail/${data.id}.jhtml" target="_blank"><img src="static/img/2013_i08.gif" alt="更多"></a></p>
				</div>
			</li>

			</c:forEach>

		</ul>
	</div><!--end newslist-->
	<div class="pages">
                	              <span class="box btnpre">

                	              	<span class="title">总共</span><span class="title_text">50</span><span class="title">页&nbsp;</span><span class="title">当前第</span><span class="title_text">1</span><span class="title">/</span><span class="title_text">50</span><span class="title">页&nbsp;&nbsp;</span> <table border="0" cellspacing="0" cellpadding="0"><tbody><tr><td><table width="55" border="0" cellpadding="0" cellspacing="0"><tbody><tr> <td width="24"><a href="javascript:void(0)" class="page">首页</a></td></tr></tbody></table></td><td><table width="67" border="0" cellpadding="0" cellspacing="0"><tbody><tr> <td width="36"><a href="javascript:void(0)" class="page">上一页</a></td></tr></tbody></table></td><td><table width="67" border="0" cellpadding="0" cellspacing="0"><tbody><tr> <td width="36"><a href="http://winfo.crc.com.cn/news/crc_dynamic/index_5445_1.htm" class="page" target="_self">下一页</a></td></tr></tbody></table></td><td><table width="55" border="0" cellpadding="0" cellspacing="0"><tbody><tr>  <td width="24"><a href="http://winfo.crc.com.cn/news/crc_dynamic/index_5445_49.htm" class="page" target="_self">尾页</a></td></tr></tbody></table></td><td style="padding-left:40px;"><select name="select" style="margin-bottom:-3px;" onchange="location.replace(this.value)"><option selected="">跳至</option><option value="index_5445.htm">1</option><option value="index_5445_1.htm">2</option><option value="index_5445_2.htm">3</option><option value="index_5445_3.htm">4</option><option value="index_5445_4.htm">5</option><option value="index_5445_5.htm">6</option><option value="index_5445_6.htm">7</option><option value="index_5445_7.htm">8</option><option value="index_5445_8.htm">9</option><option value="index_5445_9.htm">10</option><option value="index_5445_10.htm">11</option><option value="index_5445_11.htm">12</option><option value="index_5445_12.htm">13</option><option value="index_5445_13.htm">14</option><option value="index_5445_14.htm">15</option><option value="index_5445_15.htm">16</option><option value="index_5445_16.htm">17</option><option value="index_5445_17.htm">18</option><option value="index_5445_18.htm">19</option><option value="index_5445_19.htm">20</option><option value="index_5445_20.htm">21</option><option value="index_5445_21.htm">22</option><option value="index_5445_22.htm">23</option><option value="index_5445_23.htm">24</option><option value="index_5445_24.htm">25</option><option value="index_5445_25.htm">26</option><option value="index_5445_26.htm">27</option><option value="index_5445_27.htm">28</option><option value="index_5445_28.htm">29</option><option value="index_5445_29.htm">30</option><option value="index_5445_30.htm">31</option><option value="index_5445_31.htm">32</option><option value="index_5445_32.htm">33</option><option value="index_5445_33.htm">34</option><option value="index_5445_34.htm">35</option><option value="index_5445_35.htm">36</option><option value="index_5445_36.htm">37</option><option value="index_5445_37.htm">38</option><option value="index_5445_38.htm">39</option><option value="index_5445_39.htm">40</option><option value="index_5445_40.htm">41</option><option value="index_5445_41.htm">42</option><option value="index_5445_42.htm">43</option><option value="index_5445_43.htm">44</option><option value="index_5445_44.htm">45</option><option value="index_5445_45.htm">46</option><option value="index_5445_46.htm">47</option><option value="index_5445_47.htm">48</option><option value="index_5445_48.htm">49</option><option value="index_5445_49.htm">50</option></select></td></tr></tbody></table> </span>
	</div>

</div><!--end overlay-->
