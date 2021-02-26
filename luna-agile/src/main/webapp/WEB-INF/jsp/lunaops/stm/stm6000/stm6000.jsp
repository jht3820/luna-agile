<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="row">
	<div class="col-xl-4">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm6000.title.deptList">조직 목록</span>
					</h4>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
						<div class="kt-portlet__head-group">
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-title-lang-cd="tree.label.contextmenu.allNodeOpen" data-tree-id="stm6000DeptTree" data-tree-action="allNodeOpen">
								<i class="fa fa-plus"></i>
							</a>
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-title-lang-cd="tree.label.contextmenu.allNodeClose" data-tree-id="stm6000DeptTree" data-tree-action="allNodeClose">
								<i class="fa fa-minus"></i>
							</a>
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md">
								<i class="la la-angle-down"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-12">
						<div class="osl-tree-search" data-tree-id="stm6000DeptTree"></div>
					</div>
				</div>
				<div class="kt-separator kt-separator--space-sm kt-separator--border-solid"></div>
				<div class="row">
					<div class="col-12">
						<div class="osl-tree kt-scroll" data-height="410" id="stm6000DeptTree"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-8 ">
		<div class="kt-portlet kt-portlet--mobile" id="stm6000DeptTreeInfo">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm6000.title.deptInfo">조직 정보</span>
					</h4>
				</div>
				<div class="kt-portlet__head-toolbar">
					<!-- begin::조직 버튼 영역 -->
					<div class="kt-portlet__head-wrapper kt-margin-r-10">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-tree-id="stm6000DeptTree" data-tree-action="select" title="조직 조회" data-title-lang-cd="stm6000.button.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-tree-id="stm6000DeptTree" data-tree-action="insert" title="조직 추가" data-title-lang-cd="stm6000.button.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
							<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-tree-id="stm6000DeptTree" data-tree-action="update" title="조직 수정" data-title-lang-cd="stm6000.button.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
							<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-tree-id="stm6000DeptTree" data-tree-action="delete" title="조직 삭제" data-title-lang-cd="stm6000.button.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
							<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
						</button>
					</div>
					<!-- end::조직 버튼 영역 -->
				</div>
			</div>
			<div class="kt-portlet__body">
				<form class="kt-form" id="frStm6000">
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="stm6000.label.upperDeptId">상위 조직 ID</span></label>
								<input type="text" class="form-control" placeholder="상위 조직 ID" name="upperDeptId" id="upperDeptId" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6000.label.upperDeptNm">상위 조직 명</span></label>
								<input type="text" class="form-control" placeholder="상위 조직 명" name="upperDeptNm" id="upperDeptNm" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="stm6000.label.deptId">조직 ID</span></label>
								<input type="text" class="form-control" placeholder="조직 ID" id="deptId" name="deptId" readonly="readonly" >
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6000.label.deptNm">조직명</span></label>
								<input type="text" class="form-control" placeholder="조직 명" name="deptName" id="deptName" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="stm6000.label.deptOrd">순번</span></label>
								<input type="text" class="form-control" placeholder="순번" name="ord" id="ord" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="stm6000.label.deptUseCd">사용유무</span></label>
								<input type="text" class="form-control" placeholder="사용유무"  name="useNm" id="useNm" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6000.label.deptEtc">비고</span></label>
						<div class="form-control h-100 osl-min-height--12rem" id="deptEtc"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var treeObj;
var OSLStm6000Popup = function () {
	
	var formId = "frStm6000";
	
	var documentSetting = function(){
  		
		// 조직 tree 세팅
		treeObj = $.osl.tree.setting("stm6000DeptTree",{
			data:{
				url:"<c:url value='/stm/stm6000/stm6000/selectStm6000DeptListAjax.do'/>",
				key: "deptId",
				pKey: "upperDeptId",
				labelKey: "deptName"
			},
			search:{
				//대소문자 구분
				case_insensitive : true,
				//검색 결과 노드만 표시
				show_only_matches: true,
				//show_only_matches: true 일때 하위 노드도 같이 표시 할건지
				show_only_matches_children: true,
			},
			callback:{
				onclick: function(treeObj,selNode){
					// 조직 단건 조회
					selectDeptInfo(selNode.original.deptId);
				},
				init: function(treeObj,data){
					//console.log(treeObj,data);
				}
			}
		});
		
		//퍼펙트 스크롤 적용
		KTUtil.scrollInit($("#stm6000DeptTree")[0], {
	        disableForMobile: true, 
	        resetHeightOnDestroy: true, 
	        handleWindowResize: true, 
	        height: 410
	    });
		
		// (임시) 버튼클릭 이벤트  - 등록, 수정, 삭제 
		// tree 외부 action button 추가 후 변경
		$("#stm6000DeptTreeInfo").find("button[data-tree-id='stm6000DeptTree']").click(function(){
			
			// 각 action 동작
			var action = $(this).data("tree-action");
			if(action != "select"){
				
				var selectNodeIds = treeObj.jstree("get_selected");
				if($.osl.isNull(selectNodeIds)){
					$.osl.alert($.osl.lang("stm6000.message.alert.treeSelect"));
					return false;
				}
				
				// 선택노드
				var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
				var nodeData = selectNode.original;
				
				// 조직등록
				if(action == "insert"){
					
					// 선택한 조직이 미사용일경우
					if(nodeData.useCd == "02"){
						$.osl.alert($.osl.lang("stm6000.message.alert.notUsedDept"));
						return false;
					}
					
					// 등록 팝업 호출
					var data = {
							type:"insert",
							upperDeptId : nodeData.deptId,
							upperDeptNm : nodeData.deptName,
							lvl : nodeData.lvl
					};
					var options = {
							idKey: nodeData.deptId,
							modalTitle: $.osl.lang("stm6000.modal.title.insertDept"),
							autoHeight:false,
							closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/stm/stm6000/stm6000/selectStm6001View.do',data,options);
					
				// 조직 수정	
				}else if(action == "update"){
					
					// 수정 팝업 호출
					var data = {
							type:"update",
							deptId : nodeData.deptId
					};
					var options = {
							idKey: nodeData.deptId,
							modalTitle: $.osl.lang("stm6000.modal.title.updateDept"),
							closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/stm/stm6000/stm6000/selectStm6001View.do',data,options);
					
				// 조직 삭제	
				}else if(action == "delete"){
					
					// root 삭제불가
					if(nodeData.lvl == 0 || $.osl.isNull(nodeData.upperDeptId)){
						$.osl.alert($.osl.lang("stm6000.message.alert.notRootDelete"));
					}else{
						// 조직 삭제
						deleteDeptList(nodeData, selectNode.children_d);
					}
				}
			}
		
		});
		
	};
	
    /**
	 * function 명 	: selectDeptInfo
	 * function 설명	: 선택한 조직의 상세정보를 조회하여 화면에 세팅한다.
	 * @param deptId : 선택한 조직 ID
	 */
	var selectDeptInfo = function(deptId) {
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm6000/stm6000/selectStm6000DeptInfoAjax.do'/>", "async": false}
				,{"deptId": deptId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				$("#"+formId)[0].reset();
				
				// 조직 정보 세팅
		    	$.osl.setDataFormElem(data.deptInfoMap,"frStm6000", ["deptId", "upperDeptId", "upperDeptNm", "deptName", "useNm", "ord"]);
			
		    	var deptEtc = data.deptInfoMap.deptEtc;
				
				// 상위조직 Id 없을경우
				if($.osl.isNull(data.deptInfoMap.upperDeptId)){
					$("#upperDeptId").val("-");
				}
				
				// 상위조직 명 없을경우
				if($.osl.isNull(data.deptInfoMap.upperDeptNm)){
					$("#upperDeptNm").val("-");
				}
				
				if(!$.osl.isNull(deptEtc)){
					deptEtc =  $.osl.escapeHtml(deptEtc);
			    	// 비고 값 div영역에 세팅
					$("#deptEtc").html(deptEtc.replace(/\n/g, '<br/>'));
				}
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};

    /**
	 * function 명 	: deleteDeptList
	 * function 설명	: 선택한 조직 및 하위 조직을 모두 삭제한다.
	 * @param selectNodeData : 선택한 조직 노드 데이터
	 * @param childrenIds : 선택한 조직 노드의 자식 노드 id 배열
	 */
	var deleteDeptList = function(selectNodeData, childrenIds){
		
		// 삭제할 조직 목록
		var delDeptList = [];
		
		// 선택한 조직 정보 추가
		delDeptList.push({"deptId":selectNodeData.deptId, "upperDeptId":selectNodeData.upperDeptId, "deptName":selectNodeData.deptName});

		// 자식 노드 loop
		$.each(childrenIds, function(idx, treeNodeId){
			// 삭제시 필요한 정보 세팅
			var childNodeData = treeObj.jstree().get_node(treeNodeId).original;
			delDeptList.push({"deptId":childNodeData.deptId, "upperDeptId":childNodeData.upperDeptId, "deptName":childNodeData.deptName});
		});
		
		//$.osl.confirm("조직 삭제 시 선택한 조직 및 하위 조직 모두 삭제됩니다. 선택한 조직을 삭제 하시겠습니까?",null,function(result) {
		$.osl.confirm($.osl.lang("stm6000.message.confirm.deleteDept"),null,function(result) {
	        if (result.value) {
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/stm/stm6000/stm6000/deleteStm6000DeptInfoAjax.do'/>"}
					,{deleteDataList: JSON.stringify(delDeptList)});

	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    			// 사용자 배정된 조직 있을경우	
	    			}else if(data.checkYn == "Y"){

	    				// 사용자가 배정된 조직 목록을 문자열로 만든다.
	    				var deptNmStr = "";
	    				
	    				if(!$.osl.isNull(data.result.resultData)){
		    				$.each(data.result.resultData, function(idx, deptNm){
		    					deptNmStr += deptNm + ", ";
		    				});
		    				
		    				deptNmStr = deptNmStr.substring(0, deptNmStr.lastIndexOf(","));
	    				}
	    				
	    				// 메시지 출력
	    				$.osl.alert(data.result.message, {text:deptNmStr, type:"warning"});
	    			}else{
	    				//삭제 성공
	    				$.osl.toastr(data.message);
	    				
	    				// 삭제 후 우측 상세정보 초기화
	    				$("#"+formId)[0].reset();
	    				
	    				// 트리 재조회 추가
	    			}
	    		});
	    		
	    		//AJAX 전송
	    		ajaxObj.send();
	        }
	    });
		 
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLStm6000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />