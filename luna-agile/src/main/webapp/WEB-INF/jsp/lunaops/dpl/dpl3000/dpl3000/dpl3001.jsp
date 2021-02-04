<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<!-- begin :: form -->
<form class="kt-form" id="dpl3001">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
		<!-- begin :: portlethead -->
		<div class="kt-portlet__head kt-portlet__head--lg">
			<!-- begin :: 타이틀  -->
			<div class="kt-portlet__head-label">
				<h5 class="kt-font-boldest kt-font-brand">
					<i class="fa fa-th-large kt-margin-r-5"></i>프로세스 배정 목록
				</h5>
			</div>
			<!-- end :: 타이틀  -->
		</div>
		<!-- end :: portlethead -->
		<div class="kt-portlet__body">
			<!-- begin :: 내용 영역 -->
			<div class="osl-contents-frame" id="contentsFrame">
				<img src="/media/osl/exlog.png" />
			</div>		
			<!-- end :: 내용 영역 -->
			
			<!-- begin :: 배포 진행률 -->
			<div class="kt-margin-t-20">
				<div class="osl-progress">
					<div class="kt-padding-b-5">
						<i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i>
						배포 진행률 ( <span>78</span>% )
					</div>
					<div class="progress osl-prj-group-md">
						<div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<!-- end :: 배포 진행률 -->
		</div>
	</div>
</form>
<!-- end :: form -->
<!-- begin :: modal-footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand"
		data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end :: modal-footer -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLDpl3001Popup = function () {
	var documentSetting = function(){
		
	};
	
	
	
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl3001Popup.init();
});
</script>
<!-- end script -->
