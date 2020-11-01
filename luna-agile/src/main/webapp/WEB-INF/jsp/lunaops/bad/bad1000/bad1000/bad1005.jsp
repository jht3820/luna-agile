<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="bad1005Info">
	<div class="kt-portlet kt-portlet--mobile">
		<input type="hidden" name="stmTypeCd" id="stmTypeCd" value="${param.stmTypeCd}" /> 
		<input type="hidden" name="deleteDataList" id="deleteDataList" value='${param.deleteDataList }' /> 
		<input type="hidden" name="menuRootYn" id="menuRootYn" value="${param.menuRootYn }" /> 
		<div class="kt-portlet__body">
			<div class="form-group">
				<label class="required"><span data-lang-cd="bad1005.label.deleteType">삭제 유형</span></label>
				<select class="form-control" style="display: inline-block;" name="delTypeCd" id="delTypeCd">
				</select>
			</div>
			<div class="form-group">
				<label><span data-lang-cd="bad1005.label.deleteReason">삭제 사유</span></label>
				<textarea class="kt-hide" name="delTxt" id="delTxt"></textarea>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-brand" id="bad1005deleteSubmit"><span data-lang-cd="bad1005.button.submit">삭제</span></button>
			<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><span data-lang-cd="modal.close">닫기</span></button>
		</div>
	</div>
</form>
<!-- begin page script -->
<script>
"use strict";

var OSLBad1005Popup = function () {
   	
	var formId = 'bad1005Info';
	
   	var formEditList = [];
 	
	var formValidate = $.osl.validate(formId);
 	
 	var delData = {}
 	
 	var menuRootYn = $("#menuRootYn").val();
 	
    var documentSetting = function () {
    	
    	
    	$("#bad1005deleteSubmit > span").text($.osl.lang("bad1005.button.submit"));
    	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
    	
	   	
	   	var commonCodeArr=[
	   		{mstCd: "BAD00001", useYn: "Y", comboType: "OS", targetObj: "#delTypeCd"}
	   	];
	   	$.osl.getMulticommonCodeDataForm(commonCodeArr, false);
	   	
	   	
	   	formEditList.push($.osl.editorSetting("delTxt", {formValidate: formValidate, 'maxHeight': 150}));
    	$("#delTxt").removeClass("kt-hide");
    	
    	
    	$("#bad1005deleteSubmit").click(function(){
    		delData.delTypeCd = $("#delTypeCd").val();
    		
    		
    		var delTxt = $("#delTxt").val().replace(/(<([^>]+)>)/ig,"").replace(/&nbsp;/g, '').trim();;
    		
    		if( delTxt == "" || delTxt == null ){
    			delData.delTxt = "";
    		}else{
	    		delData.delTxt = $("#delTxt").val();
    		}
    		
    		
    		if(menuRootYn=="N"){
    			var rowData = JSON.parse($("#deleteDataList").val());
    		 	
    		 	
    		 	var delList = [{
    		 		menuId : rowData.menuId,
            		badId : rowData.badId,
            		atchFileId : rowData.atchFileId,
    		 	}];
    		 	
	    		$("#deleteDataList").val(JSON.stringify(delList));
    		}
    		
    		deleteBadList();
    	});
    }
 	
 	var deleteBadList = function(){
 		var data = {
			 deleteDataList : $("#deleteDataList").val(),
			 deleteDataType : JSON.stringify(delData),
			 menuId : $("#menuId").val(),
 		 };
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/bad/bad1000/bad1000/deleteBad1000BadListAjax.do'/>"}
				, data);
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);
  				
   				
   				$.osl.layerPopupClose();
				
   				if($("#stmTypeCd").val()=="01"||$("#stmTypeCd").val()=="02"){
	   				
	   				$("button[data-datatable-id=bad1000BadTable][data-datatable-action=select]").click();
				}else{
		   			
	   				OSLBad1006Popup.reload();
				}
				
				
   				if(menuRootYn=="N"){
   					$.osl.layerPopupClose();
   				}
   			}
		});
		
		
		ajaxObj.send();
	};
	
    return {
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLBad1005Popup.init();
});
</script>