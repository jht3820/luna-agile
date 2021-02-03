<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- begin page DOM -->
<form class="kt-form" id="mis1003">
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>프로세스 배정 목록
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="mis1003UsrTable" data-datatable-action="selInUsrDelete" title="선택 사용자 배정 제외" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="">
								<span>배정 제외</span><i class="fa fa-arrow-alt-circle-right osl-padding-r0 osl-padding-l05"></i>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="mis1003UsrTable" data-datatable-action="select" title="담당 대상 미 배정 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px--415 kt-padding-10">
					<div class="osl-datatable-search" data-datatable-id="mis1003UsrTable"></div>
					<div class="kt_datatable" id="mis1003UsrTable"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
			<div class="kt-portlet kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>프로세스 미 배정 목록
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="mis1003NoneUsrTable" data-datatable-action="selAllUsrDelete" title="선택 사용자 배정 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="">
								<i class="fa fa-arrow-alt-circle-left"></i><span>배정 등록</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="mis1003NoneUsrTable" data-datatable-action="select" title="담당 대상 미 배정 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px--415 kt-padding-10">
					<div class="osl-datatable-search" data-datatable-id="mis1003NoneUsrTable"></div>
					<div class="kt_datatable" id="mis1003NoneUsrTable"></div>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- begin :: modal-footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="">
		<i class="fa fa-save"></i><span>등록</span>
	</button>
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
var OSLMis1003Popup = function () {
	var documentSetting = function(){
		datatableSetting();
	};
	//담당자 배정, 미 배정 목록
    var datatableSetting = function(){
    	//사용자 배정 정보 datatable 세팅
		$.osl.datatable.setting("mis1003UsrTable",{
			data: {
				type:'local',
				serverSorting: false,
				serverPaging: false,
				source: [],
				pageSize: 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: '', title: 'No.', textAlign: 'center', width: 90, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: '', title: '프로세스 명', textAlign: 'center', width: 90, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
			],
			searchColumns:[
				{field: '', title: '프로세스 명', searchOrd: 1}
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true,
			},
			actionTooltip:{
				"dblClick": "담당자 배정 제외"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
			}
		});
		
		//사용자 미 배정 정보 datatable 세팅
		$.osl.datatable.setting("mis1003NoneUsrTable",{
			data: {
				source: {
					read: {
						/*오류로 인해 임시 url 삽입 하였으니 수정하시면 됩니다. --prj1002 참고*/
						url: "/prj/prj1000/prj1000/selectPrj1000PrjAuthNoneUsrListAjax.do",
						params:{
							prjAuthTypeCd: "01"
						}
					}
				},
				pageSize: 4,
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100],
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet: {
								layout: 'compact'
							}
						}
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: '', title: 'No.', textAlign: 'center', width: 90, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: '', title: '프로세스 명', textAlign: 'center', width: 90, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
			],
			searchColumns:[
				{field: '', title: '프로세스 명', searchOrd: 1}
			],
			actionBtn:{
				"title": "배정",
				"update": false,
				"delete": false,
				"dblClick": true,
				"lastPush": false,
			},
			actionTooltip:{
				"dblClick": "담당자 등록"
			},
			theme:{
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-left",
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
	OSLMis1003Popup.init();
});
</script>
<!-- end script -->
