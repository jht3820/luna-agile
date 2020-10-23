<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/oslops/top/header.jsp"%>
<jsp:include page="/WEB-INF/jsp/oslops/top/aside.jsp" />

<link rel='stylesheet' href='<c:url value='/css/oslops/adm.css'/>' type='text/css'>
<link rel='stylesheet' href='<c:url value='/css/oslops/dept.css'/>' type='text/css'>
<link rel='stylesheet' href='<c:url value='/css/ztree/zTreeStyle/zTreeStyle.css'/>' type='text/css'>
<script type="text/javascript" src="/js/ztree/jquery.ztree.all.min.js"></script>

<style>


#ord {border: 1px solid #ccc; font-size: 1em; width: 60%; min-width: 150px; height: 100%; padding-left: 4px;}
#useCd { width: 60%; min-width: 150px; height: 100%; }
/* 필수 입력값 */
.required_info{color:red; font-weight: bold; }

div#adm7000_mask_frmae {
    position: absolute;
    width: 999px;
    height: 580px;
    background-color: rgba(0, 0, 0, 0.7);
    z-index: 2;
    font-size: 10pt;
    color: #fff;
    font-weight: bold;
    padding-top: 249px;
    text-align: center;
 
}

</style>

<script>
//zTree, mask
var zTree;
var ax5Mask = new ax5.ui.mask();
// 선택된 조직 및 하위조직이 담긴 배열, 조직 삭제시 사용
var chkDeptIdArr = [];
//선택된 조직 및 하위조직 노드가 담긴 배열, 조직 삭제시 사용
var chkDeptNodeArr = [];
// axSearch
var deptSearch;
// 검색된 조직 목록
var deptNodeList = [];

//유효성 체크
var arrChkObjAdm7000 = {"deptName":{"type":"length","msg":"조직명은 200byte까지 입력이 가능합니다.",max:200}
				,"ord":{"type":"number"}
				,"deptEtc":{"type":"length","msg":"비고는 2000byte까지 입력이 가능합니다.", "max":2000}
				};

$(document).ready(function() {


	/********************************************************************
	 *	조직관리 기능 부분 정의 시작												*
	 *********************************************************************/
	/* 	
	*	공통코드 가져올때 한번 트랜잭션으로 여러 코드 가져와서 셀렉트박스에 세팅하는 함수(사용 권장)
	* 	1. 공통 대분류 코드를 순서대로 배열 담기(문자열)
	*	2. 사용구분 저장(Y: 사용중인 코드만, N: 비사용중인 코드만, 그 외: 전체)
	*	3. 공통코드 적용할 select 객체 직접 배열로 저장
	* 	4. 공통코드 가져와 적용할 콤보타입 객체 배열 ( S:선택, A:전체(코드값 A 세팅한 조회조건용), N:전체, E:공백추가, 그 외:없음 )
	*	5. 동기 비동기모드 선택 (true:비동기 통신, false:동기 통신)
	*	마스터 코드 = CMM00001:사용여부 
	*/
	var mstCdStrArr = "CMM00001";
	var strUseYn = 'Y';
	var arrObj = [$("#useCd")];
	var arrComboType = [""];
	gfnGetMultiCommonCodeDataForm(mstCdStrArr, strUseYn, arrObj, arrComboType , true);
	
	gfnInputValChk(arrChkObjAdm7000);
	
	// 조직 검색상자 추가
	fnDeptSearchBox();
	
	// 최초 화면진입시 검색조건 : 해당조건으로 지정 시 ROOT와 1뎁스만 조회한다.
	var searchParam = "&searchSelect=all";
	
	// 최초 화면 진입시 초기 조직목록  조회
	fnSearchDeptList(searchParam);
	
	//  조직 추가 버튼 클릭 이벤트
	//	조직 추가시 DB 인서트 처리를 실행하며 등록이 성공되면 등록된 기본정보를 이용하여 조직 트리에 추가한다.
	$("#btn_insert_deptAddInfo").click(function(){
		//선택된 트리 엘레먼트 객체 저장
		var selZtree = zTree.getSelectedNodes()[0];
	
		// 선택된 노드가 없을 경우
		if(selZtree == null || selZtree == ""){
			jAlert("선택된 조직이 없습니다.", "알림");
			return false;
		}
		// 조직은 요구사항 분류와 달리 무한뎁스로 생성 가능 
		var deptId = selZtree.deptId;
		
		//인서트 로직 정상적으로 동작했을때 선택되어 있던 폴더 선택해제하고 DB 인서트된 정보를 이용하여 하위엘레먼트로 추가한다.
		//선택한 로우의 메뉴ID를 인자로 보냄
		fnInsertDeptPopupOpenAjax(selZtree);	
	});

	//	조직 삭제 버튼 
	$("#btn_delete_deptDeleteInfo").click(function(){
		//선택 조직 가져오기
		var menu = zTree.getSelectedNodes()[0];
		
		//선택 조직 없는경우 경고
		if(gfnIsNull(menu)){
			jAlert("삭제할 조직을 선택해주세요.", "알림");
			return;
		}

		if(menu.level == 0){
			jAlert("루트 디렉터리는 삭제 할 수 없습니다.","알림");
		} else {
			//선택한 div의 부모영역이 가진 자식 노드의 갯수로 하위메뉴 존재 여부를 판단한다.
			if(menu.length == 0){
				toast.push("조직을 선택하지 않았습니다. 조직을 선택해 주세요.");
			}
			else{
				// 사용자가 소속된 조직을 체크
				var result = fnDeptInUserChk(menu);
				var resultArr = result.split("&");
				
				// 삭제할 조직ID 문자열
				var strDeptId = resultArr[0];
				// 삭제 flag
				var delChk = resultArr[1];

				if(delChk == "Y"){
					jConfirm("선택된 조직에는 소속된 사용자가 없습니다. \n\n 해당 조직및 하위조직을 삭제하시겠습니까? \n", "알림", function( result ) {
		   				if( result ){
		   					jConfirm("선택된 조직 및 하위조직까지 삭제되며 삭제 시 되돌릴 수 없습니다. \n그래도 삭제 하시겠습니까?", "알림", function( result ) {
		   	   					if( result ){
		   	   						fnDeleteDeptInfoAjax(strDeptId);
		   	   					}
		   	   				});
		   				}
		   			});
				}
			}
		}
	});	

	/********************************************************************
	 *	조직 관리 기능 부분 정의 종료												*
 	*********************************************************************/
});



/********************************************************************
* 조직 관리 기능 부분 정의 시작												*
*********************************************************************/
/**
 * 	좌측 조직 선택했을때 조직 정보 표시 함수
 *	@param deptId 조직ID
 */
function fnGetDeptInfoAjax(deptId){
	
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/adm/adm7000/adm7000/selectAdm7000DeptInfoAjax.do'/>","loadingShow":false}
			,{ "deptId":deptId});
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		// 조회 실패
    	if(data.errorYn == 'Y'){ 
    		toast.push(data.message);
    		return;
    	}
		
		// 오류없을경우 Mask 제거
		//ax5Mask.close();
		$("div#adm7000_mask_frmae").hide();
		// 비고 초기화
		$("#deptEtc").val("");
		
    	//디테일폼 세팅
    	gfnSetData2Form(data, "deptInfoFrm");
    	
    	// 조직레벨
    	var deptLevel = data.lvl;
    	
    	// 사용유무 수정 불가처리
		$("#useCd").attr("disabled","disabled");
    	
    	// ROOT 노드가 아닐경우
    	if(deptLevel > 0){
    		// 사용유무 변경가능하도록
    		$("#useCd").removeAttr("disabled");
    	}
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message,"알림");
	});
	
	//AJAX 전송
	ajaxObj.send();
}



/**
 * 조회버튼 클릭시 조직 리스트 조회한다.
 * 
 * 조직 트리 표시 검색 조건
 * 1. 조직관리 화면 진입 또는 전체보기로 검색시 ROOT와 1뎁스만 조회하여 보여준다. 
 *
 * 2. 조직 검색시 검색어에 해당하는 조직을 기준으로 계층으로 보여준다.
 *	    예를 들어 다음과 같이 조직이 등록되어 있을 경우
 *
 * (ROOT) 서울시 
 *			ㄴ 행정과
 *				ㄴ행정관리과
 *				ㄴ민원처리과
 *			ㄴ 도시환경과
 *				ㄴ 도시정비과
 *				ㄴ 도시환경관리과
 * 
 *	 조직명으로 '도시'를 검색 시 
 * 
 * (ROOT) 서울시 
 *			ㄴ 도시환경과
 *				ㄴ 도시정비과
 *				ㄴ 도시환경관리과
 *  
 *  위와 같이 검색결과에 해당하는 조직만 계층으로 표시한다.
 * 
 * 3. 검색결과가 없을경우  ROOT 노드만 조회된다.
 * 
 * @param ajaxParam : 검색 파라미터 (검색타입 : deptName, deptEtc)
 */
function fnSearchDeptList(ajaxParam){
	
	// 검색 파라미터 세팅
 	if(gfnIsNull(ajaxParam)){
		ajaxParam = $('form#searchFrm').serialize();
	} 
	 
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/adm/amd7000/adm7000/selectAdm7000DeptListAjax.do'/>"}
			,ajaxParam);
	//AJAX 전송 성공 함수
	ajaxObj.async = false;
	ajaxObj.setFnSuccess(function(data){
		
		data = JSON.parse(data);
    	
		// 조회 실패
    	if(data.errorYn == 'Y'){ 
    		toast.push(data.message);
    		return;
    	}
		
    	// 우측 상세보기 화면을 초기화한다.
		$('#deptInfoFrm')[0].reset();

    	// 조회 성공 메시지 출력
    	toast.push(data.message);
    	
    	// zTree 설정
	    var setting = {
    		// zTree binding data key 설정
	        data: {
	        	key: {
					name: "deptName"
				},
	            simpleData: {
	                enable: true,
	                idKey: "deptId",
					pIdKey: "upperDeptId",
	            }
	        },
	        // 동적 트리 설정
	        async: {
				enable: true, // async 사용여부 (true:사용, false:미사용)
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				url:"<c:url value='/adm/amd7000/adm7000/selectAdm7000SubDeptListAjax.do'/>",
				autoParam:["deptId"],	// 노드의 값을 서버로 보낼경우 배열형식으로 autoParam에 세팅
				otherParam:{"deptSelType" : "async"},  // 노드의 값을 제외한 다른 값을 서버로 보낼 경우 otherParam에 세팅
				dataType: "json",
				dataFilter: fnTreeFilter	// 데이터 조회 후 처리할 필터 function, async 사용시 dataFilter는 반드시 지정해야 한다.
			},
			callback: {
				onClick: function(event, treeId, treeNode){
					//우측 조직 정보
					fnGetDeptInfoAjax(treeNode.deptId);
				},
				onAsyncError: fnAsyncError
			},
			view : {
				fontCss: getFontCss,
				showIcon : function(treeId, treeNode) {
					// 트리 노드가 부모형이 아닐 경우
					if(typeof zTree != "undefined" &&  !treeNode.isParent){
						// 모두 부모형(폴더 아이콘)으로 변경한다.
						treeNode.isParent = true;
						zTree.updateNode(treeNode);
						zTree.refresh();	
					}
					return true;
				}
			}
	    };
		
		
	    // zTree 초기화
	    zTree = $.fn.zTree.init($("#deptTree"), setting, data.deptList);
	    zTree.refresh();
	    
	    // expandAll(false)를 추가해야 트리의 폴더를 한번 클릭 시 하위 메뉴가 보여진다.
	    // 추가하지 않을 경우 두번 클릭을 해야 폴더가 펼쳐진다.
	    zTree.expandAll(false);
	    
	    // 최상위 노드를 가져온다.
	    var treeNodes = zTree.getNodes();
	    if(!gfnIsNull(treeNodes)){
	    	// 최상위 노드의 자식 노드 수
		    var rootNodeChild = treeNodes[0].children;
		    // 자식 노드가 있을 경우
		    if(!gfnIsNull(rootNodeChild) && rootNodeChild.length > 0){
		    	// 최상위 노드만 펼친다
		    	zTree.expandNode(treeNodes[0], true, false, false, false);
		    }
	    }
	    
	    // 우측 상세보기 화면 mask open
	    $("div#adm7000_mask_frmae").show();
	    $("div#adm7000_mask_frmae").html("조직을 선택해주세요.");
		
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message,"알림");
	});
	
	//AJAX 전송
	ajaxObj.send();
}
	

/*
 * 동적트리 조회 실패시 처리
 */
function fnAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown){
	// 조회 실패 메시지 출력
   	toast.push("하위 조직 조회에 실패하였습니다.");
}
	
/*
 * [+] 아이콘 클릭 또는 더블클릭하여 트리 확장시 조회된 결과에 대한 처리를 한다.
 *
 * @param treeId : 트리 ID
 * @param parentNode : 트리에서 [+]아이콘 클릭 또는 더블클릭한 노드
 * @param result : 동적조회 결과값
 */
function fnTreeFilter(treeId, parentNode, result) {
 	
	// 조회된 하위 조직 목록
 	var childNodes = result.deptList;
	
	// filter에서 모든 자식 노드를 부모형(폴더 아이콛)으로 변경한다.
	// 해당 옵션 추가해야  트리의  [+] 아이콘 클릭 시 한번에 트리가 펼쳐진다. 
	$.each(childNodes, function(idx, node){
		node.isParent = true;
		zTree.updateNode(node);
	});
	
	// 선택한 노드의 자식 노드를 리턴하면 자동으로 트리에 자식 노드가 추가된다. ( zTree.addNodes()를 사용할 필요 없음)
	return childNodes;
}

/*
 * 검색된 조직에대한 처리를 한다.
 * 검색조직 확장 및 하이라이트 처리를 한다.
 * @param searchSelectVal : 검색 select (전체보기, 조직명, 비고)
 * @param searchTxtVal : 검색어
 */
function fnSearchDeptResultProcess(searchSelectVal, searchTxtVal){
	
	// 트리의 하이라이트 초기화
	//fnTreeHighlightUpdate(false);
	
	// 전체검색이 아닐 경우
    if(searchSelectVal != 'all'){
    	
    	// 트리에서 조직 검색
    	deptNodeList = zTree.getNodesByParamFuzzy(searchSelectVal, searchTxtVal);
 	   	
 		// 검색결과가 없을경우
 		if(deptNodeList.length == 0){
 			toast.push("검색된 조직이 없습니다.");
 			return false;
 		}
 		
 		// 트리의 하이라이트 활성화
		fnTreeHighlightUpdate(true);
 		
 		// 검색된 조직이 있을경우  노드 loop
 		$.each(deptNodeList, function(idx, deptNode){
 			// 검색된 조직 노드의 부모를 찾는다.
 			var parentNode = deptNode.getParentNode();
 			// 해당 부모를 확장한다. 자식까지 확장옵션(3번째 인자)은 false로 둔다. 
 			// ture일 경우 expand 이벤트 발생시 자동으로 하위 노드를 동적 조회한다.
 			// 노드 확장시 무조건 부모노드를 확장하고, 자식까지 확장 옵션은 flase로 둬야한다.
 			zTree.expandNode(parentNode, true, false, false, false);
 		});
 		
 		// 검색된 조직이 1건있을 경우
 		if(deptNodeList.length == 1){
 			// 조직 노드를 선택한다.
        	zTree.selectNode(deptNodeList[0]);
        	// 선택한 조직의 상세정보를 조회하여 우측 화면에 출력한다.
        	fnGetDeptInfoAjax(deptNodeList[0].deptId);
 		}
	}
}
 
