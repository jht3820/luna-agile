<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form"  id="frStm8001" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group kt-margin-b-5">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12 col-12 kt-margin-b-15">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">유형</span></label>
						<select class="form-control kt-select2" name="strgTypeCd" id="strgTypeCd" required></select>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">사용여부</span></label>
				<select class="form-control kt-select2" name="useCd" id="useCd" required></select>
					</div>
				</div>
			</div>
			<div class="form-group kt-margin-b-15">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">저장소명</span></label>
				<input type="text" class="form-control" name="strgRepTitle" id="strgRepTitle" autocomplete="off" required>
			</div>
			<div class="form-group kt-margin-b-15">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">URL</span></label>
				<input type="text" class="form-control" name="strgRepUrl" id="strgRepUrl" autocomplete="off" required>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12 col-12 kt-margin-b-15">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">USER</span></label>
					<input type="text" class="form-control" name="strgUsrId" id="strgUsrId" autocomplete="off" required>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-12" id="optPw" name="optPw">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">PW</span></label>
					<input type="password" class="form-control" name="strgUsrpw" id="strgUsrPw" autocomplete="new-password" required>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-12" id="optRep" name="optRep">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">Repo</span></label>
					<input type="text" class="form-control" name="strgRepNm" id="strgRepNm" autocomplete="off" required>
				</div>
			</div>
			<div class="form-group kt-margin-b-15" id="optKey" name="optKey">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">Token</span></label>
				<input type="text" class="form-control" name="strgKey" id="strgKey" autocomplete="off" required>
			</div>
			<div class="form-group form-group-last">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">저장소 설명</span></label>
				<textarea class="form-control osl-min-h-px--140" name="strgTxt" id="strgTxt"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm8000SaveSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<!-- begin page script -->
<script>
 "use strict";

 var OSLStm8001Popup = function() {
	var formId = 'frStm8001';
	
	 //form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//type
	var type;
	
	//문구 세팅 
	//$("#stm8000SaveSubmit > span").text($.osl.lang(""));
	//$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//기본 설정
	 var documentSetting = function() {
		type = $("#type").val();
		 
		//초기 유형 git -> token 입력 숨기기
		$("#optRep").addClass("kt-hide");
		$("#optKey").addClass("kt-hide");
		 
		//kt-select2 설정
    	$('#strgTypeCd').select2({
			ftScrollUse: false,
		});
    	$('#useCd').select2({
			ftScrollUse: false,
		});
    	
    	//type에 따라 세팅하기
    	if(type=="insert"){
    		// adm2001 팝업 공통코드 select 세팅
			var commonCodeArr = [
				{mstCd: "STM00004", useYn: "Y", targetObj: "#strgTypeCd", comboType:""},
				{mstCd: "CMM00001", useYn: "Y", targetObj: "#useCd", comboType:""},
			];
	  		//공통코드 채우기
			$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    	}else{
    		selectStrgRepInfo();
    	}
	    
    	// 유형 선택될 때 이벤트 발생
		$("#strgTypeCd").change(function(){
			// 유형에 따라
			var typeCd = $("#strgTypeCd").val();
			// 1. password, token 보이기
			// 2. git인경우 자동 url 넣기
			if(typeCd == "01"){
				//선택이 SVN인 경우
				$("#optPw").removeClass("kt-hide");
				$("#optRep").addClass("kt-hide");
				$("#optKey").addClass("kt-hide");
				$("#strgRepUrl").val("");
				$("#strgRepUrl").prop("readonly", false);
			}else{
				//선택이 GIT인 경우
				$("#optPw").addClass("kt-hide");
				$("#optRep").removeClass("kt-hide");
				$("#optKey").removeClass("kt-hide");
				$("#strgRepUrl").val("https://api.github.com");
				$("#strgRepUrl").prop("readonly", true);
			}
		});
    	
    	//완료 버튼 클릭 시
    	$("#stm8000SaveSubmit").click(function(){
    		var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		
    		//formData
       		var fd = $.osl.formDataToJsonArray(formId);
    		
    		//유형에 따라 전송
    		if(type == "insert"){
    			//등록인 경우
    			//AJAX 설정
    	   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm8000/stm8000/insertStm8000ServerInfoAjax.do'/>"
    	   			,"loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

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
    	   				$("button[data-datatable-id=stm8000RepTable][data-datatable-action=select]").click();
    	   			}
    	   		});
    		}else{
    			//수정인 경우
    			//AJAX 설정
    	   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm8000/stm8000/updateStm8000ServerInfoAjax.do'/>"
    	   			,"loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

    	   		//AJAX 전송 성공 함수
    	   		ajaxObj.setFnSuccess(function(data){
    	   			if(data.errorYn == "Y"){
    	   				$.osl.alert(data.message,{type: 'error'});
    	   			}else{
    	   				//수정 성공
    	   				$.osl.toastr(data.message);

    	   				//모달 창 닫기
    	   				$.osl.layerPopupClose();
    	   				
    	   				//datatable 조회
    	   				$("button[data-datatable-id=stm8000RepTable][data-datatable-action=select]").click();
    	   			}
    	   		});
    		}
   	   		//AJAX 전송
   	   		ajaxObj.send();
    	});
	}
	
	 /**
	* function 명 	: selectStrgRepInfo
	* function 설명	: 저장소 정보 불러와 form에 세팅
	*/
	var selectStrgRepInfo = function(){
		var data = {
				strgRepId : $("#strgRepId").val()
		};

		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000ServerInfoAjax.do'/>"}, data);
		
   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				console.log(data.repInfo);
   				
   				// 공통코드 해당 데이터 선택으로 세팅
   				$("#strgTypeCd").attr("data-osl-value", data.repInfo.strgTypeCd);
   				$("#useCd").attr("data-osl-value", data.repInfo.useCd);
   				
   		    	// adm2001 팝업 공통코드 select 세팅
   				var commonCodeArr = [
   					{mstCd: "STM00004", useYn: "Y", targetObj: "#strgTypeCd", comboType:"OS"},
   					{mstCd: "CMM00001", useYn: "Y", targetObj: "#useCd", comboType:"OS"},
   				];
   		    	
   		  		//공통코드 채우기
   				$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
   		  		
   		  		//저장소 유형에 따라 password, token 보이기
   		  		if(data.repInfo.strgTypeCd == "01"){
   		  			//svn인 경우
	   		  		$("#optPw").removeClass("kt-hide");
					$("#optRep").addClass("kt-hide");
					$("#optKey").addClass("kt-hide");
					$("#strgRepUrl").val("");
					$("#strgRepUrl").prop("readonly", false);
   		  		}else{
   		  			//git인 경우
					$("#optPw").addClass("kt-hide");
					$("#optRep").removeClass("kt-hide");
					$("#optKey").removeClass("kt-hide");
					$("#strgRepUrl").val("https://api.github.com");
					$("#strgRepUrl").prop("readonly", true);
   		  		}
   		  		
   		  		//form 채우기
		    	$.osl.setDataFormElem(data.repInfo,"frStm8001");
   		  		
   		  		//user id, pw, token은 form-group이 아니기 때문에 직접 채우기
   		  		$("#strgUsrId").val(data.repInfo.strgUsrId);
   		  		$("#strgUsrPw").val(data.repInfo.strgUsrPw);
   		  		$("#strgKey").val(data.repInfo.strgKey);
   		  		
   			}
   		});
  	 	//AJAX 전송
   		ajaxObj.send();
	};
	 
	 return {
		 init: function(){
			 documentSetting();
		 }
	 };
 }();
 
 $.osl.ready(function(){
	 OSLStm8001Popup.init();
 });
</script>
