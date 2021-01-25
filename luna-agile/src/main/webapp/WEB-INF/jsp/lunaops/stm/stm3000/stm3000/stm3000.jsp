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
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm3000UsrTable" data-datatable-action="select" title="사용자 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span>조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm3000UsrTable" data-datatable-action="insert" title="사용자 추가" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
					<i class="fa fa-plus"></i><span>추가</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm3000UsrTable" data-datatable-action="update" title="사용자 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
					<i class="fa fa-edit"></i><span>수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm3000UsrTable" data-datatable-action="delete" title="사용자 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
					<i class="fa fa-trash-alt"></i><span>삭제</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="osl-datatable-search" data-datatable-id="stm3000UsrTable"></div>
			</div>
		</div>
		<div class="kt_datatable" id="stm3000UsrTable"></div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm3000 = function () {
	var documentSetting = function(){
		
		$.osl.datatable.setting("stm3000UsrTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false, sortable: false},
				{field: 'blockNm', title: '차단유무', textAlign: 'center', width: 70, autoHide: false, search: true, searchType:"select", searchCd: "ADM00005", searchField:"block", sortField: "block"},
				{field: 'useNm', title: '사용유무', textAlign: 'center', width: 70,  search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField: "useCd"},
				{field: 'usrId', title: '아이디', textAlign: 'center', width: 150, search: true},
				{field: 'usrNm', title: '사용자 명', textAlign: 'left', width: 160, search: true, autoHide: false,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'telno', title: '연락처', textAlign: 'left', width: 110, search: true},
				{field: 'email', title: '이메일', textAlign: 'left', width: 170, search: true},
				{field: 'usrPositionNm', title: '직급', textAlign: 'center', width: 110, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직책', textAlign: 'center', width: 120, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 390, search: true, sortable: false},
				{field: 'pwFailCnt', title: '비밀번호 실패횟수', textAlign: 'center', width: 110, sortable: false,
					template: function (row) {return !$.osl.isNull(row.pwFailCnt) ? row.pwFailCnt.toString() : "0"; }
				},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 120, search: true, searchType:"daterange"},
				{field: 'etc', title: '비고', textAlign: 'left', width: 400, search: true}
			],
			actionBtn:{
				"dblClick": true
			},
			actionTooltip:{
				"update": "사용자 수정",
				"delete": "사용자 삭제",
				"dblClick": "사용자 상세보기"
			},
			actionFn:{
				"insert":function(datatableId){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalSize: 'lg',
							modalTitle: "신규 사용자 등록",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm3000/stm3000/selectStm3001View.do',data,options);
				},
				"update":function(rowData){
					var data = {
							type:"update",
							paramUsrId: rowData.usrId,
						};
					var options = {
							idKey: rowData.usrId,
							modalTitle: "사용자 수정",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm3000/stm3000/selectStm3001View.do',data,options);
				},
				"delete":function(rowDataList){
					
					var params = ""; // 삭제 파라미터
					var isLicGrpUser = false; // 최초라이선스 등록자 체크 flag
					var licGrpUsrNm = ""; // 최초 라이선스 등록자 명
					
					$.each(rowDataList, function(idx, map){
						
						if(map.usrId+"_GRP" == map.licGrpId){
							isLicGrpUser = true;
							licGrpUsrNm = map.usrNm;
							return false;
						}
						params += "&usrId="+map.usrId+"&usrNm="+map.usrNm;
					});
					
					// 최초 라이선스 등록자 삭제불가
					if(isLicGrpUser){
						$.osl.alert("라이선스 최초 등록자는 삭제가 불가능합니다.", {text:"* 라이선스 최초 등록자 : " + licGrpUsrNm, type:"warning"});
						return false;
					}
					
					//AJAX 설정
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/stm/stm3000/stm3000/deleteStm3000UsrInfo.do'/>"}
								,params);
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
				    	
						// 에러시 alert
						if(data.errorYn == "Y"){
							$.osl.alert(data.message, {type:"warning"});
						// 삭제하려는 사용자가 프로젝트에 배정되어있거나 최초 라이선스 등록자일경우 	
						}else if(data.checkYn == "Y"){
							
							// 프로젝트에 배정된 사용자 명 문자열
		    				var usrNmStr = "";
		    				
		    				if(!$.osl.isNull(data.result.resultData)){
			    				$.each(data.result.resultData, function(idx, usrNm){
			    					usrNmStr += usrNm + ", ";
			    				});
			    				
			    				usrNmStr = usrNmStr.substring(0, usrNmStr.lastIndexOf(","));
		    				}
		    				
		    				// 메시지 출력
		    				$.osl.alert(data.result.message, {text:usrNmStr, type:"warning"});
							
						// 정상 삭제
						}else{
							$.osl.toastr(data.message);
							// 삭제 성공시 데이터 테이블 reload, 현재 페이지 유지
							$.osl.datatable.list["stm3000UsrTable"].targetDt.reload();
						}
					});
					
					//AJAX 전송
					ajaxObj.send();
				},
				"dblClick":function(rowData){
					// 상세보기 팝업 호출
					var data = {
							paramUsrId: rowData.usrId,
						};
					var options = {
							idKey: "detail_"+rowData.usrId,
							modalTitle: "사용자 상세보기",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm3000/stm3000/selectStm3002View.do',data,options);
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
	OSLStm3000.init();
});

</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
