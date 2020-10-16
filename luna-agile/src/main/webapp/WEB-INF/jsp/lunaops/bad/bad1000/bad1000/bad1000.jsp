<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	 var okManager;
	 var okWriter;
	 var id = $.osl.user.userInfo.usrId;
	 var dataTableId = "bad1000BadTable";
	 var documentSetting = function() {
		 //시스템 관리 게시판에서 접근하는 경우 검색 조건 '삭제유무'추가
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
				];
		 }

		 //권한 체크
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
				 {field: 'badNum', title: 'No.', textAlign: 'center', width: 50, autoHide: false},
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
						returnStr += row.badTitle;
						// 댓글이 있는 경우
						if(row.badCmtCnt > 0){
							returnStr += "<span class='kt-badge kt-badge--success kt-badge--inline kt-badge--pill kt-margin-5'>"+row.badCmtCnt+"</span>";
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
			rows: {
				beforeTemplate: function(row, data, index){
					if(data.delCd == "01"){
						/* $.each($(row).children("td"), function(idx, val){
							$(val).css("text-decoration", "line-through");
						}); */
						/* $(row).css("background-color", "#d3dae6"); */
					}
				},
			},
			actionBtn:{
				"title" : "수정 / 삭제 / 상세",
				"width" : 200,
				"click" : true
			},
			actionTooltip:{
				"update" : "게시글 수정",
				"delete": "게시글 삭제",
				"click": "게시글 상세보기",
			},
			actionFn:{
				"insert":function(rowData){
					var data = {
							type:"insert",
							menuId : $("#menuId").val(),
						};
					var options = {
							idKey: "bad1002_insert",
							modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]",
							closeConfirm: true,
							autoHeight: false,
							modalSize: "xl",
						};
					
					if(okManager == true || okWriter == true){
						$.osl.layerPopupOpen('/bad/bad1000/bad1000/insertBad1002View.do',data,options);
					}else{
						$.osl.alert("게시글 작성 권한이 없습니다.", {"type":"warning"});
					}
				},
				"click": function(rowData){
					var targetId = $(".osl-datatable-search__dropdown[data-datatable-id="+dataTableId+"] > .dropdown-item.active").data("field-id");
					var targetType = $(".osl-datatable-search__dropdown[data-datatable-id="+dataTableId+"] > .dropdown-item.active").data("opt-type");
					var targetData;
					if(targetType == "select"){
						targetData = $(".osl-datatable-search__select[data-datatable-id="+dataTableId+"]").val();
					}else if(targetType == "all"){
						targetData = null;
					}else{
						targetData = $(".osl-datatable-search__input[data-datatable-id="+dataTableId+"] > input#searchData").val();
					}
					var searchTargetData = [{
						searchTargetId : targetId,
						searchTargetType : targetType,
						searchTargetData : targetData
					}];
					var data = {
							stmTypeCd : $("#stmTypeCd").val(),
							stmNm : $("#stmNm").val(),
							badNum : rowData.badNum,
							menuId : $("#menuId").val(),
							prjGrpId : rowData.prjGrpId,
				   			prjId : rowData.prjId,
							badId : rowData.badId,
							badDelCd : rowData.delCd,
							atchFileId : rowData.atchFileId,
							searchTarget : JSON.stringify(searchTargetData),
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
						$.osl.alert("게시글에 대한 접근 권한이 없습니다.", {"type":"warning"});
					}
				},
				"update":function(rowData){
					var targetId = $(".osl-datatable-search__dropdown[data-datatable-id="+dataTableId+"] > .dropdown-item.active").data("field-id");
					var targetType = $(".osl-datatable-search__dropdown[data-datatable-id="+dataTableId+"] > .dropdown-item.active").data("opt-type");
					var targetData;
					if(targetType == "select"){
						targetData = $(".osl-datatable-search__select[data-datatable-id="+dataTableId+"]").val();
					}else if(targetType == "all"){
						targetData = null;
					}else{
						targetData = $(".osl-datatable-search__input[data-datatable-id="+dataTableId+"] > input#searchData").val();
					}
					var searchTargetData = [{
						searchTargetId : targetId,
						searchTargetType : targetType,
						searchTargetData : targetData
					}];
					var data = {
							detailRootYn : 'N',
							prjGrpId : rowData.prjGrpId,
							stmDsTypeCd: $("#stmDstypeCd").val(),
							stmNm: $.osl.escapeHtml($("#stmNm").val()),
				   			prjId : rowData.prjId,
							menuId : $("#menuId").val(),
							badId : rowData.badId,
							badDelCd : rowData.delCd,
							atchFileId: rowData.atchFileId,
							searchTarget : JSON.stringify(searchTargetData),
							stmRootYn: $("#stmRootYn").val(),
						};
					var options = {
							idKey: "bad1003_"+rowData.badId,
							modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+rowData.badNum,
							closeConfirm: true,
							modalSize: "xl",
						};
					if(okManager == true || rowData.badUsrId == id){
	 					$.osl.layerPopupOpen('/bad/bad1000/bad1000/updateBad1003View.do',data,options);
					}else{
						$.osl.alert("해당 게시글에 대한 수정 권한이 없습니다.", {"type":"warning"});
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
							$.osl.alert("본인의 글만 삭제 가능합니다.", {"type":"warning"});
						}else{
							$.osl.alert("해당 게시글에 대한 삭제 권한이 없습니다.", {"type":"warning"});
						}
					}
				},
			 },
			 theme: {
				 actionBtnIcon:{
					 "click": "la la-external-link",
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
