<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- begin page DOM -->
<form class="kt-form" id="dpl3002">
	<div class="row">
		<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 osl-min-h-px--700">
				<!-- begin :: portlethead -->
				<div class="kt-portlet__head kt-portlet__head--lg">
					<!-- begin :: 타이틀  -->
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>JOB 배정 목록
						</h5>
					</div>
					<!-- end :: 타이틀  -->
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button"
								class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air"
								data-datatable-id="dpl3000Table" data-datatable-action="select"
								title="프로세스 배정 목록 조회" data-toggle="kt-tooltip" data-skin="brand"
								data-placement="bottom" data-auth-button="select" tabindex="5">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
					</div>
				</div>
				<!-- end :: portlethead -->
				<div class="kt-portlet__body">
					<!-- begin :: 내용 영역 -->
					<div class="kt_datatable osl-datatable-footer__divide" id="dpl3002Table"></div>
					<!-- end :: 내용 영역 -->
				</div>
			</div>
		</div>
		<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 osl-min-h-px--700">
				<!-- begin :: portlethead -->
				<div class="kt-portlet__head kt-portlet__head--lg">
					<!-- begin :: 타이틀  -->
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>선택 JOB 콘솔 로그
						</h5>
					</div>
					<!-- end :: 타이틀  -->
				</div>
				<!-- end :: portlethead -->
				<div class="kt-portlet__body">
					<!-- begin :: 내용 영역 -->
					<div class="osl-contents-frame osl-max-h-px--590" id="contentsFrame">
						<pre>
							<code class="osl-font osl-bg-none kt-font-light" id="buildConsoleLog">좌측에서 JOB을 선택해주세요.</code>
						</pre>
					</div>
					<!-- end :: 내용 영역 -->
				</div>
			</div>
		</div>
	</div>
</form>
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
var OSLDpl3002Popup = function () {
	var documentSetting = function(){

		
		$.osl.datatable.setting("dpl3002Table",{
			data: {
				source: {
					read: {
						url: "/req/req1000/req1000/selectReq1000ListAjaxView.do"
					}
				},
			},
			columns: [
				{field: 'jobTypeNm', title: 'JOB TYPE', textAlign: 'center', width: 50},
				{field: 'bldNum', title: '빌드 번호', textAlign: 'center', width: 50},
				{field: 'bldResultMsg', title: '빌드 결과', textAlign: 'center', width: 50},
				{field: '', title: '소요시간', textAlign: 'center', width: 50},
				{field: 'dplUsrNm', title: '배포자', textAlign: 'center', width: 50},
			],
			actionBtn:{
				"click": true,
				"dblClick": false
			},
			actionTooltip:{
				"click": "JOB 콘솔 로그 조회"
			},
			actionFn:{
				"click":function(rowData){
					$('#buildConsoleLog').html('');
					$('#buildConsoleLog').append('<img src="/media/osl/exlog.png" />');
					$("#contentsFrame").scrollTop(9999999);
				}
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

$.osl.ready(function(){
	OSLDpl3002Popup.init();
});
</script>
<!-- end script -->
