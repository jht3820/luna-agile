<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- begin page DOM -->
<form class="kt-form" id="frSpr1002" name="frSpr1002">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramSprId" id="paramSprId" value="${param.paramSprId}">
	<input type="hidden" name="sprStDt" id="sprStDt">
	<input type="hidden" name="sprEdDt" id="sprEdDt">
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__body">
			<!-- begin :: 내용 영역 -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>스프린트 명</label>
						<input type="text" class="form-control" name="sprNm" id="sprNm" opttype="-1" maxlength="99" required>
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>스프린트 기간</label>
						<input type="text" class="form-control" id="sprRange" name="sprRange" opttype="-1">
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>스프린트 설명</label> 
						<textarea type="text" class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="sprDesc" id="sprDesc" opttype="-1" required></textarea>
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required" for="ord"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>정렬 순서</span></label>
						<input type="number" class="form-control" placeholder="정렬 순서" name="ord" id="ord" value="1" opttype="-1" min="0" max="999" maxlength="3" required>
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
						<select class="form-control kt-select2" id="useCd" name="useCd" opttype="-1" required>
						</select>
						<c:if test="${param.type == 'update'}">
							<span class="form-text text-muted">대기 상태의 스프린트만 수정이 가능합니다.</span>
						</c:if>
					</div>
				</div>
			</div>
			<!-- end :: 내용 영역 -->
		</div>
	</div>
</form>
<!-- begin :: modal-footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="spr1002SaveSubmit" name="spr1002SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show">등록</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end :: modal-footer -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLSpr1002Popup = function () {
	//type
	var type = $("#type").val();
	
	var formId = 'frSpr1002'
	
	//수정인경우 대상 프로젝트 그룹, 단건, 스프린트 ID
	var paramPrjGrpId = $("#paramPrjGrpId").val();
	var paramPrjId = $("#paramPrjId").val();
	var paramSprId = $("#paramSprId").val();

	var documentSetting = function(){
		//문구 세팅 
    	$("#spr1002SaveSubmit > span").text($.osl.lang("spr1002."+type+".saveBtnString"));
		
		//edit 목록
		var formEditList = [];
		
		//form validate 주입
		var formValidate = $.osl.validate(formId);
		
		var today = new Date().format("yyyy-MM-dd");
    	//프로젝트 그룹 기간 최초 오늘 날짜 세팅
    	$("#sprStDt").val(today);
		$("#sprEdDt").val(today);
		
		// 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} // 사용유무
		];
		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
    	//datepicker 세팅
		$.osl.date.daterangepicker($("#sprRange"), {}, function(defaultConfig, start, end, label) {
			var sprStDt = new Date(start._d).format("yyyy-MM-dd");
			var sprEdDt = new Date(end._d).format("yyyy-MM-dd");
			
			$("#sprStDt").val(sprStDt);
			$("#sprEdDt").val(sprEdDt);
		});
    	
		//submit 동작
    	$("#spr1002SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("spr1002."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	//프로젝트 그룹 저장
    	        	saveFormAction();
    	        }
    		});
    	});
		
    	//수정인경우 스프린트 정보 조회
		if(type == "update"){
			fnSprInfoSelect();
		}
	};
	
	//스프린트 저장 (생성&수정)
    var saveFormAction = function() {
    	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/spr/spr1000/spr1000/saveSpr1002SprInfo.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

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
				$.osl.datatable.list["spr1000Table"].targetDt.reload();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
    };
    
    //스프린트 정보 조회
	var fnSprInfoSelect = function(deferred){
		//프로젝트 그룹 정보 조회
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000SprInfoAjax.do'/>"}
				,{paramPrjGrpId: paramPrjGrpId, paramPrjId: paramPrjId, paramSprId: paramSprId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var sprInfo = data.sprInfo;
   				
   				$.osl.setDataFormElem(sprInfo, formId, ["sprNm","useCd","ord","sprDesc","sprStDt","sprEdDt"]);
   				
   				//시작일 - 종료일 입력
   				$("#sprRange").data("daterangepicker").setStartDate(sprInfo.sprStDt);
   				$("#sprRange").data("daterangepicker").setEndDate(sprInfo.sprEdDt);
   				
   				$("#useCd").val(sprInfo.useCd).trigger('change.select2');
   				
   				//스프린트 상태가 대기일때만 사용유무 변경 가능
   				if(sprInfo.sprTypeCd != "01"){
   					$("#useCd").attr("disabled","disabled");
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
	OSLSpr1002Popup.init();
});
</script>
<!-- end script -->
