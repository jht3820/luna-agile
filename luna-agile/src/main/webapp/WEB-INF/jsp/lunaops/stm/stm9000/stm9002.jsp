<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm4002">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="stmUseYn" id="stmUseYn" value="${param.paramStmUseYn}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<c:if test="${param.paramStmUseYn == 'Y' and requestScope.type == 'update'}">
				<div class="form-group">
					<label class="osl-font-lg"><i class="fa fa-exclamation-circle kt-margin-r-5"></i>시스템에서 사용되는 공통코드는 순번만 수정 가능합니다.</label>
				</div>
			</c:if>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-window-maximize kt-margin-r-5"></i>마스터 코드</label>
						<input type="text" class="form-control" name="mstCd" id="mstCd" placeholder="공통코드 마스터" readonly="readonly"  value="${param.mstCd}">
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<c:choose>
							<c:when test="${param.paramStmUseYn == 'N' and requestScope.type == 'insert'}">
								<!-- 공통코드 마스터가 시스템 사용중이 아니며 공통코드 디테일 등록일 경우 -->
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>서브 코드</label>
								<input type="text" class="form-control" name="subCd" id="subCd" placeholder="서브 코드" maxlength="2"  regexstr="^[0-9]{2}$" regexalert="2자리 숫자" required>
							</c:when>
							<c:otherwise>
								<label><i class="fa fa-edit kt-margin-r-5"></i>서브 코드</label>
								<input type="text" class="form-control" name="subCd" id="subCd" placeholder="서브 코드" value="${param.subCd}" readonly="readonly">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<c:choose>
				<c:when test="${param.paramStmUseYn == 'Y' and requestScope.type == 'update'}">
					<!-- begin:: 시스템 사용중인 공통코드 디테일 수정 -->
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i>서브 코드 명</label>
								<input type="text" class="form-control" name="subCdNm" id="subCdNm" placeholder="서브 코드 명" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i>보조필드 1</label>
								<input type="text" class="form-control" name="subCdRef1" id="subCdRef1" placeholder="보조필드 1" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i>보조필드 2</label>
								<input type="text" class="form-control" name="subCdRef2" id="subCdRef2" placeholder="보조필드 2"readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i>보조필드 3</label>
								<input type="text" class="form-control" name="subCdRef3" id="subCdRef3" placeholder="보조필드 3" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i>보조필드 4</label>
								<input type="text" class="form-control" name="subCdRef4" id="subCdRef4" placeholder="보조필드 4"readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i>보조필드 5</label>
								<input type="text" class="form-control" name="subCdRef5" id="subCdRef5" placeholder="보조필드 5" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
								<input type="number" class="form-control" name="ord" id="ord" placeholder="순번" value="${requestScope.nextOrd}" required>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
								<input type="text" class="form-control " placeholder="사용유무" name="useNm" id="useNm" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>서브 코드 설명</label>
						<textarea class="form-control osl-min-h-px--130" name="subCdDesc" id="subCdDesc" readonly="readonly"></textarea>
					</div>
					<!-- end:: 시스템 사용중인 공통코드 디테일 수정 -->
				</c:when>
				<c:otherwise>
					<!-- begin:: 공통코드 디테일 등록 또는 시스템 미사용인 공통코드 디테일 수정 -->
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>서브 코드 명</label>
								<input type="text" class="form-control" name="subCdNm" id="subCdNm" placeholder="서브 코드 명" minlength="2" maxlength="20" required>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-edi kt-margin-r-5"></i>보조필드 1</label>
								<input type="text" class="form-control" name="subCdRef1" id="subCdRef1" placeholder="보조필드 1" maxlength="25">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i>보조필드 2</label>
								<input type="text" class="form-control" name="subCdRef2" id="subCdRef2" placeholder="보조필드 2" maxlength="25">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i>보조필드 3</label>
								<input type="text" class="form-control" name="subCdRef3" id="subCdRef3" placeholder="보조필드 3" maxlength="25">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i>보조필드 4</label>
								<input type="text" class="form-control" name="subCdRef4" id="subCdRef4" placeholder="보조필드 4" maxlength="25">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i>보조필드 5</label>
								<input type="text" class="form-control" name="subCdRef5" id="subCdRef5" placeholder="보조필드 5" maxlength="25">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
								<input type="number" class="form-control" name="ord" id="ord" placeholder="순번" value="${requestScope.nextOrd}" required>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
								<select class="form-control kt-select2" id="useCd" name="useCd">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>서브 코드 설명</label>
						<textarea class="form-control osl-min-h-px--130" name="subCdDesc" id="subCdDesc" maxlength="100"></textarea>
					</div>
					<!-- end:: 공통코드 디테일 등록 또는 시스템 미사용인 공통코드 디테일 수정 -->
				</c:otherwise>
			</c:choose>	
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm4002SaveSubmit">완료</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>

