<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form class="kt-form" id="bad1003Info">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<input type="hidden" id="stmDsTypeCd" name="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
			<input type="hidden" id="stmRootYn" name="stmRootYn" value='${param.stmRootYn}'/>
			<input type="hidden" name="paramRow" id="paramRow" value='${param.paramRow }' />
			
			<div class="kt-portlet__head-label" name="writerDiv" id="writerDiv"></div>
		</div>
		<!-- <hr class="kt-margin-0"> -->
		<div class="kt-portlet__body">
			<div class="row">
				<!-- left -->
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12" name="leftDiv" id="leftDiv">
					<div name="badTitleDiv" id="badTitleDiv" class="kt-margin-b-10">
						<label class="required"><i class="fa flaticon2-open-text-book kt-margin-r-5"></i><span data-lang-cd="bad1003.label.title">제목</span></label>
						<input type="text" class="form-control" name="badTitle" id="badTitle" autocomplete="off" required />
					</div>
					<div name="badContentDiv" id="badContentDiv" class="kt-margin-b-10">
						<label class="required"><i class="fa flaticon2-edit kt-margin-r-5"></i><span data-lang-cd="bad1003.label.content">내용</span></label>
						<textarea class="kt-hide" name="badContent" id="badContent" autocomplete="off" required></textarea>
					</div>
				</div>
				<!-- right -->
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12 osl-1400-desktop-padding-0" name="rightDiv" id="rightDiv">
					<!-- 공지사항 스위치 -->
					<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmNtcYnCd" id="stmNtcYnCd">
						<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badNtcYnCd" id="badNtcYnCd">
							<span></span>
						</label>
							<span data-lang-cd="bad1003.label.noticeCheck">공지사항 사용</span>
				 	</div>
			 		<!-- 공지사항 사용할 경우 표시해야하는 Div -->
				 	<div class="kt-margin-l-35 form-group kt-hide osl-bad_box" name="ntcOption" id="ntcOption">
				 		<div class="input-group kt-input-icon pull-right">
					 		<label class="input-group-addon kt-margin-5 kt-padding-5"><span data-lang-cd="bad1003.label.noticeDate">공지 기간</span></label>
					 		<input type="text" class="form-control small" name="badNtcRange" id="badNtcRange" autocomplete="off"/>
				 			<span class="kt-input-icon__icon kt-input-icon__icon--right kt-bg-brand osl-h-px-38"><span><i class="la la-calendar-check-o kt-font-light"></i></span></span>
				 		</div>
				 		<div class="row kt-padding-t-10 kt-padding-l-15">
					 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success kt-margin-t-10 kt-margin-b-0"><input type="checkbox" name="badNtcTopYnCd" id="badNtcTopYnCd">
								<span></span>
							</label>
							<span data-lang-cd="bad1003.label.noticeDateIgnore">공지 기간 무시</span>
				 		</div>
				 	</div>
				 	<!-- 비밀글 스위치 -->
				 	<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmPwYnCd" id="stmPwYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badPwYnCd" id="badPwYnCd">
							<span></span>
						</label>
							<span data-lang-cd="bad1003.label.secretCheck">비밀글 사용</span>
				 	</div>
				 	<!-- 비밀글 사용할 경우 표시해야하는 Div -->
				 	<div class="kt-margin-l-35 kt-margin-b-10  kt-hide osl-bad_box" name="pwOption" id="pwOption">
				 		<div class="input-group kt-margin-b-10">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-70 required'><span data-lang-cd="bad1003.label.password">PW</span></label>
				 			<input type="password" class="form-control" name="badPw" id="badPw" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexalert="알파벳과 숫자 조합 4-12자 이내"/> 
				 		</div>
				 		<div class="input-group">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-70 required'><span data-lang-cd="bad1003.label.passwordCheck">PW 확인</span></label>
				 			<input type="password" class="form-control" name="badPwCheck" id="badPwCheck" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexalert="알파벳과 숫자 조합 4-12자 이내" equalTo="#badPw"/>
			 			</div>
				 	</div>
				 	<!-- 댓글 스위치 -->
				 	<div class="kt-padding-l-20 form-group row kt-hide"  name="stmCmtYnCd" id="stmCmtYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badCmtYnCd" id="badCmtYnCd">
							<span></span>
						</label>
							<span data-lang-cd="bad1003.label.commentCheck">댓글 허용</span>
				 	</div>
				 	<!-- 파일첨부 -->
					<div class="form-group row kt-hide" name="badFileOption" id="badFileOption">
						<div class="col-4 kt-font-bolder kt-padding-l-20">
							<i class="fa fa-file-upload kt-margin-r-5"></i><span data-lang-cd="bad1003.label.attachFile">파일 첨부</span>
							<button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn"><span data-lang-cd="bad1003.button.deleteResetBtn">삭제 초기화</span></button>
						</div>
						<div class="col-12 kt-margin-t-10 kt-padding-l-20 kt-padding-r-10 kt-uppy osl-max-h-px-260" name="bad1003FileUpload" id="bad1003FileUpload">
							<div class='kt-uppy__dashboard'></div>
							<div class='kt-uppy__progress'></div>
						</div>
					</div>
					<!-- 태그 -->
					<div class="form-group row kt-margin-b-10 kt-hide" name="badTagOption" id="badTagOption">
						<div class="col-4 kt-font-bolder kt-padding-l-20">
							<i class="fa fa-hashtag kt-margin-r-5"></i><span data-lang-cd="bad1003.label.tag">태그</span>
						</div>
						<div class="input-group kt-margin-t-10 kt-margin-l-20 kt-margin-r-10">
							<div class="input-group-prepend">
								<span class="input-group-text">#</span>
							</div>
							<input type="text" class="form-control col-5" name="tagWriter" id="tagWriter" autocomplete="off" maxlength="30" />
							<div class="input-group-prepend">
								<span class="input-group-button btn btn-brand" id="tagBtn" name="tagBtn"><span data-lang-cd="bad1003.button.submit">등록</span></span>
							</div>
						</div>
						<!-- 태그 리스트 -->
						<div class="kt-margin-t-20 kt-padding-l-15" name="tagListDiv" id="tagListDiv">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-brand" id="bad1003UpdateSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="bad1003.button.updateSubmit">수정 완료</span></button>
			<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
		</div>
	</div>
