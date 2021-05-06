<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<!-- fullcalendar CSS, JS-->
<link rel='stylesheet' href='<c:url value='/plugins/custom/fullcalendar/main.css'/>' type='text/css'>

<script src="<c:url value='/plugins/custom/fullcalendar/main.js'/>"></script>
<script src="<c:url value='/plugins/custom/fullcalendar/locales-all.js'/>"></script>

<div class="kt-portlet kt-portlet--mobile osl-desktop-flex-flow--row osl-mobile-flex-flow--row osl-portlet__body-style--none kt-margin-b-0">
	<div class="kt-portlet kt-portlet--mobile osl-calendar osl-desktop-max-w-285 float-left kt-margin-b-0" id="prj5000">
		<div class="kt-portlet__head kt-hidden-desktop kt-hidden-tablet">
			<div class="kt-portlet__head-label">
				<h4 class="kt-font-boldest kt-font-brand">
					<i class="fa fa-th-large kt-margin-r-5"></i>검색 조건
				</h4>
			</div>
			<div class="kt-portlet__head-toolbar">
	         	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
			</div>
		</div>
		<div class="kt-portlet__body osl-min-h-px--415">
			<div class="osl-desktop-flex-flow--row osl-mobile-flex-flow--row w-100" id="prj5000LeftDiv">
				<button type="button" id="saveBtn" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-b-10 btn-elevate btn-elevate-air w-100" title="일정 등록" data-title-lang-cd="prj5000.button.title.insert" data-toggle="kt-tooltip" data-skin="brand">
					<i class="fa fa-calendar-plus"></i><span data-lang-cd="prj5000.button.title.insert">일정등록</span>
				</button>
				<div class="prj5000Datepicker" id="prj5000Datepicker"></div>
				
				<div class="osl-calendar-group-list__leftList" id="eventGroupList" >
				
					<div class="eventGroupFrame" title="휴일">
						<div class="eventGroupChkBox">
							<label class="kt-checkbox kt-checkbox--success">
								<i class="fa fa-calendar-alt"></i><input type="checkbox" checked> 휴일
								<span></span>
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet kt-portlet--mobile osl-mobile-769-padding-l-20 osl-portlet__body-style--none kt-margin-b-0">
		<div class="kt-portlet__body osl-mobile-768-margin-t-20 kt-padding-0" id="prj5000RightDiv">
			<div class="kt-portlet kt-margin-b-0">
				<div class="kt-portlet__body osl-min-h-px--415">
					<div id="kt_calendar"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- begin page script -->

<script>
"use strict";

var datepickerObj;
var calendar;

//조회 데이터
var evtDataMap = {};
//추가된 월 저장 변수
var evtDataIsMap = [];
//프로젝트 계층별 일정
var evtPrjTreeDataMap = {};
//사용자별 일정
var evtUsrDataMap = {};
//휴일 데이터
var evtHoliDataMap = [];

