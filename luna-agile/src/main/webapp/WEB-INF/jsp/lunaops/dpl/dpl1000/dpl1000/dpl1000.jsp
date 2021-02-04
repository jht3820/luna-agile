<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<!-- begin page DOM -->
<div class="kt-portlet kt-portlet--mobile">
<!-- begin :: head -->
	<!-- begin :: 타이틀 + 카드형,데이터테이블형 변환 버튼 -->
	<div class="kt-portlet__head kt-portlet__head--lg">
		<!-- begin :: 타이틀  -->
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
		<!-- end :: 타이틀  -->
	
		<!-- begin :: 조회 등록 수정 삭제 버튼 영역 -->
		<div class="kt-portlet__head-toolbar">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="select" title="배포 계획 생성 관리 관리 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
				<i class="fa fa-list"></i><span>조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="insert" title="배포 계획 생성 관리 관리 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="6">
				<i class="fa fa-plus"></i><span>등록</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="update" title="배포 계획 생성 관리 관리 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="7">
				<i class="fa fa-edit"></i><span>수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="delete" title="배포 계획 생성 관리 관리 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8">
				<i class="fa fa-trash-alt"></i><span>삭제</span>
			</button>
		</div>
		<!-- end :: 조회 등록 수정 삭제 버튼 영역 -->
	</div>
	<!-- end :: 내용 CRUD관련 영역 -->
	<div class="kt-portlet__body">
		<!-- begin :: 내용 CRUD관련 영역 -->
		<!-- begin :: 검색 영역 -->
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="dpl1000Table">
				<div class="input-group">
					<div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
						<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="dpl1000Table">
							<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
							<a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a>
							<a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a>
							<a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a>
						</div>
					</div>
					<select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_dpl1000Table" name="searchSelect" aria-hidden="true" data-datatable-id="dpl1000Table" style="display: none;"></select>
					<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="dpl1000Table">
						<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_dpl1000Table" id="searchData_dpl1000Table" data-datatable-id="dpl1000Table">
						<span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
						<input type="hidden" name="searchStartDt" id="searchStartDt_dpl1000Table" data-datatable-id="dpl1000Table">
						<input type="hidden" name="searchEndDt" id="searchEndDt_dpl1000Table" data-datatable-id="dpl1000Table">
					</div>
					<div class="input-group-append">
						<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="dpl1000Table">
							<i class="fa fa-search"></i><span class=""><span>검색</span></span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- end :: 검색 영역 -->
		<!-- begin :: 데이터테이블형 -->
		<div class="kt_datatable osl-datatable-footer__divide" id="dpl1000Table"></div>
		<!-- end :: 데이터테이블형 -->
	</div>
<!-- end :: head -->
</div>

<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLDpl1000Popup = function () {
	var documentSetting = function(){
		$.osl.datatable.setting("dpl1000Table",{
			data: {
				source: {
					read: {
						url: "/req/req1000/req1000/selectReq1000ListAjaxView.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'prjNm', title: '결재 상태', textAlign: 'center', width: 100, search: true},
				{field: 'reqOrd', title: '배포 상태', textAlign: 'center', width: 100, autoHide: false},
				{field: 'reqProTypeNm', title: '배포 버전', textAlign: 'center', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortField: "reqProTypeCd"},
				{field: 'reqNm', title: '배포 명', textAlign: 'center', width: 300, search: true},
				{field: 'reqDtm', title: '배포 방법', textAlign: 'center', width: 70, search: true, searchType:"date"},
				{field: 'reqDtm', title: '배포 일자', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'reqDtm', title: '배포자', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'reqDtm', title: '배포 설명', textAlign: 'center', width: 100, search: true, searchType:"date"},
			],
			actionBtn:{
				"dblClick": true 
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							modalTitle: '배포 계획 추가',
							autoHeight: false,
							modalSize: 'xl'
						};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1001View.do',data,options);
				},
				
				"update":function(rowData, datatableId, type, rowNum, elem){
					if(rowData.reqProType != "01"){
						$.osl.alert('접수 요청중인 요구사항만 수정 가능합니다.');
						return false;
					}
					var data = {
						};
					var options = {
							modalTitle: '배포 계획 수정',
							autoHeight: false,
							modalSize: 'xl'
						};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1001View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					
				},
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					var data = {
						};
					var options = {
							modalTitle: '[배포 명] 상세팝업',
							autoHeight: false,
							modalSize: 'xl'
						};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1002View.do',data,options);
				}
			}
		});
			
				
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl1000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
