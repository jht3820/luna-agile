<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1002">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="startDt" id="startDt">
	<input type="hidden" name="endDt" id="endDt">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required" for="prjNm"><i class="fa fa-edit kt-margin-r-5"></i><span>프로젝트 그룹명</span></label>
								<input type="text" class="form-control" placeholder="프로젝트 그룹명" name="prjNm" id="prjNm" opttype="-1" required>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required" for="prjGrpRange"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>프로젝트 그룹 기간</span></label>
								<input type="text" class="form-control" placeholder="프로젝트 그룹 기간" name="prjGrpRange" id="prjGrpRange" readonly="readonly" required>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
								<select class="form-control kt-select2" id="useCd" name="useCd" opttype="-1">
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required" for="ord"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>정렬 순서</span></label>
								<input type="number" class="form-control" placeholder="정렬 순서" name="ord" id="ord" value="1" opttype="-1" min="0" max="999" required>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span>프로젝트 그룹 설명</span></label>
						<textarea class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="prjDesc" id="prjDesc" opttype="-1"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>담당자 목록
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<c:if test="${param.type != 'insert' }">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1002PrjAuthUsrTable" data-datatable-action="select" title="데이터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-list"></i><span>조회</span>
								</button>
							</c:if>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1002PrjAuthUsrTable" data-datatable-action="selAllUsrDelete" title="선택 사용자 배정 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="prj1002PrjAuthUsrInsert">
								<span>배정 제외</span><i class="fa fa-arrow-alt-circle-right osl-padding-r0 osl-padding-l05"></i>
							</button>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type active" title="데이터 카드 형식으로 보기" data-datatable-id="prj1002PrjAuthUsrTable" data-title-lang-cd="prj1000.button.title.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="01">
									<i class="fa fa-table osl-padding-r0"></i>
								</button>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="데이터 테이블 형식으로 보기" data-datatable-id="prj1002PrjAuthUsrTable" data-title-lang-cd="prj1000.button.title.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="7" data-view-type="02">
									<i class="fa fa-list osl-padding-r0"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px--410 kt-padding-15">
					<c:if test="${param.type != 'insert' }">
						<div class="osl-datatable-search" data-datatable-id="prj1002PrjAuthUsrTable"></div>
					</c:if>
					<div class="osl-d-flex osl-flex-wrap osl-min-h-px--335 kt-padding-t-10 kt-padding-b-10" id="prj1002PrjAuthUsrTableCard" data-datatable-id="prj1002PrjAuthUsrTable">
						<div class="osl-card__data--empty"><span data-lang-cd="datatable.translate.records.noRecords">데이터가 없습니다.</span></div>
					</div>
					<div class="kt_datatable" id="prj1002PrjAuthUsrTable"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>미 담당자 목록
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1002PrjAuthNoneUsrTable" data-datatable-action="selAllUsrDelete" title="선택 사용자 배정 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="prj1002AuthGrpNoneUsrInsert">
								<i class="fa fa-arrow-alt-circle-left"></i><span>배정 등록</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1002PrjAuthNoneUsrTable" data-datatable-action="select" title="데이터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type active" title="데이터 카드 형식으로 보기" data-datatable-id="prj1002PrjAuthNoneUsrTable" data-title-lang-cd="prj1000.button.title.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="01">
									<i class="fa fa-table osl-padding-r0"></i>
								</button>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="데이터 테이블 형식으로 보기" data-datatable-id="prj1002PrjAuthNoneUsrTable" data-title-lang-cd="prj1000.button.title.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="7" data-view-type="02">
									<i class="fa fa-list osl-padding-r0"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px--410">
					<div class="osl-datatable-search" data-datatable-id="prj1002PrjAuthNoneUsrTable"></div>
					<div class="osl-d-flex osl-flex-wrap" id="prj1002PrjAuthNoneUsrTableCard" data-datatable-id="prj1002PrjAuthNoneUsrTable"></div>
					<div class="kt_datatable" id="prj1002PrjAuthNoneUsrTable"></div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1002SaveSubmit"><i class="fa fa-check-square"></i><span>완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLPrj1002Popup = function () {
	var currentViewType = {
		"prj1002PrjAuthUsrTable": "01",
		"prj1002PrjAuthNoneUsrTable": "01"
	};
	var formId = 'frPrj1002';
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var type = $("#type").val();
	
	
	var prjAuthUsrIdList = [];
	
    
    var documentSetting = function () {
    	
    	$("#prj1002SaveSubmit > span").text($.osl.lang("prj1002."+type+".saveBtnString"));
    	
    	var today = new Date().format("yyyy-MM-dd");
    	
    	$("#startDt").val(today);
		$("#endDt").val(today);
		
    	
		$.osl.date.daterangepicker($("#prjGrpRange"), {}, function(defaultConfig, start, end, label) {
			var startDt = new Date(start._d).format("yyyy-MM-dd");
			var endDt = new Date(end._d).format("yyyy-MM-dd");
			
			$("#startDt").val(startDt);
			$("#endDt").val(endDt);
		});

    	
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} 
		];
		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
		
    	$("#prj1002SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj1002."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	
    	        	saveFormAction();
    	        }
    		});
    	});
		
		
    	datatableSetting();
		
    	
		$(".btn-view-type").click(function(){
			var datatableId = $(this).data("datatable-id");
			var viewType = $(this).data("view-type");
			
			
			$(".btn-view-type[data-datatable-id="+datatableId+"].active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType[datatableId] = viewType;
			
			
			fnViewerChange(datatableId);
		});
    };
    
    
    var saveFormAction = function() {
    	
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	
    	var authUsrList = $.osl.datatable.list["prj1002PrjAuthUsrTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(authUsrList) && authUsrList.length > 0){
    		var usrIdList = [];
    		$.each(authUsrList, function(idx, map){
    			usrIdList.push({licGrpId: map.licGrpId, usrId: map.usrId});
    		});
    		fd.append("usrIdList",JSON.stringify(usrIdList));
    	}
    	
    	
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1000/savePrj1002PrjGrpInfo.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				$("button[data-datatable-id=prj1000PrjTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		
   		ajaxObj.send();
    };
    
    
    var datatableSetting = function(){
    	var prjAuthUsrTableUrl = "";
    	
    	
    	if(type != "insert"){
    		prjAuthUsrTableUrl = "/prj/prj1000/prj1000/selectPrj1000PrjAuthUsrListAjax.do";
    	}
    	
		$.osl.datatable.setting("prj1002PrjAuthUsrTable",{
			data: {
				type:'local',
				serverPaging: false,
				source: [],
				pageSize: 6
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [6, 12, 24, 36, 48, 102]
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 150, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true, sortable: false},
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
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
			},
			callback:{
				gotoPage: function(evt, args, datatableInfo){
					setTimeout(function(){
						var list = datatableInfo.dataSet;
						
						
						$("#prj1002PrjAuthUsrTableCard").html("");
						
						$.each(list, function(idx, map){
							
							var usrListStr = $( 
								'<div class="col-lg-6 col-md-12 col-sm-12" data-usr-id="'+map.usrId+'" data-datatable-id="prj1002PrjAuthUsrTable">'
									+'<div class="kt-portlet">'
										+'<div class="kt-portlet__body table-bordered kt-padding-5">'
											+'<div class="osl-d-flex osl-align-items-center">'
												+'<div class="kt-padding-l-10">'
													+'<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid"><input type="checkbox" value="">&nbsp;<span></span></label>'
												+'</div>'
												+'<div class="osl-flex-column osl-flex-shrink-0 kt-user-card-v2__pic kt-media kt-padding-r-5">'
													+'<img src="'+$.osl.user.usrImgUrlVal(map.usrImgId)+'" onerror="/media/users/default.jpg">'
												+'</div>'
												+'<div class="text-truncate kt-padding-l-5 kt-padding-r-5">'
													+'<h5 class="kt-font-boldest text-truncate" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="'+$.osl.escapeHtml(map.usrNm)+'">'+$.osl.escapeHtml(map.usrNm)+'</h5>'
													+'<span class="text-muted" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="'+$.osl.escapeHtml(map.usrPositionNm)+', '+$.osl.escapeHtml(map.usrDutyNm)+'">'+$.osl.escapeHtml(map.usrPositionNm)+', '+$.osl.escapeHtml(map.usrDutyNm)+'</span>'
												+'</div>'
											+'</div>'
											+'<div class="osl-d-flex osl-align-items-center mt-2 pl-2 pr-2">'
												+'<span class="text-dark-75 font-weight-bolder mr-2 osl-flex-shrink-0"><i class="fa fa-edit kt-margin-r-5"></i>부서:</span>'
												+'<span class="text-muted text-hover-primary text-truncate" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="'+$.osl.escapeHtml(map.deptName)+'">'+$.osl.escapeHtml(map.deptName)+'</span>'
											+'</div>'
										+'</div>'
									+'</div>'
								+'</div>');
							
							usrListStr.data("usrInfo",map);
							
							
							$("#prj1002PrjAuthUsrTableCard").append(usrListStr);
						});

						
						KTApp.initTooltips();
					},250);	
				},
				reloaded: function(evt, config, datatableInfo){
					setTimeout(function(){
						var list = datatableInfo.dataSet;

						
						$("#prj1002PrjAuthUsrTableCard").html("");
						
						if(list.length == 0){
							$("#prj1002PrjAuthUsrTableCard").append('<div class="osl-card__data--empty"><span data-lang-cd="datatable.translate.records.noRecords">'+$.osl.lang("datatable.translate.records.noRecords")+'</span></div>');
						}else{
							$.each(list, function(idx, map){
								
								var usrListStr = $( 
									'<div class="col-lg-6 col-md-12 col-sm-12" data-usr-id="'+map.usrId+'" data-datatable-id="prj1002PrjAuthUsrTable">'
										+'<div class="kt-portlet">'
											+'<div class="kt-portlet__body table-bordered kt-padding-5">'
												+'<div class="osl-d-flex osl-align-items-center">'
													+'<div class="kt-padding-l-10">'
														+'<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid"><input type="checkbox" value="">&nbsp;<span></span></label>'
													+'</div>'
													+'<div class="osl-flex-column osl-flex-shrink-0 kt-user-card-v2__pic kt-media kt-padding-r-5">'
														+'<img src="'+$.osl.user.usrImgUrlVal(map.usrImgId)+'" onerror="/media/users/default.jpg">'
													+'</div>'
													+'<div class="text-truncate kt-padding-l-5 kt-padding-r-5">'
														+'<h5 class="kt-font-boldest text-truncate" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="'+$.osl.escapeHtml(map.usrNm)+'">'+$.osl.escapeHtml(map.usrNm)+'</h5>'
														+'<span class="text-muted" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="'+$.osl.escapeHtml(map.usrPositionNm)+', '+$.osl.escapeHtml(map.usrDutyNm)+'">'+$.osl.escapeHtml(map.usrPositionNm)+', '+$.osl.escapeHtml(map.usrDutyNm)+'</span>'
													+'</div>'
												+'</div>'
												+'<div class="osl-d-flex osl-align-items-center mt-2 pl-2 pr-2">'
													+'<span class="text-dark-75 font-weight-bolder mr-2 osl-flex-shrink-0"><i class="fa fa-edit kt-margin-r-5"></i>부서:</span>'
													+'<span class="text-muted text-hover-primary text-truncate" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="'+$.osl.escapeHtml(map.deptName)+'">'+$.osl.escapeHtml(map.deptName)+'</span>'
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>');
								
								usrListStr.data("usrInfo",map);
								
								
								$("#prj1002PrjAuthUsrTableCard").append(usrListStr);
							});

							
							KTApp.initTooltips();
						}
					},250);	
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllUsrDelete(rowDatas);
				},
				
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj2100.allUsrInDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							
							fnAllUsrDelete(rowDatas);
						}
					});
				}
			}
		});
		
		
		$.osl.datatable.setting("prj1002PrjAuthNoneUsrTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1000/selectPrj1000PrjAuthNoneUsrListAjax.do"
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
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 150, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true, sortable: false},
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
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
			},
			callback:{
				ajaxDone: function(evt, list){
					
					$("#prj1002PrjAuthNoneUsrTableCard").html("");
					$.each(list, function(idx, map){
						var userAddedClass = "";
						
						if(prjAuthUsrIdList.indexOf(map.usrId) != -1){
							userAddedClass = "osl-auth-user--added";
						}
						
						
						var usrListStr = $( 
							'<div class="col-lg-6 col-md-12 col-sm-12 '+userAddedClass+'" data-usr-id="'+map.usrId+'">'
								+'<div class="kt-portlet">'
									+'<div class="kt-portlet__body table-bordered kt-padding-5">'
										+'<div class="osl-d-flex osl-align-items-center">'
											+'<div class="kt-padding-l-10">'
												+'<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid"><input type="checkbox" value="">&nbsp;<span></span></label>'
											+'</div>'
											+'<div class="osl-flex-column osl-flex-shrink-0 kt-user-card-v2__pic kt-media kt-padding-r-5">'
												+'<img src="'+$.osl.user.usrImgUrlVal(map.usrImgId)+'" onerror="/media/users/default.jpg">'
											+'</div>'
											+'<div class="text-truncate kt-padding-l-5 kt-padding-r-5">'
												+'<h5 class="kt-font-boldest text-truncate" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="'+$.osl.escapeHtml(map.usrNm)+'">'+$.osl.escapeHtml(map.usrNm)+'</h5>'
												+'<span class="text-muted" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="'+$.osl.escapeHtml(map.usrPositionNm)+', '+$.osl.escapeHtml(map.usrDutyNm)+'">'+$.osl.escapeHtml(map.usrPositionNm)+', '+$.osl.escapeHtml(map.usrDutyNm)+'</span>'
											+'</div>'
										+'</div>'
										+'<div class="osl-d-flex osl-align-items-center mt-2 pl-2 pr-2">'
											+'<span class="text-dark-75 font-weight-bolder mr-2 osl-flex-shrink-0"><i class="fa fa-edit kt-margin-r-5"></i>부서:</span>'
											+'<span class="text-muted text-hover-primary text-truncate" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="'+$.osl.escapeHtml(map.deptName)+'">'+$.osl.escapeHtml(map.deptName)+'</span>'
										+'</div>'
									+'</div>'
								+'</div>'
							+'</div>');
						
						usrListStr.data("usrInfo",map);
						
						$("#prj1002PrjAuthNoneUsrTableCard").append(usrListStr);
					});
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllUsrInsert(rowDatas);
					
				},
				
				"selAllUsrDelete": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj2100.allUsrInsert",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							
							fnAllUsrInsert(rowDatas);
						}
					});
				}
			}
		});
		
		
		fnViewerChange("prj1002PrjAuthUsrTable");
		fnViewerChange("prj1002PrjAuthNoneUsrTable");
		
		
		var dragLeft = document.getElementById("prj1002PrjAuthUsrTableCard");
		var dragRight = document.getElementById("prj1002PrjAuthNoneUsrTableCard");
		
		
		var dragDropObj = dragula([dragLeft, dragRight],{
			
			copy: function (el, source) {
				
				return source === document.getElementById("prj1002PrjAuthNoneUsrTableCard")
			},
			
			accepts: function (el, target) {
			    return target !== document.getElementById("prj1002PrjAuthNoneUsrTableCard");
			},
			
			moves: function (el, source, handle, sibling) {
				return !el.classList.contains('osl-auth-user--added');
			},
			
		    revertOnSpill: true,
		    
		    removeOnSpill: true,
		    copySortSource : true
		});
		
		
		dragDropObj.on("cloned", function(clone, original, type){
			
			$(clone).data("usrInfo", $(original).data("usrInfo"));
		}).on("remove", function(el, container, source){	
			
			var fromId = source.getAttribute("id");
			var fromDatatableId = $(source).data("datatable-id");
			var fromDatatable = $.osl.datatable.list[fromDatatableId].targetDt;
			
			
			var usrInfo = $(el).data("usrInfo");
			
			
			var dataSet = fromDatatable.dataSet;
			var originalDataSet = fromDatatable.originalDataSet;
			
			if(!$.osl.isNull(dataSet)){
				$.each(dataSet, function(idx, map){
					if($.osl.isNull(map)){
						return true;
					}
					else if(usrInfo.usrId == map.usrId){
						dataSet.splice(idx, 1);
						originalDataSet.splice(idx, 1);
					}
				});
				
				fromDatatable.insertData();
			}
			
			
			$("div[data-usr-id="+usrInfo.usrId+"].osl-auth-user--added").removeClass("osl-auth-user--added");
			
			
			prjAuthUsrIdList.splice(prjAuthUsrIdList.indexOf(usrInfo.usrId), 1);
			
			
			fromDatatable.reload();
		}).on("drop", function(el, target, source, sibling){	
			
			if(target === source){
				return true;
			}
			
			var fromId = source.getAttribute("id");
			
			var toId = target.getAttribute("id");
			var toDatatableId = $(target).data("datatable-id");
			
			
			var usrInfo = $(el).data("usrInfo");
			var toDatatable = $.osl.datatable.list[toDatatableId].targetDt;
			
			
			toDatatable.removeClass("kt-datatable--error");
			if($.osl.isNull(toDatatable.dataSet)){
				toDatatable.dataSet = [];
				toDatatable.originalDataSet = [];
			}else{
				if(prjAuthUsrIdList.indexOf(usrInfo.usrId) != -1){
					$.osl.alert("이미 추가된 사용자입니다.");
					dragDropObj.cancel();
					return false;
				}
			}
			
			if(toDatatable.dataSet.length > 0){
				
				for(var i=toDatatable.dataSet.length;i>0;i--){
					if(i == toDatatable.dataSet.length){
						toDatatable.dataSet[i] = {};
					}
					toDatatable.dataSet[i] = toDatatable.dataSet[i-1];
				}
			}
			
			toDatatable.dataSet[0] = usrInfo;
			
			toDatatable.originalDataSet.unshift(usrInfo);
			toDatatable.insertData();
			
			
			$("#"+fromId+" > div[data-usr-id="+usrInfo.usrId+"]").addClass("osl-auth-user--added");
			
			
			prjAuthUsrIdList.push(usrInfo.usrId);
			
			
			toDatatable.reload();
		}).on('over', function (el, container) {
			container.className += ' osl-drag-zone--over';
		}).on('out', function (el, container) {
			container.className = container.className.replace(' osl-drag-zone--over', '');
		});
    };

	var fnViewerChange = function(targetDatatableId){
		
		if(currentViewType[targetDatatableId] == "01"){	
			$("#"+targetDatatableId+" .kt-datatable__table").css({visibility: "hidden", height: 0});
			$("#"+targetDatatableId+"Card").show();
		}else{	
			$("#"+targetDatatableId+" .kt-datatable__table").css({visibility: "visible",height: "auto"});
			$("#"+targetDatatableId+"Card").hide();
		}
	};
	
    return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLPrj1002Popup.init();
});

	
</script>