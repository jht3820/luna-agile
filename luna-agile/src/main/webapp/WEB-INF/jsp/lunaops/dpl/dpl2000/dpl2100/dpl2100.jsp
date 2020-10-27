<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/lunaops/top/header.jsp" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<link rel='stylesheet' href='<c:url value='/css/oslops/dpl.css'/>' type='text/css'>

<style type="text/css">
	.accptFont{color:#4b73eb !important;text-shadow: none !important;}
	.rejectFont{color:#eb4b6a !important;text-shadow: none !important;}
	.defaultFont{color:#000 !important;}
</style>

<script>
var mySearch;
var loginUsrId = '${sessionScope.loginVO.usrId}';

$(document).ready(function(){
	// 팝업 나타내기
	$("#btn_reject").click(function(){
		fnRequestEvent("reject");
	});
	// 팝업 숨기기
	$("#btn_cancel_chk1100").click(function(){
		$("#chkCmntPop").val("");
		$('.approval_box').hide();
	});
	
	//타겟이 상세정보 창이 아닌 경우 상세 정보 창 닫기
	$(document).click(function(event){

	});	
	
	// 배포 계획 결제 승인관리 가이드 상자 호출
	gfnGuideStack("add",fnDpl2100GuideShow);
	
	//그리드 및 검색 상자 호출
	fnAxGrid5View();
	fnSearchBoxControl();
});

//요구사항 승인&반려 처리
function fnRequestEvent(type){
	var item = firstGrid.list[firstGrid.selectedDataIndexs[0]];
	
	//선택 데이터 없는경우
	if(gfnIsNull(item)){
		jAlert("결재 대기 배포계획을 선택해주세요.","알림창");
		return false;
	}
	
	var dplStatusCd = item.signStsCd;
	if(dplStatusCd != "01"){
		jAlert("승인상태가 대기 상태인 배포계획만 승인/반려가 가능합니다.","알림창");
		return false;
	}
	
	if(item.signUsrId != loginUsrId){
		jAlert("결재자가 본인일 경우에만 결재 승인/반려가 가능합니다.","알림창");
		return false;
	}

	//결재 승인
	if(type == "accept"){
		var rtnData = {	
						view: 'dpl2100',
						type: 'accept',
						dplId: item.dplId,
						signId: item.signId
					};
		//팝업 화면 오픈
		gfnLayerPopupOpen("/dpl/dpl2000/dpl2100/selectDpl2101View.do", rtnData, '550', '290','scroll');
	}
	//반려
	else if(type == "reject"){
		var rtnData = {	
						view: 'dpl2100',
						type: 'reject',
						dplId: item.dplId,
						signId: item.signId
					};
		//팝업 화면 오픈
		gfnLayerPopupOpen("/dpl/dpl2000/dpl2100/selectDpl2102View.do", rtnData, '500', '290','scroll');
	}

}


//결재 승인&반려 데이터 세팅후 Ajax 전송
function fnDplSignComplete(rtnData){
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/dpl/dpl2000/dpl2100/insertDpl2100SignActionAjax.do'/>"},
			rtnData);
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		//에러 없는경우
		if(data.errorYn != "Y"){
			jAlert(data.message,"알림");
			
			//그리드 새로고침
			fnInGridListSet(firstGrid.page.currentPage,mySearch.getParam());
		}
		else{
			toast.push(data.message);
		}
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림");
 	});
	//AJAX 전송
	ajaxObj.send();
	
}


//axisj5 그리드
function fnAxGrid5View(){
	firstGrid = new ax5.ui.grid();
 
        firstGrid.setConfig({
            target: $('[data-ax5grid="first-grid"]'),
            sortable:false,
            header: {align:"center"},
          
            columns: [
                		{key: "signStsNm", label: "결재 상태", width: 150, align: "center"},
	              		{key: "signRegUsrNm", label: "요청자", width: 150, align: "center"},
	              		{key: "signUsrNm", label: "결재자", width: 150, align: "center"},
	              		{key: "signDtm", label: "결재 요청 일자", width: 150, align: "center",formatter:function(){
	              			return new Date(this.item.signDtm).format("yyyy-MM-dd");
	              		}},
	              		{key: "dplNm", label: "배포계획명", width: 220, align: "center"},
	              		{key: "signTxt", label: "결재 의견", width: 320, align: "left"},
	              		{key: "signRejectTxt", label: "반려내용", width: 314, align: "left"},
                		],
            body: {
                align: "center",
                columnHeight: 30,
                onClick: function () {
                	//이전 선택 row 해제
                    this.self.select(firstGrid.selectedDataIndexs[0]);
                	
                	//현재 선택 row 전체 선택
                    this.self.select(this.doindex);
                	
                },onDBLClick:function(){
                	// 더블클릭 시 상세보기
                	var item = this.item;
                	var data = {"dplId" : item.dplId, "prjId" : item.prjId};
					gfnLayerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1003View.do',data, "415", "690",'scroll');
                }
            },
            /* 
            contextMenu: {
                iconWidth: 20,
                acceleratorWidth: 100,
                itemClickAndClose: false,
                icons: {
                    'arrow': '<i class="fa fa-caret-right"></i>'
                },
                items: [
                    {type: "reply", label: "쪽지 전송", icon:"<i class='fa fa-mail-reply' aria-hidden='true'></i>"},
                   	{divide: true},
                    {type: "rowFrozen", label: "열 고정", icon:"<i class='fa fa-lock' aria-hidden='true'></i>"}
                ],
                popupFilter: function (item, param) {
                	var selItem = firstGrid.list[param.doindex];
                	//선택 개체 없는 경우 중지
                	if(typeof selItem == "undefined"){
                		return false;
                	}

                	return true;
                },
                onClick: function (item, param) {
                	var selItem = firstGrid.list[param.doindex];
                    if(item.type == "rowFrozen"){
                    	//이미 해당 열에 고정인경우 중지
                    	if(firstGrid.config.frozenColumnIndex != (param.colIndex+1)){
                    		firstGrid.setConfig({frozenColumnIndex:param.colIndex+1});
                    		fnInGridListSet(firstGrid.page.currentPage);
                    	}
                    //쪽지 전송
                    }else if(item.type == "reply"){
                    	gfnAlarmOpen(param.item.reqChargerId,param.item.reqId,param.item.reqNm);
                    }
                    firstGrid.contextMenu.close();
                }
            },
             */
            page: {
                navigationItemCount: 9,
                height: 30,
                display: true,
                firstIcon: '<i class="fa fa-step-backward" aria-hidden="true"></i>',
                prevIcon: '<i class="fa fa-caret-left" aria-hidden="true"></i>',
                nextIcon: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                lastIcon: '<i class="fa fa-step-forward" aria-hidden="true"></i>',
                onChange: function () {
                   fnInGridListSet(this.page.selectPage,mySearch.getParam());
                }
            } 
        });
        //그리드 데이터 불러오기
 		fnInGridListSet();

}
//그리드 데이터 넣는 함수
function fnInGridListSet(_pageNo,ajaxParam){
     	/* 그리드 데이터 가져오기 */
     	//파라미터 세팅
     	if(gfnIsNull(ajaxParam)){
   			ajaxParam = $('form#searchFrm').serialize();
   		}
     	
     	//페이지 세팅
     	if(!gfnIsNull(_pageNo)){
     		ajaxParam += "&pageNo="+_pageNo;
     	}else if(typeof firstGrid.page.currentPage != "undefined"){
     		ajaxParam += "&pageNo="+firstGrid.page.currentPage;
     	}
     	
     	//AJAX 설정
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/dpl/dpl2000/dpl2100/selectDpl2100AjaxView.do'/>","loadingShow":true}
				,ajaxParam);
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
			
			// 조회 실패
	    	if(data.errorYn == 'Y'){ 
	    		toast.push(data.message);
	    		return;
	    	}
			
			var list = data.list;
			var page = data.page;
			
		   	firstGrid.setData({
		             	list:list,
		             	page: {
		                  currentPage: _pageNo || 0,
		                  pageSize: page.pageSize,
		                  totalElements: page.totalElements,
		                  totalPages: page.totalPages
		              }
		             });
		});
		
		//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err){
			//세션이 만료된 경우 로그인 페이지로 이동
           	if(status == "999"){
           		alert('세션이 만료되어 로그인 페이지로 이동합니다.');
        		document.location.href="<c:url value='/cmm/cmm4000/cmm4000/selectCmm4000View.do'/>";
        		return;
           	}
		});
		
		//AJAX 전송
		ajaxObj.send();
}

//검색 상자
function fnSearchBoxControl(){
	var pageID = "AXSearch";
	mySearch = new AXSearch();

	var fnObjSearch = {
		pageStart: function(){
			//검색도구 설정 01 ---------------------------------------------------------
			mySearch.setConfig({
				targetID:"AXSearchTarget",
				theme : "AXSearch",
				rows:[
					{display:true, addClass:"top_searchGroup", style:"", list:[
       					{label:"", labelWidth:"", type:"button", width:"55",style:"float:right;", key:"btn_update",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-trash-alt' aria-hidden='true'></i>&nbsp;<span>반려</span>",
							onclick:function(){
								fnRequestEvent("reject");
						}},
						{label:"", labelWidth:"", type:"button", width:"55",style:"float:right;", key:"btn_update",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-check' aria-hidden='true'></i>&nbsp;<span>승인</span>",
							onclick:function(){
								fnRequestEvent("accept");
						}}
					]                                            
					},
					{display:true, addClass:"bottom_searchGroup", style:"", list:[
						{label:"<i class='fa fa-search'></i>&nbsp;", labelWidth:"30", type:"selectBox", width:"", key:"searchSelect", addClass:"", valueBoxStyle:"", value:"all",
							options:[
								{optionValue:"0", optionText:"전체 보기",optionAll:true},
                                {optionValue:"signStsCd", optionText:"결재 상태", optionCommonCode:"REQ00004"},
                                {optionValue:'signUsrNm', optionText:'결재자'},
                                {optionValue:'signTxt', optionText:'결재 의견'},
                                {optionValue:'signRejectTxt', optionText:'반려 내용'},
                                {optionValue:"dplStsCd", optionText:"배포 상태", optionCommonCode:"DPL00001"},
                                {optionValue:"dplTypeCd", optionText:"배포 방법", optionCommonCode:"DPL00003"},
                                {optionValue:'dplNm', optionText:'배포계획명'},
                                {optionValue:"dplVer", optionText:"배포 버전"},
                                {optionValue:'dplUsrNm', optionText:'배포자'},
                                {optionValue:'dplDesc', optionText:'배포 설명'},
                            ],onChange: function(selectedObject, value){
								//선택 값이 전체목록인지 확인 후 입력 상자를 readonly처리
    							if(!gfnIsNull(selectedObject.optionAll) && selectedObject.optionAll == true){
									axdom("#" + mySearch.getItemId("searchTxt")).attr("readonly", "readonly");	
									axdom("#" + mySearch.getItemId("searchTxt")).val('');	
								}else{
									axdom("#" + mySearch.getItemId("searchTxt")).removeAttr("readonly");
								}
    							//공통코드 처리 후 select box 세팅이 필요한 경우 사용
								if(!gfnIsNull(selectedObject.optionCommonCode)){
									gfnCommonSetting(mySearch,selectedObject.optionCommonCode,"searchCd","searchTxt");
								}else{
									//공통코드 처리(추가 selectbox 작업이 아닌 경우 type=text를 나타낸다.)
									axdom("#" + mySearch.getItemId("searchTxt")).show();
									axdom("#" + mySearch.getItemId("searchCd")).hide();
								}
							}
						},
						{label:"", labelWidth:"", type:"inputText", width:"150", key:"searchTxt", addClass:"secondItem sendBtn", valueBoxStyle:"padding-left:0px;", value:"",
							onkeyup:function(e){
								if(e.keyCode == '13' ){
									axdom("#" + mySearch.getItemId("btn_search_sign")).click();
								}
							}
						},
						{label:"", labelWidth:"", type:"selectBox", width:"100", key:"searchCd", addClass:"selectBox", valueBoxStyle:"padding-left:0px;", value:"01",
							options:[]
						},
						{label:"<i class='fas fa-list-ol'></i>&nbsp;목록 수&nbsp;", labelWidth:"60", type:"selectBox", width:"", key:"pageSize", addClass:"", valueBoxStyle:"", value:"30",
							options:[
		                               {optionValue:15, optionText:"15"},
		                               {optionValue:30, optionText:"30"},
		                               {optionValue:50, optionText:"50"},
		                               {optionValue:100, optionText:"100"},
		                               {optionValue:300, optionText:"300"},
		                               {optionValue:600, optionText:"600"},
		                               {optionValue:1000, optionText:"1000"},
		                               {optionValue:5000, optionText:"5000"},
		                               {optionValue:10000, optionText:"10000"},
		                                
		                            ],onChange: function(selectedObject, value){
		                            	fnInGridListSet(0,mySearch.getParam());
		    						}
						},
						{label:"<i class='fas fa-arrows-v'></i>&nbsp;목록 높이&nbsp;", labelWidth:"60", type:"selectBox", width:"", key:"gridHeight", addClass:"", valueBoxStyle:"", value:"600",
							options:[
							         	{optionValue:300, optionText:"300px"},
		                                {optionValue:600, optionText:"600px"},
		                                {optionValue:1000, optionText:"1000px"},
		                                {optionValue:1200, optionText:"1200px"},
		                                {optionValue:2000, optionText:"2000px"},
		                                
		                            ],onChange: function(selectedObject, value){
		                            	firstGrid.setHeight(value);
		    						}
						},
						
						{label:"", labelWidth:"", type:"button", width:"70",style:"float:right;", key:"btn_print_newReqDemand",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-print' aria-hidden='true'></i>&nbsp;<span>프린트</span>",
							onclick:function(){
								$(firstGrid.exportExcel()).printThis({importCSS: false,importStyle: false,loadCSS: "/css/common/printThis.css"});
						}},
						{label:"", labelWidth:"", type:"button", width:"60",style:"float:right;", key:"btn_excel_newReqDemand",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-file-excel' aria-hidden='true'></i>&nbsp;<span>엑셀</span>",
							onclick:function(){
								firstGrid.exportExcel("${sessionScope.selMenuNm}.xls");
						}},
						
						{label:"", labelWidth:"", type:"button", width:"55",style:"float:right;", key:"btn_search_sign",valueBoxStyle:"padding-left:0px;padding-right:5px;", value:"<i class='fa fa-list' aria-hidden='true'></i>&nbsp;<span>조회</span>",
						onclick:function(){
							/* 검색 조건 설정 후 reload */
				            fnInGridListSet(0,mySearch.getParam());
						}}
					]}
				]
			});
		},
		search1: function(){
			var pars = mySearch.getParam();
			fnAxGridView(pars);
		}	
	};
	
	jQuery(document.body).ready(function(){
		fnObjSearch.pageStart();
		//검색 상자 로드 후 텍스트 입력 폼 readonly 처리
		axdom("#" + mySearch.getItemId("searchTxt")).attr("readonly", "readonly");
		
		//공통코드 selectBox hide 처리
		axdom("#" + mySearch.getItemId("searchCd")).hide();
		
		//버튼 권한 확인
		fnBtnAuthCheck(mySearch);
		
		// 상단 승인, 반려 버튼이 권한이 없어서 hide일 경우
		// 해당 버튼이 있는 div도 hide 처리해야함 
		// $(".top_searchGroup") div의 하위에 있는 버튼 목록을 가져온다.
		var childList = $(".top_searchGroup").children('.searchItem');

		var childCnt = 0;
		
		// 가져온 버튼의 hide 여부 체크
		$.each(childList,function(idx, child){
			if($(this).is(':visible') == false ){
				childCnt ++;
			}
		});
		
		// 버튼의 개수와 hide된 버튼의 수가 같다면 
		// $(".top_searchGroup") div를 hide 처리한다.
		if(childList.length == childCnt){
			$(".top_searchGroup").hide();
		}
		
	});
}


//배포 계획 결제 승인관리 가이드 상자
function fnDpl2100GuideShow(){
	var mainObj = $(".main_contents");
	
	// mainObj가 없는경우 false return
	if(mainObj.length == 0){
		return false;
	}
	// guide box setting
	var guideBoxInfo = globals_guideContents["dpl2100"];
	gfnGuideBoxDraw(true,mainObj,guideBoxInfo);
}

</script>

<div class="main_contents" style="height: auto;">
	<form:form commandName="dpl2100VO" id="searchFrm" name="searchFrm" method="post" onsubmit="return false;"></form:form>
	<div class="dpl_title">${sessionScope.selMenuNm }</div>
	<div class="tab_contents menu">
		<input type="hidden" name="strInSql" id="strInSql" />
		<div id="AXSearchTarget" style="border-top:1px solid #ccc;" guide="ddplSignApprovalGridBtn"></div>
		<br/>
		<div data-ax5grid="first-grid" data-ax5grid-config="{}" style="height: 600px;" guide="dplSignApprovalGrid"></div>	
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />