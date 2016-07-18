if (typeof jQuery === "undefined") {
  throw new Error("YunMel requires jQuery");
}

$.YunMel = $.ym = {};
$(function () {
	"use strict";
});

/*****辅助工具类*********/
$.yh = $.YunMel.helper = {
  //---------变量区-------------
  name:'names',
  
  //---------方法区-------------
  //get方式ajax加载页面
  //path为需要加载的页面路径
  loadHtml:function(path){
  	var result;
	$.ajax({
	  url: path,
	  dataType: "text",
	  async: false,
	  success: function(html) {
		result = html;
	  }
	});
	return result;
  },
  //post方式加载页面
  //path为加载路径，data为加载参数
  loadHtmlByPost:function(path,data){
  	var result;
	$.ajax({
	  url: path,
	  method:'post',
	  data:data,
	  dataType: "text",
	  async: false,
	  success: function(html) {
		result = html;
	  }
	});
	return result;
  },

  getCenterHeight:function(){
  	//- $("#navbar").outerHeight()
	  return $(window).height();
  },

  sprintf : function (str) {
    var args = arguments,
    flag = true,
    i = 1;
	  str = str.replace(/%s/g, function () {
      var arg = args[i++];
      if (typeof arg === 'undefined') {
        flag = false;
        return '';
      }
      return arg;
	  });
	  return flag ? str : '';
  }
}

/*****消息提示*********/
$.ymsg = $.YunMel.msg = {
  sucess:function(str){
	 var msg = $.yh.sprintf(str);
  },
  error:function(str){
	  var msg = $.yh.sprintf(str);
  },
  warning:function(str){
	  var msg = $.yh.sprintf(str);
  },
  info:function(str){
	  var msg = $.yh.sprintf(str);
  }
}

/*****文件操作*********/
$.yf = $.YunMel.file = {
  download:function(formid,action,params){
    var $tempForm=$("<form style='display:none;'></form>");
    if(params != undefined){
      $.each(params,function(key,value){
        var $input=$("<input name='"+key+"' value='"+ (value == undefined ? '':value)  +"'/>");
        $tempForm.append($input);
      })
    }
    if(formid != undefined && formid != null && formid != ''){
      var curForm=$("#"+formid);
      var queryParams=curForm.serialize();
      var paramArr=queryParams.split("&");
      queryParams = decodeURIComponent(queryParams,true);//将中文解码进行还原
      for(var i=0;i<paramArr.length;i++){
        var paramValue=paramArr[i].split("=");
        var paramName=paramValue[0];
        var paramValue=paramValue[1];
        var $input=$("<input name='"+paramName+"' value='"+paramValue+"'/>");
        $tempForm.append($input);
      }
    }
    
    $("body").append($tempForm);
    $tempForm.attr("action",action);
    $tempForm.attr("method","post");
    $tempForm.submit();
    $tempForm.remove();
  }
}
$(function () {
  var slideToTop = $("<div />");
  slideToTop.html('<i class="fa fa-chevron-up"></i>');
  slideToTop.css({
    position: 'fixed',
    bottom: '20px',
    right: '25px',
    width: '40px',
    height: '40px',
    color: '#eee',
    'font-size': '',
    'line-height': '40px',
    'text-align': 'center',
    'background-color': '#222d32',
    cursor: 'pointer',
    'border-radius': '5px',
    'z-index': '99999',
    opacity: '.7',
    'display': 'none'
  });
  slideToTop.on('mouseenter', function () {
    $(this).css('opacity', '1');
  });
  slideToTop.on('mouseout', function () {
    $(this).css('opacity', '.7');
  });
  $('.wrapper').append(slideToTop);
  $(window).scroll(function () {
    if ($(window).scrollTop() >= 150) {
      if (!$(slideToTop).is(':visible')) {
        $(slideToTop).fadeIn(500);
      }
    } else {
      $(slideToTop).fadeOut(500);
    }
  });
  $(slideToTop).click(function () {
    $("body").animate({
      scrollTop: 0
    }, 500);
  });
  $(".sidebar-menu li:not(.treeview) a").click(function () {
    var $this = $(this);
    var target = $this.attr("href");
    if (typeof target === 'string') {
      $("body").animate({
        scrollTop: ($(target).offset().top) + "px"
      }, 500);
    }
  });
  //Skin switcher
  var current_skin = "skin-blue";
  $('#layout-skins-list [data-skin]').click(function(e) {
    e.preventDefault();
    var skinName = $(this).data('skin');
    $('body').removeClass(current_skin);
    $('body').addClass(skinName);
    current_skin = skinName;
  });
});

/*ajax globle setting >> shiro session time out.*/
$.ajaxSetup({
  complete:function(XMLHttpRequest,textStatus){
    var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus"); // 通过XMLHttpRequest取得响应头，sessionstatus，
    if(sessionstatus=="timeout"){
	  window.location.replace("/login");   
    }
  }
});
$(document).ajaxStart(function() { Pace.restart(); }); 