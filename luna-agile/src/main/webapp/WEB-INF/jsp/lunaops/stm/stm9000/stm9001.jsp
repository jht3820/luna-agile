<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm4001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="lvl" id="lvl" value="0"/>
	<input type="hidden" name="mstCdEngNm" id="mstCdEngNm" />
	<input type="hidden" name="stmUseYn" id="stmUseYn" value="${param.paramStmUseYn}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<c:choose>
				<c:when test="${param.paramStmUseYn == 'Y' and requestScope.type == 'update'}">
					<!--begin:: 시스템 사용인 공통코드 마스터 수정 -->
					<div class="form-group">
						<label class="osl-font-lg"><i class="fa fa-exclamation-circle kt-margin-r-5"></i>시스템에서 사용되는 공통코드는 순번만 수정 가능합니다.</label>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>공통코드</label>
						<input type="text" class="form-control" placeholder="공통코드 마스터" name="mstCd" id="mstCd" readonly="readonly" value="${param.paramMstCd}">
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>상위코드</label>
						<input type="text" class="form-control" placeholder="상위코드" name="upperMstCd" id="upperMstCd" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>코드명</label>
						<input type="text" class="form-control" placeholder="코드명" name="mstCdNm" id="mstCdNm" readonly="readonly">
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
						<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" value="${requestScope.nextOrd}" required>
					</div>
					<div class="form-group">
						<label><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
						<input type="text" class="form-control" placeholder="사용 유무" name="useNm" id="useNm" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-laptop kt-margin-r-5"></i>시스템 사용 유무</label>
						<input type="text" class="form-control" placeholder="시스템 사용 유무" name="stmUseNm" id="stmUseNm" readonly="readonly" value="${param.paramStmUseNm}">
					</div>	
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>코드 설명</label>
						<textarea class="form-control osl-min-h-px--130" name="mstCdDesc" id="mstCdDesc" readonly="readonly"></textarea>
					</div>
					<!--end:: 시스템 사용인 공통코드 마스터 수정 -->
				</c:when>
				<c:otherwise>
					<!-- begin:: 공통코드 마스터 등록 또는 시스템 미사용인 공통코드 마스터 수정 -->
					<div class="form-group">
						<c:choose>
							<c:when test="${requestScope.type == 'insert'}">
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>공통코드</label>
								<input type="text" class="form-control" placeholder="공통코드 마스터" name="mstCd" id="mstCd" maxlength="8" regexstr="^[A-Z|0-9]{8}$" regexalert="영문 대문자, 숫자 조합 8자리" required>
							</c:when>
							<c:otherwise>
								<label><i class="fa fa-edit kt-margin-r-5"></i>공통코드</label>
								<input type="text" class="form-control" placeholder="공통코드 마스터" name="mstCd" id="mstCd" readonly="readonly" value="${param.paramMstCd}">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>상위코드</label>
						<input type="text" class="form-control" placeholder="상위코드" name="upperMstCd" id="upperMstCd" maxlength="8" regexstr="^[A-Z|0-9]{8}$" regexalert="영문 대문자, 숫자 조합 8자리">
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>코드명</label>
						<input type="text" class="form-control" placeholder="코드명" name="mstCdNm" id="mstCdNm" minlength="2" maxlength="25" required>
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
						<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" value="${requestScope.nextOrd}" required>
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
						<select class="form-control kt-select2" id="useCd" name="useCd">
						</select>
					</div>
					<c:if test="${requestScope.type == 'update'}">
						<!-- 수정일 경우 시스템 사용유무 표시 -->	
						<div class="form-group">
							<label><i class="fa fa-laptop kt-margin-r-5"></i>시스템 사용 유무</label>
							<input type="text" class="form-control" placeholder="시스템 사용 유무" name="stmUseNm" id="stmUseNm" readonly="readonly" value="${param.paramStmUseNm}">
						</div>	
					</c:if>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>코드 설명</label>
						<textarea class="form-control osl-min-h-px--130" name="mstCdDesc" id="mstCdDesc" maxlength="100"></textarea>
					</div>
					<!-- end:: 공통코드 마스터 등록 또는 시스템 미사용인 공통코드 마스터 수정 -->
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm4001SaveSubmit">완료</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>

