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
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9300PrjJobTable" data-datatable-action="select" title="프로젝트 배정 Job 조회" data-title-lang-cd="stm9300.button.toolTil.prjAssignJobSearch" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-12">
				<div class="osl-datatable-search" data-datatable-id="stm9300PrjJobTable"></div>
			</div>
		</div>
		<div class="kt_datatable" id="stm9300PrjJobTable"></div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm9300 = function () {
	var documentSetting = function(){
		
		// begin:: 프로젝트 배정 Job 데이터테이블
		$.osl.datatable.setting("stm9300PrjJobTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm9000/stm9300/selectStm9300ProjectJenkinsJobAllListAjax.do"
					}
				}
			},
			columns: [
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjNm', title: "프로젝트 명", textAlign: 'center', width: 180, autoHide: false, search: true, sortable: true, sortField: "prjNm"},
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
				},
				{field: 'useNm', title: "사용 유무", textAlign: 'center', width: 100, search: true, sortable: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField: "useCd"}
			],
			searchColumns: [
				{field: 'jenDesc', title:$.osl.lang("stm9300.search.jenkinsDesc"), searchOrd: 3},
				{field: 'jobDesc', title:$.osl.lang("stm9300.search.jobDesc"), searchOrd: 8}
			],
			actionBtn:{
				"insert": false,
				"update": false,
				"delete": false,
				//"detailJenkins":true,
				"dblClick": true,
				"title": $.osl.lang("datatable.action.functionNm"),
				"width" : 160
			},
			actionTooltip:{
				"dblClick": $.osl.lang("stm9300.actionBtn.jobDetail"),
				//"detailJenkins": $.osl.lang("stm9300.actionBtn.jenkinsDetail")
			},
			actionFn:{
				// job 상세보기
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					
					var data = {
							paramJenId: rowData.jenId,
							paramJobId: rowData.jobId
					};
					var options = {
							idKey: datatableId +"_"+ rowData.jenId,
							modalTitle: "["+ rowData.jobId + "] " + $.osl.lang("stm9300.modal.title.detail"),
							closeConfirm: false,
							modalSize: "xl"
					};
					
					$.osl.layerPopupOpen('/stm/stm9000/stm9100/selectStm9102View.do',data,options);
					
				},
				// jenkins 상세보기
				/* "detailJenkins":function(rowData, datatableId, type, rowNum, elem){
					
					var data = {
							paramJenId: rowData.jenId,
							paramJenNm: rowData.jenNm
					};
					var options = {
							idKey: datatableId +"_"+ rowData.jenId,
							modalTitle: "["+ rowData.jenNm + "] " + $.osl.lang("stm9300.modal.title.detail"),
							closeConfirm: false,
							modalSize: "xl"
						};
					
					$.osl.layerPopupOpen('/stm/stm9000/stm9000/selectStm9002View.do',data,options);
				} */
			},
			theme: {
				 actionBtnIcon:{
					 //"detailJenkins": "fa flaticon-settings-1",
					 "dblClick": "fa fa-info-circle"
				 }
			 }
		});
		// end:: 프로젝트 배정 Job 데이터테이블
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
	OSLStm9300.init();
});
		
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
