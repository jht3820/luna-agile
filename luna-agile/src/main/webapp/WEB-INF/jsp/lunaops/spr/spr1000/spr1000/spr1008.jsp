<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" id="sprId" name="sprId" value="${param.paramSprId}" />
<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portelt__body">
			<div class="col-lg-8 col-md-8 col-sm-12 m-auto kt-margin-t-15">
				<div class="osl-datatable-search" data-datatable-id="spr2100RptTable"></div>
			</div>
			<div class="kt_datatable osl-datatable-footer__divide" id="spr2100RptTable"></div>
		</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLSpr1008Popup = function () {
    var documentSetting = function () {
    	
		var datatableId = "spr2100RptTable";
    	var sprId = $("#sprId").val();

		//회고록 목록 테이블 세팅
		$.osl.datatable.setting(datatableId,{
			data:{
				source:{
					read:{
						url: "/spr/spr2000/spr2100/selectSpr2100MmrListAjax.do",
						params:{
							sprId: sprId,
						}
					}
				},
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 80, sortField: "rn"},
				{field: 'mmrNm', title: '회고록 제목', textAlign: 'left', width: 80, search:true},
				{field: 'mmrUsrNm', title: '작성자', textAlign: 'left', width: 80, search:true,
					template: function (row) {
						if($.osl.isNull(row.mmrUsrId)){
							return "";
						}else{
							var usrData = {
									html: row.mmrUsrNm,
									imgSize: "sm",
									class:{
										cardBtn: "osl-width__fit-content"
									}
							};
							return $.osl.user.usrImgSet(row.mmrUsrImgId, usrData);
						}
					},
					onclick: function(row){
						$.osl.user.usrInfoPopup(row.mmrUsrImgId);
					}	
				},
				{field: 'mmrDtm', title: '작성일', textAlign: 'center', width: 120, sortField: "reqDtm", search:true, searchType:"daterange",
					template: function (row) {
						var paramDatetime = new Date(row.mmrDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			actionBtn:{
				"title": $.osl.lang("spr2100.actionBtn.title"),
				"dblClick": true,
			},
			actionTooltip:{
				"update": $.osl.lang("spr2100.actionBtn.updateTooltip"),
				"delete" : $.osl.lang("spr2100.actionBtn.deleteTooltip"),
				"dblClick" : $.osl.lang("spr2100.actionBtn.detailTooltip")
			},
			actionFn:{
				"insert":function(rowData){
					if($.osl.isNull($("#sprId").val())){
						//스프린트를 선택하지 않았으면
						$.osl.alert($.osl.lang("spr2100.message.selectMsg"));
						return false;
					}
					var data = {
						type: "insert",
						sprId : $("#sprId").val(),
						sprNm : $("#sprNm").val(),
					};
					var options = {
						idKey: "spr2101_insert",
						modalTitle: "[ "+$.osl.lang("spr2100.title.insertTitle")+" ]",
						closeConfirm: true,
						autoHeight: false,
						modalSize: "xl",
					};
					$.osl.layerPopupOpen('/spr/spr2000/spr2100/saveSpr2101MmrView.do',data,options);
				},
				"update":function(rowData){
					var data = {
							type: "update",
							mmrId : rowData.mmrId,
							sprId : rowData.sprId
						};
						var options = {
							idKey: "spr2101_update",
							modalTitle: "[ "+$.osl.lang("spr2100.title.updateTitle")+" ]",
							closeConfirm: true,
							autoHeight: false,
							modalSize: "xl",
						};
						$.osl.layerPopupOpen('/spr/spr2000/spr2100/saveSpr2101MmrView.do',data,options);
				},
				"delete":function(rowData){
					var data = {
						dataList : JSON.stringify(rowData)
					};
					//AJAX 설정
			    	var ajaxObj = new $.osl.ajaxRequestAction(
			    			{"url":"<c:url value='/spr/spr2000/spr2100/deleteSpr2100MmrListAjax.do'/>"}
			    				, data);
					//AJAX 전송 성공 함수
			    	ajaxObj.setFnSuccess(function(data){
			    		if(data.errorYn == "Y"){
							$.osl.alert(data.message,{type: 'error'});
							//모달 창 닫기
							$.osl.layerPopupClose();
						}else{
							$.osl.toastr(data.message);
							selectBtnClick();
						}
			    	});
			    	//AJAX 전송
					ajaxObj.send();
				},
				"dblClick": function(rowData){
					var data = {
							type: "update",
							mmrId : rowData.mmrId,
							sprId : rowData.sprId
						};
					var options = {
						idKey: "spr2101_detail",
						modalTitle: "[ "+$.osl.lang("spr2100.title.detailTitle")+" ]",
						closeConfirm: true,
						autoHeight: false,
						modalSize: "xl",
					};
					$.osl.layerPopupOpen('/spr/spr2000/spr2100/selectSpr2102View.do',data,options);
				}
			},
		});
	}
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLSpr1008Popup.init();
});
	
</script>