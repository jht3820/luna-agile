<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1003">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>프로젝트 그룹 정보
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-15">
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required" for="prjNm"><i class="fa fa-edit kt-margin-r-5"></i><span>프로젝트 그룹명</span></label>
								<input type="text" class="form-control" placeholder="프로젝트 그룹명" name="prjNm" id="prjNm" opttype="-1" readonly="readonly" required>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required" for="prjGrpRange"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>프로젝트 그룹 기간</span></label>
								<input type="text" class="form-control" placeholder="프로젝트 그룹 기간" name="prjGrpRange" id="prjGrpRange" readonly="readonly" required>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
								<select class="form-control kt-select2" id="useCd" name="useCd" readonly="readonly" opttype="-1" disabled>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required" for="ord"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>정렬 순서</span></label>
								<input type="number" class="form-control" placeholder="정렬 순서" name="ord" id="ord" value="1" opttype="-1" min="0" max="999" readonly="readonly" required>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span>프로젝트 그룹 설명</span></label>
								<textarea class="form-control osl-min-h-px--140 osl-textarea__resize--none" name="prjDesc" id="prjDesc" opttype="-1" readonly="readonly" ></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>담당자 목록
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1003PrjAuthUsrTable" data-datatable-action="select" title="사용자 배정 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px--400 kt-padding-10">
					<div class="osl-datatable-search" data-datatable-id="prj1003PrjAuthUsrTable"></div>
					<div class="kt_datatable" id="prj1003PrjAuthUsrTable"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="kt-portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>권한있는 프로젝트 목록 ( <span id="prjAuthListCnt"></span> / <span id="prjChildListCnt"></span> )
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1003PrjAuthUsrTable" data-datatable-action="select" title="사용자 배정 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-10">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="osl-datatable-search" data-datatable-id="prj1003PrjTable"></div>
						</div>
					</div>
					<div class="kt_datatable" id="prj1003PrjTable"></div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLPrj1003Popup = function () {
	var formId = 'frPrj1003';
	
	//배정 담당자 중복 체크
	var prjAuthUsrIdList = [];
	
	//수정시 배정담당자 원본 데이터
	var prjAuthOriginalData = [];
	
	//수정인경우 대상 프로젝트ID
	var paramPrjId = $("#paramPrjId").val();
	
    // Private functions
    var documentSetting = function () {
    	// 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} // 사용유무
		];
		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
		//그룹 정보 조회
		fnPrjGrpInfoSelect();
		
		//데이터 테이블 세팅
    	datatableSetting();
    };
    
    //담당자 배정, 배정 프로젝트 목록
    var datatableSetting = function(){
    	//사용자 배정 정보 datatable 세팅
		$.osl.datatable.setting("prj1003PrjAuthUsrTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1000/selectPrj1000PrjAuthUsrListAjax.do",
						params: {
							"paramPrjId": paramPrjId
						}
					}
				},
				pageSize: 4,
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 150, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true},
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
			],
			actionBtn:{
				"update": false,
				"delete": false,
			},
			actionTooltip:{
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
			},
		});
    	
		//데이터 테이블 세팅
		$.osl.datatable.setting("prj1003PrjTable", {
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1000/selectPrj1001ListAjaxView.do",
						params:{
							paramPrjGrpId: paramPrjId
						}
					}
				},
				pageSize: 4,
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false},
				{field: 'prjNm', title: '프로젝트 명', textAlign: 'left', width: 200, search: true},
				{field: 'startDt', title: '시작 일자', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'endDt', title: '종료 일자', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'reqAllCnt', title: '전체 요구사항 수', textAlign: 'center', width: 100
					,template: function (row) {return String(row.reqAllCnt)}},
				{field: 'reqInProgressCnt', title: '진행중 요구사항', textAlign: 'center', width: 100
					,template: function (row) {return String(row.reqInProgressCnt)}},
				{field: 'reqDoneCnt', title: '완료 요구사항', textAlign: 'center', width: 100
					,template: function (row) {return String(row.reqDoneCnt)}},
			],
			actionBtn:{
				"update": false,
				"delete": false,
			},
			callback:{
				ajaxDone: function(evt, list,datatableInfo){
					//총 개수
					$("#prjAuthListCnt").text(datatableInfo.lastResponse.meta.total);
				}
			}
		});
	};
	
	//프로젝트 그룹 정보 조회
	var fnPrjGrpInfoSelect = function(){
		//프로젝트 그룹 정보 조회
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1000/selectPrj1000PrjGrpInfoAjax.do'/>"}
				,{prjId: paramPrjId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var prjInfo = data.prjInfo;
   				
   				$.osl.setDataFormElem(prjInfo, formId, ["prjNm","useCd","ord","prjDesc","startDt","endDt"]);
   				
   				//시작일 - 종료일 입력
   				$("#prjGrpRange").val(prjInfo.startDt+" ~ "+prjInfo.endDt);
   				
   				//프로젝트 전체 배정 개수
   				$("#prjChildListCnt").text(prjInfo.prjChildCnt);
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

// Initialization
$.osl.ready(function(){
	OSLPrj1003Popup.init();
});

	
</script>