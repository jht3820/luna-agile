<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="armId" id="armId" value="<c:out value='${param.armId}'/>">
<form class="kt-form" id="frCmm16002" autocomplete="off">
	<div class="kt-portlet kt-margin-b-0">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<div id="sendUsrId" name="sendUsrId"></div>
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-group">
					<div id="sendDtm" name="sendDtm"></div>
				</div>
			</div>
		</div>
		<div class="kt-portlet__body">
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<input type="text" class="form-control" id="armTitle" name="armTitle" readonly="readonly">
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<textarea class="kt-hide" name="armContent" id="armContent"></textarea>
			</div>
		</div>
		<div class="row" id="fileDiv" name="fileDiv">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group kt-margin-t-10 form-group-last">
					<label>
						<i class="fa fa-file-upload kt-margin-r-5"></i>
						<span data-lang-cd="">첨부 파일</span> 
					</label>
					<div class="kt-uppy osl-max-height-260 fileReadonly" name="fileListDiv" id="fileListDiv">
						<div class="kt-uppy__dashboard"></div>
						<div class="kt-uppy__progress"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="arm1002InsertSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="">답장</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLCmm16002Popup = function () {
	var formId = 'frCmm16002';

	//atchfileId
	var atchFileId;

	//답장 받을 회원 id
	var reSendUsrId;
	
	//메시지 id
	var armId;
	
	//파일 업로드 세팅
	var fileUploadObj;
	
	//edit 목록
	var formEditList = [];
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//메시지를 받는 id를 담을 변수 선언
	var usrList = [];
	
	var documentSetting = function(){
		
		var formId = 'frCmm16002';
		
		armId = $("#armId").val();
		
		//메시지 정보 가져오기
		selectAlarmInfo();
    	
    	//답장 클릭 시
    	$("#arm1002InsertSubmit").click(function(){
    		var data = {
					type : "reInsert",
					reSendUsrId : reSendUsrId,
				};
			var options = {
					idKey: "reInsert_"+armId,
					modalTitle: "메시지 답장",
					closeConfirm: false,
					autoHeight:false,
				};
			
			$.osl.layerPopupOpen('/cmm/cmm10000/cmm16000/insertCmm16001View.do',data,options);
    	});
	};
	
	/**
	* 메시지 정보 조회 후 세팅
	*/
	var selectAlarmInfo = function(){
		var data = {
				armId : armId
		};
		
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/cmm/cmm10000/cmm16000/selectArm1000AlarmInfoAjax.do'/>", "async":"true"}
				,data);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var value = data.arm1000Info;
				
				//첨부파일 아이디
				atchFileId = value.atchFileId;
				//메시지를 보낸 사람 아이디
				reSendUsrId = value.sendUsrId;
				
				//세팅 시작
				//보낸사람
				var str = '';
				str += '<div class="kt-user-card-v2 d-inline-block sendUsrInfo" data-usr-id="'+ value.sendUsrId +'">'
							+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle float-left">'
							+'<img src="'+$.osl.user.usrImgUrlVal(value.sendUsrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
						+'</div>'
						+'<div class="kt-user-card-v2__details float-left">'
							+'<span class="kt-user-card-v2__name">'+value.sendUsrNm+'</span>'
							+'<span class="kt-user-card-v2__email">'+value.sendUsrEmail+'</span>'
						+'</div>'
					+'</div>';
				$("#sendUsrId").html(str);
				
				//클릭 이벤트
				$(".sendUsrInfo").click(function(){
					console.log("ddd");
					$.osl.user.usrInfoPopup(reSendUsrId);
				});
								
				//메시지 발송 일시
				$("#sendDtm").text(value.sendDtm);
				
				//제목
				$("#armTitle").val($.osl.escapeHtml(value.armTitle));
				
				//내용
				$("#armContent").val(value.armContent);
				
		    	//edit 세팅
				formEditList.push($.osl.editorSetting("armContent", {
					toolbar: false,
					disableDragAndDrop: true,
					'minHeight': 190,
					disableResizeEditor: false
					}
				));
		    	//edit 세팅하고 나서 textarea 보이기
		    	$("#armContent").removeClass("kt-hide");
		    	
				//파일 업로드 세팅
		    	fileUploadObj = $.osl.file.uploadSet("fileListDiv",{
		    		maxFileSize: "${requestScope.fileSumMaxSize}",
		    		meta: {"atchFileId": atchFileId, "fileSn": 0},
		    		height: 190,
		    		isDraggingOver: false,
		    		fileDownload: true,
		    		fileReadonly: true
		    	});
		    	fileUploadObj.reset();
		    	
		    	//파일Sn넣기
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	//파일 목록 세팅
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
		    	
		    	//첨부된 파일이 없을 경우
		    	if(data.fileList.length==0){
		    		$("#fileDiv").addClass("kt-hide");
		    	}
		    	
		    	//메시지를 읽었으므로
		    	//읽지 않은 메시지인 경우 메시지 읽음 처리
		    	if(value.checkCd==='02'){
			    	checkingAlarm();
		    	}
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	
	/**
	* 메시지 읽음 처리
	*/
	var checkingAlarm = function(){

		var dataList = [];
		
		var dataObject = {};
		dataObject.armId = armId;
		
		dataList.push(dataObject);
		
		var data = {
				dataList : JSON.stringify(dataList)
		};
		
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/cmm/cmm10000/cmm16000/updateArm1000AlarmInfoAjax.do'/>", "async":"true"}
				,data);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				OSLCmm16000Popup.reload();
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
	OSLCmm16002Popup.init();
});
</script>
<!-- end script -->
