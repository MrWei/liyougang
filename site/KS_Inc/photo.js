﻿/*图片频道页面展示JS*/
function getOffset(e)
{
  var target = e.target;
  if (target.offsetLeft == undefined)
  {
    target = target.parentNode;
  }
  var pageCoord = getPageCoord(target);
  var eventCoord =
  {  
    x: window.pageXOffset + e.clientX,
    y: window.pageYOffset + e.clientY
  };
  var offset =
  {
    offsetX: eventCoord.x - pageCoord.x,
    offsetY: eventCoord.y - pageCoord.y
  };
  return offset;
}
function getPageCoord(element)    //计算从触发到root间所有元素的offsetLeft值之和。
{
  var coord = {x: 0, y: 0};
  while (element)
  {
    coord.x += element.offsetLeft;
    coord.y += element.offsetTop;
    element = element.offsetParent;
  }
  return coord;
}
function upNext(bigimg){
	var imgurl  = righturl;
    bigimg.onmousemove=function(e){
    var e=window.event || e,
        posX=(e.offsetX==undefined) ? getOffset(e).offsetX : e.offsetX ;
  if(posX<bigimg.width/2){
            bigimg.style.cursor    = 'url('+siteurl+'images/default/arr_left.cur),auto';
            imgurl                = lefturl;
        }else{
            bigimg.style.cursor    = 'url('+siteurl+'images/default/arr_right.cur),auto';
            imgurl                = righturl;
        }
    }
    bigimg.onmouseup=function(){
        location.href=imgurl;
    }
}
function upNext1(bigimg){
	var imgurl		= 1;
	bigimg.onmousemove=function(e){
    var e=window.event || e,
        posX=(e.offsetX==undefined) ? getOffset(e).offsetX : e.offsetX ;
  if(posX<bigimg.width/2){
			bigimg.style.cursor	= 'url('+siteurl+'images/default/arr_left.cur),auto';
			imgurl				= currPage-1;
		}else{
			bigimg.style.cursor	= 'url('+siteurl+'images/default/arr_right.cur),auto';
			imgurl				= currPage+1;
		}
	}
	bigimg.onmouseup=function(){
		showImg(imgurl);
	}
}

function addCookie(objName,objValue,objHours){//添加cookie
   var str = objName + "=" + escape(objValue);
   if(objHours > 0){//为0时不设定过期时间，浏览器关闭时cookie自动消失
    var date = new Date();
    var ms = objHours*3600*1000;
    date.setTime(date.getTime() + ms);
    str += "; expires=" + date.toGMTString();
   }
   document.cookie = str;
  }
  
  function getCookie(objName){//获取指定名称的cookie的值
   var arrStr = document.cookie.split("; ");
   for(var i = 0;i < arrStr.length;i ++){
    var temp = arrStr[i].split("=");
    if(temp[0] == objName) return unescape(temp[1]);
   } 
  }
  
var pic_top="150px"
var picgg_box=""
var interval = 5000;
var timerId = -1;
var derId = -1;
var replay = false;
var num = 0;
function forwards() {
 if (style=='4'){next(); }else{ window.location.href = righturl;}
 num=-1;
}
function $$(o){
return document.getElementById(o);
}
function derivativeNum() {
num++;
$$('displayNum').innerHTML = '[' + (interval/1000 - num) + ']';

}
function playNextPic(stat) {
if(stat || replay) {
derId = window.setInterval('derivativeNum();', 1000);
$$('displayNum').innerHTML = '[' + (interval/1000 - num) + ']';
$$('playid').onclick = function (){replay = false;playNextPic(false);};
$$('playid').innerHTML = '停止播放';
timerId = window.setInterval('forwards();', interval);
addCookie("photoautoplayer", true,0);
} else {
addCookie("photoautoplayer", false,0);
replay = true;
num = 0;
$$('playid').innerHTML = '幻灯播放';
$$('playid').onclick = function (){playNextPic(true);};
$$('displayNum').innerHTML = '';
window.clearInterval(timerId);
window.clearInterval(derId);
}
}
window.onload=function(){
 if (getCookie("photoautoplayer")=='true') playNextPic(true);
}

var initnum=4;//每次显示张数,根据页面滚动宽度可适当调整
var scrollWrapW=130;//每次滚动距离

