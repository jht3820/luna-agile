<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.bad_box{
		border: solid 1px #e1e1ef; 
		border-radius: 4px;
		padding: 15px;
	}
</style>

<form class="kt-form" id="bad1002Info">
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<input type="hidden" id="stmDsTypeCd" name="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
			<input type="hidden" name="menuId" id="menuId" value="${param.menuId }" /> 
			<input type="hidden" name="paramStmNtcYnCd" id="paramStmNtcYnCd" value="${param.stmNtcYnCd }" /> 
			<input type="hidden" name="paramStmPwYnCd" id="paramStmPwYnCd" value="${param.stmPwYnCd }" /> 
			<input type="hidden" name="paramStmTagYnCd" id="paramStmTagYnCd" value="${param.stmTagYnCd }" /> 
			<input type="hidden" name="paramStmCmtYnCd" id="paramStmCmtYnCd" value="${param.stmCmtYnCd }" /> 
			<input type="hidden" name="paramStmFileCnt" id="paramStmFileCnt" value="${param.stmFileCnt }" /> 
			<input type="hidden" name="paramStmFileStrg" id="paramStmFileStrg" value="${param.stmFileStrg }" /> 
			<input type="hidden" name="paramStmOptionCnt" id="paramStmOptionCnt" value="${param.stmOptionCnt }" /> 
			<input type="hidden" name="atchFileId" id="atchFileId" value="" /> 
			<div class="kt-portlet__head-label col-6 row" name="writerDiv" id="writerDiv"></div>
		</div>
		<hr class="kt-margin-0">
		<div class="kt-portlet__body">
			<div class="row">
				<!-- left -->
				<div class="col-lg-6 kt-padding-5" name="leftDiv" id="leftDiv">
					<div name="badTitleDiv" id="badTitleDiv" class="form-group">
						<label class="required"><i class="fa flaticon2-open-text-book kt-margin-r-5"></i>제목</label>
						<input type="text" class="form-control" name="badTitle" id="badTitle" required />
					</div>
					<div name="badContentDiv" id="badContentDiv" class="form-group">
						<label class="required"><i class="fa flaticon2-edit kt-margin-r-5"></i>내용</label>
						<textarea class="kt-hide" name="badContent" id="badContent" required></textarea>
					</div>
				</div>
				<!-- right -->
				<div class="col-lg-6 kt-padding-5" name="rightDiv" id="rightDiv">
					<!-- 공지사항 스위치 -->
					<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmNtcYnCd" id="stmNtcYnCd">
						<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badNtcYnCd" id="badNtcYnCd">
							 공지사항 사용
							<span></span>
						</label>
				 	</div>
			 		<!-- 공지사항 사용할 경우 표시해야하는 Div -->
				 	<div class="kt-margin-l-35 form-group row kt-hide bad_box" name="ntcOption" id="ntcOption">
				 		<div class="input-group kt-input-icon pull-right">
					 		<label class="input-group-addon kt-margin-5 kt-padding-5">공지 기간</label>
					 		<input type="text" class="form-control small" name="badNtcRange" id="badNtcRange">
				 			<span class="kt-input-icon__icon kt-input-icon__icon--right" style="height:38px; background-color: #20c997;"><span><i class="la la-calendar-check-o" style="color: #ffffff;"></i></span></span>
				 		</div>
				 		<div class="kt-margin-t-15">
					 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success kt-margin-b-0"><input type="checkbox" name="badNtcTopYnCd" id="badNtcTopYnCd">
								 공지 기간 무시
								<span></span>
							</label>
				 		</div>
				 	</div>
				 	<!-- 비밀글 스위치 -->
				 	<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmPwYnCd" id="stmPwYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badPwYnCd" id="badPwYnCd">
							 비밀글 사용
							<span></span>
						</label>
				 	</div>
				 	<!-- 비밀글 사용할 경우 표시해야하는 Div -->
				 	<div class="kt-margin-l-35 form-group row kt-hide bad_box" name="pwOption" id="pwOption">
				 		<div class="input-group kt-margin-b-10">
					 		<label class='input-group-addon  required' style="margin-top: auto; margin-bottom:auto; min-width:60px;">PW</label>
				 			<input type="password" class="form-control" name="badPw" id="badPw" regexstr="^[a-z0-9]{4,12}$"/> 
				 		</div>
				 		<div class="input-group">
					 		<label class='input-group-addon required' style="margin-top: auto; margin-bottom:auto;  min-width:60px;">PW 확인</label>
				 			<input type="password" class="form-control" name="badPwCheck" id="badPwCheck" regexstr="^[a-z0-9]{4,12}$"/>
			 			</div>
				 	</div>
				 	<!-- 댓글 스위치 -->
				 	<div class="kt-padding-l-20 form-group row kt-hide"  name="stmCmtYnCd" id="stmCmtYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badCmtYnCd" id="badCmtYnCd">
							 댓글 허용
							<span></span>
						</label>
				 	</div>
				 	<!-- 파일첨부 -->
					<div class="form-group row kt-hide" name="badFileOption" id="badFileOption">
						<div class="col-4 kt-font-bolder kt-padding-l-20">
							<i class="fa fa-file-upload kt-margin-r-5"></i>파일 첨부
						</div>
						<div class="col-12 kt-margin-t-10 kt-padding-l-20 kt-padding-r-10 kt-uppy" style="max-height:260px;" name="bad1002FileUpload" id="bad1002FileUpload">
							<div class='kt-uppy__dashboard'></div>
							<div class='kt-uppy__progress'></div>
						</div>
					</div>
					<!-- 태그 -->
					<div class="form-group row kt-margin-b-10 kt-hide" name="badTagOption" id="badTagOption">
						<div class="col-4 kt-font-bolder kt-padding-l-20">
							<i class="fa fa-hashtag kt-margin-r-5"></i> 태그
						</div>
						<div class="input-group kt-margin-t-10 kt-margin-l-20 kt-margin-r-10">
							<div class="input-group-prepend">
								<span class="input-group-text">#</span>
							</div>
							<input type="text" class="form-control col-5" name="tagWriter" id="tagWriter" maxlength="30" />
						</div>
						<!-- 태그 리스트 -->
						<div class="kt-margin-t-20 kt-padding-l-15" name="tagListDiv" id="tagListDiv">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-brand" id="bad1002InsertSubmit">등록</button>
			<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
		</div>
	</div>
</form>
<!-- begin page script -->
<script>
"use strict";
var OSLBad1002Popup = function () {
	var formId = 'bad1002Info';

	// form validate 주입
	var formValidate = $.osl.validate(formId);
	
	// edit 목록
	var formEditList = [];
	
	// tag
	var tag = [];
	
	//fileUpload 후에 게시글 등록 때 사용할 데이터
	var data ={};
	
	//출력 문구
	var pageTypeData = {
			"insert":{
				"saveString" : "글 작성을 완료하시겠습니까?",
				"saveBtnString" : "작성 완료"
			}
	};
	//fileObject
	var fileUploadObj;
    var documentSetting = function () {
    	
		//문구 세팅
    	$("#bad1002InsertSubmit").text(pageTypeData["insert"]["saveBtnString"]);
		
    	//게시판 옵션이 없을 경우 div 변경
    	if($("#paramStmOptionCnt").val()==0){
    		$("#leftDiv").attr("class", "col-lg-12 kt-padding-5");
    		$("#rightDiv").addClass("kt-hide");
    	}else{
    		var maxStrg = $("#paramStmFileStrg").val();
    		if(maxStrg == null || maxStrg == ""){
    			maxStrg = 0;			
    		}
    		var maxCnt = parseInt($("#paramStmFileCnt").val());
    		if(maxStrg == null || maxStrg == ""){
    			maxCnt = 0;
    		}
    		// 파일 업로드 세팅
    		fileUploadObj = $.osl.file.uploadSet("bad1002FileUpload",{
    			url: '/bad/bad1000/bad1000/insertBad1002BadAtchFileInfo.do',
    			meta: {"atchFileId": $("#atchFileId").val(), "fileSn": 0},
    			maxFileSize: maxStrg,
    			maxNumberOfFiles: maxCnt,
    			height: 260,
    			
    			//파일 업로드 전 실행
    			onBeforeUpload: function(files){
    				var rtnValue = files;
    				var uploadFiles = {};
    				
    				//atchFileId 생성
    				$.osl.file.makeAtchfileId(function(data){
    					if(data.errorYn == "Y"){
    						$.osl.toastr(data.message);
    						rtnValue = [];
    					}else{
    						$("#atchFileId").val(data.atchFileIdString);
    					 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
    					 
    						//파일명 뒤에 ms 붙이기
    	    				$.each(files, function(idx, map){
    	    					map.meta.atchFileId = data.atchFileIdString;
    	    					
    	    					var jsonTmp = {};
    							jsonTmp[map.id] = map;
    							uploadFiles = $.extend(uploadFiles, jsonTmp);
    	    				});
    						
    	    				rtnValue = uploadFiles;
    	    				
    						//게시글 등록
    						submitInsertAction(data);
    					}
    				});
    			},
    			//파일 업로드 시 건당 발생 함수
    			onBeforeFileAdded: function(currentFile, files){
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
    		setOption();
    	}

    	//submit 동작
    	$("#bad1002InsertSubmit").click(function(){
    		
			var form = $('#'+formId);    		
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		
    		//제목 널 체크
    		var badTitle = $("#badTitle").val().trim();
    		if(badTitle == null || badTitle == ""){
    			$("#badTitle").val("");
    			$("#badTitle").focus();
    			return;
    		}
    		
    		//첨부파일 가능 개수 넘기는지 확인
			if($(".uppy-Dashboard-files").children("li").length > Number($("#paramStmFileCnt").val())){
				$.osl.alert($.osl.lang("bad1002.formCheck.fileCntMessage", $("#paramStmFileCnt").val()), {"type":"warning"});
				return;
			}
    					
    		//Content가 valid 체크가 안되므로 별도 체크
    		var badContent = $("#badContent").val().replace(/(<([^>]+)>)/ig,"").replace(/&nbsp;/g, '').trim();
    		
    		if( badContent == "" || badContent == null ){
    			$.osl.alert("내용을 입력하세요");
    			$("#badContent").val("");
    			$("#badContent").focus();
    			return;
    		}
    		
     		var localData = {};
     		
     		// 기본 데이터 가져오기
     		localData.badTitle = $("#badTitle").val();
     		localData.badContent = $("#badContent").val();
     		
   			if($("#paramStmOptionCnt").val() > 0){
           		//공지사항 사용할 경우
          		if($("#badNtcYnCd").is(":checked")==true){
          			//dateRange 기간 입력
          			var stdtm = ($("#badNtcRange").val()).split(" - ")[0];
          			var eddtm = ($("#badNtcRange").val()).split(" - ")[1];
      	    		
          			localData.badNtcStdtm = stdtm;
          			localData.badNtcEddtm = eddtm;
          				
          			//공지기간 무시 체크한 경우
      	    		if($("#badNtcTopYnCd").is(":checked")==true){
      	    			localData.badNtcType = '03';
      	    		}else{
      	    			localData.badNtcType = '02';
      	    		}
      			}
          		
          		//비밀글 사용할 경우
          		if($("#badPwYnCd").is(":checked")==true){
          			if($("#badPw").val() != null && $("#badPw").val() != ""){
          				if($("#badPw").val()==$("#badPwCheck").val()){
              				localData.badPw = $("#badPw").val();
              			}else{
              				$.osl.alert($.osl.lang("bad1002.formCheck.passwordMatching"));
              				$("#badPw").val("");
              				$("#badPwCheck").val("");
              				$("#badPw").focus();
              				return false;
              			}
          			}else{
          				$.osl.alert($.osl.lang("bad1002.formCheck.passwordMessage"));
          				$("#badPw").focus();
          				return false;
          			}
          		}

          		//태그
          		localData.tagList = JSON.stringify(tag);
          		
      			//댓글
          		if($("#badCmtYnCd").is(":checked")==true){
          			localData.badCmtYn = "01";
          		}else{
          			localData.badCmtYn = "02";
          		}
          		
          		$.osl.confirm(pageTypeData["insert"]["saveString"],null,function(result) {
          	        if (result.value) {
          	        	data = localData;
          	        	data.menuId = $("#menuId").val();
          	        	fileUploadObj.upload();
          	        }
          		});
          		
          		//태그
           	   $("#tagWriter").on("keypress", function (e) {
           	        var self = $(this);
           	        // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
           	        if (e.key == "Enter" || e.keyCode == 32) {
           	            var tagValue = self.val();
           	            // 값이 없으면 검사 안함
           	            if (tagValue != "") {
           	                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
           	                var result = Object.values(tag).filter(function (word) {
           	                    return word == tagValue;
           	                })
           	            
           	                // 태그 중복 검사
           	                if (result.length == 0) { 
           	                	var innerHtml = "";
           	                	innerHtml += "<tag title='"+$.osl.escapeHtml(tagValue)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-margin-5 kt-padding-5' style='display: inline-flex' role='tag' value='"+$.osl.escapeHtml(tagValue)+"'>";
           	                	innerHtml += "<x class='tagify__tag__removeBtn kt-margin-l-10' role='button' aria-label='remove tag'></x>";
           	                	innerHtml += "<div><div class='tagify__tag-text kt-margin-l-5'>"+$.osl.escapeHtml(tagValue)+"</div></div></tag>";
           	                	
           	                    $("#tagListDiv").append(innerHtml);
           	                    tag.push(tagValue);
           	                    self.val("");
           	                } else {
           	                	$.osl.toastr($.osl.lang("bad1002.formCheck.tagMatching"), {"type" : "warning"});
           	                    $("#tagWriter").val("");
           	                }
           	            }
           	         // SpaceBar 시 빈공간이 생기지 않도록 방지
           	            e.preventDefault(); 
           	        }
           	    });
           	   
           		// 태그 삭제(document 대신...?)
           	    $(document).off("click", ".tagify__tag__removeBtn").on("click", ".tagify__tag__removeBtn", function (e) {
           	    	//상위 태그명 가져오기
           	    	var tagText = $(this).parent().attr("value");
           	    	//배열에서 일치하는 인덱스 번호 가져오기
           	    	var idx = tag.indexOf(tagText);
           	    	//가져온 인덱스 삭제하기
           	    	tag.splice(idx, 1);
           	    	//태그 지우기
           	    	$(this).parent().remove();
           	    });
     		}
    	});
    }
    
 	// 게시판 속성에 따라 데이터 작성 포맷 가져오기
    /**
	* function 명 	: setOption
	* function 설명	: 게시글 정보를 조회하여 팝업에 세팅한다.
	*/
    var setOption = function(){
		// 가져온 데이터로 세팅하기
		// head ------------------
		// 작성자 정보 넣기
		$("#writerDiv").empty();
		$("#writerDiv").append($.osl.user.usrImgSet($.osl.user.userInfo.usrImgId, $.osl.user.userInfo.usrNm+" ( "+$.osl.user.userInfo.usrId+" )"));
		
		// body ------------------
		//edit 세팅
    	formEditList.push($.osl.editorSetting("badContent", {formValidate: formValidate, 'minHeight': 420}));
    	$("#badContent").removeClass("kt-hide");
		
    	if($("#paramStmOptionCnt").val()>0){
			// 게시판 속성 : 공지사항 기능을 사용하는 경우
			if($("#paramStmNtcYnCd").val() == "01"){
				$("#stmNtcYnCd").removeClass("kt-hide");
				$.osl.date.daterangepicker($("#badNtcRange"));
			}else{
				$("#stmNtcYnCd").addClass("kt-hide");
			}
	
	    	// 공지사항 스위치
	    	$("#badNtcYnCd").click(function(){
	    		if($("#badNtcYnCd").is(":checked")==true){
	    			//세부 속성 보이기
	    			$("#ntcOption").removeClass("kt-hide");
	    		}else{
	    			//세부 속성 숨기기
	    			$("#ntcOption").addClass("kt-hide");
	    		}
	    	});
	    	
	    	// 비밀번호 스위치
	    	$("#badPwYnCd").click(function(){
	    		if($("#badPwYnCd").is(":checked")==true){
	    			//세부 속성 보이기
	    			$("#pwOption").removeClass("kt-hide");
	    		}else{
	    			//세부 속성 숨기기
	    			$("#pwOption").addClass("kt-hide");
	    		}
	    	});
			
			// 비밀글
			if($("#paramStmPwYnCd").val()  == "01"){
				$("#stmPwYnCd").removeClass("kt-hide");
			}else{
				$("#stmPwYnCd").addClass("kt-hide");
			}
	
			// 비밀번호 스위치
	    	$("#badPwYnCd").click(function(){
	    		if($("#badPwYnCd").is(":checked")==true){
	    			//세부 속성 보이기
	    			$("#pwOption").removeClass("kt-hide");
	    		}else{
	    			//세부 속성 숨기기
	    			$("#pwOption").addClass("kt-hide");
	    		}
	    	});
			
			// 첨부파일
			if($("#paramStmFileCnt").val()  != null && $("#paramStmFileCnt").val() != "" && $("#paramStmFileCnt").val()!= 0){
				$("#badFileOption").removeClass("kt-hide");
			}else{
				$("#badFileOption").addClass("kt-hide");
			}
			
			// 태그
			if($("#paramStmTagYnCd") == "01"){
				$("#badTagOption").removeClass("kt-hide");
			}else{
				$("#badTagOption").addClass("kt-hide");
			}
			
			// 댓글
			if($("#paramStmCmtYnCd") == "01"){
				$("#stmCmtYnCd").removeClass("kt-hide");
				$("#badCmtDiv").removeClass("kt-hide");
			}else{
				$("#stmCmtYnCd").addClass("kt-hide");
				$("#badCmtDiv").addClass("kt-hide");
			}
    	}
	}
	
    /**
	* function 명 	: submitInsertAction
	* function 설명	: 첨부파일 atchFileId 생성 후 게시글 등록
	*/
    var submitInsertAction = function(){
		//파일 목록 추가하기
		data.atchFileId = $("#atchFileId").val();
		data.fileSn = 0;
		
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/bad/bad1000/bad1000/insertBad1002BadInfoAjax.do'/>"}
				, data);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn=="Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				//등록 성공
   				$.osl.toastr(data.message);

   				//모달 창 닫기
   				$.osl.layerPopupClose();
   				
	   			//datatable 조회
   				$("button[data-datatable-id=bad1000BadTable][data-datatable-action=select]").click();
			}
		});
		
		//AJAX 전송
   		ajaxObj.send();
		
    };
    
    return {
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLBad1002Popup.init();
});
</script>