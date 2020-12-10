<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<form class="kt-form" id="spr1004">
	<div class="kt-portlet__body">
		<div class="osl-wizard" id="kt_wizard_v3" data-ktwizard-state="step-first">
				<!--begin: Form Wizard Nav -->
				<div class="osl-wizard__nav">			
					<!--doc: Remove "osl-wizard__nav-items--clickable" class and also set 'clickableSteps: false' in the JS init to disable manually clicking step titles -->
					<div class="osl-wizard__nav-items osl-wizard__nav-items--clickable">
						<!--begin: 1.요구사항 결과 확인 -->
						<div class="osl-wizard__nav-item osl-wizard__nav-item_3" href="#" data-ktwizard-type="step" data-ktwizard-state="current">
							<div class="osl-wizard-wrapper">
								<div class="wizard-number">1</div>
								<div class="wizard-label">
									<div class="wizard-title">요구사항 결과 확인</div>
									<div class="wizard-desc">스프린트 리뷰</div>
								</div>
							</div>
						</div>
						<!--end: 1.요구사항 결과 확인 -->
						<!--begin: 2.회고록 작성 -->
						<div class="osl-wizard__nav-item osl-wizard__nav-item_3" href="#" data-ktwizard-type="step">
							<div class="osl-wizard-wrapper">
								<div class="wizard-number">2</div>
								<div class="wizard-label">
									<div class="wizard-title">회고록 작성</div>
								</div>
							</div>
						</div>
						<!--end: 2.회고록 작성 -->
						<!--begin: 3.스프린트 결과 통계 -->
						<div class="osl-wizard__nav-item osl-wizard__nav-item_3" href="#" data-ktwizard-type="step">
							<div class="osl-wizard-wrapper">
								<div class="wizard-number">3</div>
								<div class="wizard-label">
									<div class="wizard-title">스프린트 결과 통계</div>
								</div>
							</div>
						</div>
						<!--end: 3.스프린트 결과 통계 -->
					</div>
				</div>
				<!--end: Form Wizard Nav -->
		
			<!-- begin:: 1. 요구사항 결과 확인 스프린트 리뷰 -->
			<div class="osl-wizard__content w-100 osl-h-px--500 kt-bg-light kt-padding-30 kt-padding-l-40 kt-padding-r-40 overflow-auto" data-ktwizard-type="step-content" data-ktwizard-state="current">
				<div class="row kt-margin-t-20">
					<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 kt-margin-b-20">
						<div class="input-group">
							<div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
								<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="sprReqResultTable">
									<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
									<a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a>
									<a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a>
									<a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a>
								</div>
							</div>
							<!-- <select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_sprReqResultTable" name="searchSelect" aria-hidden="true" data-datatable-id="sprReqResultTable" style="display: none;"></select> -->
							<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="sprReqResultTable">
								<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_sprReqResultTable" id="searchData_sprReqResultTable" data-datatable-id="sprReqResultTable">
								<!-- <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
								<input type="hidden" name="searchStartDt" id="searchStartDt_sprReqResultTable" data-datatable-id="sprReqResultTable">
								<input type="hidden" name="searchEndDt" id="searchEndDt_sprReqResultTable" data-datatable-id="sprReqResultTable"> -->
							</div>
							<div class="input-group-append">
								<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="sprReqResultTable">
									<i class="fa fa-search"></i><span class=""><span>검색</span></span>
								</button>
							</div>
						</div>
					</div>
					<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
						<button class="btn btn-brand float-right" id="newReqappend" type="button" data-datatable-id="sprReqResultTable">
							<i class="fa fa-search"></i><span class=""><span>신규 백로그 추가</span></span>
						</button>
					</div>
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="kt_datatable kt-margin-b-0" id="sprReqResultTable"></div>
					</div>
				</div>
			</div>
			<!-- end:: 1. 요구사항 결과 확인 스프린트 리뷰 -->
			<!-- begin:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 -->
			<div class="osl-wizard__content w-100 osl-h-px--500 kt-bg-light kt-padding-30 kt-padding-l-40 kt-padding-r-40 overflow-auto" data-ktwizard-type="step-content">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>회고록 제목</label>
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="row kt-margin-b-20">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group form-group-last">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>회고록 내용</label>
							<textarea class="form-control" name="sprEndText" id="sprEndText"></textarea>
						</div>
					</div>
				</div>
			</div>
			<!-- end:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 -->
			<!-- begin:: 3. 담당자 지정 요구사항 담당자 지정 -->
			<div class="osl-wizard__content w-100 osl-h-px--500 kt-bg-light kt-padding-30 kt-padding-l-40 kt-padding-r-40 overflow-auto" data-ktwizard-type="step-content">
				<div class="row kt-padding-20 kt-padding-t-0 osl-mobile-padding-0">
					<div class="col-12"><button type="button" class="btn btn-brand float-right" id=""><i class="fas fa-print kt-margin-r-5"></i><span>출력</span></button></div>
					<div class="col-12 text-center"><h1 class="font-weight-bold">스프린트 이름</h1></div>
					<div class="col-12 text-right">2020-01-01 11:40</div>
					<div class="col-12 text-right">관리자</div>
					<div class="col-12 text-right">스프린트 설명</div>
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
				</div>		
				<div class="row kt-padding-l-20 kt-padding-r-20 osl-mobile-padding-0 kt-margin-t-20">
					<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-0 kt-padding-r-10">
						<div class="border osl-min-h-px--140">차트 1</div>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-10 kt-padding-r-0 osl-mobile-padding-0 osl-mobile-margin-t-20">
						<div class="border osl-min-h-px--140">차트 2</div>
					</div>
				</div>
			</div>
			<!-- end:: 3. 담당자 지정 요구사항 담당자 지정  -->
		</div>
	</div>

	<div class="modal-footer">
		<!--begin: Form Actions -->
		<div class="osl-form__actions kt-padding-l-25">
			<button class="btn btn-outline-brand" data-ktwizard-type="action-prev">
				<i class="fas fa-chevron-circle-left"></i><span>이전</span>
			</button>
			<button class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-submit">
				<span>완료</span><i class="fas fa-check-circle kt-margin-l-5 kt-padding-r-0"></i>
			</button>
			<button class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-next">
				<span>다음</span><i class="fas fa-chevron-circle-right kt-margin-l-5 kt-padding-r-0"></i>
			</button>
		</div>
		<!--end: Form Actions -->
		<button class="btn btn-outline-brand"	data-dismiss="modal">
			<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
		</button>
	</div>
