<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />

<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h3>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2100StmTable" data-datatable-action="select" title="게시판 조회" data-title-lang-cd="stm2100.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2100StmTable" data-datatable-action="update" title="게시판 속성 수정" data-title-lang-cd="stm2100.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="2">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2100StmTable" data-datatable-action="detail" title="게시글 관리" data-title-lang-cd="stm2100.actionBtn.managmentTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="detail" tabindex="3">
					<i class="fa flaticon-settings-1"></i><span data-lang-cd="stm2100.button.detail">관리</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2100StmTable" data-datatable-action="summery" title="게시판 통계" data-title-lang-cd="stm2100.actionBtn.summeryTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="summery" tabindex="4">
					<i class="fa flaticon-information"></i><span data-lang-cd="stm2100.button.summery">통계</span>
				</button>
				<!-- 엑셀 출력 버튼 넣기 -->
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-5 col-md-6 col-sm-6">
				<div class="osl-datatable-search" data-datatable-id="stm2100StmTable"></div>
			</div>
			<div class="col-lg-7 col-md-6 col-sm-6">
				<div class="kt-align-right">
<!-- 					<button type="button" class="btn btn-bold kt-padding-5 kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="그리드형" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" name="menuGrid" id="menuGrid" ><i class="fa flaticon2-indent-dots" style="color:#20c997;"></i></button> -->
<!-- 					<button type="button" class="btn btn-bold kt-padding-5 kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="카드형" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" name="menuCard" id="menuCard" onclick="location.href='/stm/stm2000/stm2100/selectStm2104View.do'"><i class="fa flaticon-squares-1" style="color:#20c997;"></i></button> -->
				</div>
			</div>
		</div>
		<div class="kt_datatable" id="stm2100StmTable"></div>
	</div>
