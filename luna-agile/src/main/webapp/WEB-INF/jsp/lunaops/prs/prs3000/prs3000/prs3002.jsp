<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<title>OpenSoftLab</title>
<style>
	.check_prj{padding:31px 25px !important;}
	.checking{color:#4b73eb;padding:5px 0px; display:inline-block;}
	.dup_btn { font-size: 0.95em; }
	.search_select {width : 30%; float:left; line-height:24px; font-weight: bold;}
	#prjGrpPeriod { float: left; /* padding-left:5px; padding-top: 5px;  */line-height: 2em; padding: 0px; width: 100%; height: 100%;}
	.textarea_height{height:334px !important;}
	.fl{border-bottom:none !important;}
	.pop_sub input[type="number"] { width:100%; height:100%; }
	.pop_sub input[type="text"].input_txt { width:100%; height:100%; }
	.pop_right {height:50px;}
	.pop_left {height:50px;}
	/* 팝업 위치 */
	.ui-datepicker-trigger { padding-top: 5px; }
	.popup_dashboard_div {width: 40%;padding: 0px 0px 0px 0px !important;}
	.popup_dashboard_input_div {width: 47% !important;margin:0px 0px 0px 0px !important;}
	.pop_menu_row{width:100% !important;}
	.btn_div {margin-top:23px;}
	.pop_menu_col1 {width:37% !important;height:45px !important;line-height: 36px;}
	.pop_menu_col2 {width:63% !important;height:45px !important;line-height: 36px;}
	select {height: 34px !important;}
	.search_btn{margin-left: 8px !important;}
</style>
<script type="text/javascript">


	//유효성 체크
	var arrChkObj = {
			"popPrjNm":{"type":"length","msg":"프로젝트명은 200byte까지 입력가능합니다.", "max":200}
	};


	$(document).ready(function() {
		
		//유효성 체크
		gfnInputValChk(arrChkObj);
		
		// 기타정보 데이터
		var popPrjNm = "<c:out value='${etcInfo.popPrjNm}'/>",
		   prjId = "<c:out value='${etcInfo.prjId}'/>";
		
		// 프로젝트 명 메인프로젝트 input에 세팅
		$("#popPrjNm").val(popPrjNm);   
		   
		// 수정 전의 프로젝트 ID를 hidden에 세팅
		$("#beforePrjId").val(prjId);
		
		// 수정 전의 프로젝트 명을 hidden에 세팅
		$("#beforePrjNm").val(popPrjNm);
		
		// 기타 정보 수정
		$("#btn_update_etcPopup").click(function() {
			
			/* 필수입력값 체크 공통 호출 */
			var strFormId 		= "popupPrs3002Form";
			var strCheckObjArr  = ["popPrjNm"];
			var sCheckObjNmArr  = ["프로젝트"];
			
			/* 입력값 */
			var currentPrjId	= $("#prjId").val();
			var prjNm			= $("#popPrjNm").val();
			
			/*
			 *	개인정보 수정 전 정보들
			 *	현재 입력된 값과 DB상의 사용자 정보의 비교에 사용
			 */
			var beforePrjId		= $("#beforePrjId").val();
			var beforePrjNm		= $("#beforePrjNm").val();
			
			
			// 필수값 여부 체크
			if(gfnRequireCheck(strFormId, strCheckObjArr, sCheckObjNmArr)){
				return false;	
			}
			
			// 수정 전 유효성 체크
			if(!gfnSaveInputValChk(arrChkObj)){
				return false;	
			}
			
			// 수정 전 사용자의 프로젝트 ID와 현재 프로젝트 ID가 같을 경우 → 프로젝트가 수정되지 않은 상태
			if( beforePrjId == currentPrjId ){
				
				/*
				 * 현재 입력된 프로젝트명과 가져온 프로젝트명을 비교
				 * 수정 전 프로젝트명 : OSL AGILE SOLUTION
				 * 현재 프로젝트명 : ㅇㅁㄴㅇㅁㄴㄹㄴㅇ (이렇게 입력되어 있을경우 체크)
				 */
				if( prjNm != beforePrjNm ){
					jAlert("입력된 프로젝트명이 잘못되었습니다. \n\n프로젝트 검색 창에서 정확한 프로젝트를 선택해 주세요.","알림창");
					$("#popPrjNm").focus();
					$("#popPrjNm").addClass("inputError");
					return false;
				}
			}	
			
			
			//  기타 정보 수정 여부 확인
			jConfirm("저장하시겠습니까?", "알림", function(result) {
				if( result ){
					
					// 기타 정보 수정
					fnUpdateEtcInfo();

				}
			});
		});
		
		/* 취소버튼 클릭 시 팝업 창 사라지기*/
		$('#btn_cancle_popup').click(function() {
			
			// 개인정보 수정 화면 데이터 리프레쉬
        	fnSelectPrs3000Info();
			
			gfnLayerPopupClose();
			
		});
		
		/* 프로젝트 검색 창 엔터키 이벤트 */
		$("#popPrjNm").keyup(function(e) {
			
			// inputError가 있으면 제거
			if($(this).hasClass("inputError")){
	    		$(this).removeClass("inputError");
	    	}
			if(e.keyCode == '13'){
				$('#btn_search_project').click();
				
			}
		});
		
		/* 프로젝트 검색버튼 클릭 */
		$('#btn_search_project').click(function() {
			
			var param= $("#popPrjNm").val();
			
			gfnCommonProjectPopup(param,function(e){
				// 선택된 프로젝트 정보가있을경우
				if(!gfnIsNull(e[0])){
					
					$('#prjId').val(e[0].prjId);
					$('#popPrjNm').val(e[0].prjNm);
					
					// 프로젝트 입력부분 readonly
					$("#popPrjNm").attr("readonly",true);
				}
			});
		});
	})
	
	// 기타정보 수정
	function fnUpdateEtcInfo() {
		var prjId = $("#prjId").val();
		var etcData = { "dshDisplayCd" : "01", "prjId" : prjId };
		
		//AJAX 설정
		var ajaxObj = new gfnAjaxRequestAction(
							{"url":"<c:url value='/prs/prs3000/prs3000/updatePrs3002.do'/>"
							,"loadingShow":true}
							,etcData
					  );
		
		// 기타정보가 수정되고 나면 데이터를 새로 가져와야하기 때문에 동기식 사용
		ajaxObj.async = false;
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
			
			// 대시보드 표시 구분 수정 실패
			if( data.errorYn == "Y"){
				jAlert(data.message,"알림창");
				return;
			}
			
			// 대시보드 표시 구분 수정 성공
			jAlert(data.message, "알림창");
			// 개인정보 수정 화면 데이터 리프레쉬 후 팝업닫기
        	fnSelectPrs3000Info();
        	gfnLayerPopupClose();
			
		});
		
		//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err){
			
			jAlert("기타정보를 수정할 수 없습니다.","알림창");
		});
		
		//AJAX 전송
		ajaxObj.send();
	}

