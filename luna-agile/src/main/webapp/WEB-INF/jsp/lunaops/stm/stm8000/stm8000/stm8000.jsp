<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="check" title="접속 확인" data-title-lang-cd="" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="check" tabindex="1">
					<i class="fa flaticon2-check-mark"></i><span data-lang-cd="">접속확인</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="select" title="저장소 조회" data-title-lang-cd="stm8000.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="insert" title="저장소 추가" data-title-lang-cd="stm8000.actionBtn.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="3">
					<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="update" title="저장소 수정" data-title-lang-cd="stm8000.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="4">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="delete" title="저장소 삭제" data-title-lang-cd="stm8000.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="5">
					<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-12">
				<div class="osl-datatable-search" data-datatable-id="stm8000RepTable"></div>
			</div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide" id="stm8000RepTable"></div>
	</div>
</div>
<!-- begin page script -->
<script>
 "use strict";

 var OSLStm8000Popup = function() {
	 
	 var datatableId = "stm8000RepTable";
	 
	 var documentSetting = function() {
		 $.osl.datatable.setting(datatableId,{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000ListAjax.do"
						}
					},
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'rn', title: '접속 결과', textAlign: 'center', width: 35, autoHide: false, sortable: false},
					{field: 'useNm', title: '사용 여부', textAlign: 'center', width: 35, search: true, searchType:"select", searchCd: "CMM00001", searchField:"usrCd", sortField:"usrCd"},
					{field: 'strgTypeNm', title: '유형', textAlign: 'left', width: 40, search: true, searchType:"select", searchCd: "STM00004", searchField:"strgTypeCd", sortField: "strgTypeCd"},
					{field: 'strgRepTitle', title: '저장소명', textAlign: 'left', width: 150, search: true},
					{field: 'strgTxt', title: '저장소 설명', textAlign: 'left', width: 240, search: true},
					{field: 'strgRepUrl', title: '저장소 URL', textAlign: 'left', width: 240},
				],
				rows:{
					clickCheckbox: true
				},
				actionBtn:{
					"title" : "수정 / 삭제 / 접속 확인",
					"dblClick": true,
					"check" : true,
				},
				actionTooltip:{
					"update": "수정",
					"delete": "삭제",
					"check" : "접속 확인",
				},
				actionFn:{
					"insert":function(datatableId, type, rowNum){
						var data = {type:"insert"};
						var options = {
								idKey: datatableId,
								modalTitle: "저장소 추가",
								closeConfirm: false,
								autoHeight:false,
							};
						
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8001View.do',data,options);
					},
					"update":function(rowData, datatableId, type){
						var data = {
								type:"update",
								strgRepId: rowData.strgRepId,
							};
						var options = {
								idKey: datatableId,
								modalTitle: "저장소 수정",
								closeConfirm: false,
								autoHeight:false,
							};
						
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8001View.do',data,options);
					},
					"delete":function(rowDatas, datatableId, type){
						var data = {
								deleteDataList : JSON.stringify(rowDatas),
							};
						//AJAX 설정
				    	var ajaxObj = new $.osl.ajaxRequestAction(
				    			{"url":"<c:url value='/spr/spr2000/spr2000/deleteSpr2000MmtListAjax.do'/>"}
				    				, data);
						//AJAX 전송 성공 함수
				    	ajaxObj.setFnSuccess(function(data){
				    		if(data.errorYn == "Y"){
								$.osl.alert(data.message,{type: 'error'});
								//모달 창 닫기
								$.osl.layerPopupClose();
							}else{
								$.osl.toastr(data.message);
								selectBtnClick();
							}
				    	});
				    	//AJAX 전송
						ajaxObj.send();
					},
					"dblClick":function(rowData, datatableId, type, rowNum){
						var data = {
								strgRepId: rowData.strgRepId,
							};
						var options = {
								idKey: rowData.strgRepId,
								modalTitle: "["+$.osl.escapeHtml(rowData.strgRepTitle)+"] 저장소 상세보기",
								modalSize: "fs",
								closeConfirm: false
							};
						
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8002View.do',data,options);
					},
					"check" : function(rowDatas, datatableId, type, rowNum){
						if(type == "list"){
							//선택 항목이 리스트인 경우
							if(rowNum == 0){
							}else if(rowNum == 1){
							}else{
								//다중인 경우
							}
						}else{
							//선택 항목이 row 단건인 경우
						}
					}
				},
				theme:{
					actionBtn:{
						"check" : ""
					},
					actionBtnIcon:{
						"copy" : "fa flaticon2-check-mark",
					}
				}
		 });
	 }
	 
	 return {
		 init: function(){
			 documentSetting();
		 }
	 };
 }();
 
 $.osl.ready(function(){
	 OSLStm8000Popup.init();
 });
</script>
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />