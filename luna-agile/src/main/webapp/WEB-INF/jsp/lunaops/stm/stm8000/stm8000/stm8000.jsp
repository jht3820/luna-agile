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
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="selectedConnect" title="선택 저장소 연결 확인" data-title-lang-cd="" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="selectedConnect" tabindex="1">
					<i class="fab fa-usb"></i><span data-lang-cd="">선택 접속 확인</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="allConnect" title="전체 저장소 연결 확인" data-title-lang-cd="" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="allConnect" tabindex="2">
					<i class="fab fa-usb"></i><span data-lang-cd="">전체 접속 확인</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="select" title="저장소 조회" data-title-lang-cd="stm8000.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="3">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="insert" title="저장소 추가" data-title-lang-cd="stm8000.actionBtn.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="4">
					<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="update" title="저장소 수정" data-title-lang-cd="stm8000.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="5">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="delete" title="저장소 삭제" data-title-lang-cd="stm8000.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="6">
					<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-12">
				<div class="osl-datatable-search" data-datatable-id="stm8000RepTable"></div>
			</div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide" id="stm8000RepTable"></div>
	</div>
</div>
<!-- begin page script -->
<script>
 "use strict";

 var OSLStm8000Popup = function() {
	 
	 var datatableId = "stm8000RepTable";
	 
	 var documentSetting = function() {
		 $.osl.datatable.setting(datatableId,{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000ListAjax.do"
						}
					},
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'result', title: '접속 확인', textAlign: 'center', width: 80, autoHide: false, sortable: false,
						template: function(row){
							// 기본 원 아이콘으로 세팅
							return '<i class="fas fa-circle"></i>';
						}	
					},
					{field: 'useNm', title: '사용 여부', textAlign: 'center', width: 35, search: true, searchType:"select", searchCd: "CMM00001", searchField:"usrCd", sortField:"usrCd"},
					{field: 'strgTypeNm', title: '유형', textAlign: 'left', width: 40, search: true, searchType:"select", searchCd: "STM00004", searchField:"strgTypeCd", sortField: "strgTypeCd"},
					{field: 'strgRepTitle', title: '저장소명', textAlign: 'left', width: 200, search: true},
					{field: 'strgTxt', title: '저장소 설명', textAlign: 'left', width: 240, search: true},
					{field: 'strgRepUrl', title: '저장소 URL', textAlign: 'left', width: 240},
				],
				rows:{
					clickCheckbox: true
				},
				actionBtn:{
					"title" : "수정 / 삭제 / 상세 / 접속 확인",
					"dblClick": true,
					"selectedConnect" : true,
					"allConnect" : true
				},
				actionTooltip:{
					"update": "수정",
					"delete": "삭제",
					"dblClick" : "상세",
					"selectedConnect" : "선택 접속 확인",
					"allConnect" : "전체 접속 확인",
				},
				actionFn:{
					"insert":function(datatableId, type, rowNum){
						var data = {type:"insert"};
						var options = {
								idKey: datatableId,
								modalTitle: "저장소 추가",
								closeConfirm: false,
								autoHeight:false,
							};
						
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8001View.do',data,options);
					},
					"update":function(rowData, datatableId, type){
						var data = {
								type:"update",
								strgRepId: rowData.strgRepId,
							};
						var options = {
								idKey: datatableId,
								modalTitle: "저장소 수정",
								closeConfirm: false,
								autoHeight:false,
							};
						
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8001View.do',data,options);
					},
					"delete":function(rowDatas, datatableId, type){
						var data = {
								deleteDataList : JSON.stringify(rowDatas),
							};
						//AJAX 설정
				    	var ajaxObj = new $.osl.ajaxRequestAction(
				    			{"url":"<c:url value='/spr/spr2000/spr2000/deleteSpr2000MmtListAjax.do'/>"}
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
					"dblClick":function(rowData, datatableId, type, rowNum){
						var data = {
								strgRepId: rowData.strgRepId,
							};
						var options = {
								idKey: rowData.strgRepId,
								modalTitle: "["+$.osl.escapeHtml(rowData.strgRepTitle)+"] 저장소 상세보기",
								modalSize: "fs",
								closeConfirm: false
							};
						
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8002View.do',data,options);
					},
					"selectedConnect" : function(rowDatas, datatableId, type, rowNum, elem){
						var selectRows;
						
						if(type == "list"){
							//선택 항목이 리스트인 경우
							if(rowNum == 0){
								$.osl.alert("현재 선택한 갯수 : "+ rowNum, {"type":"warrning"});
							}else {
								//다중인 경우
								selectRows = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
								strgConnectionCheck(selectRows, rowDatas, 0);
							}
						}else{
							//선택 항목이 row 단건인 경우
							selectRows = $(elem).closest("tr");
							var datas = [];
							datas.push(rowDatas);
							strgConnectionCheck(selectRows, datas, 0);
						}
					},
					"allConnect" : function(rowDatas, datatableId, type, rowNum){
						var targetTableElmt = $.osl.datatable.list[datatableId].targetDt;
						// 체크박스 전체 체크
						targetTableElmt.setActiveAll(true);
						
						// 선택한 row
						var selectRows = targetTableElmt.getSelectedRecords();
						//데이터 테이블에서 data 정보 가져오기
						var rowDataList = [];
						// 선택한 row에서 data를 추출하여 rowDataList에 세팅
						$.each(selectRows, function(idx, map){
							var rowIdx = $(map).data("row");
							rowDataList.push(targetTableElmt.getDataSet()[rowIdx]);
						});
						
						strgConnectionCheck(selectRows, rowDataList, 0);
					}
				},
				theme:{
					actionBtn:{
						"selectedConnect" : "",
						"allConnect" : " kt-hide"
					},
					actionBtnIcon:{
						"selectedConnect" : "fab fa-usb",
					}
				},
				callback:{
					initComplete: function(evt, config){
						//숨겨진 버튼 완전히 감추기 - 영역제거
						$('table>.btn[data-auth-button=allConnect]').hide();
					},
					ajaxDone: function(evt, list){
					}
				}
		 });
	 }
	 
	/**
	* function 명 	: strgConnectionCheck
	* function 설명	: 저장소 연결 확인하기
	* param selectRows : 데이터테이블에서 선택한 row List
	* param rowDatas : 데이터테이블에서 선택한 row의 데이터 List
	* param idx : row와 rowData를 가져오기 위한 index값
	*/
	var strgConnectionCheck = function(selectRows, rowDatas, index){
		
		//index가 선택한 row의 데이터 길이보다 크거나 같으면 종료
		if(index >= rowDatas.length){
			return false;
		}
		
		// 접속 확인 아이콘변경
		var targetElmt = $(selectRows[index]).children("td[data-field='result']").find("i");
	
		// 기존 아이콘 class 모두 제거
		targetElmt.removeClass("fa-circle");
		targetElmt.removeClass("fa-times-circle osl-color--red");
		targetElmt.removeClass("fa-check-circle osl-color--blue");
	
		// progress 아이콘으로 변경
		targetElmt.addClass("fa-circle-notch fa-spin");
		
		var repoId = rowDatas[index].strgRepId;
		var repoType = rowDatas[index].strgTypeCd;
		var repoName = rowDatas[index].strgRepTitle;
		
		var data = {
				strgRepId : repoId
		};
		
		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000RepoConnectCheckAjax.do'/>"}
   				, data);
		
   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				// 기존 아이콘 모두 제거
   				targetElmt.removeClass("fa-circle-notch fa-spin");
   				
   				//저장소 유형이 svn인 경우
   				if(repoType == "01"){
   					if(data.connectResult == "SVN_OK"){
   	   					//연결 성공
   						targetElmt.addClass("fa-check-circle osl-color--blue");
   		   				$.osl.toastr($.osl.escapeHtml(repoName) + "접속 성공");
   	   				}else if(data.connectResult == "SVN_AUTHENTICATION_EXCEPTION"){
   	   					//사용자 id 또는 pw 실패
   	   					targetElmt.addClass("fa-times-circle osl-color--red");
   	   					$.osl.toastr($.osl.escapeHtml(repoName) + "접속 실패 : ID 또는 PW 확인하세요.");
   	   				}else{
   	   					//잘못된 url
   	   					targetElmt.addClass("fa-times-circle osl-color--red");
   	   					$.osl.toastr($.osl.escapeHtml(repoName) + "접속 실패 : URL을 확인하세요.");
   	   				}
   				}else{
   					//git인 경우 - 현재 실패로 통일...
   					targetElmt.addClass("fa-times-circle osl-color--red");
   					$.osl.toastr($.osl.escapeHtml(repoName) + "접속 실패");
   				}
   				
   				// 다음 저장소 연결 체크
   				strgConnectionCheck(selectRows, rowDatas, ++index);
   			}
   		});
  	 	//AJAX 전송
   		ajaxObj.send();
	};
	 
	 return {
		 init: function(){
			 documentSetting();
		 }
	 };
 }();
 
 $.osl.ready(function(){
	 OSLStm8000Popup.init();
 });
</script>
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />