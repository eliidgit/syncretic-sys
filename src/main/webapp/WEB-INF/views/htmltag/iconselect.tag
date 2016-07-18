@var class = class!'';
@var name = name!'icon';
@var value = value!'';
<div class=" input-group  clearfix ${class!}">
	<input type="hidden" value="${value}" name="${name}" id="${name}-input"/>
	<i class="${value} bigger-200 pink" style="vertical-align: middle;padding-right: 10px;"></i>
	<span class="btn  btn-warning" id="${name}-icon-btn">
		<i class="fa fa-search bigger-110"></i>查找
	</span>
</div>
<script>
$(function(){
	$("#${name}-icon-btn").click(function(){
		var iconDialog =   BootstrapDialog.show({
		 	title:'选择图标',
		 	size:BootstrapDialog.SIZE_WIDE,
        	message: $('<div></div>').load('${ctxPath}/sys/tag/fontawesome?id=${name}-input')
   		 });
	});
});
</script>
