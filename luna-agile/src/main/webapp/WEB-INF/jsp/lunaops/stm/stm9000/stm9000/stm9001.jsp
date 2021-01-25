<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm9001">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="jenId" id="jenId" value="${param.paramJenId}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9001.label.jenkinsName">JENKINS NAME</span></label>
				<input type="text" class="form-control" placeholder="JENKINS NAME" name="jenNm" id="jenNm" maxlength="250" required/>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9001.label.jenkinsUrl">JENKINS URL</span></label>
				<input type="text" class="form-control" placeholder="JENKINS URL" name="jenUrl" id="jenUrl" maxlength="500" required/>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9001.label.jenkinsUserId">USER ID</span></label>
				<input type="text" class="form-control" placeholder="JENKINS USER ID" name="jenUsrId" id="jenUsrId" minlength="2" maxlength="20" regexstr="^[a-z0-9_-]{2,20}$" regexalert="영문 소문자, 숫자, _-" required/>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="stm9001.label.tokenKey">TOKEN KEY</span></label>
				<input type="password" class="form-control" placeholder="JENKINS TOKEN KEY" name="jenUsrTok" id="jenUsrTok" maxlength="2000" required/>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="stm9001.label.jenkinsUseCd">사용 여부</span></label>
				<select class="form-control kt-select2" id="useCd" name="useCd">
				</select>
			</div>	
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9001.label.jenkinsDesc">JENKINS 설명</span></label>
				<textarea class="form-control osl-min-h-px--130" name="jenDesc" id="jenDesc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm9001SaveSubmit"><span data-lang-cd="stm9001.button.insert">작성 완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>

<script>
"use strict";
var OSLStm9001Popup = function () {
	
	var formId = 'frStm9001';
	var type = $("#type").val();
	
	// 기존 jenkins 토큰
	var nowJenUsrTok = "";
	
	// 버튼 문구 세팅
	$("#stm9001SaveSubmit > span").text($.osl.lang("stm9001.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
    // Private functions
    var documentSetting = function () {
    	
    	// stm9001 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} // 사용유무
		];
    	
		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);

		// textarea 자동 사이즈 조절 설정
    	autosize($("#jenDesc"));
    	
    	// TODO
    	//수정인경우
    	if(type == "update"){
    		// jenkins 정보 조회
    		selectJenkinsInfo();
    	}
    	
    	// 등록&수정버튼 클릭
    	$("#stm9001SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		var jenUrl = $("#jenUrl").val(); 		// jenkins url
			var jenUsrId = $("#jenUsrId").val(); 	// jenkins 사용자 id
			var jenUsrTok = $("#jenUsrTok").val(); 	// jenkins 사용자 토큰
			var jenDesc = $("#jenDesc").val(); 		// jenkins 설명
    		
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		
			// TODO byte 체크
			
			
			
        	// Jenkins 등록&수정
        	submitSaveAction();
    	});
    	
    };

    
    // Jenkins 정보 단건 조회
	var selectJenkinsInfo = function() {
    	
    	var jenId = $("#jenId").val();
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm9000/stm9000/selectStm9000JenkinsInfoAjax.do'/>", "async": false}
				,{"jenId": jenId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				
				var jenkinsInfo = data.jenInfo;
				
				// jenkins 정보 세팅
		    	$.osl.setDataFormElem(jenkinsInfo,"frStm9001", ["jenId", "jenNm", "jenUrl", "jenUsrId", "jenUsrTok", "jenDesc"]);
				
				// combobox selected setting
		    	$("#useCd").attr("data-osl-value", jenkinsInfo.useCd);
				
				// 기존 토큰 정보 세팅
		    	nowJenUsrTok = jenkinsInfo.jenUsrTok;
					
				// textarea 입력된 내용에 따라 size 조정
				autosize.update($("#jenDesc"));
			}	
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
    
  	// Jenkis 등록, 수정
    var submitSaveAction = function(){
    	
    	var form = $('#'+formId);
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("stm9001.message.confirm."+type),null,function(result) {
	        if (result.value) {
	        	
	        	var formDataArray = form.serializeArray();
	        	formDataArray.push({name:"nowJenUsrTok", value:nowJenUsrTok});
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm9000/stm9000/saveStm9001JenkinsInfoAjax.do'/>"
	    			, "loadingShow": true}, formDataArray);

	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			
	    			// 등록, 수정 시 jenkins 연결 체크 결과 - 연결 체크 오류 발생시 서버에서 코드값이 전달된다.
	    			var jenConnectCheckCode = data.resultCode;
	    			
	    			// jenkins 연결 체크 시 오류 발생
	    			if(!$.osl.isNull(jenConnectCheckCode)){
	    				// 오류내용 alert를 띄우고 팝업은 닫지 않는다.
	    				$.osl.alert(data.resultMessage,{type: 'error'});
	    			
	    			// 등록&수정 실패
	    			}else if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				//모달 창 닫기
						$.osl.layerPopupClose();
	    				
    				// 등록&수정 성공
	    			}else{
	    				$.osl.toastr(data.message);
	    				//모달 창 닫기
	    				$.osl.layerPopupClose();
	    				
	    				if(type == "insert"){
		    				//datatable 조회 - 등록일 경우
		    				$("button[data-datatable-id=stm9000JenkinsTable][data-datatable-action=select]").click();
	    				}else{
	    					// 수정시 현재페이지 유지한채로 재조회
	    					$.osl.datatable.list["stm9000JenkinsTable"].targetDt.reload();	
	    				}
	    			}
	    		});
	    		
	    		//AJAX 전송
	    		ajaxObj.send();
	        }
	    });
		
    };
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

//Initialization
$.osl.ready(function(){
	OSLStm9001Popup.init();
});

	
</script>