<script>
"use strict";
var OSLStm4002Popup = function () {
	var formId = 'frStm4002';

	var type = $("#type").val();
	var stmUseYn = $("#stmUseYn").val();
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//type별 데이터
	var pageTypeData = {
			"insert":{
				"saveString": "신규 공통코드 디테일를 등록하시겠습니까?",
				"saveBtnString": "작성 완료"
			},
			"update":{
				"saveString": "공통코드 디테일 정보를 수정하시겠습니까?",
				"saveBtnString": "수정 완료"
			}
	};
	
    // Private functions
    var documentSetting = function () {
    	
    	//문구 세팅
    	$("#stm4002SaveSubmit").text(pageTypeData[type]["saveBtnString"]);
    	
    	// prj2001 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} // 사용유무
		];

    	// 시스템 사용유무값이 사용이 아닐경우에만 공통코드 세팅
    	if(stmUseYn != "Y"){
	  		//공통코드 채우기
			$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    	}
    	
    	// textarea 자동 사이즈 조절 설정
    	autosize($("#subCdDesc"));
    	
		//수정인경우
    	if(type == "update"){
    		// 디테일 코드 정보 조회
    		selectDetailCodeInfo();
    	}
    	
    	// 등록&수정버튼 클릭
    	$("#stm4002SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		
        	// 공통코드 디테일 등록&수정
        	submitSaveAction();
    	});
    	
    };

    
    // 디테일 코드 정보 단건 조회
	var selectDetailCodeInfo = function() {
    	
    	var paramMstCd = $("#mstCd").val();
    	var paramSubCd = $("#subCd").val();
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm4000/stm4000/selectStm4000CommonCodeDetailInfoAjax.do'/>", "async": false}
				,{"mstCd": paramMstCd, "subCd":paramSubCd});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				// 공통코드 마스터 정보 세팅
		    	$.osl.setDataFormElem(data.detailCodeInfoMap,"frStm4002", ["mstCd", "subCd", "subCdNm", "ord", "lvl", "subCdRef1", "subCdRef2", "subCdRef3", "subCdRef4", "subCdRef5", "stmUseYn", "subCdDesc"]);
				
		    	// 사용유무값 별도 세팅
				var useCd = "01";
		    	var useNm = "예";
				if(data.detailCodeInfoMap.useYn == "N"){
					useCd = "02";
					useNm = "아니오"
				}
				
				// 시스템 사용유무가 아니오일때만 사용유무 공통코드 세팅
				if(data.detailCodeInfoMap.stmUseYn == "N"){
					// combobox selected setting
			    	$("#useCd").attr("data-osl-value", useCd);
				// 시스템 사용유무 값이 사용일경우
				}else{
					$("#useNm").val(useNm);
				}
				
				// textarea 입력된 내용에 따라 size 조정
				autosize.update($("#subCdDesc"));
			}	
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
    
  	// 디테일 코드 등록&수정
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
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm4000/stm4000/saveStm4000CommonCodeDetailInfoAjax.do'/>", "loadingShow": false}, formData);

	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				//모달 창 닫기
						$.osl.layerPopupClose();
					// 서브코드 중복일 경우	
	    			}else if(data.duplYn == "Y"){
	    				$("#subCd").focus();
	    				$.osl.alert(data.message,{type: 'warning'});	
	    			}else{
	    				// 등록&수정 성공
	    				$.osl.toastr(data.message);

	    				//모달 창 닫기
	    				$.osl.layerPopupClose();
	    				
	    				if(type == "insert"){
		    				//datatable 조회 - 등록일 경우
		    				$("button[data-datatable-id=stm4000DetailCodeTable][data-datatable-action=select]").click();
	    				}else{
	    					// 수정시 현재페이지 유지한채로 재조회
	    					$.osl.datatable.list["stm4000DetailCodeTable"].targetDt.reload();	
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
	OSLStm4002Popup.init();
});

	
</script>