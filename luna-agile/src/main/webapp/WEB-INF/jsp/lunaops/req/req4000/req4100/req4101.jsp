<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frReq4101" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="changePrj" id="changePrj" value="<c:out value='${param.changePrj}'/>">
	<input type="hidden" name="reqId" id="reqId" value="<c:out value='${param.paramReqId}'/>">
	<input type="hidden" name="reqUsrId" id="reqUsrId" value="<c:out value='${param.paramReqUsrId}'/>">
	<input type="hidden" name="reqPrjId" id="reqPrjId" value="<c:out value='${param.paramPrjId}'/>">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<input type="hidden" name="oriAtchFileId" id="oriAtchFileId">
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" id="mainCol" name="mainCol">
			<div class="kt-portlet kt-portlet--collapsed" id="req4101RequestUsrInfo">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.title">요청자 정보</span>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-xl-2 kt-align-center">
							<a href="#" class="kt-media kt-media--xl kt-media--circle">
								<img type="img" id="usrImgId">
							</a>
						</div>
						<div class="col-xl-5">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.usrNm">요청자 이름</span></label>
								<div class="input-group">
									<input type="text" class="form-control" placeholder="요청자 이름" name="reqUsrNm" id="usrNm">
									<button type="button" class="btn btn-brand input-group-append" id="searchUsrNmBtn" name="searchUsrNmBtn"><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
								</div>
							</div>
						</div>
						<div class="col-xl-5">
							<div class="form-group">
								<label><i class="flaticon2-envelope kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.email">요청자 e-mail</span></label>
								<input type="text" class="form-control" placeholder="요청자 e-mail" name="reqUsrEmail" id="email" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-7">
							<div class="form-group">
								<label><i class="flaticon2-avatar kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.deptNm">요청자 소속</span></label>
								<input type="text" class="form-control" name="reqUsrDeptNm"placeholder="요청자 소속"  id="deptName" readonly="readonly">
								<input type="hidden" name="reqUsrDeptId" id="deptId">
							</div>
						</div>
						<div class="col-xl-5">
							<div class="form-group">
								<label><i class="flaticon2-phone kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.tel">요청자 연락처</span></label>
								<input type="text" class="form-control" placeholder="요청자 연락처" name="reqUsrNum" id="telno" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="kt-portlet kt-portlet--collapsed" id="req4101ReqGroupInfo">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa flaticon2-layers-1 kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">그룹 요구사항 정보</span>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<div class="kt-portlet__head-group">
								<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReq">그룹 요구사항</span></label>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="그룹 요구사항을 선택하세요" name="reqGroupNm" id="reqGroupNm" readonly="readonly">
							<button type="button" class="btn btn-brand input-group-append" id="selectReqGroupBtn" name="selectReqGroupBtn"><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
						</div>
					</div>
					<div class="form-group kt-margin-b-0">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqDesc">그룹 요구사항 내용</span></label>
						<textarea class="kt-hide" name="reqGroupDesc" id="reqGroupDesc" ></textarea>
					</div>
				</div>
			</div>
			<div class="kt-portlet">
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label for="exampleSelect1"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">프로젝트</span></label>
								<select class="form-control kt-select2" name="prjId" id="reqPrjSelect">
								</select>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDtm">요청 일자</span></label>
								<input type="date" class="form-control" placeholder="요청일" name="reqDtm" id="reqDtm" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqNm">요청 제목</span></label>
						<input type="text" class="form-control" placeholder="요청 제목" name="reqNm" id="reqNm" required>
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDesc">요청 내용</span></label>
						<textarea  class="kt-hide" name="reqDesc" id="reqDesc" required></textarea>
					</div>
					<div class="form-group kt-margin-b-10">
						<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
							<input type="checkbox" name="reqPwCheckbox" id="reqPwCheckbox">
							<span></span>
						</label>
						<span data-lang-cd="req4101.label.reqPw">요구사항 잠금</span>
					</div>
					<div class="kt-hide osl-bad_box" name="pwOption" id="pwOption">
				 		<div class="input-group kt-margin-b-10">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="req4101.label.password">PW</span></label>
				 			<input type="password" class="form-control" name="reqPw" id="reqPw"  regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexerrorstr="알파벳과 숫자 조합 4-12자 이내"  placeholder="알파벳과 숫자 조합 4-12자 이내"/> 
				 		</div>
				 		<div class="input-group">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="req4101.label.passwordCheck">PW 확인</span></label>
				 			<input type="password" class="form-control" name="reqPwCheck" id="reqPwCheck" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexerrorstr="알파벳과 숫자 조합 4-12자 이내"  placeholder="알파벳과 숫자 조합 4-12자 이내" equalTo="#reqPw"/>
			 			</div>
				 	</div>
					<div class="form-group kt-margin-t-25 form-group-last">
						<label>
							<i class="fa fa-file-upload kt-margin-r-5"></i>
							<span data-lang-cd="req4101.label.attachments">파일 첨부</span> 
							<button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn">
								<span data-lang-cd="req4101.button.deleteResetBtn">삭제 초기화</span>
							</button>
						</label>
						<div class="kt-uppy osl-max-h-px-260" id="req4101FileUpload">
							<div class="kt-uppy__dashboard"></div>
							<div class="kt-uppy__progress"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="kt-portlet kt-portlet--collapsed" data-ktportlet="true" id="req4101NewRequestOpt">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req4101.label.requestDefaultOptNm">접수 기본항목 입력</span>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<div class="kt-portlet__head-group">
								<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
				
				</div>
			</div>
		</div> <!-- col end -->
		<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12 kt-hide" id="subCol" name="subCol">
			<div class="kt-portlet kt-portlet--mobile">
				<div class="col-12">
					<div class="kt-portlet__head kt-portlet__head--lg kt-padding-10">
						<div class="kt-portlet__head-label">
							<h5 class="kt-font-boldest">
								<i class="fa flaticon2-open-box kt-margin-r-5"></i>
								<span data-lang-cd="req4101.prepData.title">선행처리 지식확인</span>
							</h5>
						</div>
						<div class="kt-portlet__head-toolbar">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-width-0 invisible" data-datatable-id="prepListTable" data-datatable-action="select" title="선행지식 조회" data-title-lang-cd="req4101.prepData.tooltip.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
							</button>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air btn-view-type active" title="카드형" data-title-lang-cd="req4101.prepData.tooltip.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2" data-view-type="01">
									<i class="fa fa-table osl-padding-r0"></i>
								</button>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="그리드형" data-title-lang-cd="req4101.prepData.tooltip.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex=3" data-view-type="02">
									<i class="fa fa-list osl-padding-r0"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body kt-padding-10" id="prepListDiv" name="prepListDiv">
					</div>
					<div class="kt-portlet__body kt-padding-10 kt_datatable" id="prepListTable" name="prepListTable">
					</div>
				</div>
			</div>
		</div> <!-- col end -->
	</div> <!-- row end -->
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="req4101SaveSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="req4101.complete">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>

<script>
"use strict";
var OSLReq4101Popup = function () {
	var formId = 'frReq4101';
	var dataTableId = 'prepListTable';
	//edit 목록
	var formEditList = [];
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);

	//atchfileId
	var atchFileId;

	//파일 업로드 세팅
	var fileUploadObj;
	
	//수정 중 삭제한 파일Sn 목록
	var uploadRemoveFiles = [];
	
	//선행처리 카드형
	var currentViewType = "01";

	//type
	var type;
	
	//비밀번호 기존 존재 여부
	var pw;
	
    // Private functions
    var documentSetting = function () {
    	
    	//프로젝트 목록 세팅
    	$("#reqPrjSelect").html($.osl.prjGrpAuthSelSetting(2,true));
    	
    	type = $("#type").val();
    	
    	//문구 세팅 
    	$("#req4101SaveSubmit > span").text($.osl.lang("req4101.button."+type+"Btn"));
    	
    	//Portlet 세팅
    	new KTPortlet('req4101RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4101ReqGroupInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4101NewRequestOpt', $.osl.lang("portlet"));
    	
    	//palceholder 세팅
		$("#usrNm").attr("placeholder",$.osl.lang("req4101.placeholder.usrNm"));
		$("#email").attr("placeholder",$.osl.lang("req4101.placeholder.email"));
		$("#deptName").attr("placeholder",$.osl.lang("req4101.placeholder.deptNm"));
		$("#telno").attr("placeholder",$.osl.lang("req4101.placeholder.tel"));
		
    	$("#reqGroupNm").attr("placeholder",$.osl.lang("req4101.placeholder.selectGroup"));
		$("#reqDtm").attr("placeholder",$.osl.lang("req4101.placeholder.reqDtm"));
		$("#reqNm").attr("placeholder",$.osl.lang("req4101.placeholder.reqNm"));
		$("#reqPw").attr("placeholder",$.osl.lang("req4101.placeholder.password"));
		$("#reqPwCheck").attr("placeholder",$.osl.lang("req4101.placeholder.password"));
		
		//regexerrorstr 세팅
		$("#reqPw").attr("regexerrorstr", $.osl.lang("req4101.regex.password"));
		$("#reqPwCheck").attr("regexerrorstr", $.osl.lang("req4101.regex.password"));
		
    	
    	//파일 업로드 세팅
    	fileUploadObj = $.osl.file.uploadSet("req4101FileUpload",{
    		url: '/req/req4000/req4100/insertReq4101ReqAtchFileInfo.do',
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": atchFileId, "fileSn": 0},
    		maxNumberOfFiles:20,
    		height: 260,
    		
    		//submit 전 실행 함수
    		onBeforeUpload: function(files){
    			var rtnValue = files;
    			var uploadFiles = {};
    			
    			if(type=="insert"){
    				//atchFileId 생성
    				$.osl.file.makeAtchfileId(function(data){
    					if(data.errorYn == "Y"){
    						$.osl.toastr(data.message);
    						rtnValue = [];
    					}else{
    						atchFileId = data.atchFileIdString;
    						$("#atchFileId").val(data.atchFileIdString);
    					 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
    					 
    						//파일명 뒤에 ms 붙이기
    	    				$.each(files, function(idx, map){
    	    					map.meta.atchFileId = data.atchFileIdString;
    	    					
    	    					var jsonTmp = {};
    							jsonTmp[map.id] = map;
    							uploadFiles = $.extend(uploadFiles, jsonTmp);
    	    				});
    						
	   						//요구사항 등록
	   						submitInsertAction();
	   					}
    				});
    			}else{ //수정 복사일 때
    				//atchFileId
    		    	atchFileId = $("#atchFileId").val();
    				//게시글의 atchFileId가 없는 경우 - 복사일 땐 미리 atchFileId를 비워 실행하도록 함
    				if(atchFileId==null || atchFileId==""){
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
    				if(type=="update"){
	    				//요구사항 수정
						submitUpdateAction();
    				}else if(type=="copy"){
   						//요구사항 등록(복사)
   						submitCopyAction();
    				}
    			}
			},
			//uppy에 파일 업로드 할 때
			onBeforeFileAdded: function(currentFile, files){
				if(type=="copy"){
					//복사일 때
					//복사할 때 불러온 파일인 경우 (삭제되지 않은 데이터 베이스 파일)
					if(currentFile.source != "remove"){
						//debugger;
						var newNm = new Date().format("ssms")+"_"+currentFile.name;
						currentFile.name = newNm;
						currentFile.meta.name = newNm;
						currentFile.meta.atchFileId = $("#atchFileId").val();
						
						if(currentFile.source == "Dashboard"){
			    			//fileSn default
			    			var fileSn = fileUploadObj.getState().meta.fileSn;
			    			fileUploadObj.setMeta({fileSn: (fileSn + 1)});
						}
					}
				}else{
					//등록 수정
					//추가로 등록한 파일인 경우(삭제되지 않은 업로드 파일)
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
			}
		});
    	
    	//기존 파일
		//fileUploadObj.setMeta({atchFileId: atchFileId});
    	if(type!="insert"){
    		//수정, 복사인경우 파일 삭제 기록하기
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
    	//검색어
    	var txt = $("#reqNm").val();
    	$.osl.datatable.setting(dataTableId,{
    		data : {
    			source:{
    				read:{
    					url:"/req/req4000/req4100/selectReq4100PrepListAjax.do",
    					params:{
    						searchDataTxt : txt
    					}
    				}
    			}
    		},
    		columns:[
    			{field:'rn', title:'No.', textAlign:'center', width: 50},
    			{field:'reqProTypeNm', title:'처리유형', textAlign:'center', width: 80},
    			{field:'reqOrd', title:'순번', textAlign:'left', width: 80, autoHide:false},
    			{field:'prjNm', title:'프로젝트명', textAlign:'left', width: 180},
    			{field:'reqNm', title:'요구사항명', textAlign:'left', width: 240, autoHide:false, search: true},
    			{field:'reqDtm', title:'요청일', textAlign:'center', width: 180},
    		],
    		actionBtn:{
    			title : $.osl.lang("req4101.prepData.button.detailBtn"),
    			width : 80,
    			"update" : false,
    			"delete" : false,
    			"dblClick" : true,
    		},
    		actionTooltip:{
    			"dblClick": $.osl.lang("req4101.prepData.button.detailBtn"),
    		},
    		actionFn:{
    			"dblClick":function(rowData){
					var data = {
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
					};
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("req4100.title.detailTitle"),
							closeConfirm: false
					};
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do', data, options);
    			}
    		},
   			toolbar:{
				items:{
					pagination:{
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 4
							},
							mobile:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					}
				}
    		},
    		callback:{
    			initComplete : function(evt, config){
					 viewTypeChange();
				 },
    			ajaxDone: function(evt, list, datatableInfo){
		    		if(txt.trim().length<2){
		    			//모달창 크기 변경
					   	//현재 창에서 모달 찾기
	   					$.each($(".modal.show"), function(idx, modalPop){
	   						//팝업된 모달 창 중에서 찾고자 하는 idkey를 가진 모달창 선택
	   						if(modalPop.getAttribute("data-idkey") == "req4100ReqTable"){
	   							//모달 크기 줄이고 그전 모달 크기 class 제거
	   							$(modalPop.children).addClass("modal-lg");
	   							$(modalPop.children).removeClass("modal-xl");
	   							//표출 화면 col 변경
	   							$("#mainCol").removeClass("col-xl-8");     
	   							$("#mainCol").addClass("col-xl-12");
	   							
	   							//선행처리 부분 숨기기
	   							$("#subCol").addClass("kt-hide");
	   						}
						});
		    		}else{
		    			//모달창 크기 변경
					   	//현재 창에서 모달 찾기
	   					$.each($(".modal.show"), function(idx, modalPop){
	   						//팝업된 모달 창 중에서 찾고자 하는 idkey를 가진 모달창 선택
	   						if(modalPop.getAttribute("data-idkey") == "req4100ReqTable"){
	   							//모달 크기 키우고 그전 모달 크기 class 제거
	   							$(modalPop.children).addClass("modal-xl");
	   							$(modalPop.children).removeClass("modal-lg");
	   							//표출 화면 col 변경
	   							$("#mainCol").addClass("col-xl-8");     
	   							$("#mainCol").removeClass("col-xl-12");
	   							
	   							//선행처리 부분 나타내기
	   							$("#subCol").removeClass("kt-hide");
	   						}
						});
		    		}    	
		    		
    				//카드형 출력
    				var resultStr = "<div class='osl-display__flex kt-margin-5'>";
    				if(list.length != 0){
    					resultStr +=	"<div><span data-lang-cd='req4101.prepData.result'>"+$.osl.lang("req4101.prepData.result")+"</span></div>"
										+ 	"<div class='osl-display__flex-r'><span data-lang-cd='req4101.preDatap.total'>"+$.osl.lang("req4101.prepData.total")+"</span>&nbsp;"+list[0].total+"&nbsp;<span data-lang-cd='req4101.prepData.count'>"+$.osl.lang("req4101.prepData.count")+"</span></div>"
									+	"</div>";
    				}else{
    					resultStr +=	"<div><span data-lang-cd='req4101.prepData.notResult'>"+$.osl.lang("req4101.prepData.notResult")+"</span></div>"
											+ 	"<div class='osl-display__flex-r'><span data-lang-cd='req4101.prepData.total'>"+$.osl.lang("req4101.prepData.total")+"</span>&nbsp;0&nbsp;<span data-lang-cd='req4101.prepData.count'>"+$.osl.lang("req4101.prepData.count")+"</span></div>"
										+	"</div>";
    				}
									
									
    				$.each(list, function(idx, row){
    					resultStr += "<div class='card osl-outline--brand kt-margin-t-5 kt-margin-b-5' data-req-id='"+row.reqId+"' data-prj-id='"+row.prjId+"' >"
										+	"<div class='card-header osl-req-prepList__font-bold osl-display__flex kt-padding-10'>"
											+	"<div class='kt-margin-r-5'>"
												+	"["+row.reqProTypeNm+"]"
											+	"</div>"
											+	"<div class='kt-margin-r-5'>"
												+	"["+row.reqOrd+"]"
											+	"</div>"
											+	"<div class='osl-display__flex-r'>"
												+	row.reqDtm
											+	"</div>"
										+	"</div>"
										+	"<div class='card-body kt-padding-10'>"
											+	"<div class='kt-font-sm kt-align-right'>"
												+	$.osl.escapeHtml(row.prjNm)
											+	"</div>"
											+	"<div class='kt-portlet kt-portlet--mobile kt-margin-0 kt-portlet--collapsed osl-remove__box-shadow' id='"+row.reqOrd.replace('-','')+"'>"
												+	"<div class='kt-portlet__head border-0 kt-padding-l-10 kt-padding-r-10'>"
													+	"<div class='kt-portlet__head-label'>"
														+	"<div class='kt-portlet__head-group'>"
															+	"<div class='osl-word__break osl-display--block osl-req-prepList__max-width'>"
																+	"<span class='osl-req__prepList-font__bold'>" +$.osl.lang("req4101.prepData.reqNm") +"&nbsp;:&nbsp;&nbsp; </span>"
																+ 	$.osl.escapeHtml(row.reqNm)
															+	"</div>"
														+	"</div>"
													+	"</div>"
													+	"<div class='kt-portlet__head-toolbar'>"
														+	"<a href='#' data-ktportlet-tool='toggle' class='btn btn-sm btn-icon btn-clean btn-icon-md'>"
															+	"<i class='la la-angle-down'></i>"
														+	"</a>"
													+	"</div>"
												+	"</div>"
												+	"<div class='kt-portlet__body kt-padding-10 border-top'>"
														+ $.osl.escapeHtml(row.reqDesc)
												+	"</div>"
												+	"<div class='kt-align-right'>"
													+	"<button type='button' class='btn btn-outline-brand btn-sm btn-font-sm kt-padding-5 detailBtn' title='"+$.osl.lang("req4101.prepData.tooltip.detailTooltip")+"' data-tatile-lang-cd='req4101.prepData.tooltip.detailTooltip' data-toggle='kt-tooltip' data-skin='brand' data-placement='top'>"
														+	"<i class='fa flaticon2-document'></i>"
														+	"<span data-lang-cd='req4101.prepData.button.detailBtn'>"+$.osl.lang("req4101.prepData.button.detailBtn")+"</span>"
													+	"</button>"
												+	"</div>"
											+	"</div>"
										+	"</div>"
									+	"</div>";   								
    				});
    				$("#prepListDiv").html(resultStr);
					$.each(list, function(idx, row){
						//Portlet 세팅
						new KTPortlet(row.reqOrd.replace('-',''), $.osl.lang("portlet"));
					});
					
					//상세보기 클릭 시
					$(".detailBtn").click(function(){
						var item = $(this).parents().parents().parents().parents();
						var data = {
								paramPrjId: item.data("prjId"),
								paramReqId: item.data("reqId"),
						};
						var options = {
								idKey: item.data("reqId"),
								modalTitle: $.osl.lang("req4100.title.detailTitle"),
								closeConfirm: false
						}
						$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do', data, options);
					});
    			}
    		}
    	});
    	
    	//뷰 변경 이벤트 - 카드형 그리드형 선택 확인
		$(".btn-view-type").click(function(){
			var viewType = $(this).data("view-type");
			
			//active 교체
			$(".btn-view-type.active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType = viewType;
			
			//뷰어 변경
			viewTypeChange();
		});
    	
    	//그룹 요구사항 선택 클릭 시
    	$("#selectReqGroupBtn").click(function(){
    		console.log("selectReqGroupBtn Click");
    		//그룹요구사항 검색 및 선택한 그룹요구사항 내용 가져오기
    	});
    	
    	//등록인경우
    	if(type == "insert"){
    		//요청자 정보 세팅 - default : 로그인 사용자
        	$.osl.setDataFormElem($.osl.user.userInfo,"frReq4101", ["usrNm","email","telno","deptName","deptId","usrImgId"]);
			
	    	//현재 날짜 지정
	    	$("#reqDtm").val(new Date().format("yyyy-MM-dd"));
	    	
	    	//edit 세팅
	    	formEditList.push($.osl.editorSetting("reqDesc", {formValidate: formValidate, disableResizeEditor: false, 'minHeight': 190}));
	    	formEditList.push($.osl.editorSetting("reqGroupDesc", {
	    		toolbar: false,
    			disableResizeEditor: false,
    			disableDragAndDrop: true,
    			disabledEditor: true,
    			height:180,
    		}));
	    	//edit 세팅하고 나서 textarea 보이기
	    	$("#reqDesc").removeClass("kt-hide");
	    	$("#reqGroupDesc").removeClass("kt-hide");
	    	
	    	//datepicker 세팅
			$.osl.date.datepicker($("#reqDtm"), {});
    	}else{
    		//수정 복사
    		//요구사항 정보 조회
    		selectReqInfo();
    	}
    	
    	//요청자 명에 포커스 될 때
    	$("#usrNm").focus(function(){
    		//관련 항목 모두 비우기
    		$("#reqUsrId").val("");
    		$("#usrNm").val("");
    		$("#email").val("");
    		$("#telno").val("");
    		$("#deptName").val("");
    		$("#deptId").val("");
    		$("#usrImgId").val(""); //이미지 default 넣기
    	});
   		
    	//포커스가 아웃될 경우
   		$("#usrNm").blur(function(){
   			//입력된 요청자 명이 있을 경우
   			if($("#usrNm").val()!=""){
   				//검색해서 이미 요청자 정보가 들어가 있는 경우(email로 확인)
   				if($("#email").val()!=""){
   					return;
   				}else{
		   			//해당 값으로 검색화면 띄우기
  					$("#searchUsrNmBtn").click();
   				}
   			}
   		});
    	
    	//요청자 명 검색버튼 클릭 시
    	$("#searchUsrNmBtn").click(function(){
    		var data = {
    				usrNm : $("#usrNm").val()
    		};
    		var options = {
    				idKey: "searchUsr",
					modalTitle: $.osl.lang("req4101.modalTitle.userSearch"),
					closeConfirm: true,
					autoHeight:false,
					modalSize: "xl",
					callback:[{
						targetId: "selectUsr",
						actionFn: function(thisObj){
							var temp = OSLReq4103Popup.getUsrInfo();
							if(temp != null && temp.length != 0){
								OSLReq4101Popup.setUsrInfo(temp);
							}
						}
					}]
    		};
    		$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4103View.do',data,options);
    	});
    	
    	//요구사항 잠금 기능
    	$("#reqPwCheckbox").click(function(){
    		if($("#reqPwCheckbox").is(":checked")==true){
    			//세부 속성 보이기
    			$("#pwOption").removeClass("kt-hide");
    		}else{
    			//세부 속성 숨기기
    			$("#pwOption").addClass("kt-hide");
    		}
    	});
    	
    	//제목에 텍스트 입력 시 이벤트
    	$("#reqNm").on("propertychange paste input", function(e){
    		txt = $(this).val();
    		//데이터 테이블 검색 조건 변경 - 강제
			$.osl.datatable.list[dataTableId].targetDt.setDataSourceParam("searchDataTxt",txt);
    		//데이터 테이블 조회
 			$("button[data-datatable-id=prepListTable][data-datatable-action=select]").click();
    	});
    	
    	//submit 동작
    	$("#req4101SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		
    		//요구사항 잠금 사용 시 패스워드 확인
    		if($("#reqPwCheckbox").is(":checked")==true){
    			if(pw!="Y"){
    				//기존에 비밀번호가 있던 경우가 아니라면
    				//잠금 사용했으나 비밀번호 미 입력 시
    				if($("#reqPw").val()==""){
    					$.osl.alert($.osl.lang("req4101.formCheck.passwordMessage"));
    					$("#reqPw").focus();
   						return false;
    				}
    			}
        	}
    		
    		$.osl.confirm($.osl.lang("req4101.saveString."+type+"Str"),null,function(result) {
    	        if (result.value) {
    	        	fileUploadObj.upload();
    	        }
    		});
    	});
    };
    
    /**
	 * 	요구사항 정보 조회
	 */
	 var selectReqInfo = function() {
    	var data = {
    			prjId :  $("#reqPrjId").val(),
    			reqId :  $("#reqId").val(),
    	};
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4100/selectReq4100ReqInfoAjax.do'/>", "async":"true"}
				,data);
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				//수정할때 호출
		    	$.osl.setDataFormElem(data.reqInfoMap,"frReq4101");
				
				//요청자 정보 세팅
		    	$("#reqUsrId").val(data.reqInfoMap.reqUsrId);
		    	$("#usrNm").val(data.reqInfoMap.reqUsrNm);
		    	$("#email").val(data.reqInfoMap.reqUsrEmail);
		    	$("#telno").val(data.reqInfoMap.reqUsrNum);
		    	$("#deptName").val(data.reqInfoMap.reqUsrDeptNm);
		    	$("#deptId").val(data.reqInfoMap.reqUsrDeptId);
		    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(data.reqInfoMap.reqUsrImgId));
		    	
		    	$("#reqPrjSelect").val($.osl.escapeHtml(data.reqInfoMap.prjId)).trigger('change.select2');
		    	
		    	if("Y"==$("#changePrj").val()){
			    	//프로젝트 그룹 수정할 수 있도록
		    		$("#reqPrjSelect").prop("disabled", false);
			    	//새로운 atchFileId를 등록해야 하므로
			    	$("#atchFileId").val("");
			    	//복사하려는 기존 atchFileId
			    	$("#oriAtchFileId").val(data.reqInfoMap.atchFileId);
				}else{
			    	$("#reqPrjSelect").prop("disabled", true);
			    	$("#oriAtchFileId").val(data.reqInfoMap.atchFileId);
				}
		    	
		    	//edit 세팅
		    	formEditList.push($.osl.editorSetting("reqDesc", {formValidate: formValidate, disableResizeEditor: false, 'minHeight': 190}));
		    	formEditList.push($.osl.editorSetting("reqGroupDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:180,
	    		}));
		    	//edit 세팅하고 나서 textarea 보이기
		    	$("#reqDesc").removeClass("kt-hide");
		    	$("#reqGroupDesc").removeClass("kt-hide");
		    	
		    	//datepicker 세팅
				$.osl.date.datepicker($("#reqDtm"), {});
		    	
		    	//요구사항 잠금 설정한 경우
		    	if(data.reqInfoMap.reqPw != null && data.reqInfoMap.reqPw != ""){
		    		$("#reqPwCheckbox").attr("checked", true);
		    		$("#pwOption").removeClass("kt-hide");
		    		pw = "Y";
		    		//비밀번호는 비우기
					$("#reqPw").val("");
					$("#reqPw").attr("placeholder",$.osl.lang("req4101.placeholder.nullPassword"));
					$("#reqPwCheck").attr("placeholder",$.osl.lang("req4101.placeholder.nullPassword"));
		    	}
		    
		    	//파일Sn넣기
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	//파일 목록 세팅
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
			}
		});
		
		//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err){
			data = JSON.parse(data);
			jAlert(data.message, "알림창");
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
    //atchFileId 생성 완료 시 요구사항 등록 시작
    var submitInsertAction = function(){
    	var form = $('#'+formId);    		
    	
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}

       	//formData
   		var fd = $.osl.formDataToJsonArray(formId);

       	//파일 목록 추가하기 (수정이력 관리)
       	fd.append("fileHistory",JSON.stringify(fileUploadObj.getFiles()));
       	
      	//파일명 뒤에 ms 붙이기
		$.each(fileUploadObj.getFiles(), function(idx, map){
			map.meta.atchFileId = $("#atchFileId").val();
			fd.append("file",map);
		});
      
      	//프로젝트 그룹 ID
		var prjGrpId = $("#reqPrjSelect option[value="+$("#reqPrjSelect").val()+"]").data("prj-grp-id");
		fd.append("prjGrpId",prjGrpId);

		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req4000/req4100/insertReq4101ReqInfoAjax.do'/>"
   			, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
			,fd);

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
   				$("button[data-datatable-id=req4100ReqTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
		
    };
    
    //요구사항 수정 시작
    var submitUpdateAction = function(){
		var form = $('#'+formId);    		
    	
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}

       	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
       	
       	//파일 목록 추가하기 (수정이력 관리)
       	var uploadFileList = [];
       	$.each(fileUploadObj.getFiles(), function(idx, map){
       		if(!map.hasOwnProperty("source") || map.source == "database"){
       			return true;
       		}
       		uploadFileList.push(map);
       	});

       	uploadFileList = uploadFileList.concat(uploadRemoveFiles);

       	//파일 정보
       	fd.append("fileHistory",JSON.stringify(uploadFileList));

       	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/req/req4000/req4100/updateReq4101ReqInfoAjax.do'/>"
   					, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
   				,fd);

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
   				$("button[data-datatable-id=req4100ReqTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
    };
    
  //atchFileId 생성 완료 시 요구사항 복사 시작
    var submitCopyAction = function(){
    	var form = $('#'+formId);    		
    	
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}

       	//formData
   		var fd = $.osl.formDataToJsonArray(formId);

       	//파일 목록 추가하기 (수정이력 관리)
       	fd.append("fileHistory",JSON.stringify(fileUploadObj.getFiles()));
       	
      	//파일명 뒤에 ms 붙이기
		$.each(fileUploadObj.getFiles(), function(idx, map){
			map.meta.atchFileId = $("#atchFileId").val();
			fd.append("file",map);
		});
      
      	//프로젝트 그룹 ID
		var prjGrpId = $("#reqPrjSelect option[value="+$("#reqPrjSelect").val()+"]").data("prj-grp-id");
		fd.append("prjGrpId",prjGrpId);

		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req4000/req4100/insertReq4100ReqCopyAjax.do'/>"
   			, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
			,fd);

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
   				$("button[data-datatable-id=req4100ReqTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
		
    };
    
    /*
	 * function : viewTypeChange
	 * function 설명 : 화면 출력 타입 변경(카드형, 그리드형)
	 */
	 var viewTypeChange = function(){
		//현재 viewType에 따라 show/hide
		if(currentViewType == "01"){	//카드 형식
			$("#prepListTable .kt-datatable__table").css({visibility: "hidden", height: 0});
			$("#prepListDiv").show();
		}else{	//데이터테이블 형식
			$("#prepListTable .kt-datatable__table").css({visibility: "hidden", height: "auto"});
			$("#prepListDiv").hide();
		}
	}

    return {
        // public functions
        init: function() {
        	documentSetting();
        },
        setUsrInfo: function(temp){
        	var parseTemp = JSON.parse(temp);
        	
        	//사용자 정보 입력하기
        	$("#reqUsrId").val(parseTemp.usrId);
        	$("#deptId").val(parseTemp.deptId);
        	$("#usrNm").val(parseTemp.usrNm);
        	$("#email").val(parseTemp.email);
        	$("#deptName").val(parseTemp.deptName);
        	$("#telno").val(parseTemp.telno);
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLReq4101Popup.init();
});

	
</script>