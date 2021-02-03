<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<!-- begin :: form -->
<form class="kt-form" id="spr1001">
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__body">
			<div class="row kt-padding-l-20 kt-padding-r-20">
			
				<!-- begin :: 스프린트 이름 -->
				<div class="col-12 text-center kt-margin-t-20"><h1 class="font-weight-bold">스프린트 이름</h1></div>
				<!-- end :: 스프린트 이름 -->
				
				<!-- begin :: 스프린트 시간, 관리자, 설명 -->
				<div class="col-12 text-right">2020-01-01 11:40</div>
				<div class="col-12 text-right">관리자</div>
				<div class="col-12 text-right">스프린트 설명</div>
				<!-- end :: 스프린트 시간, 관리자, 설명 -->
				
				<!-- begin :: 스프린트 내용 table -->
				<div class="table border kt-margin-t-20">
					<div class="row kt-margin-0">
						<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">전체 배정 백로그</div>
						<div class="col-6 text-center kt-padding-15"></div>
					</div>
					<div class="row kt-margin-0 border-top">
						<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">최종 완료 백로그</div>
						<div class="col-6 text-center kt-padding-15"></div>
					</div>
					<div class="row kt-margin-0 border-top">
						<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">미 완료 백로그</div>
						<div class="col-6 text-center kt-padding-15"></div>
					</div>
					<div class="row kt-margin-0 border-top">
						<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">평균 소요시간</div>
						<div class="col-6 text-center kt-padding-15"></div>
					</div>
					<div class="row kt-margin-0 border-top">
						<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">진척률</div>
						<div class="col-6 text-center kt-padding-15"></div>
					</div>
					<div class="row kt-margin-0 border-top">
						<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">스토리 포인트 공수</div>
						<div class="col-6 text-center kt-padding-15"></div>
					</div>
				</div>
				<!-- end :: 스프린트 내용 table -->
			</div>
			
			<!-- begin :: 스프린트 차트 -->
			<div class="row kt-padding-l-20 kt-padding-r-20 kt-margin-t-20">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-0 kt-padding-r-10">
					<div class="border osl-min-h-px--140">차트 1</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-10 kt-padding-r-0">
					<div class="border osl-min-h-px--140">차트 2</div>
				</div>
			</div>
			<!-- end :: 스프린트 차트 -->
			
			<!-- begin :: 스프린트 데이터테이블 전체영역-->
			<div class="row kt-padding-l-20 kt-padding-r-20 kt-margin-t-30">
			
				<!-- begin :: 스프린트 데이터테이블 검색영역 -->
				<div class="col-5">
					<div class="input-group">
						<div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
							<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="sprAssignProcessTable">
								<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
								<a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a>
								<a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a>
								<a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a>
							</div>
						</div>
						<!-- <select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_sprAssignProcessTable" name="searchSelect" aria-hidden="true" data-datatable-id="sprAssignProcessTable" style="display: none;"></select> -->
						<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="sprAssignProcessTable">
							<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_sprAssignProcessTable" id="searchData_sprAssignProcessTable" data-datatable-id="sprAssignProcessTable">
							<!-- <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
							<input type="hidden" name="searchStartDt" id="searchStartDt_sprAssignProcessTable" data-datatable-id="sprAssignProcessTable">
							<input type="hidden" name="searchEndDt" id="searchEndDt_sprAssignProcessTable" data-datatable-id="sprAssignProcessTable"> -->
						</div>
						<div class="input-group-append">
							<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="sprAssignProcessTable">
								<i class="fa fa-search"></i><span class=""><span>검색</span></span>
							</button>
						</div>
					</div>
				</div>
				<!-- end :: 스프린트 데이터테이블 검색영역 -->
				
				<!-- begin :: 스프린트 데이터테이블 조회버튼 -->
				<div class="col-7">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm float-right btn-elevate btn-elevate-air" data-datatable-id="sprDetailTable" data-datatable-action="select" title="스프린트 상세정보 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
						<i class="fa fa-list"></i><span>조회</span>
					</button>
				</div>
				<!-- end :: 스프린트 데이터테이블 조회버튼 -->
				<!-- begin :: 스프린트 데이터테이블  -->
				<div class="col-12">
					<div class="kt_datatable kt-margin-b-0" id="sprDetailTable"></div>
				</div>
				<!-- end :: 스프린트 데이터테이블 -->
			</div>
			<!-- end :: 스프린트 데이터테이블 전체영역 -->
		</div>
	</div>
</form>
<!-- end :: form -->
<!-- begin :: modal-footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand"
		data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end :: modal-footer -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLSpr1001Popup = function () {
	var documentSetting = function(){
		
		// begin:: 스프린트 상세정보 데이터테이블 
		$.osl.datatable.setting("sprDetailTable",{
			data: {
				source: {
					read: {
						//경로 삭제 시 오류로 인해 임시로 url 넣었습니다. 제거하시고 url 기제하시면 됩니다.
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				 pageSize : 5,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						//페이지 그룹단위 변경
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					 }
				 }
			 },
			columns: [
				{field: '', title: '프로젝트 명', textAlign: 'center', width: 100},
				{field: '', title: '순번', textAlign: 'center', width: 70},
				{field: '', title: '요청제목', textAlign: 'center', width: 100},
				{field: '', title: '진행 상태', textAlign: 'center', width: 70},
				{field: '', title: '담당자', textAlign: 'center', width: 70},
				{field: '', title: '실 소요시간', textAlign: 'center', width: 100},
				{field: '', title: '스토리포인트', textAlign: 'center', width: 70}
			]
		});
		// end:: 스프린트 상세정보 데이터테이블 
		
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1001Popup.init();
});
</script>
<!-- end script -->
