<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<title>OpenSoftLab</title>

<link rel='stylesheet' href='<c:url value='/css/oslops/adm.css'/>' type='text/css'>
<link rel='stylesheet' href='<c:url value='/css/ztree/zTreeStyle/zTreeStyle.css'/>' type='text/css'>
<script type="text/javascript" src="/js/ztree/jquery.ztree.all.min.js"></script>
<script type="text/javascript" src="/js/ztree/jquery.ztree.core.js"></script>


<style type="text/css">
.layer_popup_box .pop_left, .layer_popup_box .pop_right { height: 54px; }
.button_normal { width: 39px; height: 22px; line-height: 22px; text-align: center; font-weight: bold; font-size: 1em; border-radius: 5px; box-shadow: 1px 1px 1px #ccd4eb; margin: 0 auto; border: 1px solid #b8b8b8; cursor: pointer; }
div.pop_sub {padding: 5px 10px 0 10px !important;}
div.pop_sub .pop_left {width:28%;} /* common.css pop_left width값 오버라이딩 */
div.pop_sub .pop_right {width:72%;} /* common.css pop_left width값 오버라이딩 */
.input_txt {padding-left: 5px;}

.pop_menu_ctrl_wrap { float: left; width: 100%; height: 100%; min-height: 497px; font-size: 0.875em; box-sizing: border-box; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;}
#pop_sub_wrap{ height: 600px; padding: 0; max-hight:600px; }
#pop_left_wrap{ padding: 0; border-right: none; width: 33%; background:#fff;}
#pop_right_wrap{ width: 67%; padding-top: 15px; height: 100%; min-height: 493px; border-bottom: 1px solid #ccc;}
.pop_top_wrap{ height: 35px; margin-top: 15px; text-align: right; margin-right: 10px; }
#pop_menu_btn { height: 54px; line-height: 55px; }
.searchItem{ float: right; padding-right: 10px; } 
#ord, #regDtm{ width: 100%; }
#pop_radio { padding: 20px 15px 12px 3px; }
#deptEtc{ height: 123px; background: #eee; }
#searchSelect{ box-sizing: border-box; width:100px; margin: 0px; }
#searchTxt{float: left; width: 150px; height: 28px; border: 1px solid #ccc; margin-right: 1%; font-size: 12px; box-shadow: inset 0px 1px 2px #dddddd; padding-left: 6px; }
.span_text_search{ color: #616161; border-right: 1px solid #d8d8d8; min-height: 20px; line-height: 20px; padding: 10px 0px; box-sizing: content-box; font-size : 13px; font-family: "NanumBarunGothic"; font-weight: bold; }
.span_searchSelect{ padding-left: 10px; }
#divMenu { padding-top: 10px; min-height: 497px;}
.layer_popup_box input[type="text"].input_txt { max-width: 100%; }

</style>


<script type="text/javascript">

	
	// 사용자 등록&수정 팝업에서 넘겨받은 검색어
	var sendSearchDetpNm = "<c:out value='${param.searchDeptNm}' />";
	// 검색된 조직 노드
	var deptNodeList = [];
	// 선택된 조직 및 상위 조직명을 담을 배열
	var parentDeptNames = [];
	
	$(document).ready(function() {
		
		// 조직 검색 및 ztree 추가
		fnSearchDeptList(sendSearchDetpNm);
		
		// 조회 버튼 클릭 - 조직 조회
		$("#btn_search_dept_pop").click(function(){
			// 조직 목록 검색
			fnSearchDeptList();
		});
		
		// 검색창 엔터키 이벤트
		$('#searchTxt').keyup(function(e) {
			if(e.keyCode == '13' ){
				$('#btn_search_dept_pop').click();
			}
		});
		
		// 선택 버튼 클릭 - 조직 선택
		$("#btn_sel_dept").click(function(){
			fnSelectDept();
		});
		
		// 취소 버튼 클릭 - 팝업 close
		$('.exit_btn').click(function() {
			gfnLayerPopupClose();
		});
		
		// 검색옵션 선택 (select)
		$("#searchSelect").change(function() {
			fnChangeElement($(this).val());
		});

	});

	

	
/************************************************************
* 조직검색 함수 정의 시작			 								*
*************************************************************/
	
	/**
	 * 팝업 오픈 또는 조회버튼 클릭시 조직목록 조회 AJAX
	 */
	function fnSearchDeptList(sendSearchDeptNm){
		
		// 넘겨받은 검색어가 있을 경우
		if(!gfnIsNull(sendSearchDeptNm)){
			$("#searchSelect").val("deptName");
			$("#searchTxt").removeAttr("readonly");
			$("#searchTxt").val(sendSearchDeptNm);
		}
		
		// 조직 조회 검색 파라미터
		var ajaxParam = $("#searchDeptFrm").serialize() + "&viewType=cmm1200";
		
		//AJAX 설정
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/adm/amd7000/adm7000/selectAdm7000DeptListAjax.do'/>","loadingShow":true}
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
			$('#deptInfoForm')[0].reset();
			
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
					otherParam:{"deptSelType" : "async", "viewType" : "cmm1200"},  // 노드의 값을 제외한 다른 값을 서버로 보낼 경우 otherParam에 세팅
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
		    
		 	// 검색 select
			var searchSelectVal = $("#searchSelect").val();
			// 검색어
			var searchTxtVal = $("#searchTxt").val();
			// 검색된 결과에 대한 처리 (노드 확장, 하이라이트 처리)
			fnSearchDeptResultProcess(searchSelectVal, searchTxtVal);
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
	  * 동적트리 조회 실패시 처리
	  */
	function fnAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown){
	 	// 조회 실패 메시지 출력
		toast.push("하위 조직 조회에 실패하였습니다.");
	}

	/**
	 * 	좌측 조직명을 선택 시 우측에 상세정보 보여줌
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
			
			// 상세정보 조회 실패시
	    	if(data.errorYn == 'Y'){ 
	    		toast.push(data.message);
	    		return;
	    	}
			
	    	// 디테일폼 세팅
	    	gfnSetData2Form(data, "deptInfoForm");
	    	// 사용여부 세팅
	    	data.useCd == "01" ? $("#useCd").val("사용") : $("#useCd").val("미사용")
		});
		
		//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err){
			data = JSON.parse(data);
			jAlert(data.message,"알림창");
		});
		
		//AJAX 전송
		ajaxObj.send();
	}

	
	
	/**
	 * 	 검색된 조직 highlight 처리 
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
	 * 	선택된 조직의 상위 조직 명을 모두 가져오는 함수
	 *	@param selectedNode 선택된 조직 Node
	 */
	function fnGetSelectedDeptParentNodes(selectedNode){
		
		// 선택된 조직명을 배열에 추가
		parentDeptNames.push(selectedNode.deptName);
		
		// 부모가 있고, 상위 조직ID가 존재할 경우
		if( selectedNode.isParent && selectedNode.upperDeptId != null ){
			// 부모를 가져오고, 재귀호출
			var parentNode = selectedNode.getParentNode();
			fnGetSelectedDeptParentNodes(parentNode);
		}
	}
	
	/**
	 * 	조직을 선택한다.
	 */
	function fnSelectDept(){
		
		var zTreeObj = $.fn.zTree.getZTreeObj("deptTree");
		
		// zTree에서 현재 선택된 조직을 가져온다.
		var selectedNode = zTreeObj.getSelectedNodes()[0];
		
		// 조직을 선택하지 않을 경우
		if(selectedNode == null){
			jAlert("조직을 선택해주세요", "알림창");
			return false;
		}
		
		// 미사용중인 조직을 선택할 경우
		if(selectedNode.useCd == "02"){
			jAlert("미사용중인 조직은 선택할 수 없습니다.", "알림창");
			return false;
		}
		
		// 선택된 조직의 상위 조직명을 구한다.
		fnGetSelectedDeptParentNodes(selectedNode);
		
		// 선택된 조직부터 최상위 조직까지 조직명이 담긴 배열의 순서를 뒤집는다.
		// (최상위 > 1번 > 2번, 이렇게 선택한 조직명이 맨 마지막에 오도록)
		var deptArr = parentDeptNames.reverse();
		var deptNames = "";
		
		for (var i = 0; i < deptArr.length; i++){
			deptNames += deptArr[i];
			if(i != deptArr.length-1 ){
				deptNames += " > ";
			}
		}

		gfnSelectDeptTree(selectedNode.deptId, deptNames);
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
	    	
	    	// 검색 타입(조직명 또는 비고)과 검색어를 가지고 트리에서 조직 검색
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
	 * 	검색옵션(select) 변경시 이벤트 처리함수
	 */
	function fnChangeElement(searchSelectVal){
		// 전체검색일 경우
		if(searchSelectVal == "all"){
			// 검색 input readonly 처리
			$("#searchTxt").attr("readonly","readonly");
			$("#searchTxt").val("");
		// 조직명 또는 비고 검색일 경우	
		}else{
			// 검색 input readonly 제거 
			$("#searchTxt").removeAttr("readonly");
			$("#searchTxt").val("");
		}
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

	
</script>

<div class="popup">
	
	<div class="pop_title">조직 검색</div>
	<div class="pop_sub" id="pop_sub_wrap">
		<form id="searchDeptFrm"  onsubmit="return false;">
			<div class="pop_top_wrap">
				<div class="searchItem">
					<span class="button_normal2 btn_inquery" id="btn_search_dept_pop"><i class='fa fa-list' aria-hidden='true'></i>&nbsp;검색</span>
				</div>
				<div class="searchItem">
					<input type="text" name="searchTxt" id="searchTxt" title="검색어" value="" readonly="readonly" class="searchInputTextItem">
				</div>
				<div class="searchItem">
					<span class="span_searchSelect">
						<select id="searchSelect" name="searchSelect" style="float: right;">
							<option value="all">전체 보기</option>
							<option value="deptName">조직명</option>
							<option value="deptEtc">비고</option>	
						</select>
					</span>
				</div>
			</div>
		</form>
		<div class="pop_sub">
			<div class="pop_left" id="pop_left_wrap">
	 			<div class="pop_menu_ctrl_wrap">
					<div class="menu_lists_wrap" id="divMenu">
						<ul id="deptTree" class="ztree"></ul>
					</div>
				</div>
			</div>
			<form id="deptInfoForm"  onsubmit="return false;">
				<div class="pop_right" id="pop_right_wrap">
					<div class="pop_left">조직 ID</div>
					<div class="pop_right">
						<input type="text" id="deptId" name="deptId" title="조직 ID" class="input_txt readonly" readonly="readonly">
					</div>
					
					<div class="pop_left">상위 조직 ID</div>
					<div class="pop_right">
						<input type="text" id="upperDeptId" name="upperDeptId" title="상위 조직 ID" class="input_txt readonly" readonly="readonly">
					</div>
					
					<div class="pop_left">조직명</div>
					<div class="pop_right">
						<input type="text" id="deptName" name="deptName" title="조직명" class="input_txt readonly" readonly="readonly" maxlenth="100" >
					</div>
					
					<div class="pop_left">순번</div>
					<div class="pop_right">
						<input type="number" id="ord"  name="ord" min="1"  value="" class="readonly" readonly="readonly">	
					</div>
					
					<div class="pop_left">사용유무</div>
					<div class="pop_right">
						<!-- 
						<input id="available" type="radio" name="useCd"  value="01" disabled="disabled"/><label for="available">사용</label>
						<input id="notAvailable" type="radio" name="useCd" value="02" disabled="disabled"/><label for="notAvailable">미사용</label> 
						-->
						<input type="text" id="useCd" name="useCd" title="사용유무" class="input_txt readonly" readonly="readonly" maxlenth="10" >
					</div>
					
					<div class="pop_left">등록일</div>
					<div class="pop_right">
						<input type="text" id="regDtm"  name="regDtm" value="" class="input_txt readonly" readonly="readonly">	
					</div>
					
					<div class="pop_left textarea_height bottom_line" style="height: 140px; margin-bottom:10px;">비고</div>
					<div class="pop_right bottom_line" style="height: 140px; margin-bottom:10px;">
						<textarea class="input_note readonly" title="비고" id="deptEtc" name="deptEtc" maxlenth="4000" disabled="disabled"></textarea>
					</div>
				</div>
			</form>
		</div>
		
		<div class="btn_div">
			<div class="button_normal save_btn" id="btn_sel_dept" >선택</div>
			<div class="button_normal exit_btn">취소</div>
		</div>
	</div>
</div>	
</html>