<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm16001" autocomplete="off">
	<input type="hidden" name="atchFileId" id="atchFileId" value="<c:out value='${param.atchFileId}'/>">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="reSendUsrId" id="reSendUsrId" value="<c:out value='${param.reSendUsrId}'/>">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group">
					<label><i class="fa fa-user-friends kt-margin-r-5"></i>
						<span data-lang-cd="cmm16001.label.to">받는 사람</span>
						<span class='kt-badge kt-badge--metal kt-badge--inline kt-padding-10 kt-hide' id='memCnt' name='memCnt'>0</span>
					</label>
					<select class="form-control kt-select2 select2-hidden-accessible" id="forUsrSelect" name="forUsrSelect" multiple="" data-select2-id="forUsrSelect" tabindex="-1" aria-hidden="true"></select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="cmm16001.label.title">제목</span></label>
					<input type="text" class="form-control" id="armTitle" name="armTitle" placeholder="제목" maxlength="80" required>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="cmm16001.label.content">내용</span></label>
					<textarea class="kt-hide" name="armContent" id="armContent" placeholder="내용" required></textarea>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group form-group-last">
					<label>
						<i class="fa fa-file-upload kt-margin-r-5"></i>
						<span data-lang-cd="cmm16001.label.attachments">파일 첨부</span> 
					</label>
					<div class="kt-uppy osl-max-h-px-260" id="arm1001FileUpload">
						<div class="kt-uppy__dashboard"></div>
						<div class="kt-uppy__progress"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="arm1001InsertSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="cmm16001.button.submit">보내기</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLCmm16001Popup = function () {
	var formId = 'frCmm16001';

	//atchfileId
	var atchFileId;
	
	//type
	var type;

	//답장 받을 회원 id
	var reSendUsrId;
	
	//파일 업로드 세팅
	var fileUploadObj;
	
	//edit 목록
	var formEditList = [];
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//메시지를 받는 id를 담을 변수 선언
	var usrList = [];
	
	var documentSetting = function(){
		
		type = $("#type").val();
		atchFileId = $("#atchFileId").val();
		reSendUsrId = $("#reSendUsrId").val();
		
		//문구 세팅 
    	$("#arm1001InsertSubmit > span").text($.osl.lang("cmm16001.button.submit"));
    	
    	//placeholder 세팅
    	$("#armTitle").attr("placeholder", $.osl.lang("cmm16001.placeholder.armTitle"));
    	$("#armContent").attr("placeholder", $.osl.lang("cmm16001.placeholder.armContent"));
    	
		//파일 업로드 세팅
    	fileUploadObj = $.osl.file.uploadSet("arm1001FileUpload",{
    		url: '/cmm/cmm10000/cmm16000/insertArm1000AlarmAtchFileInfo.do',
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": atchFileId, "fileSn": 0},
    		maxNumberOfFiles:20,
    		height: 260,
    		
    		//submit 전 실행 함수
    		onBeforeUpload: function(files){
    			var rtnValue = files;
    			var uploadFiles = {};
    			
    			//atchFileId 생성
				$.osl.file.makeAtchfileId(function(data){
					if(data.errorYn == "Y"){
						$.osl.toastr(data.message);
						rtnValue = [];
					}else{
						atchFileId = data.atchFileIdString;
						$("#atchFileId").val(data.atchFileIdString);
					 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
					 
						//파일명 뒤에 ms 붙이기
	    				$.each(files, function(idx, map){
	    					map.meta.atchFileId = data.atchFileIdString;
	    					
	    					var jsonTmp = {};
							jsonTmp[map.id] = map;
							uploadFiles = $.extend(uploadFiles, jsonTmp);
	    				});
						
   						//요구사항 등록
   						submitInsertAction();
   					}
				});
			},
			//uppy에 파일 업로드 할 때
			onBeforeFileAdded: function(currentFile, files){
				//등록 수정
				//추가로 등록한 파일인 경우(삭제되지 않은 업로드 파일)
				if(currentFile.source != "database" && currentFile.source != "remove"){
					var newNm = new Date().format("ssms")+"_"+currentFile.name;
					currentFile.name = newNm;
					currentFile.meta.name = newNm;
					currentFile.meta.atchFileId = $("#atchFileId").val();
					
	    			//fileSn default
	    			var fileSn = fileUploadObj.getState().meta.fileSn;
	    			currentFile.meta.fileSn = fileSn;
	    			fileUploadObj.setMeta({fileSn: (fileSn+1)});
				}
			}
		});
		
		//kt-select2 설정
		$('#forUsrSelect').select2({
			placeholder : $.osl.lang("cmm16001.placeholder.select2"),
			//option list 렌더링
			templateResult: optionFormatState,
			//tag 렌더링
			templateSelection : tagFormatState,
			//검색
	        matcher: matchCustom,
			//드롭다운 위치 지정
			dropdownParent: $("#"+formId),
			//스크롤 충돌 방지
			ftScrollUse: false,
		});
		
		//select2 클릭 이벤트
		$('#forUsrSelect').on('select2:close', function (evt) {
	        var count = $(this).select2('data').length;
	        if(count==0){
				$("#memCnt").text("0");
	        	$("#memCnt").addClass("kt-hide");
	        }
	        else{
	        	$("#memCnt").text(count);
	        	$("#memCnt").removeClass("kt-hide");
	        }
		});

		$("#memCnt").text(0);
		
		//사용자 리스트 세팅
		if(type=="insert"){
	    	selectUsrList();
		}else{
			//답장일 때
			selectUsrList(reSendUsrId);
		}
		
    	//edit 세팅
		formEditList.push($.osl.editorSetting("armContent", {formValidate: formValidate,height:190, 'minHeight': 190, disableResizeEditor: false}));
    	//edit 세팅하고 나서 textarea 보이기
    	$("#armContent").removeClass("kt-hide");
    	
    	//submit 동작
    	$("#arm1001InsertSubmit").click(function(){
			var form = $('#'+ formId);    		
			
			//폼 유효 값 체크
    		if (!form.valid()) {
    			return false;
    		}
			
			//받는 사람이 있는지 확인
			addUsrList(false);
			
			if(usrList.length==0){
				$.osl.alert($.osl.lang("cmm16001.message.inputToUser"));
				return false;
			}

			$.osl.confirm($.osl.lang("cmm16001.message.send"),null,function(result) {
    	        if (result.value) {
    	        	fileUploadObj.upload();
    	        }
    		});
    	});
	};

    /**
    * kt-select2 옵션
    */
    var optionFormatState = function(state){
    	if (!state.id) {
    	    return state.text;
   	 	}
    	var usrId = state.id;
    	var usrNm = state.element.attributes.getNamedItem("data-usr-nm").value;
    	var usrImgId = state.element.attributes.getNamedItem("data-usr-img-id").value;
    	var usrEmail = state.element.attributes.getNamedItem("data-usr-email").value;

    	var state = $(
    			'<div class="kt-user-card-v2 btn" data-usr-id="'+ usrId +'">' 
				+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
					+'<img src="'+$.osl.user.usrImgUrlVal(usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
				+'</div>'
				+'<div class="kt-user-card-v2__details float-left">'
					+'<span class="kt-user-card-v2__name float-left">'+usrNm+'</span>'
					+'<span class="kt-user-card-v2__email float-left kt-margin-l-10 osl-line-height-rem-1_5">'+usrEmail+'</span>'
				+'</div>'
			+'</div>'
   	    );
    	
    	return state;
    };
    
    /**
     * kt-select2 태그 옵션
     */
    var tagFormatState = function(state){
    	if (!state.id) {
    	    return state.id;
   	 	}
    	var usrId = state.id;
    	var usrNm = state.element.attributes.getNamedItem("data-usr-nm").value;
    	var usrImgId = state.element.attributes.getNamedItem("data-usr-img-id").value;
    	var usrEmail = state.element.attributes.getNamedItem("data-usr-email").value;

    	var state = $(
    			'<div class="kt-user-card-v2 d-inline-block" data-usr-id="'+ usrId +'">'
					+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle float-left">'
						+'<img src="'+$.osl.user.usrImgUrlVal(usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
					+'</div>'
					+'<div class="kt-user-card-v2__details float-left">'
						+'<span class="kt-user-card-v2__name">'+usrNm+'</span>'
						+'<span class="kt-user-card-v2__email">'+usrEmail+'</span>'
					+'</div>'
				+'</div>'
   	    );
    	
   	    return state;
    };
    
    /**
     * kt-select2 검색 세팅
     * param : selectUsrList 이미 선택된 사용자 리스트
     */
    var matchCustom = function(params, data){
    	//검색 값이 빈 값인경우 전체 출력
         if ($.trim(params.term) === '') {
           return data;
         }
        
         //기본 텍스트값이 없는 경우 빈 값 출력
         if (typeof data.text === 'undefined') {
           return null;
         }
         
         //이메일 값 조회
         var usrEmail = $(data.element).data("usr-email");

         //id문자열에 검색어 있으면 출력
         if (data.id.indexOf(params.term) > -1) {
           return data;
         }
         //text문자열에 검색어 있으면 출력
         else if (data.text.indexOf(params.term) > -1) {
           return data;
         }
         //email문자열에 검색어 있으면 출력
         else if (usrEmail.indexOf(params.term) > -1) {
           return data;
         }

         //검색어에 해당안되는 데이터 출력 안함
         return null;
    }
    
    /**
    * kt-select2 사용자 세팅
    * param : selectUsrList 이미 선택된 사용자 리스트
    */
	var selectUsrList = function(selectedUsrList){
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/cmm/cmm10000/cmm16000/selectArm1000AlarmUsrListAjax.do'/>", "async":"true"});
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				//사용자 선택 드롭박스 추가
				$.each(data.usrAllList, function(idx, value){
					var usrData = {
							html: value.usrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
					};
					var str = '';
					if(selectedUsrList != null && selectedUsrList != ""){
						//답장 상대가 있으므로
						$("#memCnt").text(1);
	        			$("#memCnt").removeClass("kt-hide");
	        	
						//답장인 경우 사용자 세팅에 해당 사용자 자동 입력
						if(value.usrId === selectedUsrList){
							str = '<option selected="selected" value="' + value.usrId + '" data-usr-nm="'+value.usrNm+'" data-usr-img-id="'+value.usrImgId+'" data-usr-email="'+value.email+'">' 
									+ value.usrNm
								+ '</option>';
						}else{
							str = '<option value="' + value.usrId + '" data-usr-nm="'+value.usrNm+'" data-usr-img-id="'+value.usrImgId+'" data-usr-email="'+value.email+'">' 
									+ value.usrNm
								+ '</option>';
						}
					}else{
						str = '<option value="' + value.usrId + '" data-usr-nm="'+value.usrNm+'" data-usr-img-id="'+value.usrImgId+'" data-usr-email="'+value.email+'">' 
									+ value.usrNm
								+ '</option>';
					}
					
					$("#forUsrSelect").append(str);
				});
			}
		});
		//AJAX 전송
		ajaxObj.send();
	};
	
	/**
	* function 명 	: addUsrList
	* function 설명	: 참여 인원 리스트 전달
	* param : defaultCheck 넘길 리스트가 null일 때 현재 사용자 정보 넣을지 확인(필요 true, 필요 없음false)
	*/
    var addUsrList = function(defaultCheck){

		var optionList = $(".select2-selection__rendered").children("li.select2-selection__choice");
		
		$.each(optionList, function(index, value){
			usrList.push($(value).children("div").data("usr-id"));
		});
		
		if(defaultCheck){
			if(usrList.length == 0){
				usrList.push($.osl.user.userInfo.usrId);
			}
		}
	};
	
	/**
	 * atchFileId 생성 완료 시 메시지 보내기 시작
	 */
	var submitInsertAction = function(){
		//formData
   		var fd = $.osl.formDataToJsonArray(formId);

   		fd.append("idList", JSON.stringify(usrList));
   		
       	//파일 목록 추가하기
       	fd.append("fileHistory",JSON.stringify(fileUploadObj.getFiles()));
       	
      	//파일명 뒤에 ms 붙이기
		$.each(fileUploadObj.getFiles(), function(idx, map){
			map.meta.atchFileId = $("#atchFileId").val();
			fd.append("file",map);
		});
      	
		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/cmm/cmm10000/cmm16000/insertArm1000AlarmInfoAjax.do'/>"
   			, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
			,fd);

   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//등록 성공
   				$.osl.toastr(data.message);

   				//목록 재조회
   				OSLCmm16000Popup.reload();
   			
   				//모달 창 닫기
   				$.osl.layerPopupClose();
   				
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
	OSLCmm16001Popup.init();
});
</script>
<!-- end script -->
