<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-grid kt-grid--desktop kt-grid--ver-desktop  kt-inbox" id="kt_inbox">
	<div class="kt-grid__item kt-portlet kt-inbox__aside" id="kt_inbox_aside">
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-outline-brand btn-bold btn-elevate btn-elevate-air" data-datatable-id="prj1100PrjTable" data-datatable-action="select" title="데이터 조회" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
				<i class="fa fa-list"></i><span class="osl-resize__display--show">조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-elevate btn-elevate-air" data-datatable-id="prj1100PrjTable" data-datatable-action="insert" title="프로세스 생성" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2">
				<i class="fa fa-plus"></i><span class="osl-resize__display--show">생성</span>
			</button>
		</div>
		<div class="osl-datatable-search osl-datatable-search__btn-title--none kt-margin-t-15" data-datatable-id="prj1100PrjTable"></div>
		<div class="kt-inbox__nav">
			<ul class="kt-nav" id="prj1100CardTable">
			</ul>
			<div class="kt_datatable osl-datatable-footer__divide" id="prj1100PrjTable"></div>
			<!-- 
			<ul class="kt-nav">
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa fa-genderless kt-font-warning"></i>
						<span class="kt-nav__link-text">전체 프로세스</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa fa-genderless kt-font-success"></i>
						<span class="kt-nav__link-text">확정 프로세스</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa fa-genderless kt-font-info"></i>
						<span class="kt-nav__link-text">폐기 프로세스</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa flaticon2-plus"></i>
						<span class="kt-nav__link-text">프로세스 분류 생성</span>
					</a>
				</li>
			</ul>
			 -->
		</div>
	</div>
	<div class="kt-grid__item kt-grid__item--fluid kt-portlet kt-inbox__list kt-inbox__list--shown" id="processFlowLayerMain">
		<div class="kt-portlet__head">
			<div class="kt-inbox__toolbar kt-inbox__toolbar--extended">
				<div class="kt-inbox__actions kt-inbox__actions--expanded">
					<div class="kt-inbox__panel">
						<button type="button" class="kt-inbox__icon" data-flow-action="zommCtrl" data-toggle="kt-tooltip" title="Zoom reset" data-zoom="reset">
							<i class="flaticon2-refresh-button"></i>
						</button>
						<button type="button" class="kt-inbox__icon" data-flow-action="zommCtrl" data-toggle="kt-tooltip" title="Zoom in" data-zoom="in">
							<i class="flaticon2-arrow-1"></i>
						</button>
						<button type="button" class="kt-inbox__icon" data-flow-action="zommCtrl" data-toggle="kt-tooltip" title="Zoom out" data-zoom="out">
							<i class="flaticon2-size"></i>
						</button>
						<button type="button" class="kt-inbox__icon" data-flow-action="insert" data-toggle="kt-tooltip" title="Create">
							<i class="flaticon2-add-square"></i>
						</button>
						<button type="button" class="kt-inbox__icon" data-toggle="kt-tooltip" title="Delete">
							<i class="flaticon2-rubbish-bin"></i>
						</button>
						<button type="button" class="kt-inbox__icon" data-toggle="kt-tooltip" title="Mark as read">
							<i class="flaticon2-writing"></i>
						</button>
						<button type="button" class="kt-inbox__icon" data-toggle="kt-tooltip" title="Move">
							<i class="flaticon2-expand"></i>
						</button>
					</div>
				</div>
				<div class="kt-inbox__search d-flex">
					<button class="kt-inbox__icon osl-inbox__aside-menu-bar" id="osl-inbox__aside-menu-bar" data-toggle="kt-tooltip" title="Aside Menu">
						<i class="fa fa-bars"></i>
					</button>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search">
						<div class="input-group-append">
							<span class="input-group-text">
								<i class="flaticon2-magnifier-tool"></i>
							</span>
						</div>
					</div>
				</div>
				<div class="kt-inbox__controls">
					<button type="button" class="kt-inbox__icon pulse pulse-success kt-margin-0" data-flow-action="save" data-toggle="kt-tooltip" title="Save" id="processSaveBtn">
						<span class="pulse-ring kt-margin-0 kt-hide"></span>
						<i class="fa fa-save"></i>
					</button>
					<div class="btn-group" data-toggle="kt-tooltip" title="Settings">
						<button type="button" class="kt-inbox__icon" data-toggle="dropdown">
							<i class="flaticon-more-1"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right dropdown-menu-fit dropdown-menu-md">
							<!--begin::Nav-->
							<ul class="kt-nav">
								<li class="kt-nav__head">
									Export Options
									<i class="flaticon2-information" data-toggle="kt-tooltip" data-placement="right" title="Click to learn more..."></i>
								</li>
								<li class="kt-nav__separator"></li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-drop"></i>
										<span class="kt-nav__link-text">Users</span>
									</a>
								</li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-calendar-8"></i>
										<span class="kt-nav__link-text">Reports</span>
										<span class="kt-nav__link-badge">
											<span class="kt-badge kt-badge--bold kt-badge--danger">9</span>
										</span>
									</a>
								</li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-drop"></i>
										<span class="kt-nav__link-text">Statements</span>
									</a>
								</li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-new-email"></i>
										<span class="kt-nav__link-text">Customer Support</span>
									</a>
								</li>
								<li class="kt-nav__separator"></li>
								<li class="kt-nav__foot">
									<a class="btn btn-label-brand btn-bold btn-sm" href="#">Proceed</a>
									<a class="btn btn-clean btn-bold btn-sm" href="#" data-toggle="kt-tooltip" data-placement="right" title="Click to learn more...">Learn more</a>
								</li>
							</ul>

							<!--end::Nav-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="kt-portlet__body overflow-hidden osl-process__flow-main">
			<div class="osl-process__flow-container">
				<div class="osl-mask" id="flowMaskDiv">
					<span>프로세스를 선택해주세요.</span>
				</div>
				<div class="osl-process__flow-chart d-inline-block kt-hidden" id="flowChartDiv">
					
				</div>
			</div>
		</div>
	</div>
</div>
<script>
"use strict";
var flowChart = $("#flowChartDiv");
	var zoomObj;
var OSLPrj1100Popup = function () {
	//현재 선택된 프로세스
	var selProcessId;
	
	//프로세스 데이터 변경 확인 변수
	var processChgCheck = {_flag: false};
	
	//zoom
	var currentZoom = 2;
	
	//프로세스 - true일때 링크 데이터 검증
	var processEditMode = false;
	
	//private functions
	var documentSetting = function(){
		//프로세스 데이터 변화 감지
		Object.defineProperty(processChgCheck, 'flag', {
			get: function() {
				return this._flag;
			},
			set: function(newVal) {
				//데이터 변화 시
				if(newVal){
					$("#processSaveBtn > .pulse-ring").removeClass("kt-hide");
					$("#processSaveBtn > i.fa").addClass("kt-font-brand");
					
					//페이지 이동 시 저장 문구 팝업
					$(window).on("beforeunload", function(){
						return true;
					});
				}else{
					$("#processSaveBtn > .pulse-ring").addClass("kt-hide");
					$("#processSaveBtn > i.fa").removeClass("kt-font-brand");
					
					$(window).off("beforeunload");
				}
				this._flag = newVal;
			},
		});
		
		var data = {
			operators: {
				operator1: {top: 20,left: 20,properties: {id: "operator1",title: 'Operator 1',editable: true,inputs: {input_1: {label: 'Input 1'}},outputs: {output_1: {label: 'Output 1'}}}},
				operator2: {top: 240,left: 20,properties: {id: "operator2",title: 'Operator 2',editable: true,inputs: {input_1: {label: 'Input 1'}},outputs: {output_1: {label: 'Output 1'}}}},
				operator3: {top: 400,left: 300,properties: {id: "operator3",title: 'Operator 3',editable: true,inputs: {input_1: {label: 'Input 1'}},outputs: {output_1: {label: 'Output 1'}}}},
				operator4: {top: 80,left: 600,properties: {id: "operator4",title: 'Operator 4',editable: true,inputs: {input_1: {label: 'Input 1'}},outputs: {output_1: {label: 'Output 1'}}}},
				operator5: {top: 80,left: 900,properties: {id: "operator5",title: 'Operator 5',editable: true,inputs: {input_1: {label: 'Input 1'}},outputs: {output_1: {label: 'Output 1'}}}},
				operator6: {top: 400,left: 600,properties: {id: "operator6",title: 'Operator 6',editable: true,inputs: {input_1: {label: 'Input 1'}},outputs: {output_1: {label: 'Output 1'}}}},
			}
		};
		
		//flowchart 생성
		flowChart.flowchart({
				multipleLinksOnInput: true,
				multipleLinksOnOutput: true,
				canUserEditLinks: true,
				distanceFromArrow:1,
				linkWidth:1,
				defaultLinkColor: "#5867dd",
				defaultOperatorClass: "osl-flowchart__operator",
				onLinkCreate: function(linkId, linkData){
					//프로세스 에디트 모드일때만 검증
					if(!processEditMode){
						return true;
					}
					var fromOperatorId = linkData.fromOperator;
					var toOperatorId = linkData.toOperator;
					var fromOperatorData = flowChart.flowchart("getOperatorData",fromOperatorId);
					
					//링크 반복 체크( A -> B -> A 체크)
					if(!fnLinksLimitLoopChk(fromOperatorId, toOperatorId)){
						$.osl.alert("작업 흐름(단계)는 반복 진행될 수 없습니다.</br> A -> B -> A 불가");
						return false;
					}
					
					//이미 연결된 링크인경우 링크 제거하기
					var fromLinkList = flowChart.flowchart("getData").links;
					var fromLinkChkFlag = true;
					
					//연결된 링크가 이미 있는 경우 기존 링크 제거
					if(!$.osl.isNull(fromLinkList) && Object.keys(fromLinkList).length > 0){
						//링크 전체 검수
						$.each(fromLinkList, function(fromLinkId, fromLinkData){
							//현재 연결하려는 링크데이터가 이미 있는경우
							if(fromLinkData.fromOperator == fromOperatorId && fromLinkData.toOperator == toOperatorId){
								//기존 링크 삭제
								flowChart.flowchart("deleteLink", fromLinkId);
								
								//flowNextId = null
								var flowIdx = fromOperatorData.properties["flowNextId"].indexOf(toOperatorId);
								fromOperatorData.properties["flowNextId"].splice(flowIdx, 1);
								flowChart.flowchart("setOperatorData",fromOperatorId,fromOperatorData);
								
								fromLinkChkFlag = false;
								return false;
							}
						});
					}
					
					//기존 링크 존재하는 경우 링크 제거 - 현재 동작 취소
					if(fromLinkChkFlag === false){
						return false;
					}
					//flowNextId null인경우 배열 대입
					if(!fromOperatorData.properties.hasOwnProperty("flowNextId")){
						fromOperatorData.properties["flowNextId"] = [];
					}
					
					//현재 작업흐름 데이터에 flowNextId 대입
					fromOperatorData.properties["flowNextId"].push(toOperatorId);
					flowChart.flowchart("setOperatorData",fromOperatorId,fromOperatorData);
					
					return true;
				},
				onLinkDelete: function(linkId, tmp){
					//console.log(linkId, tmp);
					return true;
				},
	            onLinkSelect: function(linkId){
	            	//링크 선택 불가
	            	return false;
	            },
				onAfterChange: function(changeType){
					//작업흐름 초기화 아닌 경우
					if(processEditMode && changeType != "operator_create"){
						//작업흐름 데이터 변경인경우
						processChgCheck.flag = true;
					}
					//작업흐름css에 error인경우 우선 제거
					var errorList = $(".flowchart-operator.error");
					if(errorList.length > 0){
						errorList.removeClass("error");
					}
				},
				onOperatorSelect: function(operatorId){
					//작업흐름css에 error인경우 우선 제거
					var errorList = $(".flowchart-operator.error");
					if(errorList.length > 0){
						errorList.removeClass("error");
					}
				}
		});
		
		//작업흐름 dropdown menu에 event 걸기
		$("#processFlowLayerMain").on("click",".osl-flowchart__operator .flowchart-operator-menu .dropdown-menu .dropdown-item, button[data-flow-action]",function(){
			var flowAction = $(this).data("flow-action");
			//현재 작업흐름 데이터 저장
			if(flowAction == "save"){
				//모든 작업흐름이 연결되어있는지 확인
				var rtnValue = fnFlowDoneCheck();
				if(rtnValue === false){
					$.osl.toastr("저장이 취소되었습니다.",{type: "warning"});
				}else{
					//시작 단계, 종료 단계 confirm
					var startFlow = flowChart.flowchart("getOperatorData", rtnValue.startFlowId);
					var endFlow = flowChart.flowchart("getOperatorData", rtnValue.endFlowId);
					
					var confirmMsg = '시작 단계: '+startFlow.properties.title+'</br>'
								+'종료 단계: '+endFlow.properties.title+'</br>'
								+'</br>프로세스 데이터를 저장하시겠습니까?';
					
					$.osl.confirm(confirmMsg,{html: true},function(result) {
		    	        if (result.value) {
		    	        	//프로세스 저장
		    	        	processChgCheck.flag = false;
		    	        }
		    		});	
					
				}
			}
			//선택 작업흐름 수정
			else if(flowAction == "edit"){
				
			}
			//선택 작업흐름 제거
			else if(flowAction == "delete"){
				
			}
			//선택 작업흐름 상세정보
			else if(flowAction == "detail"){
				
			}
			//줌인, 줌아웃, 리셋 버튼 이벤트
			else if(flowAction == "zommCtrl"){
				var zoomAction = $(this).data("zoom");
				
				//동작 데이터 없는 경우 중지
				if($.osl.isNull(zoomAction)){
					return true;
				}else{
					fnFlowChartZoom(zoomAction);
				}
			}
			//작업흐름 생성
			else if(flowAction == "insert"){
				var data = {
						type:"insert",
						paramPrjGrpId: $.osl.selPrjGrpId,
						paramPrjId: $.osl.selPrjId,
						paramProcessId: selProcessId
				};
				var options = {
					autoHeight: false,
					modalSize: "md",
					idKey: selProcessId,
					modalTitle: $.osl.lang("prj1004.insert.title"),
					closeConfirm: false,
				};
				
				$.osl.layerPopupOpen('/prj/prj1000/prj1100/selectPrj1102View.do',data,options);
			}
		});
		
		zoomObj = panzoom($("#flowChartDiv")[0],{
			maxZoom: 2,
			minZoom: 0.5,
		});
		
		//줌 동작시 플로우차트 배율 변경
		zoomObj.on('zoom', function(e) {
			flowChart.flowchart('setPositionRatio', e.getTransform().scale);
		});
		
		//사이드바에 프로세스 목록 이벤트 (테블릿, 모바일 좌측 슬라이드 메뉴 적용)
		new KTOffcanvas($("#kt_inbox_aside")[0], {
            overlay: true,  
            baseClass: 'kt-inbox__aside',
            toggleBy: 'osl-inbox__aside-menu-bar'
        });
		
		// begin:: 그룹 요구사항 관리 데이터테이블
		$.osl.datatable.setting("prj1100PrjTable",{
			cardUiTarget: $("#prj1100CardTable"),
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1100/selectPrj1100ProcessListAjax.do",
						params:{
							delCd: "02"
						}
					}
				},
				pageSize : 5,
			},
			toolbar:{
				layout: ['pagination'],
				items:{
					pagination:{
						pages: {
							desktop: {
								layout: 'compact'
							},
							tablet: {
								layout: 'compact'
							},
						},
					 },
					 info: false
				 }
			},
			columns: [
				{field: 'processId', title: 'ID', textAlign: 'center', width: 150, search: true},
				{field: 'processNm', title: '이름 ', textAlign: 'center', width: 100, search: true},
			],
			actionBtn:{
				"update": false,
				"delete": false
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							modalTitle: "신규 프로세스 등록",
							closeConfirm: false,
						};
					
					$.osl.layerPopupOpen('/prj/prj1000/prj1100/selectPrj1101View.do',data,options);
				},
				"update":function(rowData, datatableId, type, rowNum, elem){
					var data = {
							type:"update",
							paramPrjGrpId: rowData.prjGrpId,
							paramPrjId: rowData.prjId,
							paramProcessId: rowData.processId,
					};
					var options = {
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							modalTitle: "신규 프로세스 수정",
							closeConfirm: false,
						};
					
					$.osl.layerPopupOpen('/prj/prj1000/prj1100/selectPrj1101View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					//AJAX 설정
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/prj/prj1000/prj1100/deletePrj1100ProcessInfoAjax.do'/>"}
							,{deleteDataList: JSON.stringify(rowDatas)});
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
			   				$.osl.alert(data.message,{type: 'error'});
			   			}else{
			   				//삭제 성공
			   				$.osl.toastr(data.message);
			   				
			   				//datatable 조회
			   				if(!$.osl.isNull($.osl.datatable.list[datatableId])){
				   				$.osl.datatable.list[datatableId].targetDt.reload();
			   				}
			   			}
					});
					
					//AJAX 전송
					ajaxObj.send();
				},
				"click": function(rowData, datatableId, type, rowNum, elem){
					//mask 제거
					$("#flowMaskDiv").hide();
					
					//플로우차트 div 열기
					$("#flowChartDiv").removeClass("kt-hidden");
					
					//작업흐름 데이터 불러오기
					flowChart.flowchart("setData",JSON.parse('{"operators":{"operator6":{"top":380,"left":1180,"properties":{"id":"operator6","title":"Operator 6","editable":true,"inputs":{"input_1":{"label":"Input 1"}},"outputs":{"output_1":{"label":"Output 1"}}}},"operator1":{"top":20,"left":20,"properties":{"id":"operator1","title":"Operator 1","editable":true,"inputs":{"input_1":{"label":"Input 1"}},"outputs":{"output_1":{"label":"Output 1"}},"flowNextId":["operator4"]}},"operator2":{"top":240,"left":20,"properties":{"id":"operator2","title":"Operator 2","editable":true,"inputs":{"input_1":{"label":"Input 1"}},"outputs":{"output_1":{"label":"Output 1"}},"flowNextId":["operator4","operator3"]}},"operator4":{"top":80,"left":600,"properties":{"id":"operator4","title":"Operator 4","editable":true,"inputs":{"input_1":{"label":"Input 1"}},"outputs":{"output_1":{"label":"Output 1"}},"flowNextId":["operator5"]}},"operator3":{"top":400,"left":440,"properties":{"id":"operator3","title":"Operator 3","editable":true,"inputs":{"input_1":{"label":"Input 1"}},"outputs":{"output_1":{"label":"Output 1"}},"flowNextId":["operator6"]}},"operator5":{"top":80,"left":900,"properties":{"id":"operator5","title":"Operator 5","editable":true,"inputs":{"input_1":{"label":"Input 1"}},"outputs":{"output_1":{"label":"Output 1"}},"flowNextId":["operator6"]}}},"links":{"0":{"fromOperator":"operator1","fromConnector":"output_1","fromSubConnector":0,"toOperator":"operator4","toConnector":"input_1","toSubConnector":0},"1":{"fromOperator":"operator2","fromConnector":"output_1","fromSubConnector":0,"toOperator":"operator4","toConnector":"input_1","toSubConnector":0},"2":{"fromOperator":"operator2","fromConnector":"output_1","fromSubConnector":0,"toOperator":"operator3","toConnector":"input_1","toSubConnector":0},"3":{"fromOperator":"operator4","fromConnector":"output_1","fromSubConnector":0,"toOperator":"operator5","toConnector":"input_1","toSubConnector":0},"4":{"fromOperator":"operator3","fromConnector":"output_1","fromSubConnector":0,"toOperator":"operator6","toConnector":"input_1","toSubConnector":0},"5":{"fromOperator":"operator5","fromConnector":"output_1","fromSubConnector":0,"toOperator":"operator6","toConnector":"input_1","toSubConnector":0}},"operatorTypes":{}}'));
					processEditMode = true;
					
					//선택 프로세스 Id
					selProcessId = rowData.processId;
					
					//선택 효과
					$(elem).parent().find(".osl-datatable__card.active").removeClass("active");
					$(elem).addClass("active");
				}
			},
			callback:{
				initComplete: function(evt,config){
					$("#prj1100PrjTable .kt-datatable__table").css({visibility: "hidden", height: 0});
					$("#prj1100CardTable").show();
				},
				ajaxDone: function(evt, list){
					var processStr = '';
					$.each(list, function(idx, map){
						var active = '';
						if(idx == 0){
							active = "kt-nav__item--active";
						}
						//카드 UI
						processStr +=
							'<li class="kt-nav__item osl-datatable__card" data-datatable-rownum="'+idx+'">'
								+'<a href="#" class="kt-nav__link" data-action="list" data-type="inbox" title="'+$.osl.escapeHtml(map.processNm)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">'
									+'<i class="kt-nav__link-icon flaticon-star osl-favorites--active"></i>'
									+'<span class="kt-nav__link-text">'+$.osl.escapeHtml(map.processNm)+'</span>'
									+'<div class="dropdown dropdown-inline">'
										//+'<span class="kt-badge kt-badge--unified-success kt-badge--md kt-badge--rounded kt-badge--boldest">'+map.reqCnt+'</span>'
										+'<button type="button" class="kt-inbox__icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'
											+'<i class="flaticon-more kt-font-lg"></i>'
										+'</button>'
										+'<div class="dropdown-menu dropdown-menu-right">'
											+'<div class="dropdown-item" data-datatable-id="prj1100PrjTable" data-datatable-expans="dropdown" data-datatable-action="update"><i class="fa fa-edit kt-font-brand"></i>수정</div>'
											+'<div class="dropdown-item" data-datatable-id="prj1100PrjTable" data-datatable-expans="dropdown" data-datatable-action="delete"><i class="fa fa-trash kt-font-brand"></i>삭제</div>'
											+'<div class="dropdown-item" data-datatable-id="prj1100PrjTable" data-datatable-expans="dropdown" data-datatable-action="delete"><i class="fa fa-trash kt-font-brand"></i>폐기</div>'
										+'</div>'
									+'</div>'
								+'</a>'
							+'</li>';
					});
					
					//로드된 데이터 CARD형식으로 추가
					$("#prj1100CardTable").html(processStr);
				}
			}
		});
	};
	
	//링크 연결이 무한 루프인지 체크
	var fnLinksLimitLoopChk = function(fromOperatorId, toOperatorId){
		//기준 Id와 다음 작업흐름 ID가 같은 경우 연결 중지
		if(fromOperatorId == toOperatorId){
			return false;
		}
		
		//현재 작업흐름 데이터
		var fromOperator = flowChart.flowchart("getOperatorData", fromOperatorId);
		var toOperator = flowChart.flowchart("getOperatorData", toOperatorId);
		
		//flowNextId 체크
		if(toOperator.properties.hasOwnProperty("flowNextId") && toOperator.properties.flowNextId.length > 0){
			var toOperatorFlowNextId = toOperator.properties.flowNextId;
			
			var rtnValue = true;
			//다음 작업흐름 Id
			$.each(toOperatorFlowNextId, function(idx, nextFlowId){
				//다음 작업흐름 ID가 null인 경우 skip
				if($.osl.isNull(toOperatorFlowNextId)){
					return true;
				}else{
					//함수 재귀 호출 - 반환값이 false인경우 loop 중지
					if(!fnLinksLimitLoopChk(fromOperatorId,nextFlowId)){
						rtnValue = false;
						return false;
					}
				}
			});
			
			return rtnValue;
		}else{
			return true;
		}
	};

	/**
	*	모든 작업흐름이 연결되어있는지 체크
	*	- 다음 작업흐름 ID가 없는 작업흐름은 1개 (해당 작업흐름은 마지막 단계 - 최종완료)
	*	- 시작 작업흐름은 1개 (이전 작업흐름과 연결점이 없는 작업흐름이 2개 이상인 경우 오류)
	**/
	var fnFlowDoneCheck = function(){
		var flowList = flowChart.flowchart("getData").operators;
		
		//작업흐름 키 목록
		var flowKeys = Object.keys(flowList);
		
		var doneFlowIds = [];
		
		//작업흐름 목록 loop
		$.each(flowList, function(flowId, flowData){
			var flowNextId = flowData.properties.flowNextId;
			
			//다음 작업흐름 목록 체크
			if(!$.osl.isNull(flowNextId) && flowNextId.length > 0){
				$.each(flowNextId, function(idx, value){
					var flowIdx = flowKeys.indexOf(value);
					
					//index에 없는 경우 중복, skip
					if(flowIdx == -1){
						return true;
					}else{
						//다음 작업흐름Id 제거
						flowKeys.splice(flowIdx,1);
					}
					
				})
			}else{
				//다음 작업흐름 Id가 없는 경우 최종완료 작업흐름
				doneFlowIds.push(flowId); 
			}
		});
		
		var errorAlert = [];
		
		//연결안된 작업흐름이 2개 이상인경우 오류
		if(flowKeys.length > 1){
			$.each(flowKeys, function(idx, map){
				$(".flowchart-operator[data-operator-id="+map+"]").addClass("error");
			});
			
			errorAlert.push(flowKeys.length+"개의 시작 단계가 발견되었습니다.");
		}
		
		//최종완료성 작업흐름이 2개 이상인경우 오류
		if(doneFlowIds.length > 1){
			$.each(doneFlowIds, function(idx, map){
				$(".flowchart-operator[data-operator-id="+map+"]").addClass("error");
			});
			
			errorAlert.push(doneFlowIds.length+"개의 종료 단계가 발견되었습니다.");
		}
		
		//에러 발견시
		if(errorAlert.length > 0){
			$.osl.alert(errorAlert.join("</br>")+"</br>단계 연결 데이터를 확인하세요.",{type: "error"});
			return false;
		}else{
			return {startFlowId: flowKeys[0], endFlowId: doneFlowIds[0]};
		}
	};
	
	//flowchart zoom function
	var fnFlowChartZoom = function(type){
		//줌 초기화
		if(type == "reset"){
			//줌 일시정지
			zoomObj.pause();
			
			//위치, 배율 조정
			zoomObj.moveTo(0,0);
			zoomObj.zoomAbs(0,0,1);
			
			//줌 재개
			zoomObj.resume();
			return true;
		}
		//줌 가능한 수치
		var possibleZooms = [2,1.5,1,0.75,0.5];
		
		//줌인
		if(type == "in"){
			currentZoom--;
			if(currentZoom < 0){
				currentZoom = 0;
			}
		}
		//줌아웃
		else if(type == "out"){
			currentZoom++;
			if(currentZoom > (possibleZooms.length-1)){
				currentZoom = (possibleZooms.length-1);
			}
		}
		
		zoomObj.zoomAbs(0,0,possibleZooms[currentZoom]);
	}
	
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLPrj1100Popup.init();
});
</script>
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
