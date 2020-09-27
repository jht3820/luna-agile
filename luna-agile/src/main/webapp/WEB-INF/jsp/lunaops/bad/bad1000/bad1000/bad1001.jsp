<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<title>OpenSoftLab</title>
<script src="<c:url value='/js/common/comOslops.js'/>"></script>
<!-- <link href="/css/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"> -->
<style>
.required_info { color: red; }

.pop_menu_col1_long1 { width:40% !important; }
.pop_menu_col2_long2 { width:60% !important; }

.btn_div {margin-top: 20px !important; }
.summernoteFrame .dropdown-toggle::after{display:none;}
div#layoutOptionContents {
    border: 1px solid #ededed;
    padding: 5px 0;
}

#badContent {
 height: 300px;
}

.bad_chk input[type="checkbox"] {
    margin: 6px 0px 0px 0px;
    opacity: 0;
}

.bad_chk input[type="checkbox"]+label {
    display: inline-block;
    width: 18px;
    height: 18px;
    background: url(/images/contents/normal_check.png) no-repeat;
    font-size: 1em;
    line-height: 24px;
    vertical-align: middle;
    cursor: pointer;
    z-index: 1;
    border-radius: 3px;
}

.bad_chk input[type="checkbox"]:checked+label {
    display: inline-block;
    width: 18px;
    height: 18px;
    background: url(/images/contents/normal_check_on.png) no-repeat;
    line-height: 24px;
    vertical-align: middle;
    cursor: pointer;
}
</style>
<script>
var fd = new FormData();

// 등록/수정 구분값
var type = '${param.popupGb}';

// api 유효성
var arrChkObj = {	"badTitle":{"type":"length","msg":"제목은 500byte까지 입력이 가능합니다.",max:500},
				     "badContent":{"type":"length","msg":"내용은 1000byte까지 입력이 가능합니다.",max:1000}
				};

