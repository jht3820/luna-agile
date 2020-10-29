<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/lunaops/top/header.jsp" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<script type="text/javascript" src="<c:url value='/js/chart/chartJs/Chart.bundle.js'/>"></script>
<link rel='stylesheet' href="<c:url value='/css/oslops/dsh.css'/>" type='text/css'>
<script>

var gridObj = {};


var timerVarSel;
var secondTime;
var timer;


var usrId = "${sessionScope.loginVO.usrId}";
var usrTyp = "${sessionScope.usrTyp}";


var processFlowList = {};


var dshDisplayCd = "${usrInfo.dshDisplayCd}";


var dshProcessDisplayCd = {};


var dashboardChart = [];


var prjStartDt;
var prjEndDt;



var dplSignGrid_config = {
    sortable:true,
    header: {align:"center"},
    columns: [
              {key: "rn", label: " ", width: '4%', align: "center"},	
        		{key: "signStsNm", label: "결재 상태", width: 150, align: "center"},
       		{key: "signRegUsrNm", label: "요청자", width: 150, align: "center"},
       		{key: "signUsrNm", label: "결재자", width: 150, align: "center"},
       		{key: "signDtm", label: "결재 요청 일자", width: 150, align: "center",formatter:function(){
       			return new Date(this.item.signDtm).format("yyyy-MM-dd");
       		}},
       		{key: "dplNm", label: "배포계획명", width: 220, align: "center"},
       		{key: "signTxt", label: "결재 의견", width: 320, align: "left"},
       		{key: "signRejectTxt", label: "반려내용", width: 320, align: "left"},
        		],
    body: {
        align: "center",
        columnHeight: 30,
        onClick: function () {
        	
            this.self.select(dplSignGrid.selectedDataIndexs[0]);
        	
        	
            this.self.select(this.doindex);
        	
        },onDBLClick:function(){
        	
        	var item = this.item;
        	var data = {"dplId" : item.dplId, "prjId" : item.prjId};
		gfnLayerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1003View.do',data, "415", "690",'scroll');
        }
    },
    
    page: {
        navigationItemCount: 9,
        height: 30,
        display: true,
        firstIcon: '<i class="fa fa-step-backward" aria-hidden="true"></i>',
        prevIcon: '<i class="fa fa-caret-left" aria-hidden="true"></i>',
        nextIcon: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
        lastIcon: '<i class="fa fa-step-forward" aria-hidden="true"></i>',
        onChange: function () {
           fnInGridListSetting(this.page.selectPage,"&signUsrId=${sessionScope.loginVO.usrId}",gridObj["dplSign"],"<c:url value='/dpl/dpl2000/dpl2100/selectDpl2100AjaxView.do'/>",false);
        }
    } 
};


var signGrid_config = {
	showLineNumber: false,
	sortable:true,
	header: {align:"center"},
	columns: [
	    {key: "rn", label: " ", width: '4%', align: "center"},	
		{key: "signCdNm", label: "결재 상태", width: 80, align: "center"},
		{key: "signFlowNm", label: "작업흐름", width: 80, align: "center"},
		{key: "signUsrNm", label: "결재자", width: 80, align: "center"},
		{key: "signDtm", label: "결재 요청 일자", width: 130, align: "center",formatter:function(){
			return new Date(this.item.signDtm).format("yyyy-MM-dd");
		}},
		{key: "regUsrNm", label: "요청자", width: 80, align: "center"},
		{key: "signRejectCmnt", label: "반려내용", width: 200, align: "center"},
		],
	body: {
		align: "center",
		columnHeight: 30,
		onDBLClick:function(){
			
			if(usrTyp == "01"){
				var data = {"mode":"newReq","reqId": this.item.reqId, "reqProType":"02"}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4104View.do", data, '1300', '850','scroll');
			}else{
				var data = {"reqId": this.item.reqId}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4105View.do", data, '1330', '900','scroll',false);
			}
		}
	},
	contextMenu: {
		iconWidth: 20,
		acceleratorWidth: 100,
		itemClickAndClose: false,
		icons: {'arrow': '<i class="fa fa-caret-right"></i>'},
		items: [
			{type: "detailPopup", label: "상세 정보", icon:"<i class='fa fa-info-circle' aria-hidden='true'></i>"},
		],
		popupFilter: function (item, param) {
			
			if(typeof param.item == "undefined"){
				return false;
			}
			return true;
		},
		onClick: function (item, param) {
			
			if(item.type == "detailPopup"){
				var data = {"mode":"newReq","reqId": param.item.reqId, "reqProType":"02"}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4104View.do", data, '1300', '850','scroll');
			}
			param.gridSelf.contextMenu.close();
		}
	},
      page: {
          navigationItemCount: 9,
          height: 30,
          display: true,
          firstIcon: '<i class="fa fa-step-backward" aria-hidden="true"></i>',
          prevIcon: '<i class="fa fa-caret-left" aria-hidden="true"></i>',
          nextIcon: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
          lastIcon: '<i class="fa fa-step-forward" aria-hidden="true"></i>',
          onChange: function () {
             fnInGridListSetting(this.page.selectPage,"&signUsrId=${sessionScope.loginVO.usrId}",gridObj["sign"],"<c:url value='/chk/chk1000/chk1100/selectChk1100AjaxView.do'/>",false);
          }
      } 
	
	
};


var workGrid_config = {
	showLineNumber: true,
	sortable:true,
	frozenColumnIndex: 1,
	header: {align:"center"},
	columns: [
		{key: "workStatusNm", label: "작업상태", width: 80, align: "center"},
		{key: "flowNm", label: "작업흐름", width: 80, align: "center"},
		{key: "workChargerNm", label: "담당자", width: 80, align: "center"},
		{key: "workAdmContent", label: "작업 지시내용", width: 370, align: "left"},
		{key: "workAdmStDtm", label: "작업 시작예정일자", width: 140, align: "center"},
		{key: "workAdmEdDtm", label: "작업 종료예정일자", width: 140, align: "center"},
		{key: "workContent", label: "작업 내용", width: 390, align: "left"},
		{key: "workStDtm", label: "작업 시작일자", width: 140, align: "center"},
		{key: "workEdDtm", label: "작업 종료일자", width: 140, align: "center"},
		],
	body: {
		align: "center",
		columnHeight: 30,
		onDBLClick:function(){
			
			if(usrTyp == "01"){
				var data = {"mode":"newReq","reqId": this.item.reqId, "reqProType":"02"}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4104View.do", data, '1300', '850','scroll');
			}else{
				var data = {"reqId": this.item.reqId}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4105View.do", data, '1330', '900','scroll',false);
			}
		}
	},
	contextMenu: {
		iconWidth: 20,
		acceleratorWidth: 100,
		itemClickAndClose: false,
		icons: {'arrow': '<i class="fa fa-caret-right"></i>'},
		items: [
			{type: "detailPopup", label: "상세 정보", icon:"<i class='fa fa-info-circle' aria-hidden='true'></i>"},
		],
		popupFilter: function (item, param) {
			
			if(typeof param.item == "undefined"){
				return false;
			}
			return true;
		},
		onClick: function (item, param) {
			
			if(item.type == "detailPopup"){
				var data = {"mode":"newReq","reqId": param.item.reqId, "reqProType":param.item.reqProType}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4104View.do", data, '1300', '850','scroll');
			}
			param.gridSelf.contextMenu.close();
		}
	},
    page: {
        navigationItemCount: 9,
        height: 30,
        display: true,
        firstIcon: '<i class="fa fa-step-backward" aria-hidden="true"></i>',
        prevIcon: '<i class="fa fa-caret-left" aria-hidden="true"></i>',
        nextIcon: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
        lastIcon: '<i class="fa fa-step-forward" aria-hidden="true"></i>',
        onChange: function () {
        	fnInGridListSetting(this.page.selectPage,"&workChargerId="+usrId,gridObj["work"],"<c:url value='/req/req4000/req4400/selectReq4400ReqWorkListAjax.do'/>",false);
        }
    }
};


var newReqGrid_config = {
	showLineNumber: false,
	sortable:true,
	header: {align:"center"},
	columns: [
		{key: "rn", label: " ", width: '4%', align: "center"},	          
		{key: "reqOrd", label: "순번", width: '8%', align: "center"},	          
		{key: "reqDtm", label: "요청일자", width: '8%', align: "center"},
		{key: "reqUsrNm", label: "요청자", width: '8%', align: "center"},
		{key: "reqUsrEmail", label: "이메일", width: '11%', align: "center"},
		{key: "reqUsrNum", label: "연락처", width: '10%', align: "center"},
		{key: "reqNm", label: "요청 명", width: '30%', align: "left"},
		{key: "reqDesc", label: "요청 내용", width: '35%', align: "left"},
		],
	body: {
		align: "center",
		columnHeight: 30,
		onDBLClick:function(){
			
			if(usrTyp == "01"){
				
             	var data = {
             			"mode": "req", 
             			"reqId": this.item.reqId,
             			"reqProType": this.item.reqProType,
             			"reqPageType" : "usrReqPage"
             	}; 
             	gfnLayerPopupOpen("/req/req1000/req1000/selectReq1002View.do", data, '640', '890','scroll');
			}else{
				var data = {"reqId": this.item.reqId}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4106View.do", data, '900', '950','auto');
			}
		}
	},
	contextMenu: {
		iconWidth: 20,
		acceleratorWidth: 100,
		itemClickAndClose: false,
		icons: {'arrow': '<i class="fa fa-caret-right"></i>'},
		items: [
			{type: "detailPopup", label: "상세 정보", icon:"<i class='fa fa-info-circle' aria-hidden='true'></i>"},
			
		],
		popupFilter: function (item, param) {
			
			if(typeof param.item == "undefined"){
				return false;
			}
			return true;
		},
		onClick: function (item, param) {
			
				if(item.type == "detailPopup"){
				
             	var data = {
             			"mode": "req", 
             			"reqId": param.item.reqId,
             			"reqProType": param.item.reqProType,
             			"reqPageType" : "usrReqPage"
             	}; 
             	gfnLayerPopupOpen("/req/req1000/req1000/selectReq1002View.do", data, '640', '890','scroll');
			}
			param.gridSelf.contextMenu.close();
		}
	},
  page: {
      navigationItemCount: 9,
      height: 30,
      display: true,
      firstIcon: '<i class="fa fa-step-backward" aria-hidden="true"></i>',
      prevIcon: '<i class="fa fa-caret-left" aria-hidden="true"></i>',
      nextIcon: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
      lastIcon: '<i class="fa fa-step-forward" aria-hidden="true"></i>',
      onChange: function () {
      	fnInGridListSetting(this.page.selectPage,"&mode=dashboard&reqProType=01",gridObj["request"],"<c:url value='/req/req1000/req1000/selectReq1000ListAjaxView.do'/>",false);
      }
  }
};


var reqDtmOverGrid_config = {
	showLineNumber: true,
	sortable:true,
	header: {align:"center"},
	columns: [
	    {key: "processNm", label: "구분", width: 120, align: "center"},
		{key: "reqNm", label: "요청 제목", width: 250, align: "left"},
		{key: "reqDesc", label: "요청 내용", width: 350, align: "left"},
		{key: "calcReqDay", label: "초과 일수", width: 120, align: "center",formatter:function(){
			return this.item.calcReqDay+"일";
		}},
		{key: "reqChargerNm", label: "담당자", width: 80, align: "center"},
		{key: "regDtm", label: "생성일자", width: 140, align: "center",formatter:function(){
			return new Date(this.item.regDtm).format("yyyy-MM-dd");
		}},
		{key: "reqStDtm", label: "작업 시작일자", width: 140, align: "center",formatter:function(){
			return new Date(this.item.reqStDtm).format("yyyy-MM-dd HH:mm");
		}},
		{key: "reqEdDtm", label: "작업 종료일자", width: 140, align: "center",formatter:function(){
			return new Date(this.item.reqEdDtm).format("yyyy-MM-dd HH:mm");
		}},
		{key: "reqEdDuDtm", label: "작업 시작 예정일자", width: 140, align: "center",formatter:function(){
			return new Date(this.item.reqStDuDtm).format("yyyy-MM-dd");
		}},
		{key: "reqEdDuDtm", label: "작업 종료 예정일자", width: 140, align: "center",formatter:function(){
			return new Date(this.item.reqEdDuDtm).format("yyyy-MM-dd");
		}}
	],
	body: {
		align: "center",
		columnHeight: 30,
		onDBLClick:function(){
			
			if(usrTyp == "01"){
				var data = {"mode":"newReq","reqId": this.item.reqId, "reqProType":"02"}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4104View.do", data, '1300', '850','scroll');
			}else{
				var data = {"reqId": this.item.reqId}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4105View.do", data, '1300', '900','scroll',false);
			}
		}
	},
	contextMenu: {
		iconWidth: 20,
		acceleratorWidth: 100,
		itemClickAndClose: false,
		icons: {'arrow': '<i class="fa fa-caret-right"></i>'},
		items: [
			{type: "detailPopup", label: "상세 정보", icon:"<i class='fa fa-info-circle' aria-hidden='true'></i>"},
			
		],
		popupFilter: function (item, param) {
			var selItem = param.item;
			
			if(typeof selItem == "undefined"){
  				return false;
 			}
				return true;
			},
		onClick: function (item, param) {
			var selItem = param.item;

				if(item.type == "detailPopup"){
				var data = {"mode":"newReq","reqId": param.item.reqId, "reqProType":param.item.reqProType}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4104View.do", data, '1300', '850','scroll');
			}
			
			param.gridSelf.contextMenu.close();
		}
	}
};


var docDtmOverGrid_config = {
	showLineNumber: true,
	sortable:true,
	header: {align:"center"},
	columns: [
		
		{key: "upDocNm", label: "상위 산출물 명", width: 360, align: "left"},
		{key: "docNm", label: "산출물 명", width: 380, align: "left"},
		{key: "docDesc", label: "산출물 설명", width: 350, align: "left"},
		{key: "docCalcEdDay", label: "초과 일수", width: 120, align: "left",formatter:function(){
			return this.item.docCalcEdDay+"일";
		}},
		{key: "docEdDtm", label: "마감 일자", width: 140, align: "center",formatter:function(){
			return new Date(this.item.docEdDtm).format("yyyy-MM-dd");
		}}
	],
};



var flowGrid_config = {
	showLineNumber: true,
	sortable:true,
	header: {align:"center"},
	columns: [
		{key: "reqOrd", label: "순번", width: '8%', align: "center"},
		{key: "reqProTypeNm", label: "처리 상태", width: 100, align: "center"},
	    {key: "signCdNm", label: "결재 상태", width: 100, align: "center"},
	    {key: "signUsrNm", label: "결재자", width: 140, align: "center"},
	    {key: "reqDtm", label: "요청일자", width: 140, align: "center"},
		{key: "reqUsrNm", label: "요청자", width: 80, align: "center"},
		{key: "reqUsrEmail", label: "이메일", width: 140, align: "center"},
		{key: "reqUsrNum", label: "연락처", width: 100, align: "center"},
		{key: "reqChargerNm", label: "담당자", width: 80, align: "center"},
		{key: "reqNm", label: "요청 제목", width: 400, align: "left"},
		{key: "reqDesc", label: "요청 내용", width: 250, align: "left"},
		{key: "regDtm", label: "생성일자", width: 140, align: "center"},
		{key: "reqStDtm", label: "작업 시작일자", width: 140, align: "center"},
		{key: "reqEdDtm", label: "작업 종료일자", width: 140, align: "center"},
		{key: "reqStDuDtm", label: "작업 시작 예정일자", width: 140, align: "center"},
		{key: "reqEdDuDtm", label: "작업 종료 예정일자", width: 140, align: "center"},
	],
	body: {
		align: "center",
		columnHeight: 30,
		onDBLClick:function(){
			
			if(usrTyp == "01"){
				var data = {"mode":"newReq","reqId": this.item.reqId, "reqProType":"02"}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4104View.do", data, '1300', '850','scroll');
			}else{
				var data = {"reqId": this.item.reqId}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4105View.do", data, '1300', '900','scroll',false);
			}
		}
	},
	contextMenu: {
		iconWidth: 20,
		acceleratorWidth: 100,
		itemClickAndClose: false,
		icons: {'arrow': '<i class="fa fa-caret-right"></i>'},
		items: [
			{type: "detailPopup", label: "상세 정보", icon:"<i class='fa fa-info-circle' aria-hidden='true'></i>"},
		],
		popupFilter: function (item, param) {
			var selItem = param.item;
			
			if(typeof selItem == "undefined"){
  				return false;
 			}
				return true;
			},
		onClick: function (item, param) {
			var selItem = param.item;

			
			if(item.type == "detailPopup"){
				var data = {"mode":"newReq","reqId": param.item.reqId, "reqProType":param.item.reqProType}; 
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4104View.do", data, '1300', '850','scroll');
			}
			
			param.gridSelf.contextMenu.close();
		}
	},
    page: {
        navigationItemCount: 9,
        height: 30,
        display: true,
        firstIcon: '<i class="fa fa-step-backward" aria-hidden="true"></i>',
        prevIcon: '<i class="fa fa-caret-left" aria-hidden="true"></i>',
        nextIcon: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
        lastIcon: '<i class="fa fa-step-forward" aria-hidden="true"></i>',
        onChange: function () {
        	fnFlowReqGridSetting(this.page.selectPage,this.self.processId, this.self.flowId, this.self.type);
        }
    }
};


$(document).ready(function(){

	
	gfnGuideStack("add",fnDsh2000GuideShow);
	
	
	fnDashBoardSetting();
	
	
	Chart.plugins.register({
		afterDatasetsDraw: function(chart) {
			var ctx = chart.ctx;

			chart.data.datasets.forEach(function(dataset, i) {
				
				if(!gfnIsNull(dataset.valueShow) && !dataset.valueShow){
					return true;
				}
				var meta = chart.getDatasetMeta(i);
				if (!meta.hidden) {
					meta.data.forEach(function(element, index) {
						if(dataset.data[index] > 0){
							
							var fontColor = dataset.fontColor;
							
							if(gfnIsNull(fontColor)){
								fontColor = 'rgb(255, 255, 255)';
							}
							
							ctx.fillStyle = fontColor;

							var fontSize = 12;
							var fontStyle = 'normal';
							var fontFamily = 'Helvetica Neue';
							ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

							
							var eleValue = dataset.data[index];
							
							
							var dataString = parseInt(eleValue);

							
							if(!gfnIsNull(dataset.valueType) && dataset.valueType == "reqEndRatio"){
								
								var maxValue = 0;
								
								
								if(!gfnIsNull(element._chart.data.datasets)){
									$.each(element._chart.data.datasets,function(idx, map){
										maxValue += map.data[0];
									});
								}else{
									maxValue = element._xScale.max;
								}
								
								
								dataString = fnDoneRatio((maxValue-eleValue),eleValue,1);
							}
							
							
							if(!gfnIsNull(dataset.valueShowStr)){
								dataString += dataset.valueShowStr;
							}
							
							ctx.textAlign = 'center';
							ctx.textBaseline = 'middle';

							var position = element.tooltipPosition();
							
							
							var chartX = position.x;
							
							var chartY = position.y;
							
							
							if(dataset.valueShow == "barY"){
								chartY = position.y-((position.y-element._model.base)/2.3);
							}
							
							else if(dataset.valueShow == "barX"){
								chartX = position.x-((position.x-element._model.base)/2.3);
							}
							
							
							ctx.fillText(dataString, chartX, chartY);
						}
					});
				}
			});
		}
	});
	
});


function fnDashBoardSetting(){
	
	$(".foldDiv[folding=0]").show('fast',function(){
		$(".titleFoldingContent[folding=0]").removeClass("down").addClass("up");	
	});
	
	$(".foldDiv[folding=work]").show('fast',function(){
		$(".titleFoldingContent[folding=work]").removeClass("down").addClass("up");	
	});
	
	$(".foldDiv[folding=sign]").show('fast',function(){
		$(".titleFoldingContent[folding=sign]").removeClass("down").addClass("up");	
	});
	
	$(".foldDiv[folding=1]").show('fast',function(){
		$(".titleFoldingContent[folding=1]").removeClass("down").addClass("up");
	});
	
	
	$(".titleFoldingContent[folding=all]").removeClass("down").addClass("up");
	
	
	var ajaxObj = new gfnAjaxRequestAction(
		{"url":"<c:url value='/dsh/dsh2000/dsh2000/selectDsh2000DashBoardDataAjax.do'/>","loadingShow":true});
	
	
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		timerVarSel = $('#timerVarSel').val();
   		secondTime = (timerVarSel*60);
   		clearInterval(timer);
   		timer = setInterval('printTime()',1000);
   		
		
		fnProjectInfoSetting(data.prjInfo);
		
		
		fnReqDtmOverListSetting(data.reqDtmOverList);
		
		
		fnDocDtmOverListSetting(data.docDtmOverList);
		
		
		fnProcessListSetting(data.processList);
		
		
		fnReqDtmOverAlertListSetting(data.reqDtmOverAlertList);
		
		
		fnFlowListSetting(data.flowList);

		
		if(!gfnIsNull(dshDisplayCd) && dshDisplayCd == "02"){
			if(!gfnIsNull(processFlowList) && Object.keys(processFlowList).length > 0){
				
				$.each(processFlowList,function(idx, map){
					fnFlowReqKanbanSetting(idx);
				});
			}
		}else{
			
			if(!gfnIsNull(processFlowList) && Object.keys(processFlowList).length > 0){
				
				$.each(processFlowList,function(idx, map){
					
					if(dshProcessDisplayCd.hasOwnProperty(idx)){
						var typeCd = dshProcessDisplayCd[idx];
						
						
						if(typeCd == "kanban"){
							fnFlowReqKanbanSetting(idx);
						}else{
							return true;
						}
					}else{
						return true;
					}
				});
			}
		}
		
		
		fnDashboardGridSetting("request");
		fnInGridListSetting(0,"&mode=dashboard&reqProType=01",gridObj["request"],"<c:url value='/req/req1000/req1000/selectReq1000ListAjaxView.do'/>",false);

		
		fnDashboardGridSetting("work");
		fnInGridListSetting(0,"&workChargerId="+usrId,gridObj["work"],"<c:url value='/req/req4000/req4400/selectReq4400ReqWorkListAjax.do'/>",false);
		
		
		fnDashboardGridSetting("sign");
		fnInGridListSetting(0,"&signUsrId=${sessionScope.loginVO.usrId}",gridObj["sign"],"<c:url value='/chk/chk1000/chk1100/selectChk1100AjaxView.do'/>",false);
		
		
		fnDashboardGridSetting("dplSign");
		fnInGridListSetting(0,"&signUsrId=${sessionScope.loginVO.usrId}",gridObj["dplSign"],"<c:url value='/dpl/dpl2000/dpl2100/selectDpl2100AjaxView.do'/>",false);
		
		
		fnChartSetting(data);
	});
		
	
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message,"알림창");
	});
	
	
	ajaxObj.send();
}


