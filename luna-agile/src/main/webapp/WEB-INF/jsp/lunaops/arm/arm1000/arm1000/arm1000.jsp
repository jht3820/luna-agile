<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="cmm16000.label.title">MESSAGE</span>
			</h4>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-3 col-md-4 col-sm-4 col-4">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa flaticon2-send-1kt-margin-r-5"></i><span data-lang-cd="cmm16000.label.title">MESSAGE</span>
					</h5>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div id="menuTypeGet">
					<h5>
						<i class="fa flaticon2-new-email kt-margin-r-5"></i>
						<span data-lang-cd="cmm16000.label.get">받은 메시지</span>
					</h5>
					<span class="kt-margin-l-5 kt-margin-r-5" id="getAllCnt" name="getAllCnt">
						<span class='kt-badge kt-badge--metal kt-badge--inline kt-margin-10 kt-padding-10 kt-hide' id="notReadGetCnt" name="notReadGetCnt">0</span>
						<span id="getCnt" name="getCnt"></span>
					</span>
				</div>
				<div id="menuTypeSend">
					<h5>
						<i class="fa flaticon2-mail-1  kt-padding-t-5 kt-margin-r-5"></i>
						<span data-lang-cd="cmm16000.label.send">보낸 메시지</span>
					</h5>
					<span class="kt-margin-l-5 kt-margin-r-5" id="sendAllCnt" name="sendAllCnt">
						<span id="sendCnt" name="sendCnt"></span>
					</span>
				</div>
				<div id="menuTypeAlone">
					<h5>
						<i class="fa flaticon2-writing kt-margin-r-5"></i>
						<span data-lang-cd="cmm16000.label.alone">나에게 보낸 메시지</span>
					</h5>
					<span class="kt-margin-l-5 kt-margin-r-5" id="aloneAllCnt" name="aloneAllCnt">
						<span class='kt-badge kt-badge--metal kt-badge--inline kt-margin-10 kt-padding-10 kt-hide' id="notReadAloneCnt" name="notReadAloneCnt">0</span>
						<span id="aloneCnt" name="aloneCnt"></span>
					</span>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-9 col-md-8 col-sm-8 col-8">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="cmm16000CmmTable"></div>
				</div>
				<div class="kt-portlet__head-toolbar osl-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm16000CmmTable" data-datatable-action="select" title="메시지 조회" data-title-lang-cd="cmm16000.button.tooltip.selectBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm16000CmmTable" data-datatable-action="insert" title="메시지 보내기" data-title-lang-cd="cmm16000.button.tooltip.insertBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
							<i class="fa flaticon2-mail-1"></i><span data-lang-cd="datatable.button.insert">쓰기</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm16000CmmTable" data-datatable-action="reInsert" title="메시지 답장" data-title-lang-cd="cmm16000.button.tooltip.reInsertBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="reInsert" tabindex="3">
							<i class="fa flaticon2-chat-2"></i><span data-lang-cd="cmm16000.button.reInsertBtn">답장</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm16000CmmTable" data-datatable-action="check" title="메시지 읽음 처리" data-title-lang-cd="cmm16000.button.tooltip.checkBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="check" tabindex="4">
							<i class="fa flaticon2-check-mark"></i><span data-lang-cd="cmm16000.button.checkBtn">읽음</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm16000CmmTable" data-datatable-action="delete" title="메시지 삭제" data-title-lang-cd="cmm16000.button.tooltip.deleteBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="5">
							<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="kt_datatable osl-datatable-footer__divide" id="cmm16000CmmTable"></div>
			</div>
		</div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLCmm16000Popup = function () {
	var datatableId = "cmm16000CmmTable";
	
	var documentSetting = function(){
		$.osl.datatable.setting(datatableId,{
			data: {
				source: {
					read: {
						url: "/cmm/cmm10000/cmm16000/selectArm1000AlarmListAjax.do"
					},
					params: {
						armMenuType : "get"
					},
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 50, sortable: false},
				{field: 'sendUsrNm', title: '보낸 사람', textAlign: 'left', autoHide: false, width: 120, sortField: "sendUsrNm", search:true,
					template: function (row) {
						if($.osl.isNull(row.sendUsrNm)){
							row.sendUsrNm = "";
						}
						var usrData = {
							html: row.sendUsrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.sendUsrImgId, usrData);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.sendUsrId);
					}
				},
				{field: 'armTitle', title:'제목', textAlign: 'left', width: 400, autoHide: false, sortField: "armTitle", search: true},
				{field: 'sendDtm', title: '날짜', textAlign: 'center', width: 120, sortField: "sendDtm", search: true, searchType:"daterange",
					template: function (row) {
						var paramDatetime = new Date(row.sendDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
			],
			searchColumns:[
				{field: 'sendUsrId', title: $.osl.lang("cmm16000.field.sendUsrId"), searchOrd: 1},
				{field: 'sendUsrEmail', title: $.osl.lang("cmm16000.field.sendUsrEmail"), searchOrd: 2},
				{field: 'usrNm', title: $.osl.lang("cmm16000.field.usrNm"), searchOrd: 3},
				{field: 'usrId', title: $.osl.lang("cmm16000.field.usrId"), searchOrd: 4},
				{field: 'usrEmail', title: $.osl.lang("cmm16000.field.usrEmail"), searchOrd: 5},
				{field: 'armContent', title: $.osl.lang("cmm16000.field.armContent"), searchOrd: 7}
			],
			rows:{
				beforeTemplate : function(row, data, index){
					if(data.checkCd == '02'){
						//안읽은 것
						$(row).css("font-weight", "bold");
					}
				},
				clickCheckbox: true,
			},
			actionBtn:{
				"title": $.osl.lang("cmm16000.actionBtn.title"),
				"reInsert" : true,
				"update" : false,
				"dblClick" : true,
				"check" : true,
			},
			actionTooltip:{
				"reInsert" : $.osl.lang("cmm16000.button.tooltip.reInsertBtn"),
				"dblClick" : $.osl.lang("cmm16000.button.tooltip.dblClickBtn"),
				"check" : $.osl.lang("cmm16000.button.tooltip.checkBtn"),
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("cmm16000.actionBtn.insertTitle"),
							closeConfirm: false,
							autoHeight:false,
						};
					
					$.osl.layerPopupOpen('/cmm/cmm10000/cmm16000/insertCmm16001View.do',data,options);
				},
				"reInsert":function(rowDatas, datatableId, type, rowNum){
					var data;
					var options;
					
					if(type == "list"){
						//선택 항목이 리스트인 경우
						if(rowNum == 0){
							$.osl.alert($.osl.lang("cmm16000.alert.message.selectMessage"));
							return false;
						}else if(rowNum == 1){
							data = {
									type:"reInsert",
									reSendUsrId : rowDatas[0].sendUsrId,
									atchfileId : rowDatas[0].atchFileId
								};
							options = {
									idKey: "reInsert_"+rowDatas[0].armId,
									modalTitle: $.osl.lang("cmm16000.actionBtn.reInsertTitle"),
									closeConfirm: false,
									autoHeight:false,
								};
						}else{
							//다중인 경우
							$.osl.alert($.osl.lang("cmm16000.alert.message.selectOneMessage", rowNum));
							return false;
						}
					}else{
						//선택 항목이 row 단건인 경우
						data = {
								type:"reInsert",
								reSendUsrId : rowDatas.sendUsrId,
							};
						options = {
								idKey: "reInsert_"+rowDatas.armId,
								modalTitle: $.osl.lang("cmm16000.actionBtn.reInsertTitle"),
								closeConfirm: false,
								autoHeight:false,
							};
					}
					
					$.osl.layerPopupOpen('/cmm/cmm10000/cmm16000/insertCmm16001View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type){
					var data = {
							dataList : JSON.stringify(rowDatas)
					};

					//AJAX 설정
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/cmm/cmm10000/cmm16000/deleteArm1000AlarmInfoAjax.do'/>", "async":"true"}
							,data);
					
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
							$.osl.alert(data.message,{type: 'error'});

							//모달 창 닫기
							$.osl.layerPopupClose();
						}else{
							OSLCmm16000Popup.reload();
						}
					});
					
					//AJAX 전송
					ajaxObj.send();
					
				},
				"dblClick":function(rowData, datatableId, type, rowNum){
					var data = {
							armId : rowData.armId
					};
					var options = {
							idKey: rowData.armId,
							modalTitle: $.osl.lang("cmm16000.actionBtn.dblClickTitle"),
							closeConfirm: false,
							autoHeight:false,
					};
					
					$.osl.layerPopupOpen('/cmm/cmm10000/cmm16000/selectCmm16002View.do',data,options);
				},
				"check" : function(rowDatas){
					var data = {
							dataList : JSON.stringify(rowDatas)
					};
					
					//AJAX 설정
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/cmm/cmm10000/cmm16000/updateArm1000AlarmInfoAjax.do'/>", "async":"true"}
							,data);
					
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
							$.osl.alert(data.message,{type: 'error'});

							//모달 창 닫기
							$.osl.layerPopupClose();
						}else{
							OSLCmm16000Popup.reload();
						}
					});
					
					//AJAX 전송
					ajaxObj.send();
				}
			},
			theme:{
				actionBtn:{
					"reInsert" : "",
					"check" : " kt-hide",
				},
				actionBtnIcon:{
					"reInsert" : "fa flaticon2-chat-2",
					"check" : "fa flaticon2-check-mark",
				}
			},
			callback:{
				initComplete:function(evt, config){
					//초기 선택 - 받은 메시지
					$("#menuTypeGet").click();
				},
	   			ajaxDone: function(evt, list, datatableInfo){
	   				checkNotRead();
	   			},
			}
		});
		
		$("#menuTypeGet").click(function(){
			//선택 div
			$("#menuTypeGet").children("h5").addClass("kt-font-boldest kt-font-brand");
			//선택 외 div
			$("#menuTypeSend").children("h5").removeClass("kt-font-boldest kt-font-brand");
			$("#menuTypeAlone").children("h5").removeClass("kt-font-boldest kt-font-brand");
			
			//검색바 초기화
			searchReset();
			
			//데이터 테이블 검색 조건 변경 - 강제
			$.osl.datatable.list[datatableId].targetDt.setDataSourceParam("armMenuType","get");
			//데이터 테이블 조회
 			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
		});
		
		$("#menuTypeSend").click(function(){
			//선택 div
			$("#menuTypeSend").children("h5").addClass("kt-font-boldest kt-font-brand");
			//선택 외 div
			$("#menuTypeGet").children("h5").removeClass("kt-font-boldest kt-font-brand");
			$("#menuTypeAlone").children("h5").removeClass("kt-font-boldest kt-font-brand");
			
			//검색바 초기화
			searchReset();
			
			//데이터 테이블 검색 조건 변경 - 강제
			$.osl.datatable.list[datatableId].targetDt.setDataSourceParam("armMenuType","send");
			//데이터 테이블 조회
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
		});
		
		$("#menuTypeAlone").click(function(){
			//선택 div
			$("#menuTypeAlone").children("h5").addClass("kt-font-boldest kt-font-brand");
			//선택 외 div
			$("#menuTypeGet").children("h5").removeClass("kt-font-boldest kt-font-brand");
			$("#menuTypeSend").children("h5").removeClass("kt-font-boldest kt-font-brand");
			
			//검색바 초기화
			searchReset();
			
			//데이터 테이블 검색 조건 변경 - 강제
			$.osl.datatable.list[datatableId].targetDt.setDataSourceParam("armMenuType","alone");
			//데이터 테이블 조회
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
		});
		
	};
	
	/**
	 * 안읽은 메시지 개수 확인
	 */
	var checkNotRead = function(){
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/cmm/cmm10000/cmm16000/selectArm1000AlarmNotReadCntAjax.do'/>"});
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var allMessage = data.allMessage;
				var notRead = data.notRead;
				console.log(allMessage);
				if(notRead.get>0){
					$("#notReadGetCnt").removeClass("kt-hide");
					$("#notReadGetCnt").text(notRead.get);
					$("#getCnt").text(" / " + allMessage.get);
				}else{
					$("#getBadgeSpan").addClass("kt-hide");
					$("#notReadGetCnt").text("0");
					$("#getCnt").text(allMessage.get);
				}
				$("#sendCnt").text(allMessage.send);
				if(notRead.alone>0){
					$("#notReadAloneCnt").removeClass("kt-hide");
					$("#notReadAloneCnt").text(notRead.alone);
					$("#aloneCnt").text(" / " + allMessage.alone);
				}else{
					$("#notReadAloneCnt").addClass("kt-hide");
					$("#notReadAloneCnt").text("0");
					$("#aloneCnt").text(allMessage.alone);
				}
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	};
	
	/**
	* 검색바 초기화
	*/
	var searchReset = function(){
		//드롭다운 메뉴 선택 활성화 취소 및 재선택
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").attr("class", "dropdown-item active");
		
		//검색 메뉴 명 가져오기
		var searchBarMenuStr = $(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").text();
		
		//검색 메뉴 버튼 변경
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text(searchBarMenuStr);
		
		//select 감추기
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
		
		//input 보이기
		$("#searchData_"+datatableId).removeAttr("readonly");
		//그려진 캘린터 아이콘이 있는 경우 지우기
		$("#searchData_"+datatableId).parent().children("span").children().children().removeClass("la-calendar");
		
		//input에 검색 값 비우기
		$("#searchData_"+datatableId).val("");

		//전체 검색 막기
		//input disabled
		$("#searchData_"+datatableId).attr("disabled","disabled");
	}
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        },
        reload: function(){
			//datatable 조회
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
        	checkNotRead();
        }
        
    };
}();

$.osl.ready(function(){
	OSLCmm16000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />