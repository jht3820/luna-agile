<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="kt-form" id="frPrj5001">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="prjEvtId" id="prjEvtId" value="${param.paramPrjEvtId}">
	<input type="hidden" name="evtType" id="evtType" value="${param.evtType}">
	
	<input type="hidden" name="evtStartDate" id="evtStartDate" value="${param.selCalendarStartDate}"/>
	<input type="hidden" name="evtEndDate" id="evtEndDate" value="${param.selCalendarEndDate}"/>
	<input type="hidden" name="evtStartTime" id="evtStartTime" value="${param.selCalendarStartTime}"/>
	<input type="hidden" name="evtEndTime" id="evtEndTime" value="${param.selCalendarEndTime}"/>
	<input type="hidden" name="evtAllDayCd" id="evtAllDayCd" value="${param.evtAllDayCd}"/>
	<div class="kt-portlet ">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtNm">일정명</span></label>
						<input type="text" class="form-control" placeholder="일정명" name="evtNm" id="evtNm" opttype="-1" maxlength="50" required>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required" for="prjGrpRange"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtRange">일정 일자</span></label>
						<input type="text" class="form-control" placeholder="일정 일자" name="evtRange" id="evtRange" readonly="readonly" required>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj5001.label.guideColor">가이드 색상</span></label>
						
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="pop_evt_onwRow_title eventColorSwapList">
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtBgColor">일정 배경 색상</span></label>
						<input type="color" class="form-control" name="evtBgColor" id="evtBgColor" value="#234abf" opttype="-1" >
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtColor">일정 색상</span></label>
						<input type="color" class="form-control" name="evtColor" id="evtColor" value="#234abf" opttype="-1" >
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtDesc">일정 설명</span></label>
						<textarea class="form-control osl-min-h-px--220 osl-textarea__resize--none" name="evtDesc" id="evtDesc" opttype="-1" maxlength="2000"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<c:choose>
		<c:when test="${param.type eq 'insert'}">
			<button type="button" class="btn btn-brand" id="prj5001SaveSubmit"><i class="fa fa-check-square"></i><span>완료</span></button>
		</c:when>
		<c:when test="${param.type eq 'update'}">
			<button type="button" class="btn btn-brand" id="prj5001SaveSubmit"><i class="fa fa-check-square"></i><span>완료</span></button>
			<button type="button" class="btn btn-brand" id="prj5001DeleteSubmit"><i class="fa fa-trash-alt"></i><span data-lang-cd="prj5001.delete.deleteBtnString">완료</span></button>
		</c:when>
		<c:when test="${param.evtType eq '04'}">
			<button type="button" class="btn btn-brand" id="prj5001DetailBtn"><i class="fa fa-external-link-alt"></i><span>요구사항 상세정보</span></button>
		</c:when>
	</c:choose>
	
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLPrj5001Popup = function () {
	var formId = 'frPrj5001';
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//type
	var type = $("#type").val();
	
	//수정인경우 대상 프로젝트 설정 ID
	var paramPrjEvtId = $("#prjEvtId").val();
	var evtType = $("#evtType").val();
	
    // Private functions
    var documentSetting = function () {
    	//기본 색상
    	var defaultEvtBgColor = "#5867dd";
 		var defaultEvtColor = "#FFFFFF";
 		

 	 	var paramSelStartDate = "${param.selCalendarStartDate}";
 	 	var paramSelEndDate = "${param.selCalendarEndDate}";
 	 	var paramSelStartTime = "${param.selCalendarStartTime}";
 	 	var paramSelEndTime = "${param.selCalendarEndTime}";
 	 	
    	//문구 세팅 
    	$("#prj5001SaveSubmit > span").text($.osl.lang("prj5001."+type+".saveBtnString"));
    	$("#prj5001DeleteSubmit > span").text($.osl.lang("prj5001.delete.deleteBtnString"));
    	
    	var defaultBgColorList = ["#5867dd","#1cac81","#1dc9b7","#ffb822","#fd397a","#645ca1","#5578eb","#e2e5ec"];
 		var defaultColorList = ["#FFFFFF","#FFFFFF","#FFFFFF","#111111","#FFFFFF","#FFFFFF","#FFFFFF","#111111"];
 		
 		//view인 경우 채우지 않음
 		if(type != "view"){
 			//기본 색상 목록 채우기
 	 		$.each(defaultBgColorList, function(idx, map){
 	 			$(".eventColorSwapList").append('<div class="osl-calendar__guide-color" data-color="'+defaultColorList[idx]+'" style="border-radius: 50%;background-color:'+map+';"></div>');
 	 		});
 	 		
 	 		//기본 색상 클릭 시 동작
 	 		$(".osl-calendar__guide-color").click(function(){
 	 			var bgColor = rgbToHex($(this).css("background-color"));
 	 			var fontColor = $(this).data("color");
 	 			$("#evtBgColor").val(bgColor);
 	 			$("#evtColor").val(fontColor);
 	 		});
 		}
 		
 		$(".osl-calendar__guide-color-div").click(function(){
 			$(".osl-calendar__guide-color-list").toggle();
 		})
		$("#evtRange").val(paramSelStartDate+" "+paramSelStartTime+" ~ "+paramSelEndDate+" "+paramSelEndTime);
		
		if(type != "view"){
	 		$.osl.date.daterangepicker($("#evtRange"), {
	 			startDate: paramSelStartDate+" "+paramSelStartTime,
	 			endDate: paramSelEndDate+" "+paramSelEndTime,
	 			showDropdowns: false,
	 			singleDatePicker:false,
	 			autoUpdateInput:false,
	 			locale: {
	 				"format": "YYYY-MM-DD HH:mm"
	 			},
	 			timePicker: true,
	 			timePicker24Hour:true,
	 			timePickerIncrement: 15,
	 		}, function(defaultConfig, start, end, label) {
				var startTime = new Date(start._d).format("HH:mm");
				var endDtTime = new Date(end._d).format("HH:mm");
				
	 			$("#evtRange").val(new Date(start._d).format('yyyy-MM-dd HH:mm')+" ~ "+new Date(end._d).format('yyyy-MM-dd HH:mm'));
	 			$("#evtStartDate").val(new Date(start._d).format("yyyy-MM-dd"));
	 			$("#evtEndDate").val(new Date(end._d).format("yyyy-MM-dd"));
	 			$("#evtStartTime").val(new Date(start._d).format("HH:mm"));
	 			$("#evtEndTime").val(new Date(end._d).format("HH:mm"));
			});
		}
    	
		var disabled = false;
		//상세정보인경우 수정 불가능
		if(type == "view"){
			disabled = true;
			$("#evtNm").prop("readonly",true);
			$("#evtDesc").prop("readonly",true);
		}
 		//일정 배경, 글씨 색상
		/* $("#frPrj5001 #evtBgColor").spectrum({showInput: true,chooseText: "선택",cancelText: "닫기",preferredFormat: "name",color: defaultEvtBgColor, disabled: disabled});
		$("#frPrj5001 #evtColor").spectrum({showInput: true,chooseText: "선택",cancelText: "닫기",preferredFormat: "name",color: defaultEvtColor, disabled: disabled}); */
		$("#frPrj5001 #evtBgColor").val(defaultEvtBgColor);
		$("#frPrj5001 #evtColor").val(defaultEvtColor);
		
		
		//submit 동작
    	$("#prj5001SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj5001."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	//프로젝트 일정 저장
    	        	saveFormAction();
    	        }
    		});
    	});
		
		//수정인경우 프로젝트 설정 정보 조회
		if(type != "insert"){
			fnPrjSetInfoSelect();
			if(type != "insert"){
				$("#prj5001DeleteSubmit").click(function(){
					var form = $('#'+formId);    		
		        	
		    		$.osl.confirm($.osl.lang("prj5001.delete.deleteString"),null,function(result) {
		    	        if (result.value) {
		    	        	//프로젝트 일정 삭제
		    	        	console.log(paramPrjEvtId);
		    	        	fnDeleteEvent(paramPrjEvtId);
		    	        }
		    		});
		    	});
			}
		}
    };
    
    //RGB값 HEX값으로 변경
    function rgbToHex ( rgbType ){ 
	    // 컬러값과 쉼표만 남기고 삭제. 
	    var rgb = rgbType.replace( /[^%,.\d]/g, "" ); 
	    // 쉼표(,)를 기준으로 분리해서, 배열에 담기. 
	    rgb = rgb.split( "," ); 
	    // 컬러값이 "%"일 경우, 변환하기. 
	    for ( var x = 0; x < 3; x++ ) { 
	    	if ( rgb[ x ].indexOf( "%" ) > -1 ) rgb[ x ] = Math.round( parseFloat( rgb[ x ] ) * 2.55 ); 
	    } 
	    // 16진수 문자로 변환. 
	    var toHex = function( string ){ 
	     string = parseInt( string, 10 ).toString( 16 ); 
	     string = ( string.length === 1 ) ? "0" + string : string; 
	
	     return string; 
	    }; 
	    var r = toHex( rgb[ 0 ] ); 
	    var g = toHex( rgb[ 1 ] ); 
	    var b = toHex( rgb[ 2 ] ); 
	    var hexType = "#" + r + g + b; 
	    return hexType; 
	} 
    
  	//일정데이터 제거
	function fnDeleteEvent(prjEvtId){
		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj5000/prj5000/deletePrj5000EvtInfoAjax.do'/>"}, {"prjEvtId": prjEvtId});
   		//ajaxObj.setData();
   		
   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//등록 성공
   				$.osl.toastr(data.message);

   				//모달 창 닫기
   				$.osl.layerPopupClose();
   				
   				//재조회 조회
   				calendar.getEventById(prjEvtId).remove();
   				//$(".fc-eventLoad-button").click();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
	}
  
    //프로젝트 일정 저장 (생성&수정)
    var saveFormAction = function() {
    	
   		//allday 구하기
		var evtStartDate = $("#evtStartDate").val();
		var evtEndDate = $("#evtEndDate").val();
		var evtStartTime = $("#evtStartTime").val();
		var evtEndTime = $("#evtEndTime").val();
		
		//시간 값이 같고 00:00 인경우
		if(evtStartTime == evtEndTime && evtStartTime == "00:00"){
			$("#evtAllDayCd").val("01");
		}else{
			$("#evtAllDayCd").val("02");
		}

    	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj5000/prj5000/savePrj5001PrjEvtInfo.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//등록 성공
   				$.osl.toastr(data.message);

   				//모달 창 닫기
   				$.osl.layerPopupClose();
   				
   				//재조회 조회
   				$(".fc-eventLoad-button").click();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
    };
    
	
	//프로젝트 일정 정보 조회
	var fnPrjSetInfoSelect = function(){
		//프로젝트 설정 정보 조회
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj5000/prj5000/selectPrj5001PrjEvtInfoAjax.do'/>"}
				,{"prjEvtId": paramPrjEvtId, "evtType":evtType});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var prjEvtInfo = data.prjEvtInfo;
   		    	//설정 값 타입이 공통 코드인 경우  공통코드 select 세팅
   				
   				$.osl.setDataFormElem(prjEvtInfo, formId);
   		    	
   				//시작일 - 종료일 입력
   				$("#evtRange").val(prjEvtInfo.evtStartFullDate+" ~ "+prjEvtInfo.evtEndFullDate);
   				if(type == "update"){
	   				$("#evtRange").data("daterangepicker").setStartDate(prjEvtInfo.evtStartFullDate);
	   				$("#evtRange").data("daterangepicker").setEndDate(prjEvtInfo.evtEndFullDate);
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
	OSLPrj5001Popup.init();
});

	
</script>