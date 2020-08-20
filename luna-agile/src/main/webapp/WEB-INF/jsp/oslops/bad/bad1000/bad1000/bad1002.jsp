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
 text-align: left;
}

.bad_chk input[type="checkbox"] {
    margin: 6px 0px 0px 0px;
    opacity: 0;
    cursor: default;
}

.bad_chk input[type="checkbox"]+label {
    display: inline-block;
    width: 18px;
    height: 18px;
    background: url(/images/contents/normal_check.png) no-repeat;
    font-size: 1em;
    line-height: 24px;
    vertical-align: middle;
    z-index: 1;
    cursor: default;
    border-radius: 3px;
}

.bad_chk input[type="checkbox"]:checked+label {
    display: inline-block;
    width: 18px;
    height: 18px;
    background: url(/images/contents/normal_check_on.png) no-repeat;
    line-height: 24px;
    vertical-align: middle;
}

</style>
<script>
var fd = new FormData();

// api 유효성
var arrChkObj = {	"badTitle":{"type":"length","msg":"제목은 500byte까지 입력이 가능합니다.",max:500},
				     "badContent":{"type":"length","msg":"내용은 1000byte까지 입력이 가능합니다.",max:1000}
				};
// 어느 페이지에서 공지사항 상세보기 팝업을 호출했는지 확인값
var viewType = "${param.view}";

$(document).ready(function() {
	
	/* 취소버튼 클릭 시 팝업 창 사라지기*/
	$('#btn_cancle_popup').click(function() {
		
		// 대시보드에서 공지사항 상세정보 조회
		if(!gfnIsNull(viewType) && viewType == "dsh1000"){
			// 대시보드의 공지사항 그리드 재조회
			fnInGridListSetting(gridObj["boardNotice"].page.currentPage,"&mode=dashboard&reqProType=01",gridObj["boardNotice"],"<c:url value='/bad/bad1000/bad1000/selectbad1000BoardListAjaxView.do'/>",false);
		}else{
			// 상세보기 팝업 닫을 시 그리드 재조회 - 조회수 변경 반영
			fnInGridListSet(firstGrid.page.currentPage,$('form#searchFrm').serialize()+"&"+mySearch.getParam(), false);
		}
		
		gfnLayerPopupClose();
	});

	
});


</script>

<div class="popup" id="aaa">
<form id="bad1001PopupFrm" name="bad1001PopupFrm" method="post">

	<div class="pop_title">공지사항 상세정보</div>
	<div class="pop_sub">

		<div class="pop_menu_row pop_menu_oneRow" style="border-top: 1px solid #ddd;">
			<div class="pop_menu_col1 pop_oneRow_col1"><label for=badTitle>제목</label><span class="required_info">&nbsp;*</span></div>
			<div class="pop_menu_col2 pop_oneRow_col2">
				<input type="text" title="글제목" class="input_txt readonly" name="badTitle" id="badTitle" value="<c:out value='${badDetailInfo.badTitle}' />" maxlength="500" readonly="readonly"/>
			</div>
		</div>
		
		<div class="pop_menu_row">
			<div class="pop_menu_col1"><label for="usrId">등록자</label></div>
			<div class="pop_menu_col2 pop_col2_input"><input type="text" title="등록자" class="input_txt readonly" name="usrNm" id="usrNm" value="<c:out value="${badDetailInfo.usrNm}"/>" readonly="readonly"/></div>
		</div>
		<div class="pop_menu_row">	
			<div class="pop_menu_col1 pop_menu_col1_long1  pop_menu_col1_right"><label for="usrPositionCdNm">계급</label></div>
			<div class="pop_menu_col2 pop_menu_col2_long2 pop_col2_input"><input type="text" title="계급" class="input_txt readonly" name="usrPositionCdNm" id="usrPositionCdNm" value="<c:out value="${badDetailInfo.usrPositionCdNm}"/>" readonly="readonly"/></div>
		</div>
		<div class="pop_menu_row">
			<div class="pop_menu_col1"><label for="regDtm">등록일</label></div>
			<div class="pop_menu_col2 pop_col2_input"><input type="text" title="등록일" class="input_txt readonly" name="regDtm" id="regDtm" value="${badDetailInfo.regDtm}" readonly="readonly"/></div>
		</div>
		<div class="pop_menu_row">
			<div class="pop_menu_col1 pop_menu_col1_long1 pop_menu_col1_right"><label for="badCnt">조회수 </label></div>
			<div class="pop_menu_col2 pop_menu_col2_long2 bad_chk">
				<input type="text" title="조회수" class="input_txt readonly" name="badCnt" id="badCnt" value="${badDetailInfo.badCnt}" readonly="readonly"/>
			</div>	
		</div>
		<div class="pop_menu_row">
			<div class="pop_menu_col1"><label for="modifyDtm">수정일</label></div>
			<div class="pop_menu_col2 pop_col2_input"><input type="text" title="등록자" class="input_txt readonly" name="modifyDtm" id="modifyDtm" value="${badDetailInfo.modifyDtm}" readonly="readonly"/></div>
		</div>
		<div class="pop_menu_row">	
			<div class="pop_menu_col1 pop_menu_col1_long1 pop_menu_col1_right"><label for="noticeYn">공지사항 여부 </label></div>
			<div class="pop_menu_col2 pop_menu_col2_long2 bad_chk">
				<input type="checkbox" title="공지사항 여부" class="input_txt" name="noticeYn" id="noticeYn" disabled="disabled" <c:if test="${badDetailInfo.noticeYn == 'Y'}">checked</c:if>/><label for="noticeYn"></label>
			</div>
		</div>
		<div class="pop_note" style="margin-bottom:10px;">
			<div class="note_title">공지사항 내용<span class="required_info">&nbsp;*</span></div>
			<div id="badContent" name="badContent" class="input_note" title="공지사항 내용" rows="10" value="">
				<c:out value="${badDetailInfo.badContent}" />
			</div>
		</div>
		
		<div class="btn_div">
			<div class="button_normal exit_btn" id="btn_cancle_popup">닫기</div>
		</div>
	</div>
	

</form>
</div>
</html>
