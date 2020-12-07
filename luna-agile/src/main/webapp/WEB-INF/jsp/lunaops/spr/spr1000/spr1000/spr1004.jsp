<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<form class="kt-form" id="frSpr1004">
	<input type="hidden" name="modalId" id="modalId" value="${param.modalId}">
	<input type="hidden" id="paramSprId" name="paramSprId" value="${param.paramSprId}">
	<input type="hidden" id="sprStDt" name="sprStDt" value="${param.paramSprStDt}">
	<input type="hidden" id="sprEdDt" name="sprEdDt" value="${param.paramSprEdDt}">
	<input type="hidden" id="sprTypeCd" name="sprTypeCd" value="${param.paramSprTypeCd}">
	<input type="hidden" id="sprTypeNm" name="sprTypeNm" value="${param.paramSprTypeNm}">
	<input type="hidden" id="sprRestDay" name="sprRestDay" value="${param.paramSprRestDay}">
	<input type="hidden" id="sprEndPercent" name="sprEndPercent" value="${param.paramSprEndPercent}">
	<input type="hidden" id="sprUseCd" name="sprUseCd" value="${param.paramUseCd}">
	<div class="kt-portlet__body">
		<div class="osl-wizard" id="kt_wizard_v3" data-ktwizard-state="step-first">
			<!--begin: Form Wizard Nav -->
			<div class="osl-wizard__nav">			
				<div class="osl-wizard__nav-items osl-wizard__nav-items--clickable">
					<!--begin: 1.요구사항 결과 확인 -->
					<div class="osl-wizard__nav-item" data-ktwizard-type="step" data-ktwizard-state="current">
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
					<div class="osl-wizard__nav-item" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">2</div>
							<div class="wizard-label">
								<div class="wizard-title">회고록 작성</div>
							</div>
						</div>
					</div>
					<!--end: 2.회고록 작성 -->
					<!--begin: 3.스프린트 결과 통계 -->
					<div class="osl-wizard__nav-item" data-ktwizard-type="step">
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
			<!-- begin:: 2. 회고록 입력 -->
			<div class="osl-wizard__content w-100 osl-h-px--500 kt-bg-light kt-padding-30 kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>회고록 제목</label>
							<input type="text" name="mmrNmInput" id="mmrNmInput" class="form-control" maxlength="99" required>
						</div>
					</div>
				</div>
				<div class="row kt-margin-b-20">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group form-group-last">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>회고록 내용</label>
							<textarea class="form-control" name="mmrDescInput" id="mmrDescInput" required></textarea>
						</div>
					</div>
				</div>
			</div>
			<!-- end:: 2. 회고록 입력 -->
			<!-- begin:: 3. 종료 통계 -->
			<div class="osl-wizard__content w-100 kt-bg-light kt-padding-30 kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="osl-background-around kt-padding-10">
					<!-- begin :: 스프린트 내용 table -->
					<div class="kt-portlet">
						<div class="kt-portlet__body">
							<div class="row kt-padding-l-20 kt-padding-r-20">
								<!-- begin :: 스프린트 이름, 설명 -->
								<div class="col-lg-5 col-md-12 col-sm-12 col-12 d-flex align-items-center">
									<div class="d-flex kt-padding-l-15">
										<div id="sprTypeCdCircle" class="kt-media kt-media--xl kt-media--circle osl-margin-r-2rm"><span id="sprTypeCdSpan"></span></div>
										<div class="d-flex flex-column osl-margin-r-auto osl-word__break">
											<h5 id="sprNm" class="kt-font-boldest text-truncate" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="">${param.paramSprNm}</h5>
											<span id="sprDesc" class="text-muted text-truncate" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="">${param.paramSprDesc}</span>
										</div>
									</div>	
								</div>
								<!-- end :: 스프린트 이름, 설명 -->
								<div class="col-lg-7 col-md-12 col-sm-12 col-12">
									<div class="d-flex flex-wrap osl-margin-t-2rm kt-padding-l-20">
										<div class="osl-margin-r-3rm osl-margin-b-175rm d-flex flex-column">
											<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>시작일</span>
											<h5><span class="badge badge-primary">${param.paramSprStDt}</span></h5>
										</div>
										<div class="osl-margin-r-3rm osl-margin-b-175rm d-flex flex-column">
											<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>종료일</span>
											<h5><span class="badge badge-danger">${param.paramSprEdDt}</span></h5>
										</div>
										<div class="osl-margin-r-3rm osl-margin-b-175rm d-flex flex-column">
											<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>남은 일수</span>
											<h5><span class="badge badge-warning osl-min-width-85">${param.paramRestDay}</span></h5>
										</div>
										<div class="osl-flex-row-fluid osl-margin-b-175rm">
											<div class="osl-progress">
												<div class="osl-margin-b-1rm">
													<i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i>
													<span>진척률</span>
												</div>
												<div class="progress osl-prj-group-md">
													<div id="progressBar" class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width:0" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="d-flex flex-wrap">
								<div class="kt-pricing-v1 kt-padding-l-0">
									<div class="kt-pricing-v1__header">
										<div class="kt-iconbox osl-remove__box-shadow">
											<div class="kt-iconbox__icon">
												<div class="kt-iconbox__icon-bg"></div>
												<img src="/media/osl/icon/reqAll.png">
											</div>
										</div>
									</div>
									<div class="kt-pricing-v1__body">
										<div class="kt-iconbox__title">
											전체 배정 백로그
										</div>
										<div class="kt-pricing-v1__price" id="sprStat01">
											<span class="kt-pricing-v1__price-currency">개</span>
										</div>
									</div>
								</div>
								<div class="kt-pricing-v1 osl-padding-l-05rm">
									<div class="kt-pricing-v1__header">
										<div class="kt-iconbox osl-remove__box-shadow">
											<div class="kt-iconbox__icon">
												<div class="kt-iconbox__icon-bg"></div>
												<img src="/media/osl/icon/reqDone.png">
											</div>
										</div>
									</div>
									<div class="kt-pricing-v1__body">
										<div class="kt-iconbox__title">
											최종 완료 백로그
										</div>
										<div class="kt-pricing-v1__price" id="sprStat02">
											<span class="kt-pricing-v1__price-currency">개</span>
										</div>
									</div>
								</div>
								<div class="kt-pricing-v1 osl-padding-l-05rm">
									<div class="kt-pricing-v1__header">
										<div class="kt-iconbox osl-remove__box-shadow">
											<div class="kt-iconbox__icon">
												<div class="kt-iconbox__icon-bg"></div>
												<img src="/media/osl/icon/reqPointer.png">
											</div>
										</div>
									</div>
									<div class="kt-pricing-v1__body">
										<div class="kt-iconbox__title">
											미 완료 백로그
										</div>
										<div class="kt-pricing-v1__price" id="sprStat03">
											<span class="kt-pricing-v1__price-currency">개</span>
										</div>
									</div>
								</div>
								<div class="kt-pricing-v1 osl-padding-l-05rm">
									<div class="kt-pricing-v1__header">
										<div class="kt-iconbox osl-remove__box-shadow">
											<div class="kt-iconbox__icon">
												<div class="kt-iconbox__icon-bg"></div>
												<img src="/media/osl/icon/reqInProgress.png">
											</div>
										</div>
									</div>
									<div class="kt-pricing-v1__body">
										<div class="kt-iconbox__title">
											평균 완료 소요시간
										</div>
										<div class="kt-pricing-v1__price" id="sprStat04">
											<span class="kt-pricing-v1__price-currency">시간</span>
										</div>
									</div>
								</div>
								<div class="kt-pricing-v1 osl-padding-l-05rm">
									<div class="kt-pricing-v1__header">
										<div class="kt-iconbox osl-remove__box-shadow">
											<div class="kt-iconbox__icon">
												<div class="kt-iconbox__icon-bg"></div>
												<img src="/media/osl/icon/reqInProgress.png">
											</div>
										</div>
									</div>
									<div class="kt-pricing-v1__body">
										<div class="kt-iconbox__title">
											완료 스토리 포인트 공수
										</div>
										<div class="kt-pricing-v1__price" id="sprStat06">
											<span class="kt-pricing-v1__price-currency">시간 /  1 스토리 포인트</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end :: 스프린트 내용 table -->
					<div class="kt-portlet">
						<div class="kt-portlet__head">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i>스프린트 차트
								</h5>
							</div>
						</div>
						<div class="kt-portlet__body">
							<!-- begin :: 스프린트 차트 -->
							<div class="row kt-padding-l-20 kt-padding-r-20 kt-margin-t-40">
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-0 kt-padding-r-10">
									<div class="border osl-min-h-px--140 osl-card__data--empty" id="burnUpChart"></div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-10 kt-padding-r-0">
									<div class="border osl-min-h-px--140 osl-card__data--empty" id="burnDownChart"></div>
								</div>
							</div>
							<div class="row kt-padding-l-20 kt-padding-r-20 kt-margin-t-40 ">
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 kt-padding-l-0 kt-padding-r-0">
									<div class="border osl-min-h-px--140 osl-card__data--empty" id="velocityChart"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- end :: 스프린트 차트 -->
					
					<!-- begin :: 스프린트 데이터테이블 전체영역-->
					<div class="kt-portlet kt-margin-b-0">
						<div class="kt-portlet__head">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i>스프린트 데이터 테이블
								</h5>
							</div>
						</div>
						<div class="kt-portlet__body  kt-padding-b-0">
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
			</div>
			<!-- end:: 3. 종료 통계  -->
		</div>
	</div>

	<div class="modal-footer">
		<button class="btn btn-outline-brand" data-dismiss="modal">
			<i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
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
	//요구사항 정보 목록
	var reqInfo = null;
	//datatableOpenFlag
	var datatableInitFlag = {3:false};
	var datatableSetting = {};
	//완료 소요시간
	var endReqSpendTime = []
	//스프린트 전체 스토리포인트
	var totalSprPoint = 0;
	//스토리포인트 리스트
	var endSprPoint = 0;
	//스프린트 아이디
	var paramSprId = $("#paramSprId").val();
	//시작일
	var paramSprStDt = $("#sprStDt").val();
	//종료일
	var paramSprEdDt = $("#sprEdDt").val();
	//스프린트 상태
	var paramSprTypeCd = $("#sprTypeCd").val();
	//스프린트 상태명
	var paramSprTypeNm = $("#sprTypeNm").val();
	//스프린트 명
	var paramSprNm = $("#sprNm").val();
	//스프린트 설명
	var paramSprDesc = $("#sprDesc").val();
	//스프린트 진척률
	var paramSprEndPercent = $("#sprEndPercent").val();
	//사용 유무
	var paramUseCd = $("#sprUseCd").val();
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	//시작일
	var paramSprStDt = $("#sprStDt").val();
	//종료일
	var paramSprEdDt = $("#sprEdDt").val();
	
	//단계별 데이터
	var wizardData = {
		//요구사항 결과 입력
		reqResultDescList: {}
	};
	
	var documentSetting = function(){
		//대기 인 경우
		var sprTypeClass = "kt-media--primary";
		var sprTypeNm = paramSprTypeNm;
		
		if(paramSprTypeCd == "02"){
			sprTypeClass = "kt-media--danger";
		}else if(paramSprTypeCd == "03"){
			sprTypeClass = "kt-media--warning";
		}
		//상태가 대기이고 사용 유무가 아니오인경우
		else if(paramUseCd == "02"){
			sprTypeClass = "kt-media--dark";
			sprTypeNm = "미 사용";
		}
		//원 색상 설정
		$("#sprTypeCdCircle").addClass(sprTypeClass);
		//상태 텍스트 넣기
		$("#sprTypeCdSpan").text(sprTypeNm);
		//진척률 데이터 넣기
		//너비
		$("#progressBar").css("width", paramSprEndPercent+"%");
		//문구
		$("#progressBar").attr("aria-valuenow", paramSprEndPercent);
		//텍스트
		$("#progressBar").text(paramSprEndPercent+"%");
		
		//타이틀 넣기
		$("#sprNm").data("original-title", paramSprNm);
		$("#sprDesc").data("original-title", paramSprDesc);
		//edit 세팅
    	formEditList.push($.osl.editorSetting("mmrDescInput", {formValidate: formValidate,'minHeight': 220, disableResizeEditor: false}));
		
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
    				{field: 'prjNm', title: '프로젝트 명', textAlign: 'center', width: 150},
    				{field: 'reqOrd', title: '순번', textAlign: 'center', width: 50, search: true},
    				{field: 'reqNm', title: '요청 제목', textAlign: 'center', width: 200, search: true},
    				{field: 'reqProTypeNm', title: '진행 상태', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProType", sortField: "reqProType"}, 
    				{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 100, search: true,
    					template: function (row) {
    						if($.osl.isNull(row.reqChargerNm)){
    							return row.reqChargerNm = "-";
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
    						var spendTime = calcSpendTime(row);
    						//종료된 요구사항일 경우, 완료소요시간목록에 추가
    						if(row.reqProType == "04"){
    							endReqSpendTime.push(Number(spendTime));
    						}
    						return spendTime + "시간";
    					},
    				},
    				{field: 'sprPoint', title: '스토리포인트', textAlign: 'center', width: 80,
    					template: function (row) {
    						//완료인 경우 데이터 추가
    						if($.osl.isNull(row.sprPoint)){
    							return '-'
    						}else{
    							return $.osl.escapeHtml(String(row.sprPoint));	
    						}
    					}
    				}
    			],
    			rows:{
    				minHeight:50,
    			},
    			actionBtn:{
    				select:false,
    				delete:false,
    				update:false,
    			},
    			callback:{
    				ajaxDone:function(evt, list){
    					//ajax로 전달받은 요구사항 값
    	 				var reqChartDataList = [];
    	 				if($.osl.datatable.list["sprDetailTable"].targetDt.lastResponse.hasOwnProperty('data')){
    	 					reqChartDataList = $.osl.datatable.list["sprDetailTable"].targetDt.lastResponse.data;
    	 				}
    	 				reqInfo = JSON.stringify(list);
    	 				
    	 				//차트가 안그려졌을때만
    	 				if($("#burnDownChart").children().length == 0){
	    	 				//통계정보 출력
	    	 				selectSprInfoStat();
    		 				//차트 출력
    		 				drawAllChart();
    	 				}
    	 				
    				}
    			}
    		});
    		// end:: 스프린트 상세정보 데이터테이블 
    		
		};
		
		// begin :: 마법사 
		//마법사 세팅
		var wizard = new KTWizard('kt_wizard_v3', {
			startStep: 1, 
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
				$.osl.alert($.osl.lang("spr1004.alert.reqEndCnt",reqEndCnt),{"type":"error"});
			};
		});
		
		//마법사 각 단계탭 클릭시 변경 이벤트
		wizard.on('change', function(wizardObj) {
			//전체 단계 수
			var totalStep = wizard.totalSteps;
			//현재 단계
			var checkThis = wizard.currentStep;
			//전체 단계-현재 단계
			var checking = totalStep - checkThis;
			//1번에서 3번으로 가려는 경우
			if(checking == 0 && checkThis == 3){
				var mmrDesc = $("#mmrDescInput").val();
				var mmrNm = $("#mmrNmInput").val();
				//공백이 있을 경우 이동 불가
				if($.osl.isNull(mmrDesc) || $.osl.isNull(mmrNm)){
					$.osl.alert("회고록 작성을 마무리해주세요.");
					wizardObj.goPrev();
				}
			}
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
		//종료버튼 클릭했을 때
		$('#frSpr1004 [data-ktwizard-type="action-submit"]').click(function(){
	       	//formData
	   		var fd = $.osl.formDataToJsonArray(formId);
	       	
	       	//회고록 이름
	       	fd.append("mmrNm", $("#mmrNmInput").val());
	       	//회고록 설명
	       	fd.append("mmrDesc", $("#mmrDescInput").val());
	       	//요구사항 정보 표출
	       	fd.append("reqInfo", reqInfo);
	       	
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
	   				//if($("button[data-datatable-id=spr1000Table][data-datatable-action=select]").length > 0){
	   				$("button[data-datatable-id=spr1000Table][data-datatable-action=select]").click();
	   				//}
	   				
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
		
	};
	
	var selectSprInfoStat = function(){
 		//AJAX 설정
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000SprInfoStatAjax.do'/>", "async":"false"},{sprId: paramSprId});
 		//AJAX 전송 성공 함수
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				var timeSum = 0;
 				for(var index = 0;index < endReqSpendTime.length;index++){
 					timeSum+=endReqSpendTime[index];
 				}
 				//사용자 목록 저장
 				var sprStat= data.sprStat;
 				//전체 백로그
 				$("#sprStat01").prepend($.osl.escapeHtml(sprStat.allCntSum));
 				//완료 백로그
 				$("#sprStat02").prepend($.osl.escapeHtml(sprStat.endCntSum));
 				//미완료 백로그
 				$("#sprStat03").prepend($.osl.escapeHtml(sprStat.notEndCntSum));
 				//평균 완료시간
 				if(endReqSpendTime.length == 0){
	 				$("#sprStat04").prepend("0");
 				}else{
 					$("#sprStat04").prepend(endReqSpendTime.reduce(getMean,0).toFixed(2));
 				}
 			
 				//진척률
 				if($.osl.escapeHtml(sprStat.sprEndPercent)=='NaN'){
	 				$("#sprStat05").prepend($.osl.escapeHtml("0"));
 				}else{
 					$("#sprStat05").prepend($.osl.escapeHtml(sprStat.sprEndPercent.toFixed(2)));
 				}
 				var sprPerTime = timeSum/sprStat.endSprPoint;
 				//스토리포인트 당 소요시간
 				if($.osl.escapeHtml(sprStat.sprPerTime)=='NaN'){
	 				$("#sprStat06").prepend("0");
 				}else{
 					$("#sprStat06").prepend($.osl.escapeHtml(sprPerTime.toFixed(2)));
 				}
 				
 				//스토리포인트 총합
 				totalSprPoint = sprStat.sprPoint;
 			}
 		});
 		
 		//AJAX 전송
 		ajaxObj.send();
 		
 	};
 	//평균구하기
 	var getMean = function(accumulator, value, index, array){
		  var sumOfAccAndVal = accumulator + value;
		  if (index === array.length - 1) {
		    return (sumOfAccAndVal) / array.length;
		  }
		  return sumOfAccAndVal;
	};
 	//차트그리기
 	var drawAllChart = function(){
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000ChartInfoAjax.do'/>", "async":"false"},{sprId: paramSprId});
 		//AJAX 전송 성공 함수
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				var chartData = data.chartData;
 				var today = new Date();
 				var endDt  = today.getFullYear() + "-" + (today.getMonth()+1) + "-" + today.getDate();
 				//차트데이터 가공
 				var seriesData = getDataRangeData(paramSprStDt, endDt, "1", chartData);
 				
 				if(chartData.length == 0){
 					$("#burnDownChart").text("데이터 없음")
 					$("#burnUpChart").text("데이터 없음")
 				}else{
	 				//번업차트 출력
	 				drawBurnUpChart(seriesData);
	 				//번다운차트 출력
	 				drawBurnDownChart(seriesData);
 				}
 				//데이터 없는 경우
 				if(chartData.length == 0){
					endSprPoint = 0
					$("#velocityChart").text("데이터 없음")
 				}else{
	 				//진행된 스토리포인트 저장
	 				endSprPoint = chartData[chartData.length - 1].cumSprPoint;
	 				//상태가 종료일 경우 velocity차트그리기
					drawVelocityChart();
 				}
 				
 			}	
 		});
 		ajaxObj.send();
 	}
 	
 	//번업차트그리기	
 	var drawBurnUpChart = function(dateRange){
		 var chart = $.osl.chart.setting("apex","burnUpChart",{
				//차트 데이터 설정
				data:{										
					param:{
						dataArr: dateRange,	
						 //x축 키값
						 xKey:"time",
						 key:{
							 key1:"idealBurnUPLine",
							 key2:"burnUpSprPoint"
						 },
						 keyNm:{
							 keyNm1:"idealBurnUPLine",
							 keyNm2:"Actual burnUpSprPoint"
						 },
						 //차트 타입
						 chartType:"line",
						 dataType: "local"
					}
				},
				fill:{
					type:false
				},
				chart:{
					//라인 색상
					colors: ["#586272", "#1cac81"],
					title: {
						text: "번업차트",
						align: "center",
					},
					stroke: {
				          curve: 'straight'
				    },
				    markers: {
				          size: 1
				    },
				    grid: {
				          borderColor: '#e7e7e7',
				          row: {
				            colors: ['#f3f3f3', 'transparent'], 
				            opacity: 0.5
				          },
				          show:false
				    },                                                                                                                                                          
				    animations:{
						enabled:false
					},
				    dataLabels:{
				    	enabled:true,
				    	formatter:function(val, opts){
				    		var valIndex = new Date(opts.ctx.data.twoDSeriesX[opts.dataPointIndex]).format("MM-dd");
				    		var xlabelList = opts.w.globals.labels.map(function(x){return new Date(x).format("MM-dd")});
				    		//해당 데이터가 x라벨에 존재할 경우 표출 아니면 미표출
				    		if(xlabelList.includes(valIndex)){
				    			if($.osl.isNull(val)){
				    				return "";
				    			}
				    			return val;
				    		}else{
					    		return "";
				    		} 
				    	}
				    },
					xaxis: {
						type: 'datetime',
				        labels: {
				        	hideOverlappingLabels :true,
				            formatter: function(value){
				            	return new Date(value).format("MM-dd");
				            }
				        },
				        tickAmount: '10',
		        	},
					yaxis: {
						show:true
		        	},
		        	toolbar:{
		        		tools:{
		        			pan:false
		        		}
		        	},
				},
				callback:{
					//차트가 작성 후 실행
					initComplete: function(chartContext, config){
						$(".apexcharts-zoomout-icon").addClass("kt-margin-0");
						$(".apexcharts-reset-icon").addClass("kt-margin-0");
						$(".apexcharts-toolbar").addClass("kt-margin-10");
						$(".apexcharts-toolbar").attr("style", "top:-20px; right: 10px;");
						$(".apexcharts-toolbar").removeAttr("style[padding]");
					}
				}
			});
		 }
 	//번다운 차트 그리기
 	var drawBurnDownChart = function(dateRange){
 		 var chart = $.osl.chart.setting("apex","burnDownChart",{
 			//차트 데이터 설정
				data:{										
					param:{
						dataArr: dateRange,	
						 //x축 키값
						 xKey:"time",
						 key:{
							 key1:"idealBurnDownLine",
							 key2:"burnDownSprPoint"
						 },
						 keyNm:{
							 keyNm1:"이상적인 번다운라인",
							 keyNm2:"실제 번다운라인"
						 },
						 //차트 타입
						 chartType:"line",
						 dataType: "local"
					}
				},
				fill:{
					type:false
				},
				chart:{
					//라인 색상
					colors: ["#ffb822","#840ad9"],
					title: {
						text: "번다운차트",
						align: "center",
					},
					stroke: {
				          curve: 'straight'
				    },
				    markers: {
				          size: 1
			        },
			        animations:{
						enabled:false
					},
				    dataLabels:{
				    	enabled:true,
				    	formatter:function(val, opts){
				    		var valIndex = new Date(opts.ctx.data.twoDSeriesX[opts.dataPointIndex]).format("MM-dd");
				    		var xlabelList = opts.w.globals.labels.map(function(x){return new Date(x).format("MM-dd")});
				    		//해당 데이터가 x라벨에 존재할 경우 표출 아니면 미표출
				    		if(xlabelList.includes(valIndex)){
				    			if($.osl.isNull(val)){
				    				return "";
				    			}
				    			return val;
				    		}else{
					    		return "";
				    		} 
				    	}
				    },
				    grid: {
				          borderColor: '#e7e7e7',
				          row: {
				            colors: ['#f3f3f3', 'transparent'], 
				            opacity: 0.5
				          },
				          show:false
				    },
					xaxis: {
				        type: 'datetime',
				        //출력 형태
				        labels: {
				        	hideOverlappingLabels :true,
				            formatter: function(value){
				            	return new Date(value).format("MM-dd");
				            }
				        },
				        //x축 몇개를 표시할 것인지
				        tickAmount: '10',
				        //중간에 점찍기
				        tickPlacement: 'between',
		        	},
					yaxis: {
						show:true
		        	},
		        	toolbar:{
		        		tools:{
		        			pan:false
		        		}
		        	},
				},
				callback:{
					//차트가 작성 후 실행
					initComplete: function(chartContext, config){
						$(".apexcharts-zoomout-icon").addClass("kt-margin-0");
						$(".apexcharts-reset-icon").addClass("kt-margin-0");
						$(".apexcharts-toolbar").addClass("kt-margin-10");
						$(".apexcharts-toolbar").attr("style", "top:-20px; right: 10px;");
						$(".apexcharts-toolbar").removeAttr("style[padding]");
					}
				}
			});
		 }
 	//벨로시티 차트 그리기
 	var drawVelocityChart = function(){
 		var chart = $.osl.chart.setting("apex","velocityChart",{
 			data:{
				//ajax 조회 url
				url: "<c:url value='/spr/spr1000/spr1000/selectSpr1000VelocityChartInfoAjax.do'/>",
				//파라미터
				param:{
					 data: paramSprId,
					 totalSprPoint: totalSprPoint,
					 endSprPoint: endSprPoint,
					 //차트 데이터 키값
					 key: {
						 key1: "sprPoint",
						 key2: "commitSprPoint",
						 key3: "actualVelocity",
						 key4: "commitVelocity",
					 },
					 //차트 데이터 키 명칭
					 keyNm:{
						 keyNm1: "실제 완료 스토리포인트",
						 keyNm2: "약속된 완료 스토리포인트",
						 keyNm3: "실제 진행 속도",
						 keyNm4: "약속된 진행 속도",
					 },
					 keyType:{
						 keyType1:"bar",
						 keyType2:"bar",
						 keyType3:"line",
						 keyType4:"line"
					 }
					 ,
					 //x축 키값
					 xKey:"term",
					 //차트 타입
					 chartType:"mix"
				 },
				 type: "remote"
			},
			chart:{
				title: {
					text: "벨로시티 차트",
					align: "center",
				},
				//색상
				colors: ["#ffb822","#840ad9", "#ffb822","#840ad9"],
			    yaxis: {
					show:true,
					min:0
	        	},
				stroke: {
			    	width: [1, 1, 1, 1],
			        curve: 'straight',
			        dashArray: [0, 0, 5, 5]
			    },
			    animations:{
					enabled:false
				},
			},
			callback:{
				//차트가 작성 후 실행
				initComplete: function(chartContext, config){
					$(".apexcharts-zoomout-icon").addClass("kt-margin-0");
					$(".apexcharts-reset-icon").addClass("kt-margin-0");
					$(".apexcharts-toolbar").addClass("kt-margin-10");
					$(".apexcharts-toolbar").attr("style", "top:-20px; right: 10px;");
					$(".apexcharts-toolbar").removeAttr("style[padding]");
					$(".apexcharts-menu-item").addClass("osl-min-width-70");
				}
			}
		});
	}
 	
 	//차트 데이터 정제
 	var getDataRangeData = function(sttDt, endDT, type, data){
 		//이상적인 번업라인 데이터 만들기
 		
 		//누적 스토리포인트 날짜:스토리포인트 형태로 변환
 		var sprPoint = [];
 		$.each(data, function(index, value){
 			var _series = {};
 			_series[value.reqEdDtm] = value.cumSprPoint;
 			sprPoint.push(_series);
 		});
 		
 		//시작일자와 종료일자 사이의 날짜를 일별로 자르기.
 		if(type=='1'){
 			var resDay = [];
	 	 	var stDay = new Date(sttDt);
	 	   	var edDay = new Date(endDT);    	
	 	  	while(stDay.getTime() <= edDay.getTime()){
	 	  			var ideal = 0;
	 	  			var _mon = (stDay.getMonth()+1);
	 	  			_mon = _mon < 10 ? '0'+_mon : _mon;
	 	  			var _day = stDay.getDate();
	 	  			_day = _day < 10 ? '0'+_day : _day;
	 	  			var _time = stDay.getFullYear() + '-' + _mon + '-' +  _day;
	 	  			if(_time == data.reqEdDtm){
	 	  				resDay.push({"time":stDay.getFullYear() + '-' + _mon + '-' +  _day})
	 	  			}else{  
		 	   		resDay.push({"time":stDay.getFullYear() + '-' + _mon + '-' +  _day});
	 	  			
	 	  			}
	 	   			stDay.setDate(stDay.getDate() + 1);
	 	   			ideal = ideal + 10
	 	   	}
	 	//주별로
 		}else if(type=='2'){
 			
 		}
 		//이상적인 번업라인 데이터 작성
 		//일수
 		var length = resDay.length
 		//전체 스토리포인트 총합 가져와서 / 일수로 나누기
 		var step = totalSprPoint / (length-1)
 		//총 길이가 2보다 작을 때
 		var start = 0;
 		$.each(resDay, function(index, value){
 			//바로종료할경우
	 		if(length == 1){
	 			value['idealBurnUPLine'] = totalSprPoint;
	 		//2일만에 종료할경우
	 		}else if(length == 2){
	 			value['idealBurnUPLine'] = start;
	 			start += totalSprPoint;
	 		//나머지
	 		}else{
	 			value['idealBurnUPLine'] = start.toFixed(1);
	 			start += step;
	 		}
 		})
 		//이상적인 다운라인 데이터 작성
 		//일수
 		var end = totalSprPoint;
 		$.each(resDay, function(index, value){
 			//바로종료할경우
	 		if(length == 1){
	 			value['idealBurnDownLine'] = totalSprPoint;
	 		//2일만에 종료할경우
	 		}else if(length == 2){
	 			value['idealBurnDownLine'] = end;
	 			end -= totalSprPoint;
	 		//나머지
	 		}else{
	 			value['idealBurnDownLine'] = end.toFixed(1);
	 			end -= step	
	 		}
 		})
 		//오늘 날짜
 		var today = new Date();
 		//번업 스토리포인트 데이터 작성
 		for(var dayIndex = 0; dayIndex < resDay.length; dayIndex++){
 			var match = false;
 			//오늘 날짜보다 이후의 날짜는  추가하지않음.
 			var gap = new Date(resDay[dayIndex].time).getTime() - today.getTime()
 			if(gap < 0){
	 			for(var dataIndex = 0 ; dataIndex < data.length ; dataIndex ++){
	 				if(resDay[dayIndex].time == data[dataIndex].reqEdDtm){
	 					match = true;
	 					//매치할 경우 가져온 데이터에서 할당한다.
	 					resDay[dayIndex]['burnUpSprPoint'] = data[dataIndex].cumSprPoint
	 					resDay[dayIndex]['burnDownSprPoint'] = totalSprPoint - data[dataIndex].cumSprPoint
	 					break;
	 				}
	 			}
	 			//매치하지 않을 경우
	 			if(!match){
	 				//처음 시작은 0으로
	 				if(dayIndex == 0){
	 					resDay[dayIndex]['burnUpSprPoint'] = 0;
	 					resDay[dayIndex]['burnDownSprPoint'] = totalSprPoint;
	 				//매치하지 않을 경우 전의 sprPoint를 가져와서 할당한다.
	 				}else{
		 				resDay[dayIndex]['burnUpSprPoint'] = resDay[dayIndex - 1]['burnUpSprPoint']; 
		 				resDay[dayIndex]['burnDownSprPoint'] = resDay[dayIndex - 1]['burnDownSprPoint']; 
	 				}
	 			}
 			}
 		}
 	   	return resDay;
 	}
 	//요구사항 소요시간 연산식
 	var calcSpendTime = function(rowData){
 		var wkInfo = rowData;
 		
 		//기본담당자인 경우
 		if($.osl.isNull(wkInfo.reqChargerId)){
 			return 0;
 		}
 		//저장된 값이 없는 경우
 		if($.osl.isNull(wkInfo.reqStDuDtm) || $.osl.isNull(wkInfo.reqEdDuDtm)){
 			return 0;
 		}
 		//종료된 요구사항인 경우
 		if(wkInfo.reqProType == "04"){
 			
 			//소요일
 	 		var spendTime = wkInfo.endTimeRequired;
 			
 		//접수요청인 경우
 		}else if(wkInfo.reqProType == "01"){
 			
 			return 0;
 			
 		//요구사항이 진행 중에 스프린트가 종료된 경우
 		}else if(paramSprTypeCd == "03"){
 			
 			var spendTime = wkInfo.notEndTimeRequired + 1;
 			
 		//그외
 		}else{
 			
 			var spendTime = wkInfo.notEndTimeRequired;
 		}
 		
 		//근무 시작 시간
 		var wkStTm = moment(wkInfo.wkStTm, "HHmm");
 		//근무 종료 시간
 		var wkEdTm = moment(wkInfo.wkEdTm, "HHmm");
 		//휴식 시작 시간
 		var bkStTm = moment(wkInfo.bkStTm, "HHmm");
 		//휴식 종료 시간
 		var bkEdTm = moment(wkInfo.bkEdTm, "HHmm");
 		//요구 사항 시작 일시
 		var reqStDtm = moment(wkInfo.reqStDtm, 'YYYY-MM-DD HH:mm:ss');
 		//요구 사항 종료 일시
 		var reqEdDtm = moment(wkInfo.reqEdDtm, 'YYYY-MM-DD HH:mm:ss');
 		//요구 사항 시작 예정 일시
 		var reqStDuDtm = moment(wkInfo.reqStDuDtm, 'YYYY-MM-DD');
 		//요구 사항 종료 예정 일시
 		var reqEdDuDtm = moment(wkInfo.reqEdDuDtm, 'YYYY-MM-DD');
 		
 		//요구사항 시작 시간
 		var reqStTm = moment(reqStDtm.format("HHmm"),"HHmm");
 		//요구사항 종료 시간
 		var reqEdTm = moment(reqEdDtm.format("HHmm"),"HHmm");
 		//현재 시간
 		var nowTime = moment(moment().format("HHmm"),"HHmm");
 		
 		//시간차이
 		var wkDiff = wkEdTm.diff(wkStTm);
 		var bkDiff = bkEdTm.diff(bkStTm);
 		
 		//총 근무시간
 		var wkTime = wkDiff-bkDiff;
 		
 		//근무시간이 0인 경우
 		if(wkTime <= 0){
 			return 0;
 		}
 		
 		//시작일 근무시간
 		var stDtWkTm = 0;
 		//시작일 시간 (조건 휴식시간 이전, 중간, 이후)
 		//요구사항 시작 시간이 휴식시간 이전인가?
 		if(bkStTm.diff(reqStTm) < 0 ){
 			//종료시간 - 시작시간 - 휴식시간
 			stDtWkTm = wkEdTm.diff(reqStTm) - 3600000;
 		}else if(bkEdTm.diff(reqStTm) <= 0 && bkStTm.diff(reqStTm) >= 0){
 			//휴식을 취한 시간 = 휴식종료시간 - 요구사항 시작시간
 			var restTime = bkEdTm.diff(reqStTm);
 			//종료시간 - 시작시간 - 휴식을 취한 시간
 			stDtWkTm = wkEdTm.diff(reqStTm) - restTime;
 		}else{
 			//종료시간 - 시작시간
 			stDtWkTm = wkEdTm.diff(reqStTm)
 		}
 		
 		//마지막날 시간
 		var edDtWkTm = 0;
 		//요구사항 종료일 경우 (조건 휴식시간 이전, 중간, 이후)
 		if(wkInfo.reqProType == "04"){
 			//요구사항 종료 시간이 휴식시간 이전인가?
 	 		if(bkEdTm.diff(reqEdTm) < 0 ){
 	 			//요구사항 종료시간 - 근무시작시간
 	 			edDtWkTm = reqEdTm.diff(wkStTm);
 	 		}else if(bkEdTm.diff(reqEdTm) <= 0 && bkStTm.diff(reqEdTm) >= 0){
 	 			//휴식을 취한 시간 = 요구사항종료시간 - 휴식 시작시간
 	 			var restTime = reqEdTm.diff(bkStTm);
 	 			//요구사항 종료시간 - 근무 시작시간 - 휴식을 취한 시간
 	 			edDtWkTm = wkEdTm.diff(reqStTm) - restTime;
 	 		}else{
 	 			//요구사항 종료시간 - 근무 시작시간 - 휴식시간
 	 			edDtWkTm = reqEdTm.diff(wkStTm) - 3600000;
 	 		}
 		//요구사항 진행중일 경우
 		}else{
 			//종료된 스프린트인 경우
 			if(paramSprTypeCd == "03"){
 				
 				//종료일 풀근무로 생각함
 	 			edDtWkTm = 0;
 				
	 		//진행중인 스프린트에 진행중인 요구사항의 경우
 			}else{
 				
 				//현재시간이 시간이 휴식시간 이전인가?
	 	 		if(bkEdTm.diff(nowTime) < 0 ){
	 	 			
	 	 			//스프린트 종료시간 - 근무시작시간
	 	 			edDtWkTm = reqEdTm.diff(wkStTm);
	 	 			
	 	 		}else if(bkEdTm.diff(nowTime) <= 0 && bkStTm.diff(nowTime) >= 0){
	 	 			
	 	 			//휴식을 취한 시간 = 현재시간 - 휴식 시작시간
	 	 			var restTime = nowTime.diff(bkStTm);
	 	 			//현재시간 - 근무 시작시간 - 휴식을 취한 시간
	 	 			edDtWkTm = nowTime.diff(reqStTm) - restTime;
	 	 			
	 	 		}else{
	 	 			//현재시간 - 근무 시작시간 - 휴식시간
	 	 			edDtWkTm = nowTime.diff(wkStTm) - 3600000;
	 	 		}
 			}
 		}
 		if($.osl.isNull(wkInfo.reqStDtm) || $.osl.isNull(wkInfo.reqEdDtm)){
 			
 			var reqSpendTime = moment.duration(wkTime).asHours()*spendTime;
 			
 		}else{
	 		//온전한 일수
	 		var fullTime = moment.duration(wkTime).asHours()*(spendTime-2);
	 		//시작일 근무 시간
	 		var startTime = moment.duration(stDtWkTm).asHours();
	 		//종료일 근무 시간
	 		var endTime = moment.duration(edDtWkTm).asHours();
	 		//총 소요시간
	 		var reqSpendTime = fullTime + startTime + endTime;
 		}
 		
 		return reqSpendTime.toFixed(1);
 	}
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