function fnReqDtmOverAlertListSetting(reqDtmOverAlertList){
	
	var prjGreen = 0;
	var prjYellow = 0;
	var prjRed = 0;
	var prjOverRed = 0;
	var prjBlue = 0;
	
	$.each(reqDtmOverAlertList,function(idx, map){
		var $target = $(".dsh2000_dtmOverAlert[processid="+map.processId+"]");
		
		
		if(map.overType == "01"){
			prjGreen += map.overCnt;
			$target.children(".alert-green").html(map.overCnt);
		}
		
		else if(map.overType == "02"){
			prjYellow += map.overCnt;
			$target.children(".alert-yellow").html(map.overCnt);
		}
		
		else if(map.overType == "03"){
			prjRed += map.overCnt;
			$target.children(".alert-red").html(map.overCnt);
		}
		
		
		else if(map.overType == "04"){
			prjOverRed += map.overCnt;
			$target.children(".alert-overRed").html(map.overCnt);
		}
		
		else if(map.overType == "05"){
			prjBlue += map.overCnt;
			$target.children(".alert-blue").html(map.overCnt);
		}
	});
	
	
	var $prjTarget = $(".dsh2000_dtmOverAlert[processid=project]");
	$prjTarget.children(".alert-green").html(prjGreen);
	$prjTarget.children(".alert-yellow").html(prjYellow);
	$prjTarget.children(".alert-red").html(prjRed);
	$prjTarget.children(".alert-overRed").html(prjOverRed);
	$prjTarget.children(".alert-blue").html(prjBlue);
}


function fnProjectInfoSetting(prjInfo){

	var prjNm = prjInfo.prjNm;
	regPrjNm = (prjNm.replace(/</g,"&lt;")).replace(/>/g,"&gt;");
	
	
	$("span#prjNm").html(gfnCutStrLen(regPrjNm,85));
		
	
	$("span#prjReqDo").html(prjInfo.prjDoReqCnt);
	
	
	$("span#prjReqDone").html(prjInfo.prjDoneReqCnt);
	
	
	var prjReqDoneRatio = fnDoneRatio(prjInfo.prjDoReqCnt, prjInfo.prjDoneReqCnt);
	
	$("span#prjReqPer").html(prjReqDoneRatio);
	
	
	prjStartDt = prjInfo.startDt;
	prjEndDt = prjInfo.endDt;
	
	$("div.dsh2000_prjDateRangeInfo").html("("+prjStartDt+" ~ "+prjEndDt+")");
}


function fnReqDtmOverListSetting(reqDtmOverList){
	
	var chart2_bgColor = ["#4b73eb","#936de9","#ff5643","#58c3e5","#fba450","#eb4ba4","#89eb4b","#c4eb4b","#9f4beb","#fba450","#ff5643","#58c3e5","#fba450"];
	
	var reqDtmOverLabels = [];
	var reqDtmOverDatasets = [];
	
	
	var reqOverArr = {};
	$.each(reqDtmOverList, function(idx, map){
		
		var processId = map.processId;
		
		if(gfnIsNull(reqOverArr[processId])){
			reqOverArr[processId] = [];
		}
		
		reqOverArr[processId].push({"processId":processId, "processNm":map.processNm});
	});
	
	
	$.each(reqOverArr, function(processId, overList){
		
		if(overList.length > 0){
			
			reqDtmOverLabels.push(overList[0].processNm);
			reqDtmOverDatasets.push(overList.length);
		}
	});
	
	
	var ctx = document.getElementById("reqDtmOverChart").getContext('2d');
	
	if(!gfnIsNull(dashboardChart[3])){
		dashboardChart[3].destroy();
	}
	
	
	dashboardChart[3] = new Chart(
			ctx, {
		    type: 'bar',
		    data: {
		        labels: reqDtmOverLabels,
		        datasets: [{
		        	label:"미처리 건수",
		            data: reqDtmOverDatasets,
		            backgroundColor: chart2_bgColor,
		            borderWidth: 0,
		            valueShow:false,
			        valueShow: 'barY'
				}]
		    },
		    options: {
					responsive: true,
					title: {display: false},
					legend: {labels: {usePointStyle: false}}
					,'onClick' : function (evt, item) { 
				          if(!gfnIsNull(item) && item.length >0){
				       			var label  = item[0]._model.label;

				            	var data = { "processNm" : label, "popTitleMsg" : label};	

				            	gfnLayerPopupOpen('/dsh/dsh2000/dsh2000/selectDsh2001View.do',data, "850", "550",'scroll');
				            }
				     }
				}
		});
	
	reqDtmOverGrid = new ax5.ui.grid();
	reqDtmOverGrid_config.target = $('[data-ax5grid="reqDtmOverGrid"]');
	
	
	reqDtmOverGrid.setConfig(reqDtmOverGrid_config);
	
	
	reqDtmOverGrid.setData(reqDtmOverList);
	
	
	$("span#reqDtmOverDo").html(reqDtmOverList.length);
	
	
	var reqTotalCnt = parseInt($("span#prjReqDone").text())+parseInt($("span#prjReqDo").text());
	$("span#reqDtmOverDone").html(reqTotalCnt);
	
	
	var reqDtmOverDoneRatio = fnDoneRatio(reqDtmOverList.length,(reqTotalCnt-reqDtmOverList.length));
	$("span#reqDtmOverPer").html(reqDtmOverDoneRatio);
	
}


function fnDocDtmOverListSetting(docDtmOverList){
	
	docDtmOverGrid = new ax5.ui.grid();
	docDtmOverGrid_config.target = $('[data-ax5grid="docDtmOverGrid"]');
	
	
	docDtmOverGrid.setConfig(docDtmOverGrid_config);

	
	if(!gfnIsNull(docDtmOverList)){
		
		docDtmOverGrid.setData(docDtmOverList);
		
		
		$("span#docDtmOverDo").html(docDtmOverList.length);
	
		
		var docTotalCnt = docDtmOverList[0].docTotalCnt;
		$("span#docDtmOverDone").html(docTotalCnt);
		
		
		var docDtmOverDoneRatio = fnDoneRatio(docDtmOverList.length,(docTotalCnt-docDtmOverList.length));
		$("span#docDtmOverPer").html(docDtmOverDoneRatio);
		
		
		var docNullCnt = docDtmOverList[0].docNullCnt;
		$("span#docDtmOverNull").html(docNullCnt);
		
	}
}


function fnProcessListSetting(processList){
	
	$("#process_list_box").html('');

	var dshDisplayClass = '';
	
	if(!gfnIsNull(dshDisplayCd) && dshDisplayCd == "02"){
		dshDisplayClass = "processKanban";
	}
	
	
	$.each(processList,function(idx, map){
		var foldingNum = (idx+2);

		var setDisplayClass = dshDisplayClass;
		
		
		if(dshProcessDisplayCd.hasOwnProperty(map.processId)){
			var typeCd = dshProcessDisplayCd[map.processId];
			
			
			if(typeCd == "kanban"){
				setDisplayClass = "processKanban";
			}else{
				setDisplayClass = '';
			}
		}else{
			
			if(!gfnIsNull(dshDisplayCd) && dshDisplayCd == "02"){
				dshProcessDisplayCd[map.processId] = "kanban";
			}
		}
		
		
		var proDoneReqRatio = fnDoneRatio(map.proDoReqCnt, map.proDoneReqCnt);

		
		$("#process_list_box").append(
			'<div class="process_info_box '+setDisplayClass+'" processid="'+map.processId+'" totalReq='+(map.proTotalReqCnt)+'>'
				+'<div class="dsh_title_box">'
					+map.processNm
					+'<div class="titleFoldingBtn"><span class="titleFoldingContent up" folding="'+foldingNum+'"></span></div>'
					+'<div class="titleFullScreanBtn" onclick="fnDivFullScrean(\''+map.processId+'\');"><i class="fas fa-expand"></i></div>'
					+'<div class="titleRedoBtn"  redoid="process" processid="'+map.processId+'" onclick="fnSubDataLoad(\'obj\',this);"><li class="fa fa-redo"></li></div>'
					+'<div class="titleAllViewBtn"><span class="titleAllViewContent on" processid="'+map.processId+'"></span></div>'
					+'<div class="titleKanbanBtn" onclick="fnDivKanbanScrean(\''+map.processId+'\');"><i class="fas fa-columns"></i></div>'
					+' [ 진행 : <span class="doReqCnt">'+map.proDoReqCnt+'</span>건 / 완료 : <span class="doneReqCnt">'+map.proDoneReqCnt+'</span>건 / 진척률 : <span class="doneReqRatio">'+proDoneReqRatio+'</span>%]'
						+'<div class="dsh2000_dtmOverAlert" processid="'+map.processId+'">'
						+'<div class="dtmOverAlertCnt_desc" folding="'+foldingNum+'">'
						+'	<div class="alertDesc">초과</div>'
						+'	<div class="alertDesc">임박</div>'
						+'	<div class="alertDesc">여유</div>'
						+'	<div class="alertDesc">실패</div>'
						+'	<div class="alertDesc">적기</div>'
						+'</div>'
						+'	<div class="dtmOverAlertCnt alert-red" onclick="fnOpenReq(\''+map.processId+'\', \'03\', \''+map.processNm+' [초과]\');" title="완료되지 않은 요구사항 중 현재일을 기준으로 작업시한을 넘긴 요구사항 수 입니다.">0</div>'
						+'	<div class="dtmOverAlertCnt alert-yellow" onclick="fnOpenReq(\''+map.processId+'\', \'02\', \''+map.processNm+' [임박]\');" title="완료되지 않은 요구사항 중 현재일을 기준으로 완료시한이 3일 이하로 남은 요구사항 수 입니다.">0</div>'
						+'	<div class="dtmOverAlertCnt alert-green" onclick="fnOpenReq(\''+map.processId+'\', \'01\', \''+map.processNm+' [여유]\');" title="완료되지 않은 요구사항 중 현재일을 기준으로 완료시한이 4일 이상 여유있는 요구사항 수 입니다.">0</div>'
						+'	<div class="dtmOverAlertCnt alert-overRed" onclick="fnOpenReq(\''+map.processId+'\', \'04\', \''+map.processNm+' [실패]\');" title="요구사항 중 완료시한을 초과하여 완료된 요구사항 수 입니다.">0</div>'
						+'	<div class="dtmOverAlertCnt alert-blue" onclick="fnOpenReq(\''+map.processId+'\', \'05\', \''+map.processNm+' [적기]\');" title="요구사항 중 완료시한 이내 정상완료된 요구사항 수 입니다.">0</div>'
						+'</div>'
					+'</div>'
				+'<div class="foldDiv" folding="'+foldingNum+'">'
					+'<div class="process_flow_box">'
					+'</div>'
					+'<div class="process_flow_chart_box">'
						+'<canvas id="PRO_'+map.processId+'" width="1370" height="60"></canvas>'
					+'</div>'
					+'<div class="process_req_box" folding="'+foldingNum+'" style="display:none;">'
						+'<div>'
							+'	<div data-ax5grid="dshGrid-'+map.processId+'" data-ax5grid-config="{}" style="height: 250px;"></div>'
						+'</div>'
					+'</div>'
					+'<div class="process_kanban_box" processid="'+map.processId+'">'
					+'</div>'
				+'</div>'
			+'</div>');
	});
	
	
	$("div.titleFoldingBtn, div.titleAllViewBtn, div.autoRefreshFoldingBtn").off("click");

	
	$("div.titleAllViewBtn").click(function(){
		
		var $allViewBtn = $(this).children(".titleAllViewContent");
		
		
		var processId = $allViewBtn.attr("processid");
		
		
		var allViewDown = $allViewBtn.hasClass("off");
		
		
		fnFlowDivOnOff($allViewBtn,processId,allViewDown);
	});
			
	
	$("div.titleFoldingBtn").click(function(){
		
		var $foldBtn = $(this).children(".titleFoldingContent");
		
		
		var foldNum = $foldBtn.attr("folding");
		
		
		var foldLayoutDown = $foldBtn.hasClass("down");
		
		
		var $foldDiv = $(".foldDiv[folding="+foldNum+"]");
		
		
		$foldDiv.slideToggle();
		
		
		if(foldLayoutDown){
			$(this).parent(".dsh_title_box").removeClass("titleFolded");
			$foldBtn.removeClass("down").addClass("up");
			
			
			$(".dtmOverAlertCnt_desc[folding="+foldNum+"]").show();
		}else{
			$(this).parent(".dsh_title_box").addClass("titleFolded");
			$foldBtn.removeClass("up").addClass("down");
			
			
			$(".dtmOverAlertCnt_desc[folding="+foldNum+"]").hide();
		}
	});
	
	
	$("div.autoRefreshFoldingBtn").click(function(){
		
		var $foldBtn = $(this).children(".titleFoldingContent");
		
		
		var foldLayoutDown = $foldBtn.hasClass("down");
		
		
		var $foldDiv = $(".foldDiv");
		
		
		if(foldLayoutDown){
			$("div.titleFoldingBtn").parent(".dsh_title_box").removeClass("titleFolded");
			$("div.titleFoldingBtn").children(".titleFoldingContent").removeClass("down").addClass("up");
			$foldBtn.removeClass("down").addClass("up");
			
			
			$(".dtmOverAlertCnt_desc").show();
			
			
			$foldDiv.show();
		}else{
			$("div.titleFoldingBtn").parent(".dsh_title_box").addClass("titleFolded");
			$("div.titleFoldingBtn").children(".titleFoldingContent").removeClass("up").addClass("down");
			$foldBtn.removeClass("up").addClass("down");
			
			
			$(".dtmOverAlertCnt_desc").hide();
			
			
			$foldDiv.hide();
		}
	});
}

function kanbanFlowFoldOn(targetObj,processId){
	event.stopPropagation();
	$(targetObj).parent(".kanbanFrameDiv").addClass("reqZeroCntFolding");
	
	
	var foldingCnt = $(".process_kanban_box[processid="+processId+"] > .kanbanFrameDiv[totalcnt='0']:not(.reqZeroCntFolding)").length;
	
	
	if(foldingCnt == 0){
		var $allViewBtn = $(".process_info_box.processKanban[processid="+processId+"]").children(".dsh_title_box").children(".titleAllViewBtn").children(".titleAllViewContent");
		
		fnFlowDivOnOff($allViewBtn,processId,false);
	} 
}

function kanbanFlowFoldOff(targetObj,processId){
	event.stopPropagation();
	
	if($(targetObj).hasClass("reqZeroCntFolding")){
		$(targetObj).removeClass("reqZeroCntFolding");
	}
}


function fnFlowDivOnOff($allViewBtn, processId, allViewDown){
	
	if(allViewDown){
		$(".process_kanban_box[processid="+processId+"] .kanbanFrameDiv").removeClass("reqZeroCntFolding");
		$(".process_info_box[processid="+processId+"] .process_flow_box .dsh_flow_box[totalcnt=0]").show().next(".dsh_flow_arrow_box").show();
		
		
		
		$(".process_info_box[processid="+processId+"] .process_flow_box .dsh_flow_box").next(".dsh_flow_arrow_box").show();
		 
		$allViewBtn.removeClass("off").addClass("on");
		
	}else{	
		$(".process_kanban_box[processid="+processId+"] .kanbanFrameDiv[totalcnt=0]").addClass("reqZeroCntFolding");
		$(".process_info_box[processid="+processId+"] .process_flow_box .dsh_flow_box[totalcnt=0]").hide().next(".dsh_flow_arrow_box").hide();
		
		
		
		if($(".process_info_box[processid="+processId+"] .process_flow_box .dsh_flow_box[totalcnt!=0]").length == 1){
			$(".process_info_box[processid="+processId+"] .process_flow_box .dsh_flow_box").next(".dsh_flow_arrow_box").hide();
		}
		 
		$allViewBtn.removeClass("on").addClass("off");
		
		
		$(".kanbanFrameDiv.reqZeroCntFolding").click(function(){
			$(this).removeClass("reqZeroCntFolding");
			
			
			var foldingCnt = $(this).parent(".process_kanban_box").children(".kanbanFrameDiv.reqZeroCntFolding").length;
			
			
			if(foldingCnt == 0){
				
				fnFlowDivOnOff($allViewBtn,$(this).parent(".process_kanban_box").attr("processid"),true);
			}
		});
	}
}

function fnFlowListSetting(flowList){
	var processFlwCnt = 1;
	
	
	var chartDataset = [];
	
	
	var chart2_bgColor = ["#4b73eb","#936de9","#ff5643","#58c3e5","#fba450","#eb4ba4","#89eb4b","#c4eb4b","#9f4beb","#fba450","#ff5643","#58c3e5","#fba450"];	
	
	
	$.each(flowList,function(idx, map){
		
		var processTotalReqCnt = $(".process_info_box[processid="+map.processId+"]").attr("totalreq");
		
		
		var flowReqRatio = map.reqTotalCnt;
		
		
		chartDataset.push({
            label: map.flowNm,
            data: [flowReqRatio],
            fontColor: map.flowTitleColor,
            backgroundColor: map.flowTitleBgColor,
	        valueShow: 'barX',
	        valueShowStr: "%",
	        valueType:'reqEndRatio'
		});
		
		
		if(processFlwCnt > 1){
			$("div.process_info_box[processid="+map.processId+"] .process_flow_box").append('<div class="dsh_flow_arrow_box"></div>');
		}
	
	
		
		var flowOptionStr = "";
 		
		if(gfnIsNull(map.flowNextId) || map.flowNextId == "null"){
			flowOptionStr += "<li class='far fa-stop-circle' title='[종료]최종 완료'></li>";
		} 
		
		if(map.flowEssentialCd == "01"){
			flowOptionStr += '<li class="fa fa-key" title="필수"></li>';
		}
		
		if(map.flowSignCd == "01"){
			flowOptionStr += '<li class="fa fa-file-signature" title="결재"></li>';
		}
		
		if(map.flowSignStopCd == "01"){
			flowOptionStr += '<li class="far fa-stop-circle" title="결재 반려시 종료"></li>';
		}
		
		if(map.flowEndCd == "01"){
			flowOptionStr += '<li class="fa fa-sign-out-alt" title="종료 분기"></li>';
		}
		
		if(map.flowWorkCd == "01"){
			flowOptionStr += '<li class="fa fa-code-branch" title="작업 분기"></li>';
		}
		
		if(map.flowRevisionCd == "01"){
			flowOptionStr += '<li class="fa fa-code" title="리비전 저장 유무"></li>';
		}
		
		if(map.flowDplCd == "01"){
			flowOptionStr += '<li class="fa fa-puzzle-piece" title="배포계획 저장 유무"></li>';
		}
		
		if(map.flowAuthCd == "01"){
			flowOptionStr += '<li class="fa fa-user-shield" title="허용 역할그룹 제한유무"></li>';
		}
		
		if(map.optCnt > 0){
			flowOptionStr += '<li class="fa fa-list" title="추가 항목"></li>+'+map.optCnt;
		}

		
		var flowOptionStrDiv = '<div class="flowOptionDiv">'+flowOptionStr+'</div>';
		
		
		$("div.process_info_box[processid="+map.processId+"] .process_flow_box").append(
				'<div class="dsh_flow_box" flowid="'+map.flowId+'" totalcnt="'+map.reqTotalCnt+'" style="background-color: '+map.flowTitleBgColor+';color: '+map.flowTitleColor+';">'
				+flowOptionStrDiv
				+'	<div class="flow_box_title">'+map.flowNm+'</div>'
				+'	<div class="flow_box_contents" flowid="'+map.flowId+'" style="background-color: '+map.flowContentBgColor+';color: '+map.flowContentColor+';">'
				+'<span onclick="fnFlowReqList(\''+map.processId+'\',\''+map.flowId+'\',\'charge\')">'+map.reqChargerCnt+'</span>'
				+' / '
				+'<span onclick="fnFlowReqList(\''+map.processId+'\',\''+map.flowId+'\',\'all\')">'+map.reqTotalCnt+'</span>'
				+'</div>'
				+'</div>');
		
		
		if(gfnIsNull(flowOptionStr)){
			flowOptionStr = "&nbsp;";
		}
		
		
		$("div.process_kanban_box[processid="+map.processId+"]").append(
				'<div class="kanbanFrameDiv" totalcnt="'+map.reqTotalCnt+'" style="background-color: '+map.flowTitleBgColor+';color: '+map.flowTitleColor+';">'
					+'<div class="kanbanFoldBtn" onclick="kanbanFlowFoldOn(this,\''+map.processId+'\')"><i class="fas fa-eye-slash fa-2x"></i></div>'
					+'<div class="kanbanFlowOpt">'+flowOptionStr+'</div>'
					+'<div class="kanbanFlowReqCntDiv" flowid="'+map.flowId+'">'
						+'<span>'+map.reqChargerCnt+'</span>'
						+' / '
						+'<span>'+map.reqTotalCnt+'</span>'
					+'</div>'
					+'<div class="kanbanFlowNameDiv">'+map.flowNm+'</div>'
					+'<div class="kanbanContentReqList" processid="'+map.processId+'" flowid="'+map.flowId+'" style="background-color: '+map.flowContentBgColor+';color: '+map.flowContentColor+';"></div>'
				+'</div>');

		
		if(gfnIsNull(processFlowList[map.processId])){
			processFlowList[map.processId] = {};
		}
		if(gfnIsNull(processFlowList[map.processId][map.flowId])){
			processFlowList[map.processId][map.flowId] = map;
		}

		Sortable.create($(".kanbanContentReqList[flowid="+map.flowId+"]")[0],{
			group: 'requestList',
			draggable: '.kanbanSubMainFrame',
			direction: "vertical",
			filter: '.filtered',
			ghostClass : "dsh_req_row_ghost",
			chosenClass : "dpl_job_row_chosen",
			scroll:true,
			scrollSensitivity: 50,
			bubbleScroll:true,
			onMove: function (evt, originalEvent) {
				var fromProcessId = $(evt.from).attr("processid");
				var toProcessId = $(evt.to).attr("processid");
				
				
				if(fromProcessId != toProcessId){
					return false;
				}
			},
			onEnd: function (evt) {
				
				var startProcessId = $(evt.from).attr("processid");
				var startFlowId = $(evt.from).attr("flowid");
				var endProcessId = $(evt.to).attr("processid");
				var endFlowId = $(evt.to).attr("flowid");

				var req4105Check = true;
				
				
				var startFlowInfo = processFlowList[startProcessId][startFlowId];
				
				
				if(startProcessId == endProcessId && startFlowId == endFlowId){
					return false;
				}
				
				
				if(gfnIsNull(startFlowInfo.flowNextId)){
					toast.push("이미 최종완료 처리된 요구사항 입니다.");
				}
				
				
				var reqMoveCheck = fnFlowLoopCheck(startProcessId,startFlowId,endProcessId,endFlowId);
				
				
				if(reqMoveCheck != true && reqMoveCheck != false && !reqMoveCheck.value){
					toast.push(reqMoveCheck.message);
					
					req4105Check = false;
				}
				
				else if(reqMoveCheck == false){
					req4105Check = false;
				}
				else if(reqMoveCheck == true){
					
					req4105Check = true;
				}
				
				
				
				if(req4105Check){
					
					var paramReqId = $(evt.item).attr("reqid");
					
					var data = {"reqId": paramReqId, moveType: "kanban", endProcessId: endProcessId, endFlowId: endFlowId}; 
					gfnLayerPopupOpen("/req/req4000/req4100/selectReq4105View.do", data, '1330', '900','scroll',false);
					
				}
				
				$(evt.item).appendTo($(evt.from));
			}
		});
		
		
		if(!gfnIsNull(flowList[idx+1]) && flowList[idx+1].processId != map.processId || flowList.length-1 == idx){
			
			processFlwCnt = 0;
			
			
			var ctx = document.getElementById("PRO_"+map.processId).getContext('2d');
			var processChart = new Chart(ctx, {
			    type: 'horizontalBar',
			    data: {
			    	labels:["진척률"],
			        datasets: chartDataset
			    },
			    options: {
						responsive: true,
						scales: {
							xAxes: [{
								display: false,
								stacked: true,
							}],
							yAxes: [{
								display: false,
								stacked: true
							}]
						},
						title: {display: false},
						tooltips: false,
						legend: {labels: {usePointStyle: false},position: 'bottom'},
						layout: {
				            padding: {
				                left: 1,
				                right: 1,
				                top: 0,
				                bottom: 0
				            }
				        }
					}
			});
			
			chartDataset = [];
		}
		
		processFlwCnt++;
	});
}


function fnDoneRatio(doCnt, doneCnt, fixed){
	
	var doneRatio = 0;
	var default_fixed = 2;
	
	
	if(!gfnIsNull(fixed)){
		default_fixed = fixed;
	}
	
	
	if(!gfnIsNull(doneCnt) && doneCnt > 0){
		
		doneRatio = (doneCnt/(doCnt+doneCnt))*100;
		doneRatio = doneRatio.toFixed(default_fixed);
	}
	
	return doneRatio;
}


function printTime() {
	timerStr = Math.floor(secondTime/60) + "분 " + (secondTime%60) + "초";
	$('#autoRefreshSpan').html(timerStr);
	secondTime--;
	
	if (secondTime < 0) {
		clearInterval(timer);
		fnDashBoardSetting();
	}
}


function fnAutoRefreshEnd(){
	clearInterval(timer);
	$('#autoRefreshSpan').html("<i class='fa fa-infinity'></i>");
}


function fnDshboardWorkComplete(){
	
	if(Object.keys(gridObj["work"].focusedColumn).length == 0){
		jAlert("종료할 작업을 선택해주세요.","알림");
		return false;
	}
	
	var item = gridObj["work"].list[gridObj["work"].focusedColumn[Object.keys(gridObj["work"].focusedColumn)].doindex];
	
	
	if(item.workStatusCd == "02"){
		jAlert("이미 종료된 작업입니다.","알림");
		return false;
	}
	
	else if(item.workChargerId != usrId){
		jAlert("작업 종료는 담당자만 가능합니다.","알림");
		return false;
	}
	
	
	var reqId = item.reqId;
	var processId = item.processId;
	var flowId = item.flowId;
	var workId = item.workId;
	
	
	
	var data = {reqId: reqId,processId: processId, flowId: flowId, workId: workId, type:"dsh1000"};
	gfnLayerPopupOpen("/req/req4000/req4100/selectReq4109View.do", data, '600', '430','scroll');
}


