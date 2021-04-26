<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
<input type="hidden" name="path" id="path" value="<c:out value='${param.path}'/>">
<input type="hidden" name="revision" id="revision" value="<c:out value='${param.revision}'/>">
<div class="kt-padding-15 osl-max-h-px--590 osl-contents-frame">
	<div class="osl-code__line-frame" id="codeLineFrame"></div>
	<pre id="preContent">
		<code class="osl-code-bg" id="stm8003FileInfo">
		</code>
	</pre>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm8003Popup = function() {
	var type = $("#type").val();
	var strgRepId = $("#strgRepId").val();
	var revision = $("#revision").val();
	var path = $("#path").val();

	//기본 설정
	 var documentSetting = function() {
		//파일 정보 가져오기
		getFileInfo();
	}
	
	/**
	* function 명 	: getFileInfo
	* function 설명	: 리비전 파일 상세 정보 가져오기
	*/
	var getFileInfo = function(){
		var data = {
				type : type,
				filePath: path,
				revision : revision,
				strgRepId : strgRepId
			};

		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000RevisionFileInfoAjax.do'/>", "async":false}
   				, data);
		
   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				// 콘솔로그 표시 부분에 에러 메시지 표시
				$("#stm8003FileInfo").html(data.message);
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
	   			// 조회한 콘솔 로그를 표시
				// 로그가 없을 경우
				if($.osl.isNull(data.contentInfo)){
					$("#stm8003FileInfo").html("<span class='kt-font-inverse-brand  kt-padding-l-10 osl-font-lg osl-font'>"+"로그가 없습니다."+"</span>");
					return false;
				}else{
					//콘솔 로그 출력
		   			$("#stm8003FileInfo").html($.osl.escapeHtml(data.contentInfo));
		   			$("#stm8003FileInfo").each(function(i, block) {hljs.highlightBlock(block);});
		   			
		   			//코드 라인 수
					var codeLineCnt = 0;
					
					if(!$.osl.isNull(data.contentInfo)){
						//라인 자르기
						var codeLine = data.contentInfo.split("\n");
						codeLineCnt = codeLine.length;
						
						//코드 창 크기 높이
						var codeWindowHeight = $("#preContent").height() - 50;
						
						//스크롤바 높이 제외
						codeWindowHeight = codeWindowHeight;
						
						//라인 마다 스크롤 높이 구하기
						var codeScrollLine = parseFloat((codeWindowHeight/codeLineCnt));
						
						//스크롤 색상변경 계산
						$.each(codeLine, function(idx, map){
							//osl-code__text-addl 있는지 체크
							if(map.indexOf('osl-code__text-add') != -1){
								
								//해당 라인 스크롤 위치 구하기
								var targetLineScrollTop = ((idx+1)*codeScrollLine);
								targetLineScrollTop += 44;
								
								$("#stm8003FileInfo").append('<div class="osl-code__diff-line-scroll-defore" style="top:'+targetLineScrollTop+'px;"></div>');
							}
						});
						
						//코드 라인 부여
						for(var i=0;i<codeLineCnt;i++){
							$("#codeLineFrame").append('<div class="osl-code__line-div">'+(i+1)+'</div>');
						}
						
						$("#stm8003FileInfo").prepend($("#codeLineFrame"));
					}
				}
	   			
   			}
   		});
  	 	//AJAX 전송
   		ajaxObj.send();
	};

	return {
		init: function(){
			documentSetting();
		}
	};
 }();
 
 $.osl.ready(function(){
	 OSLStm8003Popup.init();
 });
</script>
