<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1101">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramProcessId" id="paramProcessId" value="${param.paramProcessId}">
		<div class="kt-portlet">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>프로세스 정보
					</h5>
				</div>
			</div>
			<div class="kt-portlet__body kt-padding-15">
				<div class="row">
					<div class="col-lg-6 col-md-12 col-sm-12">
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span>프로세스명</span></label>
									<input type="text" class="form-control" placeholder="프로세스명" name="processNm" id="processNm" opttype="-1" required>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="required"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>정렬 순서</span></label>
									<input type="number" class="form-control" placeholder="정렬 순서" name="processOrd" id="processOrd" value="1" opttype="-1" min="0" max="999" maxlength="3" >
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
									<select class="form-control kt-select2" id="useCd" name="useCd" readonly="readonly" opttype="-1">
									</select>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>프로세스 이관 가능 여부</label>
									<select class="form-control kt-select2" id="processTransferCd" name="processTransferCd" readonly="readonly" opttype="-1">
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span>프로세스 설명</span></label>
									<textarea class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="processDesc" id="processDesc" maxlength="2000" opttype="-1" required></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6 col-md-12 col-sm-12">
				<div class="kt-portlet">
					<div class="kt-portlet__head kt-portlet__head--lg">
						<div class="kt-portlet__head-label">
							<h5 class="kt-font-boldest kt-font-brand">
								<i class="fa fa-th-large kt-margin-r-5"></i>프로세스 담당 목록
							</h5>
						</div>
						<div class="kt-portlet__head-toolbar">
							<div class="kt-portlet__head-wrapper">
								<c:if test="${param.type != 'insert' }">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1101ProcessAuthUsrTable" data-datatable-action="reset" title="담당자 배정 목록 초기화" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
										<i class="fa fa-list"></i><span>초기화</span>
									</button>
								</c:if>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1101ProcessAuthUsrTable" data-datatable-action="selInUsrDelete" title="선택 담당자 배정 제외" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1">
									<span>배정 제외</span><i class="fa fa-arrow-alt-circle-right osl-padding-r0 osl-padding-l05"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body kt-padding-10 osl-min-h-px--400">
						<div class="osl-datatable-search" data-datatable-id="prj1101ProcessAuthUsrTable"></div>
						<div class="kt_datatable" id="prj1101ProcessAuthUsrTable"></div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-12 col-sm-12">
				<div class="kt-portlet">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i>담당 대상 목록
								</h5>
							</div>
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-wrapper">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1101ProcessAuthNoneUsrTable" data-datatable-action="selAllUsrDelete" title="선택 담당자 배정 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1">
										<i class="fa fa-arrow-alt-circle-left"></i><span>배정 등록</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1101ProcessAuthNoneUsrTable" data-datatable-action="select" title="담당 대상 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
										<i class="fa fa-list"></i><span>조회</span>
									</button>
								</div>
							</div>
						</div>
						<div class="kt-portlet__body kt-padding-10">
							<div class="osl-datatable-search" data-datatable-id="prj1101ProcessAuthNoneUsrTable"></div>
							<div class="kt_datatable" id="prj1101ProcessAuthNoneUsrTable"></div>
						</div>
					</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1101SaveSubmit"><i class="fa fa-save"></i><span>완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLPrj1101Popup = function () {
	var formId = 'frPrj1101';
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//type
	var type = $("#type").val();
	
	//배정 담당자 중복 체크
	var prjAuthUsrIdList = [];
	
	//수정시 배정담당자 원본 데이터
	var prjAuthOriginalData = [];
	
	//수정인경우 대상 ID
	var paramPrjGrpId = $("#paramPrjGrpId").val();
	var paramPrjId = $("#paramPrjId").val();
	var paramProcessId = $("#paramProcessId").val();
	
    // Private functions
    var documentSetting = function () {
    	//문구 세팅 
    	$("#prj1101SaveSubmit > span").text($.osl.lang("modal."+type+".saveBtnString"));
    	
    	// 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"},
			{mstCd: "CMM00005", useYn: "Y",targetObj: "#processTransferCd", comboType:"OS"},
		];
		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
		//submit 동작
    	$("#prj1101SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj1101."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	//프로세스 저장
    	        	saveFormAction();
    	        }
    		});
    	});
		
		//데이터 테이블 세팅
    	datatableSetting();
		
    	
		//수정인경우 프로세스 정보 조회
		if(type == "update"){
			fnProcessInfoSelect();
		}
		
    };
    
    //프로세스 저장 (생성&수정)
    var saveFormAction = function() {
    	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	//추가된 담당자 목록
    	var authUsrList = $.osl.datatable.list["prj1101ProcessAuthUsrTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(authUsrList) && authUsrList.length > 0){
    		var usrIdList = [];
    		$.each(authUsrList, function(idx, map){
    			usrIdList.push({licGrpId: map.licGrpId, authTypeCd: map.authTypeCd, usrId: map.usrId});
    		});
    		fd.append("usrIdList",JSON.stringify(usrIdList));
    	}

    	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1100/savePrj1100ProcessInfoAjax.do'/>", "async": true,"contentType":false,"processData":false ,"cache":false},fd);
    	
   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//등록 성공
   				$.osl.toastr(data.message);
   				
   				//모달 창 닫기
   				$.osl.layerPopupClose();
   				
   				//datatable 조회
   				if($.osl.datatable.list.hasOwnProperty("prj1100PrjTable")){
	   				$.osl.datatable.list["prj1100PrjTable"].targetDt.reload();
   				}
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
    };
    
    //담당자 배정, 미 배정 목록
    var datatableSetting = function(){
    	//사용자 배정 정보 datatable 세팅
		$.osl.datatable.setting("prj1101ProcessAuthUsrTable",{
			data: {
				type:'local',
				serverSorting: false,
				serverPaging: false,
				source: [],
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
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true,
			},
			actionTooltip:{
				"dblClick": "담당자 배정 제외"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
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
					}
				},
				"reset": function(rowData, datatableId, type, rownum, elem){
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					//데이터 초기화
					datatable.dataSet = [];
					datatable.originalDataSet = [];
					prjAuthUsrIdList = [];
					
					//원본데이터 있는경우
					if(prjAuthOriginalData.length > 0){
						$.each(prjAuthOriginalData, function(idx, map){
			   				//담당자 배정 목록 추가
			   				datatable.dataSet.push(map);
							datatable.originalDataSet.push(map);
							
							//중복체크 추가
							prjAuthUsrIdList.push(map.usrId);
		   				});
					}
					
					//데이터 추가
					datatable.insertData();
					//데이터테이블 재 조회
					datatable.reload();
				},
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					//사용자 배정 처리
					fnAllUsrDelete(rowDatas);
				},
				//선택 사용자 배정 제외
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("common.user.auth.allUsrInDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							//사용자 배정 제외 처리
							fnAllUsrDelete(rowDatas);
						}
					});
				}
			}
		});
		
		//사용자 미 배정 정보 datatable 세팅
		$.osl.datatable.setting("prj1101ProcessAuthNoneUsrTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1100/selectPrj1100ProcessAuthNoneUsrListAjax.do"
					}
				},
				pageSize: 4,
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100],
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet: {
								layout: 'compact'
							}
						}
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'authTypeNm', title: '분류', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "PRJ00018", searchField:"authTypeCd", sortField: "authTypeCd"},
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 130, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true, sortable: false},
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
			],
			actionBtn:{
				"title": "배정",
				"update": false,
				"delete": false,
				"dblClick": true,
				"lastPush": false,
			},
			actionTooltip:{
				"dblClick": "담당자 등록"
			},
			theme:{
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-left",
				}
			},
			rows:{
				beforeTemplate: function (row, data, index){
					//이미 배정된 사용자인경우
					if(prjAuthUsrIdList.indexOf(data.usrId) > -1){
						row.addClass("osl-datatable__row-assign--none");
					}
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					//사용자 배정 처리
					fnAllUsrInsert(rowDatas);
				},
				//선택 사용자 배정 등록
				"selAllUsrDelete": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("common.user.auth.allUsrInsert",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							//사용자 배정 처리
							fnAllUsrInsert(rowDatas);
						}
					});
				}
			}
		});
	};
	//담당자 배정 등록
	var fnAllUsrInsert = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			//대상 데이터 테이블
			var datatable = $.osl.datatable.list["prj1101ProcessAuthUsrTable"].targetDt;
			
			//dataSet 비어있는 경우 초기화
			if($.osl.isNull(datatable.dataSet)){
				datatable.dataSet = [];
				datatable.originalDataSet = [];
			}
			
			//이미 추가된 사용자 목록
			var usrIdDupleList = 0;
			
			//데이터 테이블에 담당자 배정 추가
			$.each(selDatas, function(idx, map){
				//이미 추가된 사용자 목록 추가
				if(prjAuthUsrIdList.indexOf(map.usrId) != -1){
					usrIdDupleList++;
					return true;
				}
				
				datatable.dataSet.push(map);
				datatable.originalDataSet.push(map);
				
				//중복체크 추가
				prjAuthUsrIdList.push(map.usrId);
			});
			
			//출력 메시지 세팅
			var toastrMsg = "";
			var toastrType = "success";
			if(selDatas.length > usrIdDupleList){
				toastrMsg += $.osl.lang("common.user.auth.saveMsg",(selDatas.length-usrIdDupleList));
			}
			if(usrIdDupleList > 0){
				//이미 추가된 메시지 있는 경우 </br>
				if(toastrMsg.length > 0){
					toastrMsg += "</br>";
				}
				toastrMsg += $.osl.lang("common.user.auth.saveDupleMsg",usrIdDupleList);
				toastrType = "warning";
			}
			//모든 사용자가 배정되있는 경우
			if(usrIdDupleList == selDatas.length){
				toastrMsg = $.osl.lang("common.user.auth.saveAllDupleMsg",usrIdDupleList);
				toastrType = "error";
				$.osl.toastr(toastrMsg,{type: toastrType});
				return false;
			}
			
			$.osl.toastr(toastrMsg,{type: toastrType});
			
			//데이터 추가
			datatable.insertData();
			//데이터테이블 재 조회
			datatable.reload();
			
			$.osl.datatable.list["prj1101ProcessAuthNoneUsrTable"].targetDt.reload();
			$("div.tooltip.show").remove();
		 }
	};
	
	//담당자 배정 제외
	var fnAllUsrDelete = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			//대상 데이터 테이블
			var datatable = $.osl.datatable.list["prj1101ProcessAuthUsrTable"].targetDt;
			
			//dataSet에서 제거
			var dataSet = datatable.dataSet;
			var originalDataSet = datatable.originalDataSet;
			
			if(!$.osl.isNull(dataSet)){
				//선택 데이터
				$.each(selDatas, function(idx, map){
					$.each(originalDataSet, function(dataIdx, dataMap){
						if($.osl.isNull(dataMap)){
							return true;
						}
						//해당 사용자 배정 제외
						else if(map.usrId == dataMap.usrId){
							originalDataSet.splice(dataIdx, 1);
							
							//중복체크 목록 제외
							prjAuthUsrIdList.splice(prjAuthUsrIdList.indexOf(map.usrId), 1);
							return false;
						}
					});
				});
				
				//데이터테이블 재 조회
				datatable.reload();
				
				$.osl.datatable.list["prj1101ProcessAuthNoneUsrTable"].targetDt.reload();
				$("div.tooltip.show").remove();
			}
		}
	};
	
	//프로세스 정보 조회
	var fnProcessInfoSelect = function(){
		//프로세스 정보 조회
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100ProcessInfoAjax.do'/>"}
				,{paramPrjGrpId: paramPrjGrpId, paramPrjId: paramPrjId, paramProcessId: paramProcessId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var processInfo = data.processInfo;
   				
   				$.osl.setDataFormElem(processInfo, formId);
   				$("#useCd").val(processInfo.useCd).trigger('change.select2');
   				$("#processTransferCd").val(processInfo.processTransferCd).trigger('change.select2');
   				
   				if(data.hasOwnProperty("processAuthList") && data.processAuthList.length > 0){
   					//원본 데이터 저장
					prjAuthOriginalData = data.processAuthList;
   						 
	   				//대상 데이터 테이블
	   				var datatable = $.osl.datatable.list["prj1101ProcessAuthUsrTable"].targetDt;
	   			
	   				//데이터테이블 error class 제거
	   				datatable.eq(0).removeClass("kt-datatable--error");
	   				
	   				$.each(data.processAuthList, function(idx, map){
		   				//담당자 배정 목록 추가
		   				datatable.dataSet.push(map);
						datatable.originalDataSet.push(map);
						
						//중복체크 추가
						prjAuthUsrIdList.push(map.usrId);
	   				});
					
					//데이터 추가
					datatable.insertData();
					//데이터테이블 재 조회
					datatable.reload();
					$.osl.datatable.list["prj1101ProcessAuthNoneUsrTable"].targetDt.reload();
   				}
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
	OSLPrj1101Popup.init();
});

	
</script>