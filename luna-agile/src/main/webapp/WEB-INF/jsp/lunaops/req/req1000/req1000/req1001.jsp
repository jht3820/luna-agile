<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frReq1001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="reqId" id="reqId" value="${param.paramReqId}">
	<input type="hidden" name="reqUsrId" id="reqUsrId" value="${param.paramReqUsrId}">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<div class="kt-portlet kt-portlet--collapsed" id="req1001RequestUsrInfo">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req1001.reqUser.title">요청자 정보</span>
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
			<div class="row">
				<div class="col-xl-2 kt-align-center">
					<a href="#" class="kt-media kt-media--xl kt-media--circle">
						<img type="img" id="usrImgId">
					</a>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req1001.reqUser.usrNm">요청자 이름</span></label>
						<input type="text" class="form-control" placeholder="요청자 이름" name="reqUsrNm" id="usrNm" readonly="readonly" required>
					</div>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label class="required"><i class="flaticon2-envelope kt-margin-r-5"></i><span data-lang-cd="req1001.reqUser.email">요청자 e-mail</span></label>
						<input type="email" class="form-control" placeholder="요청자 이메일" name="reqUsrEmail" id="email" readonly="readonly" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-7">
					<div class="form-group">
						<label><i class="flaticon2-avatar kt-margin-r-5"></i><span data-lang-cd="req1001.reqUser.deptNm">요청자 소속</span></label>
						<input type="text" class="form-control" name="reqUsrDeptNm" id="deptName" readonly="readonly">
						<input type="hidden" name="reqUsrDeptId" id="deptId">
					</div>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label class="required"><i class="flaticon2-phone kt-margin-r-5"></i><span data-lang-cd="req1001.reqUser.telNo">요청자 연락처</span></label>
						<input type="text" class="form-control" placeholder="요청자 연락처" name="reqUsrNum" id="telno" readonly="readonly" required>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label for="exampleSelect1"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req1001.prjNm">프로젝트</span></label>
						<select class="form-control kt-select2" name="prjId" id="reqPrjSelect">
						</select>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="req1001.reqDtm">요청 일자</span></label>
						<input type="date" class="form-control" placeholder="요청 일자" name="reqDtm" id="reqDtm" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req1001.reqNm">요청 제목</span></label>
				<input type="text" class="form-control" placeholder="요청 제목" name="reqNm" id="reqNm" required>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req1001.reqNm">요청 내용</span></label>
				<textarea  name="reqDesc" id="reqDesc" required></textarea>
			</div>
			<div class="form-group form-group-last">
				<label><i class="fa fa-file-upload kt-margin-r-5"></i><span data-lang-cd="req1001.attachments">파일 첨부</span> <button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn">삭제 초기화</button></label>
				<div class="kt-uppy" id="req1001FileUpload">
					<div class="kt-uppy__dashboard"></div>
					<div class="kt-uppy__progress"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet kt-portlet--collapsed" data-ktportlet="true" id="req1001NewRequestOpt">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req1001.requestDefaultOptNm">접수 기본항목 입력</span>
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
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="req1001SaveSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="req1001.complete">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
	

//파일 업로드 세팅
var fileUploadObj;
var OSLReq1001Popup = function () {
	var formId = 'frReq1001';
	
	//edit 목록
	var formEditList = [];
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//수정 중 삭제한 파일Sn 목록
	var uploadRemoveFiles = [];
	
    // Private functions
    var documentSetting = function () {
    	new KTScrolltop('frReq1001', {
            offset: 300,
            speed: 600
        });
    	
    	//프로젝트 목록 세팅
    	$("#reqPrjSelect").html($.osl.prjGrpAuthSelSetting(2,true));

    	//type
    	var type = $("#type").val();
    	
    	//문구 세팅 
    	$("#req1001SaveSubmit > span").text($.osl.lang("req1001."+type+".saveBtnString"));
    	
    	//atchfileId
    	var atchFileId = $("#atchFileId").val();
    	
    	//Portlet 세팅
    	new KTPortlet('req1001RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('req1001NewRequestOpt', $.osl.lang("portlet"));
    	
    	//파일 업로드 세팅
    	fileUploadObj = $.osl.file.uploadSet("req1001FileUpload",{
    		url: '/req/req1000/req1000/insertReq1001ReqAtchFileInfo.do',
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": atchFileId, "fileSn": 0},
    		maxNumberOfFiles:20,
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
	   					 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
	   					 
	   						//파일명 뒤에 ms 붙이기
	   	    				$.each(files, function(idx, map){
	   	    					map.meta.atchFileId = data.atchFileIdString;
	   	    					
	   	    					var jsonTmp = {};
	    						jsonTmp[map.id] = map;
	    						uploadFiles = $.extend(uploadFiles, jsonTmp);
	   	    				});
	   						
	   	    				rtnValue = uploadFiles;
	   	    				
	   						//요구사항 등록
	   						submitInsertAction();
	   					}
    				});
    			}else{
    				//database 파일 제외하기
    				$.each(files, function(idx, map){
    					if(map.source != "database"){
    						map.meta.atchFileId = $("#atchFileId").val();
    						map.meta.source = map.source;
    						
    						var jsonTmp = {};
    						jsonTmp[map.id] = map;
    						uploadFiles = $.extend(uploadFiles, jsonTmp);
    					}
    				});

					//요구사항 수정
					submitUpdateAction();
					
    				rtnValue = uploadFiles;
    			}
   				return rtnValue;
    		},
    		//파일 업로드 시 건당 발생 함수
    		onBeforeFileAdded: function(currentFile, files){
    			if(currentFile.source != "database" && currentFile.source != "remove"){
    				var newNm = new Date().format("ssms")+"_"+currentFile.name;
    				currentFile.name = newNm;
    				currentFile.meta.name = newNm;
    				//currentFile.meta.atchFileId = $("#atchFileId").val();
    				
	    			//fileSn default
	    			//var fileSn = fileUploadObj.getState().meta.fileSn;
	    			
	    			//currentFile.meta.fileSn = fileSn;
	    			//fileUploadObj.setMeta({fileSn: (fileSn+1)});
    			}
    		}
    	});
    	
    	//수정인경우
    	if(type == "update"){
    		//요구사항 정보 조회
    		selectReqInfo();
    		
			//fileUploadObj.setMeta({atchFileId: atchFileId});
			 	
	    	//수정인경우 파일 삭제 기록하기
	    	fileUploadObj.on('file-removed', function(file) {
	    		file["fileSn"] = file.meta.fileSn;
	    		file.source = "remove";
	    		uploadRemoveFiles.push(file);
	    		
	    		//삭제 취소 버튼 활성화
	    		//$(".uppy-DashboardContent-bar > div:eq(0)").append($("#fileRemoveResetBtn"));
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
    	}else{
    		//요청자 정보 세팅
        	$.osl.setDataFormElem($.osl.user.userInfo,"frReq1001", ["usrNm","email","telno","deptName","deptId","usrImgId"]);
			
	    	//현재 날짜 지정
	    	$("#reqDtm").val(new Date().format("yyyy-MM-dd"));
    	}

    	//edit 세팅
    	formEditList.push($.osl.editorSetting("reqDesc", {formValidate: formValidate}));
    	
    	//datepicker 세팅
		$.osl.date.datepicker($("#reqDtm"), {});
    	
    	//submit 동작
    	$("#req1001SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("req1001."+type+".saveString"),null,function(result) {
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
    	var paramPrjId = $("#prjId").val();
    	var paramReqId = $("#reqId").val();
    	var paramReqUsrId = $("#reqUsrId").val();
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req1000/req1000/selectReq1000ReqInfoAjax.do'/>", "async": false}
				,{"prjId": paramPrjId, "reqId" : paramReqId, "reqUsrId": paramReqUsrId });
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				//요구사항 정보 세팅
		    	$.osl.setDataFormElem(data.reqInfoMap,"frReq1001");
				
				//요청자 정보 세팅
		    	$("#usrNm").val(data.reqInfoMap.reqUsrNm);
		    	$("#email").val(data.reqInfoMap.reqUsrEmail);
		    	$("#telno").val(data.reqInfoMap.reqUsrNum);
		    	$("#deptName").val(data.reqInfoMap.reqUsrDeptNm);
		    	$("#deptId").val(data.reqInfoMap.reqUsrDeptId);
		    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(data.reqInfoMap.reqUsrImgId));
		    	
		    	$("#reqPrjSelect").val(data.reqInfoMap.prjId).trigger('change.select2');
		    	$("#reqPrjSelect").prop("disabled", true);
		    	
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
    var submitInsertAction = function(paramActhFileId){
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
			map.meta.atchFileId = paramActhFileId;
			
			fd.append("file",map);
		});
      
      	//프로젝트 그룹 ID
		var prjGrpId = $("#reqPrjSelect option[value="+$("#reqPrjSelect").val()+"]").data("prj-grp-id");
		fd.append("prjGrpId",prjGrpId);
		
   		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req1000/req1000/insertReq1001ReqInfoAjax.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

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
   				$("button[data-datatable-id=req1000ReqTable][data-datatable-action=select]").click();
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
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req1000/req1000/updateReq1001ReqInfoAjax.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

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
   				$("button[data-datatable-id=req1000ReqTable][data-datatable-action=select]").click();
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
	OSLReq1001Popup.init();
});

	
</script>