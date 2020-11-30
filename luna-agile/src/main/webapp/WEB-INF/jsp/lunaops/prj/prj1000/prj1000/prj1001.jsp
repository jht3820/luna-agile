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
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1001PrjTable" data-datatable-action="select" title="프로젝트 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
				<i class="fa fa-list"></i><span>조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1001PrjTable" data-datatable-action="insert" title="프로젝트 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
				<i class="fa fa-plus"></i><span>등록</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1001PrjTable" data-datatable-action="update" title="프로젝트 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
				<i class="fa fa-edit"></i><span>수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1001PrjTable" data-datatable-action="delete" title="프로젝트 그룹 휴지통 이동(삭제)" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
				<i class="fa fa-trash-alt"></i><span>삭제</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" name="prjTrashListMoveBtn" id="prjTrashListMoveBtn" data-datatable-id="prj1001PrjTable" title="프로젝트 휴지통 목록 이동" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="5">
				<i class="fa fa-trash"></i><span>휴지통 목록</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1001PrjTable" data-datatable-action="prjRedo" title="프로젝트 복구" data-title-lang-cd="prj1000.button.title.redo" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3" hidden>
				<i class="fa fa-redo-alt"></i><span data-lang-cd="datatable.button.redo">복구</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1001PrjTable" data-datatable-action="prjDelete" title="프로젝트 완전 삭제" data-title-lang-cd="prj1000.button.title.recordDelete" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4" hidden>
				<i class="fa fa-times-circle"></i><span data-lang-cd="datatable.button.recordDelete">완전 삭제</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" name="prjListMoveBtn" id="prjListMoveBtn" data-datatable-id="prj1001PrjTable" title="프로젝트 목록으로 이동" data-title-lang-cd="prj1000.button.title.prev" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5" hidden>
				<i class="fa fa-trash"></i><i class="fa fa-list"></i><span data-lang-cd="datatable.button.prev">돌아가기</span>
			</button>
		</div>
	</div>
</div>
<div id="prj1001CardTable"></div>
<div class="kt_datatable osl-datatable-footer__divide" id="prj1001PrjTable"></div>
<script>
"use strict";
var OSLPrj1001Popup = function () {
	//01 - 카드형, 02 - 그리드
	var currentViewType = "01";
	//차트 기본 옵션
	var chartDefaultOption = {
			series: [],
			chart: {
				toolbar:{show:false},
				width: '100%',
				height: 195,
				type: 'heatmap',
				offsetX: -5,
				events: {
					click: function(event, chartContext, config) {
						console.log(event);
						var series = config.config.series;
						console.log(series[config.seriesIndex]["data"][config.dataPointIndex]);
						//요구사항 상세정보
					}
				},
			},
			title:{
				text: "처리유형별 요구사항",
				align: "center",
			},
			dataLabels: {enabled: false},
			xaxis:{labels:{show:false}, axisBorder:{show:false}, axisTicks:{show:false}, crosshairs:{show:false}, tooltip: {enabled: false}},
			yaxis:{labels:{show:false}, axisBorder:{show:false}, axisTicks:{show:false}, crosshairs:{show:false}, tooltip: {enabled: false}},
			legend:{
				position: 'bottom',
				horizontalAlign: 'right',
			},
			grid: {
			    show: false,
			    padding: {
			    	top: 0,
			    	bottom: 0,
					left: 0,
					right: 0
			    }
			  },
			plotOptions:{
				heatmap:{
		            radius: 0,
		            reverseNegativeShade: false,
		            enableShades: false,
		            useFillColorAsStroke: false,
		            colorScale:{
						ranges:[
							{from: 1,to: 1,color: "#9fd1f2", name:"접수 요청"},
							{from: 2,to: 2,color: "#5867dd", name:"진행 중"},
							{from: 3,to: 3,color: "#FFB200", name:"접수 반려"},
							{from: 4,to: 6,color: "#fd397a", name:"완료"},
						]
					}
				}
			},
			tooltip: {
				custom: function(data) {
					var series = data.series;
					var seriesIndex = data.seriesIndex;
					var dataPointIndex = data.dataPointIndex;
					
					var selData = data.w.config.series[seriesIndex].data[dataPointIndex];
					var reqOrd = selData.reqOrd;
					var reqNm = selData.reqNm
					
					return '<div class="osl-chart--project__tooltip">['+reqOrd+'] '+reqNm+'</div>';
					//return series[seriesIndex][dataPointIndex];
				}
			},
		};
	
	var documentSetting = function(){
		var config = {
			cardUiTarget: $("#prj1001CardTable"),
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1000/selectPrj1001ListAjaxView.do",
						params:{
							paramPrjGrpId: $.osl.selPrjGrpId,
							delCd: "02"
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
				"update": false,
				"delete": false,
				"title": "기능 버튼",
				"width": 100,
			},
			actionTooltip:{
				"update": "프로젝트 수정",
				"delete": "프로젝트 삭제"
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					//프로젝트 그룹 정보
					var prjGrpInfo = $.osl.prjGrpAuthList[$.osl.selPrjGrpId]["prjGrpInfo"];
					
					var data = {
							type:"insert",
							paramPrjGrpId: $.osl.selPrjGrpId,
							prjGrpNm: prjGrpInfo.prjNm,
							prjGrpStartDt: prjGrpInfo.startDt,
							prjGrpEndDt: prjGrpInfo.endDt
					};
					var options = {
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							modalTitle: $.osl.lang("prj1004.title"),
							closeConfirm: false,
						};
					
					$.osl.layerPopupOpen('/prj/prj1000/prj1000/selectPrj1004View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, c, rowNum, elem){
					//선택 프로젝트 그룹 휴지통으로 이동
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/prj/prj1000/prj1000/updatePrj1000PrjGrpTrashListAjax.do'/>"}
							,{deleteDataList: JSON.stringify(rowDatas)});
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
			   				$.osl.alert(data.message,{type: 'error'});
			   			}else{
			   				//삭제 성공
			   				$.osl.toastr(data.message);
			   				
			   				//datatable 조회
			   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			   			}
					});
					
					//AJAX 전송
					ajaxObj.send();
				},
				//복구
				"prjRedo": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj1001.confirm.prjRedo",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							//선택 프로젝트 그룹 복구 처리
							fnPrjRedoUpdate(rowDatas, datatableId);
						}
					});
				},
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
					//프로젝트별 처리유형 요구사항 값
					var chartDataMap = [];
					
					//ajax로 전달받은 요구사항 값
					var reqChartDataList = [];
					if($.osl.datatable.list["prj1001PrjTable"].targetDt.lastResponse.hasOwnProperty("reqChartDataList")){
						reqChartDataList = $.osl.datatable.list["prj1001PrjTable"].targetDt.lastResponse.reqChartDataList;
					}
					if(reqChartDataList.length > 0){
						$.each(reqChartDataList, function(idx, map){
							//프로젝트 기준 값 없는 경우 생성
							if(!chartDataMap.hasOwnProperty(map.prjId)){
								chartDataMap[map.prjId] = [];
							}
							//프로젝트별 값 생성
							chartDataMap[map.prjId].push(map);
						});
					}
					
					var prjGrpStr = '';
					var rowCnt = 0;
					$.each(list, function(idx, map){
						var prjAuthList = '';
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
									prjAuthList += '<a href="#" class="kt-media kt-media--xs kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="그 외 담당자 +'+endAuthCnt+'"><span>'+endAuthCnt+'+</span></a>';
									return false;
								}else{
									prjAuthList += '<a href="#" class="kt-media kt-media--xs kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="'+authMap.authTargetNm+'" data-original-title="'+authMap.authTargetNm+'" onclick="$.osl.user.usrInfoPopup(\''+authMap.authTargetId+'\');"><img src="'+authMap.authImg+'"></a>';
								}
							});
							
						}catch(subE){
							//오류인경우 무시
						}
						
						//프로젝트 배경색, 글씨색상
						var prjBgColor = map.prjBgColor;
						var prjColor = map.prjColor;
						if($.osl.isNull(prjBgColor)){
							prjBgColor = "#eef1fd";
						}
						if($.osl.isNull(prjColor)){
							prjColor = "#5578eb";
						}
						
						if(rowCnt == 0){
							prjGrpStr += '<div class="row">';
						}
						
						//프로젝트 번호
						var rnStr = "No. "+map.rn;
						var rnClass = "badge-primary";
						
						//삭제여부에 따른 목록
						var prjGrpDelCdMenuList = {
								//휴지통 목록 (삭제)
								"01":[
									'<div class="dropdown-item" data-datatable-id="prj1001PrjTable" data-datatable-expans="dropdown" data-datatable-action="prjRedo"><i class="fa fa fa-redo-alt kt-font-primary"></i>'+$.osl.lang("prj1001.menu.projectRedo")+'</div>',
									'<div class="dropdown-divider"></div>',
									'<div class="dropdown-item" href="#" data-datatable-id="prj1001PrjTable" data-datatable-expans="dropdown" data-datatable-action="prjGrpDelete"><i class="fa fa-times-circle kt-font-primary"></i>'+$.osl.lang("prj1001.menu.recordDelete")+'</div>',
									'<div class="dropdown-divider"></div>',
									'<div class="dropdown-item" href="#" data-datatable-id="prj1001PrjTable" data-datatable-expans="dropdown"><i class="fa fa-info-circle kt-font-primary"></i>'+$.osl.lang("prj1001.menu.projectDetail")+'</div>'
								],
								//일반 목록 (미 삭제)
								"02":[
									'<div class="dropdown-item" data-datatable-id="prj1001PrjTable" data-datatable-expans="dropdown" data-datatable-action="update"><i class="fa fa-edit"></i>'+$.osl.lang("prj1001.menu.modify")+'</div>',
									'<div class="dropdown-item" data-datatable-id="prj1001PrjTable" data-datatable-expans="dropdown" data-datatable-action="delete"><i class="fa fa-trash"></i>'+$.osl.lang("prj1001.menu.trashMove")+'</div>',
									'<div class="dropdown-divider"></div>',
									'<div class="dropdown-item" data-datatable-id="prj1001PrjTable" data-datatable-expans="dropdown" data-datatable-action="detail"><i class="fa fa-info-circle"></i>'+$.osl.lang("prj1001.menu.projectDetail")+'</div>',
								]
						};
						
						//삭제 여부에따른 rn -> trash, dropdown menu
						if(map.delCd == "01"){
							rnStr = '<i class="fa fa-trash-alt"></i>';
							rnClass = "badge-danger"
						}
						
						//카드 UI
						prjGrpStr += 
							'<div class="col-lg-4 col-md-6 col-sm-12">'
								+'<div class="kt-portlet kt-portlet--mobile osl-prj-info-obj">'
									+'<div class="kt-portlet__head kt-portlet__head--lg">'
										+'<div class="kt-portlet__head-label">'
											+'<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid"><input type="checkbox" value="'+idx+'" name="prjCheckbox" id="prjCheckbox_'+map.prjId+'" data-datatable-id="prj1001PrjTable">&nbsp;<span></span></label>'
											+'<h5 class="kt-font-boldest">'
												+'<span class="badge '+rnClass+' kt-margin-r-10">'+rnStr+'</span>'
												+'<span class="badge badge-primary kt-margin-r-10">'+$.osl.escapeHtml(map.prjTypeNm)+'</span>'
											+'</h5>'
										+'</div>'
										+'<div class="kt-portlet__head-toolbar">'
											+'<div class="kt-portlet__head-wrapper">'
												+'<button type="button" class="btn btn-outline-primary btn-bold btn-font-sm btn-elevate btn-elevate-air"  data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">'
													+'<i class="fa fa-bars osl-padding-r0"></i>'
												+'</button>'
												+'<div class="dropdown-menu dropdown-menu-right" data-datatable-rownum="'+idx+'">'
													+prjGrpDelCdMenuList[map.delCd].join('')
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>'
									+'<div class="kt-portlet__body">'
										+'<div class="osl-d-flex kt-padding-l-15 osl-align-items-center">'
											+'<div class="kt-media kt-media--xl kt-media--circle kt-media--info osl-flex-shrink-0 osl-margin-r-2rm">'
												+'<span style="background-color:'+prjBgColor+';color:'+prjColor+';">'+map.prjAcrm+'</span>'
											+'</div>'
											+'<div class="osl-d-flex osl-flex-column osl-margin-r-auto">'
												+'<h5 class="kt-font-boldest" title="'+$.osl.escapeHtml(map.prjNm)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">'+$.osl.escapeHtml(map.prjNm)+'</h5>'
												+'<span class="text-muted" title="'+$.osl.escapeHtml(map.prjDesc)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">'+$.osl.escapeHtml(map.prjDesc)+'</span>'
											+'</div>'
										+'</div>'
										+'<div class="osl-d-flex osl-flex-wrap osl-margin-t-2rm kt-padding-l-20">'
											+'<div class="osl-margin-r-3rm osl-margin-b-175rm osl-d-flex osl-flex-column">'
												+'<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>'+$.osl.lang("prj1001.startDate")+'</span>'
												+'<h5><span class="badge badge-primary">'+$.osl.escapeHtml(map.startDt)+'</span></h5>'
											+'</div>'
											+'<div class="osl-margin-r-3rm osl-margin-b-175rm osl-d-flex osl-flex-column">'
												+'<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>'+$.osl.lang("prj1001.endDate")+'</span>'
												+'<h5><span class="badge badge-danger">'+$.osl.escapeHtml(map.endDt)+'</span></h5>'
											+'</div>'
											+'<div class="osl-flex-row-fluid osl-margin-b-175rm">'
												+'<div class="osl-progress">'
													+'<div class="osl-margin-b-1rm"><i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i><span>'+$.osl.lang("prj1001.completedRatio")+'</span></div>'
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
														+'<a href="#" class="osl-widget-info__item-title">'+$.osl.lang("prj1001.requestAll")+'</a>'
														+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqAllCnt)+'</div>'
													+'</div>'
												+'</div>'
												+'<div class="osl-widget-info__item osl-flex-row-fluid">'
													+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqInProgress.png"></div>'
													+'<div class="osl-widget-info__item-info">'
														+'<a href="#" class="osl-widget-info__item-title">'+$.osl.lang("prj1001.requestInProgress")+'</a>'
														+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqInProgressCnt)+'</div>'
													+'</div>'
												+'</div>'
												+'<div class="osl-widget-info__item osl-flex-row-fluid">'
													+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqDone.png"></div>'
													+'<div class="osl-widget-info__item-info">'
														+'<a href="#" class="osl-widget-info__item-title">'+$.osl.lang("prj1001.requestDone")+'</a>'
														+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqDoneCnt)+'</div>'
													+'</div>'
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>'
										+'<div class="kt-portlet__foot kt-portlet__foot--sm osl-padding-none">'
											+'<div class="osl-chart--project" id="chart_'+map.prjId+'">등록된 요구사항이 없습니다.</div>'
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
					
					//프로젝트 요구사항 차트 데이터 세팅
					$.each(Object.keys(chartDataMap), function(idx, loopPrjId){
						//요구사항 목록
						var selPrjReqList = chartDataMap[loopPrjId];
						
						//x:y = 2:1
						var dataSize = (selPrjReqList.length/2);
						if(dataSize < 0){
							dataSize = 1;
						}
						var yCnt = Math.round(Math.sqrt(dataSize));
						var xCnt = Math.round(yCnt*2);
						var yCursor = 0;
						var xCursor = 0;
						
						var series = [];
						var seriesX = [];
						//처리유형별 data
						var reqProTypeList = {};
						
						//cursor
						var cursor = 0;
						
						//요구사항 loop
						$.each(selPrjReqList, function(reqIdx, reqInfo){
							//x축 데이터
							seriesX.push({
								x: (xCursor).toString(),
								y: parseInt(reqInfo.reqProType),
								reqProTypeNm: reqInfo.reqProTypeNm,
								reqId: reqInfo.reqId,
								reqNm: reqInfo.reqNm,
								reqOrd: reqInfo.reqOrd
							});
							xCursor++;
							
							
							//x축이 가득 차는경우 초기화
							if(xCursor >= xCnt || reqIdx == (selPrjReqList.length-1)){
								xCursor = 0;
								series.push({
									name: yCursor,
									data: seriesX
								});
								yCursor++;
								seriesX = [];
							}
						});
						
						//차트 옵션
						var chartOption = $.extend(true, {}, chartDefaultOption);
						chartOption.series = series;
						
						var targetElem = document.querySelector("#chart_"+loopPrjId);
						if(!$.osl.isNull(targetElem) && targetElem){
							targetElem.innerText = "";
							var chart = new ApexCharts(document.querySelector("#chart_"+loopPrjId), chartOption);
							chart.render();
						}
					});
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
		
		//휴지통 목록 이벤트
		$("#prjTrashListMoveBtn").click(function(){
			$.osl.datatable.list["prj1001PrjTable"].targetDt.options.data.source.read.params.delCd = "01";
			$(this).attr("hidden","hidden");
			$("#prjListMoveBtn").removeAttr("hidden");

			//추가, 수정, 삭제 버튼 감추기
			$("button[data-datatable-id=prj1001PrjTable][data-datatable-action=insert],"
					+"button[data-datatable-id=prj1001PrjTable][data-datatable-action=update],"
					+"button[data-datatable-id=prj1001PrjTable][data-datatable-action=delete]").attr("hidden","hidden");
			 
			//복구, 완전 삭제 버튼 보이기
			$("button[data-datatable-id=prj1001PrjTable][data-datatable-action=prjRedo],"
					+"button[data-datatable-id=prj1001PrjTable][data-datatable-action=prjDelete]").removeAttr("hidden","hidden");
			
			//데이터 테이블 조회
			$.osl.datatable.list["prj1001PrjTable"].targetDt.reload();
		});

		//돌아가기 버튼 이벤트
		$("#prjListMoveBtn").click(function(){
			$.osl.datatable.list["prj1001PrjTable"].targetDt.options.data.source.read.params.delCd = "02";
			$(this).attr("hidden","hidden");
			$("#prjTrashListMoveBtn").removeAttr("hidden");
			
			//추가, 수정, 삭제 버튼 보이기
			$("button[data-datatable-id=prj1001PrjTable][data-datatable-action=insert],"
					+"button[data-datatable-id=prj1001PrjTable][data-datatable-action=update],"
					+"button[data-datatable-id=prj1001PrjTable][data-datatable-action=delete]").removeAttr("hidden");
			
			//복구, 완전 삭제 버튼 감추기
			$("button[data-datatable-id=prj1001PrjTable][data-datatable-action=prjRedo],"
					+"button[data-datatable-id=prj1001PrjTable][data-datatable-action=prjDelete]").attr("hidden","hidden");
			
			//데이터 테이블 조회
			$.osl.datatable.list["prj1001PrjTable"].targetDt.reload();
		});
		
		//프로젝트 그룹 복구처리
		var fnPrjRedoUpdate = function(redoDataList, datatableId){
			//선택 프로젝트 그룹 휴지통으로 이동
			var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/prj/prj1000/prj1000/updatePrj1000PrjGrpTrashRedoListAjax.do'/>"}
					,{deleteDataList: JSON.stringify(redoDataList)});
			//AJAX 전송 성공 함수
			ajaxObj.setFnSuccess(function(data){
				if(data.errorYn == "Y"){
	   				$.osl.alert(data.message,{type: 'error'});
	   			}else{
	   				//삭제 성공
	   				$.osl.toastr(data.message);
	   				
	   				//datatable 조회
	   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
	   			}
			});
			
			//AJAX 전송
			ajaxObj.send();
		}
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
	};
	
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
