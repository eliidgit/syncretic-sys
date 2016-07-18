@var class = class!'width-100 '; //样式
@var modelId = modelId!'parentId'; //隐藏要提交的id (实体属性)
@var modelName = modelName!''; //要提交的name (实体属性)
@var modelIdValue = modelIdValue!'0'; //id初始值value 
@var modelNameValue = modelNameValue!''; //name初始值value
@var style = style!'';
@var treeSelectId = treeSelectId!'select-tree'; //树id,即是树对象名称
@var title= title !'请选择';
@var cruId=curId!0;
@var excludeExpr = excludeExpr ! 'false';
@var valueColumn = valueColumn ! 'id';
@var selectType = selectType ! '1';//1是可以选择任意节，2是只可以选择子
@var expandAll = expandAll !'false';
@var callback = callback!'';


<div class="input-group   ${class}" style="${style}" id="${treeSelectId}">
	<input type="hidden" name="${modelId}"  value="${modelIdValue}"/>
	<input class="form-control" type="text" name="${modelName}" value="${modelNameValue}" disabled
	@if(!isEmpty(isCheck)){
		datatype="*"  nullmsg=${isCheck}
	@}
	>
	<span class="input-group-btn">
		<button class="btn btn-primary" onclick="treeSelect()" type="button">
			<i class="fa fa-search"></i>查找
		</button>
	</span>
</div>

<script type="text/javascript">
	function treeSelect(){
		var treeDialog = BootstrapDialog.show({
	 		title:'${title}',
	      	message: '<div id="${treeSelectId}-tree"></div>',
	      	onshown:function(){
	      		$("#${treeSelectId}-tree").yunmel_tree({data:${data}});
	      		
	      		@if(expandAll == "true"){
	      			 $("#${treeSelectId}-tree").tree('discloseAll');
	      		@}
	      		
	      		$("#${treeSelectId}-tree").on("loaded.fu.tree",function(e){
	      			//当前修改的字点以前其子节点不能作为自己的父节点
	      			var li = $("#${treeSelectId}-tree").find("li[id=${cruId}]").remove();
	      			
	      			//自定义不需要显示的部分
	      			@if(!isEmpty(excludeExpr)){
	      				$("#${treeSelectId}-tree").find("li[${excludeExpr}]").remove();
	      			@}
	      		});
	      	},
	      	 buttons: [{
		        id: 'btn-ok',   
		        icon: 'fa fa-check',       
		        label: '选中',
		        cssClass: 'btn-primary', 
		        autospin: false,
		        action: function(dialogRef){    
		            var obj = $("#${treeSelectId}-tree").tree("selectedItems");
		           	  @if(selectType == "2"){
		           	  	  if(obj[0].children.length > 0){
		           	  	  	msg.warning("请选择子节点");
		           	  	  	return;
		           	  	  }
		           	  @}
		             if(obj != undefined && obj.length > 0){
		            	$("#${treeSelectId} input[name='${modelId}']").val(obj[0]['${valueColumn}']);
		            	$("#${treeSelectId} input[name='${modelName}']").val(obj[0].name);
		             	@if(!isEmpty(callback)){
		             		${callback}(obj[0]['${valueColumn}']);
		             	@}
		             }
		            treeDialog.close();
		        }
		    },{
		        id: 'btn-cancen',   
		        label: '取消',
		        cssClass: 'btn-default', 
		        autospin: false,
		        action: function(dialogRef){    
		            dialogRef.close();
		        }
		    }]
	 	});
	}
</script>


