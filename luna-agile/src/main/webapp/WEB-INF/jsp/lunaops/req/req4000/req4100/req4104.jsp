<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="kt-portlet kt-portlet--mobile">
	<input type="hidden" name="type" id="type" value="${param.type }" /> 
	<input type="hidden" id="paramPrjId" name="paramPrjId" value='${param.paramPrjId}'/>
	<input type="hidden" name="paramReqId" id="paramReqId" value='${param.paramReqId }' />
	<input type="hidden" name="paramReqUsrId" id="paramReqUsrId" value='${param.paramReqUsrId }' />
	<input type="hidden" name="datatableId" id="datatableId" value='${param.datatableId }' />
	<input type="hidden" name="paramRowData" id="paramRowData" value='${param.paramRowData }' />
	<div class="kt-portlet__body">
		<div class="kt-align-center">
			<span data-lang-cd="req4104.text">잠긴 요구사항입니다. 비밀번호를 입력하세요.</span>
			<div class="input-group kt-margin-t-10">
				<input type="password" class="form-control" name="reqPwInput" id="reqPwInput" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" required>
				<div class="input-group-append">
					<button class="btn btn-brand" name="pwCheckBtn" id="pwCheckBtn" ><span data-lang-cd="req4104.button.submit">확인</span></button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";

var OSLReq4104Popup = function () {
	//삭제 루트로 들어온 경우 전달 받은 rowDatas 변환
	var rowDatas;
	var documentSetting = function () {
		
		//placeholder
		$("#reqPwInput").attr("placeholder", $.osl.lang("req4101.placeholder.password"));
		
    	//삭제 루트로 들어온 경우
    	if("delete" == $("#type").val()){
    		rowDatas =  JSON.parse($("#paramRowData").val());
    		//비밀번호가 걸린 데이터 정보 넣기
    		$.each(rowDatas, function(idx, value){
    			if(value.reqPw == "Y"){
    				$("#paramPrjId").val(value.prjId);
    				$("#paramReqId").val(value.reqId);
    			}
    		});
    	}
    	
    	//비밀번호 확인 버튼 클릭 했을 때
    	$("#pwCheckBtn").click(function(){
    		selectPwInfo();
    	});
    	
    	//비밀번호 입력 후 엔터 쳤을 때
    	$("#reqPwInput").on("keypress", function(e){
    		if(e.key == "Enter"){
    			$("#pwCheckBtn").click();		
    		}
    	});
    }
    
    /** 비밀번호 확인 **/
    var selectPwInfo = function(){
    	var data = {
   			prjId : $("#paramPrjId").val(),
   			reqId : $("#paramReqId").val(),
   			reqPw : $("#reqPwInput").val(),
    	}
    	
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/req/req4000/req4100/selectReq4100PwCheckAjax.do'/>"}
				, data);
    	
    	//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var pwCheck = data.resultPwCheck;
				//비밀번호가 일치하는 경우
				if(pwCheck == "Y"){
					if("delete" == $("#type").val()){
						//삭제 루트로 들어온 경우
						//AJAX 설정
						var delAjaxObj = new $.osl.ajaxRequestAction(
								{"url":"<c:url value='/req/req4000/req4100/deleteReq4100ReqListAjax.do'/>"}
								,{deleteDataList: $("#paramRowData").val()});
						//AJAX 전송 성공 함수
						delAjaxObj.setFnSuccess(function(data){
							if(data.errorYn == "Y"){
				   				$.osl.alert(data.message,{type: 'error'});
				   			}else{
				   				//삭제 성공
				   				$.osl.toastr(data.message);

				   				var datatableId = $("#datatableId").val();
				   				
				   				//현재 비밀번호 창 닫기
								$.osl.layerPopupClose();
				   				
				   				//datatable 조회
				   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
				   				
				   			}
						});
						//AJAX 전송
						delAjaxObj.send();
						
					}else{
						//상세보기 루트로 들어온 경우
						var data = {
								type: $("#type").val(),
								paramPrjId: $("#paramPrjId").val(),
								paramReqId: $("#paramReqId").val(),
								paramReqUsrId: $("#paramReqUsrId").val(),
								datatableId : $("#datatableId").val(),
						};
						var options = {
								idKey:$("#datatableId").val(),
								modalTitle: $.osl.lang("req4100.title.updateTitle"),
								closeConfirm: false,
								autoHeight:false,
							};

						//현재 비밀번호 창 닫기
						$.osl.layerPopupClose();
						//해당 게시글 팝업 열기
						$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
					}
				}else{
					$.osl.alert($.osl.lang("bad1004.passwordMiss") , {"type" : "warning"});
					$("#reqPwInput").val("");
					$("#reqPwInput").focus;
				}
			}
    	});
    	//AJAX 전송
		ajaxObj.send();
    }
    
    return {
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLReq4104Popup.init();
});
</script>