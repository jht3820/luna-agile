<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
				<c:if test="${param.stmTypeCd eq '01' }">
					<i class="la la-newspaper-o kt-margin-r-5"></i><span data-lang-cd="stm2100.type.normal">[일반]</span>
				</c:if>
				<c:if test="${param.stmTypeCd eq '02' }">
					<i class="la la-server kt-margin-r-5"></i><span data-lang-cd="stm2100.type.storage">[자료실]</span>
				</c:if>
				<c:if test="${param.stmTypeCd eq '03' }">
					<i class="la la-image kt-margin-r-5"></i><span data-lang-cd="stm2100.type.gallery">[갤러리]</span>
				</c:if>
				<c:if test="${param.stmTypeCd eq '04' }">
					<i class="la la-youtube-play kt-margin-r-5"></i><span data-lang-cd="stm2100.type.movie">[영상]</span>
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
						<i class="fa flaticon-exclamation-1 kt-margin-r-5"></i><span data-lang-cd="stm2102.label.notice">공지사항</span>
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
						<i class="fa flaticon-chat-1 kt-margin-r-5"></i><span data-lang-cd="stm2102.label.comment">댓글</span>
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
						<i class="fa flaticon-edit-1 kt-margin-r-5"></i><span data-lang-cd="stm2102.label.board">게시글</span>
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
						<i class="fa flaticon-interface-9 kt-margin-r-5"></i><span data-lang-cd="stm2102.label.tag">태그</span>
					</div>
					<ul class="list-group list-group-flush" name="tagTop" id="tagTop">
					</ul>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="card w-500 kt-margin-t-10">
					<div class="card-header kt-font-bolder">
						<i class="fa flaticon-tool-1 kt-margin-r-5"></i><span data-lang-cd="stm2102.label.attachFile">첨부파일</span>
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
 
 var OSLStm2102Popup = function () {
	 var documentSetting = function () {
		 selectStm2102();
	 };
	 
	 /**
		* function 명 	: selectStm2102
		* function 설명	: 해당 게시판 통계자료 가져오기
		*/
	 var selectStm2102 = function(){
		 //조회할 메뉴 아이디 전달
		 var data = {
				 menuId : $("#menuId").val(),
		 }
		 //AJAX 설정
		 var ajaxObj = new $.osl.ajaxRequestAction(
	    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2102BadSummeryInfoAjax.do'/>"}
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
						$("#ntcCnt").text($.osl.lang("stm2102.summery.noticeCntY", ntcInfo.cnt));
						$("#ntcCurrent").text($.osl.lang("stm2102.summery.ntcCurrentY", ntcInfo.badNtcStdtm));
						$("#ntcCurrent").data("badId", ntcInfo.badId);
						$("#ntcCurrent").data("prjGrpId", ntcInfo.prjGrpId);
						$("#ntcCurrent").data("prjId", ntcInfo.prjId);
					}else{
						$("#ntcCnt").text($.osl.lang("stm2102.summery.noticeCntN"));
						$("#ntcCurrent").text($.osl.lang("stm2102.summery.ntcCurrentN"));
						$("#ntcCurrent").data("badId", '');
						$("#ntcCurrent").data("prjGrpId", '');
						$("#ntcCurrent").data("prjId",'');
					}
				}else{
					$("#ntcCnt").text($.osl.lang("stm2102.summery.noticeCntN"));
					$("#ntcCurrent").text($.osl.lang("stm2102.summery.ntcCurrentN"));
				}
				if(badCmtInfo != "N"){
					$("#cmtAllCnt").text($.osl.lang("stm2102.summery.cmtAllCntY", badCmtInfo.allCnt));
					$("#cmtMaxInfo").text($.osl.lang("stm2102.summery.cmtMaxInfoY", badCmtInfo.cnt ));
					$("#cmtMaxInfo").data("badId", badCmtInfo.badId);
					$("#cmtMaxInfo").data("prjGrpId", badCmtInfo.prjGrpId);
					$("#cmtMaxInfo").data("prjId", badCmtInfo.prjId);
				}else{
					$("#cmtAllCnt").text($.osl.lang("stm2102.summery.cmtAllCntN"));
					$("#cmtMaxInfo").text($.osl.lang("stm2102.summery.cmtMaxInfoN"));
					$("#cmtMaxInfo").data("badId", '');
					$("#cmtMaxInfo").data("prjGrpId", '');
					$("#cmtMaxInfo").data("prjId", '');
				}
				if(badCntInfo != "N"){
					$("#badAllCnt").text($.osl.lang("stm2102.summery.badAllCntY", badCntInfo.badCntAll , badCntInfo.badCntDel));	
				}else{
					$("#badAllCnt").text($.osl.lang("stm2102.summery.badAllCntN"));
				}
				if(badHitInfo != "N"){
					$("#badHitInfo").text($.osl.lang("stm2102.summery.badHitInfoY", badHitInfo.badHit));
					$("#badHitInfo").data("badId", badHitInfo.badId);
					$("#badHitInfo").data("prjGrpId", badHitInfo.prjGrpId);
					$("#badHitInfo").data("prjId", badHitInfo.prjId);
				}else{
					$("#badHitInfo").text($.osl.lang("stm2102.summery.badHitInfoN"));
					$("#badHitInfo").data("badId", '');
					$("#badHitInfo").data("prjGrpId", '');
					$("#badHitInfo").data("prjId", '');
				}
				if(pwCnt != 0){
					$("#badPwCnt").text($.osl.lang("stm2102.summery.badPwCntY", pwCnt));
				}else{
					$("#badPwCnt").text($.osl.lang("stm2102.summery.badPwCntN"));
				}
				if(tagInfo != null && tagInfo != "" && tagInfo != "N"){
					$("#tagTop").empty();
					$.each(tagInfo, function(idx, value){
						if(idx < 3){ //sql 조회 top 5
							var innerHtml = "<li class='list-group-item kt-padding-l-35'>"+$.osl.lang("stm2102.summery.tagLabelY",idx+1, $.osl.escapeHtml(value.tagNm))+ "</li>";
							$("#tagTop").append(innerHtml);
						}
					});
				}else{
					$("#tagTop").empty();
					var innerHtml = "<li class='list-group-item kt-padding-l-35'>"+$.osl.lang("stm2102.summery.tagLabelN")+"</li>";
					$("#tagTop").append(innerHtml);
				}
				if(fileSummery != "N"){
					$("#fileAllCnt").text($.osl.lang("stm2102.summery.fileAllCntY", parseInt(fileSummery.fileTotalCnt)));
					$("#fileAllSize").text($.osl.lang("stm2102.summery.fileAllSizeY", $.osl.byteCalc(parseInt(fileSummery.fileTotalSize))));
				}else{
					$("#fileAllCnt").text($.osl.lang("stm2102.summery.fileAllCntN"));
					$("#fileAllSize").text($.osl.lang("stm2102.summery.fileAllCntN"));
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
	 OSLStm2102Popup.init();
});
 </script>
<!-- end script -->