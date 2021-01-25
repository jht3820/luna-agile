<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1201">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="prjSetId" id="prjSetId" value="${param.paramPrjSetId}">
	<input type="hidden" name="newSetYn" id="newSetYn" value="${param.paramNewSetYn}">
	<div class="kt-portlet ">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1201.label.prjSetNm">설정명</span></label>
						<input type="text" class="form-control" placeholder="설정명" name="prjSetNm" id="prjSetNm" opttype="-1" maxlength="100" disabled>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1201.label.prjSetDesc">설정 설명</span></label>
						<textarea class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="prjSetDesc" id="prjSetDesc" opttype="-1" maxlength="2000" disabled></textarea>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1201.label.prjSetTarget">설정 대상</span></label>
						<select class="form-control kt-select2" id="prjSetTarget" name="prjSetTarget" opttype="-1" disabled >
						</select>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1201.label.prjSetVal">설정 값 타입</span></label>
						<select class="form-control kt-select2" id="valType" name="valType" opttype="-1" disabled>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1201.label.prjSetVal">설정값</span></label>
						<c:choose>
							<c:when test="${param.paramValType eq '03' }">
								<select class="form-control kt-select2" id="prjSetVal" name="prjSetVal" opttype="-1">
								</select>
							</c:when>
							<c:when test="${param.paramValType eq '02' }">
								<input type="number" class="form-control" placeholder="설정값" name="prjSetVal" id="prjSetVal" value="1" opttype="-1" min="0" max="999" maxlength="3" required>
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" placeholder="설정값" name="prjSetVal" id="prjSetVal" opttype="-1" maxlength="50" required>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1201.label.useCd">사용유무</span></label>
						<select class="form-control kt-select2" id="useCd" name="useCd" opttype="-1">
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1201SaveSubmit"><i class="fa fa-check-square"></i><span>완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLPrj1201Popup = function () {
	var formId = 'frPrj1201';
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//type
	var type = $("#type").val();
	
	//수정인경우 대상 프로젝트 설정 ID
	var paramPrjSetId = $("#prjSetId").val();
	
    // Private functions
    var documentSetting = function () {
    	//문구 세팅 
    	$("#prj1201SaveSubmit > span").text($.osl.lang("prj1201."+type+".saveBtnString"));
    	
    	
		//submit 동작
    	$("#prj1201SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj1201."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	//프로젝트 그룹 저장
    	        	saveFormAction();
    	        }
    		});
    	});
		
		//수정인경우 프로젝트 설정 정보 조회
		if(type == "update"){
			fnPrjSetInfoSelect();
		}
    };
    
    //프로젝트 그룹 저장 (생성&수정)
    var saveFormAction = function() {
    	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1200/savePrj1201PrjSetInfo.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

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
   				$("button[data-datatable-id=prj1200PrjTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
    };
    
	
	//프로젝트 설정 정보 조회
	var fnPrjSetInfoSelect = function(){
		//프로젝트 설정 정보 조회
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1200/selectPrj1201PrjSetInfoAjax.do'/>"}
				,{"prjSetId": paramPrjSetId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var prjSetInfo = data.prjSetInfo;
   		    	// 설정 값 타입이 공통 코드인 경우  공통코드 select 세팅
   		    	
   		    	// 팝업 공통코드 select 세팅
   		    	var commonCodeArr = {};
   		    	$("#prjSetTarget").attr("data-osl-value", prjSetInfo.prjSetTarget);
   		    	$("#valType").attr("data-osl-value", prjSetInfo.valType);
   		    	$("#useCd").attr("data-osl-value", prjSetInfo.useCd);
   		    	if(prjSetInfo.valType == '03'){
   		    		$("#prjSetVal").attr("data-osl-value", prjSetInfo.prjSetVal);
	   				commonCodeArr = [
	   		 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"}, // 사용유무
	   		 			{mstCd: "PRJ00015", useYn: "Y",targetObj: "#valType", comboType:"OS"}, // 설정값 타입
	   		 			{mstCd: "PRJ00017", useYn: "Y",targetObj: "#prjSetTarget", comboType:"OS"}, // 설정 대상
						{mstCd: prjSetInfo.mstCd, useYn: "Y",targetObj: "#prjSetVal", comboType:"OS"} // 설정 값 공통 코드
	   				];
   		    	}else{
	   		 		commonCodeArr = [
	   		 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"}, // 사용유무
	   		 			{mstCd: "PRJ00015", useYn: "Y",targetObj: "#valType", comboType:"OS"}, // 설정값 타입
	   		 			{mstCd: "PRJ00017", useYn: "Y",targetObj: "#prjSetTarget", comboType:"OS"} // 설정 대상
   		 			];
   		    	}
   		    	
   				//공통코드 채우기
   				$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
   				
   				$.osl.setDataFormElem(prjSetInfo, formId);
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
	OSLPrj1201Popup.init();
});

	
</script>