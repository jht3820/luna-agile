"use strict";
var OSLLogin = function () {
	
	
	var documentSetting = function () {
		var hiddenParamForm = $("#kt_hidden_param_form")[0];
		
		
		var loginType = hiddenParamForm.loginType.value;
		var loginYn = hiddenParamForm.loginYn.value;
		var isPrjYn = hiddenParamForm.isPrjYn.value;
		var logoutYn = hiddenParamForm.logoutYn.value;
		var message = hiddenParamForm.message.value;
		var sessionYn = hiddenParamForm.sessionYn.value;
		var iniYn  = hiddenParamForm.iniYn.value;  
		var exprYn  = hiddenParamForm.exprYn.value; 	
		var loginSessionYn = hiddenParamForm.loginSessionYn.value;
		var paramUsrId = hiddenParamForm.paramUsrId.value;
		var paramEmail = hiddenParamForm.paramEmail.value;
		var paramUsrPw = hiddenParamForm.paramUsrPw.value;
		var licGrpId = hiddenParamForm.licGrpId.value;

		if(iniYn == 'Y'){
			var data = { "usrId" : paramUsrId  };
			$.osl.layerPopupOpen('/cmm/cmm4000/cmm4002/selectCmm4002View.do', data , '550', '250','scroll');
		}
		
		
		if(exprYn == "Y"){
			$.osl.alert("알림","비밀번호 사용기간이 만료되었습니다. </br>비밀번호를 변경해 주세요","warning", function(result){
				var data = { "usrId" : paramUsrId , "exprYn" : exprYn , "licGrpId" : licGrpId};
				$.osl.layerPopupOpen('/cmm/cmm4000/cmm4002/selectCmm4002View.do', data , '550', '290','scroll');
			});
			return false;
		}	
		
		
		if(sessionYn == 'N'){
			$.osl.alert(message);
		}
		
		
		if(loginYn == "N" || isPrjYn == "N"){
			$.osl.alert(message);
		}
		
		if(logoutYn == 'Y'){
			$.osl.toastr(message);
		}
	
		if(loginSessionYn == 'Y'){
			$.osl.confirm(message,null,function(result) {
		        if (result.value) {
		        	$('#loginSessionYn').val(loginSessionYn);
					$('#usrId').val(paramUsrId);
					$('#email').val(paramEmail);
					$('#usrPw').val(paramUsrPw);
					$('#kt_login_submit').click();
		        }
		    });
		}
		
		
		if(loginType == "email"){
			$("#email").inputmask({
	            mask: "*{1,20}[.*{1,20}][.*{1,20}][.*{1,20}]@*{1,20}[.*{2,6}][.*{1,2}]",
	            greedy: false,
	            definitions: {
	                '*': {
	                    validator: "[0-9A-Za-z!#$%&'*+/=?^_`{|}~\-]",
	                    cardinality: 1,
	                    casing: "lower"
	                }
	            }
	        });
			
			$('#email').focus();
		}else{
			$('#usrId').focus();	
		}
		
		
		var formId = 'kt_login_form';
		$.osl.validate(formId);
	};

	
	var handleLoginFormSubmit = function () {
		$('#kt_login_submit').click(function (e) {
			e.preventDefault();

			var btn = $(this);
			var form = $('#kt_login_form');
			
			
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

		
		$('#pwFindLink').click(function() {
			
			
			
			var data = {type:"insert"};
			var options = {idKey: this.id};
			
			$.osl.layerPopupOpen('/cmm/cmm4000/cmm4001/selectCmm4001View.do',data,options);
		});
	}
	
	return {
		  
		  init: function() {
		  	documentSetting();
		  	handleLoginFormSubmit();
		  }
	};
}();


$.osl.ready(function(){
	OSLLogin.init();
});
