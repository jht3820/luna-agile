<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<!-- begin :: form -->
<form class="kt-form" id="dpl1003">
	<div class="kt-portlet kt-margin-b-0">
		<div class="kt-portlet__head">	
			<div class="kt-portlet__head-label">
				<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="dpl1003Table"></div>
			</div>
			<div class="kt-portlet__head-toolbar">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1003Table" data-datatable-action="select" title="JOB 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
					<i class="fa fa-list"></i><span>조회</span>
				</button>
			</div>
		</div>
		<div class="kt-portlet__body">
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="dpl1003Table"></div>
		</div>
	</div>
</form>
<!-- end :: form -->
<!-- begin :: modal-footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-plus"></i><span>등록</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end :: modal-footer -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLDpl1003Popup = function () {
	var documentSetting = function(){
	
    	//배정된 요구사항 목록
		$.osl.datatable.setting("dpl1003Table",{
			data: {
				source: {
					read: {
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				 pageSize : 5,
			},
			rows:{
				minHeight: 50
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						//페이지 그룹단위 변경
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					 }
				 }
			 },
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'blockNm', title: 'JOB TYPE', textAlign: 'center', width: 50, search: true},
				{field: 'a', title: 'JOB ID', textAlign: 'center', width: 50},
				{field: 'b', title: '원복 JOB ID', textAlign: 'center', width: 150},
				{field: 'c', title: 'JENKINS NAME', textAlign: 'center', width: 150},
				{field: 'd', title: 'JENKINS URL', textAlign: 'center', width: 150},
				{field: 'e', title: '사용유무', textAlign: 'center', width: 150}
			],
			actionBtn:{
				"dblClick": false,
				"delete" : false,
				"update": false
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
	OSLDpl1003Popup.init();
});
</script>
<!-- end script -->
