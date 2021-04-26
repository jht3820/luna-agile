<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<i class="fa fa-th-large kt-margin-r-5"></i>
				<c:out value="${sessionScope.selMenuNm}" />
			</h4>
		</div>
		<!-- end :: 타이틀  -->
		<!-- begin :: 카드형,데이터테이블형 변환 버튼 -->
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<div class="btn-group" role="group">
					<button type="button"
						class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type active"
						title="데이터 카드 형식으로 보기"
						data-title-lang-cd="dpl3000.button.title.card"
						data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom"
						data-auth-button="select" tabindex="6" data-view-type="01">
						<i class="fa fa-table osl-padding-r0"></i>
					</button>
					<button type="button"
						class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type"
						title="데이터 테이블 형식으로 보기"
						data-title-lang-cd="dpl3000.button.title.grid"
						data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom"
						data-auth-button="select" tabindex="7" data-view-type="02">
						<i class="fa fa-list osl-padding-r0"></i>
					</button>
				</div>
			</div>
		</div>
		<!-- end :: 카드형,데이터테이블형 변환 버튼 -->
	</div>
	<!-- end :: 타이틀 + 카드형,데이터테이블형 변환 버튼 -->
	<!-- begin :: 내용 CRUD관련 영역 -->
	<div
		class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block ">
		<!-- begin :: 검색 영역 -->
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="dpl3000Table"></div>
		</div>
		<!-- end :: 검색 영역 -->
		<!-- begin :: 조회 등록 수정 삭제 시작 종료 버튼 영역 -->
		<div
			class="col-lg-9 col-md-12 col-sm-12 text-right osl-mobile-text--left kt-padding-r-0">
			<button type="button"
				class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air"
				data-datatable-id="dpl3000Table" data-datatable-action="select"
				title="배포 실행 관리 조회" data-toggle="kt-tooltip" data-skin="brand"
				data-placement="bottom" data-auth-button="select" tabindex="5">
				<i class="fa fa-list"></i><span>조회</span>
			</button>
			<button type="button"
				class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air"
				data-datatable-id="dpl3000Table" data-datatable-action="update"
				title="배포 실행 관리 수정" data-toggle="kt-tooltip" data-skin="brand"
				data-placement="bottom" data-auth-button="update" tabindex="7">
				<i class="fas fa-play-circle"></i><span>실행</span>
			</button>
			<button type="button"
				class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air"
				data-datatable-id="dpl3000Table" data-datatable-action="delete"
				title="배포 실행 관리 삭제" data-toggle="kt-tooltip" data-skin="brand"
				data-placement="bottom" data-auth-button="delete" tabindex="8">
				<i class="fas fa-stop-circle"></i><span>중지</span>
			</button>
			<!-- begin :: dropdown 버튼 -->
			<div class="dropdown dropdown-inline">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-spinner kt-margin-r-5"></i> 배포 실행 중(<span>2</span>)
				</button>
				<div class="dropdown-menu dropdown-menu-right kt-padding-0">
					<div class="dropdown-item kt-padding-5 border-bottom osl-action-plan-btn" id="">
						<div class="progress osl-prj-group-md w-100 position-relative">
							<div class="progress-bar progress-bar-striped kt-bg-brand osl-gradient-brand-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
							<div class="position-absolute kt-font-md w-100 text-center kt-font-bolder kt-padding-t-5"><span>배포계획 C</span> (<span>50</span>%)</div>
						</div>
					</div>
					<div class="dropdown-item kt-padding-5 osl-action-plan-btn" id="">
						<div class="progress osl-prj-group-md w-100 position-relative">
							<div class="progress-bar progress-bar-striped kt-bg-brand osl-gradient-brand-bar" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
							<div class="position-absolute kt-font-md w-100 text-center kt-font-bolder kt-padding-t-5"><span>배포계획 D</span> (<span>70</span>%)</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end :: dropdown 버튼-->
		</div>
		<!-- end :: 조회 등록 수정 삭제 시작 종료 버튼 영역 -->
	</div>
	<!-- end :: 내용 CRUD관련 영역 -->
	<!-- end :: head -->
