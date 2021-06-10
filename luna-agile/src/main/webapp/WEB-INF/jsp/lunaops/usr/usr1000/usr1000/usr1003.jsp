<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="kt-portlet" data-aside-menu="usrShortCut" id="usr1100ShortcutInfo">
		<form class="kt-form kt-form--label-right" id="frUsr1000UserShortCut">
			<div class="kt-portlet__body">
				<div class="kt-section kt-section--first">
					<div class="kt-section__body">
						<div class="kt-portlet" id="menuNAuthShortCut">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<i class="fa flaticon-layer kt-margin-r-5"></i><span data-lang-cd="usr1100.title.shortcut">메뉴 및 권한 관리 단축키</span>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-group">
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-up"></i></a>
									</div>
								</div>
							</div>
							<div class="kt-portlet__body">
								<div class="row">
										<div class="col-xl-4 col-lg-3 col-md-12 col-sm-12 col-form-label osl-align-left--imp"><h5 class="kt-font-boldest text-primary"><span data-lang-cd="usr1100.title.shortcutName">단축키 명</span></h5></div>
										<div class="col-xl-3 col-lg-2 col-md-12 col-sm-12"><h5 class="kt-font-boldest text-primary"><span data-lang-cd="usr1100.title.popupActionCd">팝업시 동작여부</span></h5></div>
										<div class="col-xl-5 col-lg-7 col-md-12 col-sm-12"><h5 class="kt-font-boldest text-primary text-center"><span data-lang-cd="usr1100.title.shorcutKey">단축키</span></h5></div>
								</div>
								<div id="shortcutDiv"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
"use strict";
var OSLUsr1003Popup = function () {
	
	var shortcutFormId = 'frUsr1000UserShortCut';
	
    // Private functions
    var documentSetting = function () {
    	
    	//포틀릿 셋팅
    	new KTPortlet('usr1100ShortcutInfo', $.osl.lang("portlet"));
    	
    	selectShortCutInfo();
    	
    };
    
  //저장된 단축키 정보 조회
    var selectShortCutInfo = function(){
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/usr/usr1000/usr1100/selectUsr1100ShortcutInfoAjax.do'/>", "async": false});
    	//AJAX 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
    			$.osl.alert(data.message, {type:'error'});
    			
    			//모달 창 닫기
    			$.osl.layerPopupClose();
    		}else{
    			//단축키 정보 세팅
    			$.osl.setDataFormElem(data.shorcutInfoMap,"frUsr1000UserShortCut");
				
    			//값 저장 element
    			var keyCodeList = document.getElementsByClassName("keyCode");
    			
    			//단축키 입력 테이블
    			var str = "";
    			
				data.shortcutInfo.forEach(function(value, index){
					
	    			str +=
	    				'<div class="form-group form-group-last row kt-margin-b-20 kt-margin-b-25-mobile">'
							+'<label class="col-xl-4 col-lg-3 col-md-12 col-sm-12 col-form-label osl-align-left--imp"><span class="font-weight-bolder" data-lang-cd="usr1100.title.shortcut'+$.osl.escapeHtml(value.actionCd)+'">'+$.osl.escapeHtml(value.subCdNm)+'</span></label>'
							+'<span class="osl-cursor-pointer kt-switch kt-switch--outline kt-switch--icon kt-switch--info col-xl-2 col-lg-2 col-md-12 col-sm-12" data-toggle="kt-tooltip" data-placement="bottom" title="팝업 시 동작 여부">'
								+'<label class="osl-cursor-pointer">'
									+'<input class="popupActionCd osl-cursor-pointer osl-pointer-events__none" actionCd='+$.osl.escapeHtml(value.actionCd)+' type="checkbox"  checked="checked" disabled>'
									+'<span></span>'
								+'</label>'
							+'</span>'
							+'<div class="col-xl-6 col-lg-7 col-md-12 col-sm-12">'
								+'<div class="input-group">'
									+'<input type="text" actionCd='+$.osl.escapeHtml(value.actionCd)+' class="form-control keyCode" readonly="readonly" placeholder="단축키 입력" value="'+$.osl.escapeHtml(value.shortcut)+'">'
								+'</div>'
							+'</div>'
						+'</div>'
				});
				
				//내용 추가
				$("#shortcutDiv").html(str);
				
				//툴팁
				KTApp.initTooltips();
				
				//언어팩
				$.osl.langConvert("#shortcutDiv");
				
				//사용안하는 항목 공백처리
				$(".keyCode").each(function(){
					if($(this).val() == " "){
						$(this).val("");
					}
				});
				
				//팝업창시 실행 여부 조회
				data.shortcutInfo.forEach(function(value, index){
					if(value.popupActionCd == "01"){
						$("input[type='checkbox'][actionCd="+value.actionCd+"]").attr("checked", true);
					}else{
						$("input[type='checkbox'][actionCd="+value.actionCd+"]").attr("checked", false);
					}
				});
				
    		}
    		
    	});
    	
    	//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err){
			data = JSON.parse(data);
			jAlert(data.message, "알림창");
		});
		
		//AJAX 전송
		ajaxObj.send();
    }
    return {
        // public functions
        init: function() {
        	documentSetting();
        },
    };
}();

//Initialization
$.osl.ready(function(){
	OSLUsr1003Popup.init();
});

	
</script>