var OSLPrj5000Popup = function () {
	
	
	//브라우저별 마우스 휠 이벤트
	var mousewheelevt=(/Firefox/i.test(navigator.userAgent))? "DOMMouseScroll" : "mousewheel";

	//상위 기본 마우스 휠 스크롤 이벤트 중지
	function wheel(e) {
		e = e || window.event;
	  if (e.preventDefault)
	      e.preventDefault();
	  e.returnValue = false;  
	}
	//마우스 휠 이벤트 리스너 추가
	function disable_scroll(){
	     if (document.attachEvent){
	         document.attachEvent("on"+mousewheelevt, wheel);
	     }
	     else if (document.addEventListener) {
	         document.addEventListener(mousewheelevt, wheel, {passive: false});                 
	     }
	}

	//마우스 휠 이벤트 리스너 제거    
	function enable_scroll() {
	     if (document.removeEvent){
	         document.removeEvent("on"+mousewheelevt, wheel);
	     }
	     else if (document.removeEventListener) {
	         document.removeEventListener(mousewheelevt, wheel, {passive: false});  
	     }
	}
	
	var documentSetting = function(){
		var portlet = new KTPortlet('prj5000', $.osl.lang("portlet"));

		var ww = window.innerWidth;
		if(ww<768){
			portlet.collapse();
		}else{
			portlet.expand();
		}

		$(window).resize(function(){
			var ww = window.innerWidth;
			if(ww<=768){
				portlet.collapse();
			}else{
				portlet.expand();
			}
		})
		
		/* 데이트 피커 셋팅 */
		datepickerObj = $("#prj5000Datepicker");
		
		//year range
		var yearRange = {
				minYear: new Date().getFullYear()-5,
				maxYear: new Date().getFullYear()+5
		};
		/* 데이트 피커 언어 초기화 */
		$.osl.date.init();
		/* 데이트 피커 생성 */
		$.osl.date.datepicker(datepickerObj,{
			yearRange: yearRange.minYear+":"+yearRange.maxYear,
			changeYear: true,
			changeMonth: true,
			showMonthAfterYear: true
			
		},function( defaultConfig, selDate) {
			/* 데이트 피커 날짜 선택 콜백 함수 */
			calendar.gotoDate(selDate.date);
	        
	      	//전월, 다음달 데이터 조회
			fnEvtdayDataSetting();
		});
		
		
		var todayDate = moment().startOf('day');
        var YM = todayDate.format('YYYY-MM');
        var YESTERDAY = todayDate.clone().subtract(1, 'day').format('YYYY-MM-DD');
        var TODAY = todayDate.format('YYYY-MM-DD');
        var TOMORROW = todayDate.clone().add(1, 'day').format('YYYY-MM-DD');

        var calendarEl = document.getElementById('kt_calendar');
        calendar = new FullCalendar.Calendar(calendarEl, {

			headerToolbar: {
				start:'today customPrevBtn,customNextBtn',
			    center: 'title',
			    end:'eventLoad dayGridMonth,timeGridWeek,timeGridDay,timeGridFourDay'
			},
			buttonIcons:{
				customPrevBtn:'fc-icon-chevron-left',
				customNextBtn:'fc-icon-chevron-right'
			},
            height: 650,
            contentHeight: 600,
			initialDate: new Date(),
			locale : $.osl.lang("prj5000.button.title.local"),

			//주 번호 출력
			//weekNumbers: true,
			//일정 수정 가능 여부
			editable: true,
			//일정 출력 최대 개수
			dayMaxEventRows:true,
			//일 번호 클릭 시 타임라인으로
			navLinks: true,
			//드래그 일자 선택
			selectable: true,
			//현재시간표시
			nowIndicator: true,
			//버튼 실제 동작 세팅
			customButtons: {
				today:{
					text: $.osl.lang("prj5000.button.title.today"),
					click: function(){
						calendar.today();
						//전월, 다음달 데이터 조회
						fnEvtdayDataSetting();
						
						//datepicker 이동
						datepickerObj.datepicker("setDate", calendar.getDate().format("yyyy-MM-dd"));
					}
				},
				customPrevBtn:{
					click: function(){
						calendar.prev();
						//전월, 다음달 데이터 조회
						fnEvtdayDataSetting();
						
						//datepicker 이동
						datepickerObj.datepicker("setDate", calendar.getDate().format("yyyy-MM-dd"));
					}
				},
				customNextBtn:{
					click: function(){
						calendar.next();
						//전월, 다음달 데이터 조회
						fnEvtdayDataSetting();
						
						//datepicker 이동
						datepickerObj.datepicker("setDate", calendar.getDate().format("yyyy-MM-dd"));
					}
				},
				//일정 데이터 재 조회
				eventLoad:{
					text: $.osl.lang("prj5000.button.title.dataSelect"),
					click: function(){
						//일정 데이터 조회
						fnSelectEventList();
					}
				}
			},

			//view 동작 설정
			views: {
				dayGridMonth: {
					dayMaxEventRows: 6
				},
				timeGridFourDay: {
					type: 'timeGrid',
					duration: { days: 4 },
					buttonText: $.osl.lang("prj5000.button.title.fourDay")
				},
			},

		    select: function(info) {
		    	//종료 일자
		    	var endDate = info.end;
		    	
		    	//종일인경우 date -1
		    	if(info.allDay){
		    		if(info.end == null){
		    			endDate = info.start;
		    		}else{
			    		endDate = new Date(info.end.setDate(new Date(info.end).getDate()-1));
		    		}
		    	}

		    	var data = {
			    		"type" : "insert",
						"selCalendarStartDate" : info.start.format("yyyy-MM-dd"),
						"selCalendarEndDate" : endDate.format("yyyy-MM-dd"),
						"selCalendarStartTime" : info.start.format("HH:mm"),
						"selCalendarEndTime" : endDate.format("HH:mm"),
						"evtAllDayCd" : (info.allDay)?"01": "02"
					};
		    	
				var options = {
						modalTitle: $.osl.lang("prj5001.insert.title"),
						closeConfirm: false,
						autoHeight: false,
						modalSize: 'md'
					};
				
				$.osl.layerPopupOpen('/prj/prj5000/prj5000/selectPrj5001View.do',data,options);
		    	
				calendar.unselect();
		    },
			//일정 클릭 시 이벤트
			eventClick: function(info){
				//일정 ID
				var prjEvtId = info.event.id;
				var prjId = info.event.prjId;
				
				//종료일시
				var evtEndDate = info.event.end;
				
				//종료일시가 null인경우 시작일과 같음
				if(evtEndDate == null){
					evtEndDate = info.event.start;
				}else{
					//allDay인 경우 종료일자 +1
					if(info.event.allDay){
						evtEndDate = new Date(info.event.end.setDate(new Date(info.event.end).getDate()-1));
					}
				}

				var paramType = "update";
				
				//휴일인경우
				if(info.event.extendedProps.eventType == "01"){
					//상세정보 팝업 창
					var data = {
							"type" : "view",
							"evtType": info.event.extendedProps.eventType,
							"holiId": prjEvtId,
							"selCalendarStartDate" : info.event.start.format("yyyy-MM-dd"),
							"selCalendarEndDate" : evtEndDate.format("yyyy-MM-dd"),
							"selCalendarStartTime" : info.event.start.format("HH:mm"),
							"selCalendarEndTime" : evtEndDate.format("HH:mm"),
							"holiAllDayCd" : (info.event.allDay)? "01": "02"
						};
					var options = {
							//idKey: rowData.reqId,
							modalTitle: $.osl.lang("prj5001.insert.title"),
							closeConfirm: false,
							autoHeight: false,
							modalSize: 'md'
						};
					
					//휴일 정보 상세 조회 페이지 미개발
					//$.osl.layerPopupOpen('/prj/prj5000/prj5000/selectPrj5001View.do',data,options);
					
					return true;
				}
				
				//요구사항인경우
				if(info.event.extendedProps.eventType == "04"){
					//상세정보 팝업 창
					var data = {
							"type" : "view",
							"evtType": info.event.extendedProps.eventType,
							"prjEvtId": info.event.extendedProps.prjId,
							"selCalendarStartDate" : info.event.start.format("yyyy-MM-dd"),
							"selCalendarEndDate" : evtEndDate.format("yyyy-MM-dd"),
							"selCalendarStartTime" : info.event.start.format("HH:mm"),
							"selCalendarEndTime" : evtEndDate.format("HH:mm"),
							"holiAllDayCd" : (info.event.allDay)? "01": "02",
							"reqId": info.event.extendedProps.reqId,
							"eventPrjId": info.event.extendedProps.prjId
						};
					var options = {
							//idKey: rowData.reqId,
							modalTitle: $.osl.lang("prj5001.insert.title"),
							closeConfirm: false,
							autoHeight: false,
							modalSize: 'md'
						};
					
					//요구사항 정보 상세 조회 페이지 미개발
					$.osl.layerPopupOpen('/prj/prj5000/prj5000/selectPrj5001View.do',data,options);
					
					return true;
				}
				
				//수정 불가 일정인경우 skip
				if(!info.event.startEditable){
					paramType = "view";
				}else{
					//일정 등록자만 일정 수정 가능
					var loginUsrId = "${sessionScope.loginVO.usrId}";
					if(info.event.extendedProps.usrId != loginUsrId){
						paramType = "view";
					}
				}
				

				var data = {
			    		"type" : paramType,
			    		"evtType": info.event.extendedProps.eventType,
			    		"paramPrjId": prjId,
			    		"paramPrjEvtId": prjEvtId,
						"selCalendarStartDate" : info.event.start.format("yyyy-MM-dd"),
						"selCalendarEndDate" : evtEndDate.format("yyyy-MM-dd"),
						"selCalendarStartTime" : info.event.start.format("HH:mm"),
						"selCalendarEndTime" : evtEndDate.format("HH:mm"),
						"evtAllDayCd" : (info.event.allDay)? "01": "02"
					};
				var options = {
						//idKey: rowData.reqId,
						modalTitle: $.osl.lang("prj5001."+paramType+".title"),
						closeConfirm: false,
						autoHeight: false,
						modalSize: 'md'
					};
				
				//요구사항 정보 상세 조회 페이지 미개발
				$.osl.layerPopupOpen('/prj/prj5000/prj5000/selectPrj5001View.do',data,options);
				
			},
			//이벤트 drag&drop
			eventDrop: function(info) {
				var evtEndDate = info.event.endStr;
				
				//end기간 null인 경우
				if($.osl.isNull(evtEndDate)){
					evtEndDate = info.event.start;
				}else{
					evtEndDate = info.event.end;
					//allDay인 경우 종료기간 -1
					if(info.event.allDay){
						//종료기간 -1
						evtEndDate = new Date(evtEndDate.setDate(evtEndDate.getDate()-1));
					}
				}
				
				var evtEndTime = evtEndDate.format("HH:mm");
				var evtStartDate = info.event.start.format("yyyy-MM-dd");
				var evtEndDate = evtEndDate.format("yyyy-MM-dd");
				var evtStartTime = info.event.start.format("HH:mm");
				
				var paramData = 
					{
						prjEvtId: info.event.id,
						evtStartDate: evtStartDate,
						evtEndDate: evtEndDate,
						evtStartTime: evtStartTime,
						evtEndTime: evtEndTime,
						evtAllDayCd: (info.event.allDay)? "01": "02"
					};
				//일정 일정 정보 변경 (일정 ID, 시작일, 종료일, 대상 일정 객체)
				fnEventUpdate(paramData, info);
			},
			//이벤트 resize
			eventResize: function(info) {
				var evtEndDate = info.event.endStr;
				
				//end기간 null인 경우
				if($.osl.isNull(evtEndDate)){
					evtEndDate = info.event.start;
				}else{
					evtEndDate = info.event.end;
					//allDay인 경우 종료기간 -1
					if(info.event.allDay){
						//종료기간 -1
						evtEndDate = new Date(evtEndDate.setDate(evtEndDate.getDate()-1));
					}
				}
				
				var evtStartDate = info.event.start.format("yyyy-MM-dd");
				var evtStartTime = info.event.start.format("HH:mm");
				var evtEndTime = evtEndDate.format("HH:mm");
				var evtEndDate = evtEndDate.format("yyyy-MM-dd");
				
				var paramData = 
				{
					prjEvtId: info.event.id,
					evtStartDate: evtStartDate,
					evtEndDate: evtEndDate,
					evtStartTime: evtStartTime,
					evtEndTime: evtEndTime,
					evtAllDayCd: (info.event.allDay)? "01": "02"
				};
				
				//일정 일정 정보 변경 (일정 ID, 시작일, 종료일, 대상 일정 객체)
				fnEventUpdate(paramData, info);
			},
			viewDidMount: function(calendarData){
				if(calendarData.view.type == "dayGridMonth"){
				//캘린더 영역 안에서 휠 이벤트  
				$("#kt_calendar").on(mousewheelevt, function(e){
					var evt = window.event || e;
					var delta;          
					delta = evt.detail ? evt.detail*(-120) : evt.wheelDelta;                     
					if(mousewheelevt === "DOMMouseScroll"){
						delta = evt.originalEvent.detail ? evt.originalEvent.detail*(-120) : evt.wheelDelta;
					}           
			
					//이전 달
					if(delta > 0){
						calendar.getCurrentData().options.customButtons.customPrevBtn.click();
					}
					//다음 달
					if(delta < 0){             
						calendar.getCurrentData().options.customButtons.customNextBtn.click();
					}  
				});
			
				//캘린더 영역에 마우스 위치할때 휠 이벤트 동작
				$("#kt_calendar").hover(
					function(){
						enable_scroll();
					},
					function(){
						disable_scroll();
					}
				);
				//마우스 이벤트  
				$("#kt_calendar").on("mouseleave", function() {enable_scroll()});
				//마우스 이벤트
				$("#kt_calendar").on("mouseenter", function() {disable_scroll()});
			}else{
				//이벤트 해제
				enable_scroll();
				$("#kt_calendar").off(mousewheelevt);
				$("#kt_calendar").off("hover, mouseleave, mouseenter");
			}
		}
        });
        calendar.render();
        
        //초기 데이트 피커 오늘날짜 선택
        datepickerObj.datepicker("setDate", new Date());
        
    	//일정 데이터 조회
    	fnSelectEventList();
    	
    	$("#saveBtn").on('click',function(e){
    		fnInsertEvtdayInfo()
		});
    	
	};

	//일정 목록 조회
	function fnSelectEventList(){
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj5000/prj5000/selectPrj5000EventListAjax.do'/>",
			"async": false,"contentType":false,"processData":false ,"cache":false},{target: "prjGrpId"});
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
		  	if(data.errorYn == "N"){
		  		var evtList = data.evtList;
		  		var holiList = data.holiList;
		  		//일정 전체 제거
		  		calendar.removeAllEvents();
		  		
		  		//일정 관리 변수 초기화
		  		evtDataIsMap = [];
		  		evtDataMap = {};
		  		evtPrjTreeDataMap = [];
		  		var selPrjId = data.selPrjId;
		  		
		  		//일정 데이터 세팅
		  		if(calendar.isRendered){
		  			//휴일
		  			if(!$.osl.isNull(holiList) && holiList.length > 0){
			  			//연도별 월별 데이터 분리
			  			$.each(holiList, function(idx, map){
			  				//휴일 데이터 연도,월 값
			  				var holiYearVal = new Date(map.holiStartDate).format("yyyy");
			  				var holiMonthVal = new Date(map.holiStartDate).format("MM");
			  				
			  				//연도 없는 경우 생성
			  				if(!evtDataMap.hasOwnProperty(holiYearVal)){
			  					evtDataMap[holiYearVal] = {};
			  				}
			  				//월 없는 경우 생성
			  				if(!evtDataMap[holiYearVal].hasOwnProperty(holiMonthVal)){
			  					evtDataMap[holiYearVal][holiMonthVal] = [];
			  				}
			  				//값 넣기
			  				evtDataMap[holiYearVal][holiMonthVal].push(map);
			  				evtHoliDataMap.push(map);
			  			});
		  			}
		  			
		  			var eventGrpPrjGrpList =
 						 '<div class="eventGroupFrame" title="휴일">'
						+'		<div class="eventGroupChkBox">'
						+'			<label class="kt-checkbox kt-checkbox--success">'
						+'				<i class="fa fa-calendar-alt"></i><input type="checkbox" name="CHK_holiday" id="CHK_holiday" data-event-group-type="04" data-event-group-id="holiday" onchange="fnToggleEvent(this)" checked> 휴일'
						+'				<span></span>'
						+'			</label>'
						+'		</div>'
						+'</div>' ;
	  				
	 				var eventGrpPrjList = '';
	 				var eventGrpUsrList = '';
	 				
		  			//일정
		  			if(!$.osl.isNull(evtList) && evtList.length > 0){
		  				//프로젝트 그룹, 프로젝트, 사용자 일정 목록
		  				
		  				
		  				//사용자 중복 체크
		  				var usrDupleList = [];
		  				
			  			//연도별 월별 데이터 분리
			  			$.each(evtList, function(idx, map){
			  				//프로젝트 그룹
			  				if(!evtPrjTreeDataMap.hasOwnProperty(map.prjGrpId)){
			  					evtPrjTreeDataMap[map.prjGrpId] = {};
			  					//프로젝트 그룹 추가
			  					/* eventGrpPrjGrpList += 
			 						 '<div class="eventGroupFrame" title="프로젝트 그룹:  '+$.osl.escapeHtml(map.prjGrpNm)+'">'
									+'		<div class="eventGroupChkBox">'
									+'			<label class="kt-checkbox kt-checkbox--success">'
									+'				<i class="fa fa-project-diagram"></i>'
									+'				<input type="checkbox" name="CHK_'+map.prjGrpId+'" id="CHK_'+map.prjGrpId+'" title="'+$.osl.escapeHtml(map.prjGrpNm)+'" data-event-group-type="01" data-event-group-id="'+map.prjGrpId+'" onchange="fnToggleEvent(this)" checked> '+$.osl.escapeHtml(map.prjGrpNm)+''
									+'				<span></span>'
									+'			</label>'
									+'		</div>'
									+'</div>' ; */
			  				}
			  				//프로젝트
			  				if(!evtPrjTreeDataMap[map.prjGrpId].hasOwnProperty(map.prjId)){
			  					evtPrjTreeDataMap[map.prjGrpId][map.prjId] = [];
	
			  					//체크박스 상태
			  					var checked = "checked";
			  					
			  					//현재 프로젝트 아닌 경우 제거
			  					if(map.prjId != selPrjId){
			  						checked = "";
			  					}
			  					
			  					//프로젝트 추가
			  					eventGrpPrjList += 
			 						 '<div class="eventGroupFrame" title="프로젝트 :  '+$.osl.escapeHtml(map.prjNm)+'">'
									+'		<div class="eventGroupChkBox">'
									+'			<label class="kt-checkbox kt-checkbox--success">'
									+'				<i class="fa fa-box"></i>'
									+'				<input type="checkbox" name="CHK_'+map.prjId+'" id="CHK_'+map.prjId+'" title="'+$.osl.escapeHtml(map.prjId)+'" data-event-group-type="02" data-event-group-id="'+map.prjGrpId+'" data-event-prj-id="'+map.prjId+'" onchange="fnToggleEvent(this)" checked> '+$.osl.escapeHtml(map.prjNm)+''
									+'				<span></span>'
									+'			</label>'
									+'		</div>'
									+'</div>' ;
			  				}
		  					//중복 목록에 사용자 없는 경우 추가
		  					if(usrDupleList.indexOf(map.usrId) == -1){
		  						//개인 일정 있는 사용자만 추가
		  						if(map.evtType == "03"){
				  					//사용자 추가
				  					eventGrpUsrList += 
				 						 '<div class="eventGroupFrame" title="사용자 :  '+map.usrNm+'">'
											+'		<div class="eventGroupChkBox">'
											+'			<label class="kt-checkbox kt-checkbox--success">'
											+'				<i class="fa fa-user"></i>'
											+'				<input type="checkbox" name="CHK_'+map.usrId+'" id="CHK_'+map.usrId+'" title="'+$.osl.escapeHtml(map.usrId)+'" data-event-group-type="03" data-event-group-id="'+map.usrId+'" onchange="fnToggleEvent(this)" checked> '+$.osl.escapeHtml(map.usrNm)+''
											+'				<span></span>'
											+'			</label>'
											+'		</div>'
											+'</div>' ;
				  					usrDupleList.push(map.usrId);
				  					evtUsrDataMap[map.usrId] = [];
		  						}
		  					}
			  				
			  				//개인 일정만 담기
			  				if(map.evtType == "03"){
			  					if(map.evtUseCd == "01"){
				  					map.evtNm = "["+map.usrNm+"] "+map.evtNm;
					  				evtUsrDataMap[map.usrId].push(map);
			  					}
			  				}
			  				//그 외 모두 프로젝트 분류
			  				else{
				  				evtPrjTreeDataMap[map.prjGrpId][map.prjId].push(map);
			  				}
			  				
			  				//일정 데이터 연도,월 값
			  				var evtYearVal = new Date(map.evtStartDate).format("yyyy");
			  				var evtMonthVal = new Date(map.evtStartDate).format("MM");
			  				
			  				//연도 없는 경우 생성
			  				if(!evtDataMap.hasOwnProperty(evtYearVal)){
			  					evtDataMap[evtYearVal] = {};
			  				}
			  				//월 없는 경우 생성
			  				if(!evtDataMap[evtYearVal].hasOwnProperty(evtMonthVal)){
			  					evtDataMap[evtYearVal][evtMonthVal] = [];
			  				}
			  				
			  				//요구사항인 경우 allDay 계산하기
			  				if(map.evtType == "04"){
			  					//시간 값이 같고 00:00 인경우
			  					if(map.evtStartTime == map.evtEndTime && map.evtStartTime == "00:00"){
			  						map.evtAllDayCd = "01";
			  					}
			  				}
			  				
			  				if(map.evtType == "03"){
			  					if(map.evtUseCd == "01"){
			  						//값 넣기
					  				evtDataMap[evtYearVal][evtMonthVal].push(map);
			  					}
			  				}else{
			  					//값 넣기
				  				evtDataMap[evtYearVal][evtMonthVal].push(map);			  					
			  				}
			  			});
			  			
		  			}

		  			//좌측 일정그룹 생성
		  			$("#eventGroupList").html(eventGrpPrjGrpList+eventGrpPrjList+eventGrpUsrList);
		  			//현재 일자 앞 뒤로 데이터 구해서 세팅
		  			fnEvtdayDataSetting();
		  		}
		  		$.osl.toastr(data.message);
		  	}else{
		  		$.osl.alert(data.message);
		  	}
		});
		
		//AJAX 전송
		ajaxObj.send();
	}
	
	//일정 일정 정보 변경 (일정 ID, 시작일, 종료일)
	function fnEventUpdate(paramData, event){
		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj5000/prj5000/savePrj5001PrjEvtInfo.do'/>"}
   			,{
   				"type" : "update",
   				prjEvtId: paramData.prjEvtId,
				evtStartDate: paramData.evtStartDate,
				evtEndDate: paramData.evtEndDate,
				evtStartTime: paramData.evtStartTime,
				evtEndTime: paramData.evtEndTime,
				evtAllDayCd: paramData.evtAllDayCd
			});

   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.toastr(data.message);
   		  		event.revert();
   		  		return;
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
	}
	
	//현재 일자 앞 뒤로 데이터 구해서 세팅
	function fnEvtdayDataSetting(){
		//현재 기준 년도 월에서 -1 ~ +1 범위 데이터 구하기
		var currentDate = calendar.getDate();
		
		//전월 연도, 월
		var beforeYear = new Date(currentDate.getFullYear(), (currentDate.getMonth()-1), currentDate.getDate()).format("yyyy");
		var beforeMonth = new Date(currentDate.getFullYear(), (currentDate.getMonth()-1), currentDate.getDate()).format("MM");
		
		//현재 연도, 월
		var currentYear = currentDate.format("yyyy");
		var currentMonth = currentDate.format("MM");
		
		//다음월 연도, 월
		var afterYear = new Date(currentDate.getFullYear(), (currentDate.getMonth()+1), currentDate.getDate()).format("yyyy");
		var afterMonth = new Date(currentDate.getFullYear(), (currentDate.getMonth()+1), currentDate.getDate()).format("MM");

		var evtRangeData = [];
		
		//이미 데이터 추가되있는지 체크
		try{
			if(!$.osl.isNull(evtDataMap[beforeYear][beforeMonth]) && evtDataIsMap.indexOf(beforeYear+"-"+beforeMonth) == -1){
				//data 추가
				evtRangeData = evtRangeData.concat(evtDataMap[beforeYear][beforeMonth]);
				evtDataIsMap.push(beforeYear+"-"+beforeMonth);
			}
			if(!$.osl.isNull(evtDataMap[currentYear][currentMonth]) && evtDataIsMap.indexOf(currentDate.format("yyyy-MM")) == -1){
				//data 추가
				evtRangeData = evtRangeData.concat(evtDataMap[currentYear][currentMonth]);
				evtDataIsMap.push(currentDate.format("yyyy-MM"));
			}
			if(!$.osl.isNull(evtDataMap[afterYear][afterMonth]) && evtDataIsMap.indexOf(afterYear+"-"+afterMonth) == -1){
				//data 추가
				evtRangeData = evtRangeData.concat(evtDataMap[afterYear][afterMonth]);
				evtDataIsMap.push(afterYear+"-"+afterMonth);
			}
		}catch(e){
			//underined 오류 무시
		}
		
		if(evtRangeData.length > 0){
			$.each(evtRangeData, function(idx, map){
				var evtStartFullDate = map.evtStartFullDate;
				var evtEndFullDate = map.evtEndFullDate;
				var evtAllDayCd = map.evtAllDayCd;
				var classNames = "osl-calendar-event";
				var evtNm = $.osl.escapeHtml(map.evtNm);
				var reqId;
				var display = map.display;
				
				//display값 없거나 true인경우 auto
				if($.osl.isNull(display) || display){
					display = "auto";
				}else{
					display = "none";
				}
				
				var allDay = false;
				
				var evtBgColor = map.evtBgColor;
				var evtColor = map.evtColor;
				var prjEvtId = map.prjEvtId;
				var eventTypeNm = "event";
				
				//개인 데이터는 수정 가능
				var editable = true;
				
				//휴일인경우 휴일데이터 변경
				if(map.evtType == "01"){
					evtStartFullDate = map.holiStartFullDate;
					evtEndFullDate = map.holiEndFullDate;
					evtAllDayCd = map.holiAllDayCd;
					classNames = "osl-holiday";
					evtNm = "[휴일] "+$.osl.escapeHtml(map.holiNm);
					evtBgColor = map.holiBgColor;
					evtColor = map.holiColor;
					prjEvtId = map.holiId;
					eventTypeNm = "holiday";
					editable = false;
				}
				//요구사항
				else if(map.evtType == "04"){
					evtNm = $.osl.escapeHtml(map.evtNm);
					reqId = map.reqId;
				}
				
				//allDay인 경우 종료 일자 +1
				if(evtAllDayCd == "01"){
					evtEndFullDate = new Date(evtEndFullDate);
					evtEndFullDate = new Date(evtEndFullDate.setDate(evtEndFullDate.getDate()+1)).format("yyyy-MM-dd HH:mm");
					allDay = true;
					classNames = "osl-calendar-allday";
				}
				//요구사항 데이터인경우 수정 불가능
				if(map.evtType == "04"){
					editable = false;
				}
				
				//개인 일정
				if(map.evtType == "03"){
					evtNm = $.osl.escapeHtml(map.evtNm);
				}
				
				calendar.addEvent({
					title: evtNm
					, start: evtStartFullDate
					, end: evtEndFullDate
					, editable: editable
					, allDay: allDay
					, classNames: classNames
					, backgroundColor: evtBgColor
					, borderColor: evtBgColor
					, textColor: evtColor
					, eventType: map.evtType
					, eventTypeNm: eventTypeNm
					, id: prjEvtId
					, usrId: map.usrId
					, prjId: map.prjId
					, prjGrpId: map.prjGrpId
					, reqId: reqId
					, display: display
				});
			});
		}
	}
	//일정 생성
	function fnInsertEvtdayInfo(){
		var selCalendarDate = datepickerObj.datepicker("getDate").format("yyyy-MM-dd");
		
		var data = {
				"type" : "insert",
				"selCalendarStartDate" : selCalendarDate,
				"selCalendarEndDate" : selCalendarDate,
				"selCalendarStartTime" : "00:00",
				"selCalendarEndTime" : "00:00"
			};
		var options = {
				//idKey: rowData.reqId,
				modalTitle: $.osl.lang("prj5001.insert.title"),
				closeConfirm: false,
				autoHeight: false,
				modalSize: 'md'
			};
		
		$.osl.layerPopupOpen('/prj/prj5000/prj5000/selectPrj5001View.do',data,options);
	}
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

