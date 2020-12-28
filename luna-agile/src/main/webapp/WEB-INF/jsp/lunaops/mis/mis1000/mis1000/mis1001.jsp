<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<!-- begin :: form -->
<form class="kt-form" id="mis1001">
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__body">
			<!-- begin :: 내용 영역 -->
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>마일스톤 명</label>
						<input type="text" class="form-control" id="" name="" value="마일스톤 이름" required>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>등록자</label> 
						<input type="text" class="form-control" id="" name="" value="관리자" required>
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>마일스톤 설명</label> 
						<textarea id="misDesc" name="misDesc" value="마일스톤 설명" required></textarea>
					</div>
				</div>
				<!-- begin :: 스프린트 차트 -->
				<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
					<div class="border osl-min-h-px--140">차트 1</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
					<div class="border osl-min-h-px--140">차트 2</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
					<div class="border osl-min-h-px--140">차트 3</div>
				</div>
				<!-- end :: 스프린트 차트 -->
			</div>			
			<!-- end :: 내용 영역 -->
		</div>
	</div>
	
	<!-- begin :: 스프린트 데이터테이블 전체영역-->
	<div class="kt-portlet kt-portlet--mobile kt-margin-t-20-tablet kt-margin-t-20-mobile">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<h5 class="kt-font-boldest kt-font-brand">
					<i class="fa fa-th-large kt-margin-r-5"></i>요구사항 배정 목록
				</h5>
			</div>
			<!-- begin :: 스프린트 데이터테이블 조회버튼 -->
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-wrapper">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm float-right btn-elevate btn-elevate-air" data-datatable-id="misDetailTable" data-datatable-action="select" title="스프린트 상세정보 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
						<i class="fa fa-list"></i><span>조회</span>
					</button>
				</div>
			</div>
			<!-- end :: 스프린트 데이터테이블 조회버튼 -->
		</div>
		<div class="kt-portlet__body">
			<div class="row">
				<!-- begin :: 스프린트 데이터테이블 검색영역 -->
				<div class="col-5">
					<div class="input-group">
						<div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
							<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="misAssignProcessTable">
								<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
								<a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a>
								<a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a>
								<a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a>
							</div>
						</div>
						<!-- <select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_misAssignProcessTable" name="searchSelect" aria-hidden="true" data-datatable-id="misAssignProcessTable" style="display: none;"></select> -->
						<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="misAssignProcessTable">
							<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_misAssignProcessTable" id="searchData_misAssignProcessTable" data-datatable-id="misAssignProcessTable">
							<!-- <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
							<input type="hidden" name="searchStartDt" id="searchStartDt_misAssignProcessTable" data-datatable-id="misAssignProcessTable">
							<input type="hidden" name="searchEndDt" id="searchEndDt_misAssignProcessTable" data-datatable-id="misAssignProcessTable"> -->
						</div>
						<div class="input-group-append">
							<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="misAssignProcessTable">
								<i class="fa fa-search"></i><span class=""><span>검색</span></span>
							</button>
						</div>
					</div>
				</div>
				<!-- end :: 스프린트 데이터테이블 검색영역 -->

				<!-- begin :: 스프린트 데이터테이블  -->
				<div class="col-12">
					<div class="kt_datatable kt-margin-b-0" id="misDetailTable"></div>
				</div>
				<!-- end :: 스프린트 데이터테이블 -->
			</div>
		</div>
	</div>
	<!-- end :: 스프린트 데이터테이블 전체영역 -->
	<!-- begin :: 배정 산출물 목록 트리 -->
	<div class="row">
		<!-- begin :: 배정 산출물 목록 트리 -->
		<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="mis1001ListTreePortlet">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>배정 산출물 목록
						</h5>
					</div>
					<!-- begin :: 배정 산출물 목록 트리 조회버튼 -->
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-tree-id="mis1001ListTree" data-tree-action="allNodeOpen"><i class="fa fa-plus"></i></a>
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-tree-id="mis1001ListTree" data-tree-action="allNodeClose"><i class="fa fa-minus"></i></a>
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm float-right btn-elevate btn-elevate-air kt-margin-l-10" data-datatable-id="" data-datatable-action="select" title="배정 산출물 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
					</div>
					<!-- end :: 배정 산출물 목록 트리 조회버튼 -->
				</div>
				<div class="kt-portlet__body kt-scroll" id="mis1001ListTreePortletBody">
					<div class="osl-tree" id="mis1001ListTree"></div>
				</div>
			</div>
		</div>
		<!-- end :: 배정 산출물 목록 트리 -->
		<!-- begin :: 배정 산출물 목록 -->
		<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 kt-scroll">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>산출물 목록
						</h5>
					</div>
					<!-- begin :: 배정 산출물 목록 조회버튼 -->
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm float-right btn-elevate btn-elevate-air" data-datatable-id="" data-datatable-action="" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="" data-auth-button="select" tabindex="5">
								<i class="fas fa-file-download"></i><span>전체 다운로드</span>
							</button>
						</div>
					</div>
					<!-- end :: 배정 산출물 목록 조회버튼 -->
				</div>
				<div class="kt-portlet__body kt-padding-0" id="mis1001ListFilePortletBody">
					<!-- begin :: 산출물 파일 -->
					<div class="osl-uppy-file osl-uppy-file--fullsize">
						<div class="osl-uppy-file-sumnail osl-uppy-file-bg">
							<div class="osl-uppy-file-sumnail-bg"></div>
							<span class="osl-uppy-iconFile">
								<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">
									<g fill="#A7AFB7" fill-rule="nonzero">
										<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path>
										<path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>
									</g>
								</svg>
							</span>
						</div>
						<div class="osl-uppy-file-info-group">
							<div class="osl-uppy-file-name" title="iconFile">iconFile</div>
							<div class="osl-uppy-file-volume">120 KB</div>
						</div>
					</div>
					<div class="osl-uppy-file osl-uppy-file--fullsize">
						<div class="osl-uppy-file-sumnail osl-uppy-file-bg">
							<div class="osl-uppy-file-sumnail-bg"></div>
							<span class="osl-uppy-iconFile">
								<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">
									<g fill="#A7AFB7" fill-rule="nonzero">
										<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path>
										<path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>
									</g>
								</svg>
							</span>
						</div>
						<div class="osl-uppy-file-info-group">
							<div class="osl-uppy-file-name" title="iconFile">iconFile</div>
							<div class="osl-uppy-file-volume">120 KB</div>
						</div>
					</div>
					<div class="osl-uppy-file osl-uppy-file--fullsize">
						<div class="osl-uppy-file-sumnail osl-uppy-file-bg">
							<div class="osl-uppy-file-sumnail-bg"></div>
							<span class="osl-uppy-iconFile">
								<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">
									<g fill="#A7AFB7" fill-rule="nonzero">
										<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path>
										<path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>
									</g>
								</svg>
							</span>
						</div>
						<div class="osl-uppy-file-info-group">
							<div class="osl-uppy-file-name" title="iconFile">iconFile</div>
							<div class="osl-uppy-file-volume">120 KB</div>
						</div>
					</div>
					<div class="osl-uppy-file osl-uppy-file--fullsize">
						<div class="osl-uppy-file-sumnail osl-uppy-file-bg">
							<div class="osl-uppy-file-sumnail-bg"></div>
							<span class="osl-uppy-iconFile">
								<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">
									<g fill="#A7AFB7" fill-rule="nonzero">
										<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path>
										<path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>
									</g>
								</svg>
							</span>
						</div>
						<div class="osl-uppy-file-info-group">
							<div class="osl-uppy-file-name" title="iconFile">iconFile</div>
							<div class="osl-uppy-file-volume">120 KB</div>
						</div>
					</div>
					<div class="osl-uppy-file osl-uppy-file--fullsize">
						<div class="osl-uppy-file-sumnail osl-uppy-file-bg">
							<div class="osl-uppy-file-sumnail-bg"></div>
							<span class="osl-uppy-iconFile">
								<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">
									<g fill="#A7AFB7" fill-rule="nonzero">
										<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path>
										<path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>
									</g>
								</svg>
							</span>
						</div>
						<div class="osl-uppy-file-info-group">
							<div class="osl-uppy-file-name" title="iconFile">iconFile</div>
							<div class="osl-uppy-file-volume">120 KB</div>
						</div>
					</div>
					<!-- end :: 산출물 파일 -->
				</div>
			</div>
		</div>
		<!-- end :: 배정 산출물 목록 -->
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
var OSLMis1001Popup = function () {
	var documentSetting = function(){

		var formId = 'frMis1001';
		
		//edit 목록
		var formEditList = [];
		
		//form validate 주입
		var formValidate = $.osl.validate(formId);
		
		//edit 세팅
    	formEditList.push($.osl.editorSetting("misDesc", {
    		toolbar: false,
			disableResizeEditor: false,
			disableDragAndDrop: true,
			disabledEditor: true,
			height:180,
		}));
		
		// begin:: 스프린트 상세정보 데이터테이블 
		$.osl.datatable.setting("misDetailTable",{
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
				{field: '', title: '프로젝트 명', textAlign: 'center', width: 150},
				{field: '', title: '순번', textAlign: 'center', width: 70},
				{field: '', title: '요청제목', textAlign: 'center', width: 100},
				{field: '', title: '처리 결과', textAlign: 'center', width: 100},
				{field: '', title: '등록일', textAlign: 'center', width: 70}
			]
		});
		// end:: 스프린트 상세정보 데이터테이블 
		
		
		/*스크롤 세팅*/
		//조직 트리 스크롤 세팅
		ktScrollInit("#mis1001ListTreePortletBody", "350");
		//확정 파일 스크롤 세팅
		ktScrollInit("#mis1001ListfilePortletBody", "350");
		
		//배정 산출물 목록 트리 포틀렛 세팅
		new KTPortlet('mis1001ListTreePortlet', $.osl.lang("portlet"));
		// begin:: 조직 tree 세팅
		var treeObj = $.osl.tree.setting("mis1001ListTree",{
			data:{
				url:"<c:url value='/stm/stm2000/stm2000/selectStm2000MenuListAjax.do'/>",
				key: "menuId",
				pKey: "upperMenuId",
				labelKey: "menuNm"
			},
			search:{
				//대소문자 구분
				case_insensitive : true,
				//검색 결과 노드만 표시
				show_only_matches: true,
				//show_only_matches: true 일때 하위 노드도 같이 표시 할건지
				show_only_matches_children: true,
			},
			callback:{
				onclick: function(treeObj,selNode){
					// 메뉴 단건 조회
					selectMenuInfo(selNode.original.menuId);
				},
				init: function(treeObj,data){
					//console.log(treeObj,data);
				}
			}
		});
		// end:: 조직 tree 세팅
	};
	
	/*
	 * function명 : ktScrollInit
	 * function설명 : 스크롤 세팅 및 반응형 될 때 세로크기값을 계산해준다
	 * @param targetName : 스크롤 세팅할 대상 class, id
	 * @param targetHeight : 스크롤의 세로 사이즈
	 */
	function ktScrollInit (targetName, targetHeight) {
		KTUtil.scrollInit($(targetName)[0], {
	   		//모바일 스크롤 바 마우스 제어 비활성화
	         disableForMobile: true, 
	         //반응형 시 스크롤 유지 여부
	         resetHeightOnDestroy: true, 
	         //브라우저 창의 크기를 조정할 때 크기를 자동으로 조절 여부
	         handleWindowResize: true, 
	         //세로 사이즈
	         height: targetHeight
	    });
	}
	
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLMis1001Popup.init();
});
</script>
<!-- end script -->
