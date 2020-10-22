<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.kt-widget__wrapper>button{
	min-width: 43px;
	max-height : 35.33px;
	
}
</style>
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
			<c:if test="${not empty param.stmTypeCd}">
				<c:if test="${param.stmTypeCd eq '01' }">
					<i class="la la-newspaper-o kt-margin-r-5"></i>[일반]
				</c:if>
				<c:if test="${param.stmTypeCd eq '02' }">
					<i class="la la-server kt-margin-r-5"></i>[자료실]
				</c:if>
				<c:out value="${param.stmNm }"/>
			</c:if>
			<c:if test="${empty param.stmTypeCd}">
				<span name="badTitle" id="badTitle"></span>
			</c:if>
			</h3>
			<input type="hidden" id="stmNm" name="stmNm" value='${param.stmNm}'/>
			<input type="hidden" id="stmTypeCd" name="stmTypeCd" value='${param.stmTypeCd}'/>
			<input type="hidden" id="stmDsTypeCd" name="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
			<input type="hidden" id="menuId" name="menuId" value='${param.menuId}'/>
			<input type="hidden" id="stmRootYn" name="stmRootYn" value='${param.stmRootYn}'/>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper" style="">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1000BadTable" data-datatable-action="select" title="데이터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span>조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1000BadTable" data-datatable-action="insert" title="게시글 추가" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
					<i class="fa fa-plus"></i><span>추가</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1000BadTable" data-datatable-action="update" title="게시글 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
					<i class="fa fa-edit"></i><span>수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1000BadTable" data-datatable-action="delete" title="게시글 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
					<i class="fa fa-trash-alt"></i><span>삭제</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1000BadTable" data-datatable-action="detail" title="게시글 상세" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="detail" tabindex="5">
					<i class="fa flaticon2-document"></i><span>상세</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="col-lg-5 col-md-6 col-sm-6">
			<div class="osl-datatable-search" data-datatable-id="bad1000BadTable"></div>
		</div>
		<div class="kt_datatable" id="bad1000BadTable"></div>
	</div>
</div>
<!-- begin page script -->
<script>
 "use strict";
 var OSLBad1000Popup = function() {
	 //담당자/글작성범위 해당 여부(Y/N)를 담을 변수 선언
	 var okManager;
	 var okWriter;
	 
	 //현재 로그인 사용자 id
	 var id = $.osl.user.userInfo.usrId;
	 
	 //데이터 테이블 아이디
	 var dataTableId = "bad1000BadTable";
	 
	 var documentSetting = function() {
		 //시스템 관리 게시판에서 접근하는 경우 검색 조건 '삭제유무', '댓글' 추가
		 var searchAdd;
		 //시스템 관리 게시판에서 넘오는 것이 아니라 일반 메뉴로 들어올 경우
		 //메뉴id와 게시판 유형, 게시판명을 받아 저장
		 if($("#menuId").val()=="" || $("#stmDsTypeCd").val()==null ||$("#stmDsTypeCd").val()=="" || $("#stmNm").val()==null || $("#stmNm").val()==""){
			 getDsTypeCdAndMenuId();
			 searchAdd = [
					{field: 'badContent', title:"내용", searchOrd: 2},
					{field: 'badNtcCheck', title:"공지유무", searchOrd: 4, searchType:"select", searchCd: "CMM00001"},
				]
		 }else{
			 searchAdd = [
					{field: 'badContent', title:"내용", searchOrd: 2},
					{field: 'badNtcCheck', title:"공지유무", searchOrd: 4, searchType:"select", searchCd: "CMM00001"},
					{field: 'delCd', title:"삭제유무", searchOrd: 5, searchType:"select", searchCd: "CMM00001"},
					{field: 'cmtContent', title:"댓글내용", searchOrd: 5},
				];
		 }

		 //게시판 속성값 담을 변수 선언(insert에 전달하기 위해)
		 var checkOptionStm = true;
		 var stmOptionCnt = 0;
		 var stmNtcYnCd;
		 var stmPwYnCd;
		 var stmTagYnCd;
		 var stmCmtYnCd;
		 var stmFileCnt;
		 var stmFileStrg;
		var modalSize;
		 
		 //권한 체크 ->결과값 okManager, okWriter
		 checkUser();
		 
		 //게시글 목록 출력
		 $.osl.datatable.setting(dataTableId, {
			 data: {
				 source: {
					 read: {
						url: "/bad/bad1000/bad1000/selectBad1000ListAjax.do",
						params : {
							stmTypeCd: $("#stmTypeCd").val(),
							menuId: $("#menuId").val(),
							dsTypeCd : $("#stmDsTypeCd").val(),
							stmRootYn : $("#stmRootYn").val(), //시스템 게시판에서 접근 시 삭제된 게시글도 확인
						}
					 }
				 },
				 pageSize: 8,
			 },
			 toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [8, 10, 20, 30, 50, 100]
					}
				}
			},
			 columns: [
				 {field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: "kt-checkbox--solid"}, sortable: false, autoHide: false},
				 {field: 'badNum', title: 'No.', textAlign: 'center', width: 50, autoHide: false,
					 template:function(row){
						 if(checkOptionStm){
							//게시판 옵션 한번 체크
							if(row.stmNtcYnCd == '01'){
								stmOptionCnt++;
							}
							if(row.stmPwYnCd == '01'){
								stmOptionCnt++;
							}
							if(row.stmTagYnCd == '01'){
								stmOptionCnt++;
							}
							if(row.stmCmtYnCd == '01'){
								stmOptionCnt++;
							}
							if(row.stmFileCnt > 0){
								stmOptionCnt++;
							}
							if(row.stmFileStrg > 0){
								stmOptionCnt++;
							}
							checkOptionStm = false;
							
							//게시판 옵션 담기
							stmNtcYnCd = row.stmNtcYnCd;
							stmPwYnCd = row.stmPwYnCd;
							stmTagYnCd = row.stmTagYnCd;
							stmCmtYnCd = row.stmCmtYnCd;
							stmFileCnt = row.stmFileCnt;
							stmFileStrg = row.stmFileStrg;
							
							//모달크기
							if(stmOptionCnt==0){
								modalSize = "md";
							}else{
								modalSize = "xl";
							}
						 }
						return row.badNum;
					 }
				 },
				 {field: 'badTitle', title: '제목', textAlign: 'left', width: 400, autoHide: false, search: true,
					template: function(row){
						var returnStr = "";
						// 시스템 게시판 관리 메뉴에서 접근한 경우
						// 삭제된 게시글인 경우
						if($("#stmRootYn").val() != null && $("#stmRootYn").val() != ""){
							if($("#stmRootYn").val() == "Y"){
								if(row.delCd == "01"){
									returnStr += "<span class='kt-badge kt-badge--dark kt-badge--inline kt-badge--pill kt-margin-5'>삭제</span>";
								}
							}
						}
						// 공지사항인 경우
						if(row.badNtcCheck == "01"){
							returnStr += "<span class='kt-badge kt-badge--danger kt-badge--inline kt-badge--pill kt-margin-5'>공지</span>";
						}
						// 제목
						returnStr += $.osl.escapeHtml(row.badTitle);
						// 댓글이 있는 경우
						if(row.badCmtCnt > 0){
							returnStr += "<span class='kt-badge kt-badge--metal kt-badge--inline kt-margin-10 kt-padding-10'>"+row.badCmtCnt+"</span>";
						}
						// 비밀번호가 걸린 글인 경우
						if(row.badPw == "01"){
							returnStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
						}
						return returnStr;
					}, 
				 },
				 {field: 'badHit', title: '조회수', textAlign: 'center', width: 100},
				 {field: 'badFileCnt', title: '첨부파일수', textAlign: 'center', width: 100},
				 {field: 'badUsrId', title: '작성자', textAlign: 'left', width: 180,
					template: function (row) {
						return $.osl.user.usrImgSet(row.badUsrImgId, row.badUsrNm+" ( "+row.badUsrId+" )");
					},
					onclick: function(row){
						$.osl.user.usrInfoPopup(row.badUsrId);
					}
					, autoHide: false, search: true },
				{field: 'badWtdtm', title: '작성일', textAlign: 'center', width: 150, search: true, searchType:"daterange",
					template: function(row){
						var paramDatetime = new Date(row.badWtdtm);
						var agoTime = new Date() - paramDatetime;
						if(agoTime < 1000 * 60){
							return $.osl.datetimeAgo(paramDatetime, {returnTime: "s"}).agoString;
						}else if(agoTime < 1000 * 60 * 60){
							return $.osl.datetimeAgo(paramDatetime, {returnTime: "m"}).agoString;
						}else if(agoTime < 1000 * 60 * 60 * 24){
							return $.osl.datetimeAgo(paramDatetime, {returnTime: "h"}).agoString;
						}else{
							return paramDatetime.format("yyyy-MM-dd");
						}
					},	
				}
			],
			searchColumns: searchAdd,
			actionBtn:{
				"title" : "수정 / 삭제 / 상세",
				"width" : 200,
				"detail" : true
			},
			actionTooltip:{
				"update" : "게시글 수정",
				"delete": "게시글 삭제",
				"detail": "게시글 상세보기",
			},
			actionFn:{
				"insert":function(rowData){
					var data = {
							type:"insert",
							menuId : $("#menuId").val(),
							stmNtcYnCd : stmNtcYnCd,
							stmPwYnCd : stmPwYnCd,
							stmTagYnCd : stmTagYnCd,
							stmCmtYnCd : stmCmtYnCd,
							stmFileCnt : stmFileCnt,
							stmFileStrg : stmFileStrg,
							stmOptionCnt : stmOptionCnt
						};
					var options = {
							idKey: "bad1002_insert",
							modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]",
							closeConfirm: true,
							autoHeight: false,
							modalSize: modalSize,
						};
					
					if(okManager == true || okWriter == true){
						$.osl.layerPopupOpen('/bad/bad1000/bad1000/insertBad1002View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("bad1000.notAuthority.insertMessage"), {"type":"warning"});
					}
				},
				"detail": function(rowDatas, datatableId, type, rowNum){
					var rowData;
					if(type == "list"){
						if(rowNum != 1){
							$.osl.alert($.osl.lang("bad1000.selectBadInfoCnt", rowNum));
						}else{
							rowData = rowDatas[0];
						}
					}else{
							rowData = rowDatas;
					}
					rowData.stmOptionCnt = stmOptionCnt;
					var data = {
							stmTypeCd : $("#stmTypeCd").val(),
							stmNm : $.osl.escapeHtml($("#stmNm").val()),
							paramRow : JSON.stringify(rowData),
							backPageYn: "N",
							stmRootYn: $("#stmRootYn").val(),
						};
					var options = {
							idKey: "bad1001_"+ rowData.badId,
							modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+rowData.badNum,
							closeConfirm: false,
							autoHeight: false,
							modalSize: "xl",
						};
					var pwOptions = {
							idKey: "bad1004_"+rowData.badId,
							modalTitle: "비밀번호 확인",
							closeConfirm: false,
							autoHeight: false,
							modalSize: "sm",
						};
					
					if(okManager == true || okWriter == true){
						if(okManager == true){
							//담당자는 비밀번호 없이도 게시글 확인 가능
							$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1001View.do',data,options);
						}else{
							if(rowData.badPw == "01"){
								$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1004PwView.do', data, pwOptions);
							}
							else{
			 					$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1001View.do',data,options);
							}
						}
					}else{
						$.osl.alert($.osl.lang("bad1000.notAuthority.selectMessage"), {"type":"warning"});
					}
				},
				"update":function(rowData){
					var data = {
							detailRootYn : 'N',
							stmDsTypeCd: $("#stmDstypeCd").val(),
							stmNm: $.osl.escapeHtml($("#stmNm").val()),
							stmRootYn: $("#stmRootYn").val(),
							paramRow : JSON.stringify(rowData),
							stmOptionCnt : stmOptionCnt,
						};
					var options = {
							idKey: "bad1003_"+rowData.badId,
							modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+rowData.badNum,
							closeConfirm: true,
							autoHeight: false,
							modalSize: modalSize,
						};
					if(okManager == true || rowData.badUsrId == id){
	 					$.osl.layerPopupOpen('/bad/bad1000/bad1000/updateBad1003View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("bad1000.notAuthority.updateMessage"), {"type":"warning"});
					}
				},
				"delete":function(rowDatas){
					var data = {
							menuId : $("#menuId").val(),
							stmTypeCd : $("#stmTypeCd").val(),
							deleteDataList : JSON.stringify(rowDatas),
							menuRootYn: "Y",
							cmtRootYn: "N",
					};
					var titleStr;
					if(rowDatas.length >= 1){
						titleStr = "[ NO." + rowDatas[0].badNum +"] 게시글";
						if(rowDatas.length>1){
							titleStr += " 외 [ " + (rowDatas.length -1) + " ] 건";
						}
					}
					var options = {
							idKey: "bad1005_"+rowDatas.badId,
							modalTitle: titleStr + " 삭제 사유",
							closeConfirm: false,
							autoHeight: false,
							modalSize: "xl",
						};
					//담당자 외 삭제 선택한 글 중 본인 외 글이 포함된 경우인지 확인
					var selfCheck = "Y";
					$.each(rowDatas, function(idx, value){
						if(value.badUsrId != id){
							selfCheck = "N";
						}
					});
					if(okManager == true || (okWriter == true && selfCheck == "Y")){
						//삭제 사유 팝업
						$.osl.layerPopupOpen('/bad/bad1000/bad1000/deleteBad1000View.do', data, options);
					}else{
						if(okWriter == true && selfCheck == "N"){
							$.osl.alert($.osl.lang("bad1000.notWriter.deleteMessage"), {"type":"warning"});
						}else{
							$.osl.alert($.osl.lang("bad1000.notAuthority.deleteMessage"), {"type":"warning"});
						}
					}
				},
			 },
			 theme: {
				 actionBtn:{
					 "detail" : "",
				 },
				 actionBtnIcon:{
					 "detail": "fa flaticon2-document",
				 }
			 }
		 });
	 };
	 
	 var getDsTypeCdAndMenuId = function(){
		//ajax 설정
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1000/selectBad1000DsTypeGetAjax.do'/>", "async": false});
	 
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				$("#menuId").val(data.menuId);
				$("#stmDsTypeCd").val(data.stmInfo.stmDsTypeCd);
				$("#stmNm").val(data.stmInfo.stmNm);
				
				$("#badTitle").empty();
				var innerHtml ="";
				if(data.stmInfo.stmTypeCd == '01'){
					innerHtml = "<i class='la la-newspaper-o kt-margin-r-5'></i>[일반]";
				}else if(data.stmInfo.stmTypeCd == '02'){
					innerHtml = "<i class='la la-server kt-margin-r-5'></i>[자료실]";	
				}else{
					//갤러리, 영상 - 추후 작성
				}
				innerHtml += $.osl.escapeHtml(data.stmInfo.stmNm);
				$("#badTitle").append(innerHtml);
				$("#stmTypeCd").val(data.stmInfo.stmTypeCd);
			}
		});
    	//AJAX 전송
		ajaxObj.send();	
	 };

	 /*
	 * function : checkUser
	 * function 설명 : 담당자, 글작성범위에 해당하는지 사용자 체크
	 */
	 var checkUser = function(){
		 var data = {
				 authGrpId : $.osl.selAuthGrpId,
				 prjGrpId :$.osl.selPrjGrpId,
	   			 prjId : $.osl.selPrjId,
				 menuId : $("#menuId").val(),
				 dsTypeCd : $("#stmDsTypeCd").val(),
		 };
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
				if(result.resultManager == "Y"){
					okManager = true;	
				}else{
					okManager = false;
				}
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
	 };
		 
	 return {
		 init: function(){
			 documentSetting();
		 }
	 };
 }();
 
 $.osl.ready(function(){
	 OSLBad1000Popup.init();
 });
</script>
<!-- end script -->
