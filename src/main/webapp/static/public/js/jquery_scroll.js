(function($){
	$.fn.picScroll=function(option){
	   var defaults={
		   index:0,//第几个开始
		   len:4,//默认图片数量
		   autoScroll:4000//默认滚动事件
	   }
	  var option=$.extend(defaults,option)
	  var $this=$(this);
	  $this.find("li").eq(0).css({display:"block"});
	  $("div.focus_txt").children("p").eq(0).show();
	  //左右按钮点击
	  $this.find("div.focus_left").click(function(){
		 window.clearInterval(time);
		 
		 if(option.index>=0){
			 option.index--; 
			
			 $this.find("li").eq(option.index).stop().fadeIn().siblings("li").fadeOut();
			  com();
		 }else if(option.index<0){
			 
			 option.index=option.len-1;
			  //alert(option.index+"1000")
			  $("div.focus_pic").find("li").eq(option.index).stop().fadeIn().siblings("li").fadeOut();
			 //alert(option.index)
			 
		 }
		autoScroll(); 
	 });
	 $this.find("div.focus_right").click(function(){
		 window.clearInterval(time);
		 if(option.index<option.len-1){
			 option.index++; 
			// alert(index);
			 $this.find("li").eq(option.index).stop().fadeIn().siblings("li").fadeOut();
			  com();
		 }else if(option.index==option.len-1){
			option.index=0; 
			$this.find("li").eq(option.index).stop().fadeIn().siblings("li").fadeOut();
			 com();	
		 }
		autoScroll(); 
	 });
	 //
	 $this.find("div.focus_btn").find("a").click(function(){
		 window.clearInterval(time);
		 $this.find("li").eq($(this).index()).stop().fadeIn().siblings("li").fadeOut();
		 option.index=$(this).index();
		 com();	
		 autoScroll(); 
		 
	 })
	  function com(){
		  $this.find("div.focus_btn").find("a").removeClass("active");
		  $this.find("div.focus_btn").find("a").eq(option.index).addClass("active");	 
		  $this.find("div.focus_txt").find("p").hide();
		  $this.find("div.focus_txt").find("p").eq(option.index).show(); 
		  
	  }
	  //自动播放
	   autoScroll();
	  
	  function autoScroll(){
		 
		 time=window.setInterval(function(){
			if(option.index<option.len-1){
				//alert(option.index)
			   option.index++;
			     //alert(10)
			   $this.find("li").eq(option.index).stop().fadeIn().siblings("li").fadeOut();
			   com();
			}else if(option.index==option.len-1){
			   option.index=0;	
			    $this.find("li").eq(0).stop().fadeIn().siblings("li").fadeOut();
			    com();
			}
			 
		 },option.autoScroll) 
	 }
	}
})(jQuery)