<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm6001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" id="lvl" name="lvl" value="${param.lvl}"//>
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="stm6001.label.upperDeptId">상위 조직 ID</span></label>
				<input type="text" class="form-control" placeholder="상위 조직 ID" name="upperDeptId" id="upperDeptId" value="${param.upperDeptId}" readonly="readonly">
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6001.label.upperDeptNm">상위 조직 명</span></label>
				<input type="text" class="form-control" placeholder="상위 조직 명" name="upperDeptNm" id="upperDeptNm" value="${param.upperDeptNm}" readonly="readonly">
			</div>
			<c:if test="${requestScope.type == 'update'}">
				<div class="form-group">
					<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="stm6001.label.deptId">조직 ID</span></label>
					<input type="text" class="form-control" placeholder="조직 ID" name="deptId" id="deptId" value="${param.deptId}" readonly="readonly">
				</div>
			</c:if>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6001.label.deptNm">조직명</span></label>
				<input type="text" class="form-control" placeholder="조직 명" name="deptName" id="deptName" minlength="2" maxlength="100" required>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="stm6001.label.deptOrd">순번</span></label>
				<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" value="${requestScope.nextOrd}" required>
			</div>
			<c:if test="${requestScope.type == 'update'}">
				<div class="form-group">
					<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="stm6001.label.deptUseCd">사용유무</span></label>
					<select class="form-control kt-select2" id="useCd" name="useCd">
					</select>
				</div>
			</c:if>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6001.label.deptEtc">비고</span></label>
				<textarea class="form-control osl-min-h-px--130" name="deptEtc" id="deptEtc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm6001SaveSubmit"><span data-lang-cd="stm6001.button.insert">작성 완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>

<script>
"use strict";
var OSLStm6001Popup = function () {
	
	var formId = 'frStm6001';
	var type = $("#type").val();
	
	console.log(type);
	
	// 버튼 문구 세팅
	$("#stm6001SaveSubmit > span").text($.osl.lang("stm6001.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
    // Private functions
    var documentSetting = function () {
    	
    	// textarea 자동 사이즈 조절 설정
    	autosize($("#deptEtc"));
    	
    	//수정인경우
    	if(type == "update"){
    		
        	// stm6001 팝업 공통코드 select 세팅
    		var commonCodeArr = [
    			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} // 사용유무
    		];

      		//공통코드 채우기
    		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    		
    		// 조직 단건 조회
    		selectDeptInfo();
    	}
    	
    	
    	// 등록 버튼 클릭
    	$("#stm6001SaveSubmit").click(function(){
    		
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
    	
    };

    
    /**
	 * function 명 	: selectDeptInfo
	 * function 설명	: 선택한 조직의 상세정보를 조회하여 화면에 세팅한다.
	 * @param deptId : 선택한 조직 ID
	 */
	var selectDeptInfo = function() {
    	
		var deptId = $("#deptId").val();
		 
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm6000/stm6000/selectStm6000DeptInfoAjax.do'/>", "async": false}
				,{"deptId": deptId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				// 조직 정보 세팅
		    	$.osl.setDataFormElem(data.deptInfoMap,"frStm6001", ["deptId", "upperDeptId", "upperDeptNm", "deptName", "lvl", "ord", "deptEtc"]);
			
		    	// 상위조직 Id 없을경우
				if($.osl.isNull(data.deptInfoMap.upperDeptId)){
					$("#upperDeptId").val("-");
				}
		    	
		    	if(type == "update"){
		    		$("#useCd").attr("data-osl-value", data.deptInfoMap.useCd);
		    	}
		    	
		    	// textarea 입력된 내용에 따라 size 조정
				autosize.update($("#deptEtc"));
		    	
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
		
		$.osl.confirm($.osl.lang("stm6001.message.confirm.insert"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm6000/stm6000/insertStm6000DeptInfoAjax.do'/>", "loadingShow": false}, formData);

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
	    				
	    				// 트리 재조회 추가
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
		
		$.osl.confirm($.osl.lang("stm6001.message.confirm.update"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm6000/stm6000/updateStm6000DeptInfoAjax.do'/>", "loadingShow": false}, formData);

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

	    				// 트리 재조회 추가
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
	OSLStm6001Popup.init();
});

	
</script>