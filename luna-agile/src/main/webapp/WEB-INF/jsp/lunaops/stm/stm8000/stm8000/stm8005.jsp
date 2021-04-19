<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
<input type="hidden" name="filePath" id="filePath" value="<c:out value='${param.filePath}'/>">
<input type="hidden" name="fileName" id="fileName" value="<c:out value='${param.fileName}'/>">
<input type="hidden" name="diffRevision01" id="diffRevision01" value="<c:out value='${param.diffRevision01}'/>">
<input type="hidden" name="diffRevision02" id="diffRevision02" value="<c:out value='${param.diffRevision02}'/>">
<div class="row">
	<div class="col-lg-6 col-md-6 col-sm-12 col-12 kt-padding-b-10">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label kt-portlet__head--lg">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>
						<span id="beforeRevision"></span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
					</div>
				</div>
			</div>
			<div class="kt-portlet__body kt-padding-15 osl-min-h-px--575 osl-contents-frame">
				<div class="osl-code__line-frame" id="codeLineFrameBefore"></div>
				<pre id="preBefore">
					<code class="osl-code-bg" id="stm8005BeforeFileInfo">
					</code>
				</pre>
			</div>
		</div>
	</div>
	<div class="col-lg-6 col-md-6 col-sm-12 col-12 kt-padding-b-10">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label kt-portlet__head--lg">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>
						<span id="afterRevision"></span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
					</div>
				</div>
			</div>
			<div class="kt-portlet__body kt-padding-15 osl-min-h-px--575 osl-contents-frame">
				<div class="osl-code__line-frame" id="codeLineFrameAfter"></div>
				<pre id="preAfter">
					<code class="osl-code-bg" id="stm8005AfterFileInfo">
					</code>
				</pre>
			</div>
		</div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm8005Popup = function() {
	var type = $("#type").val();
	var strgRepId = $("#strgRepId").val();
	var filePath = $("#filePath").val();
	var fileName = $("#fileName").val();
	var diffRevision01 = $("#diffRevision01").val();
	var diffRevision02 = $("#diffRevision02").val();
	
	//기본 설정
	 var documentSetting = function() {
		 getFileDiffInfo();
	}
	
	/**
	* function 명 	: getFileDiffInfo
	* function 설명	: 파일 Diff 정보 가져오기
	* param : 비교할 파일 revision
	*/
	var getFileDiffInfo = function(){
		
		var data = {
				type : type,
				strgRepId : strgRepId,
				filePath : filePath,
				diffRevision01 :diffRevision01,
				diffRevision02 :diffRevision02,
			};

		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000FileDiffInfoAjax.do'/>", "async":false}
   				, data);
		
   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				// 콘솔로그 표시 부분에 에러 메시지 표시
				$("#stm8005BeforeFileInfo").html(data.message);
				$("#stm8005AfterFileInfo").html(data.message);
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				$("#beforeRevision").text("[Revision "+data.beforeRevision+"] "+ fileName);
   				$("#afterRevision").text("[Revision "+data.afterRevision+"] " + fileName);
   				
   				var beforeContent = data.beforeContent;
   				var afterContent = data.afterContent;
   				
	   			// 조회한 콘솔 로그를 표시
				// 로그가 없을 경우
				if($.osl.isNull(beforeContent)){
					$("#stm8005BeforeFileInfo").html("<span class='kt-font-inverse-brand  kt-padding-l-10 osl-font-lg osl-font'>"+"로그가 없습니다."+"</span>");
					return false;
				}
	   			
				// 로그가 없을 경우
				if($.osl.isNull(afterContent)){
					$("#stm8005AfterFileInfo").html("<span class='kt-font-inverse-brand  kt-padding-l-10 osl-font-lg osl-font'>"+"로그가 없습니다."+"</span>");
					return false;
				}
				
				$("#stm8005BeforeFileInfo").html($.osl.escapeHtml(beforeContent));
				$("#stm8005BeforeFileInfo").each(function(i, block) {hljs.highlightBlock(block);});
				$("#stm8005AfterFileInfo").html($.osl.escapeHtml(afterContent));
				$("#stm8005AfterFileInfo").each(function(i, block) {hljs.highlightBlock(block);});
	   			 
				//비교 후 결과 값
				var oldVal = "";
				var newVal = "";
				//문자열 비교
				var dmp = new diff_match_patch();
				var diffs = dmp.diff_main($('#stm8005BeforeFileInfo').html(), $('#stm8005AfterFileInfo').html());
				dmp.diff_cleanupEfficiency(diffs);
				
				//문자열 비교 값 loop돌면서 class 입히기
				for (var i = 0, j = diffs.length; i < j; i++) {
			        var arr = diffs[i];
			        if (arr[0] == 0) {	//변화 없음
			            oldVal += arr[1];
			            newVal += arr[1];
			        } else if (arr[0] == -1) { //이전 값에서 제거
			            oldVal += "<span class='osl-code__text-remove'>" + arr[1] + "</span>";
			        } else { //변경 값에서 추가
			            newVal += "<span class='osl-code__text-add'>" + arr[1] + "</span>";
			        }
			    }
				
				$("#stm8005BeforeFileInfo").html(oldVal);
				$("#stm8005AfterFileInfo").html(newVal);
				
				//코드 라인 수
				var beforeCodeLineCnt = 0;
				var afterCodeLineCnt = 0;
				
				//이전 코드 라인 수
				if(!$.osl.isNull(oldVal)){
					//라인 자르기
					var beforeCodeLine = newVal.split("\n");
					beforeCodeLineCnt = beforeCodeLine.length;
					
					//코드 창 크기 높이
					var codeWindowHeight = $("#preBefore").height() - 50;
					
					//스크롤바 높이 제외
					codeWindowHeight = codeWindowHeight;
					
					//라인 마다 스크롤 높이 구하기
					var codeScrollLine = parseFloat((codeWindowHeight/beforeCodeLineCnt));
					
					//스크롤 색상변경 계산
					$.each(beforeCodeLine, function(idx, map){
						//osl-code__text-addl 있는지 체크
						if(map.indexOf('osl-code__text-add') != -1){
							
							//해당 라인 스크롤 위치 구하기
							var targetLineScrollTop = ((idx+1)*codeScrollLine);
							targetLineScrollTop += 44;
							
							$("#contentsFrameBefore").append('<div class="osl-code__diff-line-scroll-defore" style="top:'+targetLineScrollTop+'px;"></div>');
						}
					});
				}
				//변경 후 코드 라인 수
				if(!$.osl.isNull(newVal)){
					//라인 자르기
					var afterCodeLine = oldVal.split("\n");
					afterCodeLineCnt = afterCodeLine.length;
					
					//코드 창 크기 높이
					var codeWindowHeight = $("#preAfter").height() - 50;
					
					//라인 마다 스크롤 높이 구하기
					var codeScrollLine = parseFloat((codeWindowHeight/afterCodeLineCnt));
					
					//스크롤 색상변경 계산
					$.each(afterCodeLine, function(idx, map){
						//osl-code__text-remove 있는지 체크
						if(map.indexOf('osl-code__text-remove') != -1){
							//해당 라인 스크롤 위치 구하기 (기본 Top 84px)
							var targetLineScrollTop = ((idx+1)*codeScrollLine);
							targetLineScrollTop += 44;
							
							$("#contentsFrameAfter").append('<div class="osl-code__diff-line-scroll-after" style="top:'+targetLineScrollTop+'px;"></div>');
						}
					});
				}
				
				//코드 라인 부여
				for(var i=0;i<beforeCodeLineCnt;i++){
					$("#codeLineFrameBefore").append('<div class="osl-code__line-div">'+(i+1)+'</div>');
				}
				for(var i=0;i<afterCodeLineCnt;i++){
					$("#codeLineFrameAfter").append('<div class="osl-code__line-div">'+(i+1)+'</div>');
				}
				
				$("#stm8005BeforeFileInfo").prepend($("#codeLineFrameBefore"));
				$("#stm8005AfterFileInfo").prepend($("#codeLineFrameAfter"));
				
				//가로 스크롤 동시 제어
				$("#preBefore").scroll(function(){
					//우측 가로,세로 스크롤 제어
					$('#preAfter').scrollTop($("#preBefore").scrollTop());
					$('#preAfter').scrollLeft($("#preBefore").scrollLeft());
					
					//코드 라인 스크롤 제어
					$('#codeLineFrameBefore').scrollTop($("#preBefore").scrollTop());
				});
				$("#preAfter").scroll(function(){
					
					//코드 라인 스크롤 제어
					$('#codeLineFrameAfter').scrollTop($("#preAfter").scrollTop());
				});
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
	 OSLStm8005Popup.init();
 });
</script>
