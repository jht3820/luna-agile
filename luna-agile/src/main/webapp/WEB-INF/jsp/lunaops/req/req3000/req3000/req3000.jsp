<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<!-- begin page DOM -->
<div class="kt-portlet kt-portlet--mobile ">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
	</div>
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block ">
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="req3000Table">
				<div class="input-group">
					<div class="input-group-prepend">
						<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
						<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="req3000Table">
							<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
							<a class="dropdown-item" href="javascript:void(0);" data-field-id="reqGrpNo" data-opt-type="text">그룹 요구사항 번호</a>
							<a class="dropdown-item" href="javascript:void(0);" data-field-id="reqGrpNm" data-opt-type="text">그룹 요구사항 제목</a>
							<a class="dropdown-item" href="javascript:void(0);" data-field-id="reqGrpUsrNm" data-opt-type="text">요청자</a>
							<a class="dropdown-item" href="javascript:void(0);" data-field-id="regGrpChargerNm" data-opt-type="text">그룹 요구사항 담당자</a>
							<a class="dropdown-item" href="javascript:void(0);" data-field-id="useCD" data-opt-type="select">사용유무</a>
						</div>
					</div>
					<select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_req3000Table" name="searchSelect" aria-hidden="true" data-datatable-id="req3000Table" style="display: none;"></select>
					<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="req3000Table">
						<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_req3000Table" id="searchData_req3000Table" data-datatable-id="req3000Table">
						<span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
						<input type="hidden" name="searchStartDt" id="searchStartDt_req3000Table" data-datatable-id="req3000Table">
						<input type="hidden" name="searchEndDt" id="searchEndDt_req3000Table" data-datatable-id="req3000Table">
					</div>
					<div class="input-group-append">
						<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="req3000Table"><i class="fa fa-search"></i><span class=""><span>검색</span></span>
						</button>
					</div>
				</div>
						</div>
		</div>
		<div class="col-lg-9 col-md-12 col-sm-12 text-right osl-mobile-text--left kt-padding-r-0">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="select" title="그룹 요구사항 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-title-lang-cd="req3000.datatable.button.title.select" data-placement="bottom" data-auth-button="select" tabindex="5">
				<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="insert" title="그룹 요구사항 목록 추가" data-toggle="kt-tooltip" data-skin="brand" data-title-lang-cd="req3000.datatable.button.title.insert" data-placement="bottom" data-auth-button="insert" tabindex="6">
				<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="update" title="그룹 요구사항 목록 수정" data-toggle="kt-tooltip" data-skin="brand" data-title-lang-cd="req3000.datatable.button.title.update" data-placement="bottom" data-auth-button="update" tabindex="7">
				<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="delete" title="그룹 요구사항 목록 삭제" data-toggle="kt-tooltip" data-skin="brand" data-title-lang-cd="req3000.datatable.button.title.delete" data-placement="bottom" data-auth-button="delete" tabindex="8">
				<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="assign" title="그룹 요구사항 목록 엑셀" data-toggle="kt-tooltip" data-skin="brand" data-title-lang-cd="req3000.datatable.button.title.excel" data-placement="bottom" data-auth-button="excel" tabindex="">
				<i class="fas fa-file-excel"></i><span data-lang-cd="datatable.button.excel">엑셀</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="assign" title="그룹 요구사항 목록 프린트" data-toggle="kt-tooltip" data-skin="brand" data-title-lang-cd="req3000.datatable.button.title.print" data-placement="bottom" data-auth-button="print" tabindex="">
				<i class="fas fa-print"></i><span data-lang-cd="datatable.button.print">프린트</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="assign" title="그룹 요구사항 목록 양식 다운로드" data-toggle="kt-tooltip" data-skin="brand" data-title-lang-cd="req3000.datatable.button.title.download" data-placement="bottom" data-auth-button="form-download" tabindex="">
				<i class="fas fa-file-download"></i><span data-lang-cd="datatable.button.download">양식 다운로드</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3000Table" data-datatable-action="assign" title="그룹 요구사항 목록 업로드" data-toggle="kt-tooltip" data-skin="brand" data-title-lang-cd="req3000.datatable.button.title.upload" data-placement="bottom" data-auth-button="upload" tabindex="">
				<i class="fas fa-file-upload"></i><span data-lang-cd="datatable.button.upload">업로드</span>
			</button>
		</div>
	</div>
