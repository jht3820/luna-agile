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
		<!-- begin :: 카드형,데이터테이블형 변환 버튼 -->
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type active" title="데이터 카드 형식으로 보기" data-title-lang-cd="mis1000.button.title.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="01">
						<i class="fa fa-table osl-padding-r0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="데이터 테이블 형식으로 보기" data-title-lang-cd="mis1000.button.title.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="7" data-view-type="02">
						<i class="fa fa-list osl-padding-r0"></i>
					</button>
				</div>
			</div>
		</div>
		<!-- end :: 카드형,데이터테이블형 변환 버튼 -->
	</div>
	<!-- end :: 타이틀 + 카드형,데이터테이블형 변환 버튼 -->
	<!-- begin :: 내용 CRUD관련 영역 -->
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block ">
		<!-- begin :: 검색 영역 -->
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="mis1000Table">
				<div class="input-group">
					<div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
						<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="mis1000Table">
							<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
							<a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a>
							<a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a>
							<a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a>
						</div>
					</div>
					<select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_mis1000Table" name="searchSelect" aria-hidden="true" data-datatable-id="mis1000Table" style="display: none;"></select>
					<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="mis1000Table">
						<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_mis1000Table" id="searchData_mis1000Table" data-datatable-id="mis1000Table">
						<span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
						<input type="hidden" name="searchStartDt" id="searchStartDt_mis1000Table" data-datatable-id="mis1000Table">
						<input type="hidden" name="searchEndDt" id="searchEndDt_mis1000Table" data-datatable-id="mis1000Table">
					</div>
					<div class="input-group-append">
						<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="mis1000Table">
							<i class="fa fa-search"></i><span class=""><span>검색</span></span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- end :: 검색 영역 -->
		<!-- begin :: 조회 등록 수정 삭제 시작 종료 버튼 영역 -->
		<div class="col-lg-9 col-md-12 col-sm-12 text-right osl-mobile-text--left kt-padding-r-0">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="mis1000Table" data-datatable-action="select" title="마일스톤 관리 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
				<i class="fa fa-list"></i><span>조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="mis1000Table" data-datatable-action="insert" title="마일스톤 관리 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="6">
				<i class="fa fa-plus"></i><span>등록</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="mis1000Table" data-datatable-action="update" title="마일스톤 관리 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="7">
				<i class="fa fa-edit"></i><span>수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="mis1000Table" data-datatable-action="delete" title="마일스톤 관리 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8">
				<i class="fa fa-trash-alt"></i><span>삭제</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="mis1000Table" data-datatable-action="prjAssign" title="마일스톤 관리 프로세스 배정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="prjAssign" tabindex="8">
				<i class="fas fa-folder-open"></i><span>프로세스 배정</span>
			</button>
		</div>
		<!-- end :: 조회 등록 수정 삭제 시작 종료 버튼 영역 -->
	</div>
	<!-- end :: 내용 CRUD관련 영역 -->
