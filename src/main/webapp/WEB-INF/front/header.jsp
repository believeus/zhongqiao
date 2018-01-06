<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="header" id="head" style="margin-top: 0px;">
	<div class="header_top">
		<div class="logo">
			<a href="http://www.crv.com.cn/"><img
					src="static/img/P020160406609603319079.png" width="162" height="64"></a>
		</div>
		<div style="float:right;width:70px;margin-left:5px;margin-top:10px;"></div>
	</div>
	<!--end header_top-->
	<div class="navbody">
		<div class="nav" style="margin-left:-600px">
			<ul class="nav_ul">
				<li class="nav_li"><a class="on" href="index.html"
									  title="首页">首页</a></li>
<c:forEach items="${tree}" var="t">
				<li class="nav_li"><a href="artile/${t.id}.jhtml"
									  class="on">${t.name}</a>
					<div class="subnav sub-ul03">
						<ul>
							<c:forEach items="${t.children}" var="c">
							<li><a href="artile/${c.id}.jhtml"
								   target="_self">${c.name}</a></li>
							</c:forEach>
						</ul>
					</div></li>
</c:forEach>
			</ul>



		</div>
		<div class="subnavbg" style="display: none;"></div>
	</div>
</div>

<style>
	.other-topimg li img {
		position: absolute;
		top: 0;
		left: 50%;
		margin-left: -960px;
	}
</style>
<div class="other-topimg" id="featured">
	<div id="slider">
		<ul>
			<li class="sliderImage"><em class=""></em> <img src="static/img/newsbanner.jpg"> <span></span> </li>
		</ul>
	</div>
</div>
<!--end other-topimg-->