var l;
$(document).ready(function () {
	l=$('#scrool_wrap li').length;
	iss=iss-1;
	
	$("#left").bind("click",ole);
	$("#right").bind("click",ori);
	var total = $('#scrool_wrap li').length;
	$("#zys").html(total); 
     
	
	$('#scrool_wrap li').eq(iss).find('img').eq(0).addClass('curimg');
	
	if(iss>0&&iss<initnum){
		var tiss=iss;
		var temscr=-scrollWrapW*(tiss);
		$("#scrool_wrap").animate({left:temscr},1000);
	}else{
		if(iss<=l-initnum){
			var tiss=iss;
			var temscr=-scrollWrapW*(tiss);
			$("#scrool_wrap").animate({left:temscr},1000);
		}else{
			var tiss=l-initnum;
			var temscr=-scrollWrapW*(tiss);
			$("#scrool_wrap").animate({left:temscr},1000);
			iss=tiss;
		}
	}
	
});

function ole(){
	if(iss==-1){
		iss=0;
	}else if(iss==(l-initnum)){
		olend();
	}else if(iss<(l-initnum)){
		var temscr=-scrollWrapW*(iss+1);
		$("#scrool_wrap").animate({left:temscr},1000);
		iss++;
	}
	
}
 function ori(){
 	if(iss>0){
		var temscr=-scrollWrapW*(iss-1);
		$("#scrool_wrap").animate({left:temscr},1000);
		iss--;
	}else {
		olend();
	}
 }
function  olend(){
	//alert("您已浏览完全部缩略图-----");
	if ($("#picend_showgg").html()!=""&&$("#picend_showgg").html()!=undefined) 
	{
		picend_showgg()
	}
}


var pgg_s = function(settings) {
	var defaults = {
	ggtype:"top",
	pic_s:"0px",
	picgl:"300px",
	s_opacity: "0",//透明度
	e_opacity: "10",//透明度
	timing: "500"//动画时间
	};
	var settings = $.extend(defaults, settings);
				picgg_box=$.dialog({
				id: 'Tips',
				title: false,
				content: $("#picend_showgg").html(),
				fixed: true,
				top:pic_top,
				min:false,
				max:false,
				padding: '0px',
				cancel: false,
				resize: false,
				init: function(){
						var duration = 300, /*动画时长*/
						api = this,
						opt = api.config,
						wrap = api.DOM.wrap;
						wrap.css(settings.ggtype, settings.pic_s);
						wrap.css('opacity', settings.s_opacity);
						switch (settings.ggtype)
						{
						case "top":
						  wrap.animate({top:settings.picgl, opacity:settings.e_opacity}, settings.timing, function(){});
						  break;
						case "left":
						  wrap.animate({left:settings.picgl, opacity:settings.e_opacity}, settings.timing, function(){});
						  break;
						case "right":
						  wrap.animate({right:settings.picgl, opacity:settings.e_opacity}, settings.timing, function(){});
						  break;
						case "bottom":
						  wrap.animate({bottom:settings.picgl, opacity:settings.e_opacity}, settings.timing, function(){});
						  break;
						default:
						  wrap.animate({top:settings.picgl, opacity:settings.e_opacity}, settings.timing, function(){});
						}
						//if (settings.ggtype=="top") ;
						//wrap.animate({top:settings.picgl, opacity:settings.e_opacity}, settings.timing, function(){									 
						//});
						
				},
				close:function(){
						var duration = 300, /*动画时长*/
							api = this,
							opt = api.config,
							wrap = api.DOM.wrap;
						wrap.animate({top:'-'+settings.picgl,opacity:0}, settings.timing, function(){
							opt.close = function(){};
							api.close();
						});
						return false;
					}
				});
	
}

function  picend_showgg(){
		  pgg_s({
		  	ggtype:"top",
			pic_s:"0px",
			picgl:"150px",
			s_opacity: "0",
			e_opacity: "10",
			timing: "500"
		  });
}

function  picend_showggclose(){
		var listbox = $.dialog.list;
		for( var i in listbox ){
			listbox[i].close();
		}
}

function  orend(){
	if ($("#picend_showgg").html()!=""&&$("#picend_showgg").html()!=undefined) 
	{picend_showgg()}
}
function prev(){showImg(currPage-1);}
function next(){showImg(currPage+1);}
function showImg(n){
	
	if (n<=0) return;
	if (n>totalput) 
	 {
		n=1;
		if ($("#picend_showgg").html()!=""&&$("#picend_showgg").html()!=undefined) 
		{picend_showgg()}
	 }
	 currPage=n;
	  $("#scrool_wrap").find("a").attr("class","normalthumb");
	  $("#t"+n).addClass("currthumb");
	  $("#currpa").html(n);
	  $("#currp").html(n);
	  $("#ShowLargeImg").hide().attr("src",imgArr[n-1]).fadeIn('slow');
	  $(".imageintro").html(introArr[n-1]);
}