</div>
<div class="kt_datatable osl-datatable-footer__divide" id="req3000Table"></div>
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLReq3000Popup = function () {
	
	var documentSetting = function(){
		var config = {
				data:{
					source:{
						read:{
							url:"/req/req3000/req3000/selectReq3000ListAjaxView.do"
						}
					}
				},
		columns : [
			{field: 'checkbox', title:'#', textAlign:'center', width:20, selector: {class: 'kt-checkbox--solid'}, sortable:false, autoHide:false},
			{field: 'rn', title:"No.", textAlign: 'center', width: 25, autoHide: false, sortable: false},
			{field: 'reqGrpNm', title: '그룹 요구사항 제목', textAlign: 'left', width: 150, search: true},
			{field: 'reqGrpLinkCnt', title: '연결 요구사항 수', textAlign: 'left', width: 150, search: true,
				template: function (row) {
					var reqGrpLinkCnt = row.reqGrpLinkCnt;
					if(reqGrpLinkCnt == 0){
						reqGrpLinkCnt = "0";
					}
					return reqGrpLinkCnt;
				},
			},
			{field: 'reqGrpUsrNm', title: '요청자', textAlign: 'center', width: 150, search: true,
				template: function (row) {
					return $.osl.user.usrImgSet(row.reqUsrImgId, row.reqGrpUsrNm);
				},
				onclick: function(rowData){
					$.osl.user.usrInfoPopup(rowData.reqUsrId);
				}
			},
			{field: 'email', title: '요청자 e-mail', textAlign: 'center', width: 150, search: true},
			{field: 'deptNm', title: '요청자 조직', textAlign: 'center', width: 300, sortable: false},
			{field: 'telno', title: '요청자 연락처', textAlign: 'center', width: 100, search: true},
			{field: 'regGrpChargerNm', title: '그룹 요구사항 담당자', textAlign: 'center', width: 150, search: true,
				template: function (row) {
					return $.osl.user.usrImgSet(row.reqGrpChargerImgId, row.regGrpChargerNm);
				},
				onclick: function(rowData){
					$.osl.user.usrInfoPopup(rowData.reqGrpChargerImgId);
				}
			},
			{field: 'regDtmDay', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"daterange"}
		],
		rows:{
			clickCheckbox:true
		},
		actionBtn:{
			"dblClick":true,
			"excel":true,
			"print":true,
			"insert":false,
			"update":true,
			"title": $.osl.lang("datatable.action.functionNm")
		},
		actionTooltip:{
			"insert":$.osl.lang("req3000.datatable.action.insert"),
			"update":$.osl.lang("req3000.datatable.action.update"),
			"dblClick": $.osl.lang("req3000.datatable.action.dblClick"),
			"delete": $.osl.lang("req3000.datatable.action.delete"),
			"excel": $.osl.lang("req3000.datatable.action.excel"),
			"print": $.osl.lang("req3000.datatable.action.print"),
		},
		// 테마
		theme:{
			actionBtnIcon:{
				"dblClick":"fa fa-list-alt",
				"excel":"fa fa-file-excel",
				"print":"fa fa-print"
			}
		},
		actionFn:{
			"insert":function(datatableId, type, rowNum){
				var data = {type:"insert"};
				var options = {
						idKey: datatableId,
						modalSize: "xl",
						modalTitle: $.osl.lang("req3001.title"),
						closeConfirm: false,
						modalTitle:$.osl.lang("req3000.title.insert"),
					};
				
				$.osl.layerPopupOpen('/req/req3000/req3000/selectReq3001View.do',data,options);
			},"update":function(rowData, datatableId, type, rowNum, elem){
				//데이터 전송
				var data = {
						type:"update",
						paramPrjGrpId : rowData.prjGrpId,
						paramPrjId : rowData.prjId,
						paramReqGrpId : rowData.reqGrpId,
						paramReqGrpUsrId : rowData.reqGrpUsrId,
						paramReqGrpChargerId :rowData.reqGrpChargerId
					};
				//옵션
				var options = {
						idKey: datatableId,
						modalTitle: $.osl.lang("req3001.title"),
						closeConfirm: false,
						modalSize: "xl",
						modalTitle:$.osl.lang("req3000.title.update"),
					};
				
				$.osl.layerPopupOpen('/req/req3000/req3000/selectReq3001View.do',data,options);
				
			},"delete":function(rowDatas, datatableId, type, rowNum, elem){
				
				var data = {
						type:"delete",
						paramRowData:JSON.stringify(rowDatas),
						datatableId:datatableId
				};
				
				//AJAX 설정
				var ajaxObj = new $.osl.ajaxRequestAction(
						{"url":"<c:url value='/req/req3000/req3000/deleteReq3000ReqListAjax.do'/>"}
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
			},"dblClick":function(rowData, datatableId, type, rowNum){
				var data = {
						
						paramPrjGrpId : rowData.prjGrpId,
						paramPrjId : rowData.prjId,
						paramReqGrpId : rowData.reqGrpId,
						paramReqGrpUsrId : rowData.reqGrpUsrId,
						paramReqGrpChargerId :rowData.reqGrpChargerId
					};
				var options = {
						idKey: rowData.reqId,
						modalTitle: "그룹 요구사항 상세정보",
						closeConfirm: false,
						modalSize: "xl",
						modalTitle:$.osl.lang("req3000.title.detail"),
					};
				
				$.osl.layerPopupOpen('/req/req3000/req3000/selectReq3002View.do',data,options);	
				}
			}
		}
		// begin:: 그룹 요구사항 관리 데이터테이블
		$.osl.datatable.setting("req3000Table", config);
		// end:: 그룹 요구사항 관리 데이터테이블
		
	}
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
