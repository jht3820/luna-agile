<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
				<c:if test="${param.stmTypeCd eq '01' }">
					<i class="la la-newspaper-o kt-margin-r-5"></i>[일반]
				</c:if>
				<c:if test="${param.stmTypeCd eq '02' }">
					<i class="la la-server kt-margin-r-5"></i>[자료실]
				</c:if>
				<c:if test="${param.stmTypeCd eq '03' }">
					<i class="la la-image kt-margin-r-5"></i>[갤러리]
				</c:if>
				<c:if test="${param.stmTypeCd eq '04' }">
					<i class="la la-youtube-play kt-margin-r-5"></i>[영상]
				</c:if>
				<c:out value="${param.stmNm }"/>
			</h3>
			<input type="hidden" id="menuId" name="menuId" value='${param.menuId}'/>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="card w-500 kt-margin-t-10">
					<div class="card-header kt-font-bolder">
						<i class="fa flaticon-exclamation-1 kt-margin-r-5"></i> 공지사항
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item kt-padding-l-35" name="ntcCnt" id="ntcCnt"></li>
						<li class="list-group-item kt-padding-l-35" name="ntcCurrent" id="ntcCurrent" data-badId='' data-prjGrpId='' data-prjId=''></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="card w-500 kt-margin-t-10">
					<div class="card-header kt-font-bolder">
						<i class="fa flaticon-chat-1 kt-margin-r-5"></i>  댓글
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item kt-padding-l-35" name="cmtAllCnt" id="cmtAllCnt"></li>
						<li class="list-group-item kt-padding-l-35" name="cmtMaxInfo" id="cmtMaxInfo" data-badId='' data-prjGrpId='' data-prjId=''></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="card w-500 kt-margin-t-10">
					<div class="card-header kt-font-bolder">
						<i class="fa flaticon-edit-1 kt-margin-r-5"></i>  게시글
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item kt-padding-l-35" name="badAllCnt" id="badAllCnt"></li>
						<li class="list-group-item kt-padding-l-35" name="badHitInfo" id="badHitInfo" data-badId='' data-prjGrpId='' data-prjId=''></li>
						<li class="list-group-item kt-padding-l-35" name="badPwCnt" id="badPwCnt"></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="card w-500 kt-margin-t-10">
					<div class="card-header kt-font-bolder">
						<i class="fa flaticon-interface-9 kt-margin-r-5"></i> 태그
					</div>
					<ul class="list-group list-group-flush" name="tagTop" id="tagTop">
					</ul>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="card w-500 kt-margin-t-10">
					<div class="card-header kt-font-bolder">
						<i class="fa flaticon-tool-1 kt-margin-r-5"></i>  첨부파일
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item kt-padding-l-35" name="fileAllCnt" id="fileAllCnt"></li>
						<li class="list-group-item kt-padding-l-35" name="fileAllSize" id="fileAllSize"></li>
					</ul>
				</div>
			</div>
	</div>
