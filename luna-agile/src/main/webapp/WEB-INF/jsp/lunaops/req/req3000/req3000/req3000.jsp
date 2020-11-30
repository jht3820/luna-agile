<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<!-- begin page DOM -->
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type active" title="데이터 카드 형식으로 보기" data-title-lang-cd="req3000.button.title.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="01">
						<i class="fa fa-table osl-padding-r0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="데이터 테이블 형식으로 보기" data-title-lang-cd="req3000.button.title.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="7" data-view-type="02">
						<i class="fa fa-list osl-padding-r0"></i>
					</button>
				</div>
			</div>
		</div>
		
	</div>
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block ">
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="req3000PrjTable"><div class="input-group"><div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button><div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="req3000PrjTable"><a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a><a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a><a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a><a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a></div></div><select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_req3000PrjTable" name="searchSelect" aria-hidden="true" data-datatable-id="req3000PrjTable" style="display: none;"></select><div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="req3000PrjTable"><input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_req3000PrjTable" id="searchData_req3000PrjTable" data-datatable-id="req3000PrjTable"><span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span><input type="hidden" name="searchStartDt" id="searchStartDt_req3000PrjTable" data-datatable-id="req3000PrjTable"><input type="hidden" name="searchEndDt" id="searchEndDt_req3000PrjTable" data-datatable-id="req3000PrjTable"></div><div class="input-group-append"><button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="req3000PrjTable"><i class="fa fa-search"></i><span class=""><span>검색</span></span></button></div></div></div>
		</div>
		<div class="col-lg-9 col-md-12 col-sm-12 text-right osl-mobile-text--left kt-padding-r-0">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="select" title="그룹 요구사항 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
				<i class="fa fa-list"></i><span>조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="insert" title="그룹 요구사항 목록 추가" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="6">
				<i class="fa fa-plus"></i><span>추가</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="update" title="그룹 요구사항 목록 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="7">
				<i class="fa fa-edit"></i><span>수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="delete" title="그룹 요구사항 목록 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8">
				<i class="fa fa-trash-alt"></i><span>삭제</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="assign" title="그룹 요구사항 목록 엑셀" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="excel" tabindex="">
				<i class="fas fa-file-excel"></i><span>엑셀</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="assign" title="그룹 요구사항 목록 프린트" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="print" tabindex="">
				<i class="fas fa-print"></i><span>프린트</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="assign" title="그룹 요구사항 목록 양식 다운로드" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="form-download" tabindex="">
				<i class="fas fa-file-download"></i><span>양식 다운로드</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="assign" title="그룹 요구사항 목록 업로드" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="upload" tabindex="">
				<i class="fas fa-file-upload"></i><span>업로드</span>
			</button>
		</div>
	</div>