<!-- end :: head -->
</div>
<!-- begin :: 카드형 -->
<div id="mis1000CardTable">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<!-- begin :: 카드 -->
			<div class="kt-portlet kt-portlet--mobile border">
				<!-- begin :: 카드 상단 영역-->
				<div class="kt-portlet__head kt-portlet__head--lg border-bottom-0">
					<!-- begin :: 마일스톤 이름-->
					<div class="kt-portlet__head-label">
						<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid">
							<input type="checkbox" value="'+idx+'" name="prjGrpCheckbox" id="prjGrpCheckbox_'+map.prjId+'" data-datatable-id="mis1000Table">&nbsp;<span></span>
						</label>
						<h4 class="kt-padding-l-10 font-weight-bold">마일스톤 이름</h4>
						<div class="kt-media-group osl-margin-b-05 kt-margin-l-20">
							<a href="#" class="kt-media kt-media--xs kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="'+authMap.authTargetNm+'" onclick=""><img src=""></a>
							<a href="#" class="kt-media kt-media--xs kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="그 외 담당자 +'+endAuthCnt+'"><span>5</span></a>
						</div>
					</div>
					<!-- end :: 마일스톤 이름-->
					<!-- begin :: dropdown 버튼 -->
					<div class="kt-portlet__head-toolbar">
						<div class="dropdown dropdown-inline">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-ellipsis-h kt-padding-0"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-right">
								<div class="dropdown-item" id=""><i class="fa fa-edit kt-font-brand"></i>마일스톤 수정</div>
								<div class="dropdown-item" id=""><i class="fa fa-trash kt-font-brand"></i>마일스톤 삭제</div>
								<div class="dropdown-divider"></div>
								<div class="dropdown-item" id=""><i class="fas fa-clipboard-list kt-font-brand"></i>마일스톤 상세정보</div>
								<div class="dropdown-divider"></div>
								<div class="dropdown-item" id=""><i class="fas fa-list kt-font-brand"></i>마일스톤 회의록 목록</div>
								<div class="dropdown-divider"></div>
								<div class="dropdown-item" id=""><i class="fas fa-print kt-font-brand"></i>보고서 출력</div>
								
							</div>
						</div>
					</div>
					<!-- end :: dropdown 버튼-->
				</div>	
				
				<div class="kt-portlet__body kt-padding-t-0">
					<div class="row">
						<!-- begin :: 마일스톤 설명 -->
						<div class="kt-padding-l-50 kt-padding-b-15 col-lg-4 col-md-4 col-sm-12 osl-mobile-padding-l-10">
							<div class="kt-padding-b-5">
								<h5>마일스톤 설명</h5>
							</div>
						</div>
						<!-- end :: 마일스톤 설명 -->
						<!-- begin :: 시작일,종료일,진척률 영역 -->
						<div class="col-lg-8 col-md-8 col-sm-12">
							<div class="row">
								<!-- begin :: 시작일,종료일 -->
								<div class="col-lg-6 col-md-6 col-sm-12 osl-mobile-padding-l-10">
									<div class="kt-pull-left kt-margin-r-25">
										<div class="kt-padding-b-5">
											<i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>
											<span>시작일</span>
										</div>
										<h5><span class="badge badge-primary">2018-01-01</span></h5>
									</div>
									<div class="kt-pull-left">
										<div class="kt-padding-b-5">
											<i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>
											<span>종료일</span>
										</div>
										<h5>
											<span class="badge badge-danger">2029-12-31</span>
										</h5>
									</div>
								</div>
								<!-- end :: 시작일,종료일 -->
								<!-- begin :: 진척률 -->
								<div class="col-lg-6 col-md-6 col-sm-12 osl-mobile-padding-l-10">
									<div class="osl-progress">
										<div class="kt-padding-b-5">
											<i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i>
											<span>진척률</span>
										</div>
										<div class="progress osl-prj-group-md">
											<div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100">78%</div>
										</div>
									</div>
								</div>
								<!-- end :: 진척률 -->
							</div>
						</div>
						<!-- begin :: 시작일,종료일,진척률 영역 -->
					</div>
					<!-- end :: 카드  상단 영역 -->
					
					<!-- begin :: 카드  하단 영역 -->	
					<div class="row border-top kt-margin-t-20 kt-padding-t-20">
						<!-- end :: 요구사항 개수 표출 영역 -->
						<div class="col-lg-4 col-md-5 col-sm-12 col-12">
							<div class="osl-widget">
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon">
										<img src="/media/osl/icon/reqAll.png">
									</div>
									<div class="osl-widget-info__item-info">
										<a href="#" class="osl-widget-info__item-title">전체 요구사항</a>											
										<div class="osl-widget-info__item-desc"><span>100</span>건</div>
									</div>
								</div>
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon">
										<img src="/media/osl/icon/reqInProgress.png">
									</div>
									<div class="osl-widget-info__item-info">
										<a href="#" class="osl-widget-info__item-title">진행중 요구사항</a>
										<div class="osl-widget-info__item-desc"><span>50</span>건</div>
									</div>
								</div>
							</div>
							<div class="osl-widget">
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon">
										<img src="/media/osl/icon/reqDone.png">
									</div>
									<div class="osl-widget-info__item-info">
										<a href="#" class="osl-widget-info__item-title">완료 요구사항</a>
										<div class="osl-widget-info__item-desc"><span>50</span>건</div>
									</div>
								</div>
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon">
										<img src="/media/osl/icon/reqDone.png">
									</div>
									<div class="osl-widget-info__item-info">
										<a href="#" class="osl-widget-info__item-title">완료 요구사항</a>
										<div class="osl-widget-info__item-desc"><span>50</span>건</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end :: 요구사항 개수 표출 영역 -->
						<!-- begin :: 차트 영역 -->
						<div class="col-lg-8 col-md-7 col-sm-12 col-12">
							<div class="row kt-padding-r-20 h-100">
								<div class="col-lg-6 col-md-6 col-sm-12 col-12">
									<div class="border kt-margin-r-10 h-100">차트1</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-12 col-12">
									<div class="border kt-margin-l-10 h-100">차트2</div>
								</div>
							</div>
						</div>
						<!-- end :: 차트 영역 -->
					</div>
				</div>
				<!-- end :: 카드 하단 영역 -->
			</div>
			<!-- end :: 카드 -->
		</div>
	</div>
