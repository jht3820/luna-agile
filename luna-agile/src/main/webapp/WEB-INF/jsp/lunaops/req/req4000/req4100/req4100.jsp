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
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="select" title="요구사항 조회" data-title-lang-cd="req4100.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="insert" title="요구사항 추가" data-title-lang-cd="req4100.actionBtn.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
					<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="update" title="요구사항 수정" data-title-lang-cd="req4100.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="copy" title="요구사항 복사" data-title-lang-cd="req4100.actionBtn.copyTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="copy" tabindex="4">
					<i class="fa flaticon2-copy"></i><span data-lang-cd="req4100.button.copyBtn">복사</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="delete" title="요구사항 삭제" data-title-lang-cd="req4100.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="5">
					<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-12">
				<div class="osl-datatable-search" data-datatable-id="req4100ReqTable"></div>
			</div>
		</div>
		<div class="kt_datatable" id="req4100ReqTable"></div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLReq4100Popup = function () {
	//비밀 요구사항인 경우 접근 권한 확인하기 위한 변수
	var reqAuth = false;
	var datatableId = "req4100ReqTable";
	var documentSetting = function(){
		$.osl.datatable.setting(datatableId,{
			data: {
				source: {
					read: {
						url: "/req/req4000/req4100/selectReq4100ReqListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjNm', title: '프로젝트명', textAlign: 'left', width: 150, search: true},
				{field: 'reqOrd', title: '요청번호', textAlign: 'left', width: 110, autoHide: false},
				{field: 'reqProTypeNm', title:'처리유형', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProType", sortField: "reqProType"},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 380, search: true, autoHide: false,
					template: function(row){
						var resultStr = $.osl.escapeHtml(row.reqNm);
						//비밀번호가 있는 경우
						if(row.reqPw == "Y"){
							resultStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
						}
						return resultStr;
					}
				},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.regDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'reqUsrNm', title: '요청자', textAlign: 'center', width: 120, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqUsrNm)){
							row.reqUsrNm = "";
						}
						var usrData = {
							html: row.reqUsrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.reqUsrImgId, usrData);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.reqUsrId);
					}
				},
				{field: 'reqUsrEmail', title:'요청자e-mail', textAlign: 'left', width: 180, search: true},
				{field: 'reqUsrDeptNm', title:'요청자 조직', textAlign: 'center', width: 300, sortable: false},
				{field: 'reqUsrNum', title: '요청자 연락처', textAlign: 'center', width: 100, search: true},
				{field: 'reqKey', title: '요구사항 key', textAlign: 'center', width: 300, sortable: false, search: true}
				
			],
			searchColumns:[
				{field: 'prjGrpNm', title: $.osl.lang("req4100.field.prjGrpNm"), searchOrd: 0}
			],
			rows:{
				clickCheckbox: true
			},
			actionBtn:{
				"title" : $.osl.lang("req4100.actionBtn.title"),
				"dblClick": true,
				"copy" : true,
			},
			actionTooltip:{
				"update": $.osl.lang("req4100.actionBtn.updateBtn"),
				"delete": $.osl.lang("req4100.actionBtn.deleteBtn"),
				"dblClick" : $.osl.lang("req4100.actionBtn.detailBtn"),
				"copy" : $.osl.lang("req4100.actionBtn.copyBtn"),
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("req4100.title.insertTitle"),
							closeConfirm: false,
							autoHeight:false,
						};
					
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
				},
				"update":function(rowData){
					if(rowData.reqProType != "01"){
						$.osl.alert($.osl.lang("req4100.alert.updateMsg"), {"type":"warning"});
						return false;
					}
					var data = {
							type:"update",
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
							paramReqUsrId: rowData.reqUsrId,
							datatableId: datatableId,
						};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("req4100.title.updateTitle"),
							closeConfirm: false,
							autoHeight:false,
						};
					var pwOptions = {
							idKey: "req4100pw_"+datatableId,
							modalTitle: $.osl.lang("req4100.title.passowrdCheckTitle"),
							closeConfirm: false,
							autoHeight:false,
							modalSize: "sm",
						};
					
					if(rowData.reqPw == "Y"){
						//비밀번호가 걸린 경우 권한 체크
						checkAuth($.osl.user.userInfo.usrId , rowData.reqId);
						if(reqAuth){
							//권한이 있을 경우
							$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
						}else{
							//권한이 없을 경우 비밀번호 입력 화면
							$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4104View.do',data,pwOptions);
						}
					}else{
						//비밀번호가 없는 요구사항인 경우
						$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
					}
				},
				"delete":function(rowDatas, datatableId, type){
					reqAuth = false;
					var pwCount = 0;
					var data = {
							type:"delete",
							paramRowData : JSON.stringify(rowDatas),
							datatableId: datatableId,
						};
					var pwOptions = {
							idKey: "req4100pw_"+datatableId,
							modalTitle: $.osl.lang("req4100.title.passowrdCheckTitle"),
							closeConfirm: false,
							autoHeight:false,
							modalSize: "sm",
						};
					
					//잠금된 요구사항 갯수 확인
					$.each(rowDatas, function(idx, value){
						if(value.reqPw == "Y"){
							reqAuth = true;
							pwCount++;
						}
					});

					//선택된 rowDatas 갯수
					var rowCnt = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords().length;
					
					//비밀번호가 걸린 항목을 삭제시
					if(reqAuth){
						//단건 삭제일 때
						if(rowCnt == 1 || type=="info"){
							//비밀번호 확인 후 삭제
							$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4104View.do',data,pwOptions);
						}else if(rowCnt >1){
							//다중 삭제일 때
							//비밀번호가 걸린 항목이 단건인 경우
							if(pwCount == 1){
								//비밀번호 확인 후 삭제
								$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4104View.do',data,pwOptions);
							}else{
								//비밀번호가 걸린 항목이 여러건인 경우
								$.osl.alert($.osl.lang("req4100.alert.multiPwMsg", pwCnt));
								return false;
							}
						}
					}else{
						//AJAX 설정
						var ajaxObj = new $.osl.ajaxRequestAction(
								{"url":"<c:url value='/req/req4000/req4100/deleteReq4100ReqListAjax.do'/>"}
								,{deleteDataList: JSON.stringify(rowDatas)});
						//AJAX 전송 성공 함수
						ajaxObj.setFnSuccess(function(data){
							if(data.errorYn == "Y"){
				   				$.osl.alert(data.message,{type: 'error'});
				   			}else{
				   				//삭제 성공
				   				$.osl.toastr(data.message);
				   				
				   				//datatable 조회
				   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
				   			}
						});
						
						//AJAX 전송
						ajaxObj.send();
					}
				},
				"dblClick":function(rowData, datatableId, type, rowNum){
					var data = {
							//type:"update",
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
							paramReqUsrId: rowData.reqUsrId
						};
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("req4100.title.detailTitle"),
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do',data,options);
				},
				"copy" : function(rowDatas, datatableId, type, rowNum){
					var data;
					console.log(rowDatas);
					if(type == "list"){
						//선택 항목이 리스트인 경우
						if(rowNum == 0){
							$.osl.alert($.osl.lang("req4100.alert.selectData"));
						}else if(rowNum == 1){
							//비밀번호가 걸린 글인지 확인 - 비밀번호가 걸린 글은 복사 안됨
							if(rowDatas[0].reqPw == "Y"){
								$.osl.alert($.osl.lang("req4100.alert.LockData"));
							}else{
								//단건 복사인 경우
								data ={
									type:"copy",
									//rowDatas : JSON.stringify(rowDatas),
									paramPrjId: rowDatas[0].prjId,
									paramReqId: rowDatas[0].reqId,
									paramReqUsrId: rowDatas[0].reqUsrId,
									changePrj : "Y"
								};
								var options = {
										idKey: rowDatas[0].reqId,
										modalTitle: $.osl.lang("req4100.title.detailTitle"),
										closeConfirm: false
									};
								
								$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
							}
						}else{
							//다중 복사인 경우
							$.osl.alert($.osl.lang("req4100.alert.selectCopyData", rowNum));
						}
					}else{
						//선택 항목이 row 단건인 경우
						//비밀번호가 걸린 글인지 확인 - 비밀번호가 걸린 글은 복사 안됨
						if(rowDatas.reqPw == "Y"){
							$.osl.alert($.osl.lang("req4100.alert.LockData"));
						}else{
							data ={
								type:"copy",
								rowDatas : "["+JSON.stringify(rowDatas)+"]",
								paramPrjId: rowDatas.prjId,
								paramReqId: rowDatas.reqId,
								paramReqUsrId: rowDatas.reqUsrId,
								changePrj : "Y"
							};
							var options = {
									idKey: rowDatas.reqId,
									modalTitle: $.osl.lang("req4100.title.detailTitle"),
									closeConfirm: false
								};
							
							$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
						}
					}
				}
			},
			theme:{
				actionBtn:{
					"copy" : ""
				},
				actionBtnIcon:{
					"copy" : "fa flaticon2-copy",
				}
			}
		});
	};
	
	/**
	 * 비밀글인 경우 접근 권한있는지 확인
	 * param : usrId : 권한 체크하려는 회원 id
	 * param : reqId : 권한 체크하려는 요구사항 id
	 */
	var checkAuth = function(usrId, reqId){
		var data = {
				usrId : usrId,
				reqId : reqId
		};
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/req/req4000/req4100/selectReq4100UserCheckAjax.do'/>", "async": true}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var result = data.reqAuth;
				if(result == "Y"){
					reqAuth = true;
				}else{
					reqAuth = false;
				}
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLReq4100Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