</form>
<!-- begin page script -->
<script>
"use strict";

//fileObject
var fileUploadObj;
var OSLBad1003Popup = function () {
	var formId = 'bad1003Info';
	
	// edit 목록
	var formEditList = [];
	// form validate 주입
	var formValidate = $.osl.validate(formId);
	// tag
	var tag = [];
	//fileUpload 후에 게시글 등록 때 사용할 데이터
	var data ={};
	//수정 중 삭제한 파일Sn 목록
	var uploadRemoveFiles = [];
	//목록에서 받아온 row data
	var rowData;
	
	//현재 게시글 첨부파일 개수와 용량
	var currentBadFileCnt;
	var currentBadFileStrg;
	
	//게시판 최대 첨부파일 개수와 용량
	var maxCnt;
	var maxStrg;
	
	//비밀번호 기존 존재 여부
	var pw;
    var documentSetting = function () {
    	
    	//문구 세팅 
    	$("#bad1003UpdateSubmit > span").text($.osl.lang("bad1003.button.updateSubmit"));
    	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
    	
    	//palceholder 세팅
		$("#badTitle").attr("placeholder",$.osl.lang("bad1002.placeholder.badTitle"));
		$("#badContent").attr("placeholder",$.osl.lang("bad1002.placeholder.badContent"));
		$("#badPw").attr("placeholder",$.osl.lang("bad1002.placeholder.password"));
		$("#badPwCheck").attr("placeholder",$.osl.lang("bad1002.placeholder.password"));
		
		//regexerrorstr 세팅
		$("#badPw").attr("regexerrorstr", $.osl.lang("bad1002.regex.password"));
		$("#badPwCheck").attr("regexerrorstr", $.osl.lang("bad1002.regex.password"));
    	
		
    	//목록에서 받은 rowData
    	rowData = JSON.parse($("#paramRow").val());
    	//게시글 정보 비우기
    	$("#paramRow").val('');
    	
    	//게시판 옵션이 없을 경우 div 변경
    	if(rowData.stmOptionCnt == "" || rowData.stmOptionCnt==0){
    		$("#leftDiv").removeClass("col-xl-6");
    		$("#leftDiv").addClass("col-xl-12");
    		$("#rightDiv").addClass("kt-hide");
    	}else{
        	// 스위치 on/off 이벤트
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
        	
        	//첨부파일 - 게시판 속성에서 지정한 최대 개수 및 용량
    		maxStrg = rowData.stmFileStrg;
    		if(maxStrg == null || maxStrg == ""){
    			maxStrg = 0;			
    		}
    		maxCnt = parseInt(rowData.stmFileCnt);
    		if(maxStrg == null || maxStrg == ""){
    			maxCnt = 0;
    		}
    		//현재 게시판에서 가지고 있는 첨부파일 개수
    		if(rowData.badFileCnt>maxCnt){
    			currentBadFileCnt = rowData.badFileCnt;
    		}else{
    			//게시판 지정 최대 첨부파일 개수보다 작거나 같을 경우
    			currentBadFileCnt = maxCnt;
    		}
    		//현재 첨부파일 용량
    		if(rowData.badFileSize>maxStrg){
    			currentBadFileStrg = rowData.badFileSize;
    		}else{
    			//게시판 지정 최대 첨부파일 개수보다 작거나 같을 경우
    			currentBadFileStrg = maxStrg;
    		}
    		
    		//fileUploadObj.reset();
    		// 파일 업로드 세팅
    		fileUploadObj = $.osl.file.uploadSet("bad1003FileUpload",{
    			url: '/bad/bad1000/bad1000/insertBad1002BadAtchFileInfo.do',
    			meta: {"atchFileId": rowData.atchFileId, "fileSn": 0},
    			maxFileSize: currentBadFileStrg,
    			maxNumberOfFiles: currentBadFileCnt,
    			height: 260,
    			
    			//파일 업로드 전 실행
    			onBeforeUpload: function(files){
    				var rtnValue = files;
    				var uploadFiles = {};
    				
    				//게시글의 atchFileId가 없는 경우
    				if(rowData.atchFileId==null || rowData.atchFileId==""){
    					//atchFileId 생성
    					$.osl.file.makeAtchfileId(function(data){
    						//atchFileId 생성 중 오류 발생 시
    						if(data.errorYn == "Y"){
    							$.osl.toastr(data.message);
    							rtnValue = [];
    						}else{
    							//오류가 없을 경우 생성된 atchFileId를 저장
    							rowData.atchFileId = data.atchFileIdString;
    						 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
    						 
    							//파일명 뒤에 ms 붙이기
    		    				$.each(files, function(idx, map){
    		    					map.meta.atchFileId = data.atchFileIdString;
    		    					
    		    					var jsonTmp = {};
    								jsonTmp[map.id] = map;
    								uploadFiles = $.extend(uploadFiles, jsonTmp);
    		    				});
    							
    		    				rtnValue = uploadFiles;
    						}
    					});
    				}else{
    					//atchFileId가 있는 경우 - 기존 파일 존재
        				//database 파일 제외하기
        				$.each(files, function(idx, map){
        					if(map.source != "database"){
        						map.meta.atchFileId = rowData.atchFileId;
        						map.meta.source = map.source;
        						
        						var jsonTmp = {};
        						jsonTmp[map.id] = map;
        						uploadFiles = $.extend(uploadFiles, jsonTmp);
        					}
        				});
    				}

    				//주의 : 아래 rtnValue 와 순서가 바뀌면 최근 수정한 파일만 저장된다.
    				submitUpdateAction();
    				//atchFileId 생성 및 목록 추린 후
    				rtnValue = uploadFiles;
    				return rtnValue;
    			},
    			//파일 업로드 후
    			onBeforeFileAdded: function(currentFile, files){
    				if(currentFile.source != "database" && currentFile.source != "remove"){
    					var newNm = new Date().format("ssms")+"_"+currentFile.name;
    					currentFile.name = newNm;
    					currentFile.meta.name = newNm;
    					currentFile.meta.atchFileId = rowData.atchFileId;
    					
    	    			//fileSn default
    	    			var fileSn = fileUploadObj.getState().meta.fileSn;
    	    			
    	    			currentFile.meta.fileSn = fileSn;
    	    			fileUploadObj.setMeta({fileSn: (fileSn+1)});
    				}
    			}
    		});
    		
       		//기존 파일
    		fileUploadObj.setMeta({atchFileId: rowData.atchFileId});
    		 	
    	   	//수정인경우 파일 삭제 기록하기
    	   	fileUploadObj.on('file-removed', function(file) {
    	   		file["fileSn"] = file.meta.fileSn;
    	   		file.source = "remove";
    	   		uploadRemoveFiles.push(file);
    	   		
    	   		//파일 최대, 최소 개수 변경
    	   		//현재 fileUploadObj에 지정된 최대 첨부파일 개수 및 용량 가져오기
    	   		var optFileCnt = fileUploadObj.opts.restrictions.maxNumberOfFiles;
    	   		var optFileStrg = fileUploadObj.opts.restrictions.maxFileSize;

    	   		//현재 파일 개수가 게시판 속성 첨부파일 개수보다 클 경우
    	   		if(optFileCnt > maxCnt){
    	   			//파일 삭제할 때마다 업로드 가능 갯수 줄이기
    	   			var changeFileCnt = optFileCnt - 1;
	    	   		fileUploadObj.opts.restrictions.maxNumberOfFiles = changeFileCnt;
    	   		}else{
    	   			//게시판 속성 첨부파일 갯수으로 지정
    	   			fileUploadObj.opts.restrictions.maxNumberOfFiles = maxCnt;
    	   		}
    	   		
    	   		//현재 파일 용량이 게시판 속성 첨부파일 용량보다 클 경우
    	   		if(optFileStrg > maxStrg){
    	   			var changeFileStrg;
    	   			var intervalStrg = optFileStrg - file.data.size;
    	   			//삭제하고 남은 파일의 용량이 전체 용량보다 클 경우
    	   			if(intervalStrg > maxStrg){
    	   				//남아있는 파일의 용량합으로 지정
    	   				changeFileStrg = intervalStrg;
    	   			}else{
    	   				//게시판 속성 첨부파일 용량으로 지정
    	   				changeFileStrg = maxStrg*(1024*1024);
    	   			}
    	   			//첨부파일 최대 용량 변경
	    	   		fileUploadObj.opts.restrictions.maxFileSize = changeFileStrg;
    	   		}else{
    	   			//게시판 속성 첨부파일 용량으로 지정
    	   			fileUploadObj.opts.restrictions.maxFileSize = maxStrg*(1024*1024);
    	   		}
    	   		//삭제 취소 버튼 활성화
    	   		$("#fileRemoveResetBtn").removeClass("d-none");
    		});
    	   	
    	   	//삭제 초기화 버튼 클릭 시 삭제한 파일 다시 추가
    	   	$("#fileRemoveResetBtn").click(function(){
    	   		$("#fileRemoveResetBtn").addClass("d-none");
    	   		
    	   		//게시글이 가지고 있던 최대 파일 용량 및 개수로 fileUploadObj 변경
    	   		fileUploadObj.opts.restrictions.maxFileSize = currentBadFileStrg*(1024*1024);
    	   		fileUploadObj.opts.restrictions.maxNumberOfFiles = currentBadFileCnt;
    	   		
    	   		$.each(uploadRemoveFiles, function(idx, map){
    	   			fileUploadObj.addFile({
    	   			    name: map.name,
    	   			    type: map.type,
    	   			    source: 'database',
    	   			    meta: {
    	   			    	atchFileId: map.meta.atchFileId,
    	   			    	fileSn: map.meta.fileSn
    	   			    },
    	   				data: map.data,
      				});
    	   		});
    	   		
    	   		uploadRemoveFiles = [];
    		});
    	}

	  	//불러온 게시글 정보를 삽입
    	setBadInfo();
    	
	   	//submit 동작
    	$("#bad1003UpdateSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		
     		var localData = {};
     		
     		// 기본 데이터 가져오기
     		localData.badTitle = $("#badTitle").val();
     		localData.badContent = $("#badContent").val();

     		//공지사항 사용할 경우
     		if(rowData.stmNtcYnCd=='01'){
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
				}else{
					//공지사항 사용하다가 해제할 경우
					localData.badNtcStdtm = "";
	    			localData.badNtcEddtm = "";
	    			localData.badNtcType = '01';
				}
    			//공지사항 옵션 수정 함
    			localData.notChangeNtc = "N";
     		}
     		
     		//게시판이 공지사항 기능 사용 안할 때
     		//해당 게시글에 공지기능이 사용중일 때
     		if($("#stmNtcYnCd").hasClass("kt-hide") && rowData.badNtcType!='01'){
				//공지사항 옵션 수정 안함
				localData.notChangeNtc = "Y";
     		}

     		//비밀글 사용할 경우
    		if($("#badPwYnCd").is(":checked")==true){
    			if(pw!="Y"){
    				//기존에 비밀번호가 있던 경우가 아니라면
    				//잠금 사용했으나 비밀번호 미 입력 시
    				if($("#badPw").val()==""){
    					$.osl.alert($.osl.lang("bad1002.formCheck.passwordMessage"));
    					$("#badPw").focus();
   						return false;
    				}
    			}
    		}else{
    			//비밀글로 사용하다가 사용 해제를 할 경우
    			localData.badPw = "";
    		}
    		// 비밀글 옵션 수정 함
			localData.notChangePw = "N";
    		
			//게시판이 비밀글 기능 사용 안할 때
     		//해당 게시글에 비밀글이 사용중일 때
     		if($("#stmPwYnCd").hasClass("kt-hide") && rowData.badPw!='01'){
				//게시글 비밀번호 옵션 수정 안함
				localData.notChangePw = "Y";
     		}
    		
    		//태그
    		localData.tagList = JSON.stringify(tag);
    		
			//댓글
    		if($("#badCmtYnCd").is(":checked")==true){
    			localData.badCmtYn = "01";
    		}else{
    			localData.badCmtYn = "02";
    		}
    		
			//동작
    		$.osl.confirm($.osl.lang("bad1003.update"),null,function(result) {
    	        if (result.value) {
    	        	data = localData;
    	        	data.prjGrpId = rowData.prjGrpId;
    	        	data.prjId = rowData.prjId;
    	        	data.menuId = rowData.menuId;
    	        	data.badId = rowData.badId;
    	        	//게시판 옵션이 하나라도 있을 경우
    	        	if(rowData.stmOptionCnt != "" || rowData.stmOptionCnt!=0){
    	        		fileUploadObj.upload();
    	        	}else{
    	        		//하나도 없을 경우
    	        		submitUpdateAction();
    	        	}
    	        }
    		});
    	});
		
		//태그
	   $("#tagWriter").on("propertychange paste input", function (e) {
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
	                	innerHtml += "<tag title='"+$.osl.escapeHtml(tagValue)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-margin-5 kt-padding-5 osl-display--inline-flex' role='tag' value='"+$.osl.escapeHtml(tagValue)+"'>";
	                	innerHtml += "<x class='tagify__tag__removeBtn kt-margin-l-10' role='button' aria-label='remove tag'></x>";
	                	innerHtml += "<div><div class='tagify__tag-text kt-margin-l-5'>"+$.osl.escapeHtml(tagValue)+"</div></div></tag>";
	                	
	                    $("#tagListDiv").append(innerHtml);
	                    tag.push(tagValue);
	                    $("#tagWriter").val("");
	                } else {
	                	$.osl.toastr($.osl.lang("bad1002.formCheck.tagMatching"), {"type" : "warning"});
	                    $("#tagWriter").val("");
	                }
	            }
	         // SpaceBar 시 빈공간이 생기지 않도록 방지
	            e.preventDefault(); 
	        }
	    });
	   
	 //태그 등록 버튼 클릭
		$("#tagBtn").click(function(e){
			var tagValue = $("#tagWriter").val();
	            // 값이 없으면 검사 안함
	            if (tagValue != "") {
	                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
	                var result = Object.values(tag).filter(function (word) {
	                    return word == tagValue;
	                })
	            
	                // 태그 중복 검사
	                if (result.length == 0) { 
	                	var innerHtml = "";
	                	innerHtml += "<tag title='"+$.osl.escapeHtml(tagValue)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-margin-5 kt-padding-5 osl-display--inline-flex' role='tag' value='"+$.osl.escapeHtml(tagValue)+"'>";
	                	innerHtml += "<x class='tagify__tag__removeBtn kt-margin-l-10' role='button' aria-label='remove tag'></x>";
	                	innerHtml += "<div><div class='tagify__tag-text kt-margin-l-5'>"+$.osl.escapeHtml(tagValue)+"</div></div></tag>";
	                	
	                    $("#tagListDiv").append(innerHtml);
	                    tag.push(tagValue);
	                    $("#tagWriter").val("");
	                } else {
	                	$.osl.toastr($.osl.lang("bad1002.formCheck.tagMatching"), {"type" : "warning"});
	                    $("#tagWriter").val("");
	                }
	            }
	        	 // SpaceBar 시 빈공간이 생기지 않도록 방지
	            e.preventDefault(); 
		});
	 
		// 태그 삭제
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
    
	// 게시글 id에 따라 데이터 가져오기
    /**
	* function 명 	: setBadInfo
	* function 설명	: 게시글 정보를 조회하여 팝업에 세팅한다.
	*/
    var setBadInfo = function(){
    	// 전달할 데이터 세팅
		var data={
    			"menuId" : rowData.menuId,
    			"badId" : rowData.badId,
    			"badHit" : false,
    	}
    	
    	//ajax 설정
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1000/selectBad1001InfoAjax.do'/>"}
				, data);
    	
    	//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				//var info = data.badInfo;
				var setBad = data.bad1001Info;
				var tagList = data.bad1001Tag;
				var fileList = data.bad1001FileList;
				var fileCnt = data.bad1001FileListCnt;
				
				// 가져온 데이터로 세팅하기
				// head ------------------
				// 작성자 정보 넣기
				var usrData = {
					html: setBad.badUsrNm + " (" + setBad.badUsrId + ")",
					imgSize: "sm",
					class:{
						cardBtn: "osl-width__fit-content"
					}
				};
				$("#writerDiv").html($.osl.user.usrImgSet(setBad.badUsrImgId, usrData));
				//작성자 정보 상세 보기
				$("#writerDiv>.kt-user-card-v2.btn.osl-width__fit-content").children("div").click(function(){
					$.osl.user.usrInfoPopup(setBad.badUsrId);
				});
				
				// body ------------------
				// 제목 넣기
				$("#badTitle").val(setBad.badTitle);
				
				// 내용입력
				$("#badContent").val(setBad.badContent);
				
				//edit 세팅
		    	formEditList.push($.osl.editorSetting("badContent", {formValidate: formValidate, 'minHeight': 380}));
				$("#badContent").removeClass("kt-hide");
				
				if(rowData.stmOptionCnt>0){
					// 게시판 속성 : 공지사항 기능을 사용하는 경우
					if(rowData.stmNtcYnCd == "01"){
						$("#stmNtcYnCd").removeClass("kt-hide");
						$.osl.date.daterangepicker("#badNtcRange");
						
						// 공지사항 옵션 선택한 게시글인지 확인
						if(setBad.badNtcCheck == "01"){
							// 공지사항인 경우 스위치 on
							$("#badNtcYnCd").attr("checked", true);
							// 공지옵션 보이기
							$("#ntcOption").removeClass("kt-hide");
							//공지기간 무시인 경우
							if(rowData.badNtcType=='03'){
								$("#badNtcTopYnCd").attr("checked", true);
							}
							//사용자가 입력한 공지 지정일이 있으므로
							$("#badNtcRange").val(setBad.badNtcStdtm + " - " + setBad.badNtcEddtm);
						}else{
							// 공지사항아니므로 스위치 off
							$("#badNtcYnCd").attr("checked", false);
							// 공지옵션 숨기기
							$("#ntcOption").addClass("kt-hide");
						}
					}else{
						$("#stmNtcYnCd").addClass("kt-hide");
					}

					// 게시판 속성 중 비밀글 사용 중일 때
					if(rowData.stmPwYnCd == "01"){
						$("#stmPwYnCd").removeClass("kt-hide");
						$("#pwOption").removeClass("kt-hide");
						
						// 비밀글인 경우 스위치 on
						if(setBad.badPw != null && setBad.badPw != "" ){
							$("#badPwYnCd").attr("checked", true);
							// 비밀번호 입력창 보이기
							$("#pwOption").removeClass("kt-hide");
							pw="Y";
							// 비밀번호는 비우기
							$("#badPw").val("");
							$("#badPw").attr("placeholder",$.osl.lang("bad1002.placeholder.nullPassword"));
							$("#badPwCheck").attr("placeholder",$.osl.lang("bad1002.placeholder.nullPassword"));
						}else{
							$("#badPwYnCd").attr("checked", false);
							// 비밀번호 입력창 숨기기
							$("#pwOption").addClass("kt-hide");
						}
					}
					
					//게시판 속성 중 댓글 사용중일 때
					if(rowData.stmCmtYnCd == "01"){
						$("#stmCmtYnCd").removeClass("kt-hide");
						//댓글 허용한 게시글인 경우
						if(setBad.badCmtYn == "01"){
							$("#badCmtYnCd").attr("checked", true);
						}else{
							$("#badCmtYnCd").attr("checked", false);
						}
					}

					// 첨부파일
					if(rowData.stmFileCnt != null && rowData.stmFiileCnt != "" && rowData.stmFileCnt != 0){
						$("#badFileOption").removeClass("kt-hide");
						// 첨부파일 존재하면 세팅
						if(fileList != null){
							$("#badFileOption").removeClass("kt-hide");
							
							//파일Sn넣기
					    	fileUploadObj.setMeta({fileSn: parseInt(fileCnt)+1});
					    	fileUploadObj.setMeta({atchFileId: fileList.atchFileId});
					    	
					    	//파일 목록 세팅
					    	$.osl.file.fileListSetting(fileList, fileUploadObj);
						}
					}else{
						$("#badFileOption").addClass("kt-hide");
					}
					
					// 태그
					if(rowData.stmTagYnCd == "01"){
						$("#badTagOption").removeClass("kt-hide");
						
						// 태그 리스트가 존재하는 경우 출력
						if(tagList != null && tagList[0] != null)
						{
							$.each(tagList, function(idx, value){
								// 태그 리스트 출력 작성하기
								var innerHtml = "";
			                	innerHtml += "<tag title='"+$.osl.escapeHtml(value)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-margin-5 kt-padding-5 osl-display--inline-flex' role='tag' value='"+$.osl.escapeHtml(value)+"'>";
			                	innerHtml += "<x class='tagify__tag__removeBtn kt-margin-l-10' role='button' aria-label='remove tag'></x>";
			                	innerHtml += "<div><div class='tagify__tag-text kt-margin-l-5'>"+$.osl.escapeHtml(value)+"</div></div></tag>";
			                	
			                	$("#tagListDiv").append(innerHtml);
			                	tag.push(value);
							});
						}
					}else{
						$("#badTagOption").addClass("kt-hide");
					}
				}
			}
    	});
    	
    	//AJAX 전송
		ajaxObj.send();
	};
 	
    /**
	* function 명 	: submitUpdateAction
	* function 설명	: 첨부파일 atchFileId 생성 후 게시글 등록
	*/
    var submitUpdateAction = function(){
		var form = $('#'+formId);   
		
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		if(rowData.stmOptionCnt != null && rowData.stmOptionCnt != "" && rowData.stmOptionCnt >0){
			//파일 목록 추가하기 (수정이력 관리)
	       	var uploadFileList = [];
	       	$.each(fileUploadObj.getFiles(), function(idx, map){
	       		if(map.source == "database"){
	       			return true;
	       		}
	       		uploadFileList.push(map);
	       	});
	       	uploadFileList = uploadFileList.concat(uploadRemoveFiles);

	       	//파일 정보
	       	data.fileHistory = JSON.stringify(uploadFileList);
	       	
			//파일 목록 추가하기
			data.atchFileId = rowData.atchFileId;
			data.fileSn = 0;
		}

		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/bad/bad1000/bad1000/updateBad1003BadInfoAjax.do'/>"}
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

				//게시글 상세 팝업 호출
				var data = {
						stmTypeCd : $("#stmTypeCd").val(),
						stmNm : $.osl.escapeHtml($("#stmNm").val()),
						backPageYn: "N",
						stmRootYn: $("#stmRootYn").val(),
						paramRow : JSON.stringify(rowData),
						badHitYn : "ok", //값이 있을 경우 조회수 증가 안함
					};
				var options = {
						idKey: "bad1001_"+ rowData.badId,
						modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+rowData.badNum,
						closeConfirm: false,
						autoHeight: false,
						modalSize: "xl",
					};
   				//모달 창 닫기
   				$.osl.layerPopupClose();
				//모달 창 열기
   				$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1001View.do',data,options);
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
	OSLBad1003Popup.init();
});
</script>