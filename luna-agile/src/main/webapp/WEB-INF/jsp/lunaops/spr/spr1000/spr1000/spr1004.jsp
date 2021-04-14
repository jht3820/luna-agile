<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<form class="kt-form" id="frSpr1004">
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
					<!--begin: 1.요구사항 결과 확인 -->
					<div class="osl-wizard__nav-item osl-wizard__nav-item_3" data-ktwizard-type="step" data-ktwizard-state="current">
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
					<div class="osl-wizard__nav-item osl-wizard__nav-item_3" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">2</div>
							<div class="wizard-label">
								<div class="wizard-title">회고록 작성</div>
							</div>
						</div>
					</div>
					<!--end: 2.회고록 작성 -->
					<!--begin: 3.스프린트 결과 통계 -->
					<div class="osl-wizard__nav-item osl-wizard__nav-item_3" data-ktwizard-type="step">
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
			<div class="osl-form__actions kt-padding-l-25" id="wizardStepBtnTmp">
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
			<!-- begin:: 1. 요구사항 결과 확인 스프린트 리뷰 -->
			<div class="osl-wizard__content w-100 osl-h-px--500 kt-bg-light kt-padding-30 kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content" data-ktwizard-state="current">
				<div class="row kt-margin-t-20">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="osl-datatable-search" data-datatable-id="sprReqResultTable"></div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12">
								<button class="btn btn-brand float-right" id="newReqappend" type="button" data-datatable-id="sprReqResultTable">
									<i class="fa fa-search"></i><span class=""><span>신규 백로그 추가</span></span>
								</button>
							</div>
						</div>
						<div class="kt_datatable" id="sprReqResultTable"></div>
					</div>
				</div>
			</div>
			<!-- end:: 1. 요구사항 결과 확인 스프린트 리뷰 -->
			<!-- begin:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 -->
			<div class="osl-wizard__content w-100 osl-h-px--500 kt-bg-light kt-padding-30 kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>회고록 제목</label>
							<input type="text" name="mmrNm" id="mmrNm" class="form-control" required>
						</div>
					</div>
				</div>
				<div class="row kt-margin-b-20">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group form-group-last">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>회고록 내용</label>
							<textarea class="form-control" name="mmrDesc" id="mmrDesc" required></textarea>
						</div>
					</div>
				</div>
			</div>
			<!-- end:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 -->
			<!-- begin:: 3. 담당자 지정 요구사항 담당자 지정 -->
			<div class="osl-wizard__content w-100 kt-bg-light kt-padding-30 kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="row kt-padding-l-20 kt-padding-r-20">
					<!-- begin :: 스프린트 이름 -->
					<div class="col-12 text-center kt-margin-t-20"><h1 class="font-weight-bold">${param.paramSprNm}</h1></div>
					<!-- end :: 스프린트 이름 -->
					
					<!-- begin :: 스프린트 시간, 관리자, 설명 -->
					<div class="col-12 text-right">2020-01-01 11:40</div>
					<div class="col-12 text-right">관리자</div>
					<div class="col-12 text-right">${param.paramSprDesc}</div>
					<!-- end :: 스프린트 시간, 관리자, 설명 -->
					
					<!-- begin :: 스프린트 내용 table -->
					<div class="table border kt-margin-t-20">
						<div class="row kt-margin-0">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">전체 배정 백로그</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat01"></div>
						</div>
						<div class="row kt-margin-0 border-top">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">최종 완료 백로그</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat02"></div>
						</div>
						<div class="row kt-margin-0 border-top">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">미 완료 백로그</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat03"></div>
						</div>
						<div class="row kt-margin-0 border-top">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">평균 소요시간</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat04"></div>
						</div>
						<div class="row kt-margin-0 border-top">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">진척률</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat05"></div>
						</div>
						<div class="row kt-margin-0 border-top">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">스토리 포인트 공수</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat06"></div>
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
				<div class="row kt-margin-t-20">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="row">
							<!-- begin :: 스프린트 데이터테이블 검색영역 -->
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="osl-datatable-search" data-datatable-id="sprDetailTable"></div>
							</div>
							<!-- end :: 스프린트 데이터테이블 검색영역 -->
							<!-- begin :: 스프린트 데이터테이블 조회버튼 -->
							<div class="col-lg-6 col-md-6 col-sm-12">
								<button type="button" class="btn btn-brand float-right" data-datatable-id="sprDetailTable" data-datatable-action="select" title="스프린트 상세정보 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
									<i class="fa fa-list"></i><span>조회</span>
								</button>
							</div>
							<!-- end :: 스프린트 데이터테이블 조회버튼 -->
						</div>
						<!-- begin :: 스프린트 데이터테이블  -->
						<div class="kt_datatable" id="sprDetailTable"></div>
						<!-- end :: 스프린트 데이터테이블  -->
					</div>
				</div>
				<!-- end :: 스프린트 데이터테이블 전체영역 -->
			</div>
			<!-- end:: 3. 담당자 지정 요구사항 담당자 지정  -->
		</div>
	</div>

	<div class="modal-footer">
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
	
	var formId = 'frSpr1004'
	
	//edit 목록
	var formEditList = [];

	//datatableOpenFlag
	var datatableInitFlag = {3:false};
	var datatableSetting = {};
	
	//스프린트 ID
	var paramSprId = $("#paramSprId").val();
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//단계별 데이터
	var wizardData = {
		//요구사항 결과 입력
		reqResultDescList: {}
	};
	
	var documentSetting = function(){
		//edit 세팅
    	formEditList.push($.osl.editorSetting("mmrDesc", {formValidate: formValidate,'minHeight': 220, disableResizeEditor: false}));
		
    	// begin:: 요구사항 결과 확인 데이터테이블
		datatableInitFlag[1] = 
			$.osl.datatable.setting("sprReqResultTable",{
				data: {
					source: {
						read: {
							url: "/spr/spr1000/spr1000/selectSpr1000SprReqListAjax.do",
							params:{
								sprId: paramSprId
							}
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
						}
					}
				},
				columns: [
					{field: 'reqOrd', title: '순번', textAlign: 'center', width: 50, search: true},
					{field: 'reqNm', title: '요청 제목', textAlign: 'center', width: 200, search: true},
					{field: 'reqProTypeNm', title: '처리유형', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProType", sortField: "reqProType"},
					{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 100, search: true,
						template: function (row) {
							if($.osl.isNull(row.reqChargerNm)){
								row.reqChargerNm = "";
							}
							var usrData = {
								html: row.reqChargerNm,
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
							};
							return $.osl.user.usrImgSet(row.reqChargerId, usrData);
						},
						onclick: function(rowData){
							$.osl.user.usrInfoPopup(rowData.reqChargerId);
						}
					},
					{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"date",
						template: function (row) {
							var paramDatetime = new Date(row.regDtm);
			                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
			                return agoTimeStr.agoString;
						}
					},
					{field: 'sprPoint', title: '스토리 포인트', textAlign: 'center', width: 80},
					{field: 'reqResultDescLen', title: '작성 여부', textAlign: 'center', width: 30, autoHide: false,
						template: function (row) {
							var rtnValue = '<i class="fa fa-hourglass"></i>';
							
							if(!$.osl.isNull(row.reqResultDescLen) && row.reqResultDescLen > 0){
								rtnValue = '<i class="fa fa-check-double kt-font-brand"></i>';
							}
			                return rtnValue;
						}
					}
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
								paramPrjGrpId: rowData.prjGrpId
								,paramPrjId: rowData.prjId
								,paramReqId: rowData.reqId
								,paramSprId: paramSprId
							};
						var options = {
								modalTitle: "요구사항 결과 작성",
								autoHeight: false
							};
						$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1005View.do',data,options);
					}
				},
			});
		
		// end:: 요구사항 결과 확인 데이터테이블
		datatableSetting[3] = function(){
			// begin:: 스프린트 상세정보 데이터테이블 
    		return $.osl.datatable.setting("sprDetailTable",{
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
					{field: 'prjNm', title: '프로젝트 명', textAlign: 'center', width: 100},
					{field: 'reqOrd', title: '순번', textAlign: 'center', width: 50, search: true},
					{field: 'reqNm', title: '요청 제목', textAlign: 'center', width: 200, search: true},
					{field: 'reqProTypeNm', title: '진행 상태', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProType", sortField: "reqProType"}, 
					{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 100, search: true,
						template: function (row) {
							if($.osl.isNull(row.reqChargerNm)){
								row.reqChargerNm = "";
							}
							var usrData = {
								html: row.reqChargerNm,
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
							};
							return $.osl.user.usrImgSet(row.reqChargerId, usrData);
						},
						onclick: function(rowData){
							$.osl.user.usrInfoPopup(rowData.reqChargerId);
						}
					},
					{field: 'timeRequired', title: '실 소요시간', textAlign: 'center', width: 100,
						template: function (row) {
							if($.osl.isNull(row.timeRequired)){
								row.reqChargerNm = "te";
							}
							return row.reqChargerNm;
						},
					},
					{field: 'sprPoint', title: '스토리포인트', textAlign: 'center', width: 70}
					
				],
				actionBtn:{
					"width": 80,
				},
			});
			// end:: 스프린트 상세정보 데이터테이블
		};
		
		// begin :: 마법사 
		//마법사 세팅
		var wizard = new KTWizard('kt_wizard_v3', {
			startStep: 1, 
			clickableSteps: false, 		
		});
		
		//스텝 변경 전 현재 단계에 데이터 저장
		wizard.on('beforeNext', function(wizardObj) {
			var reqEndCnt = $.osl.datatable.list.sprReqResultTable.targetDt.lastResponse.meta.reqEndCnt;
			//form valid check
			if($("#"+formId).valid() !== true){
				wizardObj.stop();
			}
			if(reqEndCnt != '0'){
				wizardObj.stop();
				$.osl.toastr($.osl.lang("spr1004.alert.reqEndCnt",reqEndCnt),{"type":"error"});
			};
		});

		//마법사 각 단계탭 클릭시 변경 이벤트
		wizard.on('change', function(wizardObj) {
			debugger;
			if(datatableInitFlag.hasOwnProperty(wizardObj.currentStep)){
				//마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
				if(!datatableInitFlag[wizardObj.currentStep]){
					datatableInitFlag[wizardObj.currentStep] = datatableSetting[wizardObj.currentStep]();
				}else if(datatableInitFlag[wizardObj.currentStep].hasOwnProperty("targetDt")){
					datatableInitFlag[wizardObj.currentStep].targetDt.reload();
				}
			}
		});
		
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
		
		$('#frSpr1004 [data-ktwizard-type="action-submit"]').click(function(){
	       	//formData
	   		var fd = $.osl.formDataToJsonArray(formId);
	       	
	   		//AJAX 설정
	   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/spr/spr1000/spr1000/updateSpr1003SprEnd.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

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
		
		//스프린트 종료 > 1.요구사항 결과 확인 > 신규 백로그 추가 버튼
		$('#newReqappend').click(function(){
			var data = {
					type: "insert"
			};
			var options = {
					modalTitle: "신규 백로그 추가",
					autoHeight: false
				};
			$.osl.layerPopupOpen('/req/req1000/req1000/selectReq1001View.do',data,options);
		});
		
		selectSprInfoStat();
		
	};
	
	var selectSprInfoStat = function(){
 		//AJAX 설정
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000SprInfoStatAjax.do'/>", "async":"true"},{sprId: paramSprId});
 		
 		//AJAX 전송 성공 함수
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				//사용자 목록 저장
 				var sprStat= data.sprStat;
 				console.log(sprStat);
 				$("#sprStat01").html($.osl.escapeHtml(sprStat.allCntSum));
 				$("#sprStat02").html($.osl.escapeHtml(sprStat.endCntSum));
 				$("#sprStat03").html($.osl.escapeHtml(sprStat.notEndCntSum));
 				//$("#sprStat04").html($.osl.escapeHtml(sprStat.allCntSum));
 				$("#sprStat05").html($.osl.escapeHtml(sprStat.sprEndPercent)+" %");
 				//$("#sprStat06").html($.osl.escapeHtml(sprStat.allCntSum));
 			}
 		});
 		//AJAX 전송
 		ajaxObj.send();
 	};
 	
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
