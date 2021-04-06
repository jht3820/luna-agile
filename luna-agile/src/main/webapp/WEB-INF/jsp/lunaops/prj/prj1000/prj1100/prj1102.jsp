<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1102">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramProcessId" id="paramProcessId" value="${param.paramProcessId}">
	<input type="hidden" name="paramFlowId" id="paramFlowId" value="${param.paramFlowId}">
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>작업흐름 정보
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-15">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="osl-flowchart-preview" id="flowPreviewMain"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>작업흐름 명</span></label>
								<input type="text" class="form-control" placeholder="작업흐름 명" name="flowNm" id="flowNm" opttype="-1" required>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>제목 배경 색상</label>
								<input type="color" class="form-control" placeholder="제목 배경 색상" name="flowTitleBgColor" id="flowTitleBgColor" value="#FFFFFF" opttype="-1" readonly="readonly">
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>제목 글씨 색상</label>
								<input type="color" class="form-control" placeholder="제목 글씨 색상" name="flowTitleColor" id="flowTitleColor" value="#000000" opttype="-1" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span>작업흐름 설명</span></label>
								<textarea class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="flowDesc" id="flowDesc" maxlength="2000" opttype="-1" required></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>작업흐름 기능 정보
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-15">
				
				
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1101SaveSubmit"><i class="fa fa-save"></i><span>완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
	var previewFlowChart = $("#flowPreviewMain");
var OSLPrj1102Popup = function () {
	var formId = 'frPrj1102';
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//type
	var type = $("#type").val();
	
	//수정인경우 대상 ID
	var paramPrjGrpId = $("#paramPrjGrpId").val();
	var paramPrjId = $("#paramPrjId").val();
	var paramProcessId = $("#paramProcessId").val();
	var paramFlowId = $("#paramFlowId").val();
	
    // Private functions
    var documentSetting = function () {
    	//문구 세팅 
    	$("#prj1101SaveSubmit > span").text($.osl.lang("modal."+type+".saveBtnString"));
		
    	//작업흐름 미리보기 동작
    	var data = {
			operators: {
				previewOperator: {
					top: 10,
					left: 10,
					properties: {
						id: "previewOperator",
						title: '작업흐름 명',
						inputs: {
							input_1: {
								label: 'Input 1',
							}
						},
						outputs: {
							output_1: {
								label: 'Output 1',
							}
						}
					}
				}
			}
		};
    	
    	//flowchart 생성
		previewFlowChart.flowchart({
				canUserMoveOperators: false,
				canUserEditLinks: false,
				distanceFromArrow:1,
				linkWidth:1,
				defaultLinkColor: "#5867dd",
				defaultOperatorClass: "osl-flowchart__operator",
				data: data
		});
    	
    	//작업흐름명, 배경색상, 글씨색상 변경시 적용
    	$("#flowNm, #flowTitleBgColor, #flowTitleColor").blur(function(){
    		//대상
    		var targetId = this.id;
    		
    		//작업흐름 데이터
    		var previewOperator = previewFlowChart.flowchart("getOperatorData","previewOperator");
    		
    		//대상이 작업흐름명
    		if(targetId == "flowNm"){
    			//작업흐름 타이틀 수정
    			previewOperator.properties.title = this.value;
    		}
    		//배경 색상
    		else if(targetId == "flowTitleBgColor"){
    			previewOperator.properties["flowTitleBgColor"] = this.value;
    			
    		}
    		//글씨 색상
    		else if(targetId == "flowTitleColor"){
    			previewOperator.properties["flowTitleColor"] = this.value;
    		}
    		
    		previewFlowChart.flowchart("setOperatorData","previewOperator",previewOperator);
    	});
    	
		//submit 동작
    	$("#prj1101SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj1101."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	//프로세스 저장
    	        	saveFormAction();
    	        }
    		});
    	});
		
		//수정인경우 프로세스 정보 조회
		if(type == "update"){
			fnProcessInfoSelect();
		}
		
    };
    
    //프로세스 저장 (생성&수정)
    var saveFormAction = function() {
    	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	//추가된 담당자 목록
    	var authUsrList = $.osl.datatable.list["prj1101ProcessAuthUsrTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(authUsrList) && authUsrList.length > 0){
    		var usrIdList = [];
    		$.each(authUsrList, function(idx, map){
    			usrIdList.push({licGrpId: map.licGrpId, authTypeCd: map.authTypeCd, usrId: map.usrId});
    		});
    		fd.append("usrIdList",JSON.stringify(usrIdList));
    	}

    	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1100/savePrj1100ProcessInfoAjax.do'/>", "async": true,"contentType":false,"processData":false ,"cache":false},fd);
    	
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
   				if($.osl.datatable.list.hasOwnProperty("prj1100PrjTable")){
	   				$.osl.datatable.list["prj1100PrjTable"].targetDt.reload();
   				}
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
    };
	
	//프로세스 정보 조회
	var fnProcessInfoSelect = function(){
		//프로세스 정보 조회
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100ProcessInfoAjax.do'/>"}
				,{paramPrjGrpId: paramPrjGrpId, paramPrjId: paramPrjId, paramProcessId: paramProcessId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var processInfo = data.processInfo;
   				
   				$.osl.setDataFormElem(processInfo, formId);
   				$("#useCd").val(processInfo.useCd).trigger('change.select2');
   				$("#processTransferCd").val(processInfo.processTransferCd).trigger('change.select2');
   				
   				if(data.hasOwnProperty("processAuthList") && data.processAuthList.length > 0){
   					//원본 데이터 저장
					prjAuthOriginalData = data.processAuthList;
   						 
	   				//대상 데이터 테이블
	   				var datatable = $.osl.datatable.list["prj1101ProcessAuthUsrTable"].targetDt;
	   			
	   				//데이터테이블 error class 제거
	   				datatable.eq(0).removeClass("kt-datatable--error");
	   				
	   				$.each(data.processAuthList, function(idx, map){
		   				//담당자 배정 목록 추가
		   				datatable.dataSet.push(map);
						datatable.originalDataSet.push(map);
						
						//중복체크 추가
						prjAuthUsrIdList.push(map.usrId);
	   				});
					
					//데이터 추가
					datatable.insertData();
					//데이터테이블 재 조회
					datatable.reload();
					$.osl.datatable.list["prj1101ProcessAuthNoneUsrTable"].targetDt.reload();
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

// Initialization
$.osl.ready(function(){
	OSLPrj1102Popup.init();
});

	
</script>