<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/lunaops/top/header.jsp" %>

<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<link rel='stylesheet' href='<c:url value='/css/common/fileUpload.css'/>' type='text/css'>
<link rel='stylesheet' href='<c:url value='/css/oslops/prs.css'/>' type='text/css'>
<script src="<c:url value='/js/common/oslFile.js'/>"></script>
<script src="<c:url value='/js/common/EgovMultiFile.js'/>"></script>
<script src="<c:url value='/js/common/spectrum.js'/>" ></script>
<link rel='stylesheet' href='<c:url value='/css/common/spectrum.css'/>' type='text/css'>
<style>
.info_table {width:1500px;height:auto; max-width:1500px;font-size: 0.75em; padding:20px;background:#fff;overflow:hidden;border:1px solid #ccc;}
.innerBody {padding:20px 20px 13px 20px;display: inline-block;width: 100%;}
.uploadOverFlow {min-height: 10px;padding:4px 0px 2px 15px;}

.prs_usrImgDiv {padding-left: 0px;cursor:pointer; text-align: center;}

.input_box_1 {padding: 15px 20px 15px 10px;}
.input_box_1 input[type=text]{ height: 100%; padding-left: 7px; font-size:14px; max-width:381px;}

/* 필수값 표시 */
.required_info_prs3000{color: red;font-weight: bold;display:none;}

.info_div { border: 1px solid #ccc; width:100%; heigth:400px;}
.content_top_left {width:858px; float:left; border-radius: 3px; border: 1px solid #ccc; border-radius: 3px;display:inline-block;}
.content_top_right{width:580px;border-radius: 3px; border: 1px solid #ccc;border-radius:3px;display:inline-block;margin-left:20px;}
.content_bottom_left {width:49%; float:left; border-radius: 3px;}
.content_bottom_right{width:580px; border-radius: 3px;border:1px solid #ccc;border-radius:3px;display:inline-block;margin:20px 0px 0px 20px;}

/* input */
.box_line { background: none; border-top: none; border-right: none; font-weight: bold; float: left; clear: both; padding-left: 25px; width: 34%; border-width: 0 1px 1px 0; font-size: 13px; }
.input_box_1{ float: left; padding: 5px; width: 77.5%; margin-left: 0px;border-top:none;}
.input_nm{}
.content_title {font-size:23px; font-weight: bold;padding:18px 18px 0px 37px;;display:block;}
/* 이메일 중복확인 버튼*/
.check_btn{  position: none; top: none; right: none; float: right; background: #fff; font-size: 0.9em; height: 34px; line-height: 33px; } 
/* 검색버튼 */    
.search_btn{margin-left:21px; position: none; top: none; right: none;  float: right; background: #fff; font-size: 0.9em; height: 34px; line-height: 33px; }      
/* 사용자 프로필 */
.profile_div{ width:136px; padding: 19px 15px 15px 37px;}
/* 사용자 프로필 input box*/
.profile_input_div{padding: 8px 28px 6px 16px; width:424px;}
/* 사용자 이미지 */
.user_img { float: none; width: 160px; height: 180px; max-width: 180px !important; max-height: 180px !important;border:1px solid rgb(204, 204, 204) !important}
/* 연락처 */
.address_div{ padding: 19px 10px 15px 15px;}
/* 연락처 input box */
.address_input_div{padding: 8px 0px 6px 6px;display: flex;}
/* 비밀번호 */
.password_div{width: 128px;font-size: 13px;font-weight: bold;display: inline-block;}
.password_body{padding:89px 0px 40px 101px;}
input[type="text"] {font-size: 14px !important;color:#000000;}
/* 비밀번호 input box */
.password_input_div{display: inline-block;}
/* 기타정보 */
.ect_info_div{ padding: 18px 0px 17px 36px; width:19%;}
/* 기타정보 input_box */
.ect_info_input_div{padding: 8px 0px 6px 6px;display:flex;}
/* 비고 */
.etc_div { height: auto; padding: 10px 0px 0px 5px;}
/* 수정버튼 */
.button_complete { background: #fff !important; color: #000 !important; border: 1px solid #ccc !important; font-weight: bold;font-size:1.2em;}
/* 직급,직책 선택 */
.select_cd {height:100%; width:100%;padding-left: 7px;}

.pw_txt_message{color:#f47e7e;}
.dashboard_div {width:55%;padding:116px 1px 6px 55px;}
.dashboard_input_div {margin-top:97px;width:37%;padding:15px;}

/* 사용자 프로필 입력 row */
.profile_left {width:71%;float:left;margin-bottom:12px;display: inline-flex;}
.profile_row {width:95%;float:left;margin-bottom:12px;display: inline;}
.profile_row_last {margin-bottom: 0px;}
.select_noshow {border:#fff;color:black;-webkit-appearance:none;}
.input_noshow {border:#fff !important;background-color:#fff !important;}

/* 버튼 숨김 */
.btn_nouse {display:none !important;} 
/* IE 셀렉트박스 css 숨김 */
.select_noshow::-ms-expand{ display:none;}
select[disabled]::-ms-value {color: #000;}
.profile_row input{max-width:520px!important;}

/* 값이 null */
.noValue {padding-left: 27px;}
/* 오른쪽 버튼 */
.right_btn {padding-top: 43px;}
/* 이미지 */
.img {float:right;padding:10px 67px 0px 0px;display:block;}
/* 버튼  */
.btn_ok_div {display:flex;}

/* 소속 검색, 중복화인 버튼*/
.btn_search {margin-left: 13px;}
.choose_file{padding:5px 52px 5px 53px;display:inline;}
/* 기타정보 */
.etc_body {padding: 108px 0px 0px 106px;}
.etc_row {height:45px;display:block;font-size:13px;font-weight: bold;}
.etc_div {font-size:13px;font-weight:bold;}
.etc_row_left {width:139px;}
.etc_row_right {width:241px;}
.etc_row div{height:45px;display:inline-block;font-size:13px;font-weight:bold;}
.etc_row input{font-size:14px;}
.etc_row select{font-size:14px;}

/* 이미지 파일 이름  */
#egovFileStatus {display:block;width:132px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;float:left;height:17px;}
/* display : none*/
.dis_none {display :none;}

</style>
<script>

	//이메일 중복확인 체크
	var emailCheckFlag  = false;
	// 개인정보 수정 전 사용자 이메일
	var beforeEmail = "";
	//input file의 id값 (필수)
	var obj = $("#dragandrophandler");
	// 사용자 ID
	var usrId = "<c:out value='${sessionScope.loginVO.usrId}'/>";
	
	
	var fd = new FormData();

	//유효성 체크
	var arrChkObj = {
		"usrNm":{"type":"length","msg":"이름은 200byte까지 입력이 가능합니다.", "max":200}
		,"email":{"type":"length","msg":"이메일은 50byte까지 입력이 가능합니다.", "max":50}
		,"telno":{"type":"number"}
		,"deptName":{"type":"length","msg":"조직명은 300byte까지 입력가능합니다.", "max":300}
		,"etc":{"type":"length","msg":"비고는 2000byte까지 입력가능합니다.", "max":2000}
	};

	// 연락처 유효성
	var saveObjectValid = {
				"telno":{"type":"regExp","pattern":/^([0-9]{3,13}).*$/ ,"msg":"연락처 형식이 아닙니다. (3~13자리) (예) 01012341234", "required":true}
				,"usrNm":{"type":"regExp","pattern":/^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣_-]{1,200}$/ ,"msg":"이름은 한글, 영문, 숫자, 특수문자( _ -) 만 입력가능합니다.", "required":true}
	}
	
	// 사용자 프로필 수정상태(수정진행중 :true, 수정완료:false) 
	var updateOngoingChk = false;
	
	$(document).ready(function() {
		
		//가이드 상자 호출
		gfnGuideStack("add",fnPrs3000GuideShow);
		// 수정 버튼권한
		var btnAuthUpdateYn = '${sessionScope.selBtnAuthUpdateYn}';
		// 수정권한이 없을경우 프로필 이미지 클릭 이벤트 제거
		if(btnAuthUpdateYn == "N"){
			$(".prs_usrImgDiv").attr('onclick', '').unbind('click');
			// 화면 높이 조정
			$('.info_table').css("height", "815px");
		}

		
		/* 	
		*	공통코드 가져올때 한번 트랜잭션으로 여러 코드 가져와서 셀렉트박스에 세팅하는 함수(사용 권장)
		* 	1. 공통 대분류 코드를 순서대로 배열 담기(문자열)
		*	2. 사용구분 저장(Y: 사용중인 코드만, N: 비사용중인 코드만, 그 외: 전체)
		*	3. 공통코드 적용할 select 객체 직접 배열로 저장
		* 	4. 공통코드 가져와 적용할 콤보타입 객체 배열 ( S:선택, A:전체(코드값 A 세팅한 조회조건용), N:전체, E:공백추가, 그 외:없음 )
		*	5. 동기 비동기모드 선택 (true:비동기 통신, false:동기 통신)
		*	마스터 코드 = REQ00001:요구사항 타입, REQ00002:중요도 , CMM00001:
		*/
		var mstCdStrArr = "ADM00007|ADM00008";
		var strUseYn = 'Y';
		var arrObj = [ $("#usrPositionCd"),$("#usrDutyCd")];
		var arrComboType = ["S","S",""];
		gfnGetMultiCommonCodeDataForm(mstCdStrArr, strUseYn, arrObj, arrComboType , false);
		
		// 사용자 개인정보 상세조회
		fnSelectPrs3000Info();
		
		// 사용자 프로필 css 숨기기
		fnHideProfileCss();
		
		// 페이지 이동 할 때 미저장시, 알림띄우기
	    $(window).bind("beforeunload", function(){
	        if(updateOngoingChk) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
	    });

		/***** 유효성 체크 시작 *****/ 	
		
		//유효성 체크
		gfnInputValChk(arrChkObj);
		
		/* 이메일 중복확인 버튼 클릭 */
		$('#btn_search_checkRepetition').click(function() {
			
			// 이메일 중복체크 flag 
			emailCheckFlag = true;
			// 이메일 유효성 검사
			if(fnCheckEmail()) {
				// 이메일 중복 체크
				fnCheckRepetition();
			}
			
		});
		
		// 이메일 값 변경 체크
		fnEmailFlagChk();
		
		/* 조직 검색창 엔터키 이벤트 */
		$('#deptName').keyup(function(e) {
			
			// inputError가 있으면 제거
			if($(this).hasClass("inputError")){
	    		$(this).removeClass("inputError");
	    	}
			if(e.keyCode == '13' ){
				$('#btn_search_dept').click();
			}
		});
		
		
		
		/* 조직검색 버튼 클릭*/
		$('#btn_search_dept').click(function() {

			var inputDeptName = $("#deptName").val();
			
			// 상위조직을 포함한 조직명이 있을 경우
			if(inputDeptName.lastIndexOf(">") > 0){
				// 상위조직 명을 제외한 조직명을 검색어로 넘긴다.
				inputDeptName = inputDeptName.substring(inputDeptName.lastIndexOf(">")+1);
			}
			
			gfnCommonDeptPopup(inputDeptName, function(deptId,deptNm){

				$("input[name=deptName]").val(deptNm);
				$('input[name=deptId]').attr('value',deptId);
			});
		});
		
		
		/* 이메일 엔터키 이벤트 */
		$('#email').keyup(function(e) {
			if(e.keyCode == '13' ){
				$('#btn_search_checkRepetition').click();
			}
		});
		
		// 수정 버튼 클릭 시
		$("#btn_update").click(function() {
			
			// 사용자프로필  css 보이기
			fnShowProfCss();
			
			// 개인정보 재조회
			fnSelectPrs3000Info();
		})
		
		// 확인 버튼 클릭시
		$('#btn_update_complete').click(function() {
			
			// formData 초기화
			fd = new FormData();
			
			/* 필수입력값 체크 공통 호출 */
			var strFormId 		= "prs3000Form";
			var strCheckObjArr  = ["usrId", "usrNm", "telno", "email", "deptName"];
			var sCheckObjNmArr  = ["아이디", "성명", "연락처", "이메일", "소속"];
			
			/* 입력값 */
			var newMail	   		= $("#email").val();
			var currentDeptId	= $("#deptId").val();
			var deptNm			= $("#deptName").val();
			
			/*
			 *	개인정보 수정 전 정보들
			 *	현재 입력된 값과 DB상의 사용자 정보의 비교에 사용
			 */
			var beforeDeptId 	= $("#beforeDeptId").val();
			var beforeDeptNm 	= $("#beforeDeptNm").val();
			
			// 이메일 공백제거
			$("#email").val(newMail.trim());
			
			// 필수값 여부 체크
			if(gfnRequireCheck(strFormId, strCheckObjArr, sCheckObjNmArr)){
				return false;	
			}

			// 연락처 유효성 검사
			if(!gfnInputValChk(saveObjectValid)){
				return false;	
			}
			
			/*
			 * 이메일이 수정되었다면 중복체크
			 * 이메일 중복체크 했는지 체크 후 유효성 검사
			 */
			if( (beforeEmail != newMail) && (!emailCheckFlag) ) {
				jAlert("이메일 중복체크를 하세요.","알림창");
				return false;
			} else {
				// 이메일 유효성 검사
				if(!fnCheckEmail()) {
					return false;
				}
			}
			
			// 업로드 된 이미지 파일 확장자 확인 및 FormData에 추가
			if( !gfnIsNull(document.getElementById("egovFileUpload").files[0]) ) {
				
				// 파일 경로와 파일 이름 
				var file_value = $("#egovFileUpload").val();
				
				//확장자 체크 - img
				var file_extsn = file_value.substring(file_value.lastIndexOf("\.")+1,file_value.length);
				if( $.inArray(file_extsn.toLowerCase(), ["jpg","jpeg","png","gif"]) == -1) {
					jAlert("첨부파일은 gif, jpg, png로 된 이미지만 가능합니다.","알림창");
					
					return false;
				} else {
					
					// formdata에 파일 추가
					fd.append('file', document.getElementById("egovFileUpload").files[0]);
				}
			}
			
			
			
			// 수정 전 사용자의 조직 ID와 현재 조직ID가 같을 경우 → 조직이 수정되지 않은 상태
			// 따라서 조직 선택 텍스트필드 체크
			if( beforeDeptId == currentDeptId ){
				
				/*
				 * 현재 입력된 조직명과 가져온 조직명을 비교
				 * 수정 전 조직명 : '솔루션사업본부 > 기획사업부 > 기획1팀'
				 * 현재 조직명 : ㅇㅁㄴㅇㅁㄴㄹㄴㅇ (이렇게 입력되어 있을경우 체크)
				 */
				if( deptNm != beforeDeptNm ){
					jAlert("입력된 소속명이 잘못되었습니다. \n\n소속 검색 창에서 정확한 소속을 선택해 주세요.","알림창");
					$("#deptName").focus();
					$("#deptName").addClass("inputError");
					return false;
				}
			}
			
			//FormData에 input값 넣기
			gfnFormDataAutoValue('prs3000Form',fd);
			
			// 수정 전 유효성 체크
			if(!gfnSaveInputValChk(arrChkObj)){
				return false;	
			}
			
			// 수정 전 연락처 유효성 검사
			if(!gfnSaveInputValChk(saveObjectValid)){
				return false;	
			}
			
			// 개인정보 수정 여부확인
			jConfirm("저장하시겠습니까?", "알림", function( result ) {
				if(result) {
					
					// 개인정보 수정
					fnUpdatePrs3000();
					
					// 개인정보 재조회
					fnSelectPrs3000Info();
					
					// 개인정보 css숨김
					fnHideProfileCss();
				}
				
				// formdata 초기화
				fd = new FormData();
			});
		});
		
		/* 비밀번호 수정버튼 클릭 */
		$('#btn_update_password').click(function() {
			
			
			// 비밀번호 수정 팝업 호출
			gfnLayerPopupOpen('/prs/prs3000/prs3000/selectPrs3001View.do',usrId,"600","270",'scroll');
			
			// 에러 삭제, 팝업닫히고 데이터 다시 호출하기 때문
			$(".inputError").removeClass("inputError");
		});
		
		/* 기타정보 수정 버튼 클릭 */
		$('#btn_update_dash_cd').click(function() {
			
			// 기타정보 수정 팝업 호출
			gfnLayerPopupOpen('/prs/prs3000/prs3000/selectPrs3002View.do',usrId,"600","245",'scroll');
			
			// 에러 삭제, 팝업닫히고 데이터 다시 호출하기 때문
			$(".inputError").removeClass("inputError");
		});
		
		/* 파일 변경 시  유효성 검사*/
		$('#egovFileUpload').change(function() {
			
			var file_value = $(this).val();
			
			//확장자 체크 - img
			var file_extsn = file_value.substring(file_value.lastIndexOf("\.")+1,file_value.length);
			if( $.inArray(file_extsn.toLowerCase(), ["jpg","jpeg","png","gif"]) == -1) {
				jAlert("jpg, jpeg, png, gif 확장자의 파일만 업로드가 가능합니다.","경고");
				
				fd = new FormData();
				
				$('#egovFileUpload').val('');
				$("#egovFileStatus").html('');
				
				//$("#usrImg_not_exist").show();
				//$("#usrImg_exist").hide();
				return false;
			}
			
			$("#usrImg_not_exist").hide();
			$("#usrImg_exist").show();;
			readURL(this);			
		});
		
		// 취소 버튼 클릭
		$("#btn_cancle").click(function() {
			
			// 개인정보 재조회
			fnSelectPrs3000Info();
			// css 숨기기
			fnHideProfileCss();
		});
	});
	
	function readURL(input) {
		if(input.files && input.files[0]) {
		   var reader = new FileReader();
		   reader.onload = function (e) {
		      $('#usrImg_exist').attr('src', e.target.result);
		   }
		   reader.readAsDataURL(input.files[0]);
		}
	 }

	/* 프로필 이미지 클릭 */
	function handlerEvent() {
		document.getElementById('egovFileUpload').click();
	}
  
	/**
	 * 	사용자 개인정보 상세정보 조회
	 */
	function fnSelectPrs3000Info() {
	
		//AJAX 설정
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/prs/prs3000/prs3000/selectPrs3000UsrInfoAjxa.do'/>"}
				,{ "usrId" : usrId });
		
		// 상세정보가 모두 세팅완료되어야 함
		ajaxObj.async = false;
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			data = JSON.parse(data);
			
			if(data.errorYn == "N") {
				
		    	// 사용자의 수정 전 이메일
				beforeEmail = data.usrInfo.email;
				
				var deptId = data.usrInfo.deptId;
				// 수정전의 조직 ID를 hidden에 세팅
				$("#beforeDeptId").val(deptId);
				
				var deptNm = data.usrInfo.deptName;
				// 수정전의 조직명을 hidden에 세팅
				$("#beforeDeptNm").val(deptNm);
				
				// 사용자 이미지 ID
				var usrImgId = data.usrInfo.usrImgId;
				
				if(!gfnIsNull(usrImgId)){
					// 사용자 이미지가 있다면 이미지를 보여줌
					$("#usrImg_not_exist").hide();
					
					/* atchFileId가 같아 readURL()을 타지 않는 것을 방지하기 위해 쿼리스트링에 시간을 추가 */
					var imgUrl = "/cmm/fms/getImage.do?fileSn=0&atchFileId="+usrImgId+"&"+new Date().getTime();
					$("#usrImg_exist").attr("src", imgUrl);
					
					$("#usrImg_exist").show();
					
				} else {
					$("#usrImg_exist").hide();
					$("#usrImg_not_exist").show();
				}
		    	// 폼 데이터 세팅
		    	gfnSetData2ParentObj(data.usrInfo, "prs3000Form");
		    	
		    	// 직책, 직급 원래 값 셀렉트 세팅
				$("#usrDutyCd").val(data.usrInfo.usrDutyCd).prop("selected", true);
				$("#usrPositionCd").val(data.usrInfo.usrPositionCd).prop("selected", true);
				
			} else {
				
				jAlert(data.message,"알림창");
			}
	    	
		});
		
		//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err){
			jAlert("조회를 실패하였습니다.", "알림창");
		});
		
		//AJAX 전송
		ajaxObj.send();
	} 

	/* 이메일 변경 flag */
	function fnEmailFlagChk() {
		$("#email").change(function() {
			emailCheckFlag = false;
		})
	}

	/* 이메일 유효성 체크 */
	function fnCheckEmail() {
		// 현재 입력된 사용자의 이메일
		var usrEmail = $('#email').val().trim();
		
		/* 이메일 필수값 체크 */
		if(usrEmail.length == 0) {
			
			jAlert("이메일은 필수 입력 사항입니다.\n\n\r 이메일 항목을 입력하세요.","알림창");
			$("#email").addClass("inputError");
			$("#email").focus();
			return false;
		} 
		
		// 이메일 정규식
		var pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(usrEmail.length < 6 || !pattern.test(usrEmail) ) {
			$("#email").addClass("inputError");
			jAlert("이메일 형식이 아닙니다. <br>(예) mymail@naver.com");
			return false;
		}
		
		return true;
	}
	
	/**
	 * 개인정보 수정 화면(이메일 체크) AJAX
	 */
	function fnCheckRepetition() {
		
		// 현재 입력된 사용자의 이메일
		var usrEmail = $('#email').val().trim();
		
		if(usrEmail == beforeEmail) {
			//현재 사용자의 이메일과 동일한 경우 중복체크 안함
			jAlert("현재 사용자의 이메일입니다.", "알림창");
			return true;
		} 
		
		//AJAX 설정
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/prs/prs3000/prs3000/selectPrs3000emailChRepAjax.do'/>"}
				,{ "email":usrEmail });
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			data = JSON.parse(data);
			
        	if(data.errorChk == 'Y') {
        		
        		jAlert(data.message,"알림창");
        		// 이메일 중복
        		$("#email").addClass("inputError");
        		$("#email").attr("readonly",false);
        		return false;
        	} else if(data.errorChk == 'N') {
        		
        		jAlert(data.message,"알림창");
        		// 중복된 이메일 없음
        		$("#email").removeClass("inputError");
        		$("#email").attr("readonly",true);
        		return true;
        	}
		});
		
		//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err){
			jAlert("이메일중복체크에 실패하였습니다.","알림창");
		 	emailCheckFlag = false;
		});
		//AJAX 전송
		ajaxObj.send();
	}
	
	
	
	
	/**
	 * 개인정보 수정(UPDATE) AJAX
	 */
	function fnUpdatePrs3000(){
		//AJAX 설정
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/prs/prs3000/prs3000/updatePrs3000.do'/>"
					,"contentType":false
					,"processData":false
					,"cache":false}
				,fd);
		
		ajaxObj.async = false;
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
			
			if(data.errorYn != 'N') {
        		jAlert(data.message,"알림창");
        		return;
        	} else {
	        	jAlert(data.message,"알림창");
        	}
			
			if(data.fileError == 'Y') {
				jAlert("프로필 이미지 업로드를 실패하였습니다.","알림창");
			}
		});
		
		//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err){
			jAlert("개인정보를 수정하지 못하였습니다.","알림창");
		});
		
		//AJAX 전송
		ajaxObj.send();
	}

	
	//가이드 상자
	function fnPrs3000GuideShow(){
		var mainObj = $(".main_contents");
		
		//mainObj가 없는경우 false return
		if(mainObj.length == 0){
			return false;
		}
		//guide box setting
		var guideBoxInfo = globals_guideContents["prs3000"];
		gfnGuideBoxDraw(true,mainObj,guideBoxInfo);
	}
	
	
	// 사용자 프로필 css 숨기기
	function fnHideProfileCss() {
		
		// 사용자 프로필 input, selectbox,textarea 사용 불가능 세팅
		$(".content_top_left").find("input").addClass("input_noshow").removeClass("inputError").attr("readonly","readonly");
		$(".content_top_left").find("select").addClass("select_noshow").removeClass("inputError").attr("disabled",true);
		$(".content_top_left").find("textarea").attr("readonly","readonly").removeClass("inputError").addClass("textarea_noUse");
		// 모든 버튼 숨기기
		$(".content_top_left").find(".btn_showYn").addClass("btn_nouse");
		// 필수 입력 숨김
		$(".required_info_prs3000").css("display","none");
		
		// 프로필 이미지 이벤트 제거
		document.getElementById("sel_imgfile").removeEventListener("click", handlerEvent);
		
		// 프로필 이미지 클릭 불가 디폴트 세팅
		$(".prs_usrImgDiv").css("cursor", "default");
		
		// 수정버튼 보이기
		$("#btn_update").removeClass("btn_nouse");
		
		// 확인/취소 버튼 숨기기
		$("#btn_update_complete").addClass("btn_nouse");
		$("#btn_cancle").addClass("btn_nouse");
		
		// 파일선택 버튼 숨기고 이벤트 해제
		$("#btn_update_fileSelect").hide().unbind("click");
		
		// 파일 이름 숨기기
		$("#egovFileStatus").html('');
		
		// 수정진행중 상태로 변경
		updateOngoingChk = false;
		
		// 이메일 중복체크 초기화
		emailCheckFlag = false;
		
		// 셀렉트박스 값이 선택이면 숨기기
		fnHideSelectBoxNovalue();
	}
	
	// 사용자 프로필 css 보이기
	function fnShowProfCss() {
		// 사용자 프로필 input, selectbox,textarea 사용가능 세팅
		$(".content_top_left").find("input").removeClass("input_noshow").not("#usrId").removeAttr("readonly");
		$(".content_top_left").find("select").removeClass("select_noshow").removeAttr("disabled");
		$(".content_top_left").find("textarea").removeAttr("readonly").removeClass("textarea_noUse");
		$(".content_top_left").find(".btn_nouse").removeClass("btn_nouse");
		
		// 프로필 이미지 클릭 가능
		document.getElementById("sel_imgfile").addEventListener("click", handlerEvent);
		$(".prs_usrImgDiv").css("cursor", "pointer");
		
		// 필수 * 보이기
		$(".required_info_prs3000").css("display","inline");
		
		// 셀렉트 박스가 숨겨졌다면 보이기
		$("#usrDutyCd").show();
		$("#usrPositionCd").show();
		
		// 파일선택 버튼 보이고 이벤트 세팅
		$("#btn_update_fileSelect").show().bind("click");
		
		// 수정 버튼 숨기기
		$("#btn_update").addClass("btn_nouse");
		
		// 확인/취소 버튼 보이기
		$("#btn_update_complete").removeClass("btn_nouse");
		$("#btn_cancle").removeClass("btn_nouse");
		
		// 직책,직급,대시보드 표시 구분 - 숨김
		$(".noValue").hide();
		
		// 수정진행중 상태로 변경
		updateOngoingChk = true;
	}
	
	/* 셀렉트 박스값이  선택이라면 숨기기 */
	function fnHideSelectBoxNovalue() {
		// 셀렉트 박스
		var arrObj = [ $("#usrPositionCd"),$("#usrDutyCd")];
		
    	// 선택입력 셀렉트 박스가 선택이라면 상세보기에서 가리기
	    $.each(arrObj, function() {
	    	if(gfnIsNull(this.val())) {
	    		$(this).next("div").css("display","block");
	    		this.hide();
	    	} 
	    })
	}
	
