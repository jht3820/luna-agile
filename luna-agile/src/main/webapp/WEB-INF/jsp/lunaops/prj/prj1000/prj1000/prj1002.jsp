<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1002">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
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
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="req1001SaveSubmit"><span data-lang-cd="req1001.complete">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLPrj1002Popup = function () {
	var formId = 'frPrj1002';
	
    // Private functions
    var documentSetting = function () {
    	
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