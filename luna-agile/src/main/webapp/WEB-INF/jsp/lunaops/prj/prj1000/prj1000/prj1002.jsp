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
					<div class="osl-d-flex osl-flex-wrap osl-min-h-px--300 kt-padding-t-10 kt-padding-b-10" id="prj1002PrjAuthUsrTableCard" data-datatable-id="prj1002PrjAuthUsrTable">
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
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//type
	var type = $("#type").val();
	
	//배정 담당자 중복 체크
	var prjAuthUsrIdList = [];
	
    // Private functions
    var documentSetting = function () {
    	//문구 세팅 
    	$("#prj1002SaveSubmit > span").text($.osl.lang("prj1002."+type+".saveBtnString"));
    	
    	var today = new Date().format("yyyy-MM-dd");
    	//프로젝트 그룹 기간 최초 오늘 날짜 세팅
    	$("#startDt").val(today);
		$("#endDt").val(today);
		
    	//datepicker 세팅
		$.osl.date.daterangepicker($("#prjGrpRange"), {}, function(defaultConfig, start, end, label) {
			var startDt = new Date(start._d).format("yyyy-MM-dd");
			var endDt = new Date(end._d).format("yyyy-MM-dd");
			
			$("#startDt").val(startDt);
			$("#endDt").val(endDt);
		});

    	// 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} // 사용유무
		];
		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
		//submit 동작
    	$("#prj1002SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj1002."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	//프로젝트 그룹 저장
    	        	saveFormAction();
    	        }
    		});
    	});
		
		//데이터 테이블 세팅
    	datatableSetting();
		
    	//뷰 변경 이벤트
		$(".btn-view-type").click(function(){
			var datatableId = $(this).data("datatable-id");
			var viewType = $(this).data("view-type");
			
			//active 교체
			$(".btn-view-type[data-datatable-id="+datatableId+"].active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType[datatableId] = viewType;
			
			//뷰어 변경
			fnViewerChange(datatableId);
		});
    };
    
    //프로젝트 그룹 저장 (생성&수정)
    var saveFormAction = function() {
    	//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	//추가된 담당자 목록
    	var authUsrList = $.osl.datatable.list["prj1002PrjAuthUsrTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(authUsrList) && authUsrList.length > 0){
    		var usrIdList = [];
    		$.each(authUsrList, function(idx, map){
    			usrIdList.push({licGrpId: map.licGrpId, usrId: map.usrId});
    		});
    		fd.append("usrIdList",JSON.stringify(usrIdList));
    	}
    	
    	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1000/savePrj1002PrjGrpInfo.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//등록 성공
   				$.osl.toastr(data.message);

   				//모달 창 닫기
   				$.osl.layerPopupClose();
   				
   				//datatable 조회
   				$("button[data-datatable-id=prj1000PrjTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
    };
    
    //담당자 배정, 미 배정 목록
    var datatableSetting = function(){
    	var prjAuthUsrTableUrl = "";
    	
    	//추가가 아닌경우
    	if(type != "insert"){
    		prjAuthUsrTableUrl = "/prj/prj1000/prj1000/selectPrj1000PrjAuthUsrListAjax.do";
    	}
    	//사용자 배정 정보 datatable 세팅
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
						
						//초기화
						$("#prj1002PrjAuthUsrTableCard").html("");
						
						$.each(list, function(idx, map){
							//카드 UI
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
							
							//로드된 데이터 CARD형식으로 추가
							$("#prj1002PrjAuthUsrTableCard").append(usrListStr);
						});

						//tooltips
						KTApp.initTooltips();
					},250);	
				},
				reloaded: function(evt, config, datatableInfo){
					setTimeout(function(){
						var list = datatableInfo.dataSet;

						//초기화
						$("#prj1002PrjAuthUsrTableCard").html("");
						
						if(list.length == 0){
							$("#prj1002PrjAuthUsrTableCard").append('<div class="osl-card__data--empty"><span data-lang-cd="datatable.translate.records.noRecords">'+$.osl.lang("datatable.translate.records.noRecords")+'</span></div>');
						}else{
							$.each(list, function(idx, map){
								//카드 UI
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
								
								//로드된 데이터 CARD형식으로 추가
								$("#prj1002PrjAuthUsrTableCard").append(usrListStr);
							});

							//tooltips
							KTApp.initTooltips();
						}
					},250);	
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					//사용자 배정 처리
					fnAllUsrDelete(rowDatas);
				},
				//선택 사용자 배정 제외
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj2100.allUsrInDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							//사용자 배정 제외 처리
							fnAllUsrDelete(rowDatas);
						}
					});
				}
			}
		});
		
		//사용자 미 배정 정보 datatable 세팅
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
					//초기화
					$("#prj1002PrjAuthNoneUsrTableCard").html("");
					$.each(list, function(idx, map){
						var userAddedClass = "";
						//추가된 담당자 목록에 존재하는경우 class 추가
						if(prjAuthUsrIdList.indexOf(map.usrId) != -1){
							userAddedClass = "osl-auth-user--added";
						}
						
						//카드 UI
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
						//로드된 데이터 CARD형식으로 추가
						$("#prj1002PrjAuthNoneUsrTableCard").append(usrListStr);
					});
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					//사용자 배정 처리
					fnAllUsrInsert(rowDatas);
					
				},
				//선택 사용자 배정 등록
				"selAllUsrDelete": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj2100.allUsrInsert",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							//사용자 배정 처리
							fnAllUsrInsert(rowDatas);
						}
					});
				}
			}
		});
		
		//출력 타입에 따라 목록 형태 표시
		fnViewerChange("prj1002PrjAuthUsrTable");
		fnViewerChange("prj1002PrjAuthNoneUsrTable");
		
		//drag&drop 대상 elem
		var dragLeft = document.getElementById("prj1002PrjAuthUsrTableCard");
		var dragRight = document.getElementById("prj1002PrjAuthNoneUsrTableCard");
		
		//card ui drag&drop
		var dragDropObj = dragula([dragLeft, dragRight],{
			//복사 허용
			copy: function (el, source) {
				//미 담당자 목록에서 담당자 목록으로만 복사
				return source === document.getElementById("prj1002PrjAuthNoneUsrTableCard")
			},
			//drag 허용
			accepts: function (el, target) {
			    return target !== document.getElementById("prj1002PrjAuthNoneUsrTableCard");
			},
			//elem 이동시 class 추가
			moves: function (el, source, handle, sibling) {
				return !el.classList.contains('osl-auth-user--added') && !el.classList.contains('osl-card__data--empty');
			},
			//영역 벗어나는 경우 elem 되돌리기
		    revertOnSpill: true,
		    //영역 벗어나는 경우 삭제
		    removeOnSpill: true,
		    copySortSource : true
		});
		
		//elem copy로 생성 시
		dragDropObj.on("cloned", function(clone, original, type){
			//data
			$(clone).data("usrInfo", $(original).data("usrInfo"));
		}).on("remove", function(el, container, source){	//elem 삭제 시
			//출발지 ID
			var fromId = source.getAttribute("id");
			var fromDatatableId = $(source).data("datatable-id");
			var fromDatatable = $.osl.datatable.list[fromDatatableId].targetDt;
			
			//datatable에 해당 row 데이터
			var usrInfo = $(el).data("usrInfo");
			
			//dataSet에서 제거
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
			
			//제거된 el에 class 제거
			$("div[data-usr-id="+usrInfo.usrId+"].osl-auth-user--added").removeClass("osl-auth-user--added");
			
			//중복체크 추가
			prjAuthUsrIdList.splice(prjAuthUsrIdList.indexOf(usrInfo.usrId), 1);
			
			//데이터테이블 재 조회
			fromDatatable.reload();
		}).on("drop", function(el, target, source, sibling){	//elem drop
			//같은 위치인경우 동작 중지
			if(target === source){
				return true;
			}
			//출발지 ID
			var fromId = source.getAttribute("id");
			//도착지 ID
			var toId = target.getAttribute("id");
			var toDatatableId = $(target).data("datatable-id");
			
			//datatable에 해당 row 데이터
			var usrInfo = $(el).data("usrInfo");
			var toDatatable = $.osl.datatable.list[toDatatableId].targetDt;
			
			//dataSet에 추가
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
			//dataset unshift index 구하기
			if(toDatatable.dataSet.length > 0){
				//unshift
				for(var i=toDatatable.dataSet.length;i>0;i--){
					if(i == toDatatable.dataSet.length){
						toDatatable.dataSet[i] = {};
					}
					toDatatable.dataSet[i] = toDatatable.dataSet[i-1];
				}
			}
			//dataset unshift
			toDatatable.dataSet[0] = usrInfo;
			
			toDatatable.originalDataSet.unshift(usrInfo);
			toDatatable.insertData();
			
			//추가된 el에 class 추가
			$("#"+fromId+" > div[data-usr-id="+usrInfo.usrId+"]").addClass("osl-auth-user--added");
			
			//중복체크 추가
			prjAuthUsrIdList.push(usrInfo.usrId);
			
			//데이터테이블 재 조회
			toDatatable.reload();
		}).on('over', function (el, container) {
			container.className += ' osl-drag-zone--over';
		}).on('out', function (el, container) {
			container.className = container.className.replace(' osl-drag-zone--over', '');
		});
    };

	var fnViewerChange = function(targetDatatableId){
		//현재 viewType에 따라 show/hide
		if(currentViewType[targetDatatableId] == "01"){	//카드 형식
			$("#"+targetDatatableId+" .kt-datatable__table").css({visibility: "hidden", height: 0});
			$("#"+targetDatatableId+"Card").show();
		}else{	//데이터테이블 형식
			$("#"+targetDatatableId+" .kt-datatable__table").css({visibility: "visible",height: "auto"});
			$("#"+targetDatatableId+"Card").hide();
		}
	};
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLPrj1002Popup.init();
});

	
</script>