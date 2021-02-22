<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm9102">
	<input type="hidden" name="paramJenId" id="paramJenId" value="${param.paramJenId}">
	<!-- begin:: job 상세 정보 -->
	<div class="kt-portlet">
		<div class="kt-portlet__body kt-portlet__body kt-padding-t-15 kt-padding-l-15 kt-padding-r-15 kt-pb-0">
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9102.label.jenkinsNm">JENKINS</span></label>
								<input type="text" class="form-control" placeholder="JENKINS" name="jenNm" id="jenNm" readonly="readonly" value="<c:out value='${jobInfo.jenNm}'/>" >
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9102.label.jobId">JOB ID</span></label>
								<input type="text" class="form-control" placeholder="JOB ID" name="jobId" id="jobId" readonly="readonly" value="<c:out value='${param.paramJobId}'/>" >
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobRestoreId">원복 JOB ID</span></label>
								<input type="text" class="form-control" placeholder=" -" name="jobRestoreId" id="jobRestoreId" readonly="readonly" value="<c:out value='${jobInfo.jobRestoreId}'/>" >
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobParameter">JOB 매개변수</span></label>
								<input type="text" class="form-control" placeholder=" -" name="jobParameter" id="jobParameter" readonly="readonly" value="<c:out value='${jobInfo.jobParameter}'/>">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobTypeCd">JOB TYPE</span></label>
								<input type="text" class="form-control" placeholder="JOB TYPE" name="jobTypeNm" id="jobTypeNm" readonly="readonly" value="<c:out value='${jobInfo.jobTypeNm}'/>" >
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobUseCd">사용 유무</span></label>
								<input type="text" class="form-control" placeholder="사용 유무" name="useNm" id="useNm" readonly="readonly" value="<c:out value='${jobInfo.useNm}'/>" >
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobDesc">JOB 설명</span></label>
						<textarea class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="jobDesc" id="jobDesc" readonly="readonly"><c:out value="${jobInfo.jobDesc}"/></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end:: job 상세정보  -->
	<!-- begin:: job 빌드 이력  -->
	<div class="row">
		<!-- begin:: job 빌드 이력 데이터 테이블 -->
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm9102.label.leftTitle">JOB 빌드 목록</span>
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9102JobBuildTable" data-datatable-action="select" title="빌드 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px--415 kt-padding-10">
					<div class="osl-datatable-search" data-datatable-id="stm9102JobBuildTable"></div>
					<div class="kt_datatable" id="stm9102JobBuildTable"></div>
				</div>
			</div>
		</div>
		<!-- end:: job 빌드 이력 데이터 테이블 -->
		<!-- begin:: 빌드 콘솔 로그 -->
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm9102.label.rightTitle">콘솔 로그</span>
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air"  title="FULL SCREEN" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" >
								<i class="fas fa-expand kt-padding-r-0"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px-imp--415 kt-padding-l-5 kt-padding-r-5 kt-pb-0 kt-pt0 osl-contents-frame osl-code-bg" >
					<pre>
						<code class="osl-code-bg" id="jobBuildConsoleLog">
						</code>
					</pre>
				</div>
			</div>
		</div>
		<!-- end:: 빌드 콘솔 로그 -->
	</div>
	<!-- end:: job 빌드 이력  -->
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>

<script>
"use strict";
var OSLStm9102Popup = function () {
	
	var formId = 'frStm9102';
	
	// 데이터테이블에서 넘어온 jenId, jobId
	var paramJenId = $("#paramJenId").val();
	var paramJobId = $("#jobId").val();
	
	// 버튼 문구 세팅
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
    // Private functions
    var documentSetting = function () {
		
    	// begin::JOB 빌드이력 데이터 테이블
		$.osl.datatable.setting("stm9102JobBuildTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm9000/stm9100/selectStm9100JobBuildListAjax.do",
						params : {
							jenId : paramJenId,
							jobId : paramJobId
						}
					}
				},
				pageSize: 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				{field: 'bldNum', title: "빌드 번호", textAlign: 'center', width: 70, sortable: true, sortField: "bldNum", autoHide: false, search: true},
				{field: 'bldResult', title: "빌드 상태", textAlign: 'center', width: 80, sortable: true, sortField: "bldResult", autoHide: false, search: true},
				{field: 'bldStartDtm', title: "빌드 시작 시간", textAlign: 'center', width: 130, sortable: true, sortable: true, sortField: "bldStartDtm", search: true, searchType:"daterange"
					,template: function(row){
						var bldStartDtm = row.bldStartDtm;
						return new Date(bldStartDtm).format("yyyy-MM-dd HH:mm:ss", true);
					}
				},
				{field: 'bldDurationTm', title: "소요 시간", textAlign: 'center', width: 70
					,template: function(row){
						var bldDurationTm = row.bldDurationTm;

						// 빌드 소요시간 - 분
						var tmpMin = (bldDurationTm/1000);
						var bldDurationMm = Math.round(tmpMin/60);
						// 빌드 소요시간 초
						var bldDurationSs = Math.round(((bldDurationTm/1000)%60));
						
						var durationStr = bldDurationSs + $.osl.lang("stm9102.label.second");
						if(bldDurationMm > 0){
							durationStr = bldDurationMm + $.osl.lang("stm9102.label.minute") + bldDurationSs + $.osl.lang("stm9102.label.second");
						}
						return durationStr;
					}
				},
				{field: 'regUsrNm', title: "배포자", textAlign: 'center', width: 110, sortable: true, sortField: "regUsrNm", search: true
					,template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.regUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.regUsrId);
					}	
				}
			],
			actionBtn:{
				"title": "",
				"click":true,
				"insert":false,
				"update":false,
				"delete":false,
				"lastPush": false
			},
			actionTooltip:{
			},
			actionFn:{
				// 빌드 콘솔 내용 조회
				"click":function(rowData, datatableId, type, rowNum, elem){
					// 콘솔 로그 조회
					fnSelectBldConsoleLogInfo(rowData);
				}
			},
			theme: {
				 actionBtnIcon:{
					 "click": " kt-hide" // action 클릭 아이콘 숨기기
				 }
			},
			callback:{
				ajaxDone: function(evt, list){
					// 데이터 로드 후 콘솔 로그 출력부분 초기화
					$("#jobBuildConsoleLog").html("<span class='kt-font-inverse-brand kt-padding-l-10 osl-font-lg osl-font'>"+$.osl.lang("stm9102.message.selectBuildInfo")+"</span>");
				}
			}
		});
    	// end::JOB 빌드이력 데이터 테이블 
    	
    };

     // 빌드 단건의 콘솔 로그 조회
	var fnSelectBldConsoleLogInfo = function(rowData) {
    	
    	 var prjId = rowData.prjId;
    	 var dplId = rowData.dplId;
    	 var jenId = rowData.jenId;
    	 var jobId = rowData.jobId;
    	 var bldSeq = rowData.bldSeq;
    	 
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl1000/dpl1000/selectDpl1400DplSelBuildConsoleLogAjax.do'/>","loadingShow":false}
				,{prjId:prjId, dplId: dplId, jenId: jenId, jobId: jobId, bldSeq: bldSeq});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			// 조회 에러 시
			if(data.errorYn == "Y"){
				// 콘솔로그 표시 부분에 에러 메시지 표시
				$("#jobBuildConsoleLog").html(data.message);
			}else{
				// 빌드 상세정보
				var buildInfo = data.dpl1400InfoMap;
				
				// 조회한 콘솔 로그를 표시
				// 로그가 없을 경우
				if($.osl.isNull(buildInfo) || $.osl.isNull(buildInfo.bldConsoleLog)){
					$("#jobBuildConsoleLog").html("<span class='kt-font-inverse-brand  kt-padding-l-10 osl-font-lg osl-font'>"+$.osl.lang("stm9102.message.notConsoleLog")+"</span>");
					return false;
				}
				
				//콘솔로그 출력
				$("#jobBuildConsoleLog").html(buildInfo.bldConsoleLog);
				$('#jobBuildConsoleLog').each(function(i, block) {hljs.highlightBlock(block);});
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

//Initialization
$.osl.ready(function(){
	OSLStm9102Popup.init();
});

	
</script>