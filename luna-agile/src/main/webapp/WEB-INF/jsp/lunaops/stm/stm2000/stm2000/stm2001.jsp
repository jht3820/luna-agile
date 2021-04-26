<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm2001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="moduleType" id="moduleType" value="${param.moduleType}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
		
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-align-left kt-margin-r-5"></i>상위 메뉴 ID</label>
						<input type="text" class="form-control" placeholder="상위 메뉴 ID" name="upperMenuId" id="upperMenuId" value="${param.upperMenuId}" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-file-alt kt-margin-r-5"></i>상위 메뉴 명</label>
						<input type="text" class="form-control" placeholder="상위 메뉴 명" name="upMenuNm" id="upMenuNm" value="${param.upMenuNm}" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-align-left kt-margin-r-5"></i>메뉴 ID</label>
						<input type="text" class="form-control" placeholder="메뉴 ID는 자동 생성됩니다." name="menuId" id="menuId" value="${param.menuId}" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-file-alt kt-margin-r-5"></i>메뉴 명</label>
						<input type="text" class="form-control" placeholder="메뉴 명" name="menuNm" id="menuNm" maxlength="100" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<c:choose>
							<c:when test="${param.lvl >= '3'}">
								<!-- 소메뉴일 경우 메뉴 경로 필수입력 -->
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>메뉴 경로</label>
								<input type="text" class="form-control" placeholder="메뉴 경로" name="menuPath" id="menuPath" maxlength="250" required>
							</c:when>
							<c:otherwise>
								<label><i class="fa fa-edit kt-margin-r-5"></i>메뉴 경로</label>
								<input type="text" class="form-control" placeholder="메뉴 경로" name="menuPath" id="menuPath" maxlength="250">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<c:choose>
							<c:when test="${param.lvl >= '3'}">
								<!-- 소메뉴일 경우 메뉴 URL 필수입력 -->
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>메뉴 URL</label>
								<input type="text" class="form-control" placeholder="메뉴 URL" name="menuUrl" id="menuUrl" maxlength="250" required>
							</c:when>
							<c:otherwise>
								<label><i class="fa fa-edit kt-margin-r-5"></i>메뉴 URL</label>
								<input type="text" class="form-control" placeholder="메뉴 URL" name="menuUrl" id="menuUrl" maxlength="250">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<c:if test="${param.lvl == '2'}">
				<!-- 2레벨 메뉴는 아이콘 지정 가능 -->
				<div class="row">
					<div class="col-xl-6">
						<div class="form-group">
							<label><i class="fa fa-image kt-margin-r-5"></i>메뉴 이미지 URL</label>
							<input type="text" class="form-control" placeholder="메뉴 이미지 URL" name="menuImgUrl" id="menuImgUrl" readonly="readonly">
						</div>
					</div>
					<div class="col-xl-6">
						<div class="form-group">
							<label><i class="fa fa-info-circle kt-margin-r-5"></i>메뉴 아이콘</label>
							<input type="text" class="form-control" placeholder="메뉴 아이콘" name="menuIcon" id="menuIcon" minlength="2" maxlength="50" regexstr="^[a-z_-\s]{2,50}$" regexalert="영문 소문자, 공백, _-">
						</div>
					</div>
				</div>
			</c:if>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-folder-open kt-margin-r-5"></i>메뉴 타입</label>
						<select class="form-control kt-select2" id="menuTypeCd" name="menuTypeCd">
						</select>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-sliders-h kt-margin-r-5"></i>메뉴 레벨</label>
						<input type="text" class="form-control" placeholder="메뉴 레벨" name="lvl" id="lvl" value="${param.lvl}" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
						<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" min="1" required>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용 유무</label>
						<select class="form-control kt-select2" id="useCd" name="useCd">
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-project-diagram kt-margin-r-5"></i>프로젝트 유형</label>
						<select class="form-control kt-select2" id="prjType" name="prjType" data-osl-value="03">
						</select>
					</div>
				</div>
				<div class="col-xl-6">
				</div>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i>메뉴 설명</label>
				<textarea class="form-control osl-min-h-px--130" name="menuDesc" id="menuDesc" maxlength="100"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm2001SaveSubmit">완료</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>

