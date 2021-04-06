<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<form class="kt-form" id="frSpr1005">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramSprId" id="paramSprId" value="${param.paramSprId}">
	<input type="hidden" name="paramReqId" id="paramReqId" value="${param.paramReqId}">
	<input type="hidden" name="paramStartDt" id="paramStartDt" value="${param.paramStartDt}">
	<input type="hidden" name="paramEndDt" id="paramEndDt" value="${param.paramEndDt}">
	
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">결과 내용</span></label>
						<textarea  name="reqResultDesc" id="reqResultDesc" opttype="-1" required></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="reqResultDescSave">
		<i class="fa fa-save"></i><span>등록</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLSpr1005Popup = function () {
	var formId = 'frSpr1005'
	
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	var paramReqId = $("#paramReqId").val();
	var paramSprId = $("#paramSprId").val();
	var paramPrjGrpId = $("#paramPrjGrpId").val();
	var paramPrjId = $("#paramPrjId").val();
	
	var documentSetting = function(){
		
		
    	fnSprInfoSelect();
		//등록 버튼 클릭 시 동작
		$("#reqResultDescSave").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm("요구사항 처리 결과 내용을 등록하시겠습니까?",null,function(result) {
    	        if (result.value) {
    	        	//요구사항 결과 저장
    	        	saveFormAction();
    	        }
    		});
		});
	};
	

	//프로젝트 일정 정보 조회
	var fnSprInfoSelect = function(){
		//프로젝트 설정 정보 조회
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000SprReqResultDescInfoAjax.do'/>", "async": false}
				,{"reqId": paramReqId, "paramSprId":paramSprId, "paramPrjId":paramPrjId, "paramPrjGrpId": paramPrjGrpId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var sprReqInfo = data.sprReqInfo;
   		    	//설정 값 타입이 공통 코드인 경우  공통코드 select 세팅
   				$.osl.setDataFormElem(sprReqInfo, formId);
   				//edit 세팅
   		    	$.osl.editorSetting("reqResultDesc", {
  		    			formValidate: formValidate,
	   		    		'minHeight': 300,
	   		    		disableResizeEditor: false
   		    		});
   				
   			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	
	//요구사항 처리 결과 저장
	var saveFormAction = function(){
		//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/spr/spr1000/spr1000/updateSpr1000SprReqResultDescInfo.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//등록 성공
   				$.osl.toastr(data.message);

   				//모달 창 닫기
   				$.osl.layerPopupClose();
   				
   				//데이터테이블 재 조회
   				if(!$.osl.isNull($.osl.datatable.list["sprReqResultTable"])){
					$.osl.datatable.list["sprReqResultTable"].targetDt.reload();
   				}
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

$.osl.ready(function(){
	OSLSpr1005Popup.init();
});
</script>
<!-- end script -->
