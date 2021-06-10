<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" id="usrId" name="usrId" value="<c:out value='${param.paramUsrId}' escapeXml='false'/>" />
<input type="hidden" id="prjNm" name="prjNm" value="<c:out value='${param.paramPrjNm}' escapeXml='false'/>" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__body">
		<div class="col-lg-8 col-md-8 col-sm-12 m-auto kt-margin-t-15">
			<div class="osl-datatable-search" data-datatable-id="cmm17000PrjTable"></div>
		</div>
		<div class="kt-datatable" id="cmm17000PrjTable"></div>
		<button type="button" class="btn btn-sm kt-margin-0 kt-padding-0 osl-width-0 invisible" id="selectPrj"/>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLCmm17000Popup = function () {
	var temp;
    var documentSetting = function () {
    	
		var datatableId = "cmm17000PrjTable";
    	var prjNm = $.osl.escapeHtml($("#prjNm").val());
    	
    	//데이터 테이블 셋팅
    	$.osl.datatable.setting(datatableId,{
    		data : {
    			source:{
    				read:{
    					url:"/cmm/cmm10000/cmm17000/selectCmm17000PrjListAjax.do",
    					params:{
    						searchDataTxt : prjNm
    					}
    				}
    			}
    		},
    		columns:[
    			{field: 'rn', title:"No.", textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'upPrjNm', title: '프로젝트 그룹 명', textAlign: 'left', width: 150, search: true, sortable: false},
				{field: 'prjId', title: '프로젝트 Id', textAlign: 'center', width: 150, search: true},
				{field: 'prjNm', title: '프로젝트 명', textAlign: 'left', width: 150, search: true, sortable:false},
				{field: 'startDt', title: '프로젝트 시작일', textAlign: 'left', width: 150, search: true, sortable: true, searchType:"date"},
				{field: 'endDt', title: '프로젝트 종료일', textAlign: 'left', width: 150, sortable: true, search: true, searchType:"date"},
    		],
    		actionBtn:{
    			title : $.osl.lang("cmm17000.actionBtn.title"),
    			width : 80,
    			"update" : false,
    			"delete" : false,
    			"click": true,
    		},
    		actionTooltip:{
    			"click": $.osl.lang("cmm17000.actionBtn.clickBtn"),
    		},
    		actionFn:{
    			"click":function(rowData){
    				temp = rowData;
    				updateMainPrj(temp.prjId);
    				$("#selectPrj").click();
    			}
    		},
    		theme:{
    			actionBtnIcon:{
    				"click": "fa flaticon2-check-mark",
    			}
    		}
    	});
    	
    	//초기 한번 - 넘어온 값이 있는 경우
    	if(prjNm != ""){
    		
    		//드롭다운 메뉴 선택 활성화 취소 및 재선택
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=prjNm]").attr("class", "dropdown-item active");
			
			//검색 메뉴 버튼 변경
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text($.osl.lang("cmm17000.field.prjNm"));
		
			//select 감추기
			$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
			$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
			
			//input 보이기
			$("#searchData_"+datatableId).removeAttr("disabled");
			//input에 이름넣기
			$("#searchData_"+datatableId).val(prjNm);

			//파라메터 초기화
			var detailDataTable = $.osl.datatable.list[datatableId].targetDt;
			detailDataTable.setDataSourceParam("searchDataTxt","");
			
    	} 
    	
    	$("#searchData_"+datatableId).on("keypress", function(e){
    		if(e.key == "Enter"){
    			//검색
    			$(".osl-datatable-search__button[data-datatable-id="+datatableId+"]").click();	
    		}
    	});
    	
    	$("#selectPrj").click(function(){
    		$.osl.layerPopupClose();
    	}); 
    };
    var updateMainPrj = function(_prjId){
    		var data = {
    				prjId : _prjId
    		}
    		
    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/cmm/cmm10000/cmm17000/updateCmm17000UsrMainPrjAjax.do'/>"}, data);

       		//AJAX 전송 성공 함수
       		ajaxObj.setFnSuccess(function(data){
       			if(data.errorYn == "Y"){
       				$.osl.alert(data.message,{type: 'error'});
       			}else{
       				//수정 성공
       				$.osl.toastr(data.message);

       				//모달 창 닫기
       				$.osl.layerPopupClose();
       			}
       		});
       		
       		//AJAX 전송
       		ajaxObj.send();

    }
    return {
        // public functions
        init: function() {
        	documentSetting();
        },
        getPrjInfo: function(){
        	return temp.prjNm;//선택한 메인프로젝트명
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLCmm17000Popup.init();
});

	
</script>