</div>
<!-- begin :: 카드형 -->
<div id="dpl3000CardTable">
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-12">
			<!-- begin :: 카드 -->
			<div class="kt-portlet kt-portlet--mobile border">
				<!-- begin :: 카드 상단 영역-->
				<div class="kt-portlet__head kt-portlet__head--lg border-bottom-0 osl-ribbon osl-ribbon__clip osl-ribbon__right ">
					<!-- begin :: 배포 실행 이름-->
					<div class="kt-portlet__head-label">
						<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid">
							<input type="checkbox" value="'+idx+'" name="prjGrpCheckbox"
							id="prjGrpCheckbox_'+map.prjId+'"
							data-datatable-id="dpl3000Table">&nbsp;<span></span>
						</label>
						<h4 class="kt-padding-l-10 font-weight-bold">배포 실행 이름</h4>
					</div>
					<!-- end :: 배포 실행 이름-->
					<!-- begin :: 리본 버튼 -->
					<div class="kt-portlet__head-toolbar">
						<div class="kt-user-card-v2 btn kt-margin-r-100">
							<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">
								<img src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000088" class="">
							</div>
							<div class="kt-user-card-v2__details">
								<span class="kt-user-card-v2__name">관리자</span>
							</div>
						</div>
						<div class="osl-ribbon__target" style="top: 15px; height: 45px;">
							<span class="osl-ribbon__inner kt-bg-brand"></span>
							<div class="kt-font-xl kt-margin-r-10  osl-cursor-pointer osl-ribbon__btn" data-view-type="01"><i class="fas fa-play-circle text-white"></i></div>
							<div class="kt-font-xl osl-cursor-pointer osl-ribbon__btn" data-view-type="02"><i class="fas fa-file-code text-white"></i></div>
							<div class="osl-ribbon__shadow">
								<i class="fas fa-caret-right"></i>
							</div>
						</div>
					</div>
					<!-- end :: 리본 버튼-->
				</div>

				<div class="kt-portlet__body kt-padding-t-0">
					<div class="row">
						<!-- begin :: 배포 실행 설명 -->
						<div
							class="kt-padding-l-50 kt-padding-b-15 col-lg-4 col-md-4 col-sm-12 osl-mobile-padding-l-10">
							<div class="kt-padding-b-5">
								<h5>배포 실행 설명</h5>
							</div>
						</div>
						<!-- end :: 배포 실행 설명 -->
					</div>
					<!-- end :: 카드  상단 영역 -->

					<!-- begin :: 카드  하단 영역 -->
					<div class="row kt-margin-t-20">
						<!-- start :: 배정 JOB 개수 표출 영역 -->
						<div class="col-lg-6 col-md-6 col-sm-6 col-6">
							<div class="osl-widget">
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon kt-margin-l-100-desktop">
										<img src="/media/osl/icon/reqAll.png">
									</div>
									<div class="osl-widget-info__item-info kt-padding-r-50-desktop">
										<a href="#" class="osl-widget-info__item-title">배정 JOB</a>
										<div class="osl-widget-info__item-desc">
											<span>100</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-6">
							<div class="osl-widget">
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon kt-margin-l-100-desktop">
										<img src="/media/osl/icon/reqAll.png">
									</div>
									<div class="osl-widget-info__item-info kt-margin-r-50-desktop">
										<a href="#" class="osl-widget-info__item-title">배정 JOB</a>
										<div class="osl-widget-info__item-desc">
											<span>100</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end :: 배정 JOB 개수 표출 영역 -->
					</div>
					
					
					<!-- begin :: 배포 진행률 -->
					<div class="kt-margin-t-20">
						<div class="osl-progress">
							<div class="kt-padding-b-5">
								<i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i>
								<span>배포 진행률</span>
							</div>
							<div class="progress osl-prj-group-md">
								<div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100">78%</div>
							</div>
						</div>
					</div>
					<!-- end :: 배포 진행률 -->
				</div>
				<!-- end :: 카드 하단 영역 -->
			</div>
			<!-- end :: 카드 -->
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-12">
			<!-- begin :: 카드 -->
			<div class="kt-portlet kt-portlet--mobile border">
				<!-- begin :: 카드 상단 영역-->
				<div class="kt-portlet__head kt-portlet__head--lg border-bottom-0  osl-ribbon osl-ribbon__clip osl-ribbon__right">
					<!-- begin :: 배포 실행 이름-->
					<div class="kt-portlet__head-label">
						<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid">
							<input type="checkbox" value="'+idx+'" name="prjGrpCheckbox"
							id="prjGrpCheckbox_'+map.prjId+'"
							data-datatable-id="dpl3000Table">&nbsp;<span></span>
						</label>
						<h4 class="kt-padding-l-10 font-weight-bold">배포 실행 이름</h4>
					</div>
					<!-- end :: 배포 실행 이름-->
					
					<!-- begin :: 리본 버튼 -->
					<div class="kt-portlet__head-toolbar">
						<div class="kt-user-card-v2 btn kt-margin-r-100">
							<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">
								<img src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000088" class="">
							</div>
							<div class="kt-user-card-v2__details">
								<span class="kt-user-card-v2__name">관리자</span>
							</div>
						</div>
						<div class="osl-ribbon__target" style="top: 15px; height: 45px;">
							<span class="osl-ribbon__inner kt-bg-brand"></span>
							<div class="kt-font-xl kt-margin-r-10 osl-cursor-pointer osl-ribbon__btn" data-view-type="01"><i class="fas fa-play-circle text-white"></i></div>
							<div class="kt-font-xl osl-cursor-pointer osl-ribbon__btn" data-view-type="02"><i class="fas fa-file-code text-white"></i></div>
							<div class="osl-ribbon__shadow">
								<i class="fas fa-caret-right"></i>
							</div>
						</div>
					</div>
					<!-- end :: 리본 버튼-->
				</div>

				<div class="kt-portlet__body kt-padding-t-0">
					<div class="row">
						<!-- begin :: 배포 실행 설명 -->
						<div
							class="kt-padding-l-50 kt-padding-b-15 col-lg-4 col-md-4 col-sm-12 osl-mobile-padding-l-10">
							<div class="kt-padding-b-5">
								<h5>배포 실행 설명</h5>
							</div>
						</div>
						<!-- end :: 배포 실행 설명 -->
					</div>
					<!-- end :: 카드  상단 영역 -->

					<!-- begin :: 카드  하단 영역 -->
					<div class="row kt-margin-t-20">
						<!-- start :: 배정 JOB 개수 표출 영역 -->
						<div class="col-lg-6 col-md-6 col-sm-6 col-6">
							<div class="osl-widget">
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon kt-margin-l-100-desktop">
										<img src="/media/osl/icon/reqAll.png">
									</div>
									<div class="osl-widget-info__item-info kt-padding-r-50-desktop">
										<a href="#" class="osl-widget-info__item-title">배정 JOB</a>
										<div class="osl-widget-info__item-desc">
											<span>100</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-6">
							<div class="osl-widget">
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon kt-margin-l-100-desktop">
										<img src="/media/osl/icon/reqAll.png">
									</div>
									<div class="osl-widget-info__item-info kt-margin-r-50-desktop">
										<a href="#" class="osl-widget-info__item-title">배정 JOB</a>
										<div class="osl-widget-info__item-desc">
											<span>100</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end :: 배정 JOB 개수 표출 영역 -->
					</div>
					
					<!-- begin :: 배포 진행률 -->
					<div class="kt-margin-t-20">
						<div class="osl-progress">
							<div class="kt-padding-b-5">
								<i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i>
								<span>배포 진행률</span>
							</div>
							<div class="progress osl-prj-group-md">
								<div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100">78%</div>
							</div>
						</div>
					</div>
					<!-- end :: 배포 진행률 -->
				</div>
				<!-- end :: 카드 하단 영역 -->
			</div>
			<!-- end :: 카드 -->
		</div>
	</div>
