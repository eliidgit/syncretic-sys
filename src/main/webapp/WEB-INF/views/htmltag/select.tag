@var id = id!"chosen-select";
@var name = name!;
@var width = width!"100%";
@if(width=="") width = "100%";
@var class = class!;
@var placeholder = placeholder !'';
@var value=value!;
@var multiple = multiple!'';

<select class="chosen-select ${class}" ${multiple} data-placeholder="${placeholder}" name="${name}" id="${id}" value="${value}">
	${tagBody!}
</select>
