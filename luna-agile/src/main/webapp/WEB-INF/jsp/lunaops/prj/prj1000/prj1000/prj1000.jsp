<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type active" title="데이터 카드 형식으로 보기" data-title-lang-cd="prj1000.button.title.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="01">
						<i class="fa fa-table osl-padding-r0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="데이터 테이블 형식으로 보기" data-title-lang-cd="prj1000.button.title.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="7" data-view-type="02">
						<i class="fa fa-list osl-padding-r0"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block ">
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="prj1000PrjTable"></div>
		</div>
		<div class="col-lg-9 col-md-12 col-sm-12 text-right kt-padding-r-0">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1000PrjTable" data-datatable-action="select" title="데이터 조회" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
				<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1000PrjTable" data-datatable-action="insert" title="신규 프로젝트 그룹 등록" data-title-lang-cd="prj1000.button.title.insert" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
				<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1000PrjTable" title="데이터 수정" data-title-lang-cd="prj1000.button.title.update" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
				<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1000PrjTable" title="데이터 삭제" data-title-lang-cd="prj1000.button.title.delete" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
				<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" data-datatable-id="prj1000PrjTable" title="프로젝트 휴지통 이동" data-title-lang-cd="prj1000.button.title.trash" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="5">
				<i class="fa fa-trash"></i><span data-lang-cd="datatable.button.trash">휴지통</span>
			</button>
		</div>
	</div>
</div>
<div id="prj1000CardTable"></div>
<div class="kt_datatable osl-datatable-footer__divide" id="prj1000PrjTable"></div>
<script>
"use strict";
var OSLPrj1000Popup = function () {
	var currentViewType = "01";
	
	var documentSetting = function(){
		var config = {
				data: {
					source: {
						read: {
							url: "/prj/prj1000/prj1000/selectPrj1000ListAjaxView.do"
						}
					},
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false},
					{field: 'prjNm', title: '프로젝트 그룹명', textAlign: 'left', width: 200, search: true},
					{field: 'startDt', title: '시작 일자', textAlign: 'center', width: 100, search: true, searchType:"date"},
					{field: 'endDt', title: '종료 일자', textAlign: 'center', width: 100, search: true, searchType:"date"},
					{field: 'prjChildCnt', title: '등록 프로젝트 수', textAlign: 'center', width: 100
						,template: function (row) {return String(row.prjChildCnt)}},
					{field: 'reqAllCnt', title: '전체 요구사항 수', textAlign: 'center', width: 100
						,template: function (row) {return String(row.reqAllCnt)}},
					{field: 'reqInProgressCnt', title: '진행중 요구사항', textAlign: 'center', width: 100
						,template: function (row) {return String(row.reqInProgressCnt)}},
					{field: 'reqDoneCnt', title: '완료 요구사항', textAlign: 'center', width: 100
						,template: function (row) {return String(row.reqDoneCnt)}},
				],
				actionBtn:{
					"dblClick": true,
					"update": false,
					"delete": false,
					"title": $.osl.lang("datatable.action.functionNm"),
					"width": 100,
				},
				actionTooltip:{
					"dblClick": "프로젝트 목록",
					"update": "프로젝트 그룹 수정",
					"delete": "프로젝트 그룹 삭제"
				},
				actionFn:{
					"insert":function(datatableId, type, rowNum){
						var data = {type:"insert"};
						var options = {
								autoHeight: false,
								modalSize: "xl",
								idKey: datatableId,
								modalTitle: $.osl.lang("prj1002.title"),
								closeConfirm: false,
							};
						
						$.osl.layerPopupOpen('/prj/prj1000/prj1000/selectPrj1002View.do',data,options);
					},
					"dblClick":function(rowData, row, datatableId){
						console.log(rowData);
					}
				},
				theme:{
					actionBtnIcon:{
						"dblClick":"fa fa-list-alt"
					}
				},
				callback:{
					initComplete: function(evt,config){
						fnViewerChange();
					},
					ajaxDone: function(evt, list){
						var prjGrpStr = '';
						var rowCnt = 0;
						$.each(list, function(idx, map){
							var prjGrpAuthList = '';
							var prjAuthTargetList = [];
							try{
								//사용자
								if(!$.osl.isNull(map.prjUsrChargerList)){
									var usrList = (map.prjUsrChargerList).split(",");
									//사용자 목록
									$.each(usrList, function(usrListIdx, usrInfoStr){
										//사용자 정보 
										// 인덱스: 0 - 담당자분류, 1 - 사용자 ID, 2 - 이미지 ID, 3 - 사용자명
										var usrInfo = usrInfoStr.split("|");
										
										//사용자 데이터 추가
										prjAuthTargetList.push({
												authType: usrInfo[0],
												authTargetId: usrInfo[1],
												authImg: $.osl.user.usrImgUrlVal(usrInfo[2]),
												authTargetNm: $.osl.escapeHtml(usrInfo[3])
										});
									});
								}
								
								//실제 담당자 인원 표시
								$.each(prjAuthTargetList, function(authIdx, authMap){
									//지정 수 넘어가는 경우 +로 표시
									if(authIdx > 10){
										//남은 담당자 수 
										var endAuthCnt = (prjAuthTargetList.length-authIdx);
										prjGrpAuthList += '<a href="#" class="kt-media kt-media--xs kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="그 외 담당자 +'+endAuthCnt+'"><span>'+endAuthCnt+'+</span></a>';
										return false;
									}else{
										prjGrpAuthList += '<a href="#" class="kt-media kt-media--xs kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="'+authMap.authTargetNm+'" data-original-title="'+authMap.authTargetNm+'" onclick="$.osl.user.usrInfoPopup(\''+authMap.authTargetId+'\');"><img src="'+authMap.authImg+'"></a>';
									}
								});
							}catch(subE){
								//오류인경우 무시
							}
							
							if(rowCnt == 0){
								prjGrpStr += '<div class="row">';
							}
							//카드 UI
							prjGrpStr += 
								'<div class="col-lg-6 col-md-12 col-sm-12">'
								+'<div class="kt-portlet kt-portlet--mobile osl-prj-info-obj">'
									+'<div class="kt-portlet__head kt-portlet__head--lg">'
										+'<div class="kt-portlet__head-label">'
											+'<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid"><input type="checkbox" value="">&nbsp;<span></span></label>'
											+'<h5 class="kt-font-boldest"><span class="badge badge-primary kt-margin-r-10">No. '+map.rn+'</span></h5>'
											+'<div class="kt-media-group osl-margin-b-05">'
												+prjGrpAuthList
											+'</div>'
										+'</div>'
										+'<div class="kt-portlet__head-toolbar">'
											+'<div class="kt-portlet__head-wrapper">'
												+'<button type="button" class="btn btn-outline-primary btn-bold btn-font-sm btn-elevate btn-elevate-air"  data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">'
													+'<i class="fa fa-bars osl-padding-r0"></i>'
												+'</button>'
												+'<div class="dropdown-menu dropdown-menu-right">'
													+'<a class="dropdown-item" href="#"><i class="fa fa-edit"></i>'+$.osl.lang("prj1000.menu.modify")+'</a>'
													+'<a class="dropdown-item" href="#"><i class="fa fa-trash"></i>'+$.osl.lang("prj1000.menu.trashMove")+'</a>'
													+'<a class="dropdown-item" href="#"><i class="fa fa-list-alt"></i>'+$.osl.lang("prj1000.menu.projectListMove")+'</a>'
													+'<div class="dropdown-divider"></div>'
													+'<a class="dropdown-item" href="#"><i class="fa fa-plus"></i>'+$.osl.lang("prj1000.menu.createProject")+'</a>'
													+'<div class="dropdown-divider"></div>'
													+'<a class="dropdown-item" href="#"><i class="fa fa-info-circle"></i>'+$.osl.lang("prj1000.menu.projectDetail")+'</a>'
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>'
									+'<div class="kt-portlet__body">'
										+'<div class="row">'
											+'<div class="kt-padding-l-40 kt-padding-b-15 col-lg-4 col-md-4 col-sm-12">'
												+'<h5 class="kt-font-boldest text-truncate" title="'+$.osl.escapeHtml(map.prjNm)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top"> '+$.osl.escapeHtml(map.prjNm)+'</h5>'
												+'<span class="text-muted text-truncate" title="'+$.osl.escapeHtml(map.prjDesc)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">'+$.osl.escapeHtml(map.prjDesc)+'</span>'
											+'</div>'
											+'<div class="col-lg-8 col-md-8 col-sm-12">'
												+'<div class="row">'
													+'<div class="col-lg-6 col-md-6 col-sm-12">'
														+'<div class="kt-pull-left kt-margin-r-25">'
															+'<div class="kt-padding-b-5"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i><span>'+$.osl.lang("prj1000.startDate")+'</span></div>'
															+'<h5><span class="badge badge-primary">'+$.osl.escapeHtml(map.startDt)+'</span></h5>'
														+'</div>'
														+'<div class="kt-pull-left ">'
															+'<div class="kt-padding-b-5"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i><span>'+$.osl.lang("prj1000.endDate")+'</span></div>'
															+'<h5><span class="badge badge-danger">'+$.osl.escapeHtml(map.endDt)+'</span></h5>'
														+'</div>'
													+'</div>'
													+'<div class="col-lg-6 col-md-6 col-sm-12">'
														+'<div class="osl-progress">'
															+'<div class="kt-padding-b-5"><i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i><span>'+$.osl.lang("prj1000.completedRatio")+'</span></div>'
															+'<div class="progress osl-prj-group-md">'
																+'<div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100">78%</div>'
															+'</div>'
														+'</div>'
													+'</div>'
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>'
									+'<div class="kt-portlet__foot kt-portlet__foot--sm">'
										+'<div class="row">'
											+'<div class="col-lg-6 col-md-6 col-sm-12">'
												+'<div class="osl-widget kt-padding-l-15">'
													+'<div class="osl-widget-info__item">'
														+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqPointer.png"></div>'
														+'<div class="osl-widget-info__item-info">'
															+'<a href="#" class="osl-widget-info__item-title">'+$.osl.lang("prj1000.projectCnt")+'</a>'
															+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.prjChildCnt)+'</div>'
														+'</div>'
													+'</div>'
													+'<div class="osl-widget-info__item">'
														+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqAll.png"></div>'
														+'<div class="osl-widget-info__item-info">'
															+'<a href="#" class="osl-widget-info__item-title">'+$.osl.lang("prj1000.requestAll")+'</a>'
															+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqAllCnt)+'</div>'
														+'</div>'
													+'</div>'
												+'</div>'
											+'</div>'
											+'<div class="col-lg-6 col-md-6 col-sm-12">'
												+'<div class="osl-widget kt-padding-l-15">'
													+'<div class="osl-widget-info__item">'
														+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqInProgress.png"></div>'
														+'<div class="osl-widget-info__item-info">'
															+'<a href="#" class="osl-widget-info__item-title">'+$.osl.lang("prj1000.requestInProgress")+'</a>'
															+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqInProgressCnt)+'</div>'
														+'</div>'
													+'</div>'
													+'<div class="osl-widget-info__item">'
														+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqDone.png"></div>'
														+'<div class="osl-widget-info__item-info">'
															+'<a href="#" class="osl-widget-info__item-title">'+$.osl.lang("prj1000.requestDone")+'</a>'
															+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqDoneCnt)+'</div>'
														+'</div>'
													+'</div>'
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>'
								+'</div>'
								+'</div>';
								rowCnt++;
								if(rowCnt == 2){
									prjGrpStr += '</div>';
									rowCnt = 0;
								}
						});
						
						//로드된 데이터 CARD형식으로 추가
						$("#prj1000CardTable").html(prjGrpStr);
					}
				}
			};
		
		//데이터 테이블 세팅
		$.osl.datatable.setting("prj1000PrjTable", config);
		
		//뷰 변경 이벤트
		$(".btn-view-type").click(function(){
			var viewType = $(this).data("view-type");
			
			//active 교체
			$(".btn-view-type.active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType = viewType;
			
			//뷰어 변경
			fnViewerChange();
		});
	};
	
	var fnViewerChange = function(){
		//현재 viewType에 따라 show/hide
		if(currentViewType == "01"){	//카드 형식
			$("#prj1000PrjTable .kt-datatable__table").css({visibility: "hidden", height: 0});
		    
			$("#prj1000CardTable").show();
		}else{	//데이터테이블 형식
			$("#prj1000PrjTable .kt-datatable__table").css({visibility: "visible",height: "auto"});
			$("#prj1000CardTable").hide();
		}
	}
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLPrj1000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
