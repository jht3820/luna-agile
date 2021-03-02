<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj3200">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
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
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj3001.label.upperDocId">상위 산출물 ID</span></label>
									<input type="text" class="form-control" placeholder="상위 산출물 ID" name="upperDocId" id="upperDocId" readonly="readonly">
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3001.label.upperDocNm">상위 산출물 명</span></label>
									<input type="text" class="form-control" placeholder="상위 산출물 명" name="upperDocNm" id="upperDocNm" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docId">산출물 ID</span></label>
									<input type="text" class="form-control" placeholder="산출물 ID" name="docId" id="docId" value="${param.docId }"  readonly="readonly">
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docNm">산출물 명</span></label>
									<input type="text" class="form-control" placeholder="산출물 명" name="docNm" id="docNm" minlength="2" maxlength="100"  readonly="readonly">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fas fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docEdDtm">산출물 마감일</span></label>
									<input type="text" class="form-control" placeholder="산출물 마감일" name="docEdDtm" id="docEdDtm" readonly="readonly">
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docOrd">순번</span></label>
									<input type="number" class="form-control" placeholder="순번" name="ord" id="ord"  readonly="readonly">
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12">
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj3001.label.signUseCd">결재 사용유무</span></label>
									<input class="form-control" placeholder="결재 사용 유무" id="signUseNm" name="signUseNm"  readonly="readonly">
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docUseCd">사용유무</span></label>
									<input class="form-control" placeholder="사용 유무" id="useNm" name="useNm"  readonly="readonly">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docDesc">비고</span></label>
									<div class="form-control h-100 osl-min-height--12rem" id="docDesc"></div>
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
								<i class="fa fa-th-large kt-margin-r-5"></i>산출물 신규 연결 목록
							</h5>
						</div>
						<div class="kt-portlet__head-toolbar">
							<div class="kt-portlet__head-wrapper">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj3200PrjConTable" data-datatable-action="selConTargetDelete" title="선택 연결 대상 해제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="1" id="prj3200PrjConDelete">
									<span>연결 해제</span><i class="fa fa-arrow-alt-circle-right osl-padding-r0 osl-padding-l05"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body kt-padding-10 osl-min-h-px--400">
						<div class="osl-datatable-search" data-datatable-id="prj3200PrjConTable"></div>
						<div class="kt_datatable" id="prj3200PrjConTable"></div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-12 col-sm-12">
				<div class="kt-portlet">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i>산출물 연결 대상 목록
								</h5>
							</div>
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-wrapper">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj3200PrjConTargetTable" data-datatable-action="selTargetInsert" title="선택 연결 대상 배정 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="prj3200PrjConTargetInsert">
										<i class="fa fa-arrow-alt-circle-left"></i><span>연결 등록</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj3200PrjConTargetTable" data-datatable-action="select" title="연결 대상 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
										<i class="fa fa-list"></i><span>조회</span>
									</button>
								</div>
							</div>
						</div>
						<div class="kt-portlet__body kt-padding-10">
							<div class="osl-datatable-search" data-datatable-id="prj3200PrjConTargetTable"></div>
							<div class="kt_datatable" id="prj3200PrjConTargetTable"></div>
						</div>
					</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj3200SaveSubmit"><i class="fa fa-save"></i><span>완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLPrj1004Popup = function () {
	var formId = 'frPrj3200';
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//docId
	var docId = $('#docId').val();
	
	//type
	var type = $("#type").val();
	
	//산출물 연결 중복체크
	var prjConDocIdList = [];
	
	//프로젝트 ID
	var dtParamPrjId = $("#dtParamPrjId").val();
	
    // Private functions
    var documentSetting = function () {
    	
    	//문구 세팅 
    	$("#prj3200SaveSubmit > span").text($.osl.lang("prj3200.insert.saveBtnString"));
    	
		//submit 동작
    	$("#prj3200SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj3200.insert.saveString"),null,function(result) {
    	        if (result.value) {
    	        	//연결정보 저장
    	        	saveFormAction();
    	        }
    		});
    	});
		
		//산출물 데이터 세팅
    	selectDocInfo();
		
		//데이터 테이블 세팅
    	datatableSetting();
		
    };
    
    //연결 정보 저장
    var saveFormAction = function() {
    	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	//추가된 산출물 연결 목록
    	var DocConList = $.osl.datatable.list["prj3200PrjConTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(DocConList) && DocConList.length > 0){
    		var targetIdList = [];
    		$.each(DocConList, function(idx, map){
    			targetIdList.push({licGrpId: map.licGrpId, prjId: map.prjId, targetCd: map.targetCd, targetId: map.targetId, docId: docId});
    		});
    		fd.append("targetIdList",JSON.stringify(targetIdList));
    	}
		
    	console.log('?')
    	console.log($('#docId').val())
    	console.log(fd.targetIdList)
    	
    	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj3000/prj3200/insertPrj3200DocConInfo.do'/>", "async": true,"contentType":false,"processData":false ,"cache":false, "loadingShow": false},fd);
    	 $.osl.showLoadingBar(true,{target: "#frPrj3200", message: "산출물 정보를 연결중입니다.</br>잠시만 기다려주세요."});
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
   				$("button[data-datatable-id=prj3200PrjTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		ajaxObj.setFnComplete(function(data){
   			$.osl.showLoadingBar(false,{target: "#frPrj3200"});
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
    };
    
    /**
	 * function 명 	: selectDocInfo
	 * function 설명	: 선택한 산출물의 상세정보를 조회하여 화면에 세팅한다.
	 * @param docId : 선택한 산출물 ID
	 */
	var selectDocInfo = function() {
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj3000/prj3000/selectPrj3000DocInfoAjax.do'/>", "async": false}
				,{"docId": docId}); 
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				$("#"+formId)[0].reset();
				
				// 조직 정보 세팅
		    	$.osl.setDataFormElem(data.docInfoMap,"frPrj3200", ["upperDocId", "upperDocNm", "docId", "docNm", "docEdDtm", "ord", "useNm", "signUseNm"]);
			
		    	var docDesc = data.docInfoMap.docDesc;
				
		    	//상위 산출물 없을 경우
		    	if($.osl.isNull(data.docInfoMap.upperDocId)){
		    		$("#upperDocId").val("-");
		    	}
		    	
		    	//상위 산출물 없을 경우
		    	if($.osl.isNull(data.docInfoMap.upperDocNm)){
		    		$("#upperDocNm").val("-");
		    	}
		    	
				// 산출물 마감일 없을 경우
				if($.osl.isNull(data.docInfoMap.docEdDtm)){
					$("#docEdDtm").val("-");
				}
				
				// 산출물 비고 있을 경우
				if(!$.osl.isNull(docDesc)){
					docDesc =  $.osl.escapeHtml(docDesc);
			    	// 비고 값 div영역에 세팅
					$("#docDesc").html(docDesc.replace(/\n/g, '<br/>'));
				}
				
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
    
    //산출물 연결, 연결 대상 목록
    var datatableSetting = function(){
    	
    	//사용자 배정 정보 datatable 세팅
		$.osl.datatable.setting("prj3200PrjConTable",{
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
				{field: 'targetTypeNm', title: '구분', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "PRJ00022", searchField:"targetCd"},
				{field: 'targetNm', title: '대상 명', textAlign: 'left', width: 200, search: true},
			],
			rows:{
				clickCheckbox: true
			},
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
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					//사용자 배정 처리
					fnAllUsrDelete(rowDatas);
				},
				//선택 사용자 배정 제외
				"selConTargetDelete": function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj3200.allDocConDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							//사용자 배정 제외 처리
							fnAllUsrDelete(rowDatas);
						}
					});
				}
			}
		});
		
    	
		//산출물 연결 대상 정보 datatable 세팅
		$.osl.datatable.setting("prj3200PrjConTargetTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj3000/prj3200/selectPrj3200DocConTargetListAjax.do",
						params:{
							docId: docId
						}
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
				{field: 'targetTypeNm', title: '구분', textAlign: 'left', width: 80, search: true, searchType:"select", searchCd: "PRJ00022", searchField:"targetCd"},
				{field: 'targetNm', title: '대상명', textAlign: 'left', width: 160, search: true},
				{field: 'RegUsrNm', title: '등록자 명', textAlign: 'center', width: 100, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.regUsrId, row.regUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.regUsrId);
					}
				}
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
				clickCheckbox: true,
				beforeTemplate: function (row, data, index){
					//이미 배정된 사용자인경우
					if(prjConDocIdList.indexOf(data.targetId) > -1){
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
				"selTargetInsert": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj3200.allDocConInsert",rowDatas.length),{html:true}, function(result){
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
			var datatable = $.osl.datatable.list["prj3200PrjConTable"].targetDt;
			
			//dataSet 비어있는 경우 초기화
			if($.osl.isNull(datatable.dataSet)){
				datatable.dataSet = [];
				datatable.originalDataSet = [];
			}
			
			//이미 연결된 대상 목록
			var targetIdDupleList = 0;

			//데이터 테이블에 담당자 배정 추가
			$.each(selDatas, function(idx, map){
				//이미 추가된 사용자 목록 추가
				if(prjConDocIdList.indexOf(map.targetId) != -1){
					targetIdDupleList++;
					return true;
				}
				
				datatable.dataSet.push(map);
				datatable.originalDataSet.push(map);
				
				//중복체크 추가
				prjConDocIdList.push(map.targetId);
			});
			
			//출력 메시지 세팅
			var toastrMsg = "";
			var toastrType = "success";
			if(selDatas.length > targetIdDupleList){
				toastrMsg += $.osl.lang("prj3200.insert.saveMsg",(selDatas.length-targetIdDupleList));
			}
			if(prjConDocIdList > 0){
				//이미 추가된 메시지 있는 경우 </br>
				if(toastrMsg.length > 0){
					toastrMsg += "</br>";
				}
				toastrMsg += $.osl.lang("prj3200.insert.saveDupleMsg",targetIdDupleList);
				toastrType = "warning";
			}
			//모든 사용자가 배정되있는 경우
			if(prjConDocIdList == selDatas.length){
				toastrMsg = $.osl.lang("prj3200.insert.saveAllDupleMsg",targetIdDupleList);
				toastrType = "error";
			}
			
			$.osl.toastr(toastrMsg,{type: toastrType});
			
			//데이터 추가
			datatable.insertData();
			//데이터테이블 재 조회
			datatable.reload();
			
			$.osl.datatable.list["prj3200PrjConTargetTable"].targetDt.reload();
			$("div.tooltip.show").remove();
		 }
	};
	
	//담당자 배정 제외
	var fnAllUsrDelete = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			//대상 데이터 테이블
			var datatable = $.osl.datatable.list["prj3200PrjConTable"].targetDt;
			
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
						else if(map.targetId == dataMap.targetId){
							originalDataSet.splice(dataIdx, 1);
							
							//중복체크 목록 제외
							prjConDocIdList.splice(prjConDocIdList.indexOf(map.targetId), 1);
							return false;
						}
					});
				});
				
				//데이터테이블 재 조회
				datatable.reload();
				
				$.osl.datatable.list["prj3200PrjConTargetTable"].targetDt.reload();
				$("div.tooltip.show").remove();
			}
		}
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
	OSLPrj1004Popup.init();
});

	
</script>