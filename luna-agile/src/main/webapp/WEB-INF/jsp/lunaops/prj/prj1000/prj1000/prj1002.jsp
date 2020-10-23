<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1002">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="startDt" id="startDt">
	<input type="hidden" name="endDt" id="endDt">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label class="required" for="prjNm"><i class="fa fa-edit kt-margin-r-5"></i><span>프로젝트 그룹명</span></label>
				<input type="text" class="form-control" placeholder="프로젝트 그룹명" name="prjNm" id="prjNm" opttype="-1" required>
			</div>
			<div class="form-group">
				<label class="required" for="prjGrpRange"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>프로젝트 그룹 기간</span></label>
				<input type="text" class="form-control" placeholder="프로젝트 그룹 기간" name="prjGrpRange" id="prjGrpRange" readonly="readonly" required>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span>프로젝트 그룹 설명</span></label>
				<textarea class="form-control osl-min-h-px--130" name="prjDesc" id="prjDesc" opttype="-1"></textarea>
			</div>
			<div class="form-group">
				<label class="required" for="ord"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>정렬 순서</span></label>
				<input type="number" class="form-control" placeholder="정렬 순서" name="ord" id="ord" value="1" opttype="-1" min="0" max="999" required>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
				<select class="form-control kt-select2" id="useCd" name="useCd" opttype="-1">
				</select>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1002SaveSubmit"><span>완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><span data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var formValidate = null;
var OSLPrj1002Popup = function () {
	var formId = 'frPrj1002';
	
	//form validate 주입
	formValidate = $.osl.validate(formId);
	
    // Private functions
    var documentSetting = function () {
    	//type
    	var type = $("#type").val();
    	
    	//문구 세팅 
    	$("#prj1002SaveSubmit").text($.osl.lang("prj1002."+type+".saveBtnString"));
    	
    	var today = new Date().format("yyyy-MM-dd");
    	//프로젝트 그룹 기간 최초 오늘 날짜 세팅
    	$("#startDt").val(today);
		$("#endDt").val(today);
		
    	//datepicker 세팅
		$.osl.date.daterangepicker($("#prjGrpRange"), {}, function(defaultConfig, start, end, label){
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
    };
    
    var saveFormAction = function() {
    	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	
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
    }
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