function fnChartSetting(data){
	
	var processReqCnt = data.processReqCnt;
	
	
	var monthProcessReqCnt = data.monthProcessReqCnt;
	
	
	if(!gfnIsNull(processReqCnt)){
		
		var chart_processNm = [];
		var chart_reqAllCnt = [];
		var chart_reqEndCnt = [];
		var chart_reqChargerCnt = [];
		
		
		$.each(processReqCnt,function(idx, map){
			
			chart_processNm.push(map.processNm);
			
			
			chart_reqAllCnt.push(map.allCnt);
			
			
			chart_reqChargerCnt.push(map.chargerCnt);
			
			
			
			
				
			
			
				
				chart_reqEndCnt.push(map.endCnt);	
			
		});
		
		var ctx1 = document.getElementById("reqTotalCntChart").getContext('2d');
		
		
		if(!gfnIsNull(dashboardChart[0])){
			dashboardChart[0].destroy();
		}
		
		
		dashboardChart[0] = new Chart(ctx1, {
		    type: 'bar',
		    data: {
		    	labels: chart_processNm,
		        datasets: [{
		        	type:'line',
		            label: '최종완료 요구사항 수',
		            data: chart_reqEndCnt,
		            backgroundColor:'rgb(255, 125, 110)',
		            borderColor: 'rgb(255, 86, 67, 1)',
		            borderWidth: 2,
		            pointStyle: 'rectRot',
		            fill: false,
		            pointRadius: 4,
	           	 valueShow:false
		        },{
		        	type:'line',
		            label: '담당 요구사항 수',
		            data: chart_reqChargerCnt,
		            backgroundColor: 'rgb(255, 217, 123)',
		            borderColor: 'rgba(255, 206, 86, 1)',
		            borderWidth: 2,
		            pointStyle: 'circle',
		            fill: false,
		            pointRadius: 4,
	            	valueShow:false
		        },{
		        	type:'bar',
		            label: '총 요구사항 수',
		            data: chart_reqAllCnt,
		            backgroundColor:'#4b73eb',
		            borderColor: 'rgb(75, 115, 235, 1)',
		            borderWidth: 2,
		            pointStyle: 'rect',
			        valueShow: 'barY'
		        }]
		    },
		    options: {
					responsive: true,
					title: {display: true,text:'프로세스별 요구사항 수'},
					tooltips: {mode: 'index',intersect: false},
					legend: false
					,'onClick' : function (evt, item) {
			           if(!gfnIsNull(item) && item.length >2){
			       			var label  = item[2]._model.label;
			       			var data = {};
			            	if(label =="접수 대기"){
			            		data = { "reqProType" : "01" , "popTitleMsg" : label};	
			            	}else{
			            		data = { "processNm" : label, "popTitleMsg" : label};	
			            	}
			       			
			            	gfnLayerPopupOpen('/dsh/dsh1000/dsh1000/selectDsh1001View.do',data, "850", "550",'scroll');
			            }
			          }
				}
		});
	}
	
	
	if(!gfnIsNull(monthProcessReqCnt)){
		
		var chart2_x = ["01월","02월","03월","04월","05월","06월","07월","08월","09월","10월","11월","12월"];	
		var chart2_y_label = [];	
		var chart2_y_proNm = {};	
		var chart2_y_mmCnt = {};	
		var chart2_y_chargerCnt = {};	
		var chart2_datasets = [];	
		var chart2_bgColor = ["#4b73eb","#936de9","#ff5643","#58c3e5","#fba450","#eb4ba4","#89eb4b","#c4eb4b","#9f4beb","#fba450","#ff5643","#58c3e5","#fba450"];	
		
		
		
		var chart3_idxIf = {"01월":1,"02월":1,"03월":1,"04월":2,"05월":2,"06월":2,"07월":3,"08월":3,"09월":3,"10월":4,"11월":4,"12월":4};
		var chart3_quarter = [0,0,0,0,0];
		var chart3_chargerQuarter = [0,0,0,0,0];
		
		var ctx2 = document.getElementById("reqMonthCntChart").getContext('2d');
		
		
		$.each(monthProcessReqCnt,function(idx, map){
			var reqEdDtmMm = map.reqEdDuMm;
			
			reqEdDtmMm += "월";
			
			
			if(chart2_y_label.indexOf(map.processId) == -1){
				
				chart2_y_label.push(map.processId);
				
				
				var tempJson = {};
				tempJson[map.processId] = map.processNm;
				$.extend(chart2_y_proNm,tempJson);
			}
			
			
			if(Object.keys(chart2_y_mmCnt).indexOf(reqEdDtmMm) == -1){
				chart2_y_mmCnt[reqEdDtmMm] = {};
				chart2_y_chargerCnt[reqEdDtmMm] = {};
			}
			
			if(Object.keys(chart2_y_mmCnt[reqEdDtmMm]).indexOf(map.processId) == -1){
				
				
				var reqTotalCnt = map.reqTotalCnt;
				
				var reqEdMmCnt = map.reqEdMmCnt;
				
				var reqEdMmRatio = 0;
				
				
				if(reqEdMmCnt > 0 && reqTotalCnt > 0){
					reqEdMmRatio = (reqEdMmCnt/reqTotalCnt)*100;
					reqEdMmRatio = reqEdMmRatio.toFixed(0);
				}
				
				chart2_y_mmCnt[reqEdDtmMm][map.processId] = reqEdMmRatio;
				chart2_y_chargerCnt[reqEdDtmMm][map.processId] = map.reqChargerCnt;
			}
		});

		
		var chargerDataArr = [];
		
		$.each(chart2_y_label,function(idx, map){
			
			var mmCntDataArr = [];
			
			
			$.each(chart2_x,function(inIdx, inMap){
				
				if(gfnIsNull(chart2_y_mmCnt[inMap])){
					mmCntDataArr.push(0);
				}else{
					
					if(gfnIsNull(chart2_y_mmCnt[inMap][map])){	
						mmCntDataArr.push(0);
					}else{	
						mmCntDataArr.push(chart2_y_mmCnt[inMap][map]);
					
						
						var mmCntVal = chart2_y_mmCnt[inMap][map];
						if(mmCntVal > 0){
							mmCntVal = (mmCntVal/3);
						}
						
						
						chart3_quarter[chart3_idxIf[inMap]] += mmCntVal;
						
					}
				}
				
				if(gfnIsNull(chart2_y_chargerCnt[inMap])){
					chargerDataArr[inIdx] = 0;
				}else{
					
					if(!gfnIsNull(chart2_y_chargerCnt[inMap][map])){
						
						if(gfnIsNull(chargerDataArr[inIdx])){
							chargerDataArr[inIdx] = 0;
						}
						
						chargerDataArr[inIdx] = chargerDataArr[inIdx]+chart2_y_chargerCnt[inMap][map];
						
						
						chart3_chargerQuarter[chart3_idxIf[inMap]] += chart2_y_chargerCnt[inMap][map];
					}
				}
			});
			
			
			var bgIdx = idx;
			
			
			if(idx > chart2_bgColor.length-1){
				bgIdx = idx%chart2_bgColor.length;
			}
			
			
			chart2_datasets.push({
				type:'bar',
	            label: chart2_y_proNm[map],
	            data: mmCntDataArr,
	            backgroundColor: chart2_bgColor[bgIdx],
	            borderWidth: 0,
	            pointStyle: 'rect',
	            fill: false,
	            pointRadius: 4,
		        valueShow: 'barY',
		        valueShowStr: "%"
			});
		});
		
		
		if(!gfnIsNull(dashboardChart[1])){
			dashboardChart[1].destroy();
		}
		
		
		dashboardChart[1] = new Chart(ctx2, {
		    type: 'bar',
		    data: {
		        labels: chart2_x,
		        datasets: chart2_datasets
		    },
		    options: {
			    	'onClick' : function (evt, item) {
		    	 		if(item.length>0){
		    	 			var label =  item[0]._model.label;
		    	 			var month = label.substring(0,2);
		    	 			var data = {};
			            	
			            	data = { "processMonth" : month, "popTitleMsg" : label};	
			            	
			            	gfnLayerPopupOpen('/dsh/dsh1000/dsh1000/selectDsh1001View.do',data, "850", "550",'scroll');
		    	 		}
		    	 		
		    	 	},
					responsive: true,
					scales: {
						xAxes: [{
							stacked: true,
						}],
						yAxes: [{
							stacked: true,
							ticks: {
								beginAtZero: true,
								suggestedMin: 0,
			                    callback: function(value, index, values) {
			                        return value+'%';
			                    }
			                }
						}]
					},
					title: {display: true,text:'각 프로세스별 처리율 (월)'},
					tooltips: {
						mode: 'index'
						,intersect: false
						,callbacks: {
							label:function(tooltipItems, data){
								var thisLabel = data.datasets[tooltipItems.datasetIndex].label;
								return thisLabel+": "+tooltipItems.yLabel+"%";
							}
							,
							footer: function(tooltipItems, data) {
								var sum = 0;
	
								tooltipItems.forEach(function(tooltipItem) {
										sum += parseInt(data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index]);
								});
								
								return '총 처리율: ' + sum+"%";
							},
						}
					},
					legend: {labels: {usePointStyle: true}}
				}
		});
		
		
		var ctx3 = document.getElementById("reqQuarterCntChart").getContext('2d');
		
		
		if(!gfnIsNull(dashboardChart[2])){
			dashboardChart[2].destroy();
		}
		
		
		dashboardChart[2] = new Chart(ctx3, {
		    type: 'bar',
		    data: {
		        labels: ["미지정","1분기","2분기","3분기","4분기"],
		        datasets: [{
						type:'bar',
			            label: "처리율",
			            data: chart3_quarter,
			            backgroundColor: chart2_bgColor,
			            borderWidth: 0,
			            pointStyle: 'rect',
			            fill: false,
			            pointRadius: 4,
				        valueShow: 'barY',
				        valueShowStr: "%"
					}]
		    },
		    options: {
			    	'onClick' : function (evt, item) {
			    		if(item.length>0){
		    	 			var label =  item[0]._model.label;
		    	 			var quarter = label.substring(0,1);
		    	 			var data = {};
			            	if(quarter=="1"){
			            		data = { "processStartMonth" : "01" ,"processEndMonth" : "03", "popTitleMsg" : "1분기"};	
			            	}else if(quarter=="2"){
			            		data = { "processStartMonth" : "04" ,"processEndMonth" : "06", "popTitleMsg" : "2분기"};
			            	}else if(quarter=="3"){
			            		data = { "processStartMonth" : "07" ,"processEndMonth" : "09", "popTitleMsg" : "3분기"};
			            	}else if(quarter=="4"){
			            		data = { "processStartMonth" : "10" ,"processEndMonth" : "12", "popTitleMsg" : "4분기"};
			            	}
			            	
			            	gfnLayerPopupOpen('/dsh/dsh1000/dsh1000/selectDsh1001View.do',data, "850", "550",'scroll');
		    	 		}
		    	 	},
					responsive: true,
					scales: {
						xAxes: [{
							stacked: true,
						}],
						yAxes: [{
							stacked: true,
							ticks: {
								beginAtZero: true,
								suggestedMin: 0,
			                    callback: function(value, index, values) {
			                        return value+'%';
			                    }
			                }
						}]
					},
					title: {display: true,text:'분기별 처리율'},
					tooltips: {
						mode: 'index'
						,intersect: false
						,callbacks: {
							label:function(tooltipItems, data){
								return "";
							},
							footer: function(tooltipItems, data) {
								return '처리율: ' +parseInt(tooltipItems[0].yLabel)+"%";
							},
						}
					},
					legend: false
				}
		});
		
	}
}



function fnFlowLoopCheck(startProcessId,startFlowId,endProcessId,endFlowId){
	
	var startFlowInfo = processFlowList[startProcessId][startFlowId];
	
	
	var endFlowInfo = processFlowList[endProcessId][endFlowId];

	
	if(startFlowInfo.flowNextId == endFlowInfo.flowId){
		return {value:true};
	}else{
		
		if(gfnIsNull(startFlowInfo.flowNextId)){
			return false;
		}
		
		
		var nextFlowInfo = processFlowList[startProcessId][startFlowInfo.flowNextId];
		
		
		if(nextFlowInfo.flowEssentialCd == "01"){
			
			if(gfnIsNull(endFlowInfo.flowNextId)){
				
				if(startFlowInfo.flowEndCd == "01"){
					return {value:true};
				}else{
					return {message:"최종완료 처리 될 수 없는 요구사항입니다.",value:false};
				}
			}else{
				return {message:"다음 작업흐름 "+nextFlowInfo.flowNm+"(이)가 필수 작업흐름입니다.",value:false};
			}
		}
		
		
		return fnFlowLoopCheck(startProcessId,startFlowInfo.flowNextId,endProcessId,endFlowId);
	}
}




function fnSubDataLoad(type,thisObj,thisProcessId){
	if(type == "obj"){
		var $targetObj = $(thisObj);
		var redoId = $targetObj.attr("redoid");
		var processId = $targetObj.attr("processid");
	}else{
		
		var redoId = thisObj;
		var processId = thisProcessId;
	}

	
	if(redoId == "request"){
		fnInGridListSetting(gridObj["request"].page.currentPage,"&mode=dashboard&reqProType=01",gridObj["request"],"<c:url value='/req/req1000/req1000/selectReq1000ListAjaxView.do'/>",true);
		return false;
	}
	
	else if(redoId == "sign"){
		fnInGridListSetting(gridObj["sign"].page.currentPage,"&signUsrId=${sessionScope.loginVO.usrId}",gridObj["sign"],"<c:url value='/chk/chk1000/chk1100/selectChk1100AjaxView.do'/>",false);
		return false;
	}
	
	else if(redoId == "dplSign"){
		fnInGridListSetting(gridObj["dplSign"].page.currentPage,"&signUsrId=${sessionScope.loginVO.usrId}",gridObj["dplSign"],"<c:url value='/dpl/dpl2000/dpl2100/selectDpl2100AjaxView.do'/>",false);
		return false;
	}
	
	else if(redoId == "work"){
		fnInGridListSetting(gridObj["work"].page.currentPage,"&workChargerId="+usrId,gridObj["work"],"<c:url value='/req/req4000/req4400/selectReq4400ReqWorkListAjax.do'/>",false);
		return false;
	}
	
	
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/dsh/dsh2000/dsh2000/selectDsh2000DashBoardSubDataAjax.do'/>","loadingShow":true}
			,{redoId: redoId,processId: processId});
	
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		if(redoId == "chart"){
			fnProjectInfoSetting(data.prjInfo);
			fnChartSetting(data);
		}
		
		else if(redoId == "reqDtmOver"){
			
			fnReqDtmOverListSetting(data.reqDtmOverList);
		}
		
		else if(redoId == "docDtmOver"){
			
			fnDocDtmOverListSetting(data.docDtmOverList);
		}
		
		else if(redoId == "process"){
			
			$("div.process_info_box[processid="+processId+"] .process_req_box").hide("fast");
			
			
			$("div.process_info_box[processid="+processId+"] .process_flow_box").html('');
			$("div.process_kanban_box[processid="+processId+"]").html('');
			
			
			var flowList = data.flowList;
			
			
			fnFlowListSetting(flowList);
			
			
			if($("div.process_info_box.processKanban[processid="+processId+"]").length > 0){
				
				fnFlowReqKanbanSetting(processId);
			}
			
			
			var $allViewBtnChk = $("div.process_info_box[processid="+processId+"] .titleAllViewContent");
			if($allViewBtnChk.hasClass("off")){
				$allViewBtnChk.click();
			}
		}
	});
	
	
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message,"알림창");
	});
	
	
	ajaxObj.send();
	
}


function fnFlowReqList(processId, flowId, type){
	var $reqDivTarget = $("div.process_info_box[processid="+processId+"] .process_req_box");
	
	
	$(".process_info_box[processid="+processId+"] .dsh_flow_box.active").removeClass("active");
	$(".process_info_box[processid="+processId+"] .dsh_flow_box[flowid="+flowId+"]").addClass("active");
	
	
	$reqDivTarget.show("fast",function(){
		
		fnDashboardGridSetting(processId);
		
		
		fnFlowReqGridSetting(0,processId, flowId, type);
	});
}


function fnFlowReqGridSetting(_pageNo,processId, flowId, type){
	var pageNo = 0;
	
	
 	if(!gfnIsNull(_pageNo)){
 		pageNo = _pageNo;
 	}else if(typeof gridTarget.page.currentPage != "undefined"){
 		pageNo = gridObj[processId].page.currentPage;
 	}
	
	
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/dsh/dsh1000/dsh1000/selectDsh1000ProFlowRequestAjax.do'/>","loadingShow":false}
			,{pageNo: pageNo, processId: processId, flowId: flowId, type: type});
	
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		
		var proFlowReqList = data.proFlowReqList;
	
		
		if(!gfnIsNull(proFlowReqList)){
			var page = data.page;
		
			gridObj[processId].setData({
				list:proFlowReqList,
				page: {
					currentPage: _pageNo || 0,
					pageSize: page.pageSize,
					totalElements: page.totalElements,
					totalPages: page.totalPages
				}
			});
	   	
			
			gridObj[processId]["processId"] = processId;
			gridObj[processId]["flowId"] = flowId;
			gridObj[processId]["type"] = type;
			
			
			
			
			var $processChargeCnt = $(".process_info_box[processId="+processId+"] .chargeReqCnt");
			var $processAllCnt = $(".process_info_box[processId="+processId+"] .totalReqCnt");
			
			
			var selectCnt = page.totalElements;
			
			
			if(type == "all"){
				
				var before_proReqCnt = parseInt($processAllCnt.text());
				
				
				var $before_flowReqCnt = $(".process_info_box[processId="+processId+"] .flow_box_contents[flowid="+flowId+"] > span").eq(1);
				
				
				if(parseInt($before_flowReqCnt.text()) != selectCnt){
					var calc_value = before_proReqCnt;
					
					
					calc_value -= parseInt($before_flowReqCnt.text());
					
					
					calc_value += selectCnt;
					
					
					$processAllCnt.text(calc_value);
				}
				
				
				$before_flowReqCnt.text(selectCnt);
			}
			
			else if(type == "charge"){
				
				var before_proReqCnt = parseInt($processChargeCnt.text());
				
				
				var $before_flowReqCnt = $(".process_info_box[processId="+processId+"] .flow_box_contents[flowid="+flowId+"] > span").eq(0);
				
				
				if(parseInt($before_flowReqCnt.text()) != selectCnt){
					var calc_value = before_proReqCnt;
					
					
					calc_value -= parseInt($before_flowReqCnt.text());
					
					
					calc_value += selectCnt;
					
					
					$processChargeCnt.text(calc_value);
				}
				
				
				$before_flowReqCnt.text(selectCnt);
			}
		}
	});
	
	
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message,"알림창");
	});
	
	
	ajaxObj.send();
}


function fnFlowReqKanbanSetting(processId){
	
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/dsh/dsh1000/dsh1000/selectReq4100ProcessReqList.do'/>","loadingShow":false}
			,{processId: processId});
	
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		
		var proFlowReqList = data.proFlowReqList;
	
		
		if(!gfnIsNull(proFlowReqList)){
			
			$(".process_kanban_box[processid="+processId+"] .kanbanContentReqList").html('');
			
			
			$.each(proFlowReqList,function(idx, map){
				
				
				var reqChargerNm = map.reqChargerNm;
				var reqChargerImgId = map.reqChargerImgId;
				var reqNm = map.reqNm;
				var reqDesc = map.reqDesc;
				var flowId = map.flowId;
				var reqProType = map.reqProType;
				var dDay = 0;
				
				
				var currDay = 24 * 60 * 60 * 1000;
				
          	
          	var overTimeColor = '';
          	
          	
          	var reqEdDuDtm = new Date(new Date(map.reqEdDuDtm).format('yyyy-MM-dd'));
				var reqEdDtm = new Date(new Date(map.reqEdDtm).format('yyyy-MM-dd'));
				var agoTime = '종료 일자 미 등록';
				var dDayStr = '';
				
				
				if(reqEdDtm > 0){
					agoTime = new Date(map.reqEdDtm).format('yyyy-MM-dd HH:mm:ss');
					if(reqEdDuDtm > 0){
						dDay = parseInt((reqEdDtm-reqEdDuDtm)/currDay);
					}else{
						dDay = parseInt((reqEdDtm-new Date())/currDay);
					}
				}
				
				else if(reqEdDuDtm > 0){
					agoTime = reqEdDtm.format('yyyy-MM-dd');
					dDay = parseInt((new Date()-reqEdDuDtm)/currDay);
				}
				
				
				dDayStr = " "+dDay+"일";
				if(gfnIsNull(map.reqEdDtm)){
					reqEdDtm = new Date(new Date().format('yyyy-MM-dd'));
				}
				
				
				if(reqProType == "04"){
					
					if(new Date(reqEdDuDtm) < new Date(reqEdDtm)){
						overTimeColor = "alert-overRed";
					}else{	
						overTimeColor = "alert-blue";
					}
				}else{
					
					if(new Date(reqEdDuDtm) < new Date(reqEdDtm)){
						overTimeColor = "alert-red";
					}
					
					else if(new Date(new Date(reqEdDuDtm).setDate(new Date(reqEdDuDtm).getDate()-3)) < new Date(reqEdDtm)){
						overTimeColor = "alert-yellow";
					}else{	
						overTimeColor = "alert-green";
					}
				}

				
				var filterClass = '';
				
				var signMaskStr = '';
				
				if(!gfnIsNull(map.signCd) && map.signCd == "01"){
					signMaskStr = '<div class="completeMask"><div class="completeContent">결재 대기중 (결재자: '+map.signUsrNm+')</div></div>';
					filterClass = " filtered";
				}
				
				
				var reqPopType = true;
				
				
				if(reqProType == "04"){
					reqPopType = false;
					filterClass = " filtered";
				}
				
				
				if(map.reqChargerId != "${sessionScope.loginVO.usrId}"){
					filterClass = " filtered";
				}
				
				
				kanbanReqListStr = 
					'<div class="kanbanSubMainFrame'+filterClass+'" onclick="fnReqDetailPopupOpen(\''+map.reqId+'\','+reqPopType+')" reqid="'+map.reqId+'" reqprotype="'+reqProType+'">'
						+signMaskStr
						+'<div class="kbSubHeaderFrame">'
						+'<i class="fa fa-id-card"></i>&nbsp;'+map.reqOrd
						+'</div>'
						+'<div class="kbSubTopFrame">'
							+'<div class="kbSubLeftFrame">'
								+'<img class="usrImgClass" src="/cmm/fms/getImage.do?fileSn=0&atchFileId='+reqChargerImgId+'"></br>'
								+'<i class="fa fa-user-tie"></i>&nbsp;'
								+reqChargerNm
							+'</div>'
							+'<div class="kbSubRightFrame">'
								+'<div class="kbSubRightTopFrame">'
									+'<span class="kbSubReqNmDiv" title="'+reqNm+'">&nbsp;'+reqNm+'</span>'
								+'</div>'
								+'<div class="kbSubRightBottomFrame" title="'+reqDesc+'">'
									+reqDesc
								+'</div>'
							+'</div>'
						+'</div>'
						+'<div class="kbSubBottomFrame">'
						+'<div class="kbSubAgoTimeIcon '+overTimeColor+'"><i class="fas fa-clock"></i>'+dDayStr+'</div>'
							+agoTime
						+'</div>'
					+'</div>';
				
				
				
				$(".process_kanban_box[processid="+processId+"] .kanbanContentReqList[flowid="+flowId+"]").append(kanbanReqListStr);
			});
		}
	});
	
	
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message,"알림창");
	});
	
	
	ajaxObj.send();
}


function fnDivFullScrean(processId){
	
	var $targetObj = $(".process_info_box[processid="+processId+"]");
	
	
	var $fullDiv = $(".process_info_box.processFullscrean");
	var fullDivId = $fullDiv.attr("processId");
	
	
	
	$(".process_info_box.processFullscrean").stop().animate({top:'20%'},200,function(){
		
		if($targetObj.hasClass("processKanban")){
			$(".process_info_box.processKanban.processFullscrean .process_kanban_box").css({"height":""});
			$(".process_info_box.processKanban.processFullscrean .kanbanContentReqList").css({"height":""});
		
			$("body").css({"overflow":"auto"});	
		}
		
		$(this).removeClass("processFullscrean");
	});
	
	
	if(processId != fullDivId){
		
		$targetObj.addClass("processFullscrean");
		
		
		$targetObj.animate({top:'0px'});
		
		
		if($targetObj.hasClass("processKanban")){
			var screenHeight = $(window).height();
			
			
			$("body").css({"overflow":"hidden"});
			
			$(".process_info_box.processKanban.processFullscrean .process_kanban_box").css({"height":screenHeight-55});
			$(".process_info_box.processKanban.processFullscrean .kanbanContentReqList").css({"height":screenHeight-170});
		}
	}
}


function fnDivKanbanScrean(processId){
	
	var $targetObj = $(".process_info_box[processid="+processId+"]");
	
	
	if($targetObj.hasClass("processKanban")){
		$targetObj.children(".foldDiv").children(".process_kanban_box").slideUp();
		
		
		if($targetObj.hasClass("processKanban")){
			$(".process_info_box[processid="+processId+"].processKanban .process_kanban_box").css({"height":""});
			$(".process_info_box[processid="+processId+"].processKanban .kanbanContentReqList").css({"height":""});
		
			$("body").css({"overflow":"auto"});	
			
			dshProcessDisplayCd[processId] = "grid";
		}
		$targetObj.removeClass("processKanban");
		
	}else{
		dshProcessDisplayCd[processId] = "kanban";
		
		fnFlowReqKanbanSetting(processId);
		
		$targetObj.addClass("processKanban");
		$targetObj.children(".foldDiv").children(".process_kanban_box").show();
		
		
		if($targetObj.hasClass("processFullscrean")){
			
			var screenHeight = $(window).height();
			
			
			$(".process_info_box.processKanban.processFullscrean .process_kanban_box").css({"height":screenHeight-55});
			$(".process_info_box.processKanban.processFullscrean .kanbanContentReqList").css({"height":screenHeight-170});
			
			$("body").css({"overflow":"hidden"});
		}else{
			$(".process_info_box[processid="+processId+"].processKanban .process_kanban_box").css({"height":""});
			$(".process_info_box[processid="+processId+"].processKanban .kanbanContentReqList").css({"height":""});
		
			$("body").css({"overflow":"auto"});	
		}
	}
}


function fnInGridListSetting(_pageNo,paramData,gridTarget,dataUrl,loadingShow){
   	
   	if(!gfnIsNull(_pageNo)){
   		paramData += "&pageNo="+_pageNo;
   	}else if(typeof gridTarget.page.currentPage != "undefined"){
   		paramData += "&pageNo="+gridTarget.page.currentPage;
   	}
   	
   	
   	if(gfnIsNull(loadingShow)){
   		loadingShow = true;
   	}
   	
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":dataUrl,"loadingShow":loadingShow}
				,paramData);
		
		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
			
			
	    	if(data.errorYn == 'Y'){ 
	    		toast.push(data.message);
	    		return;
	    	}
			
			var list = data.list;
			var page = data.page;

			if(!gfnIsNull(gridObj["request"]) && gridTarget == gridObj["request"]){
				
				$("#requestTotalCnt").html(list.length);
			}
			
		   	gridTarget.setData({
		             	list:list,
		             	page: {
		                  currentPage: _pageNo || 0,
		                  pageSize: page.pageSize,
		                  totalElements: page.totalElements,
		                  totalPages: page.totalPages
		              }
		             });
		});
		
		
		ajaxObj.send();
}


