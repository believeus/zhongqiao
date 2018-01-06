$(function () {

	$(".nav_li").not(":first-child,:last-child").hover(
		function(){
			$(this).addClass("nav_li_hover");
			$(this).parent().parent().next(".subnavbg").show();			
	},
		function(){
			$(this).removeClass("nav_li_hover");
			$(this).parent().parent().next(".subnavbg").hide();	
		}
	);
	$(".h-r-nav").hover(
		function(){
			$(this).addClass("h-r-nav-hover");			
	},
		function(){
			$(this).removeClass("h-r-nav-hover");
		}
	);
	
	//菜单
	//$(".menu .tit").click(
	//	function(){$(this).next(".submenu").slideToggle(300)}
	//); 	
	
//未来之星
var $searchli = $(".searchbar li");
       $searchli.hover(function(){
			$(this).addClass("cur").siblings().removeClass("cur");
			  var div_index = $searchli.index(this);
			  $(".nr .divindex").eq(div_index).show().siblings().hide();
       },function(){return false;});


//星之倩影
var $qysimg = $(".qylist img");
       $qysimg.hover(function(){
			  var qybimg = $qysimg.index(this);
			  $(".qy div").eq(qybimg).show().siblings().hide();
       },function(){return false;});
	   
//视频单元
var $vsimg = $(".vlist li img");
       $vsimg.hover(function(){
			  var vbimg = $vsimg.index(this);
			  $(".vlive div").eq(vbimg).show().siblings().hide();
									},function(){return false;});
});


