<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<input type="hidden" id="sprId" name="sprId" value="${param.sqrId }"/>
<input type="hidden" id="sprNm" name="sprNm" value="${param.sqrNm }"/>
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-5 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="spr1100.title.sprint">스프린트 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr1000SprTable" data-datatable-action="select" title="스프린트 조회" data-title-lang-cd="spr1100.actionBtn.title.sprSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portelt__body">
				<div class="col-lg-8 col-md-8 col-sm-8 col-8 kt-padding-l-25">
					<div class="osl-datatable-search" data-datatable-id="spr1000SprTable"></div>
				</div>
				<div class="kt_datatable osl-datatable-footer__divide" id="spr1000SprTable"></div>
			</div>
		</div>
	</div> <!-- 스프린트 목록 끝 -->
	<!-- 우측 -->
	<div class="col-lg-7 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span id="sprNmStr"></span><span data-lang-cd="spr2100.title">회고록 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2100RptTable" data-datatable-action="select" title="회고록 조회" data-title-lang-cd="spr2100.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2100RptTable" data-datatable-action="insert" title="회고록 추가" data-title-lang-cd="spr2100.actionBtn.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
							<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2100RptTable" data-datatable-action="update" title="회고록 수정" data-title-lang-cd="spr2100.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
							<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2100RptTable" data-datatable-action="delete" title="회고록 삭제" data-title-lang-cd="spr2100.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
							<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2100RptTable" data-datatable-action="dblClick" title="회고록 상세" data-title-lang-cd="spr2100.actionBtn.detailTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="dblClick" tabindex="5">
							<i class="fa flaticon2-document"></i><span data-lang-cd="spr2100.button.detailBtn">상세</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portelt__body">
				<div class="osl-datatable-search" data-datatable-id="spr2100RptTable"></div>
				<div class="kt_datatable" id="spr2100RptTable"></div>
			</div>
		</div> <!-- 회고록 목록 끝 -->
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLSpr2100Popup = function () {
	//스프린트 데이터 테이블
	var sprDatatableId = "spr1000SprTable";
	//회고록 목록 테이블
	var mmrDatatableId = "spr2100RptTable";
	
	var documentSetting = function(){
		//스프린트 데이터 테이블 셋팅
		$.osl.datatable.setting(sprDatatableId,{
			data:{
				source:{
					read:{
						url: "/spr/spr1000/spr1000/selectSpr1000SprListAjax.do"
					}
				}
			},
			columns:[
				{field: 'sprTypeNm', title: '상태', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "SPR00001", searchField:"sprTypeCd", sortable: true, sortField:"sprTypeCd"},
				{field: 'sprNm', title: '스프린트명', textAlign: 'left', width: 240, autoHide: false, search: true, sortField: "sprNm"},
				{field: 'sprStDt', title: '시작일', textAlign: 'center', width: 120, sortField: "sprStDt",
					template: function (row) {
						var paramDatetime = new Date(row.sprStDt);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'sprEdDt', title:'종료일', textAlign: 'center', width: 120, sortField: "sprEdDt",
					template: function (row) {
						var paramDatetime = new Date(row.sprEdDt);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}	
				},
			],
			searchColumns:[
				{field: 'sprDesc', title: '스프린트 설명', searchOrd: 3},
				{field: 'sprDtm', title: '기간', searchOrd:4, searchType:"daterange"}
			],
			actionBtn:{
				"title" : $.osl.lang("spr1100.actionBtn.title.selectBtn"),
				"click": true,
				"delete":false,
				"update":false,
			},
			actionTooltip:{
				"click" : $.osl.lang("spr1100.actionBtn.tooltip.clickToolTip"),
			},
			actionFn:{
				"select": function(datatableId, elem){
					//검색 대상 가져오기
					var searchTypeTarget = $(".osl-datatable-search__dropdown[data-datatable-id="+datatableId+"] > .dropdown-item.active");
					
					//검색 값
					var searchData = $("#searchData_"+datatableId);

					//대상 정보 가져오기
					var searchFieldId = searchTypeTarget.data("field-id");
					var searchType = searchTypeTarget.data("opt-type");
					var searchCd = $(this).data("opt-mst-cd");
					
					//입력된 검색값 초기화
					$.osl.datatable.list[datatableId].targetDt.setDataSourceQuery({});
					
					//전체가 아닌경우 해당 타입으로 검색
					if(searchType != "all"){
						var searchDataValue = searchData.val();
						
						//공통코드인경우 select값 가져오기
						if(searchType == "select"){
							searchDataValue = $("#searchSelect_"+datatableId).val();
						}
						
						$.osl.datatable.list[datatableId].targetDt.search(searchDataValue,searchFieldId);
					}else{
						$.osl.datatable.list[datatableId].targetDt.search();
						
						//검색한 경우 기존에 선택 항목 초기화
						$("#sprId").val("");
						$("#sprNm").val("");
						$("#sprNmStr").text("");
						selectBtnClick();
					}
				},
				"click": function(rowData){
					$("#sprId").val(rowData.sprId);
					$("#sprNm").val(rowData.sprNm);
					$("#sprNmStr").text(rowData.sprNm + " ");
					selectBtnClick();
				}
			}
		});

		//회고록 목록 테이블 세팅
		$.osl.datatable.setting(mmrDatatableId,{
			data:{
				source:{
					read:{
						url: "/spr/spr2000/spr2100/selectSpr2100MmrListAjax.do"
					}
				},
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 80, sortField: "rn"},
				{field: 'mmrNm', title: '회고록 제목', textAlign: 'left', width: 80},
				{field: 'mmrUsrId', title: '작성자', textAlign: 'left', width: 80,
					template: function (row) {
						if($.osl.isNull(row.mmrUsrId)){
							return "";
						}else{
							var usrData = {
									html: row.mmrUsrNm,
									imgSize: "sm",
									class:{
										cardBtn: "osl-width__fit-content"
									}
							};
							return $.osl.user.usrImgSet(row.mmrUsrImgId, usrData);
						}
					},
					onclick: function(row){
						$.osl.user.usrInfoPopup(row.mmrUsrImgId);
					}	
				},
				{field: 'mmrDtm', title: '작성일', textAlign: 'center', width: 120, sortField: "reqDtm",
					template: function (row) {
						var paramDatetime = new Date(row.mmrDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			rows:{
				clickCheckbox: true
			},
			actionBtn:{
				"title": $.osl.lang("spr2100.actionBtn.title"),
				"dblClick": true,
			},
			actionTooltip:{
				"update": $.osl.lang("spr2100.actionBtn.updateTooltip"),
				"delete" : $.osl.lang("spr2100.actionBtn.deleteTooltip"),
				"dblClick" : $.osl.lang("spr2100.actionBtn.detailTooltip")
			},
			actionFn:{
				"insert":function(rowData){
					if($.osl.isNull($("#sprId").val())){
						//스프린트를 선택하지 않았으면
						$.osl.alert($.osl.lang("spr2100.message.selectMsg"));
						return false;
					}
					var data = {
						type: "insert",
						sprId : $("#sprId").val(),
						sprNm : $("#sprNm").val(),
					};
					var options = {
						idKey: "spr2101_insert",
						modalTitle: "[ "+$.osl.lang("spr2100.title.insertTitle")+" ]",
						closeConfirm: true,
						autoHeight: false,
						modalSize: "xl",
					};
					$.osl.layerPopupOpen('/spr/spr2000/spr2100/saveSpr2101MmrView.do',data,options);
				},
				"update":function(rowData){
					var data = {
							type: "update",
							mmrId : rowData.mmrId,
							sprId : rowData.sprId
						};
						var options = {
							idKey: "spr2101_update",
							modalTitle: "[ "+$.osl.lang("spr2100.title.updateTitle")+" ]",
							closeConfirm: true,
							autoHeight: false,
							modalSize: "xl",
						};
						$.osl.layerPopupOpen('/spr/spr2000/spr2100/saveSpr2101MmrView.do',data,options);
				},
				"delete":function(rowData){
					var data = {
						dataList : JSON.stringify(rowData)
					};
					//AJAX 설정
			    	var ajaxObj = new $.osl.ajaxRequestAction(
			    			{"url":"<c:url value='/spr/spr2000/spr2100/deleteSpr2100MmrListAjax.do'/>"}
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
				"dblClick": function(rowData){
					var data = {
							type: "update",
							mmrId : rowData.mmrId,
							sprId : rowData.sprId
						};
					var options = {
						idKey: "spr2101_detail",
						modalTitle: "[ "+$.osl.lang("spr2100.title.detailTitle")+" ]",
						closeConfirm: true,
						autoHeight: false,
						modalSize: "xl",
					};
					$.osl.layerPopupOpen('/spr/spr2000/spr2100/selectSpr2102View.do',data,options);
				}
			},
		});
	};
	
	/**
	* selectBtnClick : 회고록 목록 조회 버튼 클릭
	*/
	var selectBtnClick = function(){
		var sprId = $("#sprId").val();
		$.osl.datatable.list[mmrDatatableId].targetDt.setDataSourceParam("sprId", sprId);
		$("button[data-datatable-id="+mmrDatatableId+"][data-datatable-action=select]").click();
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        },
		reload: function() {
    		selectBtnClick();
    	}
    };
}();

$.osl.ready(function(){
	OSLSpr2100Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
