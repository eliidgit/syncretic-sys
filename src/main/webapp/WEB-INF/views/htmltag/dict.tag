@var type = type!'';
@var value = value!'';
@var dictMode = dictMode!"showSelect";
@var width = width!'100%';
@var isDefault = isDefault!"";
@var showType = showType!false;
@var class = class!'';
@var id = id!'chosen-select';
@var name = name!'type';
@var isScript = isScript!'false'; //是否有改变事件
@var placeholder = placeholder !'';

@if(dictMode == "showSelect"){ //显示下拉模式
<select class="form-control select2" style="width: ${width};" name="${name}" id="${id}" data-placeholder="${placeholder}">
	@if(!isEmpty(isDefault)) {
	<option value=""></option>
	<option value="">全部</option>
	@}
	@if(!showType){
		@for(item in dict.getDictListByType(type)){
			<option value="${item.value!}" 
				${decode(value!,item.value,'selected','')}>
			${item.label!}
			</option>
		@}
	@}else{
		@for(item in getDictListByType(type,"allType")){
			<option value="${item.key!}">
				${item.key!}
			</option>
		@}
	@}
</select>
@}else if(dictMode == "showName"){ //显示类型名称
	@for(item in getDictListByType(type)){
		@if(value == item.value && type == item.type){
			${item.label!}
			@break;
		@}
	@}elsefor{}
@}
<script type="text/javascript">
@if(isScript == "true"){
	${tagBody!}
@}
$('.select2').select2();
</script>