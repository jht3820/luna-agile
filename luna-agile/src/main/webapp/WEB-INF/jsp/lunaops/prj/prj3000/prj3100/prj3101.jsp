<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj3101">
	<input type="hidden" name="dtParamPrjId" id="dtParamPrjId" value="${param.dtParamPrjId }">
	<input type="hidden" name="docId" id="docId" value="${param.docId }"> 
	<input type="hidden" name="atchFileId" id="atchFileId" value="${param.atchFileId }"> 
	<input type="hidden" name="docNm" id="docNm" value="${param.docNm}"> 
	<div class="kt-portlet kt-margin-b-0">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<h5>
					<span class="kt-padding-l-10 kt-padding-t-15 kt-padding-b-15">
						<label class="kt-checkbox kt-checkbox--single kt-checkbox--all kt-checkbox--solid kt-margin-b-0">
							<input type="checkbox" id="fileAllCheck" name="fileAllCheck" >&nbsp;<span></span>
						</label>
					</span>
					<span class="font-weight-bolder">전체 선택</span>
				</h5>
			</div>
			<div class="kt-portlet__head-toolbar">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5" id="docFormFileZipDownAll" title="전체 양식 다운로드" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-original-title="전체 양식 다운로드">
					<i class="fas fa-file-archive"></i><span>전체 양식 다운로드</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5" id="docSelectFormFileZipDown" title="선택 양식 다운로드" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-original-title="선택 양식 다운로드">
					<i class="fas fa-file-download"></i><span>선택 양식 다운로드</span>
				</button>
			</div>
		</div>
		<div class="kt-portlet__body kt-padding-0">
			<div id="confirmation-list">
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i>Close</button>
</div>