</div>
<!-- begin page script -->
<script>
 "use strict";
 
 var OSLStm2103Popup = function () {
	 var documentSetting = function () {
		 selectStm2103();
	 };
	 
	 /**
		* function 명 	: selectStm2103
		* function 설명	: 해당 게시판 통계자료 가져오기
		*/
	 var selectStm2103 = function(){
		 //조회할 메뉴 아이디 전달
		 var data = {
				 menuId : $("#menuId").val(),
		 }
		 //AJAX 설정
		 var ajaxObj = new $.osl.ajaxRequestAction(
	    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2103BadSummeryInfoAjax.do'/>"}
					, data);
		 
		 //AJAX 전송 성공
		 ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				 //AJAX 전송 실패
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var ntcInfo = data.ntcInfo;
				var badCntInfo = data.badCntInfo;
				var badHitInfo = data.badHitInfo;
				var pwCnt = data.pwCnt;
				var badCmtInfo = data.badCmtInfo;
				var tagInfo = data.tagInfo;
				var fileSummery = data.fileSummery;
				
				//가져온 데이터로 세팅하기
				if(ntcInfo != "N"){
					if(ntcInfo.cnt != 0){
						$("#ntcCnt").text("공지사항 수 : " + ntcInfo.cnt +" 건");
						$("#ntcCurrent").text("최신 공지일 : " + ntcInfo.badNtcStdtm);
						$("#ntcCurrent").data("badId", ntcInfo.badId);
						$("#ntcCurrent").data("prjGrpId", ntcInfo.prjGrpId);
						$("#ntcCurrent").data("prjId", ntcInfo.prjId);
					}else{
						$("#ntcCnt").text("공지사항 수 : 없음");
						$("#ntcCurrent").text("최신 공지일 : 없음");
						$("#ntcCurrent").data("badId", '');
						$("#ntcCurrent").data("prjGrpId", '');
						$("#ntcCurrent").data("prjId",'');
					}
				}else{
					$("#ntcCnt").text("공지사항 수 : 없음");
					$("#ntcCurrent").text("최신 공지일 : 없음");
				}
				if(badCmtInfo != "N"){
					$("#cmtAllCnt").text("전체 댓글 수 : " + badCmtInfo.allCnt +" 건");
					$("#cmtMaxInfo").text("최다 댓글 수 : " + badCmtInfo.cnt + " 건");
					$("#cmtMaxInfo").data("badId", badCmtInfo.badId);
					$("#cmtMaxInfo").data("prjGrpId", badCmtInfo.prjGrpId);
					$("#cmtMaxInfo").data("prjId", badCmtInfo.prjId);
				}else{
					$("#cmtAllCnt").text("전체 댓글 수 : 없음");
					$("#cmtMaxInfo").text("최다 댓글 수 : 없음");
					$("#cmtMaxInfo").data("badId", '');
					$("#cmtMaxInfo").data("prjGrpId", '');
					$("#cmtMaxInfo").data("prjId", '');
				}
				if(badCntInfo != "N"){
					$("#badAllCnt").text("전체 게시글 수 : 등록 "+badCntInfo.badCntAll+" 건 / 삭제 "+badCntInfo.badCntDel+" 건");	
				}else{
					$("#badAllCnt").text("전체 게시글 수 : 없음");
				}
				if(badHitInfo != "N"){
					$("#badHitInfo").text("최다 조회 수 : "+badHitInfo.badHit+" 회");
					$("#badHitInfo").data("badId", badHitInfo.badId);
					$("#badHitInfo").data("prjGrpId", badHitInfo.prjGrpId);
					$("#badHitInfo").data("prjId", badHitInfo.prjId);
				}else{
					$("#badHitInfo").text("최다 조회 수 : 없음");
					$("#badHitInfo").data("badId", '');
					$("#badHitInfo").data("prjGrpId", '');
					$("#badHitInfo").data("prjId", '');
				}
				if(pwCnt != 0){
					$("#badPwCnt").text("비밀글 수 : " + pwCnt + " 건");
				}else{
					$("#badPwCnt").text("비밀글 수 : 없음");
				}
				if(tagInfo != null && tagInfo != "" && tagInfo != "N"){
				console.log(tagInfo);
					$("#tagTop").empty();
					$.each(tagInfo, function(idx, value){
						if(idx < 3){ //sql 조회 top 5
							var innerHtml = "<li class='list-group-item kt-padding-l-35'>사용 TOP " + (idx + 1) + " : #" + $.osl.escapeHtml(value.tagNm)+ "</li>";
							$("#tagTop").append(innerHtml);
						}
					});
				}else{
					$("#tagTop").empty();
					var innerHtml = "<li class='list-group-item kt-padding-l-35'>사용 태그 없음</li>";
					$("#tagTop").append(innerHtml);
				}
				if(fileSummery != "N"){
					$("#fileAllCnt").text("전체 첨부파일 수 : " +parseInt(fileSummery.fileTotalCnt) + " 건");
					$("#fileAllSize").text("전체 첨부파일 크기 : " + $.osl.byteCalc(parseInt(fileSummery.fileTotalSize)));
				}else{
					$("#fileAllCnt").text("전체 첨부파일 수 : 없음");
					$("#fileAllSize").text("전체 첨부파일 크기 : 없음");
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
	 };
 }();
 
 $.osl.ready(function(){
	 OSLStm2103Popup.init();
});
 </script>
<!-- end script -->