/**
 * 	검색된 조직 highlight 처리 
 *	@param highlight 하이라이트 설정 값(true, false)
 */
function fnTreeHighlightUpdate(highlight) {
	var zTreeObj = $.fn.zTree.getZTreeObj("deptTree");

	for(var i = 0; i < deptNodeList.length; i++) {
		deptNodeList[i].highlight = highlight;
		zTreeObj.updateNode(deptNodeList[i]);
	}
}
	
/**
 * 	신규 조직 등록오픈 오픈
 *	해당 함수 호출시 새로운 조직을 등록할 수 있는 팝업을 오픈한다.
 *  @param deptObj 현재 선택된 조직
 */
function fnInsertDeptPopupOpenAjax(deptObj){
	
	var selDept = zTree.getSelectedNodes()[0];

	//사용유무 '02'인경우 하위 노드 추가 불가
	if(selDept.useCd == "02"){
		jAlert("미 사용 조직에는 추가할 수 없습니다.");
		return false;
	}
	
	// 팝업 오픈 시 조직ID, 순번, 레벨 정보를 팝업창에 전달한다.
	var sendData = { "deptId" : deptObj.deptId,
					 "ord" : deptObj.ord,
					 "lvl" : deptObj.lvl};
	
	// 조직 추가 팝업창 open
	gfnLayerPopupOpen('/adm/adm7000/adm7000/selectAdm7001View.do', sendData, "540", "430", "auto");
}

/**
 * 	신규 조직 등록 함수
 *	등록창에서 등록된 데이터(조직)를 zTree에 추가한다.
 *	등록 성공시 호출됨
 */
function fnInsertDeptInfoAjax(newDeptData){
	
	// 추가되는 조직은 모두 폴더 아이콘(부모형 메뉴)으로
	newDeptData.isParent = true;
	// 하위조직 추가
	zTree.addNodes(zTree.getSelectedNodes()[0], newDeptData);
	// 결과 메시지 출력	
	//toast.push(newDeptData.message);
}


/**
 * 	사용자가 소속되어 있는 조직들을 찾는다.
 *  @param selectDeptOjb 현재 선택된 조직
 */
function fnDeptInUserChk(selectDeptOjb){

	// 조직ID를 담은 배열초기화
	chkDeptIdArr.length = 0;
	// 조직 노드를 담은 배열 초기화
	chkDeptNodeArr.length = 0;
	
	// 선택된 조직 및 하위조직을 모두 가져온다.
	fnGetDeptList(selectDeptOjb);
	
	// deptId 문자열
	var strDeptId = "";
	
	// 배열에 담긴 조직ID를 문자열로 변환
	$(chkDeptIdArr).each(function(idx, chkDept) {
		strDeptId += ",'"+chkDept+"'";
	});
	
	// 처음 , 자르기
	strDeptId = strDeptId.substring(1);

	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/adm/adm2000/adm2000/selectAdm2000ExistUsrInDeptAjax.do'/>","loadingShow":false}
			,{ "deptId" : strDeptId });

	ajaxObj.setProperty({"async":false});
	
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
    	
		var msg = "";
    	var list = data.userDeptList;
    	// 사용자가 속한 조직이 있는경우
   		if( !gfnIsNull(list) ){
   			$(list).each(function(idx, dept) {
   				msg += ", "+dept.deptName+" ";
   			});
   			
   			msg = msg.substring(1);
   			// 조직ID 문자열에 결과값 붙임
   			strDeptId += "&N";
   			
   			jAlert( "\n"+msg+"\n\n조직에는 사용자가 소속되어 있어 삭제할 수 없습니다. ","알림");
   		}
   		else{
   			// 조직ID 문자열에 결과값 붙임
   			strDeptId += "&Y";
   		}
	});
	
	ajaxObj.setFnError(function(xhr, status, err){
    	data = JSON.parse(data);
    	jAlert(data.message,"알림");
 	});
	
	//AJAX 전송
	ajaxObj.send();
	
	return strDeptId;
}


/**
 *	선택된 조직 및 하위조직을 모두 가져오는 함수
 *	@param selectDeptOjb 현재 선택된 조직
 */
function fnGetDeptList(selectDeptOjb){
	
	// 배열에 조직 노드를 담는다.
	chkDeptNodeArr.push(selectDeptOjb);
	// 배열에 조직ID를 담는다.
	chkDeptIdArr.push(selectDeptOjb.deptId);
	
	//자식 객체가 있는 경우에만 동작
	if(typeof selectDeptOjb.children != "undefined"){
		
		$.each(selectDeptOjb.children,function(){
			var subDeptObj = this;
			// 재귀
			fnGetDeptList(subDeptObj);
		});
	}
}

/** 
*	조직 삭제 함수
*	선택한 조직을 삭제한다.
*	@param strDeptId 삭제할 조직ID들의 문자열
*/
function fnDeleteDeptInfoAjax(strDeptId){

	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/adm/adm7000/amd7000/deleteAdm7000DeptInfoAjax.do'/>","loadingShow":false}
			,{ "deptId":strDeptId });
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
    	
    	//삭제가 실패하면 실패 메시지 후 리턴
    	if(data.errorYn == 'Y'){
    		jAlert(data.message,"경고");
    		return false;
    	} 
    	else{
    		
    		$('#deptInfoFrm')[0].reset();
    		
    		// 삭제할 조직노드 중 최상위 조직노드를 가져온다.
    		var firstDeptNode = chkDeptNodeArr[0];	
    		// 삭제처리를 위해 역순 - 최하위 조직부터 배열에 배치
    		chkDeptNodeArr.reverse();
    		
    		// 최하위 조직부터 삭제처리
    		$(chkDeptNodeArr).each(function(idx, deptNode) {
    				zTree.removeNode(deptNode);
    		});
    		
    		// 삭제할 조직 중 최상위 조직의 부모노드를 가져옴
    		var parentNode = firstDeptNode.getParentNode();
    		// 폴더형으로 변경
    		parentNode.isParent = true;
    		// 트리 업데이트
    		zTree.updateNode(parentNode);
    	}
    	
    	toast.push(data.message);
	});
	
	//AJAX 전송
	ajaxObj.send();
}


/**
*	조직 정보 수정 함수
*	선택한 조직정보를 수정한다.
*	@param deptObj 수정할 조직노드
*	@param updateType 수정 타입
*	@param updateAsync 동기/비동기
*/
function fnUpdateDeptInfoAjax(deptObj, updateType, updateAsync){
	
	//객체 넘어왔는지 확인
	if(typeof deptObj == "undefined" || deptObj == null){
		toast.push("선택된 조직이 없습니다.");
		return false;
	}
	
	//error있는경우 오류
	if($(".inputError").length > 0){
		jAlert("유효하지 않은 값이 입력된 항목이 존재합니다.\n항목을 확인해주세요.","알림");
		$(".inputError")[0].focus()
		return false;
	}
	
	/* 필수입력값 체크 공통 호출 */
	var strFormId = "deptInfoFrm";
	var strCheckObjArr = ["deptName","ord"];
	var sCheckObjNmArr = ["조직명","순번"];
	if(gfnRequireCheck(strFormId, strCheckObjArr, sCheckObjNmArr)){
		return false;	
	}
	
	// 루트(최상위 조직)는 순번 0이므로 순번은 1부터 입력가능
	var chkOrd = $('#ord').val();
	if(chkOrd < 1){
		jAlert("순번은 1 이상 입력가능합니다.");
		$('#ord').val("");
		return false;
	}
	
	if(updateType == "editUseCd"){ //사용유무 수정
		var parentNodeObj = deptObj.getParentNode();
		//부모노드 존재하는 경우
		if(!gfnIsNull(parentNodeObj)){
			//부모노드의 사용유무값이 "02"인경우 "01"로 수정 불가
			if(parentNodeObj.useCd == "02"){
				toast.push("상위 조직의 사용여부를 변경해주세요.");
				return false;
			}
		}
		
		//사용유무 반대로 변경
		deptObj.useCd = (deptObj.useCd=="01")?"02":"01";
	}else if(updateType == "normal"){
		var parentNodeObj = zTree.getSelectedNodes()[0].getParentNode();
		//부모노드 존재하는 경우
		if(!gfnIsNull(parentNodeObj)){
			//부모노드의 사용유무값이 "02"인경우 "01"로 수정 불가
			if(parentNodeObj.useCd == "02"){
				toast.push("상위 조직의 사용여부를 변경해주세요.");
				return false;
			}
		}
	}
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/adm/adm7000/adm7000/updateAdm7000DpteInfoAjax.do'/>", "async":updateAsync,"loadingShow":false}
			,deptObj);
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
    	
    	//수정이 실패하면 실패 메시지 후 리턴
    	if(data.errorYn == 'Y'){
    		toast.push(data.message);
    		return false;
    	} 
    	else{
    		// 조직명 변경인 경우
    		if(updateType == "editRename"){
    			//우측 조직 정보
				fnGetDeptInfoAjax(deptObj.deptId);
    		//더블 클릭으로 사용유무 변경하는 경우
    		}else if(updateType == "editUseCd"){
    			//현재 선택된 조직이 수정조직과 같은 경우 폼 세팅
    			if(deptObj.deptId == document.deptInfoFrm.deptObj.value){
    				$("#useCd").val(deptObj.useCd);
    			}
    			//사용유무에 따른 폰트 색상 수정
    			var useColor = (deptObj.useCd == "01")?"#000":"#ccc";
    			$("#"+deptObj.tId+"_a").css({color:useColor});
    			
    			//우측 조직 정보
				fnGetDeptInfoAjax(deptObj.deptId);
    			
    		//폼으로 정보 수정인 경우
    		}else if(updateType == "normal"){
    			// 조직명이 변경된 경우
    			if(zTree.getSelectedNodes()[0].deptName != $("#deptName").val()){
    				//폼값 수정이기 때문에 조직값 수정 필요
    				zTree.getSelectedNodes()[0].deptName = $("#deptName").val();
    			}
    			//사용유무 변경된 경우
    			if(zTree.getSelectedNodes()[0].useCd != $("#useCd").val()){
    				var useColor = ($("#useCd").val() == "01")?"#000":"#ccc";
    				$("#"+zTree.getSelectedNodes()[0].tId+"_a").css({color:useColor});
    				
    				//폼값 수정이기 때문에 조직값 수정 필요
    				zTree.getSelectedNodes()[0].useCd = $("#useCd").val();
    				
    				//자식 객체가 있는 경우에만 동작
    				if(typeof zTree.getSelectedNodes()[0].children != "undefined"){
	    				//자식 객체 사용유무 전체 변경
	    				$.each(zTree.getSelectedNodes()[0].children,function(){
	    					//사용유무는 부모값
	    					var subDeptObj = this;
	    					subDeptObj.useCd = $("#useCd").val();
	    					
	    					//수정 재귀
		    				fnUpdateDeptInfoAjax(subDeptObj,"editSubUseCd",true);
		    			});
    				}
    			}
    			
    		//하위 조직 사용유무 수정인경우 CSS 변경
    		}else if(updateType == "editSubUseCd"){
    			//사용유무에 따른 폰트 색상 수정
    			var useColor = (deptObj.useCd == "01")?"#000":"#ccc";
    			$("#"+deptObj.tId+"_a").css({color:useColor});
    			
    			//자식 객체가 있는 경우에만 동작 (재귀)
   				if(typeof deptObj.children != "undefined"){
    				//자식 객체 사용유무 전체 변경
    				$.each(deptObj.children,function(){
    					//사용유무는 부모값
    					var subDeptObj = this;
    					subDeptObj.useCd = $("#useCd").val();
    					
    					//수정 재귀
	    				fnUpdateDeptInfoAjax(subDeptObj,"editSubUseCd",true);
	    			}); 
   				}
    		}
    		
    		//해당 노드 갱신
    		if(updateType == "normal"){	//폼값으로 수정
    			zTree.updateNode(zTree.getSelectedNodes()[0]);
    		}else{	//Json Object로 수정
    			zTree.updateNode(deptObj);
    		}
    	}
    	
    	//재귀인경우 메시지 노출 안함
    	if(updateType != "editSubUseCd"){
    		toast.push(data.message);
    	}
	});

	//AJAX 전송
	ajaxObj.send();

}

//검색 상자
function fnDeptSearchBox(){
	var pageID = "AXSearch";
	deptSearch = new AXSearch();

	var fnObjSearch = {
		pageStart: function(){
			//검색도구 설정 01 ---------------------------------------------------------
			deptSearch.setConfig({
				targetID:"AXSearchTarget",
				theme : "AXSearch",
				rows:[
					{display:true, addClass:"", style:"", list:[
						{label:"<i class='fa fa-search'></i>&nbsp;", labelWidth:"50", type:"selectBox", width:"", key:"searchSelect", addClass:"", valueBoxStyle:"", value:"all",
							options:[
                                {optionValue:"all", 			optionText:"전체 보기",optionAll:true},
                                {optionValue:'deptName', 		optionText:'조직명'},
                                {optionValue:'deptEtc', 		optionText:'비고'}
                            ],onChange: function(selectedObject, value){
                            	//선택 값이 전체목록인지 확인 후 입력 상자를 readonly처리
    							if(!gfnIsNull(selectedObject.optionAll) && selectedObject.optionAll == true){
									axdom("#" + deptSearch.getItemId("searchTxt")).attr("readonly", "readonly");	
									axdom("#" + deptSearch.getItemId("searchTxt")).val('');	
								}else{
									axdom("#" + deptSearch.getItemId("searchTxt")).removeAttr("readonly");
								}
								
								//공통코드 처리 후 select box 세팅이 필요한 경우 사용
								if(!gfnIsNull(selectedObject.optionCommonCode)){
									axdom("#" + deptSearch.getItemId("searchTxt")).val('');	
									gfnCommonSetting(deptSearch,selectedObject.optionCommonCode,"searchCd","searchTxt");
                            	}else{
									//공통코드 처리(추가 selectbox 작업이 아닌 경우 type=text를 나타낸다.)
									axdom("#" + deptSearch.getItemId("searchTxt")).show();
									axdom("#" + deptSearch.getItemId("searchCd")).hide();
									axdom("#" + deptSearch.getItemId("searchTxt")).val('');	
								}
    						},

						},
						{label:"", labelWidth:"", type:"inputText", width:"225", key:"searchTxt", addClass:"secondItem sendBtn", valueBoxStyle:"padding-left:0px;", value:"",
							onkeyup:function(e){
								if(e.keyCode == '13' ){
									axdom("#" + deptSearch.getItemId("btn_search_deptInfo")).click();
								}
							} 
						},
						{label:"", labelWidth:"", type:"selectBox", width:"100%", key:"searchCd", addClass:"selectBox", valueBoxStyle:"padding-left:0px;", value:"01",
							options:[]
						},
						{label:"", labelWidth:"", type:"button", width:"55",style:"float:right;", key:"btn_excel_deptInfo",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-file-excel' aria-hidden='true'></i>&nbsp;<span>엑셀</span>",
							onclick:function(){
								
								var excelForm = document.getElementById("adm7000_excel_down_Form");
								excelForm.action = "<c:url value='/adm/amd7000/adm7000/selectAdm7000ExcelList.do'/>";
								excelForm.submit();
								return false;
						}},
						{label:"", labelWidth:"", type:"button", width:"55",style:"float:right;", key:"btn_delete_deptDeleteInfo",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-trash-alt' aria-hidden='true'></i>&nbsp;<span>삭제</span>",
							onclick:function(){
								
								//선택 조직 가져오기
								var menu = zTree.getSelectedNodes()[0];
								
								//선택 조직 없는경우 경고
								if(gfnIsNull(menu)){
									jAlert("선택된 분류가 없습니다.");
									return;
								}
								
								// ROOT 노드 체크
								if(menu.level == 0){
									jAlert("루트 디렉터리는 삭제 할 수 없습니다.","알림");
								} else {
									//선택한 div의 부모영역이 가진 자식 노드의 갯수로 하위조작 존재 여부를 판단한다.
									if(menu.length == 0){
										toast.push("조직을 선택하지 않았습니다. 조직을 선택해 주세요.");
									// 하위조직이 존재할 경우
									}else{
										// 사용자가 소속된 조직을 체크
										var result = fnDeptInUserChk(menu);
										var resultArr = result.split("&");
										
										// 삭제할 조직ID 문자열
										var strDeptId = resultArr[0];
										// 삭제 flag
										var delChk = resultArr[1];

										if(delChk == "Y"){
											jConfirm("선택된 조직에는 소속된 사용자가 없습니다. \n\n 해당 조직및 하위조직을 삭제하시겠습니까? \n", "알림", function( result ) {
								   				if( result ){
								   					jConfirm("선택된 조직 및 하위조직까지 삭제되며 삭제 시 되돌릴 수 없습니다. \n그래도 삭제 하시겠습니까?", "알림", function( result ) {
								   	   					if( result ){
								   	   						fnDeleteDeptInfoAjax(strDeptId);
								   	   					}
								   	   				});
								   				}
								   			});
										}
									}
								}
						}},
						{label:"", labelWidth:"", type:"button", width:"55",style:"float:right;", key:"btn_update_DeptInfo",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-edit' aria-hidden='true'></i>&nbsp;<span>수정</span>",
							onclick:function(){
								
								// 트리에서 선택한 조직 노드를 가져온다
								var selTreeNode = zTree.getSelectedNodes()[0];
								
								// 선택된 조직이 없을 경우 알림
								if(gfnIsNull(selTreeNode)){
									jAlert("수정할 조직을 선택해주세요.", "알림");
									return false;
								}
								
								// 필수입력값 체크 공통 호출 
								var strFormId = "deptInfoFrm";
								var strCheckObjArr = ["deptName","ord"];
								var sCheckObjNmArr = ["조직명","순번"];
								if(gfnRequireCheck(strFormId, strCheckObjArr, sCheckObjNmArr)){
									return;	
								}
								
								// 수정 전 순번 유효성 체크
								if(gfnIsNumeric("ord")){
									// 저장 전 유효성 체크
									if(!gfnSaveInputValChk(arrChkObjAdm7000)){
										return false;	
									}
									// 조직 정보 수정
									fnUpdateDeptInfoAjax($("#deptInfoFrm").serializeArray(),"normal", false);
								}

						}},
						{label:"", labelWidth:"", type:"button", width:"55", key:"btn_insert_deptAddInfo",style:"float:right;", valueBoxStyle:"padding:5px;", value:"<i class='fa fa-save' aria-hidden='true'></i>&nbsp;<span>등록</span>",
							onclick:function(){
								
								// 조직 추가시 DB 인서트 처리를 실행하며 등록이 성공되면 등록된 기본정보를 이용하여 조직 트리에 추가한다.
								// 선택된 조직 노드를 가져온다.
								var selZtree = zTree.getSelectedNodes()[0];
							
								// 선택된 노드가 없을 경우
								if(gfnIsNull(selZtree)){
									jAlert("선택된 조직이 없습니다.", "알림");
									return false;
								}
								// 조직은 요구사항 분류와 달리 무한뎁스로 생성 가능 
								var deptId = selZtree.deptId;
								
								// 조직 등록 팝업 호출시 선택한 트리 노드를 전달한다. 전달된 노드에서 등록시 필요한 정보 추출
								fnInsertDeptPopupOpenAjax(selZtree);	
						}},
						{label:"", labelWidth:"", type:"button", width:"55", key:"btn_search_deptInfo",style:"float:right;", valueBoxStyle:"padding:5px;", value:"<i class='fa fa-list' aria-hidden='true'></i>&nbsp;<span>조회</span>",
							onclick:function(){
								
								// 검색조건 (전체, 조직명, 비고)
								var searchSelectVal = axdom("#" + deptSearch.getItemId("searchSelect") ).val();
								// 검색어
								var searchTxtVal = axdom("#" + deptSearch.getItemId("searchTxt")).val();
								
								// 검색 파라미터
								var pars = deptSearch.getParam();
							    var ajaxParam = $('form#searchFrm').serialize();
								
							    // 검색 파라미터가 있을경우
							    if(!gfnIsNull(pars)){
							    	ajaxParam += "&"+pars;
							    }
								
							    // 조직 조회
					            fnSearchDeptList(ajaxParam);
					            
							    // 조직 조회 후 검색된 조직 확장 및 하이라이트 처리, 검색결과가 1건일 경우에는 검색된 조직을 선택한다.
					            fnSearchDeptResultProcess(searchSelectVal, searchTxtVal);
							    
					            //폼 데이터 변경
								$('#searchSelect').val(searchSelectVal);
								$('#searchTxt').val(searchTxtVal);
						}}
					]}
				]
			});
		}
	};
	
	jQuery(document.body).ready(function(){
		
		fnObjSearch.pageStart();
		//검색 상자 로드 후 텍스트 입력 폼 readonly 처리
		axdom("#" + deptSearch.getItemId("searchTxt")).attr("readonly", "readonly");
		
		//공통코드 selectBox hide 처리
		axdom("#" + deptSearch.getItemId("searchCd")).hide();

		//버튼 권한 확인
		fnBtnAuthCheck(deptSearch);
	});
}

/*
 * zTree View Font 설정 함수
 * @param treeId : 트리 노드의 ID
 * @treeNode : 트리 노드
 */
function getFontCss(treeId, treeNode) {
	
	// 검색된 결과가 있을 경우
	if(treeNode.highlight){
		return {color:"#F40404", "font-weight":"bold"};
	// 검색된 결과가 없고, 사용유무가 미사용일 경우	
	}else if( !treeNode.highlight && treeNode.useCd == "02"){
		return {color:"#ddd", "font-weight":"normal"};
	// 검색된 결과가 없고, 사용유무가 사용일 경우	
	}else if( !treeNode.highlight && treeNode.useCd == "01" ){
		return {color:"#333", "font-weight":"normal"};
	}
}

/********************************************************************
* 조직 관리 기능 부분 정의 종료												*
*********************************************************************/
</script>

<div class="main_contents">
	<div class="dept_title"><c:out value="${sessionScope.selMenuNm }" /></div>
	<form id="adm7000_excel_down_Form" method="post">
	</form>
	<div class="tab_contents menu">
		<div class="top_control_wrap">
			<div id="AXSearchTarget" style="border-top:1px solid #ccc;"></div>
		</div>

		<div class="menu_wrap">
			<div class="menu_ctrl_wrap">
				<div class="menu_lists_wrap" id="divMenu">
					<ul id="deptTree" class="ztree"></ul>
				</div>
			</div>

			<div class="menu_info_wrap" id="selDeptInfoDiv">
				<div class="adm7000_mask_frmae" id="adm7000_mask_frmae"></div>
				<form id="deptInfoFrm" name="deptInfoFrm" method="post">
 					<input type="hidden" id="licGrpId" name="licGrpId"/>
 					<input type="hidden" id="lvl" name="lvl"/>
					<div class="menu_row top_menu_row">
						<div class="menu_col1"><label for="deptId">조직 ID</label></div>
						<div class="menu_col2"><input id="deptId" type="text"  name="deptId" class="readonly" readonly="readonly" tabindex=1 /></div>
					</div>
					<div class="menu_row">
						<div class="menu_col1"><label for="upperDeptId">상위 조직 ID</label></div>
						<div class="menu_col2"><input id="upperDeptId" type="text" name="upperDeptId" class="readonly" readonly="readonly" tabindex=2 /></div>
					</div>
					<div class="menu_row">
						<div class="menu_col1"><label for="deptName">조직명</label><span class="required_info">&nbsp;*</span></div>
						<div class="menu_col2"><input id="deptName" type="text" name="deptName" value="" maxlength="200"></div>
					</div>
					<div class="menu_row">
						<div class="menu_col1"><label for="ord">순번</label><span class="required_info">&nbsp;*</span></div>
						<div class="menu_col2"><input class="ord" id="ord" type="number" min="1" name="ord" value="" maxlength="20"></div>
					</div>
					<div class="menu_row">
 						<div class="menu_col1"><label for="useCd">사용유무</label><span class="required_info">&nbsp;*</span></div>
						<div class="menu_col2"><select class="useCd" name="useCd" id="useCd"></select></div>
					</div>
					<div class="menu_row">
						<div class="menu_col1"><label for="regDtm">생성일</label></div>
						<div class="menu_col2"><input id="regDtm" type="text" name="regDtm" value="" class="readonly" readonly="readonly"></div>
					</div>
					<div class="menu_row" style="margin-bottom:10px;width:100%;">
						<div class="menu_col1" style="height: 120px;" ><label for="deptEtc">비고</label></div>
						<div class="menu_col2" style="height: 120px;">
							<textarea title="비고" id="deptEtc" name="deptEtc" value="" tabindex=4 maxlength="2000"></textarea>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/oslops/bottom/footer.jsp" />