<script>
"use strict";
var OSLPrj3101Popup = function () {
	
	var formId = "frPrj3101";
	
	var docId = $('#docId').val();
	var atchFileId = $('#atchFileId').val();
	var docNm = $('#docNm').val();
	
    var documentSetting = function () {
    	
    	
    	/*
		 * function명 : selectFormFileList
		 * function설명 : 가져온 파일 리스트 그리기
		 * @param data : 가져온 파일 데이터
		 */
		var selectFileList = function(){
			//확정 산출물
			var docAtchFileId = $('#atchFileId').val();
			
			//AJAX 설정
			var ajaxObj1 = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/prj/prj3000/prj3100/selectPrj3100FormFileListAjax.do'/>", "async": false}
					,{'docAtchFileId': docAtchFileId});
						
			
			//AJAX 전송 성공 함수
			ajaxObj1.setFnSuccess(function(data){
				
				if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
				}else{
					
					//가져온 데이터로 그림그리기
					drawList(data);
				}
			});
			//AJAX 전송
			ajaxObj1.send();			
		}
    	
    	
		 /*
		 * function명 : drawList
		 * function설명 : 가져온 파일 리스트 그리기
		 * @param data : 가져온 파일 데이터
		 */
		var drawList = function(data){
			//파일 리스트 비우기
			$('#confirmation-list').empty();
			
			
			var atchFileList = data.atchFileList;
			
			//확정 산출물 파일 리스트 돌기
			$.each(atchFileList, function(idx, fileData){
				var fileVolume =Math.round($.osl.escapeHtml(fileData.fileMg) / 1024) + ' KB';
				var iconPath = '';
				var iconClass = '';
				var iconColor = '';
    			 
				//사진 확장자
				var imgExt = ['jpg','jpeg','png','gif'];
				
				//파일 종류에 따라 이미지 다르게 설정
				if(fileData.fileExtsn == 'pdf'){
					iconPath =	'<path d="M9.766 8.295c-.691-1.843-.539-3.401.747-3.726 1.643-.414 2.505.938 2.39 3.299-.039.79-.194 1.662-.537 3.148.324.49.66.967 1.055 1.51.17.231.382.488.629.757 1.866-.128 3.653.114 4.918.655 1.487.635 2.192 1.685 1.614 2.84-.566 1.133-1.839 1.084-3.416.249-1.141-.604-2.457-1.634-3.51-2.707a13.467 13.467 0 0 0-2.238.426c-1.392 4.051-4.534 6.453-5.707 4.572-.986-1.58 1.38-4.206 4.914-5.375.097-.322.185-.656.264-1.001.08-.353.306-1.31.407-1.737-.678-1.059-1.2-2.031-1.53-2.91zm2.098 4.87c-.033.144-.068.287-.104.427l.033-.01-.012.038a14.065 14.065 0 0 1 1.02-.197l-.032-.033.052-.004a7.902 7.902 0 0 1-.208-.271c-.197-.27-.38-.526-.555-.775l-.006.028-.002-.003c-.076.323-.148.632-.186.8zm5.77 2.978c1.143.605 1.832.632 2.054.187.26-.519-.087-1.034-1.113-1.473-.911-.39-2.175-.608-3.55-.608.845.766 1.787 1.459 2.609 1.894zM6.559 18.789c.14.223.693.16 1.425-.413.827-.648 1.61-1.747 2.208-3.206-2.563 1.064-4.102 2.867-3.633 3.62zm5.345-10.97c.088-1.793-.351-2.48-1.146-2.28-.473.119-.564 1.05-.056 2.405.213.566.52 1.188.908 1.859.18-.858.268-1.453.294-1.984z"></path>';
					iconClass = 'osl-uppy-pdf-bg';
					iconColor = '#E2514A';
				}else if(fileData.fileExtsn == 'zip'){
					iconPath = '<path d="M10.45 2.05h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5V2.55a.5.5 0 0 1 .5-.5zm2.05 1.024h1.05a.5.5 0 0 1 .5.5V3.6a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5v-.001zM10.45 0h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5V.5a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.024a.5.5 0 0 1 .5-.5zm-2.05 3.074h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.024a.5.5 0 0 1 .5-.5zm-2.05 1.024h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm-2.05 1.025h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.024a.5.5 0 0 1 .5-.5zm-1.656 3.074l-.82 5.946c.52.302 1.174.458 1.976.458.803 0 1.455-.156 1.975-.458l-.82-5.946h-2.311zm0-1.025h2.312c.512 0 .946.378 1.015.885l.82 5.946c.056.412-.142.817-.501 1.026-.686.398-1.515.597-2.49.597-.974 0-1.804-.199-2.49-.597a1.025 1.025 0 0 1-.5-1.026l.819-5.946c.07-.507.503-.885 1.015-.885zm.545 6.6a.5.5 0 0 1-.397-.561l.143-.999a.5.5 0 0 1 .495-.429h.74a.5.5 0 0 1 .495.43l.143.998a.5.5 0 0 1-.397.561c-.404.08-.819.08-1.222 0z"></path>';
					iconClass = 'osl-uppy-archive-bg';
					iconColor = '#00C469';
				}else{
					iconPath = '<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path><path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>';
					iconClass = 'osl-uppy-file-bg';
					iconColor = '#A7AFB7';
				}
				
				var fileDivbefore = 	'<div class="osl-uppy-file osl-uppy-file--fullsize">'
										+	'<div class="kt-padding-15 float-left">'
											+	'<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0">'
												+	'<input type="checkbox" name="fileSn" id="fileSn'+idx+'" value="'+fileData.fileSn +'"><span></span>'
											+	'</label>'
										+	'</div>'
										
				var fileDivCenter = '';
				
				//사진 확장자가 아닐 때
				if($.inArray(fileData.fileExtsn, imgExt) == -1){
					fileDivCenter +=		'<div class="osl-uppy-file-sumnail '+ iconClass +'">'
											+	'<div class="osl-uppy-file-sumnail-bg"></div>'
											+	'<span class="osl-uppy-iconFile">'
												+	'<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">'
													+	'<g fill="'+iconColor +'" fill-rule="nonzero">'
														+	iconPath
													+	'</g>'
												+	'</svg>'
											+	'</span>'
											+	'<div class="osl-uppy-list-dashboardItem-action--download" aria-label="파일 다운로드">'
												+	'<i class="fas fa-arrow-circle-down"></i>'
											+	'</div>'
				//사진 확장자일 때
				}else{
					fileDivCenter +=		'<div class="osl-uppy-file-sumnail">'
											+ 	'<img src="'+ "/cmm/fms/getImage.do?fileSn="+fileData.fileSn+"&atchFileId="+fileData.atchFileId+'">'
											+	'<div class="osl-uppy-list-dashboardItem-action--download" aria-label="파일 다운로드">'
											+		'<i class="fas fa-arrow-circle-down"></i>'
											+	'</div>'
				}
				var fileDivAfter = 			'</div>'
										+	'<div class="osl-uppy-file-info-group">'
											+	'<div class="osl-uppy-file-name" title="'+$.osl.escapeHtml(fileData.orignlFileNm)+ '">'+$.osl.escapeHtml(fileData.orignlFileNm) +'</div>'
											+	'<div class="osl-uppy-file-volume">'+fileVolume+'</div>'
										+	'</div>'
									+	'</div>'; 
										
				var fileDiv = fileDivbefore + fileDivCenter + fileDivAfter;
							
				$('#confirmation-list').append(fileDiv);
				
			});
		
			//파일 다운버튼 이벤트 걸기
			fileDownBtnEvt();
		}
    
		//전체 다운 버튼 클릭 이벤트
    	$('#docFormFileZipDownAll').click(function(){
			
			if(!$.osl.isNull(docId) && !$.osl.isNull(atchFileId) && !$.osl.isNull(docNm)){
				var url = '/prj/prj3000/prj3100/selectPrj3100ZipDownload.do?atchFileId='+atchFileId+'&docId='+docId+'&docNm='+docNm;
				var fileLink = document.createElement("a");
				fileLink.href = url;
				fileLink.target = "_self";
				document.fileDownFrame.downForm.append(fileLink);
				fileLink.click();
				fileLink.remove();
			}else{
				$.osl.alert($.osl.lang("prj3101.message.alert.lackDownloadInfo"));
			}
			
    	});
    	
		//선택 다운 버튼 클릭 이벤트
		$('#docSelectFormFileZipDown').click(function(){
			
			var checkedFileSn = [];
			
			//선택된 값들 가져오기
			$('input[type=checkbox]:checked').each(function(){
				
				checkedFileSn.push(Number($(this).val()));
				
			});
			
			//선택된 수 없다면 튕기기
			if(!checkedFileSn.length == 0){
				
				if(!$.osl.isNull(docId) && !$.osl.isNull(atchFileId) && !$.osl.isNull(docNm)){
					var url = '/prj/prj3000/prj3100/selectPrj3100SelectFileZipDownload.do?atchFileId='+atchFileId+'&docId='+docId+'&docNm='+docNm+'&fileSn='+checkedFileSn;
					var fileLink = document.createElement("a");
					fileLink.href = url;
					fileLink.target = "_self";
					document.fileDownFrame.downForm.append(fileLink);
					fileLink.click();
					fileLink.remove();
				}else{
					//다운로드에 필요한 정보가 부족합니다.
					$.osl.alert($.osl.lang("prj3101.message.alert.lackDownloadInfo"));
				}
			}else{
				//선택된 파일 정보가 없습니다.
				$.osl.alert($.osl.lang("prj3101.message.alert.notCheckedFile"));
			}
    	});
		
		 /*
		 * function명 : fileDownBtnEvt
		 * function설명 : 파일 다운로드 이벤트
		 */
		var fileDownBtnEvt = function(){
			
			$('.osl-uppy-list-dashboardItem-action--download').click(function(){
				
				var fileSn = $(this).parent().parent().find('input[type=checkbox]').val();
				var atchFileId = $('#atchFileId').val();
				
				//파일 다운
				$.osl.file.fileDownload(atchFileId,fileSn);
				
			});
		}
		
    	 //전체선택 체크박스 클릭
    	$('#fileAllCheck').click(function(){
    		//만약 전체 선택 체크박스가 체크된상태일경우
    		if($(this).is(":checked")==true){
    			//해당화면에 전체 checkbox들을 체크해준다
    			$("input[type=checkbox]").prop("checked", true);
   			// 전체선택 체크박스가 해제된 경우
    		}else{
    			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
    			$("input[type=checkbox]").prop("checked",false);
			}
    	});
    	 
    	//파일 정보 가져오기
    	selectFileList();
    	 
    };
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

//Initialization
$.osl.ready(function(){
	OSLPrj3101Popup.init();
});

	
</script>