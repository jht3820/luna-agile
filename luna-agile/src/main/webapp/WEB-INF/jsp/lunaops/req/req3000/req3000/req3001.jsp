<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- begin page DOM -->
<form class="kt-form" id="frReq3001">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="prjId" id="prjId" value="${param.paramPrjId}">
	<input type="hidden" name="prjGrpId" id="prjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="reqGrpUsrId" id="reqGrpUsrId" value="${param.paramReqGrpUsrId}">
	<input type="hidden" name="reqGrpChargerId" id="reqGrpChargerId" value="${param.paramReqGrpChargerId}">
	<input type="hidden" name="reqGrpId" id="reqGrpId" value="${param.paramReqGrpId}">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<input type="hidden" name="oriAtchFileId" id="oriAtchFileId">
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="form-group">
								<label><i class="fas fa-sort-amount-down kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpNo">그룹 요구사항 번호</span></label>
								<input type="text" class="form-control" id="reqGrpNo" name="reqGrpNo">
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpUsr">요청자</span></label>
								<div class="input-group">
									<input type="text" class="form-control" id="reqGrpUsrNm" name="reqGrpUsrNm" required="required">
									<button type="button" class="btn btn-brand input-group-append" id="searchUsrNmBtn" name="searchUsrNmBtn"><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
							<div class="form-group">
								<label class="required"><i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpCharger">그룹 요구사항 담당자</span></label>
								<div class="input-group">
									<input type="text" class="form-control" id="reqGrpChargerNm" name="reqGrpChargerNm" required="required">
									<button type="button" class="btn btn-brand input-group-append" id="searchChargerNmBtn" name="searchChargerNmBtn"><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpNm">그룹 요구사항 명</span></label>
								<input type="text" class="form-control" id="reqGrpNm" name="reqGrpNm" required="required">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpDesc">그룹 요구사항 내용</span></label>
								<textarea  name="reqGrpDesc" id="reqGrpDesc" required="required"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="form-group">
								<i class="fa fa-file-upload kt-margin-r-5"></i><span data-lang-cd="req3000.label.fileUpload">파일첨부</span>
								<button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn">
									<span data-lang-cd="req3000.button.deleteResetBtn">삭제 초기화</span>
								</button>
								<div class="kt-uppy" id="req3001FileUpload">
									<div class="kt-uppy__dashboard"></div>
									<div class="kt-uppy__progress"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__body">
					<label class="kt-padding-l-10 kt-padding-r-10"><i class="fas fa-stream kt-margin-r-5"></i><span data-lang-cd="req3000.label.linkedReqList">연결 요구사항 목록</span></label>
					<div class="row kt-padding-l-10 kt-padding-r-10 kt-margin-t-10">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="osl-datatable-search" data-datatable-id="req3001ConnectReqTable"></div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 text-right">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001ConnectReqTable" data-datatable-action="select" title="연결 요구사항 조회" data-title-lang-cd="datatable.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span data-lang-cd="req3000.button.select">조회</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001ConnectReqTable" data-datatable-action="selInReqDelete" title="연결 요구사항 제거" data-title-lang-cd="datatable.button.title.delete" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="selInReqDelete" tabindex="2">
								<i class="fa fa-minus"></i><span data-lang-cd="req3000.button.delete">제거</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001ConnectReqTable" data-datatable-action="reset" title="연결 요구사항 초기화" data-title-lang-cd="req3000.datatable.button.title.reset" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
								<i class="fa fa-edit"></i><span data-lang-cd="req3000.button.reset">초기화</span>
							</button>
						</div>
					</div>
					<div class="kt_datatable" id="req3001ConnectReqTable"></div>
				</div>
			</div>
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 osl-margin-t-1rm">
				<div class="kt-portlet__body">
					<label class="kt-padding-l-10 kt-padding-r-10 kt-margin-t-20"><i class="fas fa-stream kt-margin-r-5"></i><span data-lang-cd="req3000.label.unlinkedReqList">미연결 요구사항 목록</span></label>
					<div class="row kt-padding-l-10 kt-padding-r-10 kt-margin-t-10">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="osl-datatable-search" data-datatable-id="req3001UnconnectReqTable"></div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 text-right">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001UnconnectReqTable" data-datatable-action="select" title="미연결 요구사항 조회" data-title-lang-cd="datatable.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span data-lang-cd="req3000.button.select">조회</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001UnconnectReqTable" data-datatable-action="connect" title="미연결 요구사항 연결" data-title-lang-cd="req3000.datatable.button.title.connect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="connect" tabindex="2">
								<i class="fa kt-nav__link-icon flaticon2-expand"></i><span data-lang-cd="req3000.button.connect">연결</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001UnconnectReqTable" data-datatable-action="insert" title="미연결 요구사항 연결" data-title-lang-cd="datatable.button.title.insert" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="3">
								<i class="fa fa-plus"></i><span data-lang-cd="req3000.button.insert">추가</span>
							</button>
						</div>
					</div>
					<div class="kt_datatable" id="req3001UnconnectReqTable"></div>
				</div>
			</div>
		</div>
	</div>
	
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="req3000SaveSubmit"><span data-lang-cd="req3000.button.done">완료</span></button>
	<button type="button" class="btn btn-outline-brand"	data-dismiss="modal">
		<span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";