<script>
"use strict";
var OSLStm2001Popup = function () {
	
	var formId = 'frStm2001';
	var type = $("#type").val();
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//type별 데이터
	var pageTypeData = {
			"insert":{
				"saveString": "신규 메뉴를 등록하시겠습니까?",
				"saveBtnString": "작성 완료"
			},
			"update":{
				"saveString": "메뉴 정보 수정은 시스템에 중대한 영향을 미칠 수 있습니다. 메뉴 정보를 수정하시겠습니까?",
				"saveBtnString": "수정 완료"
			}
	};
	
    // Private functions
    var documentSetting = function () {
    	
    	//문구 세팅
    	$("#stm2001SaveSubmit").text(pageTypeData[type]["saveBtnString"]);

    	// stm2001 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"}, // 사용유무
			{mstCd: "ADM00001", useYn: "Y",targetObj: "#menuTypeCd", comboType:"OS"}, // 메뉴 타입
			{mstCd: "ADM00006", useYn: "Y",targetObj: "#prjType", comboType:"OS"} // 프로젝트 유형
		];

  		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    	
		// textarea 자동 사이즈 조절 설정
    	autosize($("#menuDesc"));
  		
    	//수정인경우
    	if(type == "update"){
    		// 메뉴 단건 조회
    		selectMenuInfo();
    		
    	// 등록인 경우 메뉴 레벨에 따라 메뉴 타입 자동 선택	
    	}else if(type == "insert"){
    		
    		var menuTypeCd = "01";
    		var menuLvl = $("#lvl").val();
    		if(menuLvl >= 3){
    			// 메뉴 레벨이 3일 경우 메뉴타입 기본으로 화면 선택
    			menuTypeCd = "02";
    		}
    		
    		$("#menuTypeCd").attr("data-osl-value", menuTypeCd);
    	}
    	
    	
    	// 등록 버튼 클릭
    	$("#stm2001SaveSubmit").click(function(){
    		
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
	 * function 명 	: selectMenuInfo
	 * function 설명	: 선택한 메뉴의 상세정보를 조회하여 화면에 세팅한다.
	 * @param deptId : 선택한 메뉴 ID
	 */
	var selectMenuInfo = function() {
    	
		var menuId = $("#menuId").val();
		 
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2000/selectStm2000MenuInfoAjax.do'/>", "async": false}
				,{"menuId": menuId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				// 메뉴 정보 세팅
		    	$.osl.setDataFormElem(data.menuInfoMap,"frStm2001", ["upperMenuId", "upMenuNm", "menuId", "menuNm", "menuPath", "menuUrl", "menuImgUrl", "lvl", "ord", "moduleType", "menuIcon", "menuDesc"]);
			
				// 상위메뉴 Id 없을경우
				if($.osl.isNull(data.menuInfoMap.upperMenuId)){
					$("#upperMenuId").val("-");
				}
				
				// 상위 메뉴 명 없을경우
				if($.osl.isNull(data.menuInfoMap.upMenuNm)){
					$("#upMenuNm").val("-");
				}
		    	
				// 공통코드 선택값 추가
				$("#useCd").attr("data-osl-value", data.menuInfoMap.useCd);
				$("#menuTypeCd").attr("data-osl-value", data.menuInfoMap.menuTypeCd);
				$("#prjType").attr("data-osl-value", data.menuInfoMap.prjType);
				
				// textarea 입력된 내용에 따라 size 조정
				autosize.update($("#menuDesc"));
				
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
    
   /**
 	* function 명 	: submitInsertAction
	* function 설명	: 신규 메뉴를 등록한다.
	*/
    var submitInsertAction = function(){
    	
    	var form = $('#'+formId);
    	
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData[type]["saveString"],null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm2000/stm2000/insertStm2000MenuInfoAjax.do'/>", "loadingShow": false}, formData);

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
	* function 설명	: 메뉴 정보를 수정한다.
	*/
    var submitUpdateAction = function(){
    	
    	var form = $('#'+formId);
  		
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData[type]["saveString"],null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm2000/stm2000/updateStm2000MenuInfoAjax.do'/>", "loadingShow": false}, formData);

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
	OSLStm2001Popup.init();
});
</script>