</div>
<div id="req3000CardTable">
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet kt-portlet--mobile border">
				<div class="kt-portlet__head kt-portlet__head--lg border-bottom-0">
					<div class="kt-portlet__head-label">
						<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid">
							<input type="checkbox" value="'+idx+'" name="prjGrpCheckbox" id="prjGrpCheckbox_'+map.prjId+'" data-datatable-id="req3000PrjTable">&nbsp;<span></span>
						</label>
						<div class="row osl-flex-flow--column">
							<h4 class="kt-font-boldest osl-min-h-px--50 kt-padding-t-25 kt-padding-l-10"><span>그룹 요구사항 명</span></h4>
							<h5 class="kt-padding-l-10"><span class="badge badge-dark">그룹 요구사항 번호</span></h5>
						</div>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="dropdown dropdown-inline">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-ellipsis-h kt-padding-0"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-right">
								<div class="dropdown-item" id=""><i class="fa fa-edit kt-font-brand"></i>수정</div>
								<div class="dropdown-item" id=""><i class="fa fa-trash kt-font-brand"></i>삭제</div>
								<div class="dropdown-item" id=""><i class="fas fa-file-excel kt-font-brand"></i>엑셀</div>
								<div class="dropdown-item" id=""><i class="fas fa-print kt-font-brand"></i>프린트</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="kt-portlet__body">
					<div class="row">
						<div class="kt-padding-l-40 kt-padding-b-15 col-lg-4 col-md-4 col-sm-12 osl-mobile-padding-l-10">
							<div class="kt-padding-b-5">
								<i class="fas fa-paperclip kt-margin-r-5 kt-font-brand"></i>
								<span>연결 요구사항 수</span>
							</div>
							<h5 class="kt-padding-l-20">
								<span class="text-muted">2</span>
							</h5>
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12">
							<div class="row">
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
							</div>
						</div>
					</div>
					<div class="row border-top kt-margin-t-20 kt-padding-t-20">
						<div class="col-lg-7 col-md-7 col-sm-7 col-7">
							<div class="kt-user-card-v2 btn osl-flex-flow--column align-items-start kt-padding-l-30 osl-mobile-padding-l-0">
								<div class="row kt-margin-l-0">
									<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">
										<img src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000088" class="">
									</div>
									<div class="kt-user-card-v2__details">
										<span class="kt-user-card-v2__name">홍길동</span>
										
									</div>
									<div class="kt-margin-l-10">
										<span>(직급 / 직책)</span>
									</div>
								</div>
								<div class="row kt-margin-l-35 kt-margin-t-10">
									<span class="">소속</span>
								</div>	
							</div>
						</div>
						<div class="col-lg-5 col-md-5 col-sm-5 col-5 d-flex osl-flex-flow--column">
							<p class="text-right" id="">이메일</p>
							<p class="text-right kt-margin-t-10" id="">등록일시</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet kt-portlet--mobile border">
				<div class="kt-portlet__head kt-portlet__head--lg border-bottom-0">
					<div class="kt-portlet__head-label">
						<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid">
							<input type="checkbox" value="'+idx+'" name="prjGrpCheckbox" id="prjGrpCheckbox_'+map.prjId+'" data-datatable-id="req3000PrjTable">&nbsp;<span></span>
						</label>
						<div class="row osl-flex-flow--column">
							<h4 class="kt-font-boldest osl-min-h-px--50 kt-padding-t-25 kt-padding-l-10"><span>인사공통코드관리</span></h4>
							<h5 class="kt-padding-l-10"><span class="badge badge-dark">FNR-0001</span></h5>
						</div>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="dropdown dropdown-inline">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-ellipsis-h kt-padding-0"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-right">
								<div class="dropdown-item" id=""><i class="fa fa-edit kt-font-brand"></i>수정</div>
								<div class="dropdown-item" id=""><i class="fa fa-trash kt-font-brand"></i>삭제</div>
								<div class="dropdown-item" id=""><i class="fas fa-file-excel kt-font-brand"></i>엑셀</div>
								<div class="dropdown-item" id=""><i class="fas fa-print kt-font-brand"></i>프린트</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="kt-portlet__body">
					<div class="row">
						<div class="kt-padding-l-40 kt-padding-b-15 col-lg-4 col-md-4 col-sm-12 osl-mobile-padding-l-10">
							<div class="kt-padding-b-5">
								<i class="fas fa-paperclip kt-margin-r-5 kt-font-brand"></i>
								<span>연결 요구사항 수</span>
							</div>
							<h5 class="kt-padding-l-20">
								<span class="text-muted">2</span>
							</h5>
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12">
							<div class="row">
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
							</div>
						</div>
					</div>
					<div class="row border-top kt-margin-t-20 kt-padding-t-20">
						<div class="col-lg-7 col-md-7 col-sm-7 col-7">
							<div class="kt-user-card-v2 btn osl-flex-flow--column align-items-start kt-padding-l-30 osl-mobile-padding-l-0">
								<div class="row kt-margin-l-0">
									<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">
										<img src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000088" class="">
									</div>
									<div class="kt-user-card-v2__details">
										<span class="kt-user-card-v2__name">정형택</span>
										
									</div>
									<div class="kt-margin-l-10">
										<span>(사장)</span>
									</div>
								</div>
								<div class="row kt-margin-l-35 kt-margin-t-10">
									<span class="">오픈소프트랩</span>
								</div>	
							</div>
						</div>
						<div class="col-lg-5 col-md-5 col-sm-5 col-5 d-flex osl-flex-flow--column">
							<p class="text-right" id="">jht1215@opensoftlab.kr</p>
							<p class="text-right kt-margin-t-10" id="">2020-02-10 11:23:45</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="kt_datatable osl-datatable-footer__divide" id="req3000Table"></div>
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLReq3000Popup = function () {
	var currentViewType = "01";
	
	var documentSetting = function(){
		// begin:: 그룹 요구사항 관리 데이터테이블
		$.osl.datatable.setting("req3000Table",{
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
				{field: '', title: '그룹 요구사항 명', textAlign: 'center', width: 300},
				{field: '', title: '그룹 요구사항 번호', textAlign: 'center', width: 150},
				{field: '', title: '연결 요구사항 수', textAlign: 'center', width: 150},
				{field: '', title: '시작일', textAlign: 'center', width: 150},
				{field: '', title: '종료일', textAlign: 'center', width: 150},
				{field: '', title: '진척률', textAlign: 'center', width: 150},
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
						modalTitle: "그룹 요구사항 등록",
						modalSize: "xl",
						autoHeight: false
					};
					
					$.osl.layerPopupOpen('/req/req3000/req3000/selectReq3001View.do',data,options);
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
				$("#req3000Table .kt-datatable__table").css({visibility: "hidden", height: 0});
				$("#req3000CardTable").show();
			//데이터테이블 형식
			}else{	
				$("#req3000CardTable").hide();
				$("#req3000Table .kt-datatable__table").css({visibility: "visible",height: "auto"});
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
	OSLReq3000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
