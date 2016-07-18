@var formId = formId!'save-form'; //form表单id
@var isHide = isHide!'no'; //是否隐藏按钮 默认no
@var subBtnId = subBtnId!(formId+'-save');
@var validId = validId!(strutil.replace(formId,"-",""));
@var config = config!'false';
@var data = data!'';
@var okText = okText!'保 存';
@var callback = callback!'';

@if(isHide == "no"){
<div class="layer-footer">
	<button class="btn btn-primary" id="${subBtnId}">${okText}</button>
	<button class="btn btn-default" id="${formId}-cancel">取消</button>
</div>
@}
<script type="text/javascript">

var count = 0;
$(function(){
	
var ${validId} = $("#${formId}").Validform({
		ajaxPost : true,
		beforeSubmit:function(curform){
			var loadi = layer.load(5,2);
			$("#${formId}").data('loadi',loadi);
		},
		callback:function(data){
			layer.close($("#${formId}").data('loadi'));
			if(data>0) {
				layer.msg('操作成功', {
					  icon: 1,
					  time: 2000 
					},function(){
						if("${callback}" != undefined && "${callback}".length > 0){
							${callback};
						}else{
							location.reload();
						}
						layer.closeAll();
				});
			}else{
				layer.msg('操作失败',{icon:2});
			}
		},
		tiptype : function(msg, o, cssctl) {
			if (!o.obj.is("form")) {
				if (o.type != 2) {
				 	if(msg.indexOf("所填信息没有经过验证") >= 0){//触发ajax url
				 		if(count > 0){
				 			layer.alert("请检查必须唯一的值","检验错误");
				 		}else{//第一次直接触发
				 			count++;
					 		$(o.obj).focus();
					 		$(o.obj).blur();
				 		}
				 	}else if(msg.indexOf("请换一个") >=0 || msg.indexOf("占用") >=0){
				 		layer.alert(msg,3,"检验错误");
				 	}else{
						layer.tppm(msg,o.obj,{
							  tppm: [2, 'red'],
							  time: 4000
						});
				 	}
				}
			}
		},
		tppmweep : true
	});

	$("#${subBtnId}").click(function() {
		if("${config}" == "true"){
			${tagBody!}
		}
		${validId}.submitForm(false);
		return false;
	}); 
	
	$("#${formId}-cancel").click(function(){
		layer.closeAll();
		return false;
	});
	
	$("#${formId} input,#${formId} textarea").blur(function(){
		layer.closeAll("tppm");
		return false;
	})
});
</script>