</script>
<div class="popup">
	<div class="pop_title">기타 정보</div>
	<div class="pop_sub">
		<form id="popupPrs3002Form" name="popupPrs3002Form" method="post" onsubmit="return false;">
			<input type="hidden"  id="prjId" name="prjId"  value="<c:out value='${etcInfo.prjId}'/>" />
			<input type="hidden"  id="beforePrjId" name="beforePrjId"  value="" />
			<input type ="hidden" id="beforePrjNm" name="beforePrjNm" value="" />	
			<div class="pop_menu_row first_menu_row"style="margin-top:7px;" >
				<div class="pop_menu_col1 pop_menu_col1_right"><label for="usrPrjCd">메인 프로젝트<span class="required_info">&nbsp;*</span></label></div>
				<div class="pop_menu_col2 pop_menu_col1_left"  style="display:inline-flex;" guide="mainProject">
					<input type="text" title="메인 프로젝트 선택" class="" id="popPrjNm" name="popPrjNm" value="" maxlength="200" >
					<span class="button_check search_btn" id="btn_search_project">검색</span>
				</div>
			</div>
			<div class="btn_div">
				<div class="button_normal save_btn password_inputBox" id="btn_update_etcPopup">확인</div>
				<div class="button_normal exit_btn password_inputBox" id="btn_cancle_popup">취소</div>	
			</div>
		</form>	
	</div>
</div>
</html>