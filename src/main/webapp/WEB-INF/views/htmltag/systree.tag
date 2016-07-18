@var treeData=treeData!;
@var height = height!'0';
@var width = width!'50%';
@var reloadUrl = reloadUrl!false;
@var rootNodeName = rootNodeName!"全部";
@var id = id!'tree';
@var idKey = idKey!'id';
@var pIdKey = pIdKey!'parentId';
@var clickCallback = clickCallback ! '';

<script type="text/javascript">
	var setting = {
		view:{
			expandSpeed:100,
			selectedMulti : false,
			fontCss:function(treeId, treeNode) {
				return (!!treeNode.highlight) ? {"font-weight":"bold","color":"red"} : {"font-weight":"normal","color":"#333"};
			}
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "${idKey}",
				pIdKey : "${pIdKey}"
			}
		},
		callback: {
			onClick: onClickNode,
			beforeDrag: function(){return false;}
		}
	};
	
	//节点点击事件
	function onClickNode(event, treeId, treeNode) {
		@if(!isEmpty(clickCallback)){
			${clickCallback}(event,treeId,treeNode);
		@}
		for(var i=0, l=nodeList.length; i<l; i++) {
			nodeList[i].highlight = false;				
			treeObj.updateNode(nodeList[i]);
		}
		return false;
	};
	
	function searchNode(value) {
		// 按名字查询
		var keyType = "name";
		// 如果要查空字串，就退出不查了。
		if (value === "") {
			var node = treeObj.getNodeByParam("id", 0);
			treeObj.selectNode(node,false);
			if(undefined != nodeList) {
				for(var i=0, l=nodeList.length; i<l; i++) {
					nodeList[i].highlight = false;				
					treeObj.updateNode(nodeList[i]);
				}
			}
			return;
		}
		updateNodes(false);
		nodeList = treeObj.getNodesByParamFuzzy(keyType, value);
		updateNodes(true);
	};
	function updateNodes(highlight) {
		for(var i=0, l=nodeList.length; i<l; i++) {
			nodeList[i].highlight = highlight;				
			treeObj.updateNode(nodeList[i]);
			treeObj.expandNode(nodeList[i].getParentNode(), true, false, false);
		}
	};
	
	var treeObj;
	$(function(){
		//树结构初始化
		nodeList=[]; //清除缓存
		var treeData = ${treeData};
		var root = {id:0,name:"${rootNodeName}",open:true};
		treeData[treeData.length] = root;
		$.fn.zTree.init($("#${id}"), setting,treeData);
		treeObj = $.fn.zTree.getZTreeObj("${id}");
		// 默认展开一级节点
		var nodes = treeObj.getNodesByParam("level", 0);
		for(var i=0; i<nodes.length; i++) {
			treeObj.expandNode(nodes[i], true, false, false);
		}
	});
</script>
