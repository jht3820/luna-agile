<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- begin page DOM -->
<form class="kt-form" id="mis1002">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
		<div class="kt-portlet__body">
			<!-- begin :: 내용 영역 -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>마일스톤 명</label>
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>마일스톤 설명</label> 
						<textarea type="text" name="newMisText" id="newMisText"></textarea>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="far fa-calendar-alt kt-margin-r-5"></i>마일스톤 시작일</label>
						<input type="date" class="form-control" id="misStartDtm" name="misStartDtm">
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label><i class="far fa-calendar-alt kt-margin-r-5"></i>마일스톤 종료일</label> 
						<input type="date" class="form-control" id="misEndDtm" name="misEndDtm">
					</div>
				</div>
			</div>
			<!-- end :: 내용 영역 -->
		</div>
	</div>
</form>
<!-- begin :: modal-footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="">
		<i class="fa fa-save"></i><span>등록</span>
	</button>
	<button type="button" class="btn btn-outline-brand"
		data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end :: modal-footer -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLMis1002Popup = function () {
	var documentSetting = function(){
		var formId = 'frMis1002'
			//edit 목록
			var formEditList = [];
			
			//form validate 주입
			var formValidate = $.osl.validate(formId);
			
			//edit 세팅
	    	formEditList.push($.osl.editorSetting("newMisText", {formValidate: formValidate}));

			//마일스톤 시작일 datepicker 세팅
			$.osl.date.datepicker($('#misStartDtm'), {});
			
			//마일스톤 종료일 datepicker 세팅
			$.osl.date.datepicker($('#misEndDtm'), {});
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLMis1002Popup.init();
});
</script>
<!-- end script -->