</div>
<!-- end :: 카드형 -->
<!-- begin :: 데이터테이블형 -->
<div class="kt_datatable osl-datatable-footer__divide" id="dpl3000Table"></div>
<!-- end :: 데이터테이블형 -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLDpl3000Popup = function () {
	var documentSetting = function(){
		var currentViewType = "01";
		var popupViewType;
		$.osl.datatable.setting("dpl3000Table",{
			data: {
				source: {
					read: {
						url: "/req/req1000/req1000/selectReq1000ListAjaxView.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjNm', title: '결재 상태', textAlign: 'left', width: 70, search: true},
				{field: 'reqOrd', title: '배포 상태', textAlign: 'left', width: 70, autoHide: false},
				{field: 'reqProTypeNm', title: '배포 버전', textAlign: 'left', width: 70, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortField: "reqProTypeCd"},
				{field: 'reqNm', title: '배포 명', textAlign: 'left', width: 300, search: true},
				{field: 'reqDtm', title: '배포 방법', textAlign: 'center', width: 50, search: true, searchType:"date"},
				{field: 'reqDtm', title: '배포 일자', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'reqDtm', title: '배포자', textAlign: 'center', width: 70, search: true, searchType:"date"},
				{field: 'reqDtm', title: '배포 설명', textAlign: 'center', width: 100, search: true, searchType:"date"},
			],
			actionBtn:{
				"dblClick": true 
			},
			actionTooltip:{
				"update": "요구사항 수정",
				"delete": "요구사항 삭제"
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("req1001.title"),
							closeConfirm: false,
						};
					
					//$.osl.layerPopupOpen('/req/req1000/req1000/selectReq1001View.do',data,options);
				},
				
				"update":function(rowData, datatableId, type, rowNum, elem){
					if(rowData.reqProType != "01"){
						$.osl.alert('접수 요청중인 요구사항만 수정 가능합니다.');
						return false;
					}
					var data = {
							type:"update",
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
							paramReqUsrId: rowData.reqUsrId
						};
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("req1001.title"),
							closeConfirm: false
						};
					
					//$.osl.layerPopupOpen('/req/req1000/req1000/selectReq1001View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					//AJAX 설정
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/req/req1000/req1000/deleteReq1001ReqListAjax.do'/>"}
							,{deleteDataList: JSON.stringify(rowDatas)});
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
			   				$.osl.alert(data.message,{type: 'error'});
			   			}else{
			   				//삭제 성공
			   				$.osl.toastr(data.message);
			   				
			   				//datatable 조회
			   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			   			}
					});
					
					//AJAX 전송
					ajaxObj.send();
				},
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					var data = {
							type:"update",
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
							paramReqUsrId: rowData.reqUsrId
						};
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("req1001.title"),
							closeConfirm: false
						};
					
					//$.osl.layerPopupOpen('/req/req1000/req1000/selectReq1002View.do',data,options);
				}
			},
			callback:{
				initComplete: function(evt,config){
					fnViewerChange();
				}
			}
		});
		
		//뷰 변경 이벤트
		$(".btn-view-type").click(function(){
			var viewType = $(this).data("view-type");
			
			//active 교체
			$(".btn-view-type.active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType = viewType;
			//뷰어 변경
			fnViewerChange();
		});

		//카드형, 목록형
		var fnViewerChange = function(){
			//현재 viewType에 따라 show/hide
			//카드 형식
			if(currentViewType == "01"){
				$("#dpl3000Table .kt-datatable__table").css({visibility: "hidden", height: 0});
				$("#dpl3000CardTable").show();
			//데이터테이블 형식
			}else{	
				$("#dpl3000CardTable").hide();
				$("#dpl3000Table .kt-datatable__table").css({visibility: "visible",height: "auto"});
			}
		}	
		
		$(".osl-ribbon__btn").click(function(){
			popupViewType = $(this).data("view-type");
			btnPopupOpen();
		});
		
		$('.osl-action-plan-btn').click(function(){
			popupViewType = "01";
			btnPopupOpen();
		});
		
		//팝업
		var btnPopupOpen = function(){
			
			if(popupViewType == "01"){
				var data = {
				};
				var options = {
					modalTitle: '배포 계획실행',
					autoHeight: false,
					modalSize: 'xl'
				};
				$.osl.layerPopupOpen('/dpl/dpl3000/dpl3000/selectDpl3001View.do',data,options);
			}else{	
				var data = {
				};
				var options = {
					modalTitle: '배포 계획 실행 이력',
					autoHeight: false,
					modalSize: 'xl'
				};
				$.osl.layerPopupOpen('/dpl/dpl3000/dpl3000/selectDpl3002View.do',data,options);
			}
		}
	};

	
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl3000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
