<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>SW형상관리시범체계</title>
	 
	<link rel="stylesheet" href="<c:url value='/css/common/common.css' />" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/css/oslops/cmm.css'/>" type="text/css" />
	<script src="<c:url value='/js/jquery/jquery-1.11.2.min.js'/>"></script>
	
	<style>
		/* 팝업 영역 */
		.layer_popup{max-height: 100%;height: 100%;width: 100%;}
		.popup{overflow-y: auto; display: block;width: 100%;height: 100%;background: #fff;font-size: 0.75em;}
	
		/* 팝업 타이틀 영역 */
		.layer_popup .pop_title {width: 100%; height: 45px;padding: 0px 15px;background: #4b73eb;color: #fff;font-size: 1.5em;line-height: 43px;font-weight: bold;}
		/* 팝업 내용 영역 */
		.layer_popup .pop_sub {width: 100%;padding: 20px 20px;text-align: center;}
		
		/* 팝업 버튼 영역*/
		.layer_popup .btn_div {width: 100%;display: inline-block;margin-top: 17px;}
		/* 팝업 버튼 */
		.layer_popup .button_normal {display: inline-block;min-width: 71px;width: 55px !important;height: 34px !important; line-height: 34px !important;text-align: center; font-weight: bold;font-size: 1.2em;border-radius: 0 !important;box-shadow: 1px 1px 1px #ccd4eb;box-sizing: border-box; margin: 0 auto; padding: 0px 10px;border: 1px solid #b8b8b8; cursor: pointer;}

		/* 팝업 content row */
		.pop_oneRow{float: left;width: 100%;}
		.content{border: 1px solid #c6c9d0;text-align:left;}
		
		/* 실제 팝업 내용 - 해당 클래스가 있을경우 1줄씩 팝업에 표시 */
		.content-text{width: 100%;float: left;margin: 10px;padding-left: 10px;}
		/* 실제 내용 중 첫번째, 마지막 내용의 margin 조정 */
		.content .content-text:first-child{margin-top: 20px;}
		.content .content-text:last-child{margin-bottom: 20px;}
		
		
		/* 오늘 하루동안 보지않기 체크박스 및 문구 */
		.viewCheck input[type="checkbox"]{margin: 12px 0px 0px -13px;opacity: 0;}
		.viewCheck input[type="checkbox"]+label{ display: inline-block; width: 18px; height: 18px;background: url(/images/contents/normal_check.png) no-repeat; font-size: 1em; line-height: 24px;vertical-align: middle; cursor: pointer; z-index: 1; border-radius: 3px;}
    	.viewCheck input[type="checkbox"]:checked+label {display: inline-block;width: 18px; height: 18px; background: url(/images/contents/normal_check_on.png) no-repeat;line-height: 24px;vertical-align: middle;cursor: pointer;}
    	.viewCheck label{max-width: 100%; margin-bottom: 5px;font-weight: bol}
		.viewCheck span{padding-left: 5px;}
		.check-text{cursor: pointer;}
		
		
		/* 
		 * 글 정렬, 글자 크기, 여백, 글자 배경색 등은 아래의 CSS를 사용한다.   
		 *
		 * 1. 본문내용 추가
		 *   : '긴급점검 작업 안내드립니다.' 라는 내용을 추가
		 *
		 *  팝업 내용 영역인 <div class="pop_oneRow content"><div> 안에 다음과 같이 추가한다.
		 *
		 *  <div class="pop_oneRow content">
		 *		<span class="content-text" >긴급점검 작업 안내드립니다.</span>
		 *  </div>
		 *  
		 *
		 *
		 * 2. 글자크기 22px로 변경
		 *   : span 태그의 class에 원하는 글자 크기를 지정한다.
		 *
		 * <span class="content-text font-s22" >긴급점검 작업 안내드립니다.</span> => 글자 크기가 22px로 변경된다
		 *
		 *
		 * 
		 * 3. 글자 bold 추가
		 *   : span 태그의 class에 font-bold 클래스를 추가한다.
		 *
		 *  <span class="content-text font-s22 font-bold" >긴급점검 작업 안내드립니다.</span>  => 글자가 bold 처리된다.
		 *
		 *
		 * 4. 위쪽 외부여백(margin) 추가
		 *   : 다음과 같이 본문 내용이 되어있을 경우 되어있을 경우
		 *
		 *  <span class="content-text font-s22" >긴급점검 작업 안내드립니다.</span>
		 *  <span class="content-text font-s23" >점검시간 : 금일 14:00 ~ 16:00 </span>
		 *
		 *  화면상에서는 '긴급점검 작업 안내드립니다.' 와 '점검시간 : 금일 14:00 ~ 16:00' 문구의 기본 외부여백(margin)은 10px로 보여진다.
		 *  만약 두 내용의 여백을 더 주고 싶다면 다음과 같이 설정한다.
		 *
		 *  <span class="content-text font-s22" >긴급점검 작업 안내드립니다.</span>
		 *  <span class="content-text font-s23 margin-top-20" >점검시간 : 금일 14:00 ~ 16:00 </span>  => 위쪽 외부여백이 20px로 변경되어 위 아해 글 내용이 떠 떨어져서 보여진다.
		 *
		 *
		 * 
		 * 5. 본문내용 글자 배경추가
		 *   : 다음과 같은 본문내용에 배경 추가할 경우
		 *   <span class="content-text font-s22" >긴급점검 작업 안내드립니다.</span>
		 *
		 *   본문내용을 <span class="highlighter-yellow"></span> 안에 추가해준다.
		 *
		 *   <span class="content-text font-s22" >
		 *		<span class="highlighter-yellow">긴급점검 작업 안내드립니다.</span>  => '긴급점검 작업 안내드립니다.' 내용에 노랑색 배경이 추가된다. 
		 *	 </span> 
		 *
		 */
		
		
		/* 
		 * 글자 배경색 지정
		 * 글자 배경색은 RGB 코드값을 이용하여 추가한다.
		 *
		 * (예) 밝은 회색 배경을 추가할 경우
		 * .highlighter-light-gray{background-color: #D8D8D8}
		 * 
		 */
		.highlighter-yellow{background-color: #ffff00;}
		
		/* text 정렬 */
		.text-left{text-align:left;}
		.text-right{text-align:right;}
		.text-center{text-align:center;}
		
		/* margin(외부여백) 설정 - 위, 아래, 왼쪽, 오른쪽 */
		.margin-top-0{margin-top:0px;}
		.margin-top-5{margin-top:5px;}
		.margin-top-10{margin-top:10px;}
		.margin-top-15{margin-top:15px;}
		.margin-top-20{margin-top:20px;}
		
		.margin-bottom-0{margin-bottom:0px;}
		.margin-bottom-5{margin-bottom:5px;}
		.margin-bottom-10{margin-bottom:10px;}
		.margin-bottom-15{margin-bottom:15px;}
		.margin-bottom-20{margin-bottom:20px;}
		
		.margin-left-0{margin-left:0px;}
		.margin-left-5{margin-left:5px;}
		.margin-left-10{margin-left:10px;}
		.margin-left-15{margin-left:15px;}
		.margin-left-20{margin-left:20px;}
		
		.margin-right-0{margin-right:0px;}
		.margin-right-5{margin-right:5px;}
		.margin-right-10{margin-right:10px;}
		.margin-right-15{margin-right:15px;}
		.margin-right-20{margin-right:20px;}
		
		/* padding(내부여백) 설정 - 위, 아래, 왼쪽, 오른쪽 */
		.padding-top-0{paddint-top:0px;}
		.padding-top-5{paddint-top:5px;}
		.padding-top-10{paddint-top:10px;}
		.padding-top-15{paddint-top:15px;}
		.padding-top-20{paddint-top:20px;}
		
		.padding-bottom-0{paddint-bottom:0px;}
		.padding-bottom-5{paddint-bottom:5px;}
		.padding-bottom-10{paddint-bottom:10px;}
		.padding-bottom-15{paddint-bottom:15px;}
		.padding-bottom-20{paddint-bottom:20px;}
		
		.padding-left-0{paddint-left:0px;}
		.padding-left-5{paddint-left:0px;}
		.padding-left-10{paddint-left:0px;}
		.padding-left-15{paddint-left:0px;}
		.padding-left-20{paddint-left:0px;}
		
		.padding-right-0{paddint-top:0px;}
		.padding-right-5{paddint-top:5px;}
		.padding-right-10{paddint-top:10px;}
		.padding-right-15{paddint-top:15px;}
		.padding-right-20{paddint-top:20px;}
		
		/* 글자 bold 처리 - 해당 class 추가시 글자 bold */
		.font-bold{font-weight: bold;}
		
		/* 
		 * 글자 size 지정 - 해당 class 추가하여 글자 크기 변경
		 * 글자 크기 추가시 다음과 같이 추가하여 사용한다. ( 예. 25px 글자 크기 추가 )
		 * .font-s25{font-size:25px;}   
		 */
		.font-s13{font-size:13px;}
		.font-s14{font-size:14px;}
		.font-s15{font-size:15px;}
		.font-s16{font-size:16px;}
		.font-s17{font-size:17px;}
		.font-s18{font-size:18px;}
		.font-s19{font-size:19px;}
		.font-s20{font-size:20px;}
		.font-s21{font-size:21px;}
		.font-s22{font-size:22px;}
		.font-s23{font-size:23px;}
	</style>
	
	<script>
		$(document).ready(function() {
			// 메인팝업 닫기 버튼 클릭
			$("#btn_cancle_mainPopup").click(function(){
				
				// 오늘하루 동안 보지 않기 체크
				var viewChecked = $("#viewYn").is(":checked"); 
				if(viewChecked){
					// 체크되어있을 경우 쿠키 생성하여 하루동안(00:00까지) 보이지 않도록 설정 - 쿠키 생성
					setCookie("mainPopViewCookie", "mainPopView", 1);
				}
				
				window.close();
			});
			
			// 오늘 하루동안 보지 않기 문구 클릭 시 체크박스 체크 
			$(".check-text").click(function(){
				if($("#viewYn").is(":checked")){ // 체크되어있을 경우
					$("#viewYn").prop("checked",false);
				}else{ // 체크되어있지 않을 경우
					$("#viewYn").prop("checked",true);
				}
			});
		});
		
		
		/*
		 * 오늘 새벽 00:00까지 지속되는 쿠키를 생성한다.
		 * @param cookieName 쿠키이름
		 * @param cookieValue 쿠키값
		 */
		function setCookie(cookieName, cookieValue, exdays) {   
			var todayDate = new Date();   
		    todayDate = new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);  
		    if( todayDate > new Date() )  {  
		    	exdays = exdays - 1;  
		    }  
			todayDate.setDate( todayDate.getDate() + exdays );   
			document.cookie = cookieName + "=" + escape( cookieValue ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		} 

		
	</script>
</head>

<body>
	<div class="layer_popup">
		<div class="popup">
			<!-- 팝업 제목 영역 -->
			<div class="pop_title text-left">인사시스템 점검안내</div>
			<div class="pop_sub">
				<!-- 팝업 내용 영역 시작 -->
				<div class="pop_oneRow content">
					<!-- content-text 클래스 지정시 왼쪽 정렬, 한줄로 내용 표시 -->
					<span class="content-text font-s23 font-bold"><span class="highlighter-yellow">-인사업무 일시 중단안내</span></span>
					<span class="content-text font-s16 margin-bottom-0" >인사시스템 서버 점검 작업으로</span>
					<span class="content-text font-s16 margin-top-5">인사시스템 서비스가 일시 중단되오니 업무에 참고하시기 바랍니다.</span>
					<span class="content-text font-s23 font-bold margin-bottom-0">점검일자 : 2020.4.20.(화) 18:00 ~ 4.24.(수) 09:00</span>
					<span class="content-text font-s16 margin-top-5">* 종료시간은 사정에 따라 변경될 수 있습니다.</span>
					<span class="content-text font-s16 margin-top-5">* 점검기간중 인사시스템 문의는 인사업무 담당자에게 연락 바랍니다.</span>
					<span class="content-text font-s16">문의사항 : 인사업무 담당자(0001-0000, 1234, 5678)</span>
				</div>
				<!-- 팝업내용 영역 끝 -->
				
				<!-- 오늘 하루동안 보지 않기 체크박스 -->
				<div class="pop_oneRow text-left viewCheck">
					<input type="checkbox" title="하루동안 보지않기" class="input_txt" name="viewYn" id="viewYn">
					<label for="viewYn"></label><span class="check-text font-s13">오늘 하루동안 보지 않기</span>
				</div>
				<!-- 팝업 버튼 영역 -->
				<div class="btn_div">
					<div class="button_normal exit_btn" id="btn_cancle_mainPopup" title="팝업 닫기">닫기</div>
				</div>
			</div>
		</div>
	</div>
</body>	
</html>