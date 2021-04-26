<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" id="paramReqGrpNm" name=""paramReqGrpNm"" value="<c:out value='${param.reqGrpNm}' escapeXml='false'/>" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__body">
		<div class="col-lg-8 col-md-8 col-sm-12 m-auto kt-margin-t-15">
			<div class="osl-datatable-search" data-datatable-id="req4105ReqGrpTable"></div>
		</div>
		<div class="kt-datatable" id="req4105ReqGrpTable"></div>
		<button type="button" class="btn btn-sm kt-margin-0 kt-padding-0 osl-width-0 invisible" id="selectReqGrp"/>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLReq4105Popup = function () {
	var temp;
    var documentSetting = function () {
		var datatableId = "req4105ReqGrpTable";
    	var name = $.osl.escapeHtml($("#paramReqGrpNm").val());
    	
    	//데이터 테이블 셋팅
    	$.osl.datatable.setting(datatableId,{
    		data:{
				source:{
					read:{
						url:"/req/req4000/req4100/selectReq4105ReqGrpListAjax.do",
    					params:{
    						searchDataTxt : name,
    					}
					}
				}
			},
			columns : [
				{field: 'rn', title:"No.", textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'reqGrpNm', title: '그룹 요구사항 명', textAlign: 'left', width: 150, search: true, sortable: false,searchOrd: 1},
				{field: 'reqGrpLinkCnt', title: '연결 요구사항 수', textAlign: 'center', width: 150, search: false,
					template: function (row) {
						var reqGrpLinkCnt = row.reqGrpLinkCnt;
						if(reqGrpLinkCnt == 0){
							reqGrpLinkCnt = "0";
						}
						return reqGrpLinkCnt;
					},
				},
				{field: 'reqGrpUsrNm', title: '요청자 명', textAlign: 'left', width: 150, search: true, sortable:false,searchOrd: 2,
					template: function (row) {
						return $.osl.user.usrImgSet(row.reqUsrImgId, row.reqGrpUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.reqGrpUsrId);
					}
				},
				{field: 'reqGrpUsrEmail', title: '요청자 e-mail', textAlign: 'left', width: 150, search: true, sortable: true,searchOrd: 3},
				{field: 'reqGrpUsrDeptNm', title: '요청자 조직', textAlign: 'left', width: 300, sortable: false, search: false},
				{field: 'reqGrpUsrNum', title: '요청자 연락처', textAlign: 'left', width: 100, search: true, sortable: false, search: true,searchOrd: 4},
				{field: 'regGrpChargerNm', title: '담당자 명', textAlign: 'left', width: 150, search: true,sortable: false,searchOrd: 5,
					template: function (row) {
						return $.osl.user.usrImgSet(row.reqGrpChargerImgId, row.reqGrpChargerNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.reqGrpChargerId);
					}
				},
				{field: 'regDtmDay', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"daterange",searchOrd:10}
			],
			searchColumns:[
				{field: 'reqGrpChargerEmail', title: '담당자 EMAIL', searchType:"text",searchOrd: 6},
				{field: 'reqGrpChargerNum', title: '담당자 연락처', searchType:"text",searchOrd: 7},
				{field: 'reqGrpKey', title: '그룹 요구사항 Key', searchType:"text",searchOrd: 8},
				{field: 'useCD', title: '사용유무', searchType:"select", searchCd:"CMM00001",searchOrd: 9},
			],
    		actionBtn:{
    			title : $.osl.lang("req4103.actionBtn.title"),
    			width : 80,
    			"update" : false,
    			"delete" : false,
    			"click": true,
    		},
    		actionTooltip:{
    			"click": $.osl.lang("req4103.actionBtn.clickBtn"),
    		},
    		actionFn:{
    			"click":function(rowData){
    				temp = rowData;
    				$("#selectReqGrp").click();
    			}
    		},
    		theme:{
    			actionBtnIcon:{
    				"click": "fa flaticon2-check-mark",
    			}
    		}
    	});
    	
    	//초기 한번 - 넘어온 값이 있는 경우
    	if(name != ""){
    		//드롭다운 메뉴 선택 활성화 취소 및 재선택
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=reqGrpNm]").attr("class", "dropdown-item active");
			
			//검색 메뉴 버튼 변경
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text($.osl.lang("req4105.field.reqGrpNm"));
		
			//select 감추기
			$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
			$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
			
			//input 보이기
			$("#searchData_"+datatableId).removeAttr("disabled");
			//input에 이름넣기
			$("#searchData_"+datatableId).val(name);

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
    	
    	$("#selectReqGrp").click(function(){
    		$.osl.layerPopupClose();
    	});
    };
    
    return {
        // public functions
        init: function() {
        	documentSetting();
        },
        getReqGrpInfo: function(){
        	return JSON.stringify(temp);//선택한 그룹요구사항 정보
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLReq4105Popup.init();
});

	
</script>