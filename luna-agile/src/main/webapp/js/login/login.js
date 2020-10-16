"use strict";
var OSLLogin = function () {
	
	// Private functions
	var documentSetting = function () {
		var hiddenParamForm = $("#kt_hidden_param_form")[0];
		
		//requestScope에서 전달 받은 파라미터 값
		var loginYn = hiddenParamForm.loginYn.value;
		var isPrjYn = hiddenParamForm.isPrjYn.value;
		var logoutYn = hiddenParamForm.logoutYn.value;
		var message = hiddenParamForm.message.value;
		var sessionYn = hiddenParamForm.sessionYn.value;
		var iniYn  = hiddenParamForm.iniYn.value;  
		var exprYn  = hiddenParamForm.exprYn.value; 	// 비밀번호 만료여부
		var loginSessionYn = hiddenParamForm.loginSessionYn.value;
		var paramUsrId = hiddenParamForm.paramUsrId.value;
		var paramUsrPw = hiddenParamForm.paramUsrPw.value;
		var licGrpId = hiddenParamForm.licGrpId.value;

		if(iniYn == 'Y'){
			var data = { "usrId" : paramUsrId  };
			$.osl.layerPopupOpen('/cmm/cmm4000/cmm4002/selectCmm4002View.do', data , '550', '250','scroll');
		}
		
		// 비빌번호 만료가 되었을 경우 팝업 띄워서 비밀번호 변경하도록
		if(exprYn == "Y"){
			$.osl.alert("알림","비밀번호 사용기간이 만료되었습니다. </br>비밀번호를 변경해 주세요","warning", function(result){
				var data = { "usrId" : paramUsrId , "exprYn" : exprYn , "licGrpId" : licGrpId};
				$.osl.layerPopupOpen('/cmm/cmm4000/cmm4002/selectCmm4002View.do', data , '550', '290','scroll');
			});
			return false;
		}	
		
		//세션이 만료된 경우 세션 만료 메시지 띄움.
		if(sessionYn == 'N'){
			$.osl.alert(message);
		}
		
		/* 로그인 여부, 라이선스 활성화 여부, 프로젝트 존재여부가 N일 경우 실패 이유 얼럿 */
		if(loginYn == "N" || isPrjYn == "N"){
			$.osl.alert(message);
		}
		//로그아웃인 경우 alert창 안 띄우고 toast 메시지 처리
		if(logoutYn == 'Y'){
			$.osl.toastr(message);
		}
	
		if(loginSessionYn == 'Y'){
			$.osl.confirm(message,null,function(result) {
		        if (result.value) {
		        	$('#loginSessionYn').val(loginSessionYn);
					$('#usrId').val(paramUsrId);
					$('#usrPw').val(paramUsrPw);
					$('#kt_login_submit').click();
		        }
		    });
		}
		
		$("#usrId").focus();	// 아이디 입력란 key focus
		
		var formId = 'kt_login_form';
		$.osl.validate(formId);
	};

	// Private Functions
	var handleLoginFormSubmit = function () {
		$('#kt_login_submit').click(function (e) {
			e.preventDefault();

			var btn = $(this);
			var form = $('#kt_login_form');
			
			//폼 유효 값 체크
			if (!form.valid()) {
				return;
			}

			KTApp.progress(btn[0]);

			setTimeout(function () {
				KTApp.unprogress(btn[0]);
			}, 1000);
			
			document.kt_login_form.action = "/cmm/cmm4000/cmm4000/selectCmm4000LoginAction.do";
			document.kt_login_form.submit();
		});

		/* 레이어 팝업 띄우기 */
		$('#pwFindLink').click(function() {
			//레이어팝업 공통함수 이용 호출할 것.
			//layer_popup('/cmm/cmm4000/cmm4001/selectCmm4001View.do', 'idPwFind');
			
			var data = {type:"insert"};
			var options = {idKey: this.id};
			
			$.osl.layerPopupOpen('/cmm/cmm4000/cmm4001/selectCmm4001View.do',data,options);
		});
	}
	
	return {
		  // public functions
		  init: function() {
		  	documentSetting();
		  	handleLoginFormSubmit();
		  }
	};
}();

//Initialization
$.osl.ready(function(){
	OSLLogin.init();
});
