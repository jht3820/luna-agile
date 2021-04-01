<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frReq1002">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="prjId" id="prjId" value="${param.paramPrjId}">
	<input type="hidden" name="reqId" id="reqId" value="${param.paramReqId}">
	<input type="hidden" name="reqUsrId" id="reqUsrId" value="${param.paramReqUsrId}">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<div class="kt-portlet kt-portlet--collapsed" id="req1002RequestUsrInfo">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<i class="fa fa-user kt-margin-r-5"></i>요청자 정보
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
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>요청자 이름</label>
						<input type="text" class="form-control" placeholder="요청자 이름" name="reqUsrNm" id="reqUsrNm" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label class="required"><i class="flaticon2-envelope kt-margin-r-5"></i>요청자 e-mail</label>
						<input type="email" class="form-control" placeholder="요청자 이메일" name="reqUsrEmail" id="reqUsrEmail" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-7">
					<div class="form-group">
						<label><i class="flaticon2-avatar kt-margin-r-5"></i>요청자 소속</label>
						<input type="text" class="form-control" name="reqUsrDeptNm" id="reqUsrDeptNm" readonly="readonly">
						<input type="hidden" name="reqUsrDeptId" id="deptId">
					</div>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label class="required"><i class="flaticon2-phone kt-margin-r-5"></i>요청자 연락처</label>
						<input type="text" class="form-control" placeholder="요청자 연락처" name="reqUsrNum" id="reqUsrNum" readonly="readonly">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet" data-ktportlet="true" id="req1002RequestDetail">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<i class="fa fa-user kt-margin-r-5"></i>기본 정보
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-group">
					<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
				</div>
			</div>
		</div>
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label for="exampleSelect1"><i class="fa fa-project-diagram kt-margin-r-5"></i>프로젝트</label>
						<input type="text" class="form-control" placeholder="프로젝트" name="prjNm" id="prjNm" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-calendar-alt kt-margin-r-5"></i>요청 일자</label>
						<input type="date" class="form-control" placeholder="요청 일자" name="reqDtm" id="reqDtm" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>요청 제목</label>
				<input type="text" class="form-control" placeholder="요청 제목" name="reqNm" id="reqNm" readonly="readonly">
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>요청 내용</label>
				<textarea name="reqDesc" id="reqDesc" readonly="readonly"></textarea>
			</div>
			<div class="form-group form-group-last">
				<label><i class="fa fa-file-upload kt-margin-r-5"></i>파일 첨부 <button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn">삭제 초기화</button></label>
				<div class="kt-uppy fileReadonly" id="req1002FileUpload" >
					<div class="kt-uppy__dashboard"></div>
					<div class="kt-uppy__progress"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet kt-portlet--collapsed" data-ktportlet="true" id="req1002NewRequestOpt">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<i class="fa fa-user kt-margin-r-5"></i>접수 기본항목
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
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>
<script>
"use strict";
	

//파일 업로드 세팅
var fileUploadObj;
var OSLReq1002Popup = function () {
	var formId = 'frReq1002';
	
	
    // Private functions
    var documentSetting = function () {

    	//type
    	var type = $("#type").val();
    	
    	//atchfileId
    	var atchFileId = $("#atchFileId").val();
    	
    	//Portlet 세팅
    	new KTPortlet('req1002RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('req1002RequestDetail', $.osl.lang("portlet"));
    	new KTPortlet('req1002NewRequestOpt', $.osl.lang("portlet"));
    	
    	//파일 업로드 세팅
    	fileUploadObj = $.osl.file.uploadSet("req1002FileUpload",{
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": atchFileId, "fileSn": 0},
    		maxNumberOfFiles:20,
    		isDraggingOver: false,
    		fileDownload: true,
    		fileReadonly: true
    	});
    	
    	//요구사항 정보 조회
		selectReqInfo();
    	
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
		    	$.osl.setDataFormElem(data.reqInfoMap,"frReq1002");
				
				//요청자 정보 세팅
		    	$("#reqDtm").val(data.reqInfoMap.reqDtm);
		    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(data.reqInfoMap.reqUsrImgId));
		    	
		    	//읽기 전용 에디터
		    	var reqDescEditor = $.osl.editorSetting("reqDesc",{
		    			toolbar: false,
		    			disableResizeEditor: false,
		    			disableDragAndDrop: true,
		    			disabledEditor: true,
		    			height:250
		    		});
		    	
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
    
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLReq1002Popup.init();
});

	
</script>