<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http:
<form class="kt-form" id="bad1002Info" autocomplete="off">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
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
		<div class="kt-portlet__body">
			<div class="row">
				<!-- left -->
				<div class="osl-bad-columns-2__left" name="leftDiv" id="leftDiv">
					<div name="badTitleDiv" id="badTitleDiv" class="kt-margin-b-10">
						<label class="required"><i class="fa flaticon2-open-text-book kt-margin-r-5"></i><span data-lang-cd="bad1002.label.title">제목</span></label>
						<input type="text" class="form-control" name="badTitle" id="badTitle" required />
					</div>
					<div name="badContentDiv" id="badContentDiv" class="kt-margin-b-10">
						<label class="required"><i class="fa flaticon2-edit kt-margin-r-5"></i><span data-lang-cd="bad1002.label.content">내용</span></label>
						<textarea class="kt-hide" name="badContent" id="badContent" required></textarea>
					</div>
				</div>
				<!-- right -->
				<div class="osl-bad-columns-2__right" name="rightDiv" id="rightDiv">
					<!-- 공지사항 스위치 -->
					<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmNtcYnCd" id="stmNtcYnCd">
						<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badNtcYnCd" id="badNtcYnCd">
							<span></span>
						</label>
						<span data-lang-cd="bad1002.label.noticeCheck">공지사항 사용</span>
				 	</div>
			 		<!-- 공지사항 사용할 경우 표시해야하는 Div -->
				 	<div class="kt-margin-l-35 form-group kt-hide osl-bad_box" name="ntcOption" id="ntcOption">
				 		<div class="input-group kt-input-icon pull-right">
					 		<label class="input-group-addon kt-margin-5 kt-padding-5"><span data-lang-cd="bad1002.label.noticeDate">공지 기간</span></label>
					 		<input type="text" class="form-control small" name="badNtcRange" id="badNtcRange">
				 			<span class="kt-input-icon__icon kt-input-icon__icon--right" style="height:38px; background-color: #20c997;"><span><i class="la la-calendar-check-o" style="color: #ffffff;"></i></span></span>
				 		</div>
				 		<div class="row kt-padding-t-10 kt-padding-l-15">
					 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badNtcTopYnCd" id="badNtcTopYnCd">
								<span></span>
							</label>
							<span data-lang-cd="bad1002.label.noticeDateIgnore">공지기간 무시</span>
				 		</div>
				 	</div>
				 	<!-- 비밀글 스위치 -->
				 	<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmPwYnCd" id="stmPwYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badPwYnCd" id="badPwYnCd">
							<span></span>
						</label>
						<span data-lang-cd="bad1002.label.secretCheck">비밀글 사용</span>
				 	</div>
				 	<!-- 비밀글 사용할 경우 표시해야하는 Div -->
				 	<div class="kt-margin-l-35 form-group kt-hide osl-bad_box" name="pwOption" id="pwOption">
				 		<div class="input-group kt-margin-b-10">
					 		<label class='input-group-addon kt-padding-10 required' style="margin-top: auto; margin-bottom:auto; min-width:60px;"><span data-lang-cd="bad1002.label.password">PW</span></label>
				 			<input type="password" class="form-control" name="badPw" id="badPw" regexstr="^[a-z0-9]{4,12}$"/> 
				 		</div>
				 		<div class="input-group">
					 		<label class='input-group-addon kt-padding-10 required' style="margin-top: auto; margin-bottom:auto;  min-width:60px;"><span data-lang-cd="bad1002.label.passwordCheck">PW 확인</span></label>
				 			<input type="password" class="form-control" name="badPwCheck" id="badPwCheck" regexstr="^[a-z0-9]{4,12}$"/>
			 			</div>
				 	</div>
				 	<!-- 댓글 스위치 -->
				 	<div class="kt-padding-l-20 form-group row kt-hide"  name="stmCmtYnCd" id="stmCmtYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badCmtYnCd" id="badCmtYnCd">
							<span></span>
						</label>
						<span data-lang-cd="bad1002.label.commentCheck">댓글 허용</span>
				 	</div>
				 	<!-- 파일첨부 -->
					<div class="form-group row kt-hide" name="badFileOption" id="badFileOption">
						<div class="col-4 kt-font-bolder kt-padding-l-20">
							<i class="fa fa-file-upload kt-margin-r-5"></i><span data-lang-cd="bad1002.label.attchFile">파일 첨부</span>
						</div>
						<div class="col-12 kt-margin-t-10 kt-padding-l-20 kt-padding-r-10 kt-uppy" style="max-height:260px;" name="bad1002FileUpload" id="bad1002FileUpload">
							<div class='kt-uppy__dashboard'></div>
							<div class='kt-uppy__progress'></div>
						</div>
					</div>
					<!-- 태그 -->
					<div class="form-group row kt-margin-b-10 kt-hide" name="badTagOption" id="badTagOption">
						<div class="col-4 kt-font-bolder kt-padding-l-20">
							<i class="fa fa-hashtag kt-margin-r-5"></i><span data-lang-cd="bad1002.label.tag">태그</span>
						</div>
						<div class="input-group kt-margin-t-10 kt-margin-l-20 kt-margin-r-10">
							<div class="input-group-prepend">
								<span class="input-group-text">#</span>
							</div>
							<input type="text" class="form-control col-5" name="tagWriter" id="tagWriter" maxlength="30" />
							<div class="input-group-prepend">
								<span class="input-group-button btn btn-brand" id="tagBtn" name="tagBtn"><span data-lang-cd="bad1002.button.submit">등록</span></span>
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
			<button type="button" class="btn btn-brand" id="bad1002InsertSubmit"><span data-lang-cd="bad1002.button.insertSubmit">등록</span></button>
			<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><span data-lang-cd="modal.close">닫기</span></button>
		</div>
	</div>
