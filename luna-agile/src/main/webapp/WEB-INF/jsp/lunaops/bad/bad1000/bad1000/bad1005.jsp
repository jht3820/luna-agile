<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form class="kt-form" id="bad1005Info">
	<div class="kt-portlet kt-portlet--mobile">
		<input type="hidden" name="stmTypeCd" id="stmTypeCd" value="${param.stmTypeCd}" /> 
		<input type="hidden" name="deleteDataList" id="deleteDataList" value='${param.deleteDataList }' /> 
		<input type="hidden" name="menuRootYn" id="menuRootYn" value="${param.menuRootYn }" /> 
		<div class="kt-portlet__body">
			<div class="form-group">
				<label class="required">삭제 유형</label>
				<select class="form-control" style="display: inline-block;" name="delTypeCd" id="delTypeCd">
				</select>
			</div>
			<div class="form-group">
				<label>삭제 사유</label>
				<textarea class="kt-hide" name="delTxt" id="delTxt"></textarea>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-brand" id="bad1005deleteSubmit">삭제</button>
			<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
		</div>
	</div>
</form>
<!-- begin page script -->
<script>
"use strict";

var OSLBad1005Popup = function () {
   	
	var formId = 'bad1005Info';
	// edit 목록
   	var formEditList = [];
 	// form validate 주입
	var formValidate = $.osl.validate(formId);
 	//삭제 사유 data
 	var delData = {}
 	//메뉴에서 접근한 건지 확인하기 위한 변수
 	var menuRootYn = $("#menuRootYn").val();
 	
    var documentSetting = function () {
	   	//select box 세팅
	   	var commonCodeArr=[
	   		{mstCd: "BAD00001", useYn: "Y", comboType: "OS", targetObj: "#delTypeCd"}
	   	];
	   	$.osl.getMulticommonCodeDataForm(commonCodeArr, false);
	   	
	   	//edit 세팅
	   	formEditList.push($.osl.editorSetting("delTxt", {formValidate: formValidate, 'maxHeight': 150}));
    	$("#delTxt").removeClass("kt-hide");
    	
    	//삭제버튼 클릭
    	$("#bad1005deleteSubmit").click(function(){
    		delData.delTypeCd = $("#delTypeCd").val();
    		
    		//빈 값만 넣을 경우 불필요한 테그 데이터 지우기
    		var delTxt = $("#delTxt").val().replace(/(<([^>]+)>)/ig,"").replace(/&nbsp;/g, '').trim();;
    		
    		if( delTxt == "" || delTxt == null ){
    			delData.delTxt = "";
    		}else{
	    		delData.delTxt = $("#delTxt").val();
    		}
    		
    		//메뉴에서 삭제를 누른 것이 아니라면(상세보기에서 게시글 삭제 클릭 시)
    		if(menuRootYn=="N"){
    			var rowData = JSON.parse($("#deleteDataList").val());
    		 	//메뉴에서 접근을 안할 경우 사용할 deleteDataList
    		 	//seviceImple에서 JSONArray로 parse하므로 [] 형태로 감쌀것.
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
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/bad/bad1000/bad1000/deleteBad1000BadListAjax.do'/>"}
				, data);
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//삭제 성공
   				$.osl.toastr(data.message);
  				
   				//모달 창 닫기
   				$.osl.layerPopupClose();
				
   				if($("#stmTypeCd").val()=="01"||$("#stmTypeCd").val()=="02"){
	   				//datatable 조회
	   				$("button[data-datatable-id=bad1000BadTable][data-datatable-action=select]").click();
				}else{
		   			//목록 재조회
	   				OSLBad1006Popup.reload();
				}
				
				//상세보기에서 접근 시 게시글 팝업창도 닫음
   				if(menuRootYn=="N"){
   					$.osl.layerPopupClose();
   				}
   			}
		});
		
		//AJAX 전송
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