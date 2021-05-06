<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frReq4102" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="reqId" id="reqId" value="<c:out value='${param.paramReqId}'/>">
	<input type="hidden" name="reqUsrId" id="reqUsrId" value="<c:out value='${param.paramReqUsrId}'/>">
	<input type="hidden" name="reqPrjId" id="reqPrjId" value="<c:out value='${param.paramPrjId}'/>">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<div class="kt-portlet kt-portlet--collapsed" id="req4102RequestUsrInfo">
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
						<input type="text" class="form-control"  name="reqUsrNm" id="usrNm" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label><i class="flaticon2-envelope kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.email">요청자 e-mail</span></label>
						<input type="text" class="form-control" name="reqUsrEmail" id="email" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-7">
					<div class="form-group">
						<label><i class="flaticon2-avatar kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.deptNm">요청자 소속</span></label>
						<input type="text" class="form-control" name="reqUsrDeptNm" id="deptName" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label><i class="flaticon2-phone kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.telNo">요청자 연락처</span></label>
						<input type="text" class="form-control" name="reqUsrNum" id="telno" readonly="readonly">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet kt-portlet--collapsed" id="req4102ReqGroupInfo">
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
					<input type="text" class="form-control" name="reqGrpNm" id="reqGrpNm" readonly="readonly">
				</div>
			</div>
			<div class="form-group kt-margin-b-0">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqDesc">그룹 요구사항 내용</span></label>
				<textarea class="kt-hide" name="reqGrpDesc" id="reqGrpDesc" ></textarea>
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
						<input type="date" class="form-control" name="reqDtm" id="reqDtm" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqNm">요청 제목</span></label>
				<input type="text" class="form-control" name="reqNm" id="reqNm"  readonly="readonly">
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDesc">요청 내용</span></label>
				<textarea  class="kt-hide" name="reqDesc" id="reqDesc" required></textarea>
			</div>
			<div class="form-group kt-margin-t-25 form-group-last">
				<label>
					<i class="fa fa-file-upload kt-margin-r-5"></i>
					<span data-lang-cd="req4101.label.attachments">파일 첨부</span> 
				</label>
				<div class="kt-uppy osl-max-h-px-260 fileReadonly" name="fileListDiv" id="fileListDiv">
					<div class="kt-uppy__dashboard"></div>
					<div class="kt-uppy__progress"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet kt-portlet--collapsed" data-ktportlet="true" id="req4102NewRequestOpt">
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
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><span data-lang-cd="modal.close">Close</span></button>
</div>

<script>
"use strict";
var OSLReq4102Popup = function () {
	var formId = 'frReq4102';

	//edit 목록
	var formEditList = [];
	
	//파일 업로드 세팅
	var fileUploadObj;
	
    // Private functions
    var documentSetting = function () {

    	//프로젝트 목록 세팅
    	$("#reqPrjSelect").html($.osl.prjGrpAuthSelSetting(2,true));
    	
    	//Portlet 세팅
    	new KTPortlet('req4102RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4102ReqGroupInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4102NewRequestOpt', $.osl.lang("portlet"));
    	
    	//파일 업로드 세팅
    	fileUploadObj = $.osl.file.uploadSet("fileListDiv",{
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": $("#atchFileId").val(), "fileSn": 0},
    		height: 260,
    		isDraggingOver: false,
    		fileDownload: true,
    		fileReadonly: true
    	});
    	fileUploadObj.reset();
    	
    	//요구사항 정보 조회
		selectReqInfo();
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
				{"url":"<c:url value='/req/req4000/req4100/selectReq4100ReqInfoAjax.do'/>", "async":"false"}
				,data);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				//요구사항 정보 세팅
				//수정할때 호출
		    	$.osl.setDataFormElem(data.reqInfoMap,"frReq4102");
				
				//요청자 정보 세팅
		    	$("#reqUsrId").val(data.reqInfoMap.reqUsrId);
				$("#reqGrpNm").val(data.reqInfoMap.reqGrpNm);
		    	$("#usrNm").val(data.reqInfoMap.reqUsrNm);
		    	$("#email").val(data.reqInfoMap.reqUsrEmail);
		    	$("#telno").val(data.reqInfoMap.reqUsrNum);
		    	$("#deptName").val(data.reqInfoMap.reqUsrDeptNm);
		    	$("#deptId").val(data.reqInfoMap.reqUsrDeptId);
		    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(data.reqInfoMap.reqUsrImgId));
		    	
		    	$("#reqPrjSelect").val($.osl.escapeHtml(data.reqInfoMap.prjId)).trigger('change.select2');
		    	$("#reqPrjSelect").prop("disabled", true);
		    	
		    	//edit 세팅
		    	formEditList.push($.osl.editorSetting("reqDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:260
		    	}));
		    	formEditList.push($.osl.editorSetting("reqGrpDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:180
	    		}));
		    	
		    	//edit 세팅하고 나서 textarea 보이기
		    	$("#reqDesc").removeClass("kt-hide");
		    	$("#reqGroupDesc").removeClass("kt-hide");
		    	
		    	//datepicker 세팅
				//$.osl.date.datepicker($("#reqDtm"), {});
		    	
		    	//파일Sn넣기
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	//파일 목록 세팅
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};

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
	OSLReq4102Popup.init();
});

	
</script>