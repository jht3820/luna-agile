<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<input type="hidden" id="dplId" name="dplId" value="${param.sqrId }"/>
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-5 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="dpl1100.title.deploy">배포계획 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="dpl1000DplTable"></div>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000DplTable" data-datatable-action="select" title="배포계획 조회" data-title-lang-cd="dpl1100.actionBtn.tooltip.dplSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portelt__body">
				<div class="kt_datatable" id="dpl1000DplTable"></div>
			</div>
		</div>
	</div> <!-- 배포계획 목록 끝 -->
	<!-- 우측 -->
	<div class="col-lg-7 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="dpl1100.title.assignment">요구사항 배정 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="req1100AssTable"></div>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100AssTable" data-datatable-action="select" title="요구사항 배정 조회" data-title-lang-cd="dpl1100.actionBtn.title.assSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100AssTable" data-datatable-action="removeReq" title="요구사항 배정 제외" data-title-lang-cd="dpl1100.actionBtn.tooltip.removeToolTip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="removeReq" tabindex="2">
							<i class="fa fa-arrow-alt-circle-down"></i><span data-lang-cd="dpl1100.button.removeBtn">제외</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portelt__body">
				<div class="kt_datatable" id="req1100AssTable"></div>
			</div>
		</div> <!-- 요구사항배정목록 끝 -->
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="dpl1100.title.assignment">요구사항 미배정 목록 </span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="req1100NonTable"></div>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100NonTable" data-datatable-action="select" title="요구사항 미배정 조회" data-title-lang-cd="dpl1100.actionBtn.title.nonSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100NonTable" data-datatable-action="addReq" title="요구사항 배정" data-title-lang-cd="dpl1100.actionBtn.tooltip.addToolTip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="addReq" tabindex="2">
							<i class="fa fa-arrow-alt-circle-up"></i><span data-lang-cd="dpl1100.button.addBtn">배정</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portelt__body">
				<div class="kt_datatable" id="req1100NonTable"></div>
			</div>
		</div>
	</div> <!-- 요구사항 미배정목록 끝 -->
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLDpl1100Popup = function () {
	//배포계획 데이터 테이블
	var dplDatatableId = "dpl1000DplTable";
	//요구사항 배정 목록 테이블
	var reqAssDatatableId = "req1100AssTable";
	//요구사항 미배정 목록 테이블
	var reqNonDatatableId = "req1100NonTable";
	
	//배정 리스트
	var assList = [];
	//미배정 리스트
	var nonAssList = [];
	
	var documentSetting = function(){
		//배포계획 데이터 테이블 셋팅
		$.osl.datatable.setting(dplDatatableId,{
			data:{
				source:{
					read:{
						url: "/dpl/dpl1000/dpl1000/selectDpl1000DplListAjax.do"
					}
				}
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'dplStsNm', title: '배포 상태', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "DPL00001", searchField:"dplStsCd", sortable: true, sortField:"dplStsCd"},
				{field: 'dplNm', title: '배포계획명', textAlign: 'left', width: 240, autoHide: false, search: true, sortable: true, sortField: "dplNm"},
				{field: 'dplDt', title: '배포일', textAlign: 'center', width: 120, sortable: true,  sortField: "dplDt", search:true,  searchType:"daterange",
					template: function (row) {
						var paramDatetime = new Date(row.dplDt);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'dplVer', title: '버전', textAlign: 'left', width: 50, search: true, sortable: true, sortField: "dplVer"},
				{field: 'dplTypeNm', title: '배포 방법', textAlign: 'left', width: 50, search: true, searchType:"select", searchCd: "DPL00003", searchField:"dplTypeCd", sortable: true, sortField:"dplTypeCd"},
			],
			searchColumns:[
				{field: 'dplDesc', title: '배포계획 설명', searchOrd: 3},
			],
			actionBtn:{
				"title" : $.osl.lang("dpl1100.actionBtn.title.selectBtn"),
				"click": true,
				"delete":false,
				"update":false,
			},
			actionTooltip:{
				"click" : $.osl.lang("dpl1100.actionBtn.tooltip.clickToolTip"),
			},
			actionFn:{
				"select": function(datatableId, elem){
					//검색 대상 가져오기
					var searchTypeTarget = $(".osl-datatable-search__dropdown[data-datatable-id="+datatableId+"] > .dropdown-item.active");
					
					//검색 값
					var searchData = $("#searchData_"+datatableId);

					//대상 정보 가져오기
					var searchFieldId = searchTypeTarget.data("field-id");
					var searchType = searchTypeTarget.data("opt-type");
					var searchCd = $(this).data("opt-mst-cd");
					
					//입력된 검색값 초기화
					$.osl.datatable.list[datatableId].targetDt.setDataSourceQuery({});
					
					//전체가 아닌경우 해당 타입으로 검색
					if(searchType != "all"){
						var searchDataValue = searchData.val();
						
						//공통코드인경우 select값 가져오기
						if(searchType == "select"){
							searchDataValue = $("#searchSelect_"+datatableId).val();
						}
						
						$.osl.datatable.list[datatableId].targetDt.search(searchDataValue,searchFieldId);
					}else{
						$.osl.datatable.list[datatableId].targetDt.search();
						
						//검색한 경우 기존에 선택 항목 초기화
						$("#dplId").val("");
						selectBtnClick();
					}
				},
				"click": function(rowData){
					$("#dplId").val(rowData.dplId);
					selectBtnClick();
				}
			}
		});

		//요구사항 배정 테이블 셋팅
		$.osl.datatable.setting(reqAssDatatableId,{
			data:{
				source:{
					read:{
						url: "/dpl/dpl1000/dpl1100/selectDpl1100AssReqListAjax.do"
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
				{field: 'rn', title: 'No.', textAlign: 'center', width: 80, sortField: "rn"},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 450, autoHide: false, sortField: "reqNm", search:true,
					template: function(row){
						var resultStr = $.osl.escapeHtml(row.reqNm);
						//비밀번호가 있는 경우
						if(row.reqPw == "Y"){
							resultStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
						}
						return resultStr;
					}	
				},
				{field: 'reqOrd', title: '순번', textAlign: 'left', width: 80},
				{field: 'reqProTypeNm', title: '처리유형', textAlign: 'left', width: 80, sortField: "reqProTypeCd", search:true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortable: true, sortField:"reqProTypeCd"},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 120, sortField: "reqDtm",
					template: function (row) {
						var paramDatetime = new Date(row.reqDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			rows:{
				clickCheckbox: true
			},
			actionBtn:{
				"title" : $.osl.lang("dpl1100.actionBtn.title.removeBtn"),
				"dblClick": true,
				"removeReq": true,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("dpl1100.actionBtn.tooltip.removeToolTip")
			},
			actionFn:{
				"dblClick": function(rowData){
					assList.push(rowData);
					deleteReq($("#dplId").val(), JSON.stringify(assList));
				},
				"removeReq":function(rowData, datatableId, type){
					assList = rowData;
					deleteReq($("#dplId").val(), JSON.stringify(assList));
				},
			},
			theme:{
				actionBtn:{
					"removeReq" : " kt-hide"
				},
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-down",
				}
			},
		});
		
		//요구사항 미배정 테이블 셋팅
		$.osl.datatable.setting(reqNonDatatableId,{
			data:{
				source:{
					read:{
						url: "/dpl/dpl1000/dpl1100/selectDpl1100NonAssReqListAjax.do"
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
				{field: 'rn', title: 'No.', textAlign: 'center', width: 80, sortField: "rn"},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 450, autoHide: false, sortField: "reqNm", search:true,
					template: function(row){
						var resultStr = $.osl.escapeHtml(row.reqNm);
						//비밀번호가 있는 경우
						if(row.reqPw == "Y"){
							resultStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
						}
						return resultStr;
					}	
				},
				{field: 'reqOrd', title: '순번', textAlign: 'left', width: 80},
				{field: 'reqProTypeNm', title: '처리유형', textAlign: 'left', width: 80, sortField: "reqProTypeCd", search:true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortable: true, sortField:"reqProTypeCd"},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 120, sortField: "reqDtm",
					template: function (row) {
						var paramDatetime = new Date(row.reqDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			rows:{
				clickCheckbox: true
			},
			actionBtn:{
				"title" : $.osl.lang("dpl1100.actionBtn.title.addBtn"),
				"dblClick": true,
				"addReq" : true,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("dpl1100.actionBtn.tooltip.addToolTip")
			},
			actionFn:{
				"dblClick": function(rowData){
					nonAssList.push(rowData);
					insertReq($("#dplId").val(), JSON.stringify(nonAssList));
				},
				"addReq":function(rowData, datatableId, type){
					nonAssList = rowData;
					insertReq($("#dplId").val(), JSON.stringify(nonAssList));
				},
				
			},
			theme:{
				actionBtn:{
					"addReq" : " kt-hide"
				},
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-up",
				}
			}
		});
	};

	/**
	* selectBtnClick : 요구사항 배정/미배정 목록 조회 버튼 클릭
	*/
	var selectBtnClick = function(){
		var dplId = $("#dplId").val();
		//요구사항 배정목록 조회
		$.osl.datatable.list[reqAssDatatableId].targetDt.setDataSourceParam("dplId", dplId);
		$("button[data-datatable-id="+reqAssDatatableId+"][data-datatable-action=select]").click();
		//요구사항 미배정 목록 조회
		$.osl.datatable.list[reqNonDatatableId].targetDt.setDataSourceParam("dplId", dplId);
		$("button[data-datatable-id="+reqNonDatatableId+"][data-datatable-action=select]").click();
	};
	
	/**
	* insertReq : 선택 요구사항 배정 등록
	* param : 선택된 배포계획 ID
	* param : 선택된 요구사항 목록
	*/
	var insertReq = function(dplId, list){
		var data = {
				selReqList : list,
				dplId : dplId
		};
		
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/dpl/dpl1000/dpl1100/insertDpl1100ReqListAjax.do'/>"}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				if(list.length>0){
					$.osl.toastr(data.message);
					nonAssList = [];
				}
				selectBtnClick();
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	}

	/**
	* deleteReq : 선택 요구사항 배정 제외
	* param : 선택된 배포계획 ID
	* param : JSON.Stringify(선택된 요구사항 목록)
	*/
	var deleteReq = function(dplId, list){
		var data = {
				selReqList : list,
				dplId : dplId
		};
		
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/dpl/dpl1000/dpl1100/deleteDpl1100ReqListAjax.do'/>"}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				if(list.length>0){
					$.osl.toastr(data.message);
					assList = [];
				}
				selectBtnClick();
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	}
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl1100Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