</div>
<!-- begin page script -->
<script>
 "use strict";
 var OSLStm2100Popup = function() {
	 var okManager;
	 var okWriter;
	 var documentSetting = function() {		
		 $.osl.datatable.setting("stm2100StmTable", {
			 data: {
				 source: {
					 read: {
						url: "/stm/stm2000/stm2100/selectStm2100ListAjax.do" 
					 }
				 },
			 },
			 columns: [
				 {field: 'checkbox', title: '#', textAlign: 'center', width: 50, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				 {field: 'stmTypeNm', title: $.osl.lang("stm2100.field.stmTypeNm"), textAlign: 'left', width: 100, search: true, searchType:"select", searchCd:"STM00001", searchField:"stmTypeCd"},
				 {field: 'stmNm', title: $.osl.lang("stm2100.field.stmNm"), textAlign: 'left', width: 300, autoHide: false, search: true, 
// 						template: function(row){
// 							var returnStr = "<span class='stmNmTxt' style='word-break: break-word;'>"+row.stmNm+"</span>";
// 							return returnStr;
// 						}	 
				 },
				 {field: 'stmDsTypeNm', title: $.osl.lang("stm2100.field.stmDsTypeNm"), textAlign: 'left', width: 200},
				 {field: 'cnt', title: $.osl.lang("stm2100.field.cnt"), textAlign: 'center', width: 150},
				 {field: 'badCnt', title: $.osl.lang("stm2100.field.badCnt"), textAlign: 'center', width: 150,
					 template : function(row){
						return String(parseInt(row.cnt) - parseInt(row.delCnt)); 
					 },
				 },
				 {field: 'delCnt', title: $.osl.lang("stm2100.field.delCnt"), textAlign: 'center', width: 150},
			 ],
// 			 rows:{
// 				 afterTemplate: function(row, data, index){
// 					$(".stmNmTxt").parents("span").addClass("osl-bad__width__100");
// 					var titleRow = $("#stm2100StmTable>table>thead>tr").children("th");
// 					$.each(titleRow, function(idx, item){
// 						if(item.dataset.field=="stmNm"){
// 							//item.classList.add("osl-bad__width__100");
// 							//item.classList = ["osl-bad__width__100"];
// 							console.log(item.classList);
// 						}
// 					}); 
// 				}
// 			 },
			 actionBtn:{
				"title" : $.osl.lang("stm2100.actionBtn.title"),
				"width" : 120,
				"delete" : false,
				"detail": true,
				"summery" : true,
			},
			actionTooltip:{
				"update" : $.osl.lang("stm2100.actionBtn.updateBtn"),
				"detail": $.osl.lang("stm2100.actionBtn.detailBtn"),
				"summery": $.osl.lang("stm2100.actionBtn.summeryBtn"),
			},
			actionFn:{
				"update":function(rowData){
					var data = {
							type: "update",
							menuId: rowData.menuId,
							stmTypeCd: rowData.stmTypeCd,
							stmNm: rowData.stmNm,
							stmDsTypeCd : rowData.stmDsTypeCd,
						};
					var options = {
							idKey: rowData.menuId,
							modalTitle: "[ "+rowData.stmNm+ " ] "+$.osl.lang("stm2100.title.updateTitle"),
							closeConfirm: false,
							modalSize: "xl",
							autoHeight: false,
							backdrop: "static",
						};
					
					checkUser(rowData.menuId, rowData.stmDsTypeCd);
					if(okManager == true){
						$.osl.layerPopupOpen('/stm/stm2000/stm2100/selectStm2101View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("stm2100.notAuthority"), {"type":"warning"});
					}
				},
				"detail":function(rowDatas, datatableId, type, rowNum){
					var rowData;
					if(type == "list"){
						if(rowNum != 1){
							$.osl.alert($.osl.lang("stm2100.selectStmInfoCnt", rowNum), {"type":"warning"});
						}else{
							rowData = rowDatas[0];
						}
					}else{
							rowData = rowDatas;
					}
					
					var data = {
							menuId: rowData.menuId,
							stmTypeCd: rowData.stmTypeCd,
							stmNm: rowData.stmNm,
							//시스템 게시판에서 접근 시 라이센스 범위로 보기 위해 01로 지정
							stmDsTypeCd : "01",
							stmRootYn : "Y",
						};
					var options = {
							idKey: "bad_"+rowData.menuId,
							modalTitle:"[ "+ rowData.stmNm +" ] "+$.osl.lang("stm2100.title.detailTitle"),
							closeConfirm: false,
							modalSize: "fs",
							autoHeight: false,
						};
					checkUser(rowData.menuId, rowData.stmDsTypeCd);
					if(okManager == true || okWriter == true){
						if(rowData.stmTypeCd == "01" || rowData.stmTypeCd == "02"){
							$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1000View.do',data,options);
						}else{
							$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1006View.do',data,options);
						}
					}else{
						$.osl.alert($.osl.lang("stm2100.notAuthority"), {"type":"warning"});
					}
				},
				"summery" : function(rowDatas, datatableId, type, rowNum){
					var rowData;
					if(type == "list"){
						if(rowNum != 1){
							$.osl.alert($.osl.lang("stm2100.selectStmInfoCnt", rowNum), {"type":"warning"});
						}else{
							rowData = rowDatas[0];
						}
					}else{
							rowData = rowDatas;
					}
					
					var data = {
							type:"dbClick",
							menuId: rowData.menuId,
							stmTypeCd: rowData.stmTypeCd,
							stmNm: rowData.stmNm,
						};
					var options = {
							idKey: "summery_"+rowData.menuId,
							modalTitle: "[ "+ rowData.stmNm +" ] "+$.osl.lang("stm2100.title.summeryTitle"),
							closeConfirm: false,
							autoHeight: false,
						};
					
 					checkUser(rowData.menuId, rowData.stmDsTypeCd);
					if(okManager == true){
	 					$.osl.layerPopupOpen('/stm/stm2000/stm2100/selectStm2102View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("stm2100.selectStmInfoCnt", rowNum), {"type":"warning"});
					}
				},
			 },
			 theme: {
				 actionBtn:{
					 "detail" : "",
					 "summery" : "",
				 },
				 actionBtnIcon:{
					 "detail": "fa flaticon-settings-1",
					 "summery" : "fa flaticon-information",
				 }
			 }
		 });

		 /*
		 * function : checkUser
		 * param : menuId, stmDsTypeCd
		 * function 설명 : 담당자, 글작성범위에 해당하는지 사용자 체크
		 */
		 var checkUser = function(menuId, stmDsTypeCd){
			 var data = {
					 authGrpId : $.osl.selAuthGrpId,
					 menuId : menuId,
					 dsTypeCd : stmDsTypeCd,
			 }
			//ajax 설정
	    	var ajaxObj = new $.osl.ajaxRequestAction(
	    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2100UserCheckAjax.do'/>", "async": false}
					, data);
			//ajax 전송 성공 함수
	    	ajaxObj.setFnSuccess(function(data){
	    		if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
					//모달 창 닫기
					$.osl.layerPopupClose();
				}else{
					var result = data.result;
					//시스템 게시판 관리로 접속하는 사람은 무조건 담당자(목록에 없어도)
					okManager = true;	
					
					//글작성 목록에 있으면 - 글 작성 범위에 해당하는 사람
					//처음부터 글작성 목록이 비어있는경우 - 접근하는 사람 모두
					if(result.resultWriter == "Y" || result.resultWriter == "B"){
						okWriter = true;	
					}else{
						okWriter = false;
					}
				}
			});
			
	    	//AJAX 전송
			ajaxObj.send();
		 }
	 };
	 
	 return {
		 init: function(){
			 documentSetting();
		 }
	 };
 }();
 
 $.osl.ready(function(){
	 OSLStm2100Popup.init();
 });
</script>
<!-- end script -->

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />