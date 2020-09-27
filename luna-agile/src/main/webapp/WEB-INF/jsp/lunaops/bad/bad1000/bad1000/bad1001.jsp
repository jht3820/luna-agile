<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
img {
  max-width: 100%;
}

.osl-portlet__head-label{
	width: 100%;
}

.card-body{
	position: relative;
}

.osl-portlet__head-toolbar{
	position: absolute;
	right: 15px;
	top: -50px;
}
.osl-portlet__head-toolbar>button{
	min-width: 43px;
}
.kt-widget__wrapper>button{
	min-width: 43px;
}
.osl-portlet__head-label>div{
	width: 40%;
	line-height: 32px;
	float:left;
	text-align: center;
}
.osl-portlet__head-label>div:nth-child(2){
	text-align: right;
}
.osl-padding-b-6__5{
 	padding-bottom: 6.5px !important; 
}
.osl-cmt__width__100{
	word-break: break-word;
}
@media (max-width: 1400px){
	.osl-cmt__width__100{
		width:300px !important; 
	}
	.osl-portlet__head-label>div{
		width: 35%;
	}
}
@media (max-width: 1024px){
	.osl-portlet__head-label > div:first-child{
		width: 100%;
	}
	.osl-portlet__head-label > div:nth-child(2){
		width: 100%;
		text-align: left;
		padding: 0 !important;
	}
	.osl-padding-b-6__5{
		padding: 0 !important;
		padding-bottom: 3.5px !important;
	}
}
@media (max-width: 430px){
	.osl-portlet__head-label > div:nth-child(2),.osl-portlet__head-label > div:last-child{
		width: 100%;
		height: 10px;
		line-height: 10px;
		text-align:left;
	}
}
</style>

<input type="hidden" name="stmTypeCd" id="stmTypeCd" value="${param.stmTypeCd}" /> 
<input type="hidden" name="stmDsTypeCd" id="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
<input type="hidden" name="stmNm" id="stmNm" value='${param.stmNm}'/>
<input type="hidden" name="badNum" id="badNum" value="${param.badNum }" />
<input type="hidden" name="prjGrpId" id="prjGrpId" value="${param.prjGrpId }" /> 
<input type="hidden" name="prjId" id="prjId" value="${param.prjId }" />  
<input type="hidden" name="menuId" id="menuId" value="${param.menuId }" /> 
<input type="hidden" name="badId" id="badId" value="${param.badId }" />
<input type="hidden" name="badDelCd" id="badDelCd" value="${param.badDelCd }" />
<input type="hidden" name="atchFileId" id="atchFileId" value="${param.atchFileId }" />
<input type="hidden" name="searchTarget" id="searchTarget" value='${param.searchTarget }' />
<input type="hidden" name="fileCnt" id="fileCnt" value="" /> 
<input type="hidden" name="fileStrg" id="fileStrg" value="" /> 
<input type="hidden" id="stmRootYn" name="stmRootYn" value='${param.stmRootYn}'/>

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
		<div class="card-body">
			<!-- 수정, 삭제, 복원 -->
			<div class="osl-portlet__head-toolbar">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" name="updateBtn" id="updateBtn" title="게시글 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
					<i class="fa fa-edit"></i><span>수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" name="deleteBtn" id="deleteBtn" title="게시글 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
					<i class="fa fa-trash-alt"></i><span>삭제</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air kt-hide" name="restoreBtn" id="restoreBtn" title="게시글 복원" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
					<i class="la la-rotate-left"></i><span>복원</span>
				</button>
			</div>
			<!-- 내용 -->
			<div class="bard-text kt-margin-t-10" style="min-height: 150px;" name="badContentDiv" id="badContentDiv"></div>
			<!-- 첨부파일 목록 -->
			<div class="form-group kt-margin-t-20 kt-margin-b-20 kt-hide" name="badFileOption" id="badFileOption">
				<hr class="kt-margin-t-20 kt-margin-b-20">
				<div class="kt-font-bolder kt-padding-l-5">
					<i class="fa fa-file-upload kt-margin-r-5"></i>파일 첨부
				</div>
				<div class="kt-margin-t-10" name="fileListDiv" id="fileListDiv">
				</div>
			</div>
			<!-- 태그 리스트 -->
			<div class="form-group kt-margin-b-20 kt-hide" name="badTagOption" id="badTagOption">
				<div class="kt-font-bolder kt-padding-l-5">
					<i class="fa fa-hashtag kt-margin-r-5"></i> 태그
				</div>
				<div class="kt-margin-t-10" name="tagListDiv" id="tagListDiv">
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 리스트 -->
	<div class="card kt-margin-t-10"  name="badCmtDiv" id="badCmtDiv">
		<div class="card-header kt-font-bolder" style="line-height: 32px">
			<i class="fa flaticon-chat-1 kt-margin-r-5"></i> 댓글
			<div class="kt-portlet__head-toolbar" style="float:right; align-items:''; ">
				<!-- 댓글 조회/삭제 -->
				<div class="kt-widget__wrapper" name="badCmtBtnDiv" id="badCmtBtnDiv">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1001CmtTable" data-datatable-action="select" title="댓글 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
						<i class="fa fa-list"></i><span>조회</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1001CmtTable" data-datatable-action="delete" title="댓글 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="2">
						<i class="fa fa-trash-alt"></i><span>삭제</span>
					</button>
				</div>
			</div>
		</div>
		<div class="card-body">
			<!-- 댓글 검색 -->
			<div class="row">
				<div class="osl-datatable-search col-lg-5 col-md-6 col-sm-6 col-12" data-datatable-id="bad1001CmtTable"></div>
			</div>
			<!-- 댓글 입력창 -->
			<div class="input-group kt-margin-t-10 kt-margin-b-10 kt-padding-l-30 kt-padding-r-10 kt-hide" style="width:95%" name="badCmtInput" id="badCmtInput">
				<div class="input-group-prepend kt-padding-r-15" name="loginUsr" id="loginUsr">
				</div>
				<input type="text" class="form-control" name="cmtWriter" id="cmtWriter" maxlength="200" />
				<div class="input-group-append">
					<button class="btn btn-brand" type="button" name="cmtSaveBtn" id="cmtSaveBtn">등록</button>
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
	var okManager;
	var okWriter;
	var id = $.osl.user.userInfo.usrId;
	var fileUploadObj;
	var tag = [];

	var formId = 'bad1001Info';
	
   	var dataTableId = "bad1001CmtTable";
    var documentSetting = function () {
		checkUser();
		
		// 파일 업로드 세팅
	   	fileUploadObj = $.osl.file.uploadSet("fileListDiv",{
	   		url: '/bad/bad1000/bad1000/insertBad1002BadAtchFileInfo.do',
	   		meta: {"atchFileId": $("#atchFileId").val(), "fileSn": 0},
	   		maxFileSize: Number($("#fileStrg").val()),
	   		maxNumberOfFiles: Number($("#fileCnt").val()),
	   		height: 200,
	   	});
   	
   		selectBadInfo(true);

    	$.osl.datatable.setting(dataTableId, {
			 data: {
				 source: {
					 read: {
						url: "/bad/bad1000/bad1100/selectBad1100CmtListAjax.do",
						params : {
							menuId: $("#menuId").val(),
							badId : $("#badId").val(),
						}
					 }
				 },
			 },
			 columns: [
				 {field: 'checkbox', title: '#', textAlign: 'center', width: 30, selector: {class: "kt-checkbox--solid"}, sortable: false, autoHide: false},
				 {field: 'badCmtUsrId', title: '작성자', textAlign: 'left', width: 180,
						template: function (row) {
							return $.osl.user.usrImgSet(row.badCmtUsrImgId, row.badCmtUsrNm+"("+row.badCmtUsrId+")");
						},
						onclick: function(rowData){
							$.osl.user.usrInfoPopup(rowData.badCmtUsrId);
						}
						, autoHide: true, search:true},
				 {field: 'badCmtContent', title: '내용', textAlign: 'left', width:740, autoHide: false, search:true,
					template:function(row){
						var returnStr = "<span class='cmtTxt' style='word-break: break-word;'>"+row.badCmtContent+"</span>";
						return returnStr;
					}			
				 },
				 {field: 'badCmtDtm', title: '작성일', textAlign: 'center', width: 100, search:true, searchType:"daterange",
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
			 rows:{
				afterTemplate: function(row, data, index){
					$(".cmtTxt").parents("span").addClass("osl-cmt__width__100");
				}
			 },
			 layout:{ "header" : false },
			 actionBtn:{
				 "title" : "삭제",
				 "update": false,
			 },
			 actionTooltip:{
				"delete": "댓글 삭제",
			},
			 actionFn:{
				 "delete":function(rowDatas){
					 //삭제된 게시글이 아닌 경우에만 댓글 삭제 기능 가능
					 if($("#badDelCd").val() =='02'){
						//담당자 외 삭제 선택한 글 중 본인 외 작성 댓글이 포함된 경우인지 확인
						var selfCheck = "Y";
						$.each(rowDatas, function(idx, value){
							if(value.badCmtUsrId != id){
								selfCheck = "N";
							}
						});
						 //담당자이거나 댓글 작성한 사용자와 현재 로그인한 회원이 같은 경우
						 if(okManager == true || (okWriter == true && selfCheck == "Y")){
							var data = {
		 							menuId : $("#menuId").val(),
		 							badId : $("#badId").val(),
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
					 		$.osl.alert("삭제 권한이 없습니다.", {"type":"warning"});
					 	}
					 }
				 }
			 },
			 collback :{
				 reloaded :{
					 
				 }
			 }
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
    				detailRootYn: 'Y',
    				prjGrpId: $("#prjGrpId").val(),
    				prjId : $("#prjId").val(),
					menuId : $("#menuId").val(),
					badId : $("#badId").val(),
					atchFileId : $("#atchFileId").val(),
				};
			var options = {
					idKey: "bad1003_" + $("#badId").val(),
					modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+$("#badNum").val(),
					closeConfirm: true,
					autoHeight: false,
					modalSize: "xl",
				};
			
			//담당자 또는 글 작성자 본인만 수정 가능
			if(okManager == true || $("#writerDiv").data("badUsrId") == id){
				$.osl.layerPopupOpen('/bad/bad1000/bad1000/updateBad1003View.do',data,options);
			}else{
				$.osl.alert("수정 권한이 없습니다.", {"type":"waraning"});
			}
    	});
    	
    	//삭제 버튼 클릭 시
		$("#deleteBtn").click(function(){
			var data = {
					stmTypeCd : $("#stmTypeCd").val(),
					prjGrpId: $("#prjGrpId").val(),
    				prjId : $("#prjId").val(),
					menuId : $("#menuId").val(),
					badId : $("#badId").val(),
					atchFileId : $("#atchFileId").val(),
					menuRootYn : 'N',
			};
			var options = {
					idKey: "del_"+$("#badId").val(),
					modalTitle: "[ NO." + $("#badNum").val() +" ] 게시글 삭제 사유",
					closeConfirm: false,
					autoHeight: false,
					modalSize: "xl"
				};
			
			//담당자 또는 글 작성자 본인만 삭제 가능
			if(okManager == true || $("#writerDiv").data("badUsrId") == id){
				//삭제 사유 팝업
				$.osl.layerPopupOpen('/bad/bad1000/bad1000/deleteBad1000View.do', data, options);
			}else{
				$.osl.alert("삭제 권한이 없습니다.", {"type":"waraning"});
			}
    	});
    	
		//복원 버튼 클릭 시
    	$("#restoreBtn").click(function(){
    		//담당자만 가능
			if(okManager == true){
	    		var data = {
						menuId : $("#menuId").val(),
						prjGrpId: $("#prjGrpId").val(),
						prjId: $("#prjId").val(),
						badId : $("#badId").val(),
						atchFileId : $("#atchFileId").val(),
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
						//게시글 재호출하기
						//복원 후 호출이므로 조회수 증가 안함
						selectBadInfo(false);
						//댓글 재조회
						selectCmtList();
					}	
				});
		    	//AJAX 전송
				ajaxObj.send();
			}else{
				$.osl.alert("복원 권한이 없습니다.", {"type":"waraning"});
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
				badNum : $("#badNum").val(),
    			menuId : $("#menuId").val(),
    			badId : $("#badId").val(),
				searchTarget : $("#searchTarget").val(),
    	}
    	//삭제된 게시글이 아니면
    	if($("#badDelCd").val()=='02' && badHitYn == true){
    		data.badHit = true;
    	}else{
    		data.badHit = false;
    	}
    	//ajax 설정 - 게시글 후에 댓글 리스트 출력 하기 위해 "async": false
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1000/selectBad1001InfoAjax.do'/>", "async": false}
				, data);
    	
    	//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var info = data.badInfo;
				var setBad = data.bad1001Info;
				var tagList = data.bad1001Tag;
				var fileList = data.bad1001FileList;
				var fileCnt = data.bad1001FileListCnt;
				
				// 가져온 데이터로 세팅하기
				// head ------------------
				// 제목 넣기
				$("#badTitleDiv").empty();
				var titleStr = "";
				var title = setBad.badTitle;
				
				// 공지사항인지 확인
				if(setBad.badNtcCheck=='01'){
					//오늘 날짜가 공지사항 기간에 해당하는지 확인
					if(setBad.currentNtc == 'Y'){
						// 공지사항인 경우 제목 스타일 변경
						//$("#badTitleDiv").addClass("kt-bg-fill-success");
						titleStr += "<span class='kt-badge kt-badge--danger kt-badge--inline kt-badge--pill kt-margin-5'>공지</span>";
						titleStr += title;
					}
				}else{
					titleStr += title;
				}
				// 비밀글인 경우 제목에 아이콘 추가
				if(setBad.badPwYn == 'Y'){
					titleStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
				}
				
				// 삭제된 글인지 확인
				if(setBad.delCd=='01'){
					titleStr = "<span class='kt-badge kt-badge--dark kt-badge--inline kt-badge--pill kt-margin-5'>삭제</span>" + titleStr;
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
				$("#writerDiv").html($.osl.user.usrImgSet(setBad.badUsrImgId, setBad.badUsrNm+" ( "+setBad.badUsrId+" ) "));
				$("#writerDiv").data("badUsrId", setBad.badUsrId);
				
				//작성자 정보 상세 보기
				$("#writerDiv").click(function(){
					$.osl.user.usrInfoPopup(setBad.badUsrId);
				});
				
				// 작성일 정보 넣기
				$("#writeDateDiv").text("작성일시 : " + setBad.badWtdtm);
				
				// 조회수 정보 넣기
				$("#hitDiv").text("조회수 : " + setBad.badHit);
				
				// body ------------------
				// 내용입력
				$("#badContentDiv").html(setBad.badContent);
				
				// option ------------------
				// 첨부파일
				if(fileList != null && fileList != ""){
					$("#badFileOption").removeClass("kt-hide");
					$("#fileCnt").attr("value", info.stmFileCnt);
					$("#fileStrg").attr("value", info.stmFileStrg);
					
					//파일Sn넣기
			    	fileUploadObj.setMeta({fileSn: parseInt(fileCnt)+1});
			    	fileUploadObj.setMeta({atchFileId: fileList.atchFileId});
			    	
			    	//파일 목록 세팅
			    	$.osl.file.fileListSetting(fileList, fileUploadObj);
				}else{
					$("#badFileOption").addClass("kt-hide");
				}
				
				// 태그
				if(tagList != null && tagList[0] != null)
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
				}else{
					$("#badTagOption").addClass("kt-hide");
				}
				
				// 댓글
				// 게시판 자체 댓글 기능이 활성화 되어있는 경우
				if(info.stmCmtYnCd == "01"){
					// 해당 게시글에 댓글 기능을 활성화 한 경우
					if(setBad.badCmtYn == "01"){
						$("#badCmtDiv").removeClass("kt-hide");
						$("#badCmtInput").removeClass("kt-hide");
						// 댓글 입력창 앞에 현재 회원 사진 세팅
						$("#loginUsr").empty();
						$("#loginUsr").append($.osl.user.usrImgSet($.osl.user.userInfo.usrImgId, $.osl.user.userInfo.usrNm +" ( "+ id + " )"));
						$("#loginUsr").click(function(){
							$.osl.user.usrInfoPopup(id);
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
   				$("button[data-datatable-id=bad1000BadTable][data-datatable-action=select]").click();
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
    			menuId : $("#menuId").val(),
    			badId : $("#badId").val(),
    			badCmtContent: $("#cmtWriter").val(),
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
				selectCmtList();
				//댓글 카운트 적용 위해
				//datatable 조회
   				$("button[data-datatable-id=bad1000BadTable][data-datatable-action=select]").click();
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
					okManager = false;
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
        	$("#badId").val(badId);
        	selectBadInfo(true);
        }
    };
}();

$.osl.ready(function(){
	OSLBad1001Popup.init();
});
</script>