$(document).ready(function() {
	$("#badTitle").focus();
	
	// 유효성 체크	
	gfnInputValChk(arrChkObj);
	
	var serverTime=gfnGetServerTime('yyyy-mm-dd');

	$('#regDtm').val(serverTime);
	
	/* 타이틀 변경 및 버튼명 변경, 수정일경우 값 세팅 */
	if(type == 'insert'){
		$(".pop_title").text("공지사항 등록");
		$("#btn_save_popup").text('등록');
	}
	else if(type == 'update'){
		$(".pop_title").text("공지사항 수정");
		$("#btn_save_popup").text('수정');
		
		var badId = '${param.badId}';
		fnSelectBad1001Info(badId);
	}
	
	/**
	 * 	공지사항 하나 선택했을때 공지사항 디테일 정보 조회
	 */
 	function fnSelectBad1001Info(badId){
		//AJAX 설정
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/bad/bad1000/bad1000/selectbad1001InfoAjax.do'/>"}
				,{ "badId" : badId });
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
        	
			if(data.errorYn == 'Y') {
				toast.push("조회에 실패하였습니다.");
				return;
			} else {
				toast.push("조회에 성공하였습니다.")
			}
			
        	//디테일폼 세팅
        	gfnSetData2ParentObj(data.badDetailInfo, "bad1001PopupFrm");
        	if(data.badDetailInfo.noticeYn == 'Y') {
        		$("#noticeYn").prop("checked",true);
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
	
	/* 등록/수정버튼 클릭 시 */
	$('#btn_save_popup').click(function() {
		
		/* 필수입력값 체크 공통 호출 */
		var strFormId = "bad1001PopupFrm";
		var strCheckObjArr = ["badTitle", "badContent"];
		var sCheckObjNmArr = ["제목", "내용" ];
		if(gfnRequireCheck(strFormId, strCheckObjArr, sCheckObjNmArr)){
			return;	
		}
		
		var formObj = document.getElementById("bad1001PopupFrm");
		
		// 등록/수정 전 유효성 체크
		if(!gfnSaveInputValChk(arrChkObj)){
			return false;	
		}	
		
		fnInsertBadInfoAjax("bad1001PopupFrm");
	});
	
	/* 취소버튼 클릭 시 팝업 창 사라지기*/
	$('#btn_cancle_popup').click(function() {
		
		gfnLayerPopupClose();
	});

	
});

// 공지여부 체크박스 클릭 
function noticeClick() {
	// true면 공지사항 체크
	var chk = $("#noticeYn").is(":checked");
	
	if(chk) {
		$("#noticeYn").val("Y");
		$("#noticeYn").prop("checked", true);
	} else {
		$("#noticeYn").val("N");
		$("#noticeYn").prop("checked", false);
	}
}


//공지사항 등록 함수
function fnInsertBadInfoAjax(formId){
	
	jConfirm("저장하시겠습니까?", "알림", function( result ) {
		if( result ){
			
			//FormData에 input값 넣기
			gfnFormDataAutoValue('bad1001PopupFrm',fd);
			//AJAX 설정
			var ajaxObj = new gfnAjaxRequestAction(
					{"url":"<c:url value='/bad/bad1000/bad1000/saveBad1001InfoAjax.do'/>"
						,"contentType":false
						,"processData":false
						,"cache":false}
					,fd);
			//AJAX 전송 성공 함수
			ajaxObj.setFnSuccess(function(data){
				data = JSON.parse(data);
		    	//로딩바 숨김
		    	gfnShowLoadingBar(false);
		    	
		    	//등록 실패의 경우 리턴
		    	if(data.errorYn == 'Y'){
		    		toast.push(data.message);
		    		return false;
		    	}	
		    	
		    	// 등록 일 경우
		    	if(type == "insert"){
		    		// 첫번째 페이지로 새로고침
					fnInGridListSet(0,$('form#searchFrm').serialize()+"&"+mySearch.getParam(), true);
		    	// 수정일 경우	
		    	}else if(type == "update"){
		    		//그리드 현재페이지 및 검색정보로 새로고침
					fnInGridListSet(firstGrid.page.currentPage,$('form#searchFrm').serialize()+"&"+mySearch.getParam(), true);
		    	}
		    	
		    	
		    	jAlert(data.message, '알림창');
				gfnLayerPopupClose();
			});
			
			//AJAX 전송 오류 함수
			ajaxObj.setFnError(function(xhr, status, err){
				toast.push(xhr.status+"("+err+")"+" 에러가 발생했습니다.");
		    	gfnLayerPopupClose();
			});
			//AJAX 전송
			ajaxObj.send();
		}
	});
}


</script>

<div class="popup" id="aaa">
<form id="bad1001PopupFrm" name="bad1001PopupFrm" method="post">
	<input type="hidden" name="popupGb" id="popupGb" value="${param.popupGb}"/>
	<input type="hidden" name="badId" id="badId" value="${param.badId}" />
	<input type="hidden" name="prjId" id="prjId" value="${sessionScope.selPrjId}"/>
	<input type="hidden" name="usrId" id="usrId" value="${sessionScope.loginVO.usrId}"/>

	<div class="pop_title">공지사항 등록</div>
	<div class="pop_sub">

		<div class="pop_menu_row pop_menu_oneRow" style="border-top: 1px solid #ddd;">
			<div class="pop_menu_col1 pop_oneRow_col1"><label for=badTitle>제목</label><span class="required_info">&nbsp;*</span></div>
			<div class="pop_menu_col2 pop_oneRow_col2">
				<input type="text" title="글제목" class="input_txt" name="badTitle" id="badTitle" value="" maxlength="500" />
			</div>
		</div>
		
		<div class="pop_menu_row">
			<div class="pop_menu_col1"><label for="usrId">등록자</label></div>
			<div class="pop_menu_col2 pop_col2_input"><input type="text" title="등록자" class="input_txt" name="usrNm" id="usrNm" readonly value="<c:out value="${sessionScope.loginVO.usrNm}"/>"  /></div>
		</div>
		<div class="pop_menu_row">	
			<div class="pop_menu_col1 pop_menu_col1_long1 pop_menu_col1_right"><label for="notice">공지사항 여부</label></div>
			<div class="pop_menu_col2 pop_menu_col2_long2 bad_chk">
				<input type="checkbox" title="공지사항 여부" class="input_txt" name="noticeYn" id="noticeYn"
				 readonly value="N" onclick="noticeClick()" />
				<label for="noticeYn"></label>
			</div>
		</div>
		
		
		<div class="pop_note" style="margin-bottom:10px;">
			<div class="note_title">공지사항 내용<span class="required_info">&nbsp;*</span></div>
		<!-- 	<div class="summernoteFrame">
				<div id="layoutOptionContents"></div>
			</div> -->
			<textarea id="badContent" name="badContent" class="input_note" title="공지사항 내용" rows="10" value=""></textarea>
		</div>
		
		<div class="btn_div">
			<div class="button_normal save_btn" id="btn_save_popup"></div>
			<div class="button_normal exit_btn" id="btn_cancle_popup">취소</div>
		</div>
	</div>
	

</form>
</div>
</html>
