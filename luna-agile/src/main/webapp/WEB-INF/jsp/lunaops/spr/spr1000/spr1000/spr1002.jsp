<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- begin page DOM -->
<form class="kt-form" id="spr1002">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="sprStDt" id="sprStDt">
	<input type="hidden" name="sprEdDt" id="sprEdDt">
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__body">
			<!-- begin :: 내용 영역 -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>스프린트 명</label>
						<input type="text" class="form-control" name="sprNm" id="sprNm">
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>스프린트 기간</label>
						<input type="text" class="form-control" id="sprRange" name="sprRange">
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>스프린트 설명</label> 
						<textarea type="text" class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="newSprText" id="newSprText"></textarea>
					</div>
				</div>
			</div>
			<!-- end :: 내용 영역 -->
		</div>
	</div>
</form>
<!-- begin :: modal-footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="spr1002SaveSubmit" name="spr1002SaveSubmit"><i class="fa fa-save"></i><span>등록</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end :: modal-footer -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLSpr1002Popup = function () {
	//type
	var type = $("#type").val();
	
	var formId = 'frSpr1002'
	
	//수정인경우 대상 프로젝트ID
	var paramPrjId = $("#paramPrjId").val();

	var documentSetting = function(){
		//문구 세팅 
    	$("#spr1002SaveSubmit > span").text($.osl.lang("spr1002."+type+".saveBtnString"));
		
		//edit 목록
		var formEditList = [];
		
		//form validate 주입
		var formValidate = $.osl.validate(formId);
		
		var today = new Date().format("yyyy-MM-dd");
    	//프로젝트 그룹 기간 최초 오늘 날짜 세팅
    	$("#sprStDt").val(today);
		$("#sprEdDt").val(today);
		
    	//datepicker 세팅
		$.osl.date.daterangepicker($("#sprRange"), {}, function(defaultConfig, start, end, label) {
			var sprStDt = new Date(start._d).format("yyyy-MM-dd");
			var sprEdDt = new Date(end._d).format("yyyy-MM-dd");
			
			$("#sprStDt").val(sprStDt);
			$("#sprEdDt").val(sprEdDt);
		});
    	
		//submit 동작
    	$("#spr1002SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("spr1002."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	//프로젝트 그룹 저장
    	        	saveFormAction();
    	        }
    		});
    	});
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1002Popup.init();
});
</script>
<!-- end script -->