</script>
<div class="main_contents prs3000_contents">
	<div class="prs_title">${sessionScope.selMenuNm}</div>
	<form id="prs3000Form" name="prs3000Form" method="post">
	<div class="info_table">
		<input type="hidden"  id="usrImgId" name="usrImgId" value="" />
		<input type ="hidden" id="deptId" name="deptId" value="" />
		<!-- 기존 정보와 수정된 정보를 비교하기 위한 hidden -->
		<input type ="hidden" id="beforeDeptId" name="beforeDeptId" value="" />
		<input type ="hidden" id="beforeDeptNm" name="beforeDeptNm" value="" />
		<!-- 사용자 프로필 -->
		<div class="info_div content_top_left" style="height:702px;">
			<div class="content_title"><i class="far fa-address-card"></i> 사용자 프로필</div>
			<div class="innerBody">
				<div class="img"> 
					<div class="prs_usrImgDiv" id="sel_imgfile" onclick="">
						<img src="" id="usrImg_exist" class="user_img dis_none" />
						<img alt="사용자 사진" src="/images/contents/sample.png" id="usrImg_not_exist" class="user_img dis_none">
					</div>
					<!-- 업로드된 파일명, 파일 사이즈 -->
					<div  class="uploadOverFlow"><span id="egovFileStatus"></span></div>
					<span class="button_normal2 choose_file btn_nouse btn_showYn" onclick="document.getElementById('egovFileUpload').click();"
					id="btn_update_fileSelect">
					<input type="file" style="display:none" class="" id="egovFileUpload" name="uploadFileList" data-user/> 파일선택
					</span>
				</div>	
				<div class="profile_left">
					<div class="box_1 box_line profile_div">아이디</div>
					<div class="input_box_1 read_only profile_input_div">
						<input type="text" title="사용자 입력창" class="input_id input_noshow" readonly="readonly" id="usrId" name="usrId" value="">
					</div>
				</div>
				<div class="profile_left">
					<div class="box_1 box_line profile_div">성명<span class="required_info_prs3000">&nbsp;*</span></div>
					<div class="input_box_1 profile_input_div">
						<input type="text" title="사용자 입력창" class="input_nm input_noshow" id="usrNm" name="usrNm" value="" maxlength="14" readonly="readonly">
					</div>
				</div>
				<div class="profile_left">
					<div class="box_1 box_line profile_div">직책</div>
					<div class="input_box_1 profile_input_div">
						<span class="code_select">
							<select class="select_noshow select_cd select_dutyCd" name="usrDutyCd" id="usrDutyCd" value="" disabled></select>
							<div class="noValue dis_none" > - </div>
						</span>
					</div>
				</div>
				<div class="profile_left">
					<div class="box_1 box_line profile_div">직급</div>
					<div class="input_box_1 profile_input_div">
						<span class="code_select">
							<select class="select_noshow select_cd select_positionCd" name="usrPositionCd" id="usrPositionCd" value="" disabled></select>
							<div class="noValue dis_none" > - </div>
						</span>
					</div>
				</div>
				<div class="profile_row">
					<div class="box_1 box_line ect_info_div">소속<span class="required_info_prs3000 input_noshow">&nbsp;*</span></div>
					<div class="input_box_1 ect_info_input_div">
						<input type="text" title="소속 선택" class="input_nm input_noshow" id="deptName" name="deptName" value="" maxlength="200" >
						<div class="button_check search_btn btn_nouse btn_showYn" id="btn_search_dept">소속검색</div>
					</div>
				</div>
				<div class="profile_row">
					<div class="box_1 box_line ect_info_div">연락처<span class="required_info_prs3000 input_noshow">&nbsp;*</span></div>
					<div class="input_box_1 address_input_div">
						<input type="text" title="사용자 연락처" class="input_nm input_noshow" id="telno" name="telno" value="" maxlength="13" max="99999999999" readonly>
					</div>
				</div>
				<div class="profile_row">
					<div class="box_1 box_line ect_info_div">이메일<span class="required_info_prs3000 input_noshow">&nbsp;*</span></div>
					<div class="input_box_1 address_input_div">
						<input type="text" title="사용자 이메일" class="input_nm input_noshow" id="email" name="email" value="" maxlength="48" readonly>
						<div class="button_check search_btn btn_nouse btn_showYn" id="btn_search_checkRepetition">중복확인</div>
					</div>
				</div>
				<div class="profile_row profile_row_last">
					<div class="box_1 box_line ect_info_div">비고</div>
					<div class="input_box_1 etc_div">
						<textarea class="input_note" title="비고" id="etc" name="etc" style="height:120px;" maxlength="2000" readonly="readonly"></textarea>
					</div>
				</div>
			</div>
			<div class="btn_ok_div">
				<div class="button_complete" id="btn_update">수정</div>
				<div class="button_complete btn_nouse" style=";margin-left:327px;float:left;" id="btn_update_complete">확인</div>
				<div class="button_complete btn_nouse" style="float:right;margin-right:305px;" id="btn_cancle">취소</div>
			</div>
		</div>
		<div class="info_div content_top_right" style="height: 279px;">
			<div class="content_title"><i class="fab fa-expeditedssl"></i> 비밀번호</div>
			<div class="innerBody password_body">
				<div class="password_div">최근 변경일시</div>
				<div class="password_input_div">
					 <input type="text" class="input_noshow" id="pwModifyDtm" value="" disabled/>
				</div>
			</div>
			<div class="btn_ok_div">
				<div class="button_complete" id="btn_update_password">수정</div>
			</div>
		</div>
		<!-- 대시보드 표시 구분 - 프로젝트-->
		<div class="info_div content_bottom_right" style="height:402px;">
			<div class="content_title"><i class="fas fa-clipboard-list"></i> 기타정보</div>
			<div class="innerBody etc_body">
				<div class="etc_row">
					<div class="etc_row_left">메인 프로젝트</div>
					<div class="etc_row_right" guide="mainProject">
						<input type="text" title="메인 프로젝트 선택" class="input_noshow" id="prjNm" disabled>
					</div>
				</div>
			</div>
			<div class="btn_ok_div" style="padding-top: 43px;">
				<div class="button_complete" id="btn_update_dash_cd">수정</div>
			</div>
		</div>
		<div class="pop_file" ></div>
	</div>
	</form>
	<script type="text/javascript">
	   //첨부파일 업로드 설정 (Select)
	   var maxFileNum = 1;
	   var multi_selector = new MultiSelector( document.getElementById( 'egovFileStatus' ), maxFileNum );
	   multi_selector.addElement( document.getElementById( 'egovFileUpload' ) );
	</script>
</div>
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />