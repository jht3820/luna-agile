<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<title>OpenSoftLab</title>
<style>
.password_inputBox {
	display: block !important;
	width: 90% !important;
	margin: 11px 0px 0px 22px !important;
}

.input_box_1 input[type=password] {
	height: 100%;
	padding-left: 4px;
	max-width: 100%;
}

.div_text {
	text-align: left;
	font-size: x-small;
	padding: 10px 0px 0px 19px;
}

.layer_popup_box .pop_left {
	padding: 15px 10px !important;
	border-left: 1px solid #ccc;
}

.layer_popup_box .pop_right {
	border-right: 1px solid #ccc;
}

.layer_popup_box input[type="password"].input_txt {
	width: 100% !important;
	max-width: 100%;
}

</style>
<script>
	//유효성 체크
	var arrChkObj = {
		// 새 비밀번호
		"newUsrPw" : {
			"type" : "length",
			"msg" : "비밀번호는 50byte까지 입력이 가능합니다.",
			"max" : 50
		}
	}

	var fd = new FormData();

	$(document).ready(function() {

		/***** 유효성 체크 시작 *****/

		// 길이 유효성 체크
		gfnInputValChk(arrChkObj);
		
		/* 저장버튼 클릭 시 */
		$('#btn_update_passPopup').click(function() {

			/* 필수입력값 체크 공통 호출 */
			var passFormId = "prs3001PopupFrm";
			var passCheckObjArr = [ "usrPw","newUsrPw", "reUsrPw" ];
			var passCheckObjNmArr = ["현재 비밀번호", "새 비밀번호","새 비밀번호 확인" ];

			// 필수값 여부 체크
			if(gfnRequireCheck(passFormId,
					passCheckObjArr,
					passCheckObjNmArr)) {
				return false;
			}

			/* 비밀번호 유효성 체크 시작 */

			var usrId = "${sessionScope.loginVO.usrId}";
			var newUsrPw = $("#newUsrPw").val();
			var reUsrPw = $("#reUsrPw").val();

			if(gfnIsNull(usrId)) {
				jAlert("사용자의 아이디를 조회할 수 없습니다.","알림창");
				return false;
			}

			// 비밀번호 유효성 검사
			if(fnUsrPwValidationChk(usrId,newUsrPw) == false) {
				$("#newUsrPw").val("");
				$("#reUsrPw").val("");
				$("#newUsrPw").addClass(
						"inputError");
				$("#newUsrPw").focus();
				return false;
			}

			// 새 비밀번호와  새 비밀번호 확인이 같다면
			if(reUsrPw == newUsrPw) {

				// 비밀번호 수정 여부 확인
				jConfirm("저장하시겠습니까?","알림",function(result) {
					if (result) {
						// 비밀번호 수정
						fnUpdatePrs3001();
					}
				});
				
			// 새비밀번호 불일치 시	
			} else {
				
				jAlert("새 비밀번호와 비밀번호 확인이 일치 하지 않습니다.","알림창");

				$("#reUsrPw").focus();
				$("#reUsrPw").val("");
				$("#reUsrPw").addClass("inputError");
				return false;
			}
		});

		/* 취소버튼 클릭 시 팝업 창 사라지기*/
		$('#btn_cancle_popup').click(function() {
			// 개인정보 수정 화면 데이터 리프레쉬
			fnSelectPrs3000Info();

			gfnLayerPopupClose();

		});

	});

	/****** 비밀번호 유효성 체크 ********/

	/**
	 * 	사용자 비밀번호 유효성 체크
	 *	@param usrId 사용자 아이디
	 *	@param usrPw 사용자 비밀번호
	 *  @returns 결과(boolean)
	 */
	function fnUsrPwValidationChk(usrId, usrPw) {

		// 비밀번호 유효성체크 정규식
		var pwRegx = /^(?=.{9,})(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]).*$/;

		//유효성 체크
		var saveObjectValid = {
			"newUsrPw" : {
				"type" : "regExp",
				"pattern" : pwRegx,
				"msg" : "비밀번호는 9자 이상 영문,숫자,특수문자를 조합해야 합니다.",
				"required" : true
			}
		}

		// 비밀번호 유효성 검사
		if(!gfnInputValChk(saveObjectValid)) {
			return false;
		}

		// 비밀번호 사용자 아이디 포함여부 체크
		if(usrPw.indexOf(usrId) > -1) {
			jAlert("비밀번호에는 사용자 아이디를 포함할 수 없습니다.", "알림창");
			return false;
		}

		// 비밀번호 공백포함 체크
		var emptyRegx = /\s/g;
		if(emptyRegx.test(usrPw)) {
			jAlert("비밀번호는 공백을 포함할 수 없습니다.", "알림창");
			return false;
		}

		// 같은 문자열 반복 체크
		var repetRegx = /(\w)\1\1/;
		if(repetRegx.test(usrPw)) {
			jAlert("비밀번호는 같은 문자를 3번 이상 연속해서 사용하실 수 없습니다.", "알림창");
			return false;
		}

		// 문자열 연속성 체크 - 123, 321, abc, cba
		if(fnContinueStrChk(usrPw, 3) == false) {
			jAlert("연속된 문자열(123 ,321, abc, cba 등)을 3자 이상 사용 할 수 없습니다.", "알림창");
			return false;
		}

		return true;
	}

	/**
	 * 	입력된 문자열에 연속된 문자(123, abc 등)가 있는지 체크한다
	 *	@param str 입력 문자열
	 *	@param limit 자리수, 3 → 123이렇게 3자리 입력시 체크됨
	 *  @returns 결과(boolean)
	 */
	function fnContinueStrChk(str, limit) {

		var char1, char2, char3, char4 = 0;

		for(var i = 0; i < str.length; i++) {
			var inputChar = str.charCodeAt(i);

			if(i > 0 && (char3 = char1 - inputChar) > -2 && char3 < 2
					&& (char4 = char3 == char2 ? char4 + 1 : 0) > limit - 3) {
				return false;
			}
			char2 = char3;
			char1 = inputChar;
		}
		return true;
	}

	/****** 비밀번호 유효성 체크 끝 *******/

	/**
	 * 비밀번호 수정(UPDATE) AJAX
	 */
	function fnUpdatePrs3001() {
		
		//AJAX 설정
		var ajaxObj = new gfnAjaxRequestAction({
			"url" : "<c:url value='/prs/prs3000/prs3000/updatePrs3001.do'/>"
		}, {
			"usrId" : "${sessionScope.loginVO.usrId}",
			"usrPw" : $("#usrPw").val(),
			"newUsrPw" : $("#newUsrPw").val()
		});
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data) {

			data = JSON.parse(data);

			// 비밀번호 수정 성공
			if (data.errorYn == "N") {
				
				jAlert(data.message, '알림창');
				// 개인정보 수정 화면 데이터 리프레쉬
				fnSelectPrs3000Info();
				gfnLayerPopupClose();
				
			// 비밀번호 수정 실패
			} else {
				jAlert(data.message, '알림창');
				$("#usrPw").addClass("inputError");
				$("#usrPw").val("");
				$("#newUsrPw").val("");
				$("#reUsrPw").val("");
			}
		});

		//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err) {
			jAlert("비밀번호 수정을 할 수 없습니다.", "알림창");
		});
		
		//AJAX 전송
		ajaxObj.send();
	}
</script>
<div class="popup">
	<div class="pop_title">비밀번호 수정</div>
	<div class="pop_sub">
		<form id="prs3001PopupFrm" name="req1000PopupFrm" method="post">
			<div class="pop_left" id="expr_div" >현재 비밀번호<span class="required_info">&nbsp;*</span></div>
			<div class="pop_right" id="expr_input">
				<input type="password" title="비밀번호 입력창" class="input_txt" id="usrPw"name="usrPw" value="" maxlength="50"
					placeholder="현재 비밀번호를 입력해 주세요." />
			</div>
			<div class="pop_left">새 비밀번호<span class="required_info">&nbsp;*</span></div>
			<div class="pop_right">
				<input type="password" title="비밀번호 입력창" class="input_txt"id="newUsrPw" name="newUsrPw" value="" maxlength="50"
					placeholder="9자 이상 영문 대소문자,숫자,특수문자를 조합해야 합니다." />
			</div>
			<div class="pop_left bottom_line">새 비밀번호 확인<span class="required_info">&nbsp;*</span></div>
			<div class="pop_right bottom_line">
				<input type="password" title="비밀번호 수정 시 비밀번호 확인에 입력해야 합니다."class="input_txt" id="reUsrPw" name="reUsrPw" value=""
					maxlength="50" placeholder="9자 이상 영문 대소문자,숫자,특수문자를 조합해야 합니다." />
			</div>
			<div class="btn_div">
				<div class="button_normal save_btn" id="btn_update_passPopup">확인</div>
				<div class="button_normal exit_btn" id="btn_cancle_popup">취소</div>
			</div>
		</form>
	</div>
</div>
</html>