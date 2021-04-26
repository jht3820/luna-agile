<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1200PrjTable" data-datatable-action="select" title="데이터 조회" data-title-lang-cd="datatable.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1200PrjTable" data-datatable-action="update" title="데이터 수정" data-title-lang-cd="datatable.button.title.update" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-12">
				<div class="osl-datatable-search" data-datatable-id="prj1200PrjTable"></div>
			</div>
		</div>
		<div class="kt_datatable" id="prj1200PrjTable"></div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLPrj1200Popup = function () {
	var documentSetting = function(){
		$.osl.datatable.setting("prj1200PrjTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1200/selectPrj1200ListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjSetTargetNm', title: '대상', textAlign: 'center', width: 150, search: true, searchType:"select", searchCd: "PRJ00017", searchField:"prjSetTarget", sortField: "prjSetTarget"},
				{field: 'prjSetNm', title: '설정명', textAlign: 'left', width: 150, search: true},
				{field: 'prjSetDesc', title: '설정설명', textAlign: 'center', width: 200, autoHide: false},
				{field: 'prjSetValNm', title: '설정 값', textAlign: 'center', width: 100, autoHide: false},
				{field: 'modifyDtmDay', title: '수정일시', textAlign: 'center', width: 100},
				{field: 'modifyUsrNm', title: '최종 수정자', textAlign: 'center', width: 100}
				
			],
			rows:{
				clickCheckbox: true
			},
			actionBtn:{
				"delete": false,
				"title": $.osl.lang("datatable.action.functionNm"),
				"width": 100,
				/* ,"click": true */
			},
			actionTooltip:{
				"update": $.osl.lang("prj1201.actionBtn.updateBtn")
			},
			actionFn:{
				"update":function(rowData, datatableId, type, rowNum, elem){
					//최초 등록인지 수정인지 확인 값
					var newSetYn = 'Y';
					if(null != rowData.prjId){
						newSetYn = 'N';
					}
					
					var data = {
							type:"update",
							paramPrjId: rowData.prjId,
							paramPrjSetId: rowData.prjSetId,
							paramValType: rowData.valType,
							paramNewSetYn: newSetYn
						};
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("prj1201.title"),
							closeConfirm: false,
							autoHeight: false
						};
					
					$.osl.layerPopupOpen('/prj/prj1000/prj1200/selectPrj1201View.do',data,options);
				}
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
	OSLPrj1200Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
