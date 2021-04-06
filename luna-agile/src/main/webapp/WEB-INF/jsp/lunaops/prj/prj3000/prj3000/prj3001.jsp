<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj3001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="dtParamPrjId" id="dtParamPrjId" value="${param.dtParamPrjId }">
	<input type="hidden" id="lvl" name="lvl" value="${param.lvl}"//>
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj3001.label.upperDocId">상위 산출물 ID</span></label>
				<input type="text" class="form-control" placeholder="상위 산출물 ID" name="upperDocId" id="upperDocId" value="${param.upperDocId}" readonly="readonly">
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3001.label.upperDocNm">상위 산출물 명</span></label>
				<input type="text" class="form-control" placeholder="상위 산출물 명" name="upperDocNm" id="upperDocNm" value="${param.upperDocNm}" readonly="readonly">
			</div>
			<c:if test="${requestScope.type == 'update'}">
				<div class="form-group">
					<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docId">산출물 ID</span></label>
					<input type="text" class="form-control" placeholder="산출물 ID" name="docId" id="docId" value="${param.docId}" readonly="readonly">
				</div>
			</c:if>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docNm">산출물 명</span></label>
				<input type="text" class="form-control" placeholder="산출물 명" name="docNm" id="docNm" minlength="2" maxlength="100" required>
			</div>
			<div class="form-group">
				<label><i class="fas fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docEdDtm">산출물 마감일</span></label>
				<input type="text" class="form-control" placeholder="산출물 마감일" name="docEdDtm" id="docEdDtm" readonly="readonly">
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docOrd">순번</span></label>
				<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" value="${requestScope.nextOrd}" required>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj3001.label.signUseCd">결재 사용유무</span></label>
				<select class="form-control kt-select2" id="signUseCd" name="signUseCd">
				</select>
			</div>
			<c:if test="${requestScope.type == 'update'}">
				<div class="form-group">
					<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docUseCd">사용유무</span></label>
					<select class="form-control kt-select2" id="useCd" name="useCd">
					</select>
				</div>
			</c:if>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docDesc">비고</span></label>
				<textarea class="form-control osl-min-h-px--130" name="docDesc" id="docDesc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj3001SaveSubmit"><span data-lang-cd="prj3001.button.insert">작성 완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>

<script>
"use strict";
var OSLPrj3001Popup = function () {
	
	var formId = 'frPrj3001';
	var type = $("#type").val();
	
	//산출물 아이디
	var docId = $("#docId").val();
	
	//프로젝트 아이디
	var dtParamPrjId = $("#dtParamPrjId").val();
	
	// 버튼 문구 세팅
	$("#prj3001SaveSubmit > span").text($.osl.lang("prj3001.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
    // Private functions
    var documentSetting = function () {
    	
    	// textarea 자동 사이즈 조절 설정
    	autosize($("#docEtc"));
    	
    	//수정인경우
    	if(type == "update"){
    		
        	// prj3001 팝업 공통코드 select 세팅
    		var commonCodeArr = [
    			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"}, // 사용유무
    			{mstCd: "PRJ00021", useYn: "Y",targetObj: "#signUseCd", comboType:"OS"} // 결재사용유무
    		];

      		//공통코드 채우기
    		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    		
    		// 조직 단건 조회
    		selectDocInfo();
    		
    	}else{
    		// prj3001 팝업 공통코드 select 세팅
    		var commonCodeArr = [
    			{mstCd: "PRJ00021", useYn: "Y",targetObj: "#signUseCd", comboType:"OS"} // 결재사용유무
    		];
    		
    		//공통코드 채우기
    		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    		
    	}
    	
    	
    	// 등록 버튼 클릭
    	$("#prj3001SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		
    		if(type == "insert"){
	    		submitInsertAction();
    		}else if(type == "update"){
    			submitUpdateAction();
    		}
    	});
    	
    	
    	//datepicker 세팅
    	$.osl.date.datepicker($("#docEdDtm"), {});
    };

  	
    /**
	 * function 명 	: selectDocInfo
	 * function 설명	: 선택한 산출물의 상세정보를 조회하여 화면에 세팅한다.
	 * @param docId : 선택한 산출물 ID
	 */
	var selectDocInfo = function() {
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj3000/prj3000/selectPrj3000DocInfoAjax.do'/>", "async": false}
				,{"docId": docId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				// 조직 정보 세팅
		    	$.osl.setDataFormElem(data.docInfoMap,"frPrj3001", ["upperDocId", "upperDocNm", "docId", "docEdDtm", "docNm", "ord", "docDesc"]);
			
		    	// 상위 산출물 Id 없을경우
				if($.osl.isNull(data.docInfoMap.upperDocId)){
					$("#upperDocId").val("-");
				}
		    	
				// 상위 산출물 명  없을경우
				if($.osl.isNull(data.docInfoMap.upperDocNm)){
					$("#upperDocNm").val("-");
				}
		    	
		    	
		    	if(type == "update"){
		    		$("#useCd").attr("data-osl-value", data.docInfoMap.useCd);
		    	}
		    	
		    	// textarea 입력된 내용에 따라 size 조정
				autosize.update($("#docDesc"));
		    	
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
    
   /**
 	* function 명 	: submitInsertAction
	* function 설명	: 신규 조직을 등록한다.
	*/
    var submitInsertAction = function(){
    	
    	var form = $('#'+formId);
    	
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("prj3001.message.confirm.insert"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj3000/prj3000/insertPrj3000DocInfoAjax.do'/>", "loadingShow": false}, formData);

	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				//모달 창 닫기
						$.osl.layerPopupClose();
	    			}else{
	    				// 등록 성공
	    				$.osl.toastr(data.message);

	    				//모달 창 닫기
	    				$.osl.layerPopupClose();
	    				
	    				//트리 재조회
	    				$("button[data-tree-id=prj3000DocTree][data-tree-action=select]").click();
	    			}
	    		});
	    		
	    		//AJAX 전송
	    		ajaxObj.send();
	        }
	    });
    };
    
    
   /**
 	* function 명 	: submitUpdateAction
	* function 설명	: 조직 정보를 수정한다.
	*/
    var submitUpdateAction = function(){
    	
    	var form = $('#'+formId);
  		
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("prj3001.message.confirm.update"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj3000/prj3000/updatePrj3000DocInfoAjax.do'/>", "loadingShow": false}, formData);

	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				//모달 창 닫기
						$.osl.layerPopupClose();
	    			}else{
	    				//수정 성공
	    				$.osl.toastr(data.message);

	    				//모달 창 닫기
	    				$.osl.layerPopupClose();

	    				//트리 재조회
	    				$("button[data-tree-id=prj3000DocTree][data-tree-action=select]").click();
	    				
	    				//트리 노드 정보 재조회
	    				$("button[data-tree-id=prj3000DocTree][data-tree-action=selectDocInfo]").click();
	    				
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
	OSLPrj3001Popup.init();
});

	
</script>