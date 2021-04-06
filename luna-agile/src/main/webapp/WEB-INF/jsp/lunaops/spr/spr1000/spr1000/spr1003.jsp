<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- begin page DOM -->
<form class="kt-form" id="frSpr1003">
	<input type="hidden" name="modalId" id="modalId" value="${param.modalId}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramSprId" id="paramSprId" value="${param.paramSprId}">
	<input type="hidden" name="paramStartDt" id="paramStartDt" value="${param.paramStartDt}">
	<input type="hidden" name="paramEndDt" id="paramEndDt" value="${param.paramEndDt}">

	<div class="kt-portlet__body">
		<div class="osl-wizard" id="kt_wizard_v3" data-ktwizard-state="step-first">
			<!--begin: Form Wizard Nav -->
			<div class="osl-wizard__nav">
				<div class="osl-wizard__nav-items osl-wizard__nav-items--clickable">
					<!--begin: 1.회의록 작성 -->
					<div class="osl-wizard__nav-item" data-ktwizard-type="step" data-ktwizard-state="current">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">1</div>
							<div class="wizard-label">
								<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.mmtTitle">회의록 작성</span></div>
								<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.mmtDesc">스프린트 회의록 작성</span></div>
							</div>
						</div>
					</div>
					<!--end: 1.회의록 작성 -->
					<!--begin: 2.스토리 포인트 입력 -->
					<div class="osl-wizard__nav-item" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">2</div>
							<div class="wizard-label">
								<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.sprPtTitle">스토리 포인트 입력</span></div>
								<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.sprPtDesc">요구사항 스토리 포인트 입력</span></div>
							</div>
						</div>
					</div>
					<!--end: 2.스토리 포인트 입력 -->
					<!--begin: 3.담당자 지정 -->
					<div class="osl-wizard__nav-item" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">3</div>
							<div class="wizard-label">
								<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.chargerTitle">담당자 지정</span></div>
								<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.chargerDesc">요구사항 담당자 지정</span></div>
							</div>
						</div>
					</div>
					<!--end: 3.담당자 지정 -->
					<!--begin: 4.프로세스 배정-->
					<div class="osl-wizard__nav-item" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">4</div>
							<div class="wizard-label">
								<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.processTitle">프로세스 배정</span></div>
							</div>
						</div>
					</div>
					<!--end: 4.프로세스 배정-->
				</div>
			</div>
			<!--end: Form Wizard Nav -->
			<div class="osl-form__actions kt-padding-l-25" id="wizardStepBtnTmp">
				<div>
					<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info" data-ktwizard-state="current">
						<div class="kt-widget__top">
							<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.mmt">* 스프린트 시작 전 회의록을 작성하세요.</span></h6>
						</div>
					</div>
					<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info">
						<div class="kt-widget__top">
							<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.sprPt">* 요구사항에 스토리 포인트를 입력하세요.</span></h6>
						</div>
					</div>
					<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info">
						<div class="kt-widget__top">
							<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.charger">* 사용자를 클릭하고 담당자 입력 상자 클릭으로 담당자를 배정하세요.</span></h6>
						</div>
					</div>
					<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info">
						<div class="kt-widget__top">
							<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.process">* 배정된 프로세스가 칸반 보드에 표시됩니다.</span></h6>
						</div>
					</div>
				</div>
				<button class="btn btn-outline-brand" data-ktwizard-type="action-prev">
					<i class="fas fa-chevron-circle-left"></i><span data-lang-cd="spr1003.wizard.btn.prev">이전</span>
				</button>
				<button class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-submit">
					<span class="kt-margin-r-5" data-lang-cd="spr1003.wizard.btn.submit">완료</span><i class="fas fa-check-circle kt-padding-r-0"></i>
				</button>
				<button class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-next">
					<span class="kt-margin-r-5" data-lang-cd="spr1003.wizard.btn.next">다음</span><i class="fas fa-chevron-circle-right kt-padding-r-0"></i>
				</button>
			</div>
			<!-- begin:: 1. 회의록 작성 스프린트 회의록 작성 -->
			<div class="osl-wizard__content osl-min-h-px--575 w-100 kt-bg-light kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content" data-ktwizard-state="current">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group">
							<label><i class="fa fa-user-friends kt-margin-r-5"></i><span data-lang-cd="spr1003.label.mmtUsrList">참여 인원</span></label>
							<select class="form-control kt-select2 select2-hidden-accessible" id="sprConferenceUsr" name="sprConferenceUsr" multiple="multiple" data-select2-id="sprConferenceUsr" tabindex="-1" aria-hidden="true"></select>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr1003.label.mmtTitle">회의록 제목</span></label>
							<input type="text" class="form-control" name="mmtNm" id="mmtNm" value="" required>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group form-group-last">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr1003.label.mmtDesc">회의록 내용</span></label>
							<textarea class="form-control" name="mmtDesc" id="mmtDesc" required></textarea>
						</div>
					</div>
				</div>
			</div>
			<!-- end:: 1. 회의록 작성 스프린트 회의록 작성 -->
			<!-- begin:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 -->
			<div class="osl-wizard__content osl-min-h-px--575 w-100 kt-bg-light kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="row kt-margin-t-20">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="col-lg-6 col-md-6 col-sm-12 kt-padding-r-0">
							<div class="osl-datatable-search" data-datatable-id="sprAssignReqTable"></div>
						</div>
						<div class="kt_datatable" id="sprAssignReqTable"></div>
					</div>
				</div>
			</div>
			<!-- end:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 -->
			<!-- begin:: 3. 담당자 지정 요구사항 담당자 지정 -->
			<div class="osl-wizard__content w-100 osl-min-h-px--575 kt-bg-light kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="row kt-margin-t-20">
					<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
						<div class="osl-datatable-search" data-datatable-id="sprAssignReqUsrTable"></div>
						<div class="kt_datatable" id="sprAssignReqUsrTable"></div>
					</div>
					<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 osl-mobile-margin-t-20">
						<div class="osl-datatable-search" data-datatable-id="sprUstListTable"></div>
						<div id="sprUstListCardTable"></div>
						<div class="kt_datatable osl-datatable-footer__divide" id="sprUstListTable"></div>
					</div>
				</div>
			</div>
			<!-- end:: 3. 담당자 지정 요구사항 담당자 지정  -->
			<!-- begin:: 4. 프로세스 배정 -->
			<div class="osl-wizard__content osl-min-h-px--575 w-100 kt-bg-light kt-padding-20 kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="row kt-margin-t-20">
					<!-- begin:: 4-1. 배정 프로세스 데이터 테이블 -->
					<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-20 kt-padding-r-20 osl-mobile-padding-lr-10">
						<div class="input-group  kt-margin-b-20">
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
						<div class="kt_datatable" id="sprAssignProcessTable"></div>
					</div>
					<!-- end:: 4-1. 배정 프로세스 데이터 테이블 -->
					<!-- begin:: 4-2. 미배정 프로세스 데이터 테이블 -->
					<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-20 kt-padding-r-20 osl-mobile-padding-lr-10 osl-mobile-margin-t-20">
						<div class="input-group kt-margin-b-20">
							<div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
								<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="sprNotAssignProcessTable">
									<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
									<a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a>
									<a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a>
									<a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a>
								</div>
							</div>
							<!-- <select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_sprNotAssignProcessTable" name="searchSelect" aria-hidden="true" data-datatable-id="sprNotAssignProcessTable" style="display: none;"></select> -->
							<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="sprNotAssignProcessTable">
								<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_sprNotAssignProcessTable" id="searchData_sprNotAssignProcessTable" data-datatable-id="sprNotAssignProcessTable">
								<!-- <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
								<input type="hidden" name="searchStartDt" id="searchStartDt_sprNotAssignProcessTable" data-datatable-id="sprNotAssignProcessTable">
								<input type="hidden" name="searchEndDt" id="searchEndDt_sprNotAssignProcessTable" data-datatable-id="sprNotAssignProcessTable"> -->
							</div>
							<div class="input-group-append">
								<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="sprNotAssignProcessTable">
									<i class="fa fa-search"></i><span class=""><span>검색</span></span>
								</button>
							</div>
						</div>
						<div class="kt_datatable" id="sprNotAssignProcessTable"></div>
					</div>
					<!-- end:: 4-2. 미배정 프로세스 데이터 테이블 -->
				</div>
			</div>
			<!-- end:: 4. 프로세스 배정 -->				
		</div>
	</div>
	