//파일업로드 셋팅
var OSLReq3001Popup = function () {
	var formId = 'frReq3001'
	
	var fileUploadObj;
	//edit 목록
	var formEditList = [];
	
	//atchfileId
   	var atchFileId = $("#atchFileId").val();	
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//연결 요구사항 중복체크
	var reqConnectedList = [];
	
	//수정시 연결 요구사항 원본 데이터
	var reqConnectedListOriginalData = [];
	
	//수정 중 삭제한 파일Sn 목록
	var uploadRemoveFiles = [];
	
	//type 수정 or 등록
	var type;
	
	//수정인경우 대상 그룹요구사항 정보
	var reqGrpNo = $("#reqGrpNo").val();
	var reqGrpNm = $("#reqGrpNm").val();
	
	var documentSetting = function(){
		
		//등록폼/수정폼 식별
		type = $("#type").val();
		
		//edit 세팅
    	formEditList.push($.osl.editorSetting("reqGrpDesc", {formValidate: formValidate}));
		
		
    	//파일 업로드 세팅
    	fileUploadObj = $.osl.file.uploadSet("req3001FileUpload",{
    		
    		url: '/req/req3000/req3000/insertReq3001ReqAtchFileInfo.do',
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": atchFileId, "fileSn": 0},
    		maxNumberOfFiles:20,
    		//파일 화이트리스트 설정
    		allowedFileTypes: ['.jpg', '.jpeg', '.png', '.gif',".pdf", ".hwp", ".docx", ".pptx", "txt",".csv", ".xlsx"],
    		
    		//파일 업로드 전 실행 함수
    		onBeforeUpload: function(files){
    			var rtnValue = files;
    			var uploadFiles = {};
    			if(type == "insert"){
    				//atchFileId 생성
    				$.osl.file.makeAtchfileId(function(data){
    					if(data.errorYn == "Y"){
	   						$.osl.toastr(data.message);
	   						rtnValue = [];
	   					}else{
	   						$("#atchFileId").val(data.atchFileIdString);
	   						atchFileId = data.atchFileIdString;
	   					 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
	   					 	
	   					 	
	   						//파일명 뒤에 ms 붙이기
	   	    				$.each(files, function(idx, map){
	   	    					map.meta.atchFileId = data.atchFileIdString;
	   	    					
	   	    					var jsonTmp = {};
	    						jsonTmp[map.id] = map;
	    						uploadFiles = $.extend(uploadFiles, jsonTmp);
	   	    				});
	   						
	   	    				rtnValue = uploadFiles;
	   	    				
	   						//그룹 요구사항 등록
	   						submitInsertAction();
	   					}
    				});
    				
    			}else{
    				//수정일시
    				atchFileId = $("#atchFileId").val();
    				if($.osl.isNull(atchFileId)){
    					//atchFileId 생성
    					$.osl.file.makeAtchfileId(function(data){
    						//atchFileId 생성 중 오류 발생 시
    						if(data.errorYn == "Y"){
    							$.osl.toastr(data.message);
    							rtnValue = [];
    						}else{
    							
    							//오류가 없을 경우 생성된 atchFileId를 저장
    							atchFileId = data.atchFileIdString;
    					
    							$("#atchFileId").val(atchFileId);
    						 	fileUploadObj.setMeta({atchFileId: atchFileId});
    						 	
    							//파일명 뒤에 ms 붙이기
    		    				$.each(files, function(idx, map){
    		    					if(map.source != "database"){
    	        						map.meta.atchFileId = atchFileId;
    	        						map.meta.source = map.source;
    	        						
    	        						var jsonTmp = {};
    	        						jsonTmp[map.id] = map;
    	        						uploadFiles = $.extend(uploadFiles, jsonTmp);
    	        					}
    		    				});
    						}
    					});
    				}else{
    					atchFileId = $("#atchFileId").val();
    					//atchFileId가 있는 경우 - 기존 파일 존재
        				//database 파일 제외하기
        				$.each(files, function(idx, map){
        					if(map.source != "database"){
        						map.meta.atchFileId = atchFileId;
        						map.meta.source = map.source;
        						
        						var jsonTmp = {};
        						jsonTmp[map.id] = map;
        						uploadFiles = $.extend(uploadFiles, jsonTmp);
        					}
        				});
    				}
    				//atchFileId 생성 및 목록 추린 후
    				rtnValue = uploadFiles;
    				
    				//요구사항 수정
					submitUpdateAction();
    			}
    		},
    		//uppy에 파일 업로드 할 때
    		onBeforeFileAdded: function(currentFile, files){
    			if(currentFile.source != "database" && currentFile.source != "remove"){
					var newNm = new Date().format("ssms")+"_"+currentFile.name;
					currentFile.name = newNm;
					currentFile.meta.name = newNm;
					currentFile.meta.atchFileId = $("#atchFileId").val();
					
	    			//fileSn default
	    			var fileSn = fileUploadObj.getState().meta.fileSn;
	    			currentFile.meta.fileSn = fileSn;
	    			fileUploadObj.setMeta({fileSn: (fileSn+1)});
				}
    		}
    	});
    	
    	//수정인 경우
    	if(type != "insert"){
    		
    		selectReqGrpInfo();
    		
    		//수정  파일 삭제 기록하기
    	   	fileUploadObj.on('file-removed', function(file) {
    	   		file["fileSn"] = file.meta.fileSn;
    	   		file.source = "remove";
    	   		uploadRemoveFiles.push(file);
    	   		//삭제 취소 버튼 활성화
    	   		$("#fileRemoveResetBtn").removeClass("d-none");
    		});
    	   	
    	   	//삭제 초기화 버튼 클릭 시 삭제한 파일 다시 추가
    	   	$("#fileRemoveResetBtn").click(function(){
    	   		$("#fileRemoveResetBtn").addClass("d-none");
    	   		
    	   		$.each(uploadRemoveFiles, function(idx, map){
    	   			fileUploadObj.addFile({
    	   			    name: map.name,
    	   			    type: map.type,
    	   			    source: 'database',
    	   			    meta: {
    	   			    	atchFileId: map.meta.atchFileId,
    	   			    	fileSn: map.meta.fileSn
    	   			    },
    	   				data: map.data,
      				});
    	   		});

	    		setTimeout(function(){
	    			//파일 preview에 click 이벤트 걸기
	    			$.each(fileUploadObj.getFiles(), function(idx, map){
	    				//database에 등록된 파일만 다운로드 가능
	    				if(map.source == "database"){
	    					var target = $("#uppy_"+$.escapeSelector(map.id)+" > .uppy-DashboardItem-preview");
	    					target.addClass("osl-cursor-pointer");
	    					target.off("click");
	    					target.click(function(){
	    						$.osl.file.fileDownload(map.meta.atchFileId, map.meta.fileSn);
	    					});
	    				}
	    			});
	    		},2000);
	    		
    	   		uploadRemoveFiles = [];
    		});
    	}
    	
    	//데이터 테이블 셋팅
    	datatableSetting();
    	
	}
	//연결, 미연결 요구사항 목록
	var datatableSetting = function(){
		// begin:: 연결 요구사항 데이터테이블
		$.osl.datatable.setting("req3001ConnectReqTable",{
			data: {
				type:'local',
				serverSorting: false,
				serverPaging: false,
				source: [],
				pageSize: 5
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100]
					}
				}
			},
			toolbar:{
				items:{
					pagination:{
						//그리드에 표출되는 row 개수
						pageSizeSelect : [5, 10, 20, 30, 50, 100],
						//페이지 그룹단위 변경
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title:"No.", textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjNm', title: '프로젝트 명', textAlign: 'left', width: 150, search:true, autoHide: false, sortable: false},	
				{field: 'reqOrd', title: '요구사항 번호', textAlign: 'left', width: 150, search:true,autoHide: false},
				{field: 'reqNm', title: '요구사항 명', textAlign: 'left', width: 150 , search:true, autoHide: false, sortable: false}
			],
			searchColumns:[
				
				{field: 'reqChargerNm', title: '담당자', searchOrd: 4},
				{field: 'reqUsrNm', title: '요청자', searchOrd: 5},
				{field: 'reqProType', title: '처리유형', searchOrd: 6, searchType:"select", searchCd:"REQ00001"},
				
			],
			actionBtn:{
				"title":"해제",
				"dblClick":true,
				"update":false,
				"delete":false,
			},
			actionFn:{
				"select":function(datatableId, elem){
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
				//연결해제
				"dblClick":function(rowData, datatableId, type, rownum, elem){
					var rowDatas = [];
					rowDatas.push(rowData);
					//그룹 요구사항 연결 해제 처리
					fnAllReqDelete(rowDatas);
					$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
				},
				"selInReqDelete":function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj2100.allUsrInDelete",rowDatas.length),null, function(result){
						if (result.value) {
							//연결 해제 처리
							fnAllReqDelete(rowDatas);
						}
					});
				},
				//초기화
				"reset": function(rowData, datatableId, type, rownum, elem){
					
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					//데이터 초기화
					datatable.dataSet = [];
					datatable.originalDataSet = [];
					reqConnectedList = [];
					
					//원본데이터 있는경우
					if(reqConnectedListOriginalData.length > 0){
						
						$.each(reqConnectedListOriginalData, function(idx, map){
							
			   				//담당자 배정 목록 추가
			   				datatable.dataSet.push(map);
							datatable.originalDataSet.push(map);
							
							//중복체크 추가
							reqConnectedList.push(map.reqId);
							
		   				});
					}
					//데이터 추가
					datatable.insertData();
					
					//데이터테이블 재 조회
					datatable.reload();
					
				}
			}
		});
		// end:: 연결 요구사항 데이터테이블

		// begin:: 미연결 요구사항 데이터테이블
		$.osl.datatable.setting("req3001UnconnectReqTable",{
			data: {
				source: {
					read: {
						url: "/req/req3000/req3000/selectReq3002ListAjaxView.do"
					}
				},
				pageSize:5,
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
				{field: 'rn', title:"No.", textAlign: 'center', width: 25, autoHide: false, sortable: false, autoHide: false},
				{field: 'prjNm', title: '프로젝트 명', textAlign: 'left', width: 150, search:true, autoHide: false, sortable: false},	
				{field: 'reqOrd', title: '요구사항 번호', textAlign: 'left', width: 150, search:true, autoHide: false },
				{field: 'reqNm', title: '요구사항 명', textAlign: 'left', width: 150 , search:true, autoHide: false, sortable: false}
			],
			searchColumns:[
				{field: 'reqUsrNm', title: '요청자', searchOrd: 5},
				{field: 'reqChargerNm', title: '담당자', searchOrd: 6},
				{field: 'reqProType', title: '처리유형', searchOrd: 7, searchType:"select", searchCd:"REQ00001"},
			],
			actionBtn:{
				"title":"연결",
				"dblClick":true,
				"update":false,
				"delete":false
			},
			rows:{
				beforeTemplate: function (row, data, index){
					//이미 연결된 요구사항인경우
					if(reqConnectedList.indexOf(data.reqId) > -1){
						row.addClass("osl-datatable__row-assign--none");
					}
				}
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalSize: "xl",
							modalTitle: $.osl.lang("req1001.title"),
							closeConfirm: false,
						};
					$.osl.layerPopupOpen('/req/req1000/req1000/selectReq1001View.do',data,options);
				},
				"dblClick":function(rowData,datatableId, type, rowNum){
					var rowDatas = [];
					rowDatas.push(rowData);
					//요구사항 연결 처리
					fnAllReqConnect(rowDatas);
					$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
				},
				//선택 요구사항 연결
				"connect":function(rowData, datatableId, type){
					var rowDatas = rowData;
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					//선택 요구사항 연결 처리 처리
					fnAllReqConnect(rowDatas);
					$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
				}
			}
		});
	};
	// end:: 미연결 요구사항 데이터테이블
	
	//요구사항 연결 등록
	var fnAllReqConnect = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			//대상 데이터 테이블
			var datatable = $.osl.datatable.list["req3001ConnectReqTable"].targetDt;	
		}
		
		//dataSet 비어있는 경우 초기화
		if($.osl.isNull(datatable.dataSet)){
			datatable.dataSet = [];
			datatable.originalDataSet = [];
		}
		
		//이미 연결된 요구사항 목록
		var reqDupleList = 0;
		
		//요구사항 연결 테이블에 요구사항 추가
		$.each(selDatas, function(idx, map){
			
			//이미 연결된 요구사항 목록 추가
			if(reqConnectedList.indexOf(map.reqId) != -1){
				reqDupleList++;
				return true;
			}
			
			datatable.dataSet.push(map);
			datatable.originalDataSet.push(map);
			
			//중복체크 추가
			reqConnectedList.push(map.reqId);
			
		});
		
		
		//출력 메시지 세팅
		var toastrMsg = "";
		var toastrType = "success";
		
		if(selDatas.length > reqDupleList){
			toastrMsg += $.osl.lang("req3000.insert.saveMsg",(selDatas.length-reqDupleList));
		}
		
		/* //모든 요구사항이 연결되있는 경우
		if(reqDupleList > 0){
			
			if(toastrMsg.length > 0){
				toastrMsg += "</br>";
			}
			toastrMsg += $.osl.lang("req3000.insert.saveAllDupleMsg",reqDupleList);
			toastrType = "warning";
		} */
		
		//이미 추가된 메시지 있는 경우 </br>
		if(reqDupleList == selDatas.length){
			
			toastrMsg = $.osl.lang("req3000.insert.saveDupleMsg",reqDupleList);
			toastrType = "error";
			
		}
		
		$.osl.toastr(toastrMsg,{type: toastrType});
		
		//데이터 추가
		datatable.insertData();
		
		//데이터테이블 재 조회
		datatable.reload();
		
		$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
		$("div.tooltip.show").remove(); 
		
	};
	
	//요구사항 연결해제
	var fnAllReqDelete = function(selDatas){
		
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			//대상 데이터 테이블
			var datatable = $.osl.datatable.list["req3001ConnectReqTable"].targetDt;
			
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
						else if(map.reqId == dataMap.reqId){
							originalDataSet.splice(dataIdx, 1);
							
							//중복체크 목록 제외
							reqConnectedList.splice(reqConnectedList.indexOf(map.reqId), 1);
							return false;
						}
					});
				});
				
				//데이터테이블 재 조회
				datatable.reload();
				
				$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
				$("div.tooltip.show").remove();
				
			}
		}
	};
	
	/**
	 * 	그룹 요구사항 정보 조회
	*/
    var selectReqGrpInfo = function(){
    	var data = {
    			prjGrpId: $("#prjGrpId").val(),
    			prjId: $("#prjId").val(),
    			reqGrpId: $("#reqGrpId").val()
    	}
    	//Ajax 설정
    	var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req3000/req3000/selectReq3000ReqInfoAjax.do'/>", "async":"true"}
				,data);
    	//Ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
				
			}else{
				
				//요구사항 정보 세팅
		    	$.osl.setDataFormElem(data.reqInfoMap,"frReq3000");
				
				//그룹요구사항 정보 세팅
		    	$("#reqGrpChargerNm").val(data.reqInfoMap.reqGrpChargerNm);
		    	$("#reqGrpUsrNm").val(data.reqInfoMap.reqGrpUsrNm);
		    	$("#reqGrpNo").val(data.reqInfoMap.reqGrpNo);
		    	$("#reqGrpDesc").val(data.reqInfoMap.reqGrpDesc);
		    	$("#reqGrpNm").val(data.reqInfoMap.reqGrpNm);
		    	
		    	$("#atchFileId").val(data.reqInfoMap.atchFileId);
		    	$("#oriAtchFileId").val(data.reqInfoMap.atchFileId);
		    	
		    	//edit 세팅
		    	formEditList.push($.osl.editorSetting("reqGrpDesc", {formValidate: formValidate, disableResizeEditor: false}));
		    	
		    	//파일Sn넣기
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	//파일 목록 세팅
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
		    	
		    	
		    	//연결된 요구사항 테이블에 저장
		    	if(data.reqGrpConList.length > 0){
		    		
   					//원본 데이터 저장
					reqConnectedListOriginalData = data.reqGrpConList;
   						 
	   				//대상 데이터 테이블
	   				var datatable = $.osl.datatable.list["req3001ConnectReqTable"].targetDt;
	   			
	   				//데이터테이블 error class 제거
	   				datatable.eq(0).removeClass("kt-datatable--error");
	   				
	   				$.each(data.reqGrpConList, function(idx, map){
		   				//담당자 배정 목록 추가
		   				datatable.dataSet.push(map);
						datatable.originalDataSet.push(map);
						
						//중복체크 추가
						reqConnectedList.push(map.reqId);
	   				});
	   				
	   				
	   				//중복제거
					var dataSet = new Set(datatable.dataSet);
					var originalDataSet = new Set(datatable.originalDataSet);
					datatable.dataSet = Array.from(dataSet);
					datatable.originalDataSet = Array.from(originalDataSet);
					
					//데이터 추가
					datatable.insertData();
					//데이터테이블 재 조회
					datatable.reload();
					
					$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
					
   				}
			}
    	});
		
		//AJAX 전송
		ajaxObj.send();
    }
	//atchFileId 생성 완료 시 그룹 요구사항 등록 시작
	var submitInsertAction = function(paramActhFileId){
		
		var form = $('#'+formId);
		
		//폼 유효 값 체크
		if(!form.valid()){
			return;
		}
		
		if($.osl.isNull($("#reqGrpUsrId").val())||$("#reqGrpUsrId").val() == ""){
			$.osl.alert($.osl.lang("req3000.alert.checkUsrId"));
			return;
		}
		
		if($.osl.isNull($("#reqGrpChargerId").val())||$("#reqGrpChargerId").val() == ""){
			$.osl.alert($.osl.lang("req3000.alert.checkChargerId"));
			return;
		}
		
		$("#prjGrpId").val($.osl.selPrjGrpId);
		
		//formData
   		var fd = $.osl.formDataToJsonArray(formId);
		
		fd.append("reqGrpDescNotBr", $("#reqGrpDesc").val());
		//연결된 요구사항 목록
    	var reqGrpLinkReqList = $.osl.datatable.list["req3001ConnectReqTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(reqGrpLinkReqList) && reqGrpLinkReqList.length > 0){
    		var reqIdList = [];
    		$.each(reqGrpLinkReqList, function(idx, map){
    			reqIdList.push({prjId:map.prjId, reqId: map.reqId, reqLinkOrd:map.rn});
    		});
    		fd.append("reqGrpLinkReqList",JSON.stringify(reqIdList));	
    	}
    	
    	
       	//파일 목록 추가하기 (수정이력 관리)
       	fd.append("fileHistory",JSON.stringify(fileUploadObj.getFiles()));
		
      	//파일명 뒤에 ms 붙이기
		$.each(fileUploadObj.getFiles(), function(idx, map){
			map.meta.atchFileId = $("#atchFileId").val();
			
			fd.append("file",map);
		});
      
		
   		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req3000/req3000/insertReq3001ReqGrpInfoAjax.do'/>"
   			, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);
		
   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//등록 성공
   				$.osl.toastr(data.message);

   				//모달 창 닫기
   				$.osl.layerPopupClose();
   				
   				//테이블 리로드
   		   		$.osl.datatable.list["req3000Table"].targetDt.reload();
   			}
   		});
   		
  		//AJAX 전송
   		ajaxObj.send();
   		
      
	}
	

	//그룹 요구사항 수정 시작
    var submitUpdateAction = function(){
		var form = $('#'+formId);    		
    	
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		if($.osl.isNull($("#reqGrpUsrId").val())||$("#reqGrpUsrId").val() == ""){
			$.osl.alert($.osl.lang("req3000.alert.checkUsrId"));
			return;
		}
		
		if($.osl.isNull($("#reqGrpChargerId").val())||$("#reqGrpChargerId").val() == ""){
			$.osl.alert($.osl.lang("req3000.alert.checkChargerId"));
			return;
		}
		
       	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
       	
   		//연결된 요구사항 목록
   		var reqGrpLinkReqList = $.osl.datatable.list["req3001ConnectReqTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(reqGrpLinkReqList) && reqGrpLinkReqList.length > 0){
    		var reqIdList = [];
    		$.each(reqGrpLinkReqList, function(idx, map){
    			reqIdList.push({prjId:map.prjId, reqId: map.reqId, reqLinkOrd:map.rn});
    		});
    		fd.append("reqGrpLinkReqList",JSON.stringify(reqIdList));	
    	}
       	
       	//파일 목록 추가하기 (수정이력 관리)
       	var uploadFileList = [];
       	$.each(fileUploadObj.getFiles(), function(idx, map){
       		if(!map.hasOwnProperty("source") || map.source == "database"){
       			return true;
       		}
       		uploadFileList.push(map);
       	});
       	
       	uploadFileList = uploadFileList.concat(uploadRemoveFiles);
       	
		console.log(uploadFileList);
		
       	//파일 정보
       	fd.append("fileHistory",JSON.stringify(uploadFileList));
       	
   		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req3000/req3000/updateReq3001ReqInfoAjax.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//수정 성공
   				$.osl.toastr(data.message);

   				//모달 창 닫기
   				$.osl.layerPopupClose();
   				
   				//리로드
   		   		$.osl.datatable.list["req3000Table"].targetDt.reload();
   			}
   		});
   		
	   	//AJAX 전송
	   	ajaxObj.send();
   		
   		
    };
    
  	//요청자 명 검색버튼 클릭 시
	$("#searchUsrNmBtn").click(function(){
		var data = {
				usrNm : $("#reqGrpUsrNm").val()
		};
		var options = {
				modalTitle:$.osl.lang("req3000.title.selectUsr"),
				idKey: "searchUsr",
				closeConfirm: true,
				autoHeight:false,
				modalSize: "xl",
				callback:[{
					targetId: "selectUsr",
					actionFn: function(thisObj){
						var temp = OSLReq3003Popup.getUsrInfo();
						if(!$.osl.isNull(temp)){
							OSLReq3001Popup.setUsrInfo(temp);
						}
					}
				}]
		};
		$.osl.layerPopupOpen('/req/req3000/req3000/selectReq3003View.do',data,options);
	});
  	
	//담당자 명 검색버튼 클릭 시
	$("#searchChargerNmBtn").click(function(){
		var data = {
				usrNm : $("#reqGrpChargerNm").val()
		};
		var options = {
				modalTitle:$.osl.lang("req3000.title.selectCharger"),
				idKey: "searchUsr",
				closeConfirm: true,
				autoHeight:false,
				modalSize: "xl",
				callback:[{
					targetId: "selectUsr",
					actionFn: function(thisObj){
						var temp = OSLReq3003Popup.getUsrInfo();
						if(!$.osl.isNull(temp)){
							OSLReq3001Popup.setChargerInfo(temp);
						}
					}
				}]
		};
		$.osl.layerPopupOpen('/req/req3000/req3000/selectReq3003View.do',data,options);
	});
	
	$("#req3000SaveSubmit").click(function(){
		var form = $("#"+formId);
		
		//폼 유효값 체크
		if(!form.valid()){
			return;
		}
		
		
		$.osl.confirm($.osl.lang("req3000.confirm."+type),null,function(result) {
			if (result.value) {
	        	fileUploadObj.upload();
	        }	
		});
	})
	
	//요청자명을 수정했을 때 아이디 초기화
	$("#reqGrpUsrNm").change(function(){
		$("#reqGrpUsrId").val("");
	});
	
	//담당자명을 수정했을 때 아이디 초기화
	$("#reqGrpChargerNm").change(function(){
		$("reqGrpChargerId").val("");
	});
	
	//엔터키
	$("#reqGrpUsrNm").keydown(function(e){
		if(e.keyCode=='13'){
			//해당 값으로 검색화면 띄우기
			$("#searchUsrNmBtn").click();
		}
	});
	
	//엔터키
	$("#reqGrpChargerNm").keydown(function(e){
		if(e.keyCode=='13'){
			//해당 값으로 검색화면 띄우기
			$("#searchUsrNmBtn").click();
		}
	});
	
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        },setChargerInfo:function(temp){
    		var parseTemp = JSON.parse(temp);
    		//정보 입력하기
    		$("#reqGrpChargerNm").val(parseTemp.usrNm);
    		$("#reqGrpChargerId").val(parseTemp.usrId);
    	},setUsrInfo:function(temp){
    		var parseTemp = JSON.parse(temp);
    		//정보 입력하기
    		$("#reqGrpUsrNm").val(parseTemp.usrNm);
    		$("#reqGrpUsrId").val(parseTemp.usrId);
    	}
    };
    
   
    
}();

$.osl.ready(function(){
	OSLReq3001Popup.init();
});
</script>
<!-- end script -->