//이벤트 그룹 show/hide
function fnToggleEvent(thisObj){
	//모든 일정에서 휴일은 제외
	
	var evtGrpType = $(thisObj).data("event-group-type");
	var evtGrpId = $(thisObj).data("event-group-id");
	var evtPrjId = $(thisObj).data("event-prj-id");
	var evtGrpVal = thisObj.checked;
	var prjEvtIdStr = "prjEvtId";
	var targetEvtList = [];
	
	//프로젝트 그룹
	/* if(evtGrpType == "01"){
		//그룹 일정
		var targetPrjGrpEvtList = evtPrjTreeDataMap[evtGrpId];
		$.each(targetPrjGrpEvtList, function(prjId, evtList){
			//프로젝트 체크 확인
			if($("#CHK_"+prjId)[0].checked){
				$.each(evtList, function(idx, map){
					//개인 일정 제외
					if(map.evtType != "03"){
						targetEvtList.push(map);
					}
				});
			}
		});
	} */
	//프로젝트
	if(evtGrpType == "02"){
		//프로젝트 일정
		var targetPrjEvtList = evtPrjTreeDataMap[evtGrpId][evtPrjId];
		$.each(targetPrjEvtList, function(idx, map){
			//프로젝트 그룹 체크 확인
			//if($("#CHK_"+evtGrpId)[0].checked){
			//개인 일정 제외
			if(map.evtType != "03"){
				targetEvtList.push(map);
			}
		});
	}
	//사용자
	else if(evtGrpType == "03"){
		//사용자 일정
		var targetUsrEvtList = evtUsrDataMap[evtGrpId];
		$.each(targetUsrEvtList, function(idx, map){
			//개인 일정
			if(map.evtType == "03"){
				targetEvtList.push(map);
			}
		});
	}
	//휴일
	else if(evtGrpType == "04"){
		var targetEvtList = evtHoliDataMap;
		prjEvtIdStr = "holiId";
	}
	
	$.each(targetEvtList, function(idx, map){
		var prjEvtId = map[prjEvtIdStr];
		var event = calendar.getEventById(prjEvtId);
		
		//일정 없는 경우 해당 Map에 값 넣기
		if($.osl.isNull(event)){
			map["display"] = evtGrpVal;
			return true;
		}
		//체크 해제시 제외
		if(!evtGrpVal){
			event.setProp("display","none");
		}
		//체크 시 보이기
		else{
			event.setProp("display","auto");
		}
	});
}

$.osl.ready(function(){
	OSLPrj5000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
