<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
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
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="배포 실행 권한 설정" data-title-lang-cd="stm9200.button.dplAuthSetting" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5" id="stm9200DplAuthSetting">
						<i class="fa fa-chevron-circle-right"></i><span data-lang-cd="stm9200.button.dplAuthSetting">배포 실행 권한 설정</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<!-- begin:: 프로젝트 목록 트리 영역 -->
	<div class="col-lg-4 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm9200.title.allPrjList">전체 프로젝트 목록</span>
					</h4>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-title-lang-cd="tree.label.contextmenu.allNodeOpen" data-tree-id="stm9200LicPrjTree" data-tree-action="allNodeOpen">
							<i class="fa fa-plus"></i>
						</a>
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-title-lang-cd="tree.label.contextmenu.allNodeClose" data-tree-id="stm9200LicPrjTree" data-tree-action="allNodeClose">
							<i class="fa fa-minus"></i>
						</a>
						<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md">
							<i class="la la-angle-down"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="osl-tree-search" data-tree-id="stm9200LicPrjTree"></div>
					</div>
				</div>
				<div class="kt-separator kt-separator--space-sm kt-separator--border-solid"></div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="osl-tree kt-scroll" data-height="566" id="stm9200LicPrjTree"></div>
					</div>
				</div>
			</div>
		</div>
	</div> 
	<!-- end:: 프로젝트 목록 트리 영역 -->
	
	<!-- begin::우측 배정/미배정 job 목록 영역 -->
	<div class="col-lg-8 col-md-12 col-sm-12 col-12">
		<!-- begin:: 배정 job 목록-->
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm9200.title.assignJobList">JOB 배정 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="stm9200AssignJobTable"></div>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9200AssignJobTable" data-datatable-action="select" title="JOB 배정 목록 조회" data-title-lang-cd="stm9200.toolTip.searchAssignJob" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9200AssignJobTable" data-datatable-action="removeJob" title="JOB 배정 제외" data-title-lang-cd="stm9200.toolTip.jobDelete" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="removeJob" tabindex="2">
							<i class="fa fa-arrow-alt-circle-down"></i><span data-lang-cd="stm9200.common.notAssign">제외</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portelt__body osl-min-h-px--300">
				<div class="kt_datatable" id="stm9200AssignJobTable"></div>
			</div>
		</div>
		<!-- end:: 배정 job 목록-->
		<!-- begin:: 미배정 job 목록-->
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm9200.title.notAssignJobList">JOB 미배정 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="stm9200NotAssignJobTable"></div>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9200NotAssignJobTable" data-datatable-action="select" title="JOB 미배정 목록 조회" data-title-lang-cd="stm9200.toolTip.searchNotAssignJob" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="3">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9200NotAssignJobTable" data-datatable-action="addJob" title="JOB 배정" data-title-lang-cd="stm9200.toolTip.jobAssign" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="4">
							<i class="fa fa-arrow-alt-circle-up"></i><span data-lang-cd="stm9200.common.assign">배정</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portelt__body osl-min-h-px--300">
				<div class="kt_datatable" id="stm9200NotAssignJobTable"></div>
			</div>
		</div>
		<!-- begin:: 미배정 job 목록-->
	</div> 
	<!-- end::우측 배정/미배정 job 목록 영역 -->
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm9200 = function () {
	
	// job 배정 목록 테이블
	var assignJobDatatableId = "stm9200AssignJobTable";
	//job 미배정 목록 테이블
	var notAssignJobDatatableId = "stm9200NotAssignJobTable";
	
	// 프로젝트 트리
	var prjTreeObj;
	
	//현재 선택 프로젝트 Id
	var selPrjId;
	// 현재 선택 프로젝트의 그룹 Id
	var selPrjGrpId;
	
	var documentSetting = function(){
		
		// 프로젝트 tree 세팅
		prjTreeObj = $.osl.tree.setting("stm9200LicPrjTree",{
			data:{
				url:"<c:url value='/stm/stm1000/stm1000/selectStm1000LicencePrjAllListAjax.do'/>",
				key: "prjId",
				pKey: "prjGrpId",
				labelKey: "prjNm"
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
					
					if($.osl.isNull(selNode) || $.osl.isNull(selNode.original)){
						$.osl.alert($.osl.lang("stm9200.message.alert.treeNodeSelect"));
						return false;
					}
					
					// 프로젝트 그룹 코드
					var prjGrpCd = selNode.original.prjGrpCd;

					// 프로젝트 그룹 선택 시 알림
					if(prjGrpCd == "01"){
						$.osl.toastr($.osl.lang("stm9200.message.toastr.projectSelect"));
						return false;
					}
					
					// 선택한 노드에서 프로젝트 그룹 ID, 프로젝트 Id를 가져온다.
					selPrjId = selNode.original.prjId;
					selPrjGrpId = selNode.original.prjGrpId;
					
					// 배정 job 데이터 테이블
					var assJobDataTableTarget = $.osl.datatable.list[assignJobDatatableId].targetDt;
					// 미 배정 job 데이터 테이블
					var notAssJobDataTableTarget = $.osl.datatable.list[notAssignJobDatatableId].targetDt;
					
					// 배정 Job 조회
					assJobDataTableTarget.setDataSourceParam("prjGrpId", selPrjGrpId);
					assJobDataTableTarget.setDataSourceParam("prjId", selPrjId);
					$("button[data-datatable-id="+assignJobDatatableId+"][data-datatable-action=select]").click();
					
					// 미 배정 Job 조회
					notAssJobDataTableTarget.setDataSourceParam("prjGrpId", selPrjGrpId);
					notAssJobDataTableTarget.setDataSourceParam("prjId", selPrjId);
					$("button[data-datatable-id="+notAssignJobDatatableId+"][data-datatable-action=select]").click();
					
				},
				init: function(treeObj,data){
				}
			}
		});
		
		//퍼펙트 스크롤 적용
		KTUtil.scrollInit($("#stm9200LicPrjTree")[0], {
	        disableForMobile: true, 
	        resetHeightOnDestroy: true, 
	        handleWindowResize: true, 
	        height: 566
	    });
		
		
		// datatable 세팅 -----------------------
		
		// job 배정 테이블 셋팅
		$.osl.datatable.setting(assignJobDatatableId,{
			data:{
				source:{
					read:{
						url: "/stm/stm9000/stm9200/selectStm9200PrjAssignJenkinsJobListAjax.do"
					}
				},
				pageSize: 5
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100]
					}
				}
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'prjNm', title: "프로젝트 명", textAlign: 'center', width: 180, autoHide: false},
				{field: 'jenNm', title: "Jenkins 명", textAlign: 'center', width: 140, search: true, sortable: true, sortField: "jenNm"},
				{field: 'jenUrl', title: "Jenkins URL", textAlign: 'center', width: 200, search: true, sortable: false},
				{field: 'jobId', title: "Job Id", textAlign: 'center', width: 130, autoHide: false, search: true, sortable: true, sortField: "jobId"},
				{field: 'jobTypeNm', title: "Job Type", textAlign: 'center', width: 100, search: true, sortable: true, searchType:"select", searchCd: "DPL00002", searchField:"jobTypeCd", sortField: "jobTypeCd"},
				{field: 'jobRestoreId', title: "원복 Job Id", textAlign: 'center', width: 130, search: true, sortable: true, sortField: "jobRestoreId"
					,template: function(row){
						var jobRestoredId = row.jobRestoreId;
						// 원복 job id 없을 경우 - 으로 표시
						if($.osl.isNull(jobRestoredId)){
							jobRestoredId = "-";
						}
						return jobRestoredId;
					}
				},
				{field: 'jobParameter', title: "Job 매개변수", textAlign: 'center', width: 120
					,template: function(row){
						var jobParameter = row.jobParameter;
						// Job 매개변수 없을 경우 - 으로 표시
						if($.osl.isNull(jobParameter)){
							jobParameter = "-";
						}
						return jobParameter;
					}
				}
			],
			actionBtn:{
				"title" : $.osl.lang("stm9200.common.notAssign"),
				"dblClick": true,
				"removeJob": true,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("stm9200.toolTip.jobDelete")
			},
			actionFn:{
				"dblClick": function(rowData, datatableId, type, rowNum, elem){
					
					var rowDatas = [];
					rowDatas.push(rowData);
					// Job 배정제외
					fnJobDelete(rowDatas);
				},
				"removeJob":function(rowDatas, datatableId, type, rowNum, elem){
					
					//선택 레코드 없는 경우 알림
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("stm9200.message.confirm.selJobNotAssign"), {html:false}, function(result){
						if (result.value) {
							// JOB 배정제외
							fnJobDelete(rowDatas);
						}
					});
				},
			},
			theme:{
				actionBtn:{
					"removeJob" : " kt-hide"
				},
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-down",
				}
			},
		});
		
		//Job 미배정 테이블 셋팅
		$.osl.datatable.setting(notAssignJobDatatableId,{
			data:{
				source:{
					read:{
						url: "/stm/stm9000/stm9200/selectStm9200PrjNotAssignJenkinsJobListAjax.do"
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
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'jenNm', title: "Jenkins 명", textAlign: 'center', width: 140, search: true, sortable: true, sortField: "jenNm"},
				{field: 'jenUrl', title: "Jenkins URL", textAlign: 'center', width: 200, search: true, sortable: false},
				{field: 'jobId', title: "Job Id", textAlign: 'center', width: 130, autoHide: false, search: true, sortable: true, sortField: "jobId"},
				{field: 'jobTypeNm', title: "Job Type", textAlign: 'center', width: 100, search: true, sortable: true, searchType:"select", searchCd: "DPL00002", searchField:"jobTypeCd", sortField: "jobTypeCd"},
				{field: 'jobRestoreId', title: "원복 Job Id", textAlign: 'center', width: 130, search: true, sortable: true, sortField: "jobRestoreId"
					,template: function(row){
						var jobRestoredId = row.jobRestoreId;
						// 원복 job id 없을 경우 - 으로 표시
						if($.osl.isNull(jobRestoredId)){
							jobRestoredId = "-";
						}
						return jobRestoredId;
					}
				},
				{field: 'jobParameter', title: "Job 매개변수", textAlign: 'center', width: 120
					,template: function(row){
						var jobParameter = row.jobParameter;
						// Job 매개변수 없을 경우 - 으로 표시
						if($.osl.isNull(jobParameter)){
							jobParameter = "-";
						}
						return jobParameter;
					}
				}
			],
			actionBtn:{
				"title" : $.osl.lang("stm9200.common.assign"),
				"dblClick": true,
				"addJob" : true,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : "JOB 배정"
			},
			actionFn:{
				"dblClick": function(rowData, datatableId, type, rowNum, elem){
					
					var rowDatas = [];
					rowDatas.push(rowData);
					// Job 배정
					fnJobInsert(rowDatas);
				},
				"addJob":function(rowDatas, datatableId, type, rowNum, elem){
					
					//선택 레코드 없는 경우 알림
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("stm9200.message.confirm.selJobAssign"), {html:false}, function(result){
						if (result.value) {
							// JOB 배정
							fnJobInsert(rowDatas);
						}
					});
				},
				
			},
			theme:{
				actionBtn:{
					"addJob" : " kt-hide"
				},
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-up",
				}
			}
		});
					
		
		// 배포 실행 권한 설정 버튼 클릭
		$("#stm9200DplAuthSetting").click(function(){
			
			// 배정된 JOB 데이터 테이블에서 선택한 row
			var targetTableElmt = $.osl.datatable.list[assignJobDatatableId].targetDt;
			var selectRows = targetTableElmt.getSelectedRecords();
			
			// 프로젝트에 배정된 JOB을 선택하지 않았을 경우
			if($.osl.isNull(selectRows)){
				$.osl.alert($.osl.lang("stm9200.message.alert.assignJobSelect"));
				return false;
			}
			
			// 배정된 JOB을 여러개 선택 시
			if(selectRows.length > 1){
				$.osl.alert($.osl.lang("stm9200.message.alert.selectOneJob"));
				return false;
			}
			
			var selRowIndex = $(selectRows[0]).data("row");
			var selRowData = targetTableElmt.getDataSet()[selRowIndex];
			
			// 배포 권한 설정 팝업오픈
			fnDplAuthSettingPopupOpen(selRowData);
			
		});
	};
	
	
	/**
	 * function 명 	: fnJobInsert
	 * function 설명	: 프로젝트에 Job 배정한다.
	 * @param rowDatas : 미배정 데이터 테이블에서 선택한 row 데이터 목록
	 */
	var fnJobInsert = function(rowDatas){
		
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm9000/stm9200/insertStm9200JenkinsJobListAjax.do'/>"}
				,{paramPrjGrpId:selPrjGrpId, paramPrjId:selPrjId, dataList: JSON.stringify(rowDatas)});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				// 배정 등록 메시지 출력
   				$.osl.toastr(data.message);
   				
   				//datatable
				var assignJobDataTable = $.osl.datatable.list[assignJobDatatableId].targetDt;
				var notAssignJobDataTable = $.osl.datatable.list[notAssignJobDatatableId].targetDt;
				
				//테이블 재조회
				assignJobDataTable.reload();
				notAssignJobDataTable.reload();
   			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	

	/**
	 * function 명 	: fnJobDelete
	 * function 설명	: 프로젝트에 배정된 Job을 제외한다.
	 * @param rowDatas : 미배정 데이터 테이블에서 선택한 row 데이터 목록
	 */
	var fnJobDelete = function(rowDatas){
		
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm9000/stm9200/deleteStm9200JenkinsJobListAjax.do'/>"}
				,{paramPrjGrpId:selPrjGrpId, paramPrjId:selPrjId, dataList: JSON.stringify(rowDatas)});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				// 배정 등록 메시지 출력
   				$.osl.toastr(data.message);
   				
   				//datatable
				var assignJobDataTable = $.osl.datatable.list[assignJobDatatableId].targetDt;
				var notAssignJobDataTable = $.osl.datatable.list[notAssignJobDatatableId].targetDt;
				
				//테이블 재조회
				assignJobDataTable.reload();
				notAssignJobDataTable.reload();
   			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	
	/**
	 * function 명 	: fnDplAuthSetting
	 * function 설명	: 배포 권한 설정 팝업을 오픈한다.
	 * @param selRowData : 배정된 JOB 목록 데이터 테이블에서 선택한 row의 데이터
	 */
	var fnDplAuthSettingPopupOpen = function(selRowData){
		
		var paramPrjId = selRowData.prjId;
		var paramJenId = selRowData.jenId;
		var paramJobId = selRowData.jobId;
		
		var data = {
				paramPrjId: paramPrjId,
				paramJenId: paramJenId,
				paramJobId: paramJobId
			};
		var options = {
				autoHeight: false,
				modalSize: "xl",
				idKey: paramPrjId+"_"+paramJenId+"_"+paramJobId+"_",
				modalTitle: "[" + selRowData.jobId + "] " + $.osl.lang("stm9200.title.dplAuthSettingModal"),
				closeConfirm: false
			};
		
		$.osl.layerPopupOpen('/stm/stm9000/stm9200/selectStm9201View.do',data,options);
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLStm9200.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
