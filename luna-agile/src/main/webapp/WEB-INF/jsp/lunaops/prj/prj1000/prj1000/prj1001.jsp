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
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type active" title="데이터 카드 형식으로 보기" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="01">
						<i class="fa fa-table osl-padding-r0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="데이터 테이블 형식으로 보기" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="7" data-view-type="02">
						<i class="fa fa-list osl-padding-r0"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block ">
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="prj1001PrjTable"></div>
		</div>
		<div class="col-lg-9 col-md-12 col-sm-12 text-right kt-padding-r-0">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1001PrjTable" data-datatable-action="select" title="데이터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
				<i class="fa fa-list"></i><span>조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="데이터 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
				<i class="fa fa-plus"></i><span>등록</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="데이터 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
				<i class="fa fa-edit"></i><span>수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="데이터 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
				<i class="fa fa-trash-alt"></i><span>삭제</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" title="프로젝트 휴지통 이동" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="5">
				<i class="fa fa-trash"></i><span>휴지통</span>
			</button>
		</div>
	</div>
</div>
<div id="prj1001CardTable"></div>
<div class="kt_datatable osl-datatable-footer__divide" id="prj1001PrjTable"></div>
<script>
"use strict";
var OSLPrj1001Popup = function () {
	var currentViewType = "01";
	
	var documentSetting = function(){
		var config = {
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1000/selectPrj1001ListAjaxView.do",
						params:{
							paramPrjGrpId: $.osl.selPrjGrpId
						}
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false},
				{field: 'prjNm', title: '프로젝트 명', textAlign: 'left', width: 200, search: true},
				{field: 'startDt', title: '시작 일자', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'endDt', title: '종료 일자', textAlign: 'center', width: 100, search: true, searchType:"date"},
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
				"title": "기능 버튼",
				"width": 100,
			},
			actionTooltip:{
				"dblClick": "프로젝트 목록",
				"update": "프로젝트 수정",
				"delete": "프로젝트 삭제"
			},
			actionFn:{
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
							'<div class="col-lg-4 col-md-6 col-sm-12">'
								+'<div class="kt-portlet kt-portlet--mobile osl-prj-info-obj">'
									+'<div class="kt-portlet__head kt-portlet__head--lg">'
										+'<div class="kt-portlet__head-label">'
											+'<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid"><input type="checkbox" value="">&nbsp;<span></span></label>'
											+'<h5 class="kt-font-boldest"><span class="badge badge-primary kt-margin-r-10">No. 1</span></h5>'
										+'</div>'
										+'<div class="kt-portlet__head-toolbar">'
											+'<div class="kt-portlet__head-wrapper">'
												+'<button type="button" class="btn btn-outline-primary btn-bold btn-font-sm btn-elevate btn-elevate-air"  data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">'
													+'<i class="fa fa-bars osl-padding-r0"></i>'
												+'</button>'
												+'<div class="dropdown-menu dropdown-menu-right">'
													+'<a class="dropdown-item" href="#"><i class="fa fa-edit"></i>$.osl.lang("prj1000.menu.modify")</a>'
													+'<a class="dropdown-item" href="#"><i class="fa fa-trash"></i>$.osl.lang("prj1000.menu.trashMove")</a>'
													+'<a class="dropdown-item" href="#"><i class="fa fa-list-alt"></i>$.osl.lang("prj1000.menu.projectListMove")</a>'
													+'<div class="dropdown-divider"></div>'
													+'<a class="dropdown-item" href="#"><i class="fa fa-plus"></i>$.osl.lang("prj1000.menu.createProject")</a>'
													+'<div class="dropdown-divider"></div>'
													+'<a class="dropdown-item" href="#"><i class="fa fa-info-circle"></i>$.osl.lang("prj1000.menu.projectDetail")</a>'
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>'
									+'<div class="kt-portlet__body">'
										+'<div class="osl-d-flex kt-padding-l-15 osl-align-items-center">'
											+'<div class="kt-media kt-media--xl kt-media--circle kt-media--info osl-flex-shrink-0 osl-margin-r-2rm">'
												+'<span>FG</span>'
											+'</div>'
											+'<div class="osl-d-flex osl-flex-column osl-margin-r-auto">'
												+'<h5 class="kt-font-boldest" title="$.osl.escapeHtml(map.prjNm)" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">프로젝트 명프로젝트 명프로젝트 명프로젝트 명프로젝트 명</h5>'
												+'<span class="text-muted" title="$.osl.escapeHtml(map.prjDesc)" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">프로젝트 설명프로젝트 설명프로젝트 설명프로젝트 설명프로젝트 설명프로젝트 설명프로젝트 설명</span>'
											+'</div>'
										+'</div>'
										+'<div class="osl-d-flex osl-flex-wrap osl-margin-t-2rm kt-padding-l-20">'
											+'<div class="osl-margin-r-3rm osl-margin-b-175rm osl-d-flex osl-flex-column">'
												+'<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>시작일</span>'
												+'<h5><span class="badge badge-primary">2020-01-01</span></h5>'
											+'</div>'
											+'<div class="osl-margin-r-3rm osl-margin-b-175rm osl-d-flex osl-flex-column">'
												+'<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>종료일</span>'
												+'<h5><span class="badge badge-danger">2020-12-31</span></h5>'
											+'</div>'
											+'<div class="osl-flex-row-fluid osl-margin-b-175rm">'
												+'<div class="osl-progress">'
													+'<div class="osl-margin-b-1rm"><i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i><span>진척률</span></div>'
													+'<div class="progress osl-prj-group-md">'
														+'<div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100">78%</div>'
													+'</div>'
												+'</div>'
											+'</div>'
										+'</div>'
										+'<div class="osl-d-flex osl-flex-wrap">'
											+'<div class="osl-widget osl-flex-row-fluid osl-flex-wrap">'
												+'<div class="osl-widget-info__item osl-flex-row-fluid">'
													+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqAll.png"></div>'
													+'<div class="osl-widget-info__item-info">'
														+'<a href="#" class="osl-widget-info__item-title">전체</a>'
														+'<div class="osl-widget-info__item-desc">999</div>'
													+'</div>'
												+'</div>'
												+'<div class="osl-widget-info__item osl-flex-row-fluid">'
													+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqInProgress.png"></div>'
													+'<div class="osl-widget-info__item-info">'
														+'<a href="#" class="osl-widget-info__item-title">처리 중</a>'
														+'<div class="osl-widget-info__item-desc">999</div>'
													+'</div>'
												+'</div>'
												+'<div class="osl-widget-info__item osl-flex-row-fluid">'
													+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqDone.png"></div>'
													+'<div class="osl-widget-info__item-info">'
														+'<a href="#" class="osl-widget-info__item-title">완료</a>'
														+'<div class="osl-widget-info__item-desc">999</div>'
													+'</div>'
												+'</div>'
											+'</div>'
										+'</div>'
										+'<div class="kt-portlet__foot kt-portlet__foot--sm">'
											+'<div id="chart"></div>'
										+'</div>'
									+'</div>'
								+'</div>'
							+'</div>';
							rowCnt++;
							if(rowCnt == 3){
								prjGrpStr += '</div>';
								rowCnt = 0;
							}
					});
					
					//로드된 데이터 CARD형식으로 추가
					$("#prj1001CardTable").html(prjGrpStr);
				}
			}
		};
		
		//데이터 테이블 세팅
		$.osl.datatable.setting("prj1001PrjTable", config);
		
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
			$("#prj1001PrjTable .kt-datatable__table").css({visibility: "hidden", height: 0});
		    
			$("#prj1001CardTable").show();
		}else{	//데이터테이블 형식
			$("#prj1001PrjTable .kt-datatable__table").css({visibility: "visible",height: "auto"});
			$("#prj1001CardTable").hide();
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
	OSLPrj1001Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
