<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj3001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="dtParamPrjId" id="dtParamPrjId" value="${param.dtParamPrjId }">
	<input type="hidden" id="lvl" name="lvl" value="${param.lvl}"//>
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
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5" title="전체 양식 다운로드" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-original-title="전체 양식 다운로드">
					<i class="fas fa-file-archive"></i><span>전체 양식 다운로드</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5" title="선택 양식 다운로드" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-original-title="선택 양식 다운로드">
					<i class="fas fa-file-download"></i><span>선택 양식 다운로드</span>
				</button>
			</div>
		</div>
		<div class="kt-portlet__body kt-padding-0">
			<div class="osl-uppy-file osl-uppy-file--fullsize">
				<div class="kt-padding-15 float-left">
					<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0">
						<input type="checkbox">&nbsp;<span></span>
					</label>
				</div>
				<div class="osl-uppy-file-sumnail">
					<img src="/cmm/fms/getImage.do?fileSn=17&amp;atchFileId=FILE_000000000001062">
					<div class="osl-uppy-list-dashboardItem-action--download" aria-label="파일 다운로드">
						<i class="fas fa-arrow-circle-down"></i>
					</div>
				</div>
				<div class="osl-uppy-file-info-group">
					<div class="osl-uppy-file-name" title="최호현반명함1.jpg">최호현반명함1.jpg</div>
					<div class="osl-uppy-file-volume">99 KB</div>
				</div>
				<input type="hidden" name="fileSn" id="fileSn0" value="17">
			</div>
			<div class="osl-uppy-file osl-uppy-file--fullsize">
				<div class="kt-padding-15 float-left">
					<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0">
						<input type="checkbox">&nbsp;<span></span>
					</label>
				</div>
				<div class="osl-uppy-file-sumnail">
					<img src="/cmm/fms/getImage.do?fileSn=17&amp;atchFileId=FILE_000000000001062">
					<div class="osl-uppy-list-dashboardItem-action--download" aria-label="파일 다운로드">
						<i class="fas fa-arrow-circle-down"></i>
					</div>
				</div>
				<div class="osl-uppy-file-info-group">
					<div class="osl-uppy-file-name" title="최호현반명함1.jpg">최호현반명함1.jpg</div>
					<div class="osl-uppy-file-volume">99 KB</div>
				</div>
				<input type="hidden" name="fileSn" id="fileSn0" value="17">
			</div>
			<div class="osl-uppy-file osl-uppy-file--fullsize">
				<div class="kt-padding-15 float-left">
					<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0">
						<input type="checkbox">&nbsp;<span></span>
					</label>
				</div>
				<div class="osl-uppy-file-sumnail">
					<img src="/cmm/fms/getImage.do?fileSn=17&amp;atchFileId=FILE_000000000001062">
					<div class="osl-uppy-list-dashboardItem-action--download" aria-label="파일 다운로드">
						<i class="fas fa-arrow-circle-down"></i>
					</div>
				</div>
				<div class="osl-uppy-file-info-group">
					<div class="osl-uppy-file-name" title="최호현반명함1.jpg">최호현반명함1.jpg</div>
					<div class="osl-uppy-file-volume">99 KB</div>
				</div>
				<input type="hidden" name="fileSn" id="fileSn0" value="17">
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
	
    var documentSetting = function () {
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