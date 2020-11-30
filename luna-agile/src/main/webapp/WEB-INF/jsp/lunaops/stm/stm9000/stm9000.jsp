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
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<!-- begin:: JENKINS 저장소 관리 datatable 영역 -->
			<div class="col-xl-6">
				<div class="kt-portlet--contain osl-content__border--light">
					<div class="kt-blog-grid">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-window-maximize kt-margin-r-5"></i><span data-lang-cd="stm9000.title.jenkinsManagement">JENKINS 관리</span>
								</h5>
							</div>
							<!-- begin:: JENKINS 저장소 관리 datatable button -->
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-wrapper">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JenkinsTable" data-datatable-action="select" title="Jenkins 조회" data-title-lang-cd="stm9000.button.jenkins.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
										<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JenkinsTable" data-datatable-action="insert" title="Jenkins 추가" data-title-lang-cd="stm9000.button.jenkins.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
										<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JenkinsTable" data-datatable-action="update" title="Jenkins 수정" data-title-lang-cd="stm9000.button.jenkins.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
										<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JenkinsTable" data-datatable-action="delete" title="Jenkins 삭제" data-title-lang-cd="stm9000.button.jenkins.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
										<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
									</button>
								</div>
							</div>
							<!-- end:: JENKINS 저장소 관리 datatable button -->
						</div>
						
						<div class="kt-portlet__body">
							<div class="kt-blog-grid__body">
								<div class="row">
									<div class="col-lg-5 col-md-6 col-sm-6">
										<div class="osl-datatable-search" data-datatable-id="stm9000JenkinsTable"></div>
									</div>
								</div>
								<div class="kt_datatable" id="stm9000JenkinsTable"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end:: JENKINS 저장소 관리 datatable 영역 -->
			
			<!-- begin:: Job 관리 datatable 영역 -->
			<div class="col-xl-6">
				<div class="kt-portlet--contain osl-content__border--light">
					<div class="kt-blog-grid">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-window-restore kt-margin-r-5"></i><span data-lang-cd="stm9000.title.jobManagement">JOB 관리</span>
								</h5>
							</div>
							<!-- begin:: Job 관리 datatable button -->
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-wrapper">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JobTable" data-datatable-action="select" title="Job 조회" data-title-lang-cd="stm9000.button.job.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
										<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JobTable" data-datatable-action="insert" title="Job 추가" data-title-lang-cd="stm9000.button.job.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="6">
										<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JobTable" data-datatable-action="update" title="Job 수정" data-title-lang-cd="stm9000.button.job.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="7">
										<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JobTable" data-datatable-action="delete" title="Job 삭제" data-title-lang-cd="stm9000.button.job.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8">
										<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
									</button>
								</div>
							</div>
							<!-- end:: Job 관리 datatable button -->
						</div>
						
						<div class="kt-portlet__body">
							<div class="kt-blog-grid__body">
								<div class="row">
									<div class="col-lg-5 col-md-6 col-sm-6">
										<div class="osl-datatable-search" data-datatable-id="stm9000JobTable"></div>
									</div>
								</div>
								<div class="kt_datatable" id="stm9000JobTable"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end:: Job 관리 영역 -->
		</div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm9000 = function () {
	var documentSetting = function(){
		// begin:: Jenkins 목록 데이터테이블
		$.osl.datatable.setting("stm9000JenkinsTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm9000/stm9000/selectStm9000JenkinsListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: ' ', title: $.osl.lang("stm9000.field.jenkins.connectCheck"), textAlign: 'center', width: 90, autoHide: false},
				{field: 'jenNm', title: $.osl.lang("stm9000.field.jenkins.jenkinsNm"), textAlign: 'center', width: 120, autoHide: false, search: true},
				{field: 'jenUrl', title: $.osl.lang("stm9000.field.jenkins.jenkinsUrl"), textAlign: 'left', width: 240, search: true, autoHide: false},
				{field: 'jenUsrId', title: $.osl.lang("stm9000.field.jenkins.useNm"), textAlign: 'center', width: 120},
				{field: 'useNm', title: $.osl.lang("stm9000.field.jenkins.JenkinsUsrId"), textAlign: 'center', width: 120, search: true, searchType:"select", searchCd: "CMM00001", sortField: "useCd"}
			],
			actionBtn:{
				"click": false,
				"dblClick": true
			},
			actionTooltip:{
				"update": $.osl.lang("stm9000.actionBtn.jenkins.updateBtn"),
				"delete": $.osl.lang("stm9000.actionBtn.jenkins.deleteBtn"),
				"dblClick": $.osl.lang("stm9000.actionBtn.jenkins.dblClickBtn")
			},
			actionFn:{
				"insert":function(rowData){
					
// 					var data = {type:"insert"};
// 					var options = {
// 							idKey: datatableId,
// 							modalTitle: $.osl.lang("stm9000.modal.jeknins.insertJenkins"),
// 							closeConfirm: false
// 						};
					
					//$.osl.layerPopupOpen('/stm/stm4000/stm4000/selectStm4001View.do',data,options);
				},
				"update":function(rowData, datatableId, type, rowNum){
					
// 					var data = {
// 							type:"update",
// 							paramMstCd: rowData.mstCd,
// 							paramStmUseYn: rowData.stmUseYn,
// 							paramStmUseNm : rowData.stmUseYn == "Y" ? "예" : "아니오"
// 						};
// 					var options = {
// 							idKey: rowData.mstCd,
// 							modalTitle: $.osl.lang("stm9000.modal.jeknins.updateJenkins"),
// 							closeConfirm: false
// 						};
					
// 					$.osl.layerPopupOpen('/stm/stm4000/stm4000/selectStm4001View.do',data,options);
				},
				"delete":function(rowDatas){
					
// 					var params = "";
// 					var isStmUse = false;
					
// 					$.each(rowDataList, function(idx, map){
// 						var stmUseYn = map.stmUseYn;
// 						// 시스템 사용유무 Y일 경우 삭제불가
// 						if(stmUseYn == "Y"){
// 							isStmUse = true;
// 							return false;
// 						}
							
// 						params +="&mstCd="+map.mstCd+"&stmUseYn="+stmUseYn;
// 					});
					
// 					if(isStmUse){
// 						$.osl.alert("시스템에서 사용중인 코드는 삭제할 수 없습니다.", "warning");
// 						return false;
// 					}
					
// 					//AJAX 설정
// 					var ajaxObj = new $.osl.ajaxRequestAction(
// 							{"url":"<c:url value='/stm/stm4000/stm4000/deleteStm4000CommonCodeMasterAjax.do'/>"}
// 								,params);
// 					//AJAX 전송 성공 함수
// 					ajaxObj.setFnSuccess(function(data){
				    	
// 						// 에러시 alert
// 						if(data.errorYn == "Y"){
// 							$.osl.alert(data.message, "warning");
// 							return false;
// 						}
						
// 						$.osl.toastr(data.message);
// 						// 삭제 성공시 데이터 테이블 reload
// 						$.osl.datatable.list["stm9000JenkinsTable"].targetDt.reload();
// 						// 디테일 데이터 테이블 재조회
// 						$.osl.datatable.list["stm9000JobTable"].targetDt.reload();
// 					});
					
// 					//AJAX 전송
// 					ajaxObj.send();
				},
				"click":function(rowData, datatableId, type, rowNum, elem){
// 					// 공통코드 마스터 row 클릭 시 디테일 테이블 조회 파라미터로 mstCd 세팅
// 					var detailDataTable = $.osl.datatable.list["stm9000JobTable"].targetDt;
// 					detailDataTable.setDataSourceParam("mstCd",rowData.mstCd);
// 					// 공통코드 디테일 등록 시 시스템 사용여부 판단을 위해 stmUseYn값 세팅
// 					detailDataTable.setDataSourceParam("stmUseYn",rowData.stmUseYn);
// 					// 공통코드 디테일 데이터테이블 조회
// 					$("button[data-datatable-id=stm9000JobTable][data-datatable-action=select]").click();   
				},
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					console.log("dblClick : ", rowData);
				}
			}
		});
		// end:: Jenkins 목록 데이터테이블
		
		// begin:: Job 데이터테이블
		$.osl.datatable.setting("stm9000JobTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm4000/stm4000/selectStm4000CommonCodeDetailListAjax.do"
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: 'mstCd', title: '마스터 코드', textAlign: 'center', width: 100},
				{field: 'mstCdNm', title: '마스터 코드 명', textAlign: 'left', width: 150},
				{field: 'subCd', title: '서브 코드', textAlign: 'center', width: 90, autoHide: false, search: true},
				{field: 'subCdNm', title: '서브 코드 명', textAlign: 'left', width: 170, autoHide: false, search: true},
				{field: 'subCdRef1', title: '보조필드 1', textAlign: 'left', width: 150, search: true,
					template: function (row) {return $.osl.isNull(row.subCdRef1) ? "-" : row.subCdRef1;}
				},
				{field: 'subCdRef2', title: '보조필드 2', textAlign: 'left', width: 150, search: true,
					template: function (row) {return $.osl.isNull(row.subCdRef2) ? "-" : row.subCdRef2;}
				},
				{field: 'subCdRef3', title: '보조필드 3', textAlign: 'left', width: 150,
					template: function (row) {return $.osl.isNull(row.subCdRef3) ? "-" : row.subCdRef3;}
				},
				{field: 'subCdRef4', title: '보조필드 4', textAlign: 'left', width: 150,
					template: function (row) {return $.osl.isNull(row.subCdRef4) ? "-" : row.subCdRef4;}
				},
				{field: 'subCdRef5', title: '보조필드 5', textAlign: 'left', width: 150,
					template: function (row) {return $.osl.isNull(row.subCdRef5) ? "-" : row.subCdRef5;}
				},
				{field: 'subCdDesc', title: '서브코드 설명', textAlign: 'left', width: 200, search: true,
					// 코드설명은 태그제거 후 표시
					template: function (row) {return !$.osl.isNull(row.subCdDesc) ? row.subCdDesc.replace(/(<([^>]+)>)/ig,"") : row.subCdDesc;}		
				},
				{field: 'ord', title: '표시 순서', textAlign: 'center', width: 100},
				{field: 'useYn', title: '사용 유무', textAlign: 'center', width: 100 , search: true, searchType:"select", searchCd: "CMM00001", 
					// 공통코드 테이블에는 사용여부가 Y/N 으로 들어가므로 검색창에 표시를 위해 CMM00001 공통코드를 가져와 세팅한다.
					template: function (row) {return row.useYn == "Y" ? "예" : "아니오";}
				},
				{field: 'stmUseYn', title: '시스템 사용 유무', textAlign: 'center', width: 100, searchType:"select", searchCd: "CMM00001",
					template: function (row) {return row.stmUseYn == "Y" ? "예" : "아니오";}
				}
			],
			actionTooltip:{
				"update": "공통코드 디테일 수정",
				"delete": "공통코드 디테일 삭제"
			},
			actionFn:{
				"insert":function(datatableId){
					
					var paramData = $.osl.datatable.list["stm9000JobTable"].targetDt.getDataSourceParam();
					
					// 공통코드 디테일 데이터테이블의 DataSourceParam에 mstCd값이 존재하는지 체크한다.
					if(!$.osl.isNull(paramData) && $.osl.isNull(paramData.mstCd)){
						$.osl.alert("공통코드 마스터를 선택 후<br/>공통코드 디테일 등록이 가능합니다.");
						return false;
					}
					
					// 마스터 코드의 시스템 사용유무 값에 따라 공통코드 디테일 등록 가능여부 판단
					if(!$.osl.isNull(paramData) && !$.osl.isNull(paramData.stmUseYn) && paramData.stmUseYn == "Y"){
						$.osl.alert("공통코드 마스터가 시스템에서 사용중인 경우 <br/>공통코드 디테일을 추가할 수 없습니다.");
						return false;
					}
					
					var data = {
							type : "insert", 
							mstCd : paramData.mstCd,
							paramStmUseYn : paramData.stmUseYn
					};
					var options = {
							idKey: datatableId,
							modalTitle: "공통코드 디테일 등록",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm4000/stm4000/selectStm4002View.do',data,options);
				},
				"update":function(rowData){
					
					var data = {
							type : "update", 
							mstCd : rowData.mstCd,
							subCd : rowData.subCd,
							paramStmUseYn: rowData.stmUseYn
					};
					var options = {
							idKey: rowData.subCd,
							modalTitle: "공통코드 디테일 수정",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm4000/stm4000/selectStm4002View.do',data,options);
				},
				"delete":function(rowDataList){
					
					var params = "";
					var isStmUse = false;
					
					// 삭제 공통코드 디테일 loop
					$.each(rowDataList, function(idx, map){
						var stmUseYn = map.stmUseYn;
						
						// 시스템 사용유무 Y일 경우 삭제불가
						if(stmUseYn == "Y"){
							isStmUse = true;
							return false;
						}
						
						params += "&subCd="+map.subCd+"&stmUseYn="+stmUseYn+"&mstCd="+map.mstCd;
					});
					
					if(isStmUse){
						$.osl.alert("시스템에서 사용중인 코드는 삭제할 수 없습니다.", "warning");
						return false;
					}
					
					//AJAX 설정
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/stm/stm4000/stm4000/deleteStm4000CommonCodeDetailAjax.do'/>"}
								,params);
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
				    	
						// 에러시 alert
						if(data.errorYn == "Y"){
							$.osl.alert( data.message, "warning");
							return false;
						}
						
						$.osl.toastr(data.message);
						// 삭제 성공시 데이터 테이블 reload
						$.osl.datatable.list["stm9000JobTable"].targetDt.reload();
					});
					
					//AJAX 전송
					ajaxObj.send();
				}
			}
		});
		// end:: Job 데이터테이블
		
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
	OSLStm9000.init();
});
		
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