</form>
<!-- begin page script -->
<script>
"use strict";
var OSLBad1002Popup = function () {
	var formId = 'bad1002Info';

	
	var formValidate = $.osl.validate(formId);
	
	
	var formEditList = [];
	
	
	var tag = [];
	
	
	var data ={};
	
	
	var fileUploadObj;
    var documentSetting = function () {
		
    	
    	$("#bad1002InsertSubmit > span").text($.osl.lang("bad1002.button.insertSubmit"));
    	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
    	
    	
    	if($("#paramStmOptionCnt").val() == "" || $("#paramStmOptionCnt").val()==0){
    		$("#leftDiv").attr("style","width:100% !important");
    		$("#rightDiv").addClass("kt-hide");
    	}
    	var maxStrg = $("#paramStmFileStrg").val();
		if(maxStrg == null || maxStrg == ""){
			maxStrg = 0;			
		}
		var maxCnt = parseInt($("#paramStmFileCnt").val());
		if(maxStrg == null || maxStrg == ""){
			maxCnt = 0;
		}
		
		fileUploadObj = $.osl.file.uploadSet("bad1002FileUpload",{
			url: '/bad/bad1000/bad1000/insertBad1002BadAtchFileInfo.do',
			meta: {"atchFileId": $("#atchFileId").val(), "fileSn": 0},
			maxFileSize: maxStrg,
			maxNumberOfFiles: maxCnt,
			height: 260,
			
			
			onBeforeUpload: function(files){
				var rtnValue = files;
				var uploadFiles = {};
				
				
				$.osl.file.makeAtchfileId(function(data){
					if(data.errorYn == "Y"){
						$.osl.toastr(data.message);
						rtnValue = [];
					}else{
						$("#atchFileId").val(data.atchFileIdString);
					 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
					 
						
	    				$.each(files, function(idx, map){
	    					map.meta.atchFileId = data.atchFileIdString;
	    					
	    					var jsonTmp = {};
							jsonTmp[map.id] = map;
							uploadFiles = $.extend(uploadFiles, jsonTmp);
	    				});
						
	    				rtnValue = uploadFiles;
	    				
						
						submitInsertAction(data);
					}
				});
			},
			
			onBeforeFileAdded: function(currentFile, files){
				if(currentFile.source != "database" && currentFile.source != "remove"){
					var newNm = new Date().format("ssms")+"_"+currentFile.name;
					currentFile.name = newNm;
					currentFile.meta.name = newNm;
					currentFile.meta.atchFileId = $("#atchFileId").val();
					
	    			
	    			var fileSn = fileUploadObj.getState().meta.fileSn;
	    			
	    			currentFile.meta.fileSn = fileSn;
	    			fileUploadObj.setMeta({fileSn: (fileSn+1)});
				}
			}
		});
    	
    	
   		setOption();

    	
    	$("#bad1002InsertSubmit").click(function(){
    		var form = $('#'+formId);    		
    		
    		if (!form.valid()) {
    			return;
    		}
    		
    		
    		var badTitle = $("#badTitle").val().trim();
    		if(badTitle == null || badTitle == ""){
    			$("#badTitle").val("");
    			$("#badTitle").focus();
    			return;
    		}
    		
    		
			if($(".uppy-Dashboard-files").children("li").length > Number($("#paramStmFileCnt").val())){
				$.osl.alert($.osl.lang("bad1002.formCheck.fileCntMessage", $("#paramStmFileCnt").val()), {"type":"warning"});
				return;
			}
    					
     		var localData = {};
     		
     		
     		localData.badTitle = $("#badTitle").val();
     		localData.badContent = $("#badContent").val();
     		
   			if($("#paramStmOptionCnt").val() > 0){
           		
          		if($("#badNtcYnCd").is(":checked")==true){
          			
          			var stdtm = ($("#badNtcRange").val()).split(" - ")[0];
          			var eddtm = ($("#badNtcRange").val()).split(" - ")[1];
      	    		
          			localData.badNtcStdtm = stdtm;
          			localData.badNtcEddtm = eddtm;
          				
          			
      	    		if($("#badNtcTopYnCd").is(":checked")==true){
      	    			localData.badNtcType = '03';
      	    		}else{
      	    			localData.badNtcType = '02';
      	    		}
      			}
          		
          		
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

          		
          		localData.tagList = JSON.stringify(tag);
          		
      			
          		if($("#badCmtYnCd").is(":checked")==true){
          			localData.badCmtYn = "01";
          		}else{
          			localData.badCmtYn = "02";
          		}
          		
      			
          		$.osl.confirm($.osl.lang("bad1002.insert"),null,function(result) {
          	        if (result.value) {
          	        	data = localData;
          	        	data.menuId = $("#menuId").val();
          	        	fileUploadObj.upload();
          	        }
          		});
          		
     		}else{ 
       			data = localData;
  	        	data.menuId = $("#menuId").val();
	   			
	   			
	   			$.osl.confirm($.osl.lang("bad1002.insert"),null,function(result){
	   				if(result.value){
						submitInsertAction(data);
	   				}
	   			});
     		}
    	});
    }
    
 	
    
    var setOption = function(){
		
		
		
		$("#writerDiv").empty();
		var usrData = {
				html: $.osl.user.userInfo.usrNm + " (" + $.osl.user.userInfo.usrId + ")",
				imgSize: "sm",
				class:{
					cardBtn: "osl-width__fit-content"
				}
		};
		$("#writerDiv").append($.osl.user.usrImgSet($.osl.user.userInfo.usrImgId, usrData));
		
		$("#writerDiv>.kt-user-card-v2.btn.osl-width__fit-content").children("div").click(function(){
			$.osl.user.usrInfoPopup(setBad.badUsrId);
		});
		
		
		
    	formEditList.push($.osl.editorSetting("badContent", {formValidate: formValidate, 'minHeight': 380}));
    	$("#badContent").removeClass("kt-hide");
		
    	if($("#paramStmOptionCnt").val()>0){
			
			if($("#paramStmNtcYnCd").val() == "01"){
				$("#stmNtcYnCd").removeClass("kt-hide");
				$.osl.date.daterangepicker($("#badNtcRange"));
			}else{
				$("#stmNtcYnCd").addClass("kt-hide");
			}
	
	    	
	    	$("#badNtcYnCd").click(function(){
	    		if($("#badNtcYnCd").is(":checked")==true){
	    			
	    			$("#ntcOption").removeClass("kt-hide");
	    		}else{
	    			
	    			$("#ntcOption").addClass("kt-hide");
	    		}
	    	});
	    	
	    	
	    	$("#badPwYnCd").click(function(){
	    		if($("#badPwYnCd").is(":checked")==true){
	    			
	    			$("#pwOption").removeClass("kt-hide");
	    		}else{
	    			
	    			$("#pwOption").addClass("kt-hide");
	    		}
	    	});
			
			
			if($("#paramStmPwYnCd").val()  == "01"){
				$("#stmPwYnCd").removeClass("kt-hide");
			}else{
				$("#stmPwYnCd").addClass("kt-hide");
			}
	
			
	    	$("#badPwYnCd").click(function(){
	    		if($("#badPwYnCd").is(":checked")==true){
	    			
	    			$("#pwOption").removeClass("kt-hide");
	    		}else{
	    			
	    			$("#pwOption").addClass("kt-hide");
	    		}
	    	});
			
			
			if($("#paramStmFileCnt").val()  != null && $("#paramStmFileCnt").val() != "" && $("#paramStmFileCnt").val()!= 0){
				$("#badFileOption").removeClass("kt-hide");
			}else{
				$("#badFileOption").addClass("kt-hide");
			}
			
			
			if($("#paramStmTagYnCd").val() == "01"){
				$("#badTagOption").removeClass("kt-hide");
				
          		
           	   $("#tagWriter").on("keypress", function (e) {
           	        var self = $(this);
           	        
           	        if (e.key == "Enter" || e.keyCode == 32) {
           	            var tagValue = self.val();
           	            
           	            if (tagValue != "") {
           	                
           	                var result = Object.values(tag).filter(function (word) {
           	                    return word == tagValue;
           	                })
           	            
           	                
           	                if (result.length == 0) { 
           	                	var innerHtml = "";
           	                	innerHtml += "<tag title='"+$.osl.escapeHtml(tagValue)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-margin-5 kt-padding-5' style='display: inline-flex' role='tag' value='"+$.osl.escapeHtml(tagValue)+"'>";
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
           	        	 
           	            e.preventDefault(); 
           	        }
           	    });
           	 
          	 	
        		$("#tagBtn").click(function(e){
        			var tagValue = $("#tagWriter").val();
       	            
       	            if (tagValue != "") {
       	                
       	                var result = Object.values(tag).filter(function (word) {
       	                    return word == tagValue;
       	                })
       	            
       	                
       	                if (result.length == 0) { 
       	                	var innerHtml = "";
       	                	innerHtml += "<tag title='"+$.osl.escapeHtml(tagValue)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-margin-5 kt-padding-5' style='display: inline-flex' role='tag' value='"+$.osl.escapeHtml(tagValue)+"'>";
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
       	        	 
       	            e.preventDefault(); 
        		});
          	 	
           	   
           	    $(document).off("click", ".tagify__tag__removeBtn").on("click", ".tagify__tag__removeBtn", function (e) {
           	    	
           	    	var tagText = $(this).parent().attr("value");
           	    	
           	    	var idx = tag.indexOf(tagText);
           	    	
           	    	tag.splice(idx, 1);
           	    	
           	    	$(this).parent().remove();
           	    });
           	   
			}else{
				$("#badTagOption").addClass("kt-hide");
			}
			
			
			if($("#paramStmCmtYnCd").val() == "01"){
				$("#stmCmtYnCd").removeClass("kt-hide");
				$("#badCmtDiv").removeClass("kt-hide");
			}else{
				$("#stmCmtYnCd").addClass("kt-hide");
				$("#badCmtDiv").addClass("kt-hide");
			}
    	}
	}
	
    
    var submitInsertAction = function(){
		
		data.atchFileId = $("#atchFileId").val();
		data.fileSn = 0;
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/bad/bad1000/bad1000/insertBad1002BadInfoAjax.do'/>"}
				, data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn=="Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
	   			
   				$("button[data-datatable-id=bad1000BadTable][data-datatable-action=select]").click();
			}
		});
		
		
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