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
<form class="kt-form" id="bad1003Info">
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<input type="hidden" id="stmDsTypeCd" name="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
			<input type="hidden" id="stmRootYn" name="stmRootYn" value='${param.stmRootYn}'/>
			<input type="hidden" name="detailRootYn" id="detailRootYn" value="${param.detailRootYn }" /> 
			<input type="hidden" name="paramRow" id="paramRow" value='${param.paramRow }' />
			<input type="hidden" name="paramStmOptionCnt" id="paramStmOptionCnt" value="${param.stmOptionCnt }" /> 
			
			<div class="kt-portlet__head-label col-6 row" name="writerDiv" id="writerDiv"></div>
		</div>
		<hr class="kt-margin-0">
		<div class="kt-portlet__body">
			<div class="row">
				<!-- left -->
				<div class="col-lg-6 kt-padding-r-10">
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
				<div class="col-lg-6 kt-padding-l-10">
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
					 		<input type="text" class="form-control small" name="badNtcRange" id="badNtcRange"/>
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
						<div class="col-12 kt-margin-t-10 kt-padding-l-20 kt-padding-r-10 kt-uppy" style="max-height: 260px;" name="bad1003FileUpload" id="bad1003FileUpload">
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
			<button type="button" class="btn btn-brand" id="bad1003UpdateSubmit">수정완료</button>
			<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
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
	
	//출력 문구
	var pageTypeData = {
			"update":{
				"saveString" : "글 수정을 완료하시겠습니까?",
				"saveBtnString" : "수정 완료"
			},
			"common":{
				"badTitleString" : "제목은 반드시 입력하셔야 합니다.",
				"badContentString" : "내용은 반드시 입력하셔야 합니다."
			}
	};

    var documentSetting = function () {

    	//문구 세팅
    	$("#bad1003UpdateSubmit").text(pageTypeData["update"]["saveBtnString"]);
    	$("#badTitle").text(pageTypeData["common"]["badTitleString"]);
    	$("#badContent").text(pageTypeData["common"]["badContentString"]);
    	
    	//목록에서 받은 rowData
    	rowData = JSON.parse($("#paramRow").val());
    	//게시글 정보 비우기
    	$("#paramRow").val('');
    	
    	//게시판 옵션이 없을 경우 div 변경
    	if($("#paramStmOptionCnt").val()==0){
    		$("#leftDiv").attr("class", "col-lg-12 kt-padding-5");
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

        	//첨부파일
    		var maxStrg = rowData.stmFileStrg;
    		if(maxStrg == null || maxStrg == ""){
    			maxStrg = 0;			
    		}
    		var maxCnt = parseInt(rowData.stmFileCnt);
    		if(maxStrg == null || maxStrg == ""){
    			maxCnt = 0;
    		}
    		
    		//fileUploadObj.reset();
    		// 파일 업로드 세팅
    		fileUploadObj = $.osl.file.uploadSet("bad1003FileUpload",{
    			url: '/bad/bad1000/bad1000/insertBad1002BadAtchFileInfo.do',
    			meta: {"atchFileId": rowData.atchFileId, "fileSn": 0},
    			maxFileSize: maxStrg,
    			maxNumberOfFiles: maxCnt,
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
    	   		
    	   		//삭제 취소 버튼 활성화
    	   		$("#fileRemoveResetBtn").removeClass("d-none");
    		});
    	   	
    	   	//삭제 초기화 버튼 클릭 시 삭제한 파일 다시 추가
    	   	$("#fileRemoveResetBtn").click(function(){
    	   		$("#fileRemoveResetBtn").addClass("d-none");
    	   		
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
    		
    		//Content가 valid 체크가 안되므로 별도 체크
    		var badContent = $("#badContent").val().replace(/(<([^>]+)>)/ig,"").replace(/&nbsp;/g, '').trim();;
    		
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
			}else{
				//공지사항 사용하다가 해제할 경우
				localData.badNtcStdtm = "";
    			localData.badNtcEddtm = "";
    			localData.badNtcType = '01';
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
    		}else{
    			//비밀글로 사용하다가 사용 해제를 할 경우
    			localData.badPw = "";
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
    		$.osl.confirm(pageTypeData["update"]["saveString"],null,function(result) {
    	        if (result.value) {
    	        	data = localData;
    	        	data.prjGrpId = rowData.prjGrpId;
    	        	data.prjId = rowData.prjId;
    	        	data.menuId = rowData.menuId;
    	        	data.badId = rowData.badId;
    	        	fileUploadObj.upload();
    	        }
    		});
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
				$("#writerDiv").html($.osl.user.usrImgSet(setBad.badUsrImgId, setBad.badUsrNm+"( "+setBad.badUsrId+" )"));
				//작성자 정보 상세 보기
				$("#writerDiv").click(function(){
					$.osl.user.usrInfoPopup(setBad.badUsrId);
				});
				
				// 작성일 정보 넣기
				$("#writeDateDiv").text("작성일 : " + setBad.badWtdtm);
				
				// 조회수 정보 넣기
				$("#hitDiv").text("조회수 : " + setBad.badHit);
				
				// body ------------------
				// 제목 넣기
				$("#badTitle").val(setBad.badTitle);
				
				// 내용입력
				$("#badContent").val(setBad.badContent);
				
				//edit 세팅
		    	formEditList.push($.osl.editorSetting("badContent", {formValidate: formValidate, 'minHeight': 430}));
				$("#badContent").removeClass("kt-hide");
				
				if($("#paramStmOptionCnt").val()>0){
					// 게시판 속성 : 공지사항 기능을 사용하는 경우
					console.log(rowData);
					if(rowData.stmNtcYnCd == "01"){
						$("#stmNtcYnCd").removeClass("kt-hide");
						$.osl.date.daterangepicker("#badNtcRange");
						
						// 공지사항인지 확인
						if(rowData.badNtcCheck=='01'){
							//오늘 날짜가 공지사항 기간에 해당하는지 확인
							// 공지사항인 경우 스위치 on
							$("#badNtcYnCd").attr("checked", true);
							// 공지옵션 보이기
							$("#ntcOption").removeClass("kt-hide");
							//공지기간 무시인 경우
							if(rowData.badNtcType=='03'){
								$("#badNtcTopYnCd").attr("checked", true);
							}else{
								//사용자가 입력한 공지 지정일이 있으므로
								$("#badNtcRange").attr("value", setBad.badNtcStdtm + " - " + setBad.badNtcEddtm);
							}
						}
					}else{
						$("#stmNtcYnCd").addClass("kt-hide");
					}

					// 게시판 속성 중 비밀글 사용 중일 때
					if(rowData.stmPwYnCd == "01"){
						$("#stmPwYnCd").removeClass("kt-hide");
						$("#pwOption").removeClass("kt-hide");
						
						// 비밀글인 경우 스위치 on
						if(setBad.badPwYn == "Y"){
							$("#badPwYnCd").attr("checked", true);
							// 비밀번호 입력창 보이기
							$("#pwOption").removeClass("kt-hide");
							// 기존 비밀번호 넣기
							$("#badPw").val(setBad.badPw);
							$("#badPwCheck").val(setBad.badPw);
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
			                	innerHtml += "<tag title='"+$.osl.escapeHtml(value)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-margin-5 kt-padding-5' style='display: inline-flex' role='tag' value='"+$.osl.escapeHtml(value)+"'>";
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

   				//상세페이지가 아닌 목록화면에서 접근한 수정인지 확인
				if($("#detailRootYn").val() == "N"){
					var modalSize;
					if($("#paramStmOptionCnt").val()>0){
						modalSize = "xl";
					}else{
						modalSize = "sm";
					}
					//게시글 상세 팝업 호출
					var data = {
							stmTypeCd : $("#stmTypeCd").val(),
							stmNm : $.osl.escapeHtml($("#stmNm").val()),
							backPageYn: "N",
							stmRootYn: $("#stmRootYn").val(),
							paramRow : JSON.stringify(rowData),
						};
					var options = {
							idKey: "bad1001_"+ rowData.badId,
							modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+rowData.badNum,
							closeConfirm: false,
							autoHeight: false,
							modalSize: modalSize,
						};
	   				//모달 창 닫기
	   				$.osl.layerPopupClose();
					//모달 창 열기
	   				$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1001View.do',data,options);
				}else{
	   				//모달 창 닫기
	   				$.osl.layerPopupClose();

	 	   			//게시글 재조회
	   				OSLBad1001Popup.reDraw($("#badId").val());
				}
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