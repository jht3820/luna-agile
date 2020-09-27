<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/oslops/top/header.jsp" %>
<jsp:include page="/WEB-INF/jsp/oslops/top/aside.jsp" />

<link rel='stylesheet' href='<c:url value='/css/oslops/req.css'/>' type='text/css'>
<style type="text/css">
	.accptFont{color:#4b73eb !important;text-shadow: none !important;}
	.rejectFont{color:#eb4b6a !important;text-shadow: none !important;}
	.defaultFont{color:#000 !important;}
</style>
<script>
var mySearch;


$(function(){
	//그리드 검색 호출
	fnAxGrid5View();
	fnSearchBoxControl();
});


//검색조건 변경되었을때 이벤트
function fnSelectChg(){
	var selVal = $("#searchSelect option:selected").val();
	if(selVal == '0'){
		$("#searchTxt").val("");
		$("#searchTxt").attr("readonly", true);
	}else{
		$("#searchTxt").attr("readonly", false);
	}
}

//axisj5 그리드
function fnAxGrid5View(){
	firstGrid = new ax5.ui.grid();
 
        firstGrid.setConfig({
            target: $('[data-ax5grid="first-grid"]'),
            showRowSelector: true,
            sortable:false,
            header: {align:"center"},
            columns: [				
				{key: "noticeNm", label: "공지", width: '3%', align: "center"},
				{key: "badNum", label: "No.", width: '4%', align: "center"},
				{key: "badTitle", label: "글제목", width: '23%', align: "left"},
				{key: "badContent", label: "글내용", width: '33%', align: "left"},
				{key: "usrNm", label: "작성자명", width: '7%', align: "center"},
				{key: "usrPositionCdNm", label: "직급", width: '7%', align: "center"},
				{key: "badCnt", label: "조회", width: '4%', align: "center"},
				{key: "regDtm", label: "작성일", width: '10%', align: "center"},
				{key: "modifyDtm", label: "수정일", width: '10%', align: "center"},
            ],
            body: {
                align: "center",
                columnHeight: 30,
                onDBLClick:function(){
                	var data = {"badId": firstGrid.list[this.doindex].badId};
					gfnLayerPopupOpen('/bad/bad1000/bad1000/selectbad1002View.do',data,"680","650",'scroll');
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
                   fnInGridListSet(this.page.selectPage,mySearch.getParam(), true);
                }
            }
        });
        //그리드 데이터 불러오기
 		//fnInGridListSet(0, null, true);

}
//그리드 데이터 넣는 함수
function fnInGridListSet(_pageNo,ajaxParam,isLoading){
     	/* 그리드 데이터 가져오기 */
     	//파라미터 세팅
     	if(gfnIsNull(ajaxParam)){
   			ajaxParam = $('form#searchFrm').serialize();
   		}
     	
     	var loadingShow = true;
     	// 로딩바 표시 여부있을경우
     	if(!gfnIsNull(isLoading)){
     		loadingShow = isLoading;
     	}
     	
     	//페이지 세팅
     	if(!gfnIsNull(_pageNo)){
     		ajaxParam += "&pageNo="+_pageNo;
     	}else if(typeof firstGrid.page.currentPage != "undefined"){
     		ajaxParam += "&pageNo="+firstGrid.page.currentPage;
     	}
     	
     	//AJAX 설정
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/bad/bad1000/bad1000/selectbad1000BoardListAjaxView.do'/>","loadingShow":loadingShow}
				,ajaxParam);
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
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

// 공지사항 삭제
function fnDeleteBad1000Info(chkList){
	var params = "";
	var delCount = 0;
	
	$(chkList).each(function(idx, val) {
		if(delCount==0){
			params ="badId="+val.badId;
		} else {
			params +="&badId="+val.badId;
		}
		
		delCount++;
	})
	
	// 체크된 건수 없을경우
	if(delCount == 0){
		jAlert("선택된 공지사항이 없습니다.","알림");
		return false;
	}
	
	jConfirm("선택한 공지사항을 삭제 하시겠습니까?", "알림창", function( result ) {
		if( result ){
			//AJAX 설정
			var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/bad/bad1000/bad1000/deleteBad1000InfoAjax.do'/>", "loadingShow":true}
			,params);
			//AJAX 전송 성공 함수
			ajaxObj.setFnSuccess(function(data){
				data = JSON.parse(data);
				// 정상적으로 공지사항 삭제 시
	        	if( data.errorYn == "N" ){
					// 현재 페이지 정보, 검색정보로 그리드 재조회
					fnInGridListSet(firstGrid.page.currentPage,$('form#searchFrm').serialize()+"&"+mySearch.getParam(), true);
	        		jAlert(data.message, "알림");
	        	}else{
	        		// 삭제 실패시 알림 메시지
	        		toast.push(data.message);
	        	}
			});
			
			//AJAX 전송 오류 함수
			ajaxObj.setFnError(function(xhr, status, err){
				data = JSON.parse(data);
	        	toast.push(data.message);
			});
			//AJAX 전송
			ajaxObj.send();
		}
	});
} 

//검색 상자
function fnSearchBoxControl(){
	var pageID = "AXSearch";
	mySearch = new AXSearch();
	
	// 현재일과 현재일 기준 한달전 날짜 기본세팅
	var defaultStDt = new Date(new Date().setMonth(new Date().getMonth()-1)).format('yyyy-MM-dd');
	var defaultEndDt = new Date().format('yyyy-MM-dd');
	
	var fnObjSearch = {
		pageStart: function(){
			//검색도구 설정 01 ---------------------------------------------------------
			mySearch.setConfig({
				targetID:"AXSearchTarget",
				theme : "AXSearch",
				rows:[
					{display:true, addClass:"", style:"", list:[
						{label:"", labelWidth:"", type:"button", width:"60",style:"float:right;", key:"btn_print_bad",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-print' aria-hidden='true'></i>&nbsp;<span>프린트</span>",
							onclick:function(){
								$(firstGrid.exportExcel()).printThis({importCSS: false,importStyle: false,loadCSS: "/css/common/printThis.css"});
						}},
						
						{label:"", labelWidth:"", type:"button", width:"55",style:"float:right;", key:"btn_excel_bad",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-file-excel' aria-hidden='true'></i>&nbsp;<span>엑셀</span>",
							onclick:function(){
								firstGrid.exportExcel("${sessionScope.selMenuNm}.xls");
						}},
						{label : "",labelWidth : "",type : "button",width : "55",key : "btn_delete_req",style : "float:right;",valueBoxStyle : "padding:5px;",value : "<i class='fa fa-trash-alt' aria-hidden='true'></i>&nbsp;<span>삭제</span>",
							onclick : function() {
								var chkList = firstGrid.getList('selected');
								
								if(gfnIsNull(chkList)){
									toast.push('삭제 할 공지사항에 체크해주세요.');
									return;
								}
								// 공지사항 삭제
								fnDeleteBad1000Info(chkList);
							}
						},
						{label:"", labelWidth:"", type:"button", width:"60",style:"float:right;", key:"btn_update_bad",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-edit' aria-hidden='true'></i>&nbsp;<span>수정</span>",
							onclick:function(){
								var item = (!gfnIsNull(Object.keys(firstGrid.focusedColumn)))? firstGrid.list[firstGrid.focusedColumn[Object.keys(firstGrid.focusedColumn)].doindex]:null;
								if(gfnIsNull(item)){
									toast.push('수정 할 공지사항을 선택하세요.');
									return;
								}
								
								var data = {"popupGb": "update", "badId": item.badId};
        	                	
								gfnLayerPopupOpen('/bad/bad1000/bad1000/selectbad1001View.do',data,"680","580",'scroll');
						}},
						
						{label:"", labelWidth:"", type:"button", width:"60",style:"float:right;", key:"btn_insert_bad",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-save' aria-hidden='true'></i>&nbsp;<span>등록</span>",
							onclick:function(){
								var data = {
									"popupGb": "insert"
								};
								gfnLayerPopupOpen('/bad/bad1000/bad1000/selectbad1001View.do',data,"680","580",'scroll');
						}},
						{label:"", labelWidth:"", type:"button", width:"55", key:"btn_search_bad",style:"float:right;" , valueBoxStyle:"padding:5px;", value:"<i class='fa fa-list' id='btn_search_bad' aria-hidden='true'></i>&nbsp;<span>조회</span>",
							onclick:function(){
								/* 검색 조건 설정 후 reload */
	 							var pars = mySearch.getParam();
							    var ajaxParam = $('form#searchFrm').serialize();

							    if(!gfnIsNull(pars)){
							    	ajaxParam += "&"+pars;
							    }
								
					            fnInGridListSet(0,ajaxParam, true);
					            
					            //폼 데이터 변경
								$('#searchSelect').val(axdom("#" + mySearch.getItemId("searchSelect")).val());
								$('#searchCd').val(axdom("#" + mySearch.getItemId("searchCd")).val());
								$('#searchTxt').val(axdom("#" + mySearch.getItemId("searchTxt")).val());
					            
						}}
					]},
					{display:true, addClass:"", style:"", list:[
						{label:"<i class='fa fa-search'></i>&nbsp;", labelWidth:"50", type:"selectBox", width:"", key:"searchSelect", addClass:"", valueBoxStyle:"", value:"all",
							options:[
                                {optionValue:"0", optionText:"전체 보기",optionAll:true},
                                {optionValue:'badNum', optionText:'글번호'},
                                {optionValue:'badTitle', optionText:'제목'},
                                {optionValue:'usrId', optionText:'작성자ID'},
                                {optionValue:'usrNm', optionText:'작성자명'},
                                {optionValue:"usrPositionCd", optionText:"직급", optionCommonCode:"ADM00007"}
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
    						},

						},
						{label:"", labelWidth:"", type:"inputText", width:"120", key:"searchTxt", addClass:"secondItem sendBtn", valueBoxStyle:"padding-left:0px;", value:"",
							onkeyup:function(e){
								if(e.keyCode == '13' ){
									axdom("#" + mySearch.getItemId("btn_search_bad")).click();
								}
							} 
						},
						{label:"", labelWidth:"", type:"selectBox", width:"100", key:"searchCd", addClass:"selectBox", valueBoxStyle:"padding-left:0px;", value:"01",
							options:[]
						},
						
						{label : "시작일",labelWidth : "70",type : "inputText",width : "150",key : "srchFromDt",addClass : "secondItem sendBtn",valueBoxStyle : "",value : defaultStDt,
						},
						{label : "종료일",labelWidth : "70",type : "inputText",width : "150",key : "srchToDt",addClass : "secondItem sendBtn",valueBoxStyle : "",value : defaultEndDt,
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
		                            	fnInGridListSet(0,$('form#searchFrm').serialize()+"&"+mySearch.getParam(). true);
		    						}
						},
						{label:"<i class='fas fa-arrows-alt-v'></i>&nbsp;목록 높이&nbsp;", labelWidth:"60", type:"selectBox", width:"", key:"gridHeight", addClass:"", valueBoxStyle:"", value:"600",
							options:[
							         	{optionValue:300, optionText:"300px"},
		                                {optionValue:600, optionText:"600px"},
		                                {optionValue:1000, optionText:"1000px"},
		                                {optionValue:1200, optionText:"1200px"},
		                                {optionValue:2000, optionText:"2000px"},
		                                
		                            ],onChange: function(selectedObject, value){
		                            	firstGrid.setHeight(value);
		    						}
						}
					]}
				]
			});
		}
		/*,
		search1: function(){
			var pars = mySearch.getParam();
			fnAxGridView(pars);
		}
		*/
	};
	
	jQuery(document.body).ready(function(){
		
		fnObjSearch.pageStart();
		//검색 상자 로드 후 텍스트 입력 폼 readonly 처리
		axdom("#" + mySearch.getItemId("searchTxt")).attr("readonly", "readonly");
		
		//공통코드 selectBox hide 처리
		axdom("#" + mySearch.getItemId("searchCd")).hide();

		//버튼 권한 확인
		fnBtnAuthCheck(mySearch);

		//기간 검색 달기
		gfnCalRangeSet(mySearch.getItemId("srchFromDt"), mySearch.getItemId("srchToDt"));
		
		var pars = mySearch.getParam();
		fnInGridListSet(0,pars, true);
	});
}
</script>


<div class="main_contents" style="height: auto;" >
	<form:form commandName="bad1000VO" id="searchFrm" name="searchFrm" method="post" onsubmit="return false;">
	</form:form>
	<div class="req_title">${sessionScope.selMenuNm }</div>
	<div class="tab_contents menu">
		<input type="hidden" name="strInSql" id="strInSql" />
		<div id="AXSearchTarget" style="border-top:1px solid #ccc;"></div>
		<br />
		<div data-ax5grid="first-grid" data-ax5grid-config="{}" style="height: 600px;"></div>	
	</div>
	
</div>
		
		
		
<jsp:include page="/WEB-INF/jsp/oslops/bottom/footer.jsp" />