<script>
"use strict";
var OSLStm4001Popup = function () {
	var formId = 'frStm4001';

	var type = $("#type").val();
	var stmUseYn = $("#stmUseYn").val();
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//type별 데이터
	var pageTypeData = {
			"insert":{
				"saveString": "신규 공통코드 마스터를 등록하시겠습니까?",
				"saveBtnString": "작성 완료"
			},
			"update":{
				"saveString": "공통코드 마스터정보를 수정하시겠습니까?",
				"saveBtnString": "수정 완료"
			}
	};
	
    // Private functions
    var documentSetting = function () {
    	
    	//문구 세팅
    	$("#stm4001SaveSubmit").text(pageTypeData[type]["saveBtnString"]);
    	
    	// prj2001 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} // 사용유무
		];

		// textarea 자동 사이즈 조절 설정
    	autosize($("#mstCdDesc"));
    	
    	// 시스템 사용유무값이 사용이 아닐경우에만 공통코드 세팅
    	if(stmUseYn != "Y"){
	  		//공통코드 채우기
			$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    	}
    	
    	//수정인경우
    	if(type == "update"){
    		// 마스터 코드 정보 조회
    		selectMstCodeInfo();
    	}
    	
    	// 등록&수정버튼 클릭
    	$("#stm4001SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		
        	// 공통코드 마스터 등록&수정
        	submitSaveAction();
    	});
    	
    };

    
    // 마스터 코드 정보 단건 조회
	var selectMstCodeInfo = function() {
    	
    	var paramMstCd = $("#mstCd").val();
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm4000/stm4000/selectStm4000CommonCodeMasterInfoAjax.do'/>", "async": false}
				,{"mstCd": paramMstCd});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				// 공통코드 마스터 정보 세팅
		    	$.osl.setDataFormElem(data.mstCodeInfoMap,"frStm4001", ["mstCd", "upperMstCd", "mstCdNm", "ord", "lvl", "mstCdEngNm", "stmUseYn", "mstCdDesc"]);
				
		    	// 사용유무값 별도 세팅
				var useCd = "01";
		    	var useNm = "예";
				if(data.mstCodeInfoMap.useYn == "N"){
					useCd = "02";
					useNm = "아니오"
				}
				
				// 시스템 사용유무가 아니오일때만 사용유무 공통코드 세팅
				if(data.mstCodeInfoMap.stmUseYn == "N"){
					// combobox selected setting
			    	$("#useCd").attr("data-osl-value", useCd);
				// 시스템 사용유무 값이 사용일경우
				}else{
					$("#useNm").val(useNm);
				}
				
				// textarea 입력된 내용에 따라 size 조정
				autosize.update($("#mstCdDesc"));
				
			}	
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
    
  	// 마스터 코드 등록&수정
    var submitSaveAction = function(){
    	
    	var form = $('#'+formId);
    	
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData[type]["saveString"],null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
				// 사용여부 값에 따른 useYn값 세팅
	        	var useYn = "Y";
	        	if($("#useCd").val() == "02"){
	        		useYn = "N";
	        	} 
	        	
	        	formData.push({name:'useYn', value:useYn});
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm4000/stm4000/saveStm4000CommonCodeMasterInfoAjax.do'/>", "loadingShow": false}, formData);

	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				//모달 창 닫기
						$.osl.layerPopupClose();
					// 공통코드 마스터 중복일 경우	
	    			}else if(data.duplYn == "Y"){
	    				$("#mstCd").focus();
	    				$.osl.alert(data.message,{type: 'warning'});	
	    			}else{
	    				// 등록&수정 성공
	    				$.osl.toastr(data.message);

	    				//모달 창 닫기
	    				$.osl.layerPopupClose();
	    				
	    				if(type == "insert"){
		    				//datatable 조회 - 등록일 경우
		    				$("button[data-datatable-id=stm4000MstCodeTable][data-datatable-action=select]").click();
	    				}else{
	    					// 수정시 현재페이지 유지한채로 재조회
	    					$.osl.datatable.list["stm4000MstCodeTable"].targetDt.reload();	
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
	OSLStm4001Popup.init();
});

	
</script>