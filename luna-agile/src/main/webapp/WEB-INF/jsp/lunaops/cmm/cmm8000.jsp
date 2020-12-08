<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="kt-padding-20 osl-user-info__modal kt-bg-light">
	<form class="kt-form" id="frCmm8000">
		<input type="hidden" name="usrId" id="usrId" value="${param.paramUsrId}">
		<div class="row">
			<!-- begin :: 사진-->
			<div class="col-3 osl-user-info__modal_dislay--none">
				<div class="kt-profile__main-pic kt-media osl-media">
					<img id="usrImage" src="" />
		    	</div>
		    </div>
			<!-- end :: 사진-->
		    <!-- begin :: 내용-->
		    <div class="col-9 osl-user-info__modal_dislay--full">
		    	<!-- begin :: 사용자 이름   -->
			    <div class="row kt-margin-b-20">
					<div class="col-lg-8 col-md-7 col-sm-6 col-6 kt-font-boldest osl-user-name" id="usrNm"></div>
					<div class="col-lg-4 col-md-5 col-sm-6 col-6">
						<button type="button" class="btn btn-brand osl-user__message-btn--right" data-dismiss=""><i class="fas fa-envelope-open-text kt-margin-r-5"></i>메세지 전송</button>
					</div>
			    </div>
			    <!-- end :: 사용자 이름   -->
			    <div class="row">
					<div class="col-6">
						<!-- begin :: 이메일  -->
					    <div class="d-flex align-items-center flex-wrap kt-margin-b-10 osl-flex-info-column">
					    	<span class="kt-font-boldest kt-margin-r-10">
					    		<i class="fas fa-envelope kt-margin-r-5"></i>이메일
					    	</span>
				    		<span id="email"></span>
				    	</div>
			    		<!-- end :: 이메일   -->						
			    		<!-- begin :: 연락처  -->
			    		<div class="d-flex align-items-center flex-wrap osl-flex-info-column">
					    	<span class="kt-font-boldest kt-margin-r-10">
					    		<i class="fas fa-phone-alt kt-margin-r-5"></i>연락처
					    	</span>
					    	<span id="telno"></span>
				    	</div>
			    		<!-- end :: 연락처   -->
			    	</div>
				    <div class="col-6">
						<!-- begin :: 직책  -->
						<div class="d-flex align-items-center flex-wrap kt-margin-b-10 osl-flex-info-column">
					    	<span class="kt-font-boldest kt-margin-r-10">
					    		<i class="fa fa-id-badge kt-margin-r-5"></i>직책
					    	</span>
				    		<span id="usrDutyNm"></span>
				    	</div>
			    		<!-- end :: 직책   -->
						<!-- begin :: 직급  -->
			    		<div class="d-flex align-items-center flex-wrap osl-flex-info-column">
					    	<span class="kt-font-boldest kt-margin-r-10">
					    		<i class="fa fa-id-badge kt-margin-r-5"></i>직급
					    	</span>
					    	<span id="usrPositionNm"></span>
				    	</div>
			    		<!-- end :: 직급   -->
					</div>
				</div>
				
				<!-- begin :: 부서  -->
				<div class="d-flex align-items-center flex-wrap kt-margin-t-10 osl-flex-info-column">
			    	<span class="kt-font-boldest kt-margin-r-10">
			    		<i class="far fa-address-card font-weight-bold kt-margin-r-5"></i>부서&nbsp;&nbsp;&nbsp;&nbsp;
			    	</span>
			    	<span id="deptName"></span>
		    	</div>
	    		<!-- end :: 부서   -->
		    </div>	
			<!-- end :: 사진-->
	 	</div>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">닫기</button>
</div>
<script>
"use strict";

//파일 업로드 세팅
var OSLCmm8000Popup = function () {
    // Private functions
    var documentSetting = function () {
    	selectUsrInfo();
    };
    
    /**
 	* function 명 	: selectUsrInfo
	* function 설명	: 사용자 정보를 조회하여 팝업에 세팅한다.
	*/
	var selectUsrInfo = function() {
    	
    	var paramUsrId = $("#usrId").val();
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/usr/usr1000/usr1000/selectUsr1000UsrInfoAjax.do'/>"}
				,{"usrId": paramUsrId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				// 사용자 정보 세팅
		    	$.osl.setDataFormElem(data.usrInfoMap,"frCmm8000", ["usrId", "usrNm", "email", "telno", "deptId", "deptName", "usrPositionNm", "usrDutyNm"]);
				
				var usrImgId = data.usrInfoMap.usrImgId;
				
				// 사용자 이미지 세팅
				var usrImgUrl = $.osl.user.usrImgUrlVal(usrImgId);
				$("#usrImage").attr("src", usrImgUrl);
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

// Initialization
$.osl.ready(function(){
	OSLCmm8000Popup.init();
});

	
</script>