<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frSpr2002" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="rptId" id="rptId" value="<c:out value='${param.rptId}'/>">
	<input type="hidden" name="sprId" id="sprId" value="<c:out value='${param.sprId}'/>">
	<input type="hidden" name="paramSprNm" id="paramSprNm" value="<c:out value='${param.sprNm}'/>">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
		<div class="form-group">
			<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">스프린트명</span></label>
			<input type="text" class="form-control" name="sprNm" id="sprNm" readonly="readonly">
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group">
					<label><i class="fa fa-user-friends kt-margin-r-5"></i>참여 인원</label>
					<div class="form-control osl-select2-view" id="rptMemSelect" name="rptMemSelect"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group">
					<label><i class="fa fa-edit kt-margin-r-5"></i>회의록 제목</label>
					<input type="text" class="form-control" id="rptNm" name="rptNm" readonly="readonly">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group form-group-last">
					<label><i class="fa fa-edit kt-margin-r-5"></i>회의록 내용</label>
					<textarea class="form-control kt-hide" name="rptDesc" id="rptDesc" readonly="readonly"></textarea>
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
    	
		//회의록 정보 가져오기 및 세팅
    	selectSprRptInfo();
    	
	};
	
    /**
	 * 	스프린트 회의록 정보 조회
	 */
	 var selectSprRptInfo = function() {
    	var data = {
    			rptId :  $("#rptId").val(),
    			sprId :  $("#sprId").val(),
    	};

		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/spr/spr2000/spr2000/selectReq2000ReqInfoAjax.do'/>", "async":"true"}
				,data);
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				//수정할때 호출
		    	$.osl.setDataFormElem(data.rptInfo,"frSpr2002");
		
				//참여 인원 정보 넣기
				var rptMemList = data.rptMemList;
				
				var str = "";
				var lastCount =  rptMemList.length;
				//참여인원 태그 형으로 넣기
				if(rptMemList != null && rptMemList.length > 0){
					$.each(rptMemList, function(idx, value){
						//참여인원 수가 8명 이하일 때만 태그형
						if(lastCount <=8){
							str += '<div class="kt-user-card-v2 btn rptMemInfo osl-outline--secondary osl-width__fit-content kt-padding-5 float-left kt-margin-5" data-user="'+value.usrId+'">'
										+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
											+'<img src="/cmm/fms/getImage.do?fileSn=0&atchFileId='+value.usrImgId+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
										+'</div>'
										+'<div class="kt-user-card-v2__details">'
											+'<span class="kt-user-card-v2__name ">'+value.usrNm+' ('+value.usrId+')</span>'
										+'</div>'
									+'</div>';
						}else{
							//참여인원 수가 9명 이상일 땐 사진형
							 str += "<a href='#' class='rptMemInfo kt-media kt-media--xs kt-media--circle' tabindex='0' data-toggle='kt-tooltip' data-skin='brand' data-placement='top' title='"+$.osl.escapeHtml(value.usrNm)+"' data-original-title='"+$.osl.escapeHtml(value.usrNm)+"' data-user='"+value.usrId+"'><img src='/cmm/fms/getImage.do?fileSn=0&atchFileId="+value.usrImgId+"'></a>";
						}
					});
				}
				if(lastCount > 8){
					$("#rptMemSelect").attr("class", "kt-media-group");
				}
				$("#rptMemSelect").append(str);
				
				//툴팁 적용
				KTApp.initTooltips();
				
				//참여인원 아이콘 클릭 시
				$(".rptMemInfo").click(function(){
					k = $(this);
					$.osl.user.usrInfoPopup($(this).data("user"));
				});
				
				//edit 세팅
	    		formEditList.push($.osl.editorSetting("rptDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:190
	    		}));
	    		
		    	//edit 세팅하고 나서 textarea 보이기
		    	$("#rptDesc").removeClass("kt-hide");
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