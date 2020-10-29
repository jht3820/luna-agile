<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/oslops/top/header.jsp" %>
<jsp:include page="/WEB-INF/jsp/oslops/top/aside.jsp" />

<link rel='stylesheet' href='<c:url value='/css/oslops/req.css'/>' type='text/css'>
<!-- 레이어 팝업 -->
<script src="<c:url value='/js/common/layerPopup.js'/>"></script>

<!-- TW Gantt CSS -->
<link rel=stylesheet href="<c:url value='/css/chart/gantt/platform.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/chart/gantt/jquery.dateField.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/chart/gantt/gantt.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/chart/gantt/ganttPrint.css'/>" type="text/css" media="print">

<!-- jquery -->
<script src="<c:url value='/js/jquery/jquery-ui.js'/>"></script>
<script src="<c:url value='/js/jquery/jquery.livequery.1.1.1.min.js'/>"></script>
<script src="<c:url value='/js/jquery/jquery.svg.min.js'/>" type="text/javascript" ></script>
<script src="<c:url value='/js/jquery/jquery.svgdom.1.8.js'/>" type="text/javascript"></script>

<!-- 간트차트 커스텀  jquery -->
<script src="<c:url value='/js/chart/gantt/jquery.timers.js'/>"></script>
<script src="<c:url value='/js/chart/gantt/jquery.dateField.js'/>"></script>
<script src="<c:url value='/js/chart/gantt/jquery.JST.js'/>"></script>


<!-- TW Gantt JS -->
<script src="<c:url value='/js/chart/gantt/utilities.js'/>"></script>
<script src="<c:url value='/js/chart/gantt/forms.js'/>"></script>
<script src="<c:url value='/js/chart/gantt/date.js'/>"></script>
<!-- 간트차트 팝업 - 현재는 간트차트에서 지원하는 자체 dialog를 사용하지 않으므로 주석처리 -->
<!-- <script src="<c:url value='/js/chart/gantt/dialogs.js'/>"></script> -->
<script src="<c:url value='/js/chart/gantt/layout.js'/>"></script>
<script src="<c:url value='/js/chart/gantt/i18nJs.js'/>"></script>
<script src="<c:url value='/js/chart/gantt/ganttUtilities.js'/>"></script>
<script src="<c:url value='/js/chart/gantt/ganttTask.js'/>"></script>
<script src="<c:url value='/js/chart/gantt/ganttDrawerSVG.js'/>"></script>
<script src="<c:url value='/js/chart/gantt/ganttZoom.js'/>"></script>
<script src="<c:url value='/js/chart/gantt/ganttGridEditor.js'/>"></script>
<script src="<c:url value='/js/chart/gantt/ganttMaster.js'/>"></script>  

<style>
  	.resEdit {padding: 15px;}
  	.resLine {width: 95%;padding: 3px;margin: 5px;border: 1px solid #d0d0d0;}
  	.ganttButtonBar h1{ color: #000000;font-weight: bold; font-size: 28px;margin-left: 10px;}
  	.itemTable > span{background-color : #fff;border : none;}
</style>


<script type="text/javascript">



	
	var ge;
	
	var mySearch;

	$(function() {
		
		var canWrite = true;
	
		
		ge = new GanttMaster();
		ge.set100OnClose = true;
		ge.shrinkParent=true;
		ge.init($("#workSpace"));
		
	 	
	  	loadI18n();
	  	
		
		delete ge.gantt.zoom;
	
	  	
	  	fnGanttSearchBoxControl();
	  
		
		gfnGuideStack("add",fnReq4600GuideShow);
	 
		
	  	$(document).on('keydown', function(e) { 
	  		
	  		if(e.keyCode == 27){
	  			
	  			if( $("#gantt_main_frame").hasClass("ganttFullScreen")){
	  				
	  				$(".fullScreenBtn").click();
	  			}
	  		}
		});
	});

	
	function fnInWbsListSet(ajaxParam){
     	
		
     	
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4600/selectReq4600WbsReqListAjax.do'/>", "loadingShow":true} 
				,ajaxParam);

		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
			
			
			
			var selZoomLvl = axdom("#" + mySearch.getItemId("ganttZoomLvl")).val();
			
			
			var ret = {"selectedRow": 1, "deletedTaskIds": [], "canWrite":    true, "canDelete":true, "canWriteOnParent": true, "canAdd":true, "zoom":selZoomLvl}; 
			
			
			var tmpTask = [];
			
			
			if(data.errorYn == "Y"){
				toast.push(data.message);
				
				fnGanttLoad(ret, tmpTask);
				return false;
			}
			
			
			var list = data.list;
			
			
			
			$.each(list, function(idx, map){
				
				
				var start = new Date(map.reqStDuDtm).getTime();
				var end = new Date(map.reqEdDuDtm).getTime();
				
				var duration = (end-start)/(1000*60*60*24) + 1;
				
				
				var reqNm = gfnCheckStrLength(gfnReplace(map.reqNm, null, ""), 30);
				var reqDesc = gfnCheckStrLength(gfnReplace(map.reqDesc, null, ""), 50);
				
				
				tmpTask.push({		
						prjId : map.prjId				
						,id : map.reqId					
						,name :  reqNm					
						,proType : map.proTypeCd		
						,processingType : map.proTypeNm 
						,progress : map.progress		
						,chargerNm : map.chargerNm		
						,relevance : 0
						,type : ""
						,typeId : ""
						,description : reqDesc			
						,code : ""
						,level : 0						
						,status : map.status			
						,tooltip : GanttMaster.messages["TITLE_"+map.status] 
						,depends : ""					
						,canWrite : "false"
						,start : start 					
						,duration : duration			
						,end : end						
						,startDuDtm : map.reqStDuDtm	
						,endDuDtm : map.reqEdDuDtm		
						,startDtm : map.reqStDtm		
						,endDtm : map.reqEdDtm			
						,startIsMilestone : false
						,endIsMilestone : false
						,collapsed : false
						,assigs : []
				 		,hasChild : false				
				});
				
			});

			
			
			fnGanttLoad(ret, tmpTask);	
			
			
			if(gfnIsNull(list)){
				toast.push("조회된 요구사항이 없습니다.");
				
				fnChartAreaResize(100);
			}else{
				
				toast.push(data.message);
				
				
			}
			
		});
		
		
		ajaxObj.setFnError(function(xhr, status, err){
		});
		
		
		ajaxObj.send();
	}


	
	function fnGanttSearchBoxControl(){
		var pageID = "AXSearch";
		mySearch = new AXSearch();
		 
		
		 var defaultEndDt = gfnGetServerTime('yyyy-mm-dd');
		var nowdate = new Date(defaultEndDt);
		
		var defaultStDt = gfnGetMonthAgo(nowdate, 1,'yyyy-mm-dd'); 
		
		var fnObjSearch = {
			pageStart: function(){
				
				mySearch.setConfig({
					targetID:"AXSearchTarget",
					theme : "AXSearch",
					rows:[
						{display:true, addClass:"top_searchGroup", style:"", list:[
							{label:"", labelWidth:"", type:"button", width:"15",style:"float:right;", key:"btn_wbs_fullScreen", valueBoxStyle:"padding:5px;", addClass:"fullScreenBtn", value:"<i class='fas fa-expand' style='font-size: 16px; padding-top: 5px;'></i>", title : "차트 풀 스크린",
								onclick:function(){
									
									$('#workSpace').trigger('fullScreen.gantt');
							}},
							{label:"", labelWidth:"", type:"button", width:"15",style:"float:right;", key:"btn_wbs_ganttReduce", valueBoxStyle:"padding:5px;", value:"<span class='teamworkIcon' style='font-size: 16px; font-weight: bold;'>R</span>", title : "차트 사이즈 축소",
								onclick:function(){
									
									fnChartAreaResize(100);
							}},
							{label:"", labelWidth:"", type:"button", width:"15",style:"float:right;", key:"btn_wbs_ganttMiddle", valueBoxStyle:"padding:5px;", value:"<span class='teamworkIcon' style='font-size: 16px; font-weight: bold;'>O</span>", title : "차트 사이즈 보통",
								onclick:function(){
									
									
									fnChartAreaResize(50);
							}},
							{label:"", labelWidth:"", type:"button", width:"15",style:"float:right;", key:"btn_wbs_ganttExpend", valueBoxStyle:"padding:5px;", value:"<span class='teamworkIcon' style='font-size: 16px; font-weight: bold;'>F</span>", title : "차트 사이즈 확대",
								onclick:function(){
									
									
									fnChartAreaResize(.1);
							}},
							{label:"", labelWidth:"", type:"button", width:"15",style:"float:right;", key:"btn_wbs_zoomOut",valueBoxStyle:"padding:5px;", value:"<i class='fas fa-search-plus' style='font-size: 16px; padding-top: 5px;'></i>", title : "차트 줌 인",
								onclick:function(){
									
									$('#workSpace').trigger('zoomPlus.gantt');
							}},
							{label:"", labelWidth:"", type:"button", width:"15",style:"float:right;", key:"btn_wbs_zoomIn",valueBoxStyle:"padding:5px;", value:"<i class='fas fa-search-minus' style='font-size: 16px; padding-top: 5px;'></i>",  title :"차트 줌 아웃",
								onclick:function(){
									
									$('#workSpace').trigger('zoomMinus.gantt');
							}},
							{label:"", labelWidth:"", type:"button", width:"15",style:"float:right;", key:"btn_wbs_taskDown",valueBoxStyle:"padding:5px;", value:"<i class='fas fa-arrow-down' aria-hidden='true'></i>", title : "요구사항 아래로 이동",
								onclick:function(){
									
									$('#workSpace').trigger('moveDownCurrentTask.gantt');
							}},	
							{label:"", labelWidth:"", type:"button", width:"15",style:"float:right;", key:"btn_wbs_taskUp",valueBoxStyle:"padding:5px;", value:"<i class='fas fa-arrow-up' aria-hidden='true'></i>", title : "요구사항 위로 이동",
								onclick:function(){
									
									$('#workSpace').trigger('moveUpCurrentTask.gantt');	
							}},
						]},
						{display:true, addClass:"", style:"", list:[
							{label:"<i class='fa fa-search'></i>&nbsp;", labelWidth:"30", type:"selectBox", width:"", key:"searchSelect", addClass:"", valueBoxStyle:"", value:"all",
								options:[
									{optionValue:"0", optionText:"전체 보기",optionAll:true},
	                                {optionValue:'reqNm', optionText:'요구사항 명'},
	                                {optionValue:'reqDesc', optionText:'요구사항 설명'},
	                                
	                                {optionValue:'reqChargerNm', optionText:'담당자'},
	                                {optionValue:'reqId', optionText:'요구사항 ID'},
	                                {optionValue:"reqProType", optionText:"처리유형", optionCommonCode:"REQ00008"}
	                                
	                            ],onChange: function(selectedObject, value){
	                            	
	    							if(!gfnIsNull(selectedObject.optionAll) && selectedObject.optionAll == true){
										axdom("#" + mySearch.getItemId("searchTxt")).attr("readonly", "readonly");	
										axdom("#" + mySearch.getItemId("searchTxt")).val('');	
									}else{
										axdom("#" + mySearch.getItemId("searchTxt")).removeAttr("readonly");
									}
									
									
									if(!gfnIsNull(selectedObject.optionCommonCode)){
										gfnCommonSetting(mySearch, selectedObject.optionCommonCode, "searchCd","searchTxt");
										axdom("#" + mySearch.getItemId("searchTxt")).val('');	
									}else{
										
										axdom("#" + mySearch.getItemId("searchTxt")).show();
										axdom("#" + mySearch.getItemId("searchCd")).hide();
									}
	    						},

							},
							{label:"", labelWidth:"", type:"inputText", width:"120", key:"searchTxt", addClass:"secondItem sendBtn", valueBoxStyle:"padding-left:0px;", value:"",
								onkeyup:function(e){
									if(e.keyCode == '13' ){
										axdom("#" + mySearch.getItemId("btn_search_reqWbs")).click();
									}
								} 
							},
							{label:"", labelWidth:"", type:"selectBox", width:"100", key:"searchCd", addClass:"selectBox", valueBoxStyle:"padding-left:0px;", value:"01",
								options:[]
							},
							{label:"<i class='fa fa-search'></i>&nbsp;<i>기간</i>&nbsp;&nbsp;", labelWidth:"70", type:"inputText", width:"120", key:"srchFromDt", addClass:"secondItem readonly", valueBoxStyle:"", value:defaultStDt,
								onChange: function(){}
							},
							{label:"", labelWidth:"", type:"inputText", width:"120", key:"srchToDt", addClass:"secondItem readonly", valueBoxStyle:"padding-left:0px;", value:defaultEndDt
							},
							{label:"<i class='far fa-calendar-alt'></i>&nbsp;단위 기간&nbsp;", labelWidth:"60", type:"selectBox", width:"", key:"ganttZoomLvl", addClass:"", valueBoxStyle:"", value:"1M",
								options:[
								         	{optionValue:"3d", optionText:"일 별"},
			                                {optionValue:"2w", optionText:"주 별"},
			                                {optionValue:"1M", optionText:"월 별"},
			                                {optionValue:"2Q", optionText:"분기 별"},
			                                {optionValue:"1y", optionText:"반기 별"},
			                                {optionValue:"2y", optionText:"연 별"}
			                             
			                            ],onChange: function(selectedObject, zoomVal){
											
			                            	var ganttLander = ge.gantt;
											
			                            	ganttLander.zoom = zoomVal;
											
			                            	ganttLander.gridChanged = true;
											
			                            	ganttLander.redraw();
			    						}
							},
							{label:"", labelWidth:"", type:"button", width:"70",style:"float:right;", key:"btn_print_reqWbs",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-print' aria-hidden='true'></i>&nbsp;<span>프린트</span>",
								onclick:function(){
									
									$('#workSpace').trigger('print.gantt');
							}},
							{label:"", labelWidth:"", type:"button", width:"55", key:"btn_update_rate",style:"float:right;",valueBoxStyle:"padding:5px;", value:"<i class='fas fa fa-save' aria-hidden='true'></i>&nbsp;<span>저장</span>",
	       						onclick:function(){
	       							fnSaveProgress();
	       					}},
							{label:"", labelWidth:"", type:"button", width:"55", key:"btn_search_reqWbs",style:"float:right;", valueBoxStyle:"padding:5px;", value:"<i class='fa fa-list' aria-hidden='true'></i>&nbsp;<span>조회</span>",
								onclick:function(){		
									
									
		 							var startDate = axdom("#" + mySearch.getItemId("srchFromDt")).val();
		 							var endDate = axdom("#" + mySearch.getItemId("srchToDt")).val();
								    
		 							
		 							var ajaxParam = mySearch.getParam();
		 							
		 							 if( gfnTermValid(axdom("#"+ mySearch.getItemId("srchFromDt")),axdom("#"+ mySearch.getItemId("srchToDt")),365) ){
		 								fnInWbsListSet(ajaxParam);   
									}else{
									   jAlert('조회 기간은 365일 이내로 조회 가능합니다.', '알림창');
									} 
							}}
						]}
					]
				});
			}
		};
		
		jQuery(document.body).ready(function(){
			fnObjSearch.pageStart();
			
			axdom("#" + mySearch.getItemId("searchTxt")).attr("readonly", "readonly");
		
			
			axdom("#" + mySearch.getItemId("searchCd")).hide();
			 
			
			var startDtId = mySearch.getItemId("srchFromDt");
			var endDtId = mySearch.getItemId("srchToDt");
			
			
			axdom("#" + startDtId).attr("readonly", "readonly");
			axdom("#" + endDtId).attr("readonly", "readonly");
			axdom("#" + startDtId).css("box-shadow", "none");
			axdom("#" + endDtId).css("box-shadow", "none");
			
			
			gfnCalRangeSet(startDtId, endDtId);
			
			
			fnBtnAuthCheck(mySearch);

			
			var ajaxParam = mySearch.getParam();

			
		    fnInWbsListSet(ajaxParam); 
		});
	}

	
	
	function fnGanttLoad(ret, taskList){
		
		$.extend(ret,{"tasks":taskList});

		
		ge.loadProject(ret);
		ge.checkpoint();
	}

	
	
	function fnValidPercentage(inputProgress){
		 
		var pattern = /^[0-9]*$/
		var message = "진척률은 0 ~ 100 사이 숫자만 입력 가능합니다.";
		var ret = true;

		
		if(gfnIsNull(inputProgress) || $.isNumeric(inputProgress) == false || !pattern.test(inputProgress)){
			jAlert(message, "알림창");
			ret = false;
		}
		
		else if( inputProgress < 0 || 100 < inputProgress){
			jAlert(message, "알림창");
			ret = false;
		}   	
		return ret;
	}

	
	function fnChartAreaResize(size){
		ge.splitter.resize(size);
	}
	
	
	function fnSaveProgress(){

		
		var tasks = ge.tasks;
		
		var reqInfoFd = new FormData();
		
		var saveChk = 0;
		
		
		for (var i = 0; i < tasks.length; i++) {
			
			var prjId = tasks[i].prjId;
			
			var reqId = tasks[i].id;
			
		    var reqProgress = ge.tasks[i].progress;
			
			var inProgressVal = $('#progress_'+reqId).val();

			if(gfnIsNull(inProgressVal)){
				saveChk = 1;
				jAlert("진척률은 숫자만 입력 가능합니다.", '알림창');
				return false;
			}
			
			
			
		    if(inProgressVal != reqProgress){
		    	saveChk++;
		    	reqInfoFd.append("prjId",prjId);
		    	reqInfoFd.append("reqId",reqId);
		    	reqInfoFd.append("progress",inProgressVal);
		    }
		}
		
		
		if(saveChk == 0){
			jAlert("변경된 요구사항 진척률이 없습니다.", '알림창');
			return false;
		}
		
		
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4600/updateReq4600ProgresInfo.do'/>"
					,"contentType":false
					,"processData":false
					,"cache":false}
				,reqInfoFd);

		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
			
	    	
	    	if(data.errorYn == 'Y'){
	    		toast.push(data.message);
	    		return;
	    	}

	    	
			var ajaxParam = mySearch.getParam();
		    fnInWbsListSet(ajaxParam); 

			jAlert(data.message, '알림창');
			
		});
		
		
		ajaxObj.setFnError(function(xhr, status, err){
			toast.push(xhr.status+"("+err+")"+" 에러가 발생했습니다.");
	    	
		});
		
		ajaxObj.send(); 
	}
	
	
	function fnReq4600GuideShow(){
		var mainObj = $(".main_contents");
		
		
		if(mainObj.length == 0){
			return false;
		}
		
		var guideBoxInfo = globals_guideContents["req4600"];
		gfnGuideBoxDraw(true,mainObj,guideBoxInfo);
	}
	
	
</script>


<div class="main_contents" style="height: auto;" >
	<div class="req_title">${sessionScope.selMenuNm }</div>

	<div class="tab_contents menu">
	<div id="gantt_main_frame">
		<div id="AXSearchTarget" style="border-top:1px solid #ccc; padding-bottom: 10px;" guide="req4600button"></div>	
		<!-- 간트 차트가 그려질 workSpace -->
		<div id="workSpace" guide="req4600WbsGantt"></div> <!-- style="padding:0px; overflow-y:auto; overflow-x:hidden;border:1px solid #e5e5e5;position:relative;margin:0 5px"  -->
	</div>
	</div>

		 
</div>


<!-- 간트차트 Template 정의 -->
<!-- jQuery.JST.js에서 Template을 생성할 때  gantEditorTemplates 아래 div의 type를 찾고
	여기에서 주석된 부분을 읽어서 Template을 생성한다.
-->
<div id="gantEditorTemplates" style="display:none;">

	<!-- 간트차트 왼쪽 상단 헤더 Template -->
	<div class="__template__" type="TASKSEDITHEAD">
		<!--
	  	<table class="gdfTable" cellspacing="0" cellpadding="0">
	    	<thead>
	    		<tr style="height:40px">
	      			<th class="gdfColHeader" style="width:35px; border-right: none"></th>
	      			<th class="gdfColHeader" style="width:40px; border-left: 1px solid #bbb; text-align:center;">상태</th>
	      			<th class="gdfColHeader" style="width:100px; border-left: 1px solid #bbb; text-align:center;">처리유형</th>
	      			<th class="gdfColHeader gdfResizable" style="width:380px; text-align:center;">요구사항 명</th>
	      			<th class="gdfColHeader gdfResizable" style="width:130px; text-align:center;">작업 시작 예정일</th>
	      			<th class="gdfColHeader gdfResizable" style="width:130px; text-align:center;">작업 종료 예정일</th>
	      			<th class="gdfColHeader gdfResizable" style="width:110px; text-align:center;">작업 시작일</th>
	      			<th class="gdfColHeader gdfResizable" style="width:110px; text-align:center;">작업 종료일</th>
	      			<th class="gdfColHeader gdfResizable" style="width:140px; text-align:center;">작업 예정 기간(일)</th>
	      			<th class="gdfColHeader gdfResizable" style="width:80px; text-align:center;">진척률(%)</th>
	      			<th class="gdfColHeader gdfResizable" style="width:80px; text-align:center;">담당자</th>
	      			<th class="gdfColHeader gdfResizable" style="width:600px; text-align:center;">요구사항 설명</th>
	    		</tr>
	    	</thead>
		</table>
	  	-->
	</div>


	<!-- 간트 차트 TASK 목록 Template -->
	<div class="__template__" type="TASKROW">
	<!--
		<tr id="tid_(#=obj.id#)" taskId="(#=obj.id#)" class="taskEditRow (#=obj.isParent()?'isParent':''#) (#=obj.collapsed?'collapsed':''#)" level="(#=level#)">
	    	<th class="gdfCell edit rowNumCell" align="right" style="text-align : center;">
	    		<span class="taskRowIndex">(#=obj.getRow()+1#)</span>
	    	</th>
	    	<td class="gdfCell noClip" align="center"><div class="taskStatus cvcColorSquare" status="(#=obj.status#)" title="(#=obj.tooltip#)"></div></td>
	    	<td class="gdfCell align="center" style="text-align : center;">(#=obj.processingType#)</td>
	    	<td class="gdfCell indentCell" style="padding-left:10px;">(#=obj.name#)</td>
	    	<td class="gdfCell inCenter">(#=obj.startDuDtm#)</td>
	    	<td class="gdfCell inCenter">(#=obj.endDuDtm#)</td>
	    	<td class="gdfCell inCenter">(#=obj.startDtm#)</td>
	    	<td class="gdfCell inCenter">(#=obj.endDtm#)</td>
	    	<td class="gdfCell inCenter">(#=obj.duration#)</td>
	    	<td class="gdfCell edit inCenter progressEdit"><input type="number" id="progress_(#=obj.id#)" name="progress" class="validated inCenter" autocomplete="off" value="(#=obj.progress?obj.progress:0#)"  min="0"></td>
	    	<td class="gdfCell inCenter">(#=obj.chargerNm#)</td>
			<td class="gdfCell" style="padding-left:10px;">(#=obj.description#)</td>
	  	</tr>
	 -->
	</div>

	<!-- 간트 차트 빈(empty) TASK 목록 Template -->
	<div class="__template__" type="TASKEMPTYROW">
	<!--
		<tr class="taskEditRow emptyRow" >
		    <th class="gdfCell rowNumCell" align="right"></th>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell noClip" align="center"></td>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell"></td>
	    	<td class="gdfCell"></td>
		</tr>
	-->
	</div>

</div>

<jsp:include page="/WEB-INF/jsp/oslops/bottom/footer.jsp" />