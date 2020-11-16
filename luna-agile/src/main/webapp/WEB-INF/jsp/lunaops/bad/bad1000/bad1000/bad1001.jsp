<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
img {
  max-width: 100%;
}
</style>

<input type="hidden" name="stmTypeCd" id="stmTypeCd" value="${param.stmTypeCd}" /> 
<input type="hidden" name="stmDsTypeCd" id="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
<input type="hidden" name="stmNm" id="stmNm" value='${param.stmNm}'/>
<input type="hidden" name="paramRow" id="paramRow" value='${param.paramRow }' />
<input type="hidden" id="stmRootYn" name="stmRootYn" value='${param.stmRootYn}'/>
<input type="hidden" id="badHitYn" name="badHitYn" value='${param.badHitYn}'/>

<div class="kt-section__content kt-section__content--border">
	<div class="card">
		<div class="card-header kt-font-bolder">
			<!-- 제목 -->
			<div class="kt-padding-t-10 kt-padding-b-15" name="badTitleDiv" id="badTitleDiv" style="font-size:1.5em; border-bottom: 1px solid #dedede;"></div>
			<!-- 작성자, 작성일, 조회수 -->
			<div class="osl-portlet__head-label kt-margin-t-10">
				<div class="kt-padding-5 osl-padding-b-6__5" name="writerDiv" id="writerDiv"  data-badUsrId=''></div>
				<div class="kt-padding-5" name="writeDateDiv" id="writeDateDiv"></div>
				<!-- <div class="kt-padding-t-10 kt-padding-b-10" name="hitDiv" id="hitDiv"></div>	 -->
			</div>	
		</div>
		<div class="osl-bad__card-body">
			<!-- 수정, 삭제, 복원 -->
			<div class="osl-portlet__sub-toolbar">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" name="updateBtn" id="updateBtn" title="게시글 수정" data-title-lang-cd="bad1001.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" name="deleteBtn" id="deleteBtn" title="게시글 삭제" data-title-lang-cd="bad1001.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
					<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air kt-hide" name="restoreBtn" id="restoreBtn" title="게시글 복원" data-title-lang-cd="bad1001.actionBtn.restoreTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
					<i class="la la-rotate-left"></i><span data-lang-cd="bad1001.button.restore">복구</span>
				</button>
			</div>
			<!-- 내용 -->
			<div class="bard-text kt-padding-30 kt-padding-t-20 kt-padding-b-20" style="min-height: 150px;" name="badContentDiv" id="badContentDiv"></div>
			<!-- 첨부파일 목록 -->
			<div class="form-group kt-margin-20 kt-hide" name="badFileOption" id="badFileOption">
				<hr class="kt-margin-t-20 kt-margin-b-20">
				<div class="kt-font-bolder kt-padding-l-5">
					<i class="fa fa-file-upload kt-margin-r-5"></i><span data-lang-cd="bad1001.label.attchFile">파일 첨부</span>
				</div>
				<div class="kt-margin-t-10 kt-uppy fileReadonly" name="fileListDiv" id="fileListDiv">
					<div class="kt-uppy__dashboard"></div>
					<div class="kt-uppy__progress"></div>
				</div>
			</div>
			<!-- 태그 리스트 -->
			<div class="form-group kt-margin-20 kt-hide" name="badTagOption" id="badTagOption">
				<div class="kt-font-bolder kt-padding-l-5">
					<i class="fa fa-hashtag kt-margin-r-5"></i><span data-lang-cd="bad1001.label.tag">태그</span>
				</div>
				<div class="kt-margin-t-10" name="tagListDiv" id="tagListDiv">
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 리스트 -->
	<div class="card kt-margin-t-10"  name="badCmtDiv" id="badCmtDiv">
		<div class="card-header kt-font-bolder" style="line-height: 32px">
			<i class="fa flaticon-chat-1 kt-margin-r-5"></i><span data-lang-cd="bad1001.label.comment">댓글</span>
			<div class="kt-portlet__head-toolbar" style="float:right; align-items:''; ">
				<!-- 댓글 조회/삭제 -->
				<div class="kt-widget__wrapper" name="badCmtBtnDiv" id="badCmtBtnDiv">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1001CmtTable" data-datatable-action="select" title="댓글 조회" data-title-lang-cd="bad1001.actionBtn.selectComment" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
						<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1001CmtTable" data-datatable-action="delete" title="댓글 삭제" data-title-lang-cd="bad1001.actionBtn.deleteComment" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="2">
						<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
					</button>
				</div>
			</div>
		</div>
		<div class="osl-bad__card-body">
			<!-- 댓글 검색 -->
			<div class="row kt-padding-20 kt-padding-l-30">
				<div class="osl-datatable-search col-lg-5 col-md-6 col-sm-6 col-12" data-datatable-id="bad1001CmtTable"></div>
			</div>
			<!-- 댓글 입력창 -->
			<div class="input-group kt-margin-t-10 kt-margin-b-10 kt-padding-l-30 kt-padding-r-10 osl-bad__width__95 kt-hide" name="badCmtInput" id="badCmtInput">
				<div class="input-group-prepend kt-padding-r-15" name="loginUsr" id="loginUsr">
				</div>
				<input type="text" class="form-control" name="cmtWriter" id="cmtWriter" maxlength="370" />
				<div class="form-group-append">
					<button class="btn btn-brand" type="button" name="cmtSaveBtn" id="cmtSaveBtn"><span data-lang-cd="bad1001.button.submit">등록</span></button>
				</div>
			</div>
			
			<!-- 댓글 목록 창 -->
			<div class="kt-margin-t-10" name="badCmtList" id="badCmtList">
				<div class="kt_datatable" id="bad1001CmtTable"></div>
			</div>
		</div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";