function fnReqDetailPopupOpen(reqId,type){
	
	if(gfnIsNull(type)){
		type = true;
	}
	
	if(usrTyp == "01"){
		var data = {"mode":"newReq","reqId": reqId, "reqProType":"02"}; 
		gfnLayerPopupOpen("/req/req4000/req4100/selectReq4104View.do", data, '1300', '850','scroll');
	}else{
		
		if(!type){
			var data = {"mode":"newReq","reqId": reqId, "reqProType":"02"}; 
			gfnLayerPopupOpen("/req/req4000/req4100/selectReq4104View.do", data, '1300', '850','scroll');
		}else{
			var data = {"reqId": reqId}; 
			gfnLayerPopupOpen("/req/req4000/req4100/selectReq4105View.do", data, '1330', '900','scroll',false);
		}
	}
}


function fnDashboardGridSetting(gridId){
	
	gridObj[gridId] = new ax5.ui.grid();
  	 
	
	var tmp_config = flowGrid_config;
  	 
	
	if(gridId == "request"){
		tmp_config = newReqGrid_config;
	}
	
	else if(gridId == "work"){
		tmp_config = workGrid_config;
	}
	
	else if(gridId == "sign"){
		tmp_config = signGrid_config;
	}
	
	else if(gridId == "dplSign"){
		tmp_config = dplSignGrid_config;
	}
  	 
	
	tmp_config.target = $('[data-ax5grid="dshGrid-'+gridId+'"]');
  	 
	
	gridObj[gridId].setConfig(tmp_config);
}


function fnDsh2000GuideShow(){
	var mainObj = $(".main_contents");
	
	
	if(mainObj.length == 0){
		return false;
	}
	
	var guideBoxInfo = globals_guideContents["dsh2000"];
	gfnGuideBoxDraw(true,mainObj,guideBoxInfo);
}


function fnOpenReq(processId, overType, popTitleMsg){
	var data = {};
	
	data = { "overType" : overType ,"processId" : processId, "popTitleMsg" : popTitleMsg};
	
	gfnLayerPopupOpen('/dsh/dsh1000/dsh1000/selectDsh1001View.do',data, "850", "550",'scroll');
}

</script>
<div class="main_contents">
	<div class="contents_wrap">
		<div class="contents_title">
			${sessionScope.selMenuNm }
			<div class="dataAutoRefreshDiv" guide="dsh2000AutoRefresh">
				<i class="fa fa-clock"></i>&nbsp;
				<span id="autoRefreshSpan">00분 00초</span> 후 자동 갱신&nbsp;-
				<i class="fa fa-cogs autoRefresh_timeIcon"></i>&nbsp;
				<select class="autoRefresh_select" id="timerVarSel" onchange="fnDashBoardSetting()">
					<option value="0.5">30초</option>
					<option value="1">1분</option>
					<option value="5" selected>5분</option>
					<option value="10">10분</option>
					<option value="30">30분</option>
					<option value="60">1시간</option>
				</select>
				<div class="autoRefreshFoldingBtn"><span class="titleFoldingContent up" folding="all"></span></div>
				<div class="autoRefreshEndBtn" onclick="fnAutoRefreshEnd();"><li class="fa fa-times"></li></div>
				<div class="autoRefreshRedoBtn" onclick="fnDashBoardSetting();"><li class="fa fa-redo"></li></div>
			</div>
		</div>
		<div class="osl_main_wrap">
			<div class="dsh_top_box" guide="dsh2000DshTopPrjBox">
				<div class="dsh_title_box">
					<div class="titleFoldingBtn"><span class="titleFoldingContent up" folding="0"></span></div>
					<div class="titleRedoBtn" redoid="chart" onclick="fnSubDataLoad('obj',this);"><li class="fa fa-redo"></li></div>
					<span id="prjNm"></span>
					<div class="dsh2000_prjInfo" guide="dsh2000DshPrjProgressBox">[ 진행: <span id="prjReqDo">0</span>건 / 완료: <span id="prjReqDone">0</span>건 / 진척률: <span id="prjReqPer">0</span>% ]</div>
					<div class="dsh2000_dtmOverAlert" processid="project" guide="dsh2000DtmOver">
						<div class="dtmOverAlertCnt_desc" folding="0">
							<div class="alertDesc">초과</div>
							<div class="alertDesc">임박</div>
							<div class="alertDesc">여유</div>
							<div class="alertDesc">실패</div>
							<div class="alertDesc">적기</div>
						</div>
						<div class="dtmOverAlertCnt alert-red" onclick="fnOpenReq('', '03', '초과');" title="완료되지 않은 요구사항 중 현재일을 기준으로 작업시한을 넘긴 요구사항 수 입니다.">0</div>
						<div class="dtmOverAlertCnt alert-yellow" onclick="fnOpenReq('', '02','임박');" title="완료되지 않은 요구사항 중 현재일을 기준으로 완료시한이 3일 이하로 남은 요구사항 수 입니다.">0</div>
						<div class="dtmOverAlertCnt alert-green" onclick="fnOpenReq('', '01', '여유');" title="완료되지 않은 요구사항 중 현재일을 기준으로 완료시한이 4일 이상 여유있는 요구사항 수 입니다.">0</div>
						<div class="dtmOverAlertCnt alert-overRed" onclick="fnOpenReq('', '04', '실패');" title="요구사항 중 완료시한을 초과하여 완료된 요구사항 수 입니다.">0</div>
						<div class="dtmOverAlertCnt alert-blue" onclick="fnOpenReq('', '05', '적기');" title="요구사항 중 완료시한 이내 정상완료된 요구사항 수 입니다.">0</div>
					</div>
					<div class="dsh2000_prjDateRangeInfo"></div>
				</div>
				<div class="dshChartDiv foldDiv" folding="0">
					<div class="dsh_top_sub_box dsh_top_left_box">
						<canvas id="reqTotalCntChart" width="350" height="278"></canvas>
					</div>
					<div class="dsh_top_sub_box dsh_top_middle_box">
						<canvas id="reqMonthCntChart" width="625" height="278"></canvas>
					</div>
					<div class="dsh_top_sub_box dsh_top_right_box">
						<canvas id="reqQuarterCntChart" width="400" height="278"></canvas>
					</div>
				</div>
			</div>
			<div class="dsh_middle_box">
				<div class="dsh_title_box">
					<div class="titleFoldingBtn"><span class="titleFoldingContent up" folding="reqDtmOver"></span></div>
					<div class="titleRedoBtn" redoid="reqDtmOver" onclick="fnSubDataLoad('obj',this);"><li class="fa fa-redo"></li></div>
					계획대비 미처리건수
					<div class="dsh2000_prjInfo">[ 미처리: <span id="reqDtmOverDo">0</span>건 / 총: <span id="reqDtmOverDone">0</span>건 / 완료율: <span id="reqDtmOverPer">0</span>% ]</div>
				</div>
				<div class="foldDiv" folding="reqDtmOver" guide="dsh2000DshNotCmplReq">
					<div class="reqDtmOver_leftDiv">
						<canvas id="reqDtmOverChart" width="500" height="250"></canvas>
					</div>
					<div class="reqDtmOver_RightDiv">
						<div data-ax5grid="reqDtmOverGrid" data-ax5grid-config="{}" style="height: 250px;"></div>
					</div>
				</div>
			</div>
			<div class="dsh_middle_box" guide="dsh2000docTimeOver">
				<div class="dsh_title_box">
					<div class="titleFoldingBtn"><span class="titleFoldingContent up" folding="docDtmOver"></span></div>
					<div class="titleRedoBtn" redoid="docDtmOver" onclick="fnSubDataLoad('obj',this);"><li class="fa fa-redo"></li></div>
					산출물 제출 예정일 대비 미제출 건수
					<div class="dsh2000_prjInfo">[ 미등록: <span id="docDtmOverNull">0</span>건/  미처리: <span id="docDtmOverDo">0</span>건 / 총: <span id="docDtmOverDone">0</span>건 ]</div>
				</div>
				<div class="foldDiv" folding="docDtmOver">
					<div data-ax5grid="docDtmOverGrid" data-ax5grid-config="{}" style="height: 250px;"></div>
				</div>
			</div>
			<div class="dsh_middle_box" guide="dsh2000Request">
				<div class="dsh_title_box">
					<div class="titleFoldingBtn"><span class="titleFoldingContent up" folding="1"></span></div>
					<div class="titleRedoBtn" redoid="request" onclick="fnSubDataLoad('obj',this);"><li class="fa fa-redo"></li></div>
					접수 대기 [총 <span id="requestTotalCnt">0</span>건]
				</div>
				<div class="foldDiv" folding="1">
					<div data-ax5grid="dshGrid-request" data-ax5grid-config="{}" style="height: 250px;"></div>
				</div>
			</div>
			<div class="process_list_box" id="process_list_box" guide="dsh2000ProcessList">
				<!-- 프로세스 목록 세팅 영역 -->
			</div>
			<div class="dsh_middle_box dsh_middle_half fl">
				<div class="dsh_title_box">
					<div class="titleFoldingBtn"><span class="titleFoldingContent up" folding="sign"></span></div>
					<div class="titleRedoBtn" redoid="sign" onclick="fnSubDataLoad('obj',this);"><li class="fa fa-redo"></li></div>
					담당 결재 목록
				</div>
				<div class="foldDiv" folding="sign" guide="dsh2000SignList">
					<div data-ax5grid="dshGrid-sign" data-ax5grid-config="{}" style="height: 250px;"></div>
				</div>
			</div>
			<div class="dsh_middle_box dsh_middle_half fr">
				<div class="dsh_title_box">
					<div class="titleFoldingBtn"><span class="titleFoldingContent up" folding="sign"></span></div>
					<div class="titleRedoBtn" redoid="dplSign" onclick="fnSubDataLoad('obj',this);"><li class="fa fa-redo"></li></div>
					담당 배포계획 결재 목록
				</div>
				<div class="foldDiv" folding="sign">
					<div data-ax5grid="dshGrid-dplSign" data-ax5grid-config="{}" style="height: 250px;"></div>
				</div>
			</div>
			<div class="dsh_middle_box">
				<div class="dsh_title_box">
					<div class="titleFoldingBtn"><span class="titleFoldingContent up" folding="work"></span></div>
					<div class="titleRedoBtn" redoid="work" onclick="fnSubDataLoad('obj',this);"><li class="fa fa-redo"></li></div>
					<div class="titleWorkBtn" onclick="fnDshboardWorkComplete()"><li class="fa fa-user-check"></li>&nbsp;작업 종료</div>
					담당 작업 목록
				</div>
				<div class="foldDiv" folding="work">
					<div data-ax5grid="dshGrid-work" data-ax5grid-config="{}" style="height: 250px;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />