<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frSpr2002" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="mmtId" id="mmtId" value="<c:out value='${param.mmtId}'/>">
	<input type="hidden" name="sprId" id="sprId" value="<c:out value='${param.sprId}'/>">
	<input type="hidden" name="paramSprNm" id="paramSprNm" value="<c:out value='${param.sprNm}'/>">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
		<div class="form-group kt-margin-b-0">
			<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2001.label.sprNm">스프린트명</span></label>
			<input type="text" class="form-control" name="sprNm" id="sprNm" readonly="readonly">
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="kt-portlet kt-portlet--collapsed osl-remove__box-shadow" id="spr2002MeetingMemberList">
					<div class="kt-portlet__head kt-padding-0 border-0">
						<div class="kt-portlet__head-label">
							<i class="fa fa-user-friends kt-margin-r-5"></i>
							<span data-lang-cd="spr2001.label.mmtMem">참여 인원</span>
							<span class='kt-badge kt-badge--metal kt-badge--inline kt-margin-5 kt-padding-10' id='memCnt' name='memCnt'>0</span>
						</div>
						<div class="kt-portlet__head-toolbar">
							<div class="kt-portlet__head-group">
								<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body kt-padding-5 osl-outline--secondary-t-1">
						<div class="row">
							<div class="form-control osl-select2-view border-0" id="mmtMemSelect" name="mmtMemSelect"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group">
					<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2001.label.mmtNm">회의록 제목</span></label>
					<input type="text" class="form-control" id="mmtNm" name="mmtNm" readonly="readonly">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group form-group-last">
					<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2001.label.mmtDesc">회의록 내용</span></label>
					<textarea class="form-control kt-hide" name="mmtDesc" id="mmtDesc" readonly="readonly"></textarea>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<!-- begin page script -->
<script>
"use strict";
var k;
var OSLSpr2002Popup = function () {
	var formId = 'frSpr2002';
	
	//edit 목록
	var formEditList = [];
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);

	// Private functions
    var documentSetting = function () {
    	
    	//Portlet 세팅
    	new KTPortlet('spr2002MeetingMemberList', $.osl.lang("portlet"));
    	
		//회의록 정보 가져오기 및 세팅
    	selectSprMmtInfo();
    	
	};
	
    /**
	 * 	스프린트 회의록 정보 조회
	 */
	 var selectSprMmtInfo = function() {
    	var data = {
    			mmtId :  $("#mmtId").val(),
    			sprId :  $("#sprId").val(),
    	};

		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/spr/spr2000/spr2000/selectSpr2000MmtInfoAjax.do'/>", "async":"true"}
				,data);
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				//수정할때 호출
		    	$.osl.setDataFormElem(data.mmtInfo,"frSpr2002");
		
				//참여 인원 정보 넣기
				var mmtMemList = data.mmtMemList;
				
				var str = "";
				var lastCount =  mmtMemList.length;
				if(lastCount>0){
					$("#memCnt").text(lastCount);
				}
				
				//참여인원 태그 형으로 넣기mmtMemInfo
				if(!$.osl.isNull(mmtMemList)){
					$.each(mmtMemList, function(idx, value){
						str += '<div class="kt-user-card-v2 d-inline-block mmtMemInfo osl-outline--secondary kt-padding-5 kt-margin-l-5 kt-margin-r-5" data-user="'+ value.usrId +'">'
									+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle float-left">'
										+'<img src="'+$.osl.user.usrImgUrlVal(value.usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
									+'</div>'
									+'<div class="kt-user-card-v2__details float-left">'
										+'<span class="kt-user-card-v2__name">'+value.usrNm+'</span>'
										+'<span class="kt-user-card-v2__email">'+value.usrEmail+'</span>'
									+'</div>'
								+'</div>';
					});
				}
				
				$("#mmtMemSelect").append(str);
				
				//툴팁 적용
				//KTApp.initTooltips();
				
				//참여인원 아이콘 클릭 시
				$(".mmtMemInfo").click(function(){
					$.osl.user.usrInfoPopup($(this).data("user"));
				});
				
				//edit 세팅
	    		formEditList.push($.osl.editorSetting("mmtDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:190
	    		}));
	    		
		    	//edit 세팅하고 나서 textarea 보이기
		    	$("#mmtDesc").removeClass("kt-hide");
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        },
    };
}();

// Initialization
$.osl.ready(function(){
	OSLSpr2002Popup.init();
});

	
</script>