var OSLBad1001Popup = function () {
	//담당자 및 글작성 범위 해당여부를 담을 변수 선언
	var okManager;
	var okWriter;
	
	//파일 업로드 객체
	var fileUploadObj;
	
	//태그 리스트를 담을 변수 선언
	var tag = [];

	//목록에서 받아온 row data
	var paramRowData;
	
	//데이터 테이블 아이디 - 댓글
   	var dataTableId = "bad1001CmtTable";
	
    var documentSetting = function () {
    	//목록에서 받은 rowData
    	paramRowData = JSON.parse($("#paramRow").val());

    	//게시글 정보 비우기
    	$("#paramRow").val('');
    	
    	//권한체크
		checkUser();
    	
		// 파일 업로드 세팅
	   	fileUploadObj = $.osl.file.uploadSet("fileListDiv",{
	   		meta: {"atchFileId": paramRowData.atchFileId, "fileSn": 0},
	   		maxFileSize: Number(paramRowData.fileStrg)/(1024*1024),
	   		maxNumberOfFiles: Number(paramRowData.fileCnt),
	   		height: 370,
	   		isDraggingOver: false,
    		fileDownload: true,
    		fileReadonly: true
	   	});

	   	fileUploadObj.reset();
	   	//게시글 정보 가져오기
	   	//만약 수정 후 호출이여서 badHitYn에 값이 있을 때
	   	if($("#badHitYn").val() != null || $("#badHitYn").val() != ""){
	   		selectBadInfo(false);
	   	}else{
	   		selectBadInfo(true);
	   	}

	   	//댓글 데이터 테이블 셋팅
    	$.osl.datatable.setting(dataTableId, {
			 data: {
				 source: {
					 read: {
						url: "/bad/bad1000/bad1100/selectBad1100CmtListAjax.do",
						params : {
							menuId: paramRowData.menuId,
							badId : paramRowData.badId
						}
					 }
				 },
			 },
			 columns: [
				 {field: 'checkbox', title: '#', textAlign: 'center', width: 30, selector: {class: "kt-checkbox--solid"}, sortable: false, autoHide: false},
				 {field: 'badCmtUsrId', title: $.osl.lang("bad1001.field.comment.writer"), textAlign: 'left', width: 180,
						template: function (row) {
							var usrData = {
									html: row.badCmtUsrNm + " (" + row.badCmtUsrId + ")",
									imgSize: "sm",
									class:{
										cardBtn: "osl-width__fit-content"
									}
							};
							return $.osl.user.usrImgSet(row.badCmtUsrImgId, usrData);
						},
						onclick: function(rowData){
							$.osl.user.usrInfoPopup(rowData.badCmtUsrId);
						}
						, search:true},
				 {field: 'badCmtContent', title:$.osl.lang("bad1001.field.comment.content"), textAlign: 'left', width:740, autoHide: false, search:true,
					template:function(row){
						var returnStr = "<span class='cmtTxt' style='word-break: break-word;'>"+$.osl.escapeHtml(row.badCmtContent)+"</span>";
						return returnStr;
					}			
				 },
				 {field: 'badCmtDtm', title: $.osl.lang("bad1001.field.comment.writeDate"), textAlign: 'center', width: 100, search:true, searchType:"daterange",
					 template: function(row){
						var paramDatetime = new Date(row.badCmtDtm);
						var agoTime = new Date() - paramDatetime;
						if(agoTime < 0){
							//실시간 댓글 - agoTime이 (-) 가 되는 경우 발생
							return "0초 전";
						}else if(agoTime < 1000 * 60){
							return $.osl.datetimeAgo(paramDatetime, {returnTime: "s"}).agoString;
						}else if(agoTime < 1000 * 60 * 60){
							return $.osl.datetimeAgo(paramDatetime, {returnTime: "m"}).agoString;
						}else if(agoTime < 1000 * 60 * 60 * 24){
							return $.osl.datetimeAgo(paramDatetime, {returnTime: "h"}).agoString;
						}else{
							return paramDatetime.format("yy.MM.dd");
						}
					},	
				 }
			 ],
			 layout:{ "header" : false },
			 actionBtn:{
				 "title": $.osl.lang("bad1001.actionBtn.title"),
				 "update": false,
				 "delete": true,
				 "click": true,
			 },
			 actionTooltip:{
				"delete": $.osl.lang("bad1001.actionBtn.deleteComment"),
			},
			 actionFn:{
				 "delete":function(rowDatas){
					 //삭제된 게시글이 아닌 경우에만 댓글 삭제 기능 가능
					 if(paramRowData.delCd =='02'){
						//담당자 외 삭제 선택한 글 중 본인 외 작성 댓글이 포함된 경우인지 확인
						var selfCheck = "Y";
						$.each(rowDatas, function(idx, value){
							if(value.badCmtUsrId != $.osl.user.userInfo.usrId){
								selfCheck = "N";
							}
						});
						//담당자이거나 댓글 작성한 사용자와 현재 로그인한 회원이 같은 경우
						if(okManager == true || (okWriter == true && selfCheck == "Y")){
							var data = {
		 							menuId : paramRowData.menuId,
		 							badId : paramRowData.badId,
		 							deleteDataList : JSON.stringify(rowDatas),
							};
							//ajax 설정
							var ajaxObj = new $.osl.ajaxRequestAction(
			    			{"url":"<c:url value='/bad/bad1000/bad1000/deleteBad1100CmtInfoAjax.do'/>"}
			    			, data);
							//ajax 전송 성공 함수
					    	ajaxObj.setFnSuccess(function(data){
					    		if(data.errorYn == "Y"){
									$.osl.alert(data.message,{type: 'error'});
									//모달 창 닫기
									$.osl.layerPopupClose();
								}else{
									selectCmtList();
								}
							});
					    	//AJAX 전송
							ajaxObj.send();	
					 	}else{
					 		$.osl.alert($.osl.lang("bad1001.notCmtWriter.deleteMessage"), {"type":"warning"});
					 	}
					 }
				 },
				 "click": function(row, datatableId, type, rowNum, elem){
					//클릭한 row(tr)에서 label 태그 kt-checkbox 클래스를 찾고
					//그 안에 있는 체크박스를 체크
					var targetElem = $(elem).closest("tr").find("label.kt-checkbox").children("input[type=checkbox]");
					if(targetElem.is(":checked")==true){
						targetElem.prop("checked", false);
						$.osl.datatable.list[datatableId].targetDt.setInactive(targetElem);
						//선택된것처럼 row 컬러가 그대로 남아있으므로
						$(elem).closest("tr").removeClass("osl-datatable__row--selected");
						$(elem).closest("tr").addClass("kt-datatable__row--even");
					}else{
						targetElem.prop("checked", true);
						$.osl.datatable.list[datatableId].targetDt.setActive(targetElem);
					}
				}
			 },
			 theme:{
				 actionBtn:{
					 //btn-"string"이기 때문에 kt-hide를 적용하려면 앞에 공백 추가
					 click: " kt-hide"
				 }
			 }
    	});
	   	//데이터 테이블 렌더링 업데이트 및 테이블 크기 조정 시 이벤트 발생
    	$("#"+dataTableId).on("kt-datatable--on-layout-updated", function(){
    		 //댓글 내용과 관련된 span에 댓글 내용 사이즈 변경을 위한 class 추가
    		 $(".cmtTxt").parent("span").addClass("osl-bad__width__100");
    	});
	   	
    	//엔터키 막기 - 안막으면 강제종료
		$("#cmtWriter").keydown(function(e){
			if(e.keyCode=='13'){
				e.preventDefault();
				$("#cmtSaveBtn").click();
				return;
			}
		});
    	
    	//댓글 등록버튼 클릭
    	$("#cmtSaveBtn").click(function(){
    		var cmtWriter = $("#cmtWriter").val().trim();
    		
    		if( cmtWriter == null || cmtWriter == "" ){
    			return;
    		}else{
	    		insertCmtInfo();
    		}
    	});
    	
    	//수정 버튼 클릭 시
    	$("#updateBtn").click(function(){
    		var data = {
    				paramRow : JSON.stringify(paramRowData),
    				stmRootYn : $("#stmRootYn").val(),
				};
			var options = {
					idKey: "bad1003_" + paramRowData.badId, 
					modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+paramRowData.badNum,
					closeConfirm: true,
					autoHeight: false,
					modalSize: "xl",
				};
			
			//담당자 또는 글 작성자 본인만 수정 가능
			if(okManager == true || $("#writerDiv").data("badUsrId") == $.osl.user.userInfo.usrId){
				//현재 팝업 닫기
   				$.osl.layerPopupClose();
				$.osl.layerPopupOpen('/bad/bad1000/bad1000/updateBad1003View.do',data,options);
			}else{
				$.osl.alert($.osl.lang("bad1001.notAuthority.updateMessage"), {"type":"warning"});
			}
    	});
    	
    	//삭제 버튼 클릭 시
		$("#deleteBtn").click(function(){
			var data = {
					stmTypeCd : $("#stmTypeCd").val(),
					menuRootYn : 'N',
					deleteDataList : JSON.stringify(paramRowData),
			};
			;
			var options = {
					idKey: "del_"+paramRowData.badId, //$("#badId").val(),
					modalTitle: $.osl.lang("bad1001.title.boardCheck.oneStep", paramRowData.badNum) + " " +$.osl.lang("bad1001.title.deleteReason"),
					closeConfirm: false,
					autoHeight: false,
					modalSize: "xl"
				};
			
			//담당자 또는 글 작성자 본인만 삭제 가능
			if(okManager == true || $("#writerDiv").data("badUsrId") == $.osl.user.userInfo.usrId){
				//삭제 사유 팝업
				$.osl.layerPopupOpen('/bad/bad1000/bad1000/deleteBad1000View.do', data, options);
			}else{
				$.osl.alert($.osl.lang("bad1001.notAuthority.deleteMessage"), {"type":"warning"});
			}
    	});
    	
		//복원 버튼 클릭 시
    	$("#restoreBtn").click(function(){
    		//담당자만 가능
			if(okManager == true){
	    		var data = {
	    				prjGrpId: paramRowData.prjGrpId,
	    				prjId : paramRowData.prjId,
						menuId : paramRowData.menuId,
						badId : paramRowData.badId,
						atchFileId : paramRowData.atchFileId,
					};
				
	    		//ajax 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction(
		    			{"url":"<c:url value='/bad/bad1000/bad1000/updateBad1001BadRestoreAjax.do'/>"}
						, data);
	    		//ajax 전송 성공 함수
		    	ajaxObj.setFnSuccess(function(data){
		    		if(data.errorYn == "Y"){
						$.osl.alert(data.message,{type: 'error'});
						//모달 창 닫기
						$.osl.layerPopupClose();
					}else{
						//reset안하면 파일 중복 올라감
						fileUploadObj.reset();
						//게시글 재호출하기
						//복원 후 호출이므로 조회수 증가 안함
						selectBadInfo(false);
						//댓글 재조회
						selectCmtList();
						//복원 성공 메세지 출력
						$.osl.toastr(data.message);
					}	
				});
		    	//AJAX 전송
				ajaxObj.send();
			}else{
				$.osl.alert($.osl.lang("bad1001.notAuthority.restoreMessage"), {"type":"warning"});
			}
    	});
    };
    
    // 게시글 id에 따라 데이터 가져오기
    /**
	* function 명 	: selectBadInfo
	* param : badHitYn ( true, false ) 조회수 증가 여부 체크
	* function 설명	: 게시글 정보를 조회하여 팝업에 세팅한다.
	*/
    var selectBadInfo = function(badHitYn){
    	// 전달할 데이터 세팅
		var data={
				menuId : paramRowData.menuId,
				badId : paramRowData.badId,
				badNum : paramRowData.badNum,
    	}
    	
    	//삭제된 게시글이 아니면
    	if(paramRowData.delCd=='02' && badHitYn == true){
    		data.badHit = true;
    	}else{
    		data.badHit = false;
    	}
    	//ajax 설정 - 게시글 후에 댓글 리스트 출력 하기 위해 "async": false
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
				var setBad = data.bad1001Info;
				var tagList = data.bad1001Tag;
				var fileList = data.bad1001FileList;
				var fileCnt = data.bad1001FileListCnt;
				
				// 가져온 데이터로 세팅하기
				// head ------------------
				// 제목 넣기
				$("#badTitleDiv").empty();
				var titleStr = "";
				var title = $.osl.escapeHtml(setBad.badTitle);
				
				// 공지사항인지 확인
				if(setBad.badNtcCheck=='01' && paramRowData.stmNtcYnCd=='01'){
					// 공지사항인 경우 badge 추가
					titleStr += "<span class='kt-badge kt-badge--danger kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1000.label.noticeBadge")+"</span>";
					titleStr += title;
				}else{
					titleStr += title;
				}
				// 비밀글인 경우 제목에 아이콘 추가
				if(setBad.badPw != null && setBad.badPw != "" && paramRowData.stmPwYnCd=='01'){
					titleStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
				}
				// 삭제된 글인지 확인
				if(setBad.delCd=='01' && $("#stmRootYn").val()=='Y'){
					titleStr = "<span class='kt-badge kt-badge--dark kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1000.label.deleteBadge")+"</span>" + titleStr;
					//수정 삭제버튼 감추기
					$("#updateBtn").addClass("kt-hide");
					$("#deleteBtn").addClass("kt-hide");
					//삭제글 유무 넣기
					$("#badDelCd").val("01");
					//복원버튼 보이기
					$("#restoreBtn").removeClass("kt-hide");
				}else{
					//수정 삭제버튼 보이기
					$("#updateBtn").removeClass("kt-hide");
					$("#deleteBtn").removeClass("kt-hide");
					//삭제글 유무 넣기
					$("#badDelCd").val("02");
					//복원버튼 숨기기
					$("#restoreBtn").addClass("kt-hide");
				}
				$("#badTitleDiv").append(titleStr);
				
				// 작성자 정보 넣기
				var usrData = {
						html: setBad.badUsrNm + " (" +setBad.badUsrId + ")",
						imgSize: "sm",
						class:{
							cardBtn: "osl-width__fit-content"
						}
				};
				$("#writerDiv").html($.osl.user.usrImgSet(setBad.badUsrImgId, usrData));
				$("#writerDiv").data("badUsrId", setBad.badUsrId);
				
				//작성자 정보 상세 보기
				$("#writerDiv>.kt-user-card-v2.btn.osl-width__fit-content").children("div").click(function(){
					$.osl.user.usrInfoPopup(setBad.badUsrId);
				});
				
				// 작성일 정보 넣기
				$("#writeDateDiv").text($.osl.lang("bad1001.label.writeDate")+ " : " + setBad.badWtdtm);
				
				// 내용입력
				$("#badContentDiv").html(setBad.badContent);
				
				// 첨부파일
				if(paramRowData.stmFileCnt != '0' && fileList != null && fileList != ""){
					$("#badFileOption").removeClass("kt-hide");
					
					//파일Sn넣기
			    	fileUploadObj.setMeta({fileSn: parseInt(fileCnt)+1});
			    	
			    	//파일 목록 세팅
			    	$.osl.file.fileListSetting(fileList, fileUploadObj);
				}else{
					$("#badFileOption").addClass("kt-hide");
				}
				
				// 태그
				if(paramRowData.stmTagYnCd == '01' && tagList != null && tagList[0] != null)
				{
					$("#badTagOption").removeClass("kt-hide");
					$.each(tagList, function(idx, value){
						// 태그 리스트 출력 작성하기
						var innerHtml = "";
	                	innerHtml += "<tag title='"+$.osl.escapeHtml(value)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-padding-5' style='display: inline-flex; margin: 3px;' role='tag' value='"+$.osl.escapeHtml(value)+"'>";
	                	innerHtml += "<div><div class='tagify__tag-text kt-margin-l-5 kt-margin-r-5'>#"+$.osl.escapeHtml(value)+"</div></div></tag>";
	                	
	                	$("#tagListDiv").append(innerHtml);
	                	tag.push(value);
					});
					
					//태그 클릭 이벤트
					$("tag").click(function(){
						
						//지정시 변경 안됨........
// 						$.osl.datatable.list["bad1000BadTable"].targetDt.setDataSourceParam("searchTargetId", "tagNm");
// 						$.osl.datatable.list["bad1000BadTable"].targetDt.setDataSourceParam("searchTargetType", "text");
// 						$.osl.datatable.list["bad1000BadTable"].targetDt.setDataSourceParam("searchTargetData", $(this).attr("value"));
						
						//모달 창 닫기
						$.osl.layerPopupClose();
						//드롭다운 메뉴 선택 활성화 취소 및 재선택
						$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id=bad1000BadTable]").children("a.dropdown-item.active").attr("class", "dropdown-item");
						$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id=bad1000BadTable]").children("a.dropdown-item[data-field-id=tagNm]").attr("class", "dropdown-item active");
						//검색 메뉴 버튼 변경
						$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id=bad1000BadTable]").parent().children(".btn.btn-secondary.dropdown-toggle").text($.osl.lang("bad1000.field.tagNm"));
						
						//select 감추기
						$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id=bad1000BadTable]").attr("style", "display:none;");
						$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id=bad1000BadTable]").attr("aria-hidden", "true");
						//input 보이기
						$("#searchData_bad1000BadTable").attr("disabled", "");
						//input에 태그 검색 값 넣기
						$("#searchData_bad1000BadTable").val($(this).attr("value"));
						//검색
						$("button[data-datatable-id=bad1000BadTable][data-datatable-action=select]").click();
						
					});
				}else{
					$("#badTagOption").addClass("kt-hide");
				}
				
				// 댓글
				// 게시판 자체 댓글 기능이 활성화 되어있는 경우
				if(paramRowData.stmCmtYnCd == "01"){
					// 해당 게시글에 댓글 기능을 활성화 한 경우
					if(setBad.badCmtYn == "01"){
						$("#badCmtDiv").removeClass("kt-hide");
						$("#badCmtInput").removeClass("kt-hide");
						// 댓글 입력창 앞에 현재 회원 사진 세팅
						$("#loginUsr").empty();
						var usrData = {
								html: $.osl.user.userInfo.usrNm + " (" + $.osl.user.userInfo.usrId + ")",
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
						};
						$("#loginUsr").append($.osl.user.usrImgSet($.osl.user.userInfo.usrImgId, usrData));
						$("#loginUsr").click(function(){
							$.osl.user.usrInfoPopup($.osl.user.userInfo.usrId);
						});
					}else{
						//해당 게시글에 댓글 기능을 비활성화 한 경우
						$("#badCmtInput").addClass("kt-hide");
					}

					//댓글 입력 후 엔터 쳤을 때
			    	$("#cmtWriter").on("keypress", function(e){
			    		if(e.key == "Enter"){
			    			$("#cmtSaveBtn").click();		
			    		}
			    	});
				}else{
					// 게시판 자체 댓글 기능이 비활성화 되어있는 경우
					$("#badCmtDiv").addClass("kt-hide");
				}

				//조회수 카운트/복원리스트 적용위해
				//datatable 조회
				OSLBad1000Popup.reload();
			}
    	});
    	
    	//AJAX 전송
		ajaxObj.send();
	};

	// 게시글 댓글 데이터 조회하기
	/* function 명 	: selectCmtList
	 * function 설명	: 댓글 리스트 재조회
	 */
    var selectCmtList = function(){
		$("button[data-datatable-id=bad1001CmtTable][data-datatable-action=select]").click();
	};
	
	// 게시글 댓글 등록하기
    /**
	* function 명 	: insertCmtInfo
	* function 설명	: 댓글 등록하기
	*/
    var insertCmtInfo = function(){
    	// 전달할 데이터 세팅
		var data={
    			menuId : paramRowData.menuId,
    			badId : paramRowData.badId,
    			badCmtContent: $.osl.escapeHtml($("#cmtWriter").val()),
   			};
    	
    	//ajax 설정
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1100/insertBad1100CmtInfoAjax.do'/>"}
				, data);
    	
    	//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				$("#cmtWriter").val('');
				//댓글 카운트 적용 위해
				//datatable 조회
   				OSLBad1000Popup.reload();
				selectCmtList();
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	
	 /*
	 * function : checkUser
	 * function 설명 : 담당자, 글작성범위, 게시판 공개 범위에 해당하는지 사용자 체크
	 */
	 var checkUser = function(){
		 var data = {
				 authGrpId : $.osl.selAuthGrpId,
				 prjGrpId :$.osl.selPrjGrpId,
	   			 prjId : $.osl.selPrjId,
				 menuId : $("#menuId").val(),
				 dsTypeCd : $("#stmDsTypeCd").val(),
		 };
		//ajax 설정
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2100UserCheckAjax.do'/>", "async": false}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var result = data.result;
				if(result.resultManager == "Y"){
					okManager = true;	
				}else{
					//시스템게시판 관리자로 들어오면 무조건 관리자
					if($("#stmRootYn").val()=='Y'){
						okManager = true;
					}else{
						//시스템게시판 관리로 들어오지도 않고 담당자목록에도 없을 때
						okManager = false;
					}
				}
				//글작성 목록에 있으면 - 글 작성 범위에 해당하는 사람
				//처음부터 글작성 목록이 비어있는경우 - 접근하는 사람 모두
				if(result.resultWriter == "Y" || result.resultWriter == "B"){
					okWriter = true;	
				}else{
					okWriter = false;
				}
			}
		});
		
    	//AJAX 전송
		ajaxObj.send();
	 };
    
    return {
        init: function() {
        	documentSetting();
        },
        reDraw: function(badId) {
        	//$("#badId").val(badId);
        	selectBadInfo(true);
        }
    };
}();

$.osl.ready(function(){
	OSLBad1001Popup.init();
});
</script>