</form>
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLSpr1004Popup = function () {
	var documentSetting = function(){
		var formId = 'frSpr1004'
			//edit 목록
			var formEditList = [];
			
			//form validate 주입
			var formValidate = $.osl.validate(formId);
			
			//edit 세팅
	    	formEditList.push($.osl.editorSetting("sprEndText", {formValidate: formValidate,height:190, 'minHeight': 220, 'maxHeight': 220}));
		
			
	    	// begin:: 요구사항 결과 확인 데이터테이블
			$.osl.datatable.setting("sprReqResultTable",{
				data: {
					source: {
						read: {
							//경로 삭제 시 오류로 인해 임시로 url 넣었습니다. 제거하시고 url 기제하시면 됩니다.
							url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
						}
					},
					//그리드에 표출되는 row 개수
					pageSize : 5,
				},
				toolbar:{
					items:{
						pagination:{
							//그리드에 표출되는 row 개수
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
					{field: '', title: '프로젝트 명', textAlign: 'center', width: 150},
					{field: '', title: '순번', textAlign: 'center', width: 70},
					{field: '', title: '요청제목', textAlign: 'center', width: 150},
					{field: '', title: '처리 결과', textAlign: 'center', width: 150},
					{field: '', title: '소요기간', textAlign: 'center', width: 100},
					{field: '', title: '등록일', textAlign: 'center', width: 100}
				],
				actionBtn:{
					"title": "결과 작성",
					"width": 80,
					"update": false,
					"delete": false,
					"dblClick": false,
					"resultWrite": true
				},
				actionTooltip:{
					"resultWrite": "요구사항 결과 작성"
				},
				theme:{
					actionBtnIcon:{
						"resultWrite": "fas fa-edit",
					}
				},
				actionFn:{
					"resultWrite":function(rowData){
						var data = {
						};
						var options = {
								modalTitle: "요구사항 결과 작성",
								autoHeight: false,
								class:{
									body:"kt-padding-t-0"
								}
							};
						$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1005View.do',data,options);
					}
				}
			});
			// end:: 요구사항 결과 확인 데이터테이블
			
			
			
			// begin :: 마법사 
			//마법사 세팅
			var wizard = new KTWizard('osl-spr1004', {
				startStep: 1, 
				clickableSteps: true, 		
				
			});

			//마법사 각 단계탭 클릭시 변경 이벤트
			wizard.on('change', function(wizardObj) {
				//마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
				initWizard(wizard);
			});

			
			//마법사 이전 버튼
			$('[data-ktwizard-type="action-prev"]').click(function(){
				//이전 페이지로 이동
				wizard.goPrev();
				//마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
				initWizard(wizard);
				
			});
			
			//마법사 다음 버튼
			$('[data-ktwizard-type="action-next"]').click(function(){
				//다음 페이지로 이동
				wizard.goNext();
				//마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
				initWizard(wizard);
			});
			//end :: 마법사
			
			
			//스프린트 종료 > 1.요구사항 결과 확인 > 신규 백로그 추가 버튼
			$('#newReqappend').click(function(){
				var data = {
				};
				var options = {
						modalTitle: "신규 백로그 추가",
						autoHeight: false
					};
				$.osl.layerPopupOpen('/req/req1000/req1000/selectReq1001View.do',data,options);
			});
	};
	
	// begin :: 마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
	var initWizard = function(wizard){
		//전체 단계 수
		var totalStep = wizard.totalSteps;
		//현재 단계
		var checkThis = wizard.currentStep;
		//전체 단계-현재 단계
		var checking = totalStep - checkThis;
		
		//마지막 단계
		if(checking==0){
			$('[data-ktwizard-type="action-prev"]').css('display','inline-block');
			$('[data-ktwizard-type="action-next"]').css('display','none');
			$('[data-ktwizard-type="action-submit"]').css('display','inline-block');
		//중간 단계
		}else if(checking<totalStep-1){
			$('[data-ktwizard-type="action-prev"]').css('display','inline-block');
			$('[data-ktwizard-type="action-next"]').css('display','inline-block');
			$('[data-ktwizard-type="action-submit"]').css('display','none');
		//첫번째 단계
		}else{
			$('[data-ktwizard-type="action-next"]').css('display','inline-block');
			$('[data-ktwizard-type="action-prev"]').css('display','none');
			$('[data-ktwizard-type="action-submit"]').css('display','none');
		}
	};
	// end :: 마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1004Popup.init();
});
</script>
<!-- end script -->
