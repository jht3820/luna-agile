<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm1200">
	<input type="hidden" name="paramDeptNm" id="paramDeptNm" value="${param.deptName}">
	<div class="row">
		<div class="col-xl-5">
			<div class="kt-portlet kt-portlet--mobile" id="cmm1200DeptTreeList">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h4 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>조직 목록
						</h4>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md" data-toggle="kt-tooltip" title="전체 펼치기" data-tree-id="cmm1200DeptTree" data-tree-action="allNodeOpen"><i class="fa fa-plus"></i></a>
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md" data-toggle="kt-tooltip" title="전체 접기" data-tree-id="cmm1200DeptTree" data-tree-action="allNodeClose"><i class="fa fa-minus"></i></a>
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-12">
							<div class="osl-tree-search" data-tree-id="cmm1200DeptTree"></div>
						</div>
					</div>
					<div class="kt-separator kt-separator--space-sm kt-separator--border-solid"></div>
					<div class="row">
						<div class="col-12">
							<div class="osl-tree" id="cmm1200DeptTree"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-7">
			<div class="kt-portlet kt-portlet--mobile" id="cmm1200DeptTreeInfo">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h4 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>조직 정보
						</h4>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="form-group">
						<label><i class="fa fa-align-left kt-margin-r-5"></i>상위 조직 ID</label>
						<input type="text" class="form-control" placeholder="상위 조직 ID" name="upperDeptId" id="upperDeptId" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>상위 조직 명</label>
						<input type="text" class="form-control" placeholder="상위 조직 명" name="upperDeptNm" id="upperDeptNm" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-align-left kt-margin-r-5"></i>조직 ID</label>
						<input type="text" class="form-control" placeholder="조직 ID" name="deptId" id="deptId" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>조직 명</label>
						<input type="text" class="form-control" placeholder="조직 명" name="deptName" id="deptName" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
						<input type="text" class="form-control" placeholder="순번" name="ord" id="ord" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
						<input type="text" class="form-control" placeholder="사용유무" name="useNm" id="useNm" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>비고</label>
						<div class="form-control h-100 osl-min-height--9rem" id="deptEtc"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="cmm1200SelDept">조직 선택</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>
<script>
"use strict";
var OSLCmm1200Popup = function () {
	var formId = 'frCmm1200';
	// 선택한 조직 정보
	var selDeptInfo;
	
    // Private functions
    var documentSetting = function () {
    
    	// Portlet 생성
    	new KTPortlet('cmm1200DeptTreeList', $.osl.lang("portlet"));
    	new KTPortlet('cmm1200DeptTreeInfo', $.osl.lang("portlet"));
    	
    	var treeObj = $.osl.tree.setting("cmm1200DeptTree",{
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
					
					selDeptInfo = selNode.original;
					// 클릭한 조직 정보 조회
					selectDeptInfo(selNode.original.deptId);
					// 상위조직명을 문자열 생성
					var upperDeptNm = getUpperDeptNm(treeObj, selNode);
					
					// 조직선택 버튼에 조직ID, 상위조직명을 data로 세팅
					$("#cmm1200SelDept").attr("data-dept-id", selDeptInfo.deptId);
   	    			$("#cmm1200SelDept").attr("data-dept-nm", upperDeptNm);
				},
				init: function(treeObj, data){
					
					// 검색어 있을 경우
					var searchDeptNm = $.trim($("#paramDeptNm").val());
					if(!$.osl.isNull(searchDeptNm)){
						// 검색어 세팅
						$('.osl-tree-search input[data-tree-id="cmm1200DeptTree"]').val(searchDeptNm);
						// 검색버튼 클릭
						$('.osl-tree-search__button[data-tree-id="cmm1200DeptTree"]').click();
					}
					
				}
			}
		});
    	
    	// 조직선택 버튼 클릭
    	$("#cmm1200SelDept").click(function(){
    		if($.osl.isNull(selDeptInfo)){
    			$.osl.alert("왼쪽 트리에서 조직을 선택하세요.");
    		}else{
    			$.osl.layerPopupClose();
    		}
    	});

    };

    
    /**
	 * function 명 	: getUpperDeptNm
	 * function 설명	: 선택한 조직의 상위조직명을 포함하는 조직명 문자열을 만든다.
	 * @param treeObj : jstree object
	 * @param treeNode : 트리에서 선택한 조직 노드
	 * @return : 상위조직명을 포함한 조직명 문자열 (ex. 전체 > 오픈소프트랩 > 부설연구소)
	 */
    var getUpperDeptNm = function(treeObj, treeNode){
    	
    	var deptNmStr = "";
    	// 선택한 노드를 포함한 상위조직 명 배열
    	var upperDeptNmList = treeObj.jstree().get_path(treeNode.id);
		
    	// 배열 loop 하여  선택한 조직의 상위조직명 문자열을 만든다. (ex. 전체 > 오픈소프트랩 > 부설연구소)
    	$.each(upperDeptNmList, function(idx, deptNm){
    		deptNmStr += deptNm;
    		if(idx != upperDeptNmList.length-1){
    			deptNmStr += " > ";
    		}
    	});
    	
    	return deptNmStr;
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
				,{"deptId": deptId, "view":"cmm1200"});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				
				// 조직 정보 세팅
		    	$.osl.setDataFormElem(data.deptInfoMap,"frCmm1200", ["deptId", "upperDeptId", "upperDeptNm", "deptName", "useNm", "ord"]);
				
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
    	
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLCmm1200Popup.init();
});

	

</script>