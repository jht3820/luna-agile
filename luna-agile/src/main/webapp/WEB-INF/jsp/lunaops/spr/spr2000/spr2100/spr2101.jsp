<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frSpr2101" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="mmrId" id="mmrId" value="<c:out value='${param.mmrId}'/>">
	<input type="hidden" name="sprId" id="sprId" value="<c:out value='${param.sprId}'/>">
	<input type="hidden" name="paramSprNm" id="paramSprNm" value="<c:out value='${param.sprNm}'/>">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
		<div class="form-group">
			<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2101.label.sprNm">스프린트명</span></label>
			<input type="text" class="form-control" name="sprNm" id="sprNm" autocomplete="off" readonly="readonly" required>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2101.label.mmrNm">회고록 제목</span></label>
					<input type="text" class="form-control" id="mmrNm" name="mmrNm" autocomplete="off" placeholder="제목" maxlength="80" required>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group form-group-last">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2101.label.mmrDesc">회고록 내용</span></label>
					<textarea class="form-control kt-hide" name="mmrDesc" id="mmrDesc"autocomplete="off"  required></textarea>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="spr2101SaveSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="spr2101.submit">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLSpr2101Popup = function () {
	var formId = 'frSpr2101';
	
	//edit 목록
	var formEditList = [];
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);

	//type
	var type;

	//참여 인원 id를 담을 변수 선언
	var usrList = [];
	
	// Private functions
    var documentSetting = function () {
    	
    	type = $("#type").val();
    	
    	//문구 세팅 
    	$("#spr2101SaveSubmit > span").text($.osl.lang("spr2101.button."+type+"Btn"));
    	
    	//placeholder 세팅
    	$("#mmrNm").attr("placeholder",$.osl.lang("spr2101.placeholder.mmrNm"));
    	
    	//등록인경우
    	if(type == "insert"){
    		//선택한 스프린트 id에 해당하는 이름으로 지정
    		$("#sprNm").val($("#paramSprNm").val());

    		//edit 세팅
    		formEditList.push($.osl.editorSetting("mmrDesc", {formValidate: formValidate,height:190, 'minHeight': 190, disableResizeEditor: false}));
	    
    		//edit 세팅하고 나서 textarea 보이기
	    	$("#mmrDesc").removeClass("kt-hide");
    	
    	}else{
    		//수정
    		//스프린트 회고록 정보 조회 및 세팅
    		selectSprMmrInfo();
    	}
    	
    	//submit 동작
    	$("#spr2101SaveSubmit").click(function(){
			var form = $('#'+ formId);    		
			
			//폼 유효 값 체크
    		if (!form.valid()) {
    			return false;
    		}
    		
    		$.osl.confirm($.osl.lang("spr2101.saveString."+type+"Str"),null,function(result) {
    	        if (result.value) {
    	        	if(type=="insert"){
    	        		submitInsertAction();
    	        	}else{
    	        		submitUpdateAction();
    	        	}
    	        }
    		});
    	});
    };
    /**
	 * 	스프린트 회고록 정보 조회
	 */
	 var selectSprMmrInfo = function() {
    	var data = {
    			mmrId :  $("#mmrId").val(),
    			sprId :  $("#sprId").val(),
    	};

		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/spr/spr2000/spr2100/selectSpr2100MmrInfoAjax.do'/>", "async":"true"}
				,data);
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				//수정할때 호출
		    	$.osl.setDataFormElem(data.mmrInfo,"frSpr2101");
								
	    		//edit 세팅
	    		formEditList.push($.osl.editorSetting("mmrDesc", {formValidate: formValidate,height:190, 'minHeight': 190, 'maxHeight': 190}));
	    		//edit 세팅하고 나서 textarea 보이기
		    	$("#mmrDesc").removeClass("kt-hide");
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
	/**
	 * 	스프린트 회고록 등록
	 */
    var submitInsertAction = function(){
    	var form = $('#'+formId);    		
    	
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}

       	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
       	
       	//작성자 정보 넣기
       	fd.append("mmrUsrId", $.osl.user.userInfo.usrId);

		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/spr/spr2000/spr2100/insertSpr2101MmrInfoAjax.do'/>"
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
   				
   				//전체 목록 재조회
   				OSLSpr2100Popup.reload();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
    };
    
    /**
	 * 	스프린트 회고록 수정
	 */
    var submitUpdateAction = function(){
		var form = $('#'+formId);    		
    	
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}

       	//formData
   		var fd = $.osl.formDataToJsonArray(formId);

       	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/spr/spr2000/spr2100/updateSpr2101MmrInfoAjax.do'/>"
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
   				
   				//전체 목록 재조회
   				OSLSpr2100Popup.reload();
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
    };
}();

// Initialization
$.osl.ready(function(){
	OSLSpr2101Popup.init();
});

	
</script>