</div>
<!-- end :: 카드형 -->
<!-- begin :: 데이터테이블형 -->
<div class="kt_datatable osl-datatable-footer__divide" id="mis1000Table"></div>
<!-- end :: 데이터테이블형 -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLMis1000Popup = function () {
	var documentSetting = function(){
		var currentViewType = "01";
	
		// begin:: 그룹 요구사항 관리 데이터테이블
		$.osl.datatable.setting("mis1000Table",{
			data: {
				source: {
					read: {
						//경로 삭제 시 오류로 인해 임시로 url 넣었습니다. 제거하시고 url 기제하시면 됩니다.
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: '', title: '마일스톤 이름', textAlign: 'center', width: 300},
				{field: '', title: '마일스톤 설명', textAlign: 'center', width: 150},
				{field: '', title: '시작일', textAlign: 'center', width: 150},
				{field: '', title: '종료일', textAlign: 'center', width: 150},
				{field: '', title: '진척률', textAlign: 'center', width: 150},
				{field: '', title: '전체 요구사항', textAlign: 'center', width: 150},
				{field: '', title: '진행 중 요구사항', textAlign: 'center', width: 150},
				{field: '', title: '완료 요구사항', textAlign: 'center', width: 150},
				{field: '', title: '사용자', textAlign: 'center', width: 100}
			],
			actionBtn:{
				"dblClick": true
			},
			actionTooltip:{
				"update": "수정",
				"delete": "삭제",
				"dblClick": "상세보기"
			},
			actionFn:{
				"insert":function(datatableId){
					var data = {
					};
					var options = {
						modalTitle: "마일스톤 등록",
						modalSize: "xl",
						autoHeight: false
					};
					
					$.osl.layerPopupOpen('/mis/mis1000/mis1000/selectMis1002View.do',data,options);
				},
				"update":function(datatableId){
					var data = {
					};
					var options = {
						modalTitle: "마일스톤 수정",
						modalSize: "xl",
						autoHeight: false
					};
					
					$.osl.layerPopupOpen('/mis/mis1000/mis1000/selectMis1002View.do',data,options);
				},
				"dblClick":function(rowData){
					var data = {
						};
					var options = {
							modalTitle: "마일스톤 상세정보",
							autoHeight: false,
							modalSize: 'xl'
						};
					$.osl.layerPopupOpen('/mis/mis1000/mis1000/selectMis1001View.do',data,options);
				},
				"prjAssign":function(rowData){
					var data = {
					};
				var options = {
						modalTitle: "마일스톤 프로세스 배정",
						autoHeight: false,
						modalSize: 'xl'
					};
					$.osl.layerPopupOpen('/mis/mis1000/mis1000/selectMis1003View.do',data,options);
				}
			},
			callback:{
				initComplete: function(evt,config){
					fnViewerChange();
				}
			}
		});
		// end:: 그룹 요구사항 관리 데이터테이블
		
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
				$("#mis1000Table .kt-datatable__table").css({visibility: "hidden", height: 0});
				$("#mis1000CardTable").show();
			//데이터테이블 형식
			}else{	
				$("#mis1000CardTable").hide();
				$("#mis1000Table .kt-datatable__table").css({visibility: "visible",height: "auto"});
			}
		}
		var prjGrpStr = '';
			

		
	};
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLMis1000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
