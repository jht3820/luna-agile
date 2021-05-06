<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1102">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramProcessId" id="paramProcessId" value="${param.paramProcessId}">
	<input type="hidden" name="paramFlowId" id="paramFlowId" value="${param.paramFlowId}">
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
				<div class="form-group col-lg-12 col-md-12 col-sm-12">
					<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>작업흐름 기능</label>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="kt-checkbox-list">
								<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
									<input type="checkbox" name="flowEssentialCd" id="flowEssentialCd" opttype="-1"> 필수 단계
									<span></span>
								</label>
								<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
									<input type="checkbox" name="flowSignStopCd" id="flowSignStopCd" opttype="-1"> 결재 반려 시 종료
									<span></span>
								</label>
								<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
									<input type="checkbox" name="flowSignCd" id="flowSignCd" opttype="-1"> 결재 필수
									<span></span>
								</label>
								<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand kt-hide">
									<input type="checkbox" name="flowWorkCd" id="flowWorkCd" opttype="-1"> 작업 분기
									<span></span>
								</label>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 kt-hide">
							<div class="kt-checkbox-list">
								<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
									<input type="checkbox" name="flowEndCd" id="flowEndCd" opttype="-1"> 종료 분기
									<span></span>
								</label>
								<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
									<input type="checkbox" name="flowRevisionCd" id="flowRevisionCd" opttype="-1"> 소스 저장소
									<span></span>
								</label>
								<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
									<input type="checkbox" name="flowDplCd" id="flowDplCd" opttype="-1"> 배포 계획
									<span></span>
								</label>
								<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
									<input type="checkbox" name="flowAuthCd" id="flowAuthCd" opttype="-1"> 허용 역할
									<span></span>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span>작업흐름 설명</span></label>
						<textarea class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="flowDesc" id="flowDesc" maxlength="2000" opttype="-1"></textarea>
					</div>
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
var OSLPrj1102Popup = function () {
	var formId = 'frPrj1102';
	var previewFlowChart = $("#flowPreviewMain");
	
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
    		$.osl.confirm($.osl.lang("prj1102."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	//프로세스 저장
    	        	saveFormAction();
    	        }
    		});
    	});
		
		//수정인경우 프로세스 정보 조회
		if(type == "update"){
			fnFlowInfoSelect();
		}
		
    };
    
    //작업흐름 저장 (생성&수정)
    var saveFormAction = function() {
    	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	var left = 0;
    	var top = 0;
    	
   		//prj1100 flowChart있는지 체크
		if($("#flowChartDiv").length > 0 && type == "insert"){
			//현재 차트 0,0 구하기
			var flowChartTf = $("#flowChartDiv").css("transform");
			var tfData = flowChartTf.match(/-?[\d\.]+/g);
			top = parseInt(tfData[tfData.length-1])*(-1);
			left = parseInt(tfData[tfData.length-2])*(-1);
			
			//0보다 작다면 0
			if(left < 0){
				left = 0;
			}
			if(top < 0){
				top = 0;
			}
			
						
			fd.append("flowLeft",left);
			fd.append("flowTop",top);
		}
   		
    	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1100/savePrj1100FlowInfoAjax.do'/>", "async": true,"contentType":false,"processData":false ,"cache":false},fd);
    	
   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//등록 성공
   				$.osl.toastr(data.message);
   				
   				//prj1100 flowChart있는지 체크
   				if($("#flowChartDiv").length > 0){
   					if(type == "insert"){
		   				//작업흐름 데이터
		   				var operatorData = {
							top: (parseInt(top)+20),
							left: (parseInt(left)+20),
							properties: {
								id: data.newFlowId,
								title: $("#flowNm").val(),
								editable: true,
								inputs: {input_1: {label: '이전'}},
								outputs: {output_1: {label: '다음'}},
								flowTitleBgColor: $("#flowTitleBgColor").val(),
								flowTitleColor: $("#flowTitleColor").val(),
								flowEssentialCd: $("#flowEssentialCd").is(":checked")? "01": "02",
								flowSignCd: $("#flowSignCd").is(":checked")? "01": "02",
								flowSignStopCd: $("#flowSignStopCd").is(":checked")? "01": "02",
								flowEndCd: $("#flowEndCd").is(":checked")? "01": "02",
								flowWorkCd: $("#flowWorkCd").is(":checked")? "01": "02",
								flowRevisionCd: $("#flowRevisionCd").is(":checked")? "01": "02",
								flowDplCd: $("#flowDplCd").is(":checked")? "01": "02",
								flowAuthCd: $("#flowAuthCd").is(":checked")? "01": "02"
							}
						};
		   				
		   				$("#flowChartDiv").flowchart('createOperator', data.newFlowId, operatorData);
   					}
   					else if(type == "update"){
   						var flowInfo = $("#flowChartDiv").flowchart("getOperatorData",paramFlowId);
   						flowInfo.properties.title = $("#flowNm").val();
   						flowInfo.properties.flowTitleBgColor = $("#flowTitleBgColor").val();
   						flowInfo.properties.flowTitleColor = $("#flowTitleColor").val();
   						flowInfo.properties.flowEssentialCd = $("#flowEssentialCd").is(":checked")? "01": "02";
   						flowInfo.properties.flowSignCd = $("#flowSignCd").is(":checked")? "01": "02";
   						flowInfo.properties.flowSignStopCd = $("#flowSignStopCd").is(":checked")? "01": "02";
   						flowInfo.properties.flowEndCd = $("#flowEndCd").is(":checked")? "01": "02";
   						flowInfo.properties.flowWorkCd = $("#flowWorkCd").is(":checked")? "01": "02";
						flowInfo.properties.flowRevisionCd = $("#flowRevisionCd").is(":checked")? "01": "02";
						flowInfo.properties.flowDplCd = $("#flowDplCd").is(":checked")? "01": "02";
						flowInfo.properties.flowAuthCd = $("#flowAuthCd").is(":checked")? "01": "02";
						
						$("#flowChartDiv").flowchart("setOperatorData",paramFlowId, flowInfo);
   					}
   				}
   				
   				//모달 창 닫기
   				$.osl.layerPopupClose();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
    };
	
	//작업흐름 정보 조회
	var fnFlowInfoSelect = function(){
		//프로세스 정보 조회
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100FlowInfoAjax.do'/>"}
				,{paramPrjGrpId: paramPrjGrpId, paramPrjId: paramPrjId, paramProcessId: paramProcessId, paramFlowId: paramFlowId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var flowInfo = data.flowInfo;
   				
   				//form에 데이터 대입
   				$.osl.setDataFormElem(flowInfo, formId);
   				
   				//작업흐름 미리보기 title 수정
   				previewFlowChart.flowchart('setOperatorTitle', "previewOperator", flowInfo.flowNm);
   				
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