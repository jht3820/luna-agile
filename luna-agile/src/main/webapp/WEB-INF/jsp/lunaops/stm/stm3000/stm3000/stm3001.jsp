<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm3001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="ldapUse" id="ldapUse" value="${requestScope.ldapUse}">
	<input type="hidden" name="deptId" id="deptId">
	<input type="hidden" name="orgDeptNm" id="orgDeptNm">
	<input type="hidden" name="orgEmail" id="orgEmail" > <!-- 수정전 이메일 -->
	<input type="hidden" name="orgBlock" id="orgBlock" > <!-- 수정전 차단유무 -->
	<input type="hidden" name="pwFailCnt" id="pwFailCnt" >
	<input type="hidden" name="loginExprYn" id="loginExprYn" > <!-- 3개월 미접속 여부 -->
	<input type="hidden" name="usrImgId" id="usrImgId">
	<input type="hidden" name="loginType" id="loginType" value="${requestScope.loginType}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group kt-margin-b-20 d-none" id="blockGuideMsg">
				<div class="alert alert-solid-danger alert-bold fade show kt-margin-t-5" role="alert">
					<div class="alert-icon"><i class="fa fa-exclamation-triangle"></i></div>
					<div class="alert-text">3개월 이상 미접속한 사용자입니다. 차단유무를 [정상]으로 수정 시 로그인 가능합니다.</div>
				</div>
			</div>
			<div class="row kt-margin-b-10">
				<!-- begin::사용자 이미지 영역 -->
				<div class="col-xl-6 kt-align-center">
					<div class="form-group kt-margin-b-5">
						<div class="kt-avatar kt-avatar--circle" id="usrImg_avatar">
							<div class="kt-avatar__holder osl-avatar__holder-lg" id="usrImage" title="사용자 이미지"></div>
							<label class="kt-avatar__upload" data-toggle="kt-tooltip" title="이미지 찾기">
								<i class="fa fa-pen"></i>
								<input type='file' name="usrImgFile" id="usrImgFile"/>
							</label>
							<span class="kt-avatar__cancel" data-toggle="kt-tooltip" title="이미지 삭제">
								<i class="fa fa-times"></i>
							</span>
						</div>
					</div>
					<div class="form-group kt-margin-b-0">
						<button type="button" class="btn btn-sm btn-danger kt-margin-l-10 d-none" id="btn_imageReset" title="기존 이미지로 되돌리기">되돌리기</button>
					</div>
				</div>
				<!-- end::사용자 이미지 영역 -->
				<div class="col-xl-6">
					<div class="form-group kt-margin-b-20">
						<c:choose>
							<c:when test="${requestScope.type == 'insert'}">
								<c:choose>
									<c:when test="${requestScope.loginType == 'usrId'}">
										<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>아이디</label>
										<div class="input-group">
											<input type="text" class="form-control" label="아이디" placeholder="아이디" autocomplete="off" id="usrId" name="usrId" minlength="5" maxlength="20" regexstr="^[a-z0-9_-]{5,20}$" regexalert="영문 소문자, 숫자, _-" required>
											<div class="input-group-append">
												<button class="btn btn-outline-brand" type="button" id="btn_idChk">중복확인</button>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<input type="hidden" name="usrId" id="usrId">
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<label><i class="fa fa-edit kt-margin-r-5"></i>아이디</label>
								<input type="text" class="form-control" label="아이디" placeholder="아이디" id="usrId" name="usrId" readonly="readonly" value="${param.paramUsrId}">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group kt-margin-b-15">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>이름</label>
						<input type="text" class="form-control" placeholder="이름" name="usrNm" id="usrNm" minlength="2" maxlength="100" regexstr="^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣_-]*$" regexalert="한글,영문,숫자,특수문자( _ -)만 입력가능" required>
					</div>
				</div>
			</div>
			<c:if test="${requestScope.ldapUse == 'N'}">
				<!-- ldap 미사용시에만 비밀번호 입력 -->
				<c:choose>
					<c:when test="${requestScope.type == 'insert'}">
						<div class="row">
							<div class="col-xl-6">
								<div class="form-group">
									<label class="required"><i class="fa fa-key kt-margin-r-5"></i>비밀번호</label>
									<input type="password" class="form-control" name="usrPw" id="usrPw" autocomplete="new-password" placeholder="비밀번호" minlength="5" maxlength="50" regexstr="^(?=.{5,})(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\/?@\#!$%&]).*$" regexalert="영문 ,숫자,특수문자(!@#$%&*?) 필수 포함" required>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="form-group">
									<label class="required"><i class="fa fa-key kt-margin-r-5"></i>비밀번호 확인</label>
									<input type="password" class="form-control" name="reUsrPw" id="reUsrPw" autocomplete="new-password" placeholder="비밀번호 확인" minlength="5" maxlength="50" regexstr="^(?=.{5,})(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\/?@\#!$%&]).*$" regexalert="영문 ,숫자,특수문자(!@#$%&*?) 필수 포함" equalTo="#usrPw" required>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col-xl-6">
								<div class="form-group">
									<label class="required"><i class="fa fa-key kt-margin-r-5"></i>비밀번호</label>
									<div class="input-group">
										<input type="password" class="form-control" label="비밀번호" id="usrPw" name="usrPw" placeholder="공백인 경우 기존 비밀번호가 사용됩니다." minlength="5" maxlength="50" regexstr="^(?=.{5,})(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\/?@\#!$%&]).*$" regexalert="영문 ,숫자,특수문자(!@#$%&*?) 필수 포함">
										<div class="input-group-append">
											<button class="btn btn-outline-brand" type="button" id="btn_initPw">초기화</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="form-group">
									<label><i class="fa fa-key kt-margin-r-5"></i>비밀번호 확인</label>
									<input type="password" class="form-control" name="reUsrPw" id="reUsrPw" placeholder="공백인 경우 기존 비밀번호가 사용됩니다." minlength="5" maxlength="50" regexstr="^(?=.{5,})(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\/?@\#!$%&]).*$" regexalert="영문 ,숫자,특수문자(!@#$%&*?) 필수 포함" equalTo="#usrPw">
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:if>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-phone-alt kt-margin-r-5"></i>연락처</label>
						<input type="text" class="form-control" placeholder="연락처" autocomplete="off" name="telno" id="telno" minlength="3" maxlength="16" regexstr="^[0-9]*$" regexalert="숫자만 입력가능" required>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-envelope kt-margin-r-5"></i>이메일</label>
						<div class="input-group">
							<input type="email" class="form-control" label="이메일" autocomplete="off" placeholder="이메일" id="email" name="email" maxlength="35" required>
							<div class="input-group-append">
								<button class="btn btn-outline-brand" type="button" id="btn_emailChk">중복확인</button>
							</div>
						</div>
					</div>	
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label for="exampleSelect1"><i class="fa fa-id-badge kt-margin-r-5"></i>직급</label>
						<select class="form-control kt-select2" id="usrPositionCd" name="usrPositionCd">
						</select>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label for="exampleSelect1"><i class="fa fa-id-badge kt-margin-r-5"></i>직책</label>
						<select class="form-control kt-select2" id="usrDutyCd" name="usrDutyCd">
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-id-card kt-margin-r-5"></i>부서</label>
				<div class="input-group">
					<input type="text" class="form-control" label="부서" placeholder="부서 검색 시 검색결과가 1건일 경우 자동세팅 됩니다." id="deptName" name="deptName" required>
					<div class="input-group-append">
						<button class="btn btn-outline-brand" type="button" id="btn_searchDept">부서검색</button>
					</div>
				</div>
			</div>
			<c:if test="${requestScope.type == 'update'}">
				<!-- 사용자 수정일 경우에만 사용유무, 차단유무 표시 -->
				<div class="row">
					<div class="col-xl-6">
						<div class="form-group">
							<label class="required" for="exampleSelect1"><i class="fa fa-portrait kt-margin-r-5"></i>사용유무</label>
							<select class="form-control kt-select2" data-osl-value="" id="useCd" name="useCd">
							</select>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="form-group">
							<label class="required" for="exampleSelect1"><i class="fa fa-lock kt-margin-r-5"></i>차단유무</label>
							<select class="form-control kt-select2" data-osl-value="" id="block" name="block">
							</select>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${requestScope.type == 'update'}">
				<div class="form-group d-none" id="bloclLogInfo">
					<label><i class="fa fa-pencil-alt kt-margin-r-5"></i>차단로그</label>
					<textarea class="form-control osl-min-h-px--130" name="blkLog" id="blkLog" maxlength="2000"></textarea>
				</div>
			</c:if>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i>비고</label>
				<textarea class="form-control osl-min-h-px--130" name="etc" id="etc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm3001SaveSubmit">완료</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>
<script>

/**
 * KTAvatar 사용
 *
 * 1. KTAvatar 태그 설명
 *    <div class="kt-avatar kt-avatar--circle" id="아이디 지정">
 *			<div class="kt-avatar__holder osl-avatar__holder-lg"></div>
 *			<label class="kt-avatar__upload" data-toggle="kt-tooltip" title="이미지 찾기">
 *				<i class="fa fa-pen"></i>
 *				<input type='file' name="name 지정"/> 
 *			</label>
 *			<span class="kt-avatar__cancel" data-toggle="kt-tooltip" title="이미지 삭제">
 *				<i class="fa fa-times"></i>
 *			</span>
 *		</div>
 *
 * KTAvatar 사용을 위한 태그는 위와 같이 사용한다.
 * KTAvatar 선언시 입력할 element Id값은 <div class="kt-avatar kt-avatar--circle" id="아이디 지정"> 태그에 아이디를 사용한다.
 *
 * 2. 선언
 *   new KTAvatar(element Id); - KTAvatar 대상 element ID를 문자열로 입력한다.
 *
 *
 * 3. 이미지 변경시 이미지 삭제 아이콘이 나타난다.
 *
 *    <span class="kt-avatar__cancel" data-toggle="kt-tooltip" title="이미지 삭제"> <!-- 이미지 삭제 버튼 -->
 *       <i class="fa fa-times"></i>
 *    </span>
 *
 *
 * 4. 이미지 삭제버튼 강제로 나타내게 할 경우
 *    <div class="kt-avatar kt-avatar--circle" id="아이디 지정"> 태그에 kt-avatar--changed 클래스를 추가한다.
 *
 * 5. 기본이미지 표시
 *   KTAvatar에서 이미지 표시는 <div class="kt-avatar__holder osl-avatar__holder-lg"></div> 태그에   CSS로 background-image를 지정한다.
 *   해당 태그에 $(클래스명 또는 아이디).css("background-image", "url("+$.osl.user.usrImgUrlVal(null)+")");	 로 기본 이미지를 추가한다.
 *
 *   이미지 삭제시 기본이미지를 보여주기 위해 위의  <div class="kt-avatar__holder osl-avatar__holder-lg"></div> 태그에 
 *   $(클래스명 또는 아이디).attr("data-default-img", $.osl.user.usrImgUrlVal(null)); 로  data 속성을 추가해준다.
 *
 */
"use strict";
var OSLStm3001Popup = function () {
	var formId = 'frStm3001';
	var type = $("#type").val();
	
	// 이미지 avate 생성
	new KTAvatar("usrImg_avatar");
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	var isIdChk = false; // 아이디 중복체크 여부
	var isEmailChk = false; // 이메일 중복체크 여부
	var beforeId; // 중복체크 당시 아이디 값
	var beforeEmail; // 중복체크 당시 이메일 값
	
	//type별 데이터
	var pageTypeData = {
			"insert":{
				"saveString": "신규 사용자를 등록하시겠습니까?",
				"saveBtnString": "작성 완료"
			},
			"update":{
				"saveString": "사용자 정보를 수정하시겠습니까?",
				"saveBtnString": "수정 완료"
			},
			// 공통 메시지 데이터
			"common":{
				"emptyIdString" : "아이디를 입력해주세요.",
				"emptyEmailString" : "이메일을 입력해주세요.",
				"currentEmailString" : "현재 사용자의 이메일입니다.",
				"initPwString":"비밀번호 초기화 진행 시 현재 입력중인 정보가 저장되지 않습니다. 계속 진행하시겠습니까?",
				"initAfterString": "초기화 후 비밀번호는 사용자 아이디이며, 로그인하여 비밀번호를 재설정해야 합니다.",
				"notLoginString": "님은 3개월 이상 미접속으로 차단되었습니다.",
				"blockChangeString" : "차단유무를 [정상]으로 변경시 로그인 할 수 있습니다.",
				"idDuplChkString" : "아이디 중복체크를 해주세요.",
				"newIdDuplChkString": "새로 입력한 아이디를 중복체크 해주세요.",
				"emailDuplChkString" : "이메일 중복체크를 해주세요.",
				"newEmailDuplChkString": "새로 입력한 이메일을 중복체크 해주세요.",
				"withinYearPwString": "1년이내 사용한 비밀번호는 사용할 수 없습니다.",
				"emptyDeptInfo" : "부서검색 버튼을 클릭하여 부서를 선택해주세요."
			}
	};
	
    // Private functions
    var documentSetting = function () {
    	
    	//문구 세팅
    	$("#stm3001SaveSubmit").text(pageTypeData[type]["saveBtnString"]);
    	
    	// stm3001 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "ADM00007", useYn: "Y",targetObj: "#usrPositionCd", comboType:"S"}, // 직급 공통코드
			{mstCd: "ADM00008", useYn: "Y",targetObj: "#usrDutyCd", comboType:"S"}, 	// 직책 공통코드
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"}, 	// 사용유무
			{mstCd: "ADM00005", useYn: "Y",targetObj: "#block", comboType:"OS"} 	// 차단유무
		];

  		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
  		
		// 사용자 등록&수정 팝업 오픈시 KTAvatar 대상 div의 기본 이미지를 data로 세팅한다.
		var defaultImg = $.osl.user.usrImgUrlVal(null);
		$("#usrImage").attr("data-default-img", defaultImg);
  		
		// textarea 자동 사이즈 조절 설정
    	autosize($("#etc"));
    	autosize($("#blkLog"));
    	
		//수정인경우
    	if(type == "update"){
    		// 사용자 정보 조회
    		selectUsrInfo();
    	// 등록일 경우
    	}else{
    		// 사용자 이미지를 기본이미지로 세팅, KTAvatar 사용시 img 대신 div에 css로 background-image를 사용한다.
    		$("#usrImage").css("background-image", "url("+defaultImg+")");	
    	}
    	
    	// 이미지 삭제 버튼 클릭
    	$(".kt-avatar .kt-avatar__cancel").click(function(){
    		if(type == "update"){
	    		// 기존 이미지 되돌리기 버튼 show
	    		$("#btn_imageReset").removeClass("d-none");
    		}
    	});
    	
    	// 사용자 이미지 변경시
		$('#usrImgFile').change(function() {
			
			var files = $("#usrImgFile")[0].files;
			if(type == "update" && !$.osl.isNull(files)){
				// 기존 이미지 되돌리기 버튼 show
	    		$("#btn_imageReset").removeClass("d-none");
			}		
		});
    	
    	// 이미지 되돌리기 버튼 클릭
    	$("#btn_imageReset").click(function(){
    		
    		var beforeImg = $("#usrImage").data("before-image");
    		
    		// 기존 이미지 URL이 있을경우
    		if(!$.osl.isNull(beforeImg)){
	    		$("#usrImage").css("background-image", "url("+beforeImg+")"); // 기존 이미지로 변경
	    		$("#usrImage").attr("data-img-delete-yn", "N"); // 이미지 삭제여부 값 N으로 변경
	    		$("#btn_imageReset").addClass("d-none"); // 되돌리기 버튼 hide
	    		$("#usrImg_avatar").addClass("kt-avatar--changed"); // 이미지 삭제버튼 show
	    		
	    		// 파일 초기화
				var agent = navigator.userAgent.toLowerCase();
				if (agent.indexOf("chrome") != -1 || agent.indexOf("safari") != -1 || agent.indexOf("firefox") != -1) {
					$("#usrImgFile").val("");
				}else{
					$("#usrImgFile").replaceWith($("#excelFile").clone(true));
				} 
    		}
    	});
    	
    	// 아이디 중복체크 클릭
    	$("#btn_idChk").click(function(){
    		
    		// 유효성 걸렸을경우 중복체크 하지 않음
    		if($("#usrId").hasClass("is-invalid")){
    			return;
    		}
    		
    		var inUsrId = $("#usrId").val();
    		if($.osl.isNull(inUsrId)){
    			$.osl.alert(pageTypeData["common"]["emptyIdString"]);
    			return;
    		}
    		
    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm3000/stm3000/selectCmm2000IdCheck.do'/>", 
    			"loadingShow": false}, {"usrId":inUsrId});
    		//AJAX 전송 성공 함수
    		ajaxObj.setFnSuccess(function(data){
    			
    			// 데이터 조회 에러
    			if(data.errorYn == "Y"){
    				$.osl.alert(data.message,{type: 'error'});
    				//모달 창 닫기
					$.osl.layerPopupClose();
    			// 중복된 아이디 있을 경우
    			}else if(data.idChkYn == "Y"){
    				$.osl.alert(data.message,{type: 'warning'});
    				isIdChk = false;
    			// 중복된 아이디 없을 경우
    			}else{
    				$.osl.alert(data.message);
    				beforeId = inUsrId;  // 중복체크 이후 아이디 변경되었는지 체크하기 위한 값
    				isIdChk = true;
    			}
    		});
    		
    		//AJAX 전송
    		ajaxObj.send();
    	});
    		
    	// 이메일 중복체크 클릭
    	$("#btn_emailChk").click(function(){
    		
    		var inEmail = $("#email").val();
    		var orgEmail = $("#orgEmail").val(); // 사용자 수정 팝업에서 수정 전 이메일
    		
    		// 유효성 걸렸을경우 중복체크 하지 않음
    		if($("#email").hasClass("is-invalid")){
    			return;
    		}
    		
    		if($.osl.isNull(inEmail)){
    			$.osl.alert(pageTypeData["common"]["emptyEmailString"]);
    			return;
    		}
    		
    		// 사용자 수정이고, 기존 이메일을 그대로 사용할 경우
    		if(type == "update" && orgEmail == inEmail){
    			$.osl.alert(pageTypeData["common"]["currentEmailString"]);
    			return;
    		}
    		
    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm3000/stm3000/selectStm3000EmailCheck.do'/>", 
    			"loadingShow": false}, {"email":inEmail});
    		//AJAX 전송 성공 함수
    		ajaxObj.setFnSuccess(function(data){
    			
    			// 데이터 조회 에러
    			if(data.errorYn == "Y"){
    				$.osl.alert(data.message,{type: 'error'});
    				//모달 창 닫기
					$.osl.layerPopupClose();
    			// 중복된 이메일 있을 경우
    			}else if(data.emailChkYn == "Y"){
    				$.osl.alert(data.message,{type: 'warning'});
    				isEmailChk = false;
    			// 중복된 이메일 없을 경우
    			}else{
    				$.osl.alert(data.message);
    				beforeEmail = inEmail;  // 중복체크 이후 이메일이 변경 되었는지 체크하기 위한 값
    				isEmailChk = true;
    			}
    		});
    		
    		//AJAX 전송
    		ajaxObj.send();
    	});
    	
    	
    	// 비밀번호 초기화 버튼 클릭
    	$("#btn_initPw").click(function(){
    		$.osl.confirm(pageTypeData["common"]["initPwString"], null, function(result) {
    			if (result.value) {
    				
    				var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm3000/stm3000/updateStm3000AccountInit.do'/>", "loadingShow": false}
    						,{"usrId":$("#usrId").val()});
    				//AJAX 전송 성공 함수
    				ajaxObj.setFnSuccess(function(data){
    					
    					if(data.errorYn == "Y"){
    						$.osl.alert(data.message,{type: 'error'});
    						$.osl.layerPopupClose();
    					}else{
    						// 비밀번호 초기화 후 메시지
    						$.osl.alert(data.message, {text:pageTypeData["common"]["initAfterString"]}, function(result){
    							$.osl.layerPopupClose();
					       	});
    					}
    				});
					
    				//AJAX 전송
    				ajaxObj.send();
    	        }
    		});
    	});
    	
    	
    	// 조직명 input 엔터키 이벤트
    	$("#deptName").keypress(function(e){
    		if (e.which === 13){
    			$("#btn_searchDept").click();
			}
    	});
    	
    	// 부서검색 버튼 클릭
    	$("#btn_searchDept").click(function(){
    		
    		var searchDeptNm = $.trim($("#deptName").val());
    		if($.osl.isNull(searchDeptNm)){
    			// 조직선택 팝업 오픈
    			callCommonDeptPopup();  			
    		}else{
    			if(searchDeptNm.lastIndexOf(">") > 0){
    				// 상위조직 명을 제외한 조직명을 검색어로 넘긴다.
    				searchDeptNm = searchDeptNm.substring(searchDeptNm.lastIndexOf(">")+1);
    			}
	    		// 조직검색
	    		selectDeptInfo(searchDeptNm);
    		}
    	});
    	
    	// 차단유무 변경
    	$("#block").change(function(){ 
    		var blockCd = $(this).val();
			// 차단으로 변경했을 경우 차단로그 입력영역 show
			if(blockCd == "02"){
				$("#bloclLogInfo").removeClass("d-none");
			}else{
				$("#blkLog").val(""); // 차단로그 초기화
				$("#bloclLogInfo").addClass("d-none");
			}
		});
    	
    	// 등록버튼 클릭
    	$("#stm3001SaveSubmit").click(function(){
			
    		var form = $('#'+formId);
			var ldapUse = $("#ldapUse").val(); 			// ldap 사용유무
			var inUsrId = $("#usrId").val(); 			// 입력한 사용자 아이디
			var inUsrPw = $("#usrPw").val(); 			// 입력한 비밀번호
			var inEmail = $("#email").val(); 			// 입력한 이메일
			var selBlock = $("#block").val(); 			// 선택한 차단유무값
			var orgBlock = $("#orgBlock").val(); 		// 수정 전 DB에 있는 차단유무값
			var pwFailCnt = $("#pwFailCnt").val(); 		// 비밀번호 실패횟수
			var loginExprYn = $("#loginExprYn").val(); 	// 3개월 미접속 유무
			var deptId = $("#deptId").val(); 			// 조직 ID
			var deptNm = $("#deptName").val(); 			// 조직명
			var orgDeptNm = $("#orgDeptNm").val(); 		// 조직선택 팝업에서 선택된 조직명, 조직명 변경유무 체크에 사용
			var loginType = $("#loginType").val(); 		// 로그인 Id 대상
			
			//로그인 Id 대상이 email인경우 아이디 새로 발급
			if(loginType == "email"){
				//로그인 타입 확인
    			var loginType = $("#loginType").val();
    			
    			var idHeader = new Date().format("yyyyMMddHHmmms");
    			var idBody = "";
    			for(var i=0;i<5;i++){
    				idBody += parseInt(Math.random()*10).toString();
    			}
    			var newId = idHeader+idBody;
    			$("#usrId").val(newId);
			}
			
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		
    		// 등록일 경우 유효성 체크
    		if(type == "insert"){
    			if(loginType != "email"){
		    		// 아이디 중복체크 
		        	if(!isIdChk){
		        		$.osl.alert(pageTypeData["common"]["idDuplChkString"], {type:"warning"});
		        		return;
		        	//현재 아이디와 중복체크 당시 아이디 체크
		        	}else if(beforeId != inUsrId){
		        		$.osl.alert(pageTypeData["common"]["newIdDuplChkString"], {type:"warning"});
		        		return;
		        	}
    			}
	    		
	    		// 이메일 중복체크
	        	if(!isEmailChk){
	        		$.osl.alert(pageTypeData["common"]["emailDuplChkString"], {type:"warning"});
	        		return;
	        	//현재 이메일과 중복체크 당시 이메일 체크
	        	}else if(beforeEmail != inEmail){
	        		$.osl.alert(pageTypeData["common"]["newEmailDuplChkString"], {type:"warning"});
	        		return;
	        	}
	    		
	    		// ldap 미사용일경우 비밀번호 유효성 체크
	    		if(ldapUse == "N"){
	    			// 비밀번호 유효성 체크
	            	if($.osl.user.passwordValidate(inUsrId, inUsrPw)){
	            		return;
	            	}
	    		}
	    		
	    		// 조직아이디가 없을경우
	    		if($.osl.isNull(deptId)){
	    			$.osl.alert(pageTypeData["common"]["emptyDeptInfo"], {type:"warning"});
	    			return;
	    		}
	    		
	    		// 조직 유효성 체크, 조직검색 후 조직명이 변경되었을 경우체크
	    		if(validatCheckDeptNm(orgDeptNm, deptNm)){
	    			return;
	    		}
	    		
	    		//atchFileId 생성
				$.osl.file.makeAtchfileId(function(data){
					if(data.errorYn == "Y"){
   						$.osl.toastr(data.message);
   					}else{
   						$("#usrImgId").val(data.atchFileIdString);
   						// atchFileId 정상 생성 후 사용자 등록
   						submitInsertAction();
   					}
				});
	    		
	    	// 사용자 정보 수정일 경우	
    		}else if(type == "update"){
    			
    			var orgEmail = $("#orgEmail").val(); // 수정 전 이메일
   				// 수정전 이메일과 현재 입력이메일이 다를경우 이메일 중복체크 확인
   				if(orgEmail != inEmail){
   					if(!isEmailChk){
    					$.osl.alert(pageTypeData["common"]["emailDuplChkString"], {type:"warning"});
    	        		return;
   	    			}
   				}
    			
    			// ldap 미사용일 경우
    			if(ldapUse == "N"){
    				if(!$.osl.isNull(inUsrPw)){
    					// 비밀번호가 공백이 아닐경우 비밀번호 유효성 체크
    	            	if($.osl.user.passwordValidate(inUsrId, inUsrPw)){
    	            		return;
    	            	}
    					
    					// 사용자가 1년이내 사용한 비밀번호 체크
    					if(beforePasswordCheck(inUsrId, inUsrPw) == "Y"){
    						$("#usrPw").focus();
    						$.osl.alert(pageTypeData["common"]["withinYearPwString"],{type:"warning"});
    						return;
    					}
    				}
				}
    			
    			// 조직 유효성 체크, 조직검색 후 조직명이 변경되었을 경우체크
	    		if(validatCheckDeptNm(orgDeptNm, deptNm)){
	    			return;
	    		}
    			
    			// 수정 전 차단유무값 차단에서 현재 정상으로 변경시 비밀번호 실패횟수 초기화
    			if(orgBlock == "02" && selBlock == "01"){
    				$("#pwFailCnt").val(0);
    			}
				
    			// 3개월 미접속 사용자의 차단여부를 정상으로 변경시 비밀번호 만료여부 N으로 변경
    			if(loginExprYn == "Y" && selBlock == "01"){
    				$("#loginExprYn").val("N");
    			}
    			
    			// 차단유무 차단일 경우 차단로그 공백체크
    			var blkLog = $("#blkLog").val();
    			if(selBlock == "02" && !$.osl.isNull(blkLog)){
    				blkLog = blkLog.trim();
    				// 차단로그가 공백이면
    				if($.osl.isNull(blkLog)){
    					$("#blkLog").val("");
    				}
    			}
    			
    			// 사용자 수정
            	submitUpdateAction();
    		}
    	});
    };
    
   /**
    * function 명 	: selectDeptInfo
    * function 설명	: 조직명을 검색하여 조직을 찾는다. 
    * 				    검색된 조직이 1개일 경우 조직 정보를 화면에 세팅하고, 2개 이상일경우 조직선택 팝업을 오픈한다.
    * @param searchDeptNm : 검색할 조직명
    */
   var selectDeptInfo = function(searchDeptNm){
    	
	   var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm6000/stm6000/selectStm6000BeforeCmmDeptList.do'/>", 
			"loadingShow": false}, {"searchDeptNm":$.trim(searchDeptNm)});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				var deptList = data.deptList;
				if(deptList.length == 1){
					// 검색된 조직이 1건일 경우 세팅
					setDeptInfo(deptList[0].deptId, deptList[0].deptName);
				}else{
					// 팝업호출
					callCommonDeptPopup(searchDeptNm);
				}
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
    	
   };
    
   /**
 	* function 명 	: callCommonDeptPopup
	* function 설명	: 조직선택 공통 팝업을 호촐한다.
	* @param searchDeptNm : 팝업에서 검색할 조직명
	*/
	var callCommonDeptPopup = function(searchDeptNm){
		
		var data = {deptName:searchDeptNm};
		var options = {
				idKey: "cmm1200",
				modalSize: 'xl',
				modalTitle: "조직 검색",
				closeConfirm: false,
				callback:[{
                    targetId: "cmm1200SelDept",
                    actionFn: function(thisObj){
                    	OSLStm3001Popup.setDept(thisObj);
                    }
                 }]
			};
		
		$.osl.layerPopupOpen('/cmm/cmm1000/cmm1200/selectCmm1200View.do',data,options);
	};
    
   /**
 	* function 명 	: setDeptInfo
	* function 설명	: 조직선택 팝업에서 선택한 조직정보를 사용자 등록&수정 화면에 세팅한다.
	* @param deptId : 선택한 조직 ID
	* @param deptNm : 선택한 조직 명 ID
	*/
    var setDeptInfo = function(deptId, deptNm){
    	
    	// 선택한 조직 정보값이 있을 경우에만 세팅
    	if(!$.osl.isNull(deptId) && !$.osl.isNull(deptNm)){
    		$("#frStm3001 #deptId").val(deptId);
    		$("#frStm3001 #deptName").val(deptNm);
    		$("#frStm3001 #orgDeptNm").val(deptNm); // 등록&수정 시 조직명이 변경되었는지 체크하기 위한 값
    	}
    };
    
    
   /**
 	* function 명 	: validatCheckDeptNm
	* function 설명	: 사용자 등록&수정 전 조직명의 유효성을 체크한다. 
	*				   사용자가 조직 선택 팝업에서 선택한 조직명을 임의로 수정했을 경우 경고문구를 표시한다.
	*
	* @param orgDeptNm : 조직선택 팝업에서 선택한 조직명, 해당 조직명은 상위조직을 포함한다. (ex, 전체 > 오픈소프트랩 > 부설연구소)
	* @param deptNm : 현재 사용자 등록&수정 팝업에 입력된 조직명
	*/
    var validatCheckDeptNm = function(orgDeptNm, deptNm){
    	
    	// 조직 유효성 체크, 조직검색 후 조직명이 변경되었을 경우체크
		if($.trim(orgDeptNm) != $.trim(deptNm)){
			// 경고 문구 출력, 경고문구에 원본 조직명을 표시해준다.
			$("#deptName").next("div.input-group-append").after(
					'<div class="invalid-feedback invalid-dept" style="display:block">정확한 부서명을 입력하거나, 부서검색을 하여 다시 부서를 선택해주세요.</div>'
					+ '<div class="invalid-feedback invalid-dept" style="display:block">(원본 : '+$.osl.escapeHtml(orgDeptNm)+')</div>'
			);
			
			$("#deptName").addClass("is-invalid");
			return true;
		}
    	
    	return false;
    };
    
	
   /**
 	* function 명 	: beforePasswordCheck
	* function 설명	: 사용자 비밀번호 수정 시 1년이내 사용한 비밀번호인지 체크한다.
	* @param usrId : 사용자 아이디
	* @param usrPw : 사용자가 입력한 비밀번호
	*/
    var beforePasswordCheck = function(usrId, usrPw){
    	
    	var chkResult = "N";
    	
    	//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm3000/stm3000/selectStm3000BeforeUsedPwChkAjax.do'/>", "async": false}
				,{"usrId": usrId, "usrPw":usrPw});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				chkResult = data.isUsedPw;
			}
		});
		
		//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err){
			$.osl.alert(data.message, {type: 'error'});
		});
		
		//AJAX 전송
		ajaxObj.send();
    	
		return chkResult;
    };
    
	
   /**
 	* function 명 	: selectUsrInfo
	* function 설명	: 사용자 정보를 조회하여 팝업에 세팅한다.
	*/
	var selectUsrInfo = function() {
    	var paramUsrId = $("#usrId").val();
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm3000/stm3000/selectStm3000UsrInfoAjax.do'/>", "async": false}
				,{"usrId": paramUsrId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				// 사용자 정보 세팅
		    	$.osl.setDataFormElem(data.usrInfoMap,"frStm3001", ["usrId", "usrNm", "email", "telno", "deptId", "deptName", "etc", "loginExprYn", "pwFailCnt", "usrImgId", "blkLog"]);
				
				var block = data.usrInfoMap.block;
				var usrImgId = data.usrInfoMap.usrImgId;
				// 3개월 이상 미접속 여부 - Y : 3개월 이상 미접속, N : 3개월 이내 접속
				var loginExprYn = data.usrInfoMap.loginExprYn;
				
				// 이전 이메일 정보 세팅, 사용자 수정 시 이메일 중복체크를 판단하기 위해 사용
		    	$("#orgEmail").val(data.usrInfoMap.email);
				// 이전 차단유무값, 사용자 차단유무 수정시 비밀번호 실패횟수 초기화 위해 사용
				$("#orgBlock").val(block);
				// 사용자 수정 시 조직명이 변경되었는지 체크하기 위한 값 세팅
				$("#orgDeptNm").val(data.usrInfoMap.deptName);
				
				// 사용자 이미지 세팅
				var usrImgUrl = $.osl.user.usrImgUrlVal(usrImgId);
				$("#usrImage").attr("data-before-image", usrImgUrl); // 되돌리기 버튼 클릭 시 이전이미지로 되돌아가기 위한 url 세팅
				$("#usrImage").css("background-image", "url("+usrImgUrl+")");
						
				// 사용자 이미지 파일 ID 및 이미지 파일정보가 DB에 존재할 경우
				if(!$.osl.isNull(usrImgId) && data.usrImgFileExist == "Y"){
					// 이미지 삭제할 수 있도록 삭제버튼 나타내기
					$("#usrImg_avatar").addClass("kt-avatar--changed");
				}
				
				// 3개월 미접속일 경우
				if(loginExprYn == "Y"){
					// 차단유무 정상으로 수정해야 한다는 안내 메시지 show
					$("#blockGuideMsg").removeClass("d-none");
					block = "02";
				}
				
				// combobox selected setting
		    	$("#useCd").attr("data-osl-value", data.usrInfoMap.useCd);
				$("#block").attr("data-osl-value", block);
				$("#usrDutyCd").attr("data-osl-value", data.usrInfoMap.usrDutyCd);
				$("#usrPositionCd").attr("data-osl-value", data.usrInfoMap.usrPositionCd);
				
				// 사용자의 차단유무가 차단일 경우 차단로그 입력영역 show
				if(block == "02"){
					$("#bloclLogInfo").removeClass("d-none");
				}
				
				// textarea 입력된 내용에 따라 size 조정
				autosize.update($("#etc"));
				autosize.update($("#blkLog"));
				
				// 최초라이선스 등록자 체크 - 최초 라이선스 등록자는 사용유무 변경 불가 
				if(data.usrInfoMap.usrId+"_GRP" == data.usrInfoMap.licGrpId){
					$("#useCd").attr("disabled","disabled");
					$("#useCd").after('<div class="invalid-feedback" style="display:block">최초 라이선스 등록자는 사용 유무를 변경할 수 없습니다.</div>');
				}
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
    
   /**
 	* function 명 	: submitInsertAction
	* function 설명	: 입력한 사용자 정보로 사용자를 등록한다.
	*/
    var submitInsertAction = function(){
    	
    	var form = $('#'+formId);
  		
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData[type]["saveString"],null,function(result) {
	        if (result.value) {
	        	
				var formArray = form.serializeArray();
	        	var fd = new FormData();
	        	
	        	$.each(formArray, function(idx, map){
	        		// formData에 추가
	        		fd.append(map.name, map.value);
	        	});
	        	
	        	// 이미지 파일 추가
	        	fd.append('file', $("#usrImgFile")[0].files[0]);
				
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm3000/stm3000/insertStm3000UsrInfoAjax.do'/>", 
	    			"loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				//모달 창 닫기
						$.osl.layerPopupClose();
	    			}else{
	    				// 등록 성공
	    				$.osl.toastr(data.message);

	    				//모달 창 닫기
	    				$.osl.layerPopupClose();
	    				
	    				//datatable 조회 - 등록일 경우
	    				$("button[data-datatable-id=stm3000UsrTable][data-datatable-action=select]").click();
	    			}
	    		});
	    		
	    		//AJAX 전송
	    		ajaxObj.send();
	        }
	    });
		
    };
    
    
   /**
 	* function 명 	: submitUpdateAction
	* function 설명	: 사용자 정보를 수정한다.
	*/
    var submitUpdateAction = function(){
    	
    	var form = $('#'+formId);
  		
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData[type]["saveString"],null,function(result) {
	        if (result.value) {
	        	
	        	var formArray = form.serializeArray();
	        	var fd = new FormData();
	        	
	        	$.each(formArray, function(idx, map){
	        		// formData에 추가
	        		fd.append(map.name, map.value);
	        	});
	        	
	        	var imgFile = $("#usrImgFile")[0].files;
	        	// 파일을 추가했을 경우
	        	if(!$.osl.isNull(imgFile)){
		        	fd.append('file', imgFile[0]);
	        	}
	        	
	        	// 이미지 삭제여부 값
	        	// 이미지를 삭제하고 default image로 변경하여 저장시 DB의 기존 파일정보를 삭제한다.
	        	var imgDelYn = $("#usrImage").data("img-delete-yn");
	        	if($.osl.isNull(imgDelYn)){
	        		imgDelYn = "N";
	        	}
	        	
	        	fd.append('defaultImgYn', imgDelYn);
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm3000/stm3000/updateStm3000UsrInfoAjax.do'/>", 
	    			"loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				//모달 창 닫기
						$.osl.layerPopupClose();
	    			}else{
	    				//수정 성공
	    				$.osl.toastr(data.message);

	    				//모달 창 닫기
	    				$.osl.layerPopupClose();

    					// 수정시 현재페이지 유지한채로 재조회
    					$.osl.datatable.list["stm3000UsrTable"].targetDt.reload();	
	    			}
	    		});
	    		
	    		//AJAX 전송
	    		ajaxObj.send();
	        }
	    });
		
    };
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        },
        // 조직선택 팝업의 callback 함수
    	setDept:function(thisObj){
    		// thisObj에서 조직명과 조직아이디를 가져와서 세팅한다.
    		var deptId = $(thisObj).data("dept-id");
    		var deptNm = $(thisObj).data("dept-nm");
    		
    		setDeptInfo(deptId, deptNm);
    	}
        
    };
}();

//Initialization
$.osl.ready(function(){
	OSLStm3001Popup.init();
});

	
</script>