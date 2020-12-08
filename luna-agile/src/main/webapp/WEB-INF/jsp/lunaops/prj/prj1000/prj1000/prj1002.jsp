<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1002">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="startDt" id="startDt">
	<input type="hidden" name="endDt" id="endDt">
	<div class="kt-portlet">
		<div class="kt-portlet__body kt-padding-15">
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required" for="prjNm"><i class="fa fa-edit kt-margin-r-5"></i><span>프로젝트 그룹명</span></label>
								<input type="text" class="form-control" placeholder="프로젝트 그룹명" name="prjNm" id="prjNm" opttype="-1" maxlength="100" required>
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
								<select class="form-control kt-select2" id="useCd" name="useCd" opttype="-1">
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required" for="ord"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>정렬 순서</span></label>
								<input type="number" class="form-control" placeholder="정렬 순서" name="ord" id="ord" value="1" opttype="-1" min="0" max="999" maxlength="3" required>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span>프로젝트 그룹 설명</span></label>
						<textarea class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="prjDesc" id="prjDesc" opttype="-1" maxlength="2000"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>프로젝트 그룹 담당 목록
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<c:if test="${param.type != 'insert' }">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1002PrjAuthUsrTable" data-datatable-action="reset" title="사용자 배정 목록 초기화" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-list"></i><span>초기화</span>
								</button>
							</c:if>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1002PrjAuthUsrTable" data-datatable-action="selInUsrDelete" title="선택 사용자 배정 제외" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="prj1002PrjAuthUsrInsert">
								<span>배정 제외</span><i class="fa fa-arrow-alt-circle-right osl-padding-r0 osl-padding-l05"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px--415 kt-padding-10">
					<div class="osl-datatable-search" data-datatable-id="prj1002PrjAuthUsrTable"></div>
					<div class="kt_datatable" id="prj1002PrjAuthUsrTable"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>담당 대상 목록
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1002PrjAuthNoneUsrTable" data-datatable-action="selAllUsrDelete" title="선택 사용자 배정 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="prj1002AuthGrpNoneUsrInsert">
								<i class="fa fa-arrow-alt-circle-left"></i><span>배정 등록</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1002PrjAuthNoneUsrTable" data-datatable-action="select" title="담당 대상 미 배정 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px--415 kt-padding-10">
					<div class="osl-datatable-search" data-datatable-id="prj1002PrjAuthNoneUsrTable"></div>
					<div class="kt_datatable" id="prj1002PrjAuthNoneUsrTable"></div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1002SaveSubmit"><i class="fa fa-check-square"></i><span>완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLPrj1002Popup = function () {
	var formId = 'frPrj1002';
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//type
	var type = $("#type").val();
	
	//배정 담당자 중복 체크
	var prjAuthUsrIdList = [];
	
	//수정시 배정담당자 원본 데이터
	var prjAuthOriginalData = [];
	
	//수정인경우 대상 프로젝트ID
	var paramPrjId = $("#paramPrjId").val();
	
    // Private functions
    var documentSetting = function () {
    	//문구 세팅 
    	$("#prj1002SaveSubmit > span").text($.osl.lang("prj1002."+type+".saveBtnString"));
    	
    	var today = new Date().format("yyyy-MM-dd");
    	//프로젝트 그룹 기간 최초 오늘 날짜 세팅
    	$("#startDt").val(today);
		$("#endDt").val(today);
		
    	//datepicker 세팅
		$.osl.date.daterangepicker($("#prjGrpRange"), {}, function(defaultConfig, start, end, label) {
			var startDt = new Date(start._d).format("yyyy-MM-dd");
			var endDt = new Date(end._d).format("yyyy-MM-dd");
			
			$("#startDt").val(startDt);
			$("#endDt").val(endDt);
		});

    	// 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} // 사용유무
		];
		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
		//submit 동작
    	$("#prj1002SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj1002."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	//프로젝트 그룹 저장
    	        	saveFormAction();
    	        }
    		});
    	});
		
		//데이터 테이블 세팅
    	datatableSetting();
		
		//수정인경우 프로젝트 그룹 정보 조회
		if(type == "update"){
			fnPrjGrpInfoSelect();
		}
		
    };
    
    //프로젝트 그룹 저장 (생성&수정)
    var saveFormAction = function() {
    	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	//추가된 담당자 목록
    	var authUsrList = $.osl.datatable.list["prj1002PrjAuthUsrTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(authUsrList) && authUsrList.length > 0){
    		var usrIdList = [];
    		$.each(authUsrList, function(idx, map){
    			usrIdList.push({licGrpId: map.licGrpId, authTypeCd: map.authTypeCd, usrId: map.usrId});
    		});
    		fd.append("usrIdList",JSON.stringify(usrIdList));
    	}
    	
    	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1000/savePrj1002PrjGrpInfo.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

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
   				$("button[data-datatable-id=prj1000PrjTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
    };
    
    //담당자 배정, 미 배정 목록
    var datatableSetting = function(){
    	//사용자 배정 정보 datatable 세팅
		$.osl.datatable.setting("prj1002PrjAuthUsrTable",{
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
					
					$.osl.confirm($.osl.lang("prj2100.allUsrInDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							//사용자 배정 제외 처리
							fnAllUsrDelete(rowDatas);
						}
					});
				}
			}
		});
		
		//사용자 미 배정 정보 datatable 세팅
		var prj1002AuthNoneUsrTable = $.osl.datatable.setting("prj1002PrjAuthNoneUsrTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1000/selectPrj1000PrjAuthNoneUsrListAjax.do",
						params:{
							prjAuthTypeCd: "01"
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
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 130, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 90, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 90, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 130, search: true, sortable: false},
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
					
					$.osl.confirm($.osl.lang("prj2100.allUsrInsert",rowDatas.length),{html:true}, function(result){
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
		if(selDatas != null && selDatas.length > 0){
			//대상 데이터 테이블
			var datatable = $.osl.datatable.list["prj1002PrjAuthUsrTable"].targetDt;
			
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
				toastrMsg += $.osl.lang("prj1002.insert.saveMsg",(selDatas.length-usrIdDupleList));
			}
			if(usrIdDupleList > 0){
				//이미 추가된 메시지 있는 경우 </br>
				if(toastrMsg.length > 0){
					toastrMsg += "</br>";
				}
				toastrMsg += $.osl.lang("prj1002.insert.saveDupleMsg",usrIdDupleList);
				toastrType = "warning";
			}
			//모든 사용자가 배정되있는 경우
			if(usrIdDupleList == selDatas.length){
				toastrMsg = $.osl.lang("prj1002.insert.saveAllDupleMsg",usrIdDupleList);
				toastrType = "error";
			}
			
			$.osl.toastr(toastrMsg,{type: toastrType});
			
			//데이터 추가
			datatable.insertData();
			//데이터테이블 재 조회
			datatable.reload();
			$.osl.datatable.list["prj1002PrjAuthNoneUsrTable"].targetDt.reload();
			$("div.tooltip.show").remove();
		 }
	};
	
	//담당자 배정 제외
	var fnAllUsrDelete = function(selDatas){
		if(selDatas != null && selDatas.length > 0){
			//대상 데이터 테이블
			var datatable = $.osl.datatable.list["prj1002PrjAuthUsrTable"].targetDt;
			
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
				$.osl.datatable.list["prj1002PrjAuthNoneUsrTable"].targetDt.reload();
				$("div.tooltip.show").remove();
			}
		}
	};
	
	//프로젝트 그룹 정보 조회
	var fnPrjGrpInfoSelect = function(deferred){
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
   				$("#prjGrpRange").data("daterangepicker").setStartDate(prjInfo.startDt);
   				$("#prjGrpRange").data("daterangepicker").setEndDate(prjInfo.endDt);
   				
   				if(data.prjAuthList.length > 0){
   					//원본 데이터 저장
					prjAuthOriginalData = data.prjAuthList;
   						 
	   				//대상 데이터 테이블
	   				var datatable = $.osl.datatable.list["prj1002PrjAuthUsrTable"].targetDt;
	   			
	   				//데이터테이블 error class 제거
	   				datatable.eq(0).removeClass("kt-datatable--error");
	   			
	   				$.each(data.prjAuthList, function(idx, map){
		   				//담당자 배정 목록 추가
		   				datatable.dataSet.push(map);
						datatable.originalDataSet.push(map);
						
						//중복체크 추가
						prjAuthUsrIdList.push(map.usrId);
	   				});
					
					//데이터 추가
					datatable.insertData();
					//데이터테이블 재 조회
					//datatable.reload();
					$.osl.datatable.list["prj1002PrjAuthNoneUsrTable"].targetDt.reload();
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
	OSLPrj1002Popup.init();
});

	
</script>