</form>
<!-- begin:: modal-footer -->	
<div class="modal-footer">
	<!--end: Form Actions -->
	<button class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end:: modal-footer -->	

<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLSpr1003Popup = function () {
	var mainFormId = 'frSpr1003';
	
	//datatableOpenFlag
	var datatableInitFlag = {2: false, 3:false, 4:false};
	var datatableSetting = {};
	
	//edit 목록
	var formEditList = [];
	
	//스프린트 ID
	var paramSprId = $("#paramSprId").val();
	
	//조회된 사용자 목록
	var usrList = [];
	
	//단계별 데이터
	var wizardData = {
		//회의록 제목
		mmtNm: "",
		//회의록 내용
		mmtDesc: "",
		//참여자 목록
		usrList: [],
		//스토리 포인트 입력
		reqListCnt: 0,
		reqSprPointList: {},
		reqUsrList: {}
	};
	
	//form validate 주입
	var formValidate = $.osl.validate(mainFormId);
	
	var documentSetting = function(){
		//edit 세팅 -- 
    	formEditList.push($.osl.editorSetting("mmtDesc", {formValidate: formValidate, 'minHeight': 250, disableResizeEditor: false}));
		
		//modalId
		var modalId = $("#modalId").val();
		
    	$('#sprConferenceUsr').select2({
    		//select세팅
    		templateResult: optionFormatState,
    		//tag세팅
    		templateSelection: tagFormatState,
    		//검색
    		matcher: matchCustom
    	});
		
    	//사용자 리스트 세팅
    	selectUsrList();
		
		// begin :: 마법사
		//마법사 세팅
		var wizard = new KTWizard('kt_wizard_v3', {
			startStep: 1, 
			clickableSteps: false		
		});
		 
		//스텝 변경 전 현재 단계에 데이터 저장
		wizard.on('beforeNext', function(wizardObj) {
			//form valid check
			if($("#"+mainFormId).valid() !== true){
				wizardObj.stop();
			}else{
				//step별 데이터 저장
				var rtnFlag = fnWizardDataSave(wizardObj);
				
				//저장 시 반환값이 false인경우 step 이동 중지
				if(rtnFlag === false){
					wizardObj.stop();
				}
			}
		});
		 
		//스텝 변경 전 현재 단계에 데이터 저장
		wizard.on('beforePrev', function(wizardObj) {
			//form valid check
			if($("#"+mainFormId).valid() !== true){
				wizardObj.stop();
			}else{
				//step별 데이터 저장
				var rtnFlag = fnWizardDataSave(wizardObj);
				
				//저장 시 반환값이 false인경우 step 이동 중지
				if(rtnFlag === false){
					wizardObj.stop();
				}
			}
		});
		
		//마법사 각 단계탭 클릭시 변경 이벤트
		wizard.on('change', function(wizardObj) {
			if(datatableInitFlag.hasOwnProperty(wizardObj.currentStep)){
				//마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
				if(!datatableInitFlag[wizardObj.currentStep]){
					datatableInitFlag[wizardObj.currentStep] = datatableSetting[wizardObj.currentStep]();
				}else if(datatableInitFlag[wizardObj.currentStep].hasOwnProperty("targetDt")){
					datatableInitFlag[wizardObj.currentStep].targetDt.reload();
				}
			}
		});
		//end :: 마법사
		
		//완료 버튼
		$("#frSpr1003 [data-ktwizard-type=action-submit]").click(function(){
	       	//formData
	   		var fd = $.osl.formDataToJsonArray(mainFormId);
	       	
	       	//입력 정보
	       	fd.append("wizardData",JSON.stringify(wizardData));
	       	
	   		//AJAX 설정
	   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/spr/spr1000/spr1000/updateSpr1003SprStart.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

	   		//AJAX 전송 성공 함수
	   		ajaxObj.setFnSuccess(function(data){
	   			if(data.errorYn == "Y"){
	   				$.osl.alert(data.message,{type: 'error'});
	   			}else{
	   				//등록 성공
	   				$.osl.toastr(data.message);

	   				//모달 창 닫기
	   				$.osl.layerPopupClose();
	   				
	   				//datatable 조회
	   				if($("button[data-datatable-id=spr1000Table][data-datatable-action=select]").length > 0){
		   				$("button[data-datatable-id=spr1000Table][data-datatable-action=select]").click();
	   				}
	   				
	   			}
	   		});
	   		
	   		//AJAX 전송
	   		ajaxObj.send();
		});
	};
	
	//step별 데이터 저장
	var fnWizardDataSave = function(wizardObj){
		//회의록
		if(wizardObj.currentStep == 1){
			//회의록 제목
			wizardData["mmtNm"] = $("#mmtNm").val();
			
			//회의록 내용
			wizardData["mmtDesc"] = $("#mmtDesc").val();
			
			//담당자 목록
			wizardData["usrList"] = $("#sprConferenceUsr").val();
		}
		//스토리포인트
		else if(wizardObj.currentStep == 2){
			//스토리 포인트 전체 작성했는지 체크
			var reqListCnt = wizardData["reqListCnt"];
			var reqSprPointList = wizardData["reqSprPointList"];
			var reqSprPointListCnt = 0;
			
			if(!$.osl.isNull(reqSprPointList)){
				//입력된 값 체크
				$.each(reqSprPointList, function(idx, map){
					if(!$.osl.isNull(map) && map >= 0){
						reqSprPointListCnt++;
					}
				});
			}
			
			if(reqListCnt > reqSprPointListCnt){
				$.osl.toastr($.osl.lang("spr1003.alert.reqSprPoint",(reqListCnt-reqSprPointListCnt))
					,{
						positionClass: "osl-toastr-center",
						timeOut: 3000,
						preventDuplicates: true
					}
				);
				return false;
			}
		}
		//담당자
		else if(wizardObj.currentStep == 3){
			
		}
		//프로세스
		else if(wizardObj.currentStep == 4){
			
		}
		return true;
	};
	
	/**
    * kt-select2 옵션
    */
    var optionFormatState = function(state){
    	if (!state.id) {
    	    return state.text;
   	 	}
    	var usrId = state.id;
    	var usrNm = state.element.attributes.getNamedItem("data-usr-nm").value;
    	var usrImgId = state.element.attributes.getNamedItem("data-usr-img-id").value;
    	var usrEmail = state.element.attributes.getNamedItem("data-usr-email").value;

    	var state = $(
    			'<div class="kt-user-card-v2 btn" data-usr-id="'+ usrId +'">' 
				+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
					+'<img src="'+$.osl.user.usrImgUrlVal(usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
				+'</div>'
				+'<div class="kt-user-card-v2__details float-left">'
					+'<span class="kt-user-card-v2__name float-left">'+usrNm+'</span>'
					+'<span class="kt-user-card-v2__email float-left kt-margin-l-10 osl-line-height-rem-1_5">'+usrEmail+'</span>'
				+'</div>'
			+'</div>'
   	    );
    	
    	return state;
    };
    
    /**
     * kt-select2 태그 옵션
     */
    var tagFormatState = function(state){
    	if (!state.id) {
    	    return state.id;
   	 	}
    	var usrId = state.id;
    	var usrNm = state.element.attributes.getNamedItem("data-usr-nm").value;
    	var usrImgId = state.element.attributes.getNamedItem("data-usr-img-id").value;
    	var usrEmail = state.element.attributes.getNamedItem("data-usr-email").value;

    	var state = $(
    			'<div class="kt-user-card-v2 d-inline-block" data-usr-id="'+ usrId +'">'
					+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle float-left">'
						+'<img src="'+$.osl.user.usrImgUrlVal(usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
					+'</div>'
					+'<div class="kt-user-card-v2__details float-left">'
						+'<span class="kt-user-card-v2__name">'+usrNm+'</span>'
						+'<span class="kt-user-card-v2__email">'+usrEmail+'</span>'
					+'</div>'
				+'</div>'
   	    );
    	
   	    return state;
    };
    
    /**
     * kt-select2 사용자 세팅
     * param : selectUsrList 이미 선택된 사용자 리스트
     */
 	var selectUsrList = function(){
 		//AJAX 설정
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr2000/spr2000/selectSpr2001MmtUsrListAjax.do'/>", "async":"true"});
 		
 		//AJAX 전송 성공 함수
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});

 				//모달 창 닫기
 				$.osl.layerPopupClose();
 			}else{
 				//사용자 목록 저장
 				usrList = data.usrAllList;
 				//사용자 선택 드롭박스 추가
 				$.each(data.usrAllList, function(idx, value){
 					var str = '<option value="' + value.usrId + '" data-usr-nm="'+value.usrNm+'" data-usr-img-id="'+value.usrImgId+'" data-usr-email="'+value.email+'">' 
 									+ value.usrNm
 								+ '</option>';
 					
 					$("#sprConferenceUsr").append(str);
 				});
 			}
 		});
 		//AJAX 전송
 		ajaxObj.send();
 	};
 	
 	//검색
 	function matchCustom(params, data) {
 		//검색 값이 빈 값인경우 전체 출력
 	    if ($.trim(params.term) === '') {
 	      return data;
 	    }
 		
 	    //기본 텍스트값이 없는 경우 빈 값 출력
 	    if (typeof data.text === 'undefined') {
 	      return null;
 	    }
 	    
 	    //이메일 값 조회
 	    var usrEmail = $(data.element).data("usr-email");

 	    //id문자열에 검색어 있으면 출력
 	    if (data.id.indexOf(params.term) > -1) {
 	      return data;
 	    }
 	    //text문자열에 검색어 있으면 출력
 	    else if (data.text.indexOf(params.term) > -1) {
 	      return data;
 	    }
 	    //email문자열에 검색어 있으면 출력
 	    else if (usrEmail.indexOf(params.term) > -1) {
 	      return data;
 	    }

 	    //검색어에 해당안되는 데이터 출력 안함
 	    return null;
 	}
 	
	var tagremove = function(){
		$('.osl-tagify__tag__removeBtn').click(function(){
			$(this).parent().remove();
		});
	}
	
	datatableSetting["2"] = function(){
		// begin:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 데이터테이블
		return $.osl.datatable.setting("sprAssignReqTable",{
			data: {
				source: {
					read: {
						url: "/spr/spr1000/spr1000/selectSpr1000SprReqListAjax.do",
						params:{
							sprId: paramSprId
						}
					}
				},
				 pageSize : 5,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100]
					 }
				 }
			},
			columns: [
				{field: 'reqOrd', title: '순번', textAlign: 'center', width: 50, search: true},
				{field: 'reqNm', title: '요청 제목', textAlign: 'center', width: 220, search: true},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'reqUsrNm', title: '요청자', textAlign: 'center', width: 100, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqUsrNm)){
							row.reqUsrNm = "";
						}
						var usrData = {
							html: row.reqUsrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.reqUsrImgId, usrData);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.reqUsrId);
					}
				},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.regDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'sprPoint', title: '스토리 포인트', textAlign: 'center', width: 80, sortable: false, autoHide: false,
					template:function(row){
						var rtnVal = "";
						//이미 입력된 값 있는 경우 채우기
						if(wizardData["reqSprPointList"].hasOwnProperty(row.reqId)){
							rtnVal = wizardData["reqSprPointList"][row.reqId];
						}
						
						return '<input type="text" class="form-control kt-align-center" name="sprPoint_'+row.reqId+'" id="sprPoint_'+row.reqId+'" min="0" max="999" maxlength="3" value="'+rtnVal+'"/>';
					}
				}
			],
			actionBtn:{
				"update": false,
				"delete": false,
				"dblClick": true,
				"title": ""
			},
			actionTooltip:{
				"update": "수정",
				"delete": "삭제",
				"dblClick": "상세보기"
			},
			rows:{
				afterTemplate: function(row, data, index){
					//스토리포인트 키 입력 시 데이터 실시간 저장 시키기
					var targetInput = row.find("input#sprPoint_"+data.reqId);
					
					targetInput.off("blur").on("blur", function(e){
						var inputVal = 0;
						try{
							inputVal = parseInt(this.value);
						}catch(e){
							inputVal = 0;
						}
						
						if(!isNaN(inputVal)){
							wizardData["reqSprPointList"][data.reqId] = inputVal;
						}
						else if(targetInput.val() == ""){
							wizardData["reqSprPointList"][data.reqId] = null;
						}
					});
					
					//이미 입력된 값 있는 경우 채우기
					if(wizardData["reqSprPointList"].hasOwnProperty(data.reqId)){
						this.value = wizardData["reqSprPointList"][data.reqId];
					}
				}
			},
			callback:{
				initComplete: function(evt, list, datatableInfo){
					//전체 요구사항 수 갱신
					wizardData["reqListCnt"] = datatableInfo.lastResponse.meta.total;
				}
			}
		});
		// end:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 데이터테이블
		
	}
	datatableSetting["3"] = function(){
		// begin:: 3. 담당자 지정 요구사항 담당자 지정 데이터테이블
		var sprAssignReqUsrTable = $.osl.datatable.setting("sprAssignReqUsrTable",{
			data: {
				source: {
					read: {
						url: "/spr/spr1000/spr1000/selectSpr1000SprReqListAjax.do",
						params:{
							sprId: paramSprId
						}
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
				{field: 'reqOrd', title: '순번', textAlign: 'center', width: 50, search: true},
				{field: 'reqNm', title: '요청 제목', textAlign: 'center', width: 100, search: true},
				{field: 'sprPoint', title: '스토리 포인트', textAlign: 'center', width: 80,template:function(row){
					var rtnVal = "";
					//이미 입력된 값 있는 경우 채우기
					if(wizardData["reqSprPointList"].hasOwnProperty(row.reqId)){
						rtnVal = wizardData["reqSprPointList"][row.reqId];
					}
					
					return rtnVal;
				}},
				{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 80, template:function(row){
					var rtnVal = "";
					//이미 입력된 값 있는 경우 채우기
					if(wizardData["reqUsrList"].hasOwnProperty(row.reqId)){
						rtnVal = wizardData["reqUsrList"][row.reqId].usrNm;
					}
					
					return '<input type="text" class="form-control kt-align-center" name="reqCharger_'+row.reqId+'" id="reqCharger_'+row.reqId+'" data-req-id="'+row.reqId+'" value="'+rtnVal+'" readonly="readonly" />';
				}},
			],
			actionBtn:{
				"update": false,
				"delete": false,
				"dblClick": false
			}
		});
		// end:: 3. 담당자 지정 요구사항 담당자 지정 데이터테이블
		
		//담당자 목록 테이블
		var sprUstListTable = $.osl.datatable.setting("sprUstListTable",{
			cardUiTarget: $("#sprUstListCardTable"),
			data: {
				source: {
					read: {
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				pageSize : 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100],
						pages: {
							desktop: {
								layout: 'compact'
							},
							tablet: {
								layout: 'compact'
							},
						},
					 }
				 }
			 },
			columns: [
				{field: 'useNm', title: '사용유무', textAlign: 'center', width: 70,  search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField: "useCd"},
				{field: 'usrId', title: '아이디', textAlign: 'center', width: 150, search: true},
				{field: 'usrNm', title: '사용자 명', textAlign: 'left', width: 160, search: true},
				{field: 'telno', title: '연락처', textAlign: 'left', width: 110, search: true},
				{field: 'email', title: '이메일', textAlign: 'left', width: 170, search: true},
				{field: 'usrPositionNm', title: '직급', textAlign: 'center', width: 110, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직책', textAlign: 'center', width: 120, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 390, search: true, sortable: false},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 120, search: true, searchType:"daterange"},
				{field: 'etc', title: '비고', textAlign: 'left', width: 400, search: true}
			],
			actionBtn:{
				"update": false,
				"delete": false
			},
			callback:{
				initComplete: function(evt,config){
					$("#sprUstListTable .kt-datatable__table").css({visibility: "hidden", height: 0});
				},
				ajaxDone: function(evt, list){
					var usrStr = '';
					$.each(list, function(idx, map){
						usrStr += 
							'<div class="kt-widget kt-margin-b-10 kt-widget--general-2 rounded osl-widget-draggable" data-usr-id="'+map.usrId+'" data-usr-name="'+$.osl.escapeHtml(map.usrNm)+'">'
								+'<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">'
									+'<div class="kt-widget__label kt-margin-r-10 osl-user__active--block">'
										+'<i class="fa fa-arrow-alt-circle-left"></i>'
									+'</div>'
									+'<div class="kt-media kt-media--circle kt-media--md">'
										+'<img src="'+$.osl.user.usrImgUrlVal(map.usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
									+'</div>'
									+'<div class="kt-widget__wrapper">'
										+'<div class="kt-widget__label">'
											+'<div class="kt-widget__title">'
												+$.osl.escapeHtml(map.usrNm)
												+'<small>'+$.osl.escapeHtml(map.email)+'</small>'
											+'</div>'
											
											+'<span class="kt-widget__desc">'
												+'<span>'+$.osl.escapeHtml(map.usrDutyNm)+'</span>, <span>'+$.osl.escapeHtml(map.usrPositionNm)+'</span>'
											+'</span>'
										+'</div>'
									+'</div>'
								+'</div>'
							+'</div>';
					});
					$("#sprUstListCardTable").html(usrStr);
					
					//input 이벤트 (click만 mouseover 제외)
					$("#sprAssignReqUsrTable").on("click","input[name^=reqCharger_]", function(){
						//active된 사용자가 있는 경우에만
						var targetElem = $(".osl-widget-draggable.active");
						if(targetElem.length > 0){
							//사용자 아이디, 사용자명
							var targetUsrId = targetElem.data("usr-id");
						    var targetUsrNm = targetElem.data("usr-name");
						    
						    //요구사항 ID 얻기
						    var targetReqId = $(this).data("req-id");
						    
						    //값 넣기
						    this.value = targetUsrNm;
						    
						    //data 저장
						    wizardData["reqUsrList"][targetReqId] = {usrId: targetUsrId, usrNm: targetUsrNm};
						}
					});
					
					//모바일 대응 클릭 이벤트
					$(".osl-widget-draggable").click(function(){
						//unactive flag
						var unActive = false;
						if($(this).hasClass("active")){
							unActive = true;
						}
						
						$(".osl-widget-draggable.active").removeClass("active");
						if(unActive === false){
							$(this).addClass("active");
						}
					});
				}
			}
		});
		
		return {
			targetDt: {
				reload: function(){
					sprAssignReqUsrTable.targetDt.reload();
					sprUstListTable.targetDt.reload();
				}
			}
		};
	}
	
	datatableSetting["4"] = function(){
		// begin:: 4-1. 배정 프로세스 데이터 테이블 
		$.osl.datatable.setting("sprAssignProcessTable",{
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
				{field: 'checkbox', title: '#', textAlign: 'center', width: 10, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 50, autoHide: false, sortable: false},
				{field: '', title: '프로세스 명', textAlign: 'center', width: 70}
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true
			},
			actionTooltip:{
				"dblClick": "프로세스 배정 제외"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var data = {
					};
					var options = {
							modalTitle: "프로세스 상세",
							autoHeight: false
						};
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1006View.do',data,options);
			
					//var rowDatas = [];
					//rowDatas.push(rowData);
					//사용자 배정 처리
					//fnAllUsrDelete(rowDatas);
				},
				//선택 사용자 배정 제외
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					//var rowDatas = rowData;
					//선택 레코드 없는 경우
					//if(rowDatas.length == 0){
						//$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						//return true;
					//}
					
					//$.osl.confirm($.osl.lang("prj2100.allUsrInDelete",rowDatas.length),{html:true}, function(result){
						//if (result.value) {
							//사용자 배정 제외 처리
							fnAllUsrDelete(rowDatas);
						//}
					//});
				}
			}
		});
		// end:: 4-1. 배정 프로세스 데이터 테이블
		
		// begin:: 4-2. 미배정 프로세스 데이터테이블 
		$.osl.datatable.setting("sprNotAssignProcessTable",{
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
				{field: 'checkbox', title: '#', textAlign: 'center', width: 10, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 50, autoHide: false, sortable: false},
				{field: '', title: '프로세스 명', textAlign: 'center', width: 70}
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick": "프로세스 배정"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-left",
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var data = {
					};
					var options = {
							modalTitle: "프로세스 상세",
							autoHeight: false
						};
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1006View.do',data,options);
			
					/*var rowDatas = [];
					rowDatas.push(rowData);
					//사용자 배정 처리
					fnAllUsrInsert(rowDatas);*/
				},
				//선택 사용자 배정 제외
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					/*var rowDatas = rowData;
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj2100.allUsrInDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							//사용자 배정 제외 처리
							fnAllUsrInsert(rowDatas);
						}
					});*/
				}
			}
		});
		// end:: 4-2. 미배정 프로세스 데이터테이블
	}
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1003Popup.init();
});
</script>
<!-- end script -->
