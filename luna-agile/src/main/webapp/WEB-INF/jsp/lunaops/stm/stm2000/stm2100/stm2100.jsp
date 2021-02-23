<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

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
				
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air btn-view-type active" title="카드형" data-title-lang-cd="stm2100.button.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5" data-view-type="01">
						<i class="fa fa-table osl-padding-r0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="그리드형" data-title-lang-cd="stm21000.button.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="02">
						<i class="fa fa-list osl-padding-r0"></i>
					</button>
				</div>
				<!-- 엑셀 출력 버튼 넣기 -->
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-5 col-md-6 col-sm-6">
				<div class="osl-datatable-search" data-datatable-id="stm2100StmTable"></div>
			</div>
		</div>
		<div id="stm2100StmCard"></div>
		<div class="kt_datatable osl-datatable-footer__divide" id="stm2100StmTable"></div>
	</div>
</div>
<!-- begin page script -->
<script>
 "use strict";

 var OSLStm2100Popup = function() {
	 //권한체크
	 var okManager;
	 var okWriter;
	 //카드형 그리기
	 var resultStr = "";
	 var currentViewType = "01";
	 var documentSetting = function() {	
		 var datatableId = "stm2100StmTable";
		 var config = {
			 cardUiTarget: $("#stm2100StmCard"),
			 data: {
				 source: {
					 read: {
						url: "/stm/stm2000/stm2100/selectStm2100ListAjax.do" 
					 }
				 },
			 },
			 columns: [
				 {field: 'checkbox', title: '#', textAlign: 'center', width: 50, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				 {field: 'stmTypeNm', title:'유형', textAlign: 'left', width: 100, search: true, searchType:"select", searchCd:"STM00001", searchField:"stmTypeCd", sortable: true},
				 {field: 'stmNm', title:'게시판명', textAlign: 'left', width: 300, autoHide: false, search: true, sortable: true},
				 {field: 'stmDsTypeNm', title: '공개범위', textAlign: 'left', width: 200, sortable: true},
				 {field: 'cnt', title: '전체글 수', textAlign: 'center', width: 150, sortable: false},
				 {field: 'badCnt', title: '유효글 수', textAlign: 'center', width: 150, sortable: false,
					 template : function(row){
						return String(parseInt(row.cnt) - parseInt(row.delCnt)); 
					 },
				 },
				 {field: 'delCnt', title: '삭제글 수', textAlign: 'center', width: 150, sortable: false},
			 ],
			 rows:{
				clickCheckbox: true
			},
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
							modalTitle: "[ "+ $.osl.escapeHtml(rowData.stmNm)+ " ] "+$.osl.lang("stm2100.title.updateTitle"),
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
							stmNm: $.osl.escapeHtml(rowData.stmNm),
							//시스템 게시판에서 접근 시 라이센스 범위로 보기 위해 01로 지정
							stmDsTypeCd : "01",
							stmRootYn : "Y",
						};
					var options = {
							idKey: "bad_" + rowData.menuId,
							modalTitle:"[ "+ $.osl.escapeHtml(rowData.stmNm) +" ] "+$.osl.lang("stm2100.title.detailTitle"),
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
							stmNm: $.escapeHtml(rowData.stmNm),
						};
					var options = {
							idKey: "summery_"+rowData.menuId,
							modalTitle: "[ "+ $.escapeHtml(rowData.stmNm) +" ] "+$.osl.lang("stm2100.title.summeryTitle"),
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
			 },
			 callback:{
				 initComplete : function(evt, config){
					 viewTypeChange();
				 },
				 ajaxDone: function(evt, list){
					 var cnt = 0;
					 $.each(list, function(idx, row){
						 resultStr = "";
						var summeryData = selectStm2102(idx, row);
		 				$("#stm2100StmCard").append(resultStr);
		 				//차트 데이터 가져오기
		 				//차트 그리기
		 				drawChart(idx, row.menuId);
					 });
	 				
	 				//카드형 내 수정 버튼 클릭 시
	 				$(".updateBtn").click(function(){
	 					var item =$(this).parent().parent();
	 					var data = {
								type: "update",
								menuId: item.data("menuId"),
								stmTypeCd: item.data("stmTypeCd"),
								stmNm: item.data("stmName"),
								stmDsTypeCd : item.data("stmDsTypeCd"),
							};
						var options = {
								idKey: item.data("menuId"),
								modalTitle: "[ "+item.data("stmName")+ " ] "+$.osl.lang("stm2100.title.updateTitle"),
								closeConfirm: false,
								modalSize: "xl",
								autoHeight: false,
								backdrop: "static",
							};
						
						checkUser(item.data("menuId"), item.data("stmDsTypeCd"));
						if(okManager == true){
							$.osl.layerPopupOpen('/stm/stm2000/stm2100/selectStm2101View.do',data,options);
						}else{
							$.osl.alert($.osl.lang("stm2100.notAuthority"), {"type":"warning"});
						}
	 				});
	 				//카드형 내 관리 버튼 클릭 시
	 				$(".settingBtn").click(function(){
	 					var item = $(this).parent().parent();
	 					
	 					var data = {
								menuId: item.data("menuId"),
								stmTypeCd: item.data("stmTypeCd"),
								stmNm: item.data("stmName"),
								//시스템 게시판에서 접근 시 라이센스 범위로 보기 위해 01로 지정
								stmDsTypeCd : "01",
								stmRootYn : "Y",
							};
						var options = {
								idKey: "bad_"+ item.data("menId"),
								modalTitle:"[ "+ item.data("stmName") +" ] "+$.osl.lang("stm2100.title.detailTitle"),
								closeConfirm: false,
								modalSize: "fs",
								autoHeight: false,
							};
						checkUser(item.data("menuId"), item.data("stmDsTypeCd"));
						if(okManager == true || okWriter == true){
							if(item.data("stmTypeCd") == "01" || item.data("stmTypeCd") == "02"){
								$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1000View.do',data,options);
							}else{
								$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1006View.do',data,options);
							}
						}else{
							$.osl.alert($.osl.lang("stm2100.notAuthority"), {"type":"warning"});
						}
	 				});

					//사용자 이미지 클릭 시
					$(".badChargerList").click(function(){
						$.osl.user.usrInfoPopup($(this).data("user"));
					});
					//그 외 담당자 수 클릭 시
					$(".otherBadChargerList").click(function(){
						//새로운 팝업창 만들기 - 담당자 전체 리스트 출력
						var item =$(this).parent().parent().parent().parent().parent();
						var data = {
								menuId : item.data("menuId"),
						};
						var options = {
								idKey: "charger_"+ item.data("menId"),
								modalTitle:"[ "+ $.osl.escapeHtml(item.data("stmName")) +" ] "+$.osl.lang("stm2100.title.chargerTitle"),
								modalSize : "md",
								closeConfirm: true,
								autoHeight: false,
						};
						$.osl.layerPopupOpen('/stm/stm2000/stm2100/selectStm2103View.do',data,options);
					});
					
				 }//ajaxDone end
			 }
		 };//config end
		 
		 //데이터 테이블 셋팅
		 $.osl.datatable.setting(datatableId, config);

		//뷰 변경 이벤트 - 카드형 그리드형 선택 확인
		$(".btn-view-type").click(function(){
			var viewType = $(this).data("view-type");
			
			//active 교체
			$(".btn-view-type.active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType = viewType;
			
			//뷰어 변경
			viewTypeChange();
		});
		 
		 /*
		 * function : viewTypeChange
		 * function 설명 : 화면 출력 타입 변경(카드형, 그리드형)
		 */
		 var viewTypeChange = function(){
			//현재 viewType에 따라 show/hide
			if(currentViewType == "01"){	//카드 형식
				$("#stm2100StmTable .kt-datatable__table").css({visibility: "hidden", height: 0});
				$("#stm2100StmCard").show();
			}else{	//데이터테이블 형식
				$("#stm2100StmTable .kt-datatable__table").css({visibility: "visible",height: "auto"});
				$("#stm2100StmCard").hide();
			}
		}
		 
		 /**
			* function 명 	: selectStm2102
			* function 설명	: 해당 게시판 통계자료 가져오기
			*/
			 var selectStm2102 = function(idx, row){
				 //조회할 메뉴 아이디 전달
				 var data = {
						 menuId : row.menuId,
						 currentViewType: currentViewType,
				 }
				 //AJAX 설정
				 var ajaxObj = new $.osl.ajaxRequestAction(
			    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2102BadSummeryInfoAjax.do'/>", "async": false}
							, data);
				 
				 //AJAX 전송 성공
				 ajaxObj.setFnSuccess(function(data){
		    		if(data.errorYn == "Y"){
						 //AJAX 전송 실패
						$.osl.alert(data.message,{type: 'error'});
						//모달 창 닫기
						$.osl.layerPopupClose();
					}else{
						var ntcInfo = data.ntcInfo;
						var badCntInfo = data.badCntInfo;
						var badHitInfo = data.badHitInfo;
						var pwCnt = data.pwCnt;
						var badCmtInfo = data.badCmtInfo;
						var tagInfo = data.tagInfo;
						var fileSummery = data.fileSummery;
						var badChargerList = data.badChargerList;
						
						resultStr += "<div class='row kt-padding-10'>"
				 						+ "<div class='kt-portlet kt-portlet--mobile'>"
			 								+ "<div class='col-12'>"
					 							+ "<div class='kt-portlet__head kt-portlet__head--lg'>"
					 								+ "<div class='kt-portlet__head-label'>"
					 									+ "<label class='kt-checkbox kt-checkbox--single kt-checkbox--solid'>"
						 									+ "<input type='checkbox' value='"+idx+"' name='stmGrpCheckbox' id='stmGrpCheckbox_"+row.menuId+"' data-datatable-id='"+datatableId+"'>&nbsp;<span></span>"
					 									+ "</label>";
							 var boardType = "";
							 if(row.stmTypeCd == "01"){
								 boardType = "normal";
							 }else if(row.stmTypeCd == "02"){
								 boardType = "gallery";
							 }else if(row.stmTypeCd == "03"){
								 boardType = "movie";
							 }else{
								 boardType = "storage";
							 }
		 							 resultStr += "<h5 class='kt-font-boldest'>"
				 										+ "<span class='kt-margin-r-10 kt-font-dark'>"+$.osl.lang("stm2100.type."+boardType)+"</span>"
				 										+ "<span class='kt-margin-r-10 kt-font-dark'>"+$.osl.escapeHtml(row.stmNm)+"</span>"
				 									+ "</h5>"
				 								+ "</div>"
			 									+ "<div class='kt-media-group osl-margin-b-05'>";
			 									//담당자 리스트 뿌리기
			 									if(!$.osl.isNull(badChargerList)){
			 										var lastCount =  badChargerList.length;
			 										$.each(badChargerList, function(index, value){
			 											//담당자 수 6명 이하일때만 사진 그리기
			 											if(index < 6){
			 												//담당자가 5 이하일 때
			 												//권한그룹인경우
				 											if(value.stmAdminCd=="01"){
				 												resultStr += "<a href='#' class='kt-media kt-media--xs kt-media--circle' data-toggle='kt-tooltip' data-skin='brand' data-placement='top' title='"+$.osl.escapeHtml(value.prjGrpNm)+" "+$.osl.escapeHtml(value.authGrpNm)+"' data-original-title='"+$.osl.escapeHtml(value.prjGrpNm)+" "+$.osl.escapeHtml(value.authGrpNm)+"'><span><i class='fa flaticon2-group kt-font-bold'></i></span></a>";
				 											}else{//사용자인경우
				 												resultStr += "<a href='#' class='kt-media kt-media--xs kt-media--circle badChargerList' data-toggle='kt-tooltip' data-skin='brand' data-placement='top' title='"+$.osl.escapeHtml(value.usrNm)+"' data-original-title='"+$.osl.escapeHtml(value.usrNm)+"' data-user='"+value.stmAdminId+"'><img src='/cmm/fms/getImage.do?fileSn=0&atchFileId="+value.usrImgId+"'></a>";
				 											}
			 												//남은 사용자 수
				 											lastCount = badChargerList.length - (index+1);
			 											}else{
			 												if(index == 6){
			 													//그 외 담당자 +로 표시
				 												resultStr += "<a href='#' class='kt-media kt-media--xs kt-media--circle otherBadChargerList' data-toggle='kt-tooltip' data-skin='brand' data-placement='top' title='' data-original-title='"+$.osl.lang("stm2101.label.otherAdmin")+" "+lastCount+"'><span>+"+lastCount+"</span></a>";
			 												}
			 											}
			 										});
			 									}
													
									resultStr += "</div>"
				 							+ "</div>"
				 						+ "</div>" //kt-portlet__head end
				 						+ "<div class='osl-bad__card-body'>"
				 							+ "<div class='row kt-margin-10 kt-margin-r-25 kt-margin-l-25'>"
					 							+ "<div class='col-lg-3 col-md-3 col-sm-3 col-3'>"
					 								+ "<label class='kt-margin-r-10'><i class='fa flaticon2-layers kt-margin-r-5'></i>"+$.osl.lang("stm2100.field.stmDsTypeNm")+"</label>"
					 								+ "<span>"+$.osl.escapeHtml(row.stmDsTypeNm)+"</span>"
					 							+ "</div>"
					 							+ "<div class='col-lg-3 col-md-3 col-sm-3 col-3'>"
					 								+ "<label class='kt-margin-r-10'><i class='fa flaticon2-layers kt-margin-r-5'></i>"+$.osl.lang("stm2100.field.cnt")+"</label>"
					 								+ "<span>"+$.osl.escapeHtml(row.cnt)+"</span>"
					 							+ "</div>"
					 							+ "<div class='col-lg-3 col-md-3 col-sm-3 col-3'>"
					 								+ "<label class='kt-margin-r-10'><i class='fa flaticon2-layers kt-margin-r-5'></i>"+$.osl.lang("stm2100.field.badCnt")+"</label>"
					 								+ "<span>"+$.osl.escapeHtml(String(parseInt(row.cnt) - parseInt(row.delCnt)))+"</span>"
					 							+ "</div>"
					 							+ "<div class='col-lg-3 col-md-3 col-sm-3 col-3'>"
					 								+ "<label class='kt-margin-r-10'><i class='fa flaticon2-layers kt-margin-r-5'></i>"+$.osl.lang("stm2100.field.delCnt")+"</label>"
					 								+ "<span>"+$.osl.escapeHtml(row.delCnt)+"</span>"
					 							+ "</div>"
					 						+ "</div>"
				 							+ "<div class='row kt-margin-10 kt-margin-r-25 kt-margin-l-25'>"
				 								//차트부분 시작
					 							+ "<div class='col-lg-6 col-md-12 col-sm-12 col-12'>"
					 								+ "<div>"
					 									+ "<i class='fa flaticon2-graphic kt-margin-r-5'></i>" + $.osl.lang("stm2100.label.summery")
			 										+ "</div>"
					 								+ "<div id='drawChart"+idx+"' name='drawChart"+idx+"'>"
				 											//차트넣기
			 										+ "</div>"
					 							+ "</div>"
					 							//통계부분 시작
					 							+ "<div class='col-lg-6 col-md-12 col-sm-12 col-12'>"
					 								//공지+댓글
				 									+ "<div class='row kt-margin-t-5 kt-margin-b-5'>"
				 										//공지
						 								+"<div class='col-lg-6 col-md-6 col-sm-6 col-6'>"
							 								+ "<div class='kt-padding-5'>"
							 									+ "<i class='fa flaticon-exclamation-1 kt-margin-r-5'></i>"
						 										+ "<span data-lang-cd='stm2102.label.notice'>"+$.osl.lang("stm2102.label.notice")+"</span>"
					 										+  "</div>";
			 							if(ntcInfo != "N"){
						 					if(ntcInfo.cnt != 0){
						 						resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
						 											+ $.osl.lang("stm2102.summery.noticeCntY", ntcInfo.cnt)
						 									+  "</div>"
						 									+  "<div class='kt-margin-5 kt-padding-l-20'>"
								 									+ $.osl.lang("stm2102.summery.ntcCurrentY", ntcInfo.badNtcStdtm)
						 									+ "</div>";
						 					}else{
						 						resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																	+ $.osl.lang("stm2102.summery.noticeCntN")
															+  "</div>"
															+  "<div class='kt-margin-5 kt-padding-l-20'>"
							 									+$.osl.lang("stm2102.summery.ntcCurrentN")
															+ "</div>";
						 					}
						 				}else{
							 					resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																	+ $.osl.lang("stm2102.summery.noticeCntN")
															+  "</div>"
															+  "<div class='kt-margin-5 kt-padding-l-20'>"
							 									+$.osl.lang("stm2102.summery.ntcCurrentN")
															+ "</div>";
						 				}
					 						resultStr += "</div>"//공지 끝
							 								//댓글
									 					 + "<div class='col-lg-6 col-md-6 col-sm-6 col-6'>"
							 								+  "<div class='kt-padding-5'>"
								 									+ "<i class='fa flaticon-chat-1 kt-margin-r-5'></i>"
							 										+ "<span data-lang-cd='stm2102.label.comment'>"+$.osl.lang("stm2102.label.comment")+"</span>"
					 										+  "</div>";
							 				if(badCmtInfo != "N"){
							 					resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
						 											+ $.osl.lang("stm2102.summery.cmtAllCntY", badCmtInfo.allCnt)
						 									+  "</div>"
						 									+  "<div class='kt-margin-5 kt-padding-l-20'>"
								 									+ $.osl.lang("stm2102.summery.cmtMaxInfoY", badCmtInfo.cnt )
						 									+ "</div>";
							 				}else{
							 					resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
						 											+ $.osl.lang("stm2102.summery.cmtAllCntN")
						 									+  "</div>"
						 									+  "<div class='kt-margin-5 kt-padding-l-20'>"
								 									+ $.osl.lang("stm2102.summery.cmtMaxInfoN")
						 									+ "</div>";
							 				}
								 			resultStr	+= "</div>" //댓글 끝
							 							+ "</div>" //공지+댓글 끝
							 							//게시글 + 태그
							 							+ "<div class='row kt-margin-t-5 kt-margin-b-5'>"
							 								//게시글
							 								+ "<div class='col-lg-6 col-md-6 col-sm-6 col-6'>"
								 								+ "<div class='kt-padding-5'>"
								 									+ "<i class='fa flaticon-edit-1 kt-margin-r-5'></i>"
							 										+ "<span data-lang-cd='stm2102.label.board'>"+$.osl.lang("stm2102.label.board")+"</span>"
						 										+  "</div>";
									 			if(badCntInfo != "N"){
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badAllCntY", badCntInfo.badCntAll , badCntInfo.badCntDel)
																+  "</div>";
									 			}else{
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badAllCntN")
																+  "</div>";	
									 			}
									 			if(badHitInfo != "N"){
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badHitInfoY", badHitInfo.badHit)
																+  "</div>";
									 			}else{
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badHitInfoN")
																+  "</div>";
									 			}
									 			if(pwCnt != 0){
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badPwCntY", pwCnt)
																+  "</div>";
									 			}else{
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badPwCntN")
																+  "</div>";
									 			}
						 					 	resultStr += "</div>"//게시글 끝
								 					 		//태그
									 					 	+ "<div class='col-lg-6 col-md-6 col-sm-6 col-6'>"
								 								+ "<div class='kt-padding-5'>"
								 									+ "<i class='fa flaticon-interface-9 kt-margin-r-5'></i>"
																	+ "<span data-lang-cd='stm2102.label.tag'>"+$.osl.lang("stm2102.label.tag")+"</span>"
																+  "</div>";
									 	if(!$.osl.isNull(tagInfo) && tagInfo != "N"){
									 		$.each(tagInfo, function(index, value){
									 			if(index < 3){ //sql 조회 top 5
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.tagLabelY",index+1, $.osl.escapeHtml(value.tagNm))
																+  "</div>";
												}
									 		});
									 	}else{
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.tagLabelN")
																+  "</div>";
									 	}
											 	resultStr += "</div>" //태그 끝
												 			+ "</div>"//게시글 + 태그 끝
								 							//첨부파일
								 							+ "<div class='row kt-margin-t-5 kt-margin-b-5'>"
								 								//첨부파일
								 								+ "<div class='col-lg-6 col-md-6 col-sm-6 col-6'>"
									 								+ "<div class='kt-padding-5'>"
									 									+ "<i class='fa flaticon-tool-1 kt-margin-r-5'></i>"
								 										+ "<span data-lang-cd='stm2102.label.attachFile'>"+$.osl.lang("stm2102.label.attachFile")+"</span>"
							 										+  "</div>";
												if(fileSummery != "N"){
														resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																			+ $.osl.lang("stm2102.summery.fileAllCntY", parseInt(fileSummery.fileTotalCnt))
																	+  "</div>"
																	+ "<div class='kt-margin-5 kt-padding-l-20'>"
																			+ $.osl.lang("stm2102.summery.fileAllSizeY", $.osl.byteCalc(parseInt(fileSummery.fileTotalSize)))
																	+  "</div>";
												}else{
														resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																			+ $.osl.lang("stm2102.summery.fileAllCntN")
																	+  "</div>"
																	+ "<div class='kt-margin-5 kt-padding-l-20'>"
																			+ $.osl.lang("stm2102.summery.fileAllCntN")
																	+  "</div>";
												}
								 					resultStr += "</div>" //첨부파일 끝
															+ "</div>" //첨부파일 끝
															//수정 관리 버튼 영역
															+ "<div class='row kt-padding-t-15 kt-padding-b-15 kt-align-right'  data-menu-id='"+row.menuId+"' data-stm-type-cd='"+row.stmTypeCd+"' data-stm-name='"+$.osl.escapeHtml(row.stmNm)+"' data-stm-ds-type-cd='"+row.stmDsTypeCd+"'>"
																+ "<div class='col-12 kt-padding-0'>"
																	+ "<button type='button' class='btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air updateBtn' data-datatable-action='update' title='"+$.osl.lang("stm2100.actionBtn.updateTooltip")+"' data-title-lang-cd='stm2100.actionBtn.updateTooltip' data-toggle='kt-tooltip' data-skin='brand' data-placement='top' data-auth-button='update'>"
																		+ "<i class='fa fa-edit'></i>"
																		+ "<span data-lang-cd='datatable.button.update'>"+$.osl.lang("datatable.button.update")+"</span>"
																	+ "</button>"
																	+ "<button type='button' class='btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air settingBtn' data-datatable-action='detail' title='"+$.osl.lang("stm2100.actionBtn.managmentTooltip")+"' data-title-lang-cd='stm2100.actionBtn.managmentTooltip' data-toggle='kt-tooltip' data-skin='brand' data-placement='top' data-auth-button='detail'>"
																		+ "<i class='fa flaticon-settings-1'></i>"
																		+ "<span data-lang-cd='stm2100.button.detail'>"+$.osl.lang("stm2100.button.detail")+"</span>"
																	+ "</button>"
																+ "</div>"
															+ "</div>"
														+"</div>" //수정 관리 버튼 영역 끝
													+ "</div>"//통계부분 끝
												+ "</div>"
											+ "</div>"
										+ "</div>" //kt-portlet kt-portlet--mobile end
									+ "</div>";
					}
				});
			 //AJAX 전송
			 ajaxObj.send();
		 };
		 
		 /*
		 * function : drawChart
		 * param : menuId
		 * function 설명 : 차트 그리기위한 한달 데이터 조회
		 */
		 var drawChart = function(index, menuId){
			 var data = {
					 menuId : menuId,
			 }
			//ajax 설정
	    	var ajaxObj = new $.osl.ajaxRequestAction(
	    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2102BadSummeryChartInfoAjax.do'/>"}
					, data);
			//ajax 전송 성공 함수
	    	ajaxObj.setFnSuccess(function(data){
	    		if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
					//모달 창 닫기
					$.osl.layerPopupClose();
				}else{
					var chartData = data.chartData;
					
					var chartDate = [];
					var newPostData = [];
					var delPostData = [];
					
					$.each(chartData, function(idx, value){
						chartDate.push(value.chartDate);
						newPostData.push(value.totalNewCnt);
						delPostData.push(value.delCnt);
					});
					
					var chartOpt = {
						chart: {
							height: 320,
							type: "area", //line, area, bar, heatmap
							//stacked: false,
							toolbar : {
								show: true,
								offsetX: 0,
								offsetY: 0,
								tools: {
									download: true,
									selection: true,
									zoom: false,
									zoomin: '<i class="fa fa-plus-circle osl-icon-transform__scale--150"></i>',
									zoomout: '<i class="fa fa-minus-circle osl-icon-transform__scale--150"></i>',
									pan: '<i class="fa fa-expand-arrows-alt osl-icon-transform__scale--150"></i>',
									reset: '<i class="fa flaticon2-refresh-1"></i>',
									customIcons: [
										/* 
										{
											icon: '<i class="fa flaticon-more"></i>',
											index: 4,
											title: 'tooltip of the icon',
											class: 'custom-icon',
											click: function (chart, options, e) {
											  console.log("clicked custom-icon")
											}
										}
										 */
									]
								}
							},
						},
						grid:{
							show: false
						},
						colors: ["#586272", "#1cac81"],
						series: [
							{
								name: $.osl.lang("stm2100.chart.deletePost"),
								data: delPostData,
							},
							{
								name: $.osl.lang("stm2100.chart.newPost"),
								data: newPostData,
							},
						],
						fill:{
							type : "gradient",
							gradient : {
								shadeIntensity: 1,
								opacityFrom: 0.7,
								opacityTo: 0.9,
								stops: [0, 90, 100]
							}
						},
						xaxis: {
							categories: chartDate,
						},
						yaxis:{
							show: false
						},
						noData:{
							text : $.osl.lang("stm2100.chart.noData"),
							align : "center",
							verticalAlign: "middle",
							offsetX: 0,
							offsetY: 0,
						}
					};
					
					var chart = new ApexCharts(document.querySelector("#drawChart"+index), chartOpt);
					chart.render();
					
					$(".apexcharts-zoomout-icon").addClass("kt-margin-0");
					$(".apexcharts-reset-icon").addClass("kt-margin-0");
					$(".apexcharts-toolbar").addClass("kt-margin-10");
					$(".apexcharts-toolbar").attr("style", "top:-20px; right: 10px;");
					$(".apexcharts-toolbar").removeAttr("style[padding]");
				}
			});
			
	    	//AJAX 전송
			ajaxObj.send();
		 }
		 
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