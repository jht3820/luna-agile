<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/lunaops/top/header.jsp" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />

<link rel='stylesheet' href='<c:url value='/css/oslops/req.css'/>' type='text/css'>
<link rel='stylesheet' href='<c:url value='/css/ztree/zTreeStyle/zTreeStyle.css'/>' type='text/css'>
<script type="text/javascript" src="/js/ztree/jquery.ztree.all.min.js"></script>

<style type="text/css">
	.accptFont{color:#4b73eb !important;text-shadow: none !important;}
	.rejectFont{color:#eb4b6a !important;text-shadow: none !important;}
	.defaultFont{color:#000 !important;}
</style>
<script>


var mySearch;
var zTree;
var currentNode={};
var selJenId;

$(function(){
	//그리드 검색 호출
	fnAxGrid5View();
	fnSearchBoxControl();
	fnSearchProjectList();
	
	
	$(".menu_expand_all").click(function(){
		zTree.expandAll(true);
	});
	
	// 메뉴 관리 전체 닫기
	$(".menu_collapse_all").click(function(){
		zTree.expandAll(false);
	});
	
	//가이드 상자 호출
	gfnGuideStack("add",fnStm3100GuideShow);
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
				{key: "jenNm", label: "JENKINS 명", width: 130, align: "center"},
				{key: "jenUrl", label: "JENKINS URL", width: 249, align: "left"},
				{key: "jobTypeNm", label: "JOB 타입", width: 90, align: "center"},
				{key: "jobId", label: "JOB ID", width: 200, align: "center"},
				{key: "jobDesc", label: "JOB 설명", width: 250, align: "center"}
            ],
            body: {
                align: "center",
                columnHeight: 30,
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
                	// 트리에서 선택된 프로젝트를 가져온다.
                	var selNode = zTree.getSelectedNodes()[0];
				
                	// 트리에서 선택된 항목이 프로젝트일 경우 프로젝트에 배정된 jenkins job 목록 조회
                	if(selNode.level == 1){
                		// 그리드 데이터 조회
                       	fnInGridListSet(selNode.prjId, this.page.selectPage, mySearch.getParam());
                	}
                }
            }
        });

}

// 그리드 데이터 조회
function fnInGridListSet(prjId, _pageNo, ajaxParam){
     	
     	// 데이터 조회시 선택된 프로젝트가 없을경우 (= 프로젝트 ID 없을경우)
     	if(gfnIsNull(prjId)){
     		jAlert("프로젝트를 선택해주세요.","알림");
			return false;
     	}
     	
     	//파라미터 세팅
		if(gfnIsNull(ajaxParam)){
			ajaxParam = $('form#searchFrm').serialize();
		}
     	
     	// 프로젝트 ID 세팅
     	ajaxParam += "&prjId="+prjId;
     	
		//페이지 세팅
     	if(!gfnIsNull(_pageNo)){
     		ajaxParam += "&pageNo="+_pageNo;
     	}else if(typeof firstGrid.page.currentPage != "undefined"){
     		ajaxParam += "&pageNo="+firstGrid.page.currentPage;
     	}
     	
     	//AJAX 설정
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/stm/stm3000/stm3100/selectStm3100JenkinsProjectListAjax.do'/>","loadingShow":true}
				, ajaxParam);
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
			
			// 데이터 조회 실패했을 경우
			if(data.errorYn == 'Y'){ 
				// 에러 메시지 출력
	    		toast.push(data.message);
	    		return;
	    	}
			// 프로젝트에 배정된 jenkins job 정보	
			var list = data.list;
			// 페이지 정보
			var page = data.page;

			// 그리드에 데이터 및 페이지 정보 세팅
		   	firstGrid.setData({
					list : list,
					page : {
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
					{display:true, addClass:"", style:"", list:[
						
					    {label:"<i class='fa fa-search'></i>&nbsp;", labelWidth:"50", type:"selectBox", width:"", key:"searchSelect", addClass:"", valueBoxStyle:"", value:"all",
							options:[
                                {optionValue:"0", 				optionText:"전체 보기",optionAll:true},
                                {optionValue:'project', 		optionText:'프로젝트'},
                                {optionValue:'jenNm', 			optionText:'JENKINS 명'},
                                {optionValue:"jobTypeCd", 		optionText:"JOB 타입", optionCommonCode:"DPL00002"},
                                {optionValue:'jobId', 			optionText:'JOB ID'},
                                {optionValue:'jobDesc', 		optionText:'JOB 설명'} 
                                
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
								// 프로젝트 선택 시 처리
                            	}else if(selectedObject.optionValue == "project"){
									
									// 프로젝트 선택 시 프로젝트 목록을 보여준다.
									gfnLicGrpAllProjectSetting(mySearch, "searchCd","searchTxt");
									
									axdom("#" + mySearch.getItemId("searchTxt")).val('');
									axdom("#" + mySearch.getItemId("searchTxt")).hide();
									axdom("#" + mySearch.getItemId("searchCd")).show();
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
									axdom("#" + mySearch.getItemId("btn_search_prjJob")).click();
								}
							} 
						},
						{label:"", labelWidth:"", type:"selectBox", width:"100%", key:"searchCd", addClass:"selectBox", valueBoxStyle:"padding-left:0px;", value:"01",
							options:[]
						},
						{label:"", labelWidth:"", type:"button", width:"60",style:"float:right;", key:"btn_print_prjJob",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-print' aria-hidden='true'></i>&nbsp;<span>프린트</span>",
							onclick:function(){
								$(firstGrid.exportExcel()).printThis({importCSS: false,importStyle: false,loadCSS: "/css/common/printThis.css"});
						}},
						{label:"", labelWidth:"", type:"button", width:"55",style:"float:right;", key:"btn_excel_prjJob",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-file-excel' aria-hidden='true'></i>&nbsp;<span>엑셀</span>",
							onclick:function(){
								// 트리에서 선택된 프로젝트를 가져온다.
								var selNode = zTree.getSelectedNodes()[0];
								
								// 선택된 프로젝트가 없으면 알림
								if(gfnIsNull(selNode)){
									jAlert("엑셀 다운로드를 할 프로젝트를 선택해주세요.","알림");
									return false;
								}
								
								firstGrid.exportExcel("${sessionScope.selMenuNm}.xls");
						}},
						{label:"", labelWidth:"", type:"button", width:"55",style:"float:right;", key:"btn_delete_prjJob",valueBoxStyle:"padding:5px;", value:"<i class='fa fa fa-trash-alt' aria-hidden='true'></i>&nbsp;<span>삭제</span>",
							onclick:function(){
								
								// 트리에서 선택된 프로젝트를 가져온다.
								var selNode = zTree.getSelectedNodes()[0];
								
								// 그리드에서 체크된 job을 가져온다.
								var chkList = firstGrid.getList('selected');
								
								// 선택된 프로젝트가 없으면 알림
								if(gfnIsNull(selNode)){
									jAlert("프로젝트를 선택해주세요.","알림");
									return false;
								}
								
								// 체크된 job이 없을경우
								if(gfnIsNull(chkList)){
									jAlert("프로젝트에서 배정 제외할 JENKINS JOB에 체크해주세요.","알림");
									return false;
								}
								
								// 체크된 job을 프로젝트에서 배정제외 한다.
								fnDeletePrjJenkinsJobInfo(chkList, selNode.prjId);
						}},
						{label:"", labelWidth:"", type:"button", width:"60",style:"float:right;", key:"btn_insert_prjJob",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-save' aria-hidden='true'></i>&nbsp;<span>등록</span>",
							onclick:function(){
								
								// 트리에서 선택된 프로젝트를 가져온다.
								var selNode = zTree.getSelectedNodes()[0];
								
								// 선택된 프로젝트가 없으면 알림
								if(gfnIsNull(selNode)){
									jAlert("프로젝트를 선택해주세요.","알림");
									return false;
								}
								
								// 프로젝트 그룹 선택 시 알림
								if(selNode.level != 1){
									jAlert("프로젝트 그룹을 제외한 프로젝트만 선택해주세요.","알림");
									return false;
								}
								
								// 프로젝트 ID를 가져온다.
								var prjId = selNode.prjId;
								
								var data = {"prjId": prjId,};
								// 프로젝트에 JENKINS JOB 등록 팝업 호출 
								gfnLayerPopupOpen('/stm/stm3000/stm3100/selectStm3101View.do',data,"640","583",'scroll');
						}},
						{label:"", labelWidth:"", type:"button", width:"55", key:"btn_search_prjJob",style:"float:right;" , valueBoxStyle:"padding:5px;", value:"<i class='fa fa-list' id='btn_search_prjJob' aria-hidden='true'></i>&nbsp;<span>조회</span>",
							onclick:function(){
								
								// 검색 조건 Select
								var searchSelect = axdom("#" + mySearch.getItemId("searchSelect"));
								// 검색 콤보박스 (프로젝트)
								var searchCd = axdom("#" + mySearch.getItemId("searchCd"));
								// 검색어
								var searchTxt = axdom("#" + mySearch.getItemId("searchTxt")); 
								// 검색 조건 Select 값
								var searchType = searchSelect.val();
								// 검색할 프로젝트 ID
								var searchPrjId = "";
								
								// 검색 조건이 프로젝트가 아닐경우
								if(searchType != "project"){
	
									// 트리에서 선택된 프로젝트를 가져온다.
									var selNode = zTree.getSelectedNodes()[0];
									
									// 선택된 프로젝트가 없으면 알림
									if(gfnIsNull(selNode)){
										jAlert("조회할 프로젝트를 선택해주세요.","알림");
										return false;
									}
									
									// 프로젝트 ID 세팅
									searchPrjId = selNode.prjId;
								
								// 검색타입이 프로젝트일 경우
								}else{
									// 콤보박스에서 선택한 프로젝트 ID 세팅
									searchPrjId = searchCd.val();
									// 콤보박스에서 선택한 프로젝트 ID를 가지고 좌측 트리에서 프로젝트 노드를 가져온다.
									var treeNodes = zTree.getNodesByParam("prjId", searchPrjId);
									// 해당 노드의 부모 노드를 가져온다.
							    	var pNode = treeNodes[0].getParentNode();
									// 부모노드를 기준으로 트리를 펼친다.
							    	zTree.expandNode(treeNodes[0], true, true, null, false); 
									// 우측 트리에서 프로젝트 ID를 기준으로 프로젝트를 선택한다.
							    	zTree.selectNode(treeNodes[0]);
								}
								
								// 검색 조건 설정
	 							var pars = mySearch.getParam();
							    var ajaxParam = $('form#searchFrm').serialize();

							    if(!gfnIsNull(pars)){
							    	ajaxParam += "&"+pars;
							    }
								
							    // 그리드 데이터 조회
							    fnInGridListSet(searchPrjId, 0, ajaxParam);
					            
					            //폼 데이터 변경
							    $('#searchSelect').val(searchSelect.val());
								$('#searchCd').val(searchCd.val());
								$('#searchTxt').val(searchTxt.val()); 
						}},
						
						
						{label:"", labelWidth:"", type:"button", width:"120",style:"float:right;", key:"btn_insert_auth",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-save' aria-hidden='true'></i>&nbsp;<span>배포 권한 설정</span>",
							onclick:function(){
								
								// 그리드에서 선택된 ROW를 가져온다.
								var item = (!gfnIsNull(Object.keys(firstGrid.focusedColumn)))? firstGrid.list[firstGrid.focusedColumn[Object.keys(firstGrid.focusedColumn)].doindex]:null;

								// 트리에서 선택된 프로젝트를 가져온다.
								var selNode = zTree.getSelectedNodes()[0];
								
								// 선택된 프로젝트가 없으면 알림
								if(gfnIsNull(selNode)){
									jAlert("프로젝트를 선택해주세요.","알림");
									return false;
								}
								
								// 프로젝트 그룹 선택 시 알림
								if(selNode.level != 1){
									jAlert("프로젝트 그룹을 제외한 프로젝트만 선택해주세요.","알림");
									return false;
								}
								
								// 그리드에서 선택된 JENKINS JOB이 없으면 알림
								if(gfnIsNull(item)){
									jAlert("JENKINS JOB을 선택해주세요.","알림");
									return false;
								}

								var data = { "prjId": selNode.prjId,"jenId":item.jenId, "jobId":item.jobId };
								gfnLayerPopupOpen('/stm/stm3000/stm3100/selectStm3102View.do',data,"640","430",'scroll');
						}}
						
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
		
	});
}

	// 프로젝트 목록을 조회한다.
	function fnSearchProjectList(){
		
		var licGrpId = '${sessionScope.loginVO.licGrpId }'; 
		var authGrpId = '${sessionScope.selAuthGrpId }';
		//AJAX 설정
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1000/selectPrj1000ProjectGroupListAjax.do'/>"}
				,{ "licGrpId":licGrpId, "authGrpId":authGrpId });
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
	    	
	    	toast.push(data.message);
	    	
	    	// zTree 설정 
		    var setting = {
		        data: {
		        	key: {
						name: "prjNm"
					},
		            simpleData: {
		                enable: true,
		                idKey: "prjId",
						pIdKey: "prjGrpId",
		            }
		        },
				callback: {
					onClick: function(event, treeId, treeNode){
						//우측 메뉴 정보
						if(treeNode.level==1){
							currentNode =treeNode;
							fnInGridListSet(currentNode.prjId);
						}
						
					}
				},
				view : {
					showIcon : function(treeId, treeNode) {
						if(treeNode.level ==0){
							treeNode.isParent = true;
						}
						return true;
					}
				}
		    };

		    // zTree 초기화
		    zTree = $.fn.zTree.init($("#prjTreeJson"), setting, data.prjList);
		    
		    var treeNode = [];
			// 프로젝트 목록이 있을 경우
		    if(data.prjList.length>0){
		    	treeNode =  zTree.getNodes();
		    	// 프로젝트 트리를 모두 펼친다.
		    	zTree.expandAll(true);
		    	// 트리노드가 존재하고 트리노드가 1개 이상 있을경우
		    	if(!gfnIsNull(treeNode) && treeNode.length>0){
		    		// 첫번째 트리노드의 자식 노드를 가져온다.
		    		var childNodes = treeNode[0].children;
		    		// 자식노드가 존재하고, 자식노드가 1개이상 있을경우
		    		if(!gfnIsNull(childNodes) && childNodes.length>0){
		    			currentNode=childNodes[0];
		    			//fnInGridListSet(childNodes[0].prjId);
		    		}
			    	
			    }
		    }
		    
		});
		
		//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err){
			jAlert(data.message,"알림창");
	 	});
		//AJAX 전송
		ajaxObj.send();
	}
	

	/*
	 * 프로젝트에 배정된 Job을 배정제외 한다.
	 * @param chkList 프로젝트에서 배정 제외할 job 목록
	 */
	function fnDeletePrjJenkinsJobInfo(chkList, prjId){
		
		var params = "";
		
		// 체크된 항목으로부터 파라미터 정보 세팅
		$(chkList).each(function(idx, val){
			params += "&prjId="+prjId+"&jenId="+val.jenId+"&jobId="+val.jobId
		});

		jConfirm("체크된 JENKINS JOB을 프로젝트에서 배정 제외하시겠습니까?", "알림창", function( result ) {
			if( result ){
				//AJAX 설정
				var ajaxObj = new gfnAjaxRequestAction(
						{"url":"<c:url value='/stm/stm3000/stm3100/deleteStm3100ProjectDelJobAjax.do'/>", "loadingShow":true}
						,params);
				//AJAX 전송 성공 함수
				ajaxObj.setFnSuccess(function(data){
					
					data = JSON.parse(data);
					
					// job 배정 제외가 실패했을 경우
					if(data.errorYn == 'Y'){ 
						// 에러 메시지 출력
			    		toast.push(data.message);
			    		return;
			    	}
					
					// 배정제외 성공 메시지 출력
					toast.push(data.message);
					
					// 프로젝트에 job 배정 제외 후 그리드 재조회
					fnInGridListSet(prjId, 0, $('form#searchFrm').serialize()+"&"+mySearch.getParam());
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
		
	};
	
	//가이드 상자
	function fnStm3100GuideShow(){
		var mainObj = $(".main_contents");
		
		//mainObj가 없는경우 false return
		if(mainObj.length == 0){
			return false;
		}
		//guide box setting
		var guideBoxInfo = globals_guideContents["stm3100"];
		gfnGuideBoxDraw(true,mainObj,guideBoxInfo);
	}
</script>


		<div class="main_contents" style="height: auto;">
			<form:form commandName="stm3100VO" id="searchFrm" name="searchFrm" method="post" onsubmit="return false;">
			</form:form>
			<div class="req_title">${sessionScope.selMenuNm }</div>
			<div class="tab_contents menu">
				<input type="hidden" name="strInSql" id="strInSql" />
				<div id="AXSearchTarget" style="border-top:1px solid #ccc;" guide="stm3100button"  ></div>
				<br />
				<div class="menu_wrap">
				<div class="menu_ctrl_wrap">
					<div class="menu_ctrl_btn_wrap">	
						<div class="menu_all_wrap">
							<span class="menu_expand_all" title="전체 열기"></span><span class="menu_collapse_all" title="전체 닫기"></span>
						</div>
					</div>
					
					<div class="menu_lists_wrap" guide="stm3100projectListTree" >
						<ul id="prjTreeJson" class="ztree"></ul>
					</div>
				</div>
				
				<div class="menu_info_wrap">
					<div id="AXSearchTargetDown" style="border-top:1px solid #ccc;"></div>
					<div data-ax5grid="first-grid" data-ax5grid-config="{}" style="height: 600px;" guide="stm3100prjAddJobGrid"></div>
				</div>
					
			</div>
		</div>
		
		
		
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />