<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http:

<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
			<c:if test="${not empty param.stmTypeCd}">
				<c:if test="${param.stmTypeCd eq '01' }">
					<i class="la la-newspaper-o kt-margin-r-5"></i><span data-lang-cd="stm2100.type.normal">[일반]</span>
				</c:if>
				<c:if test="${param.stmTypeCd eq '02' }">
					<i class="la la-server kt-margin-r-5"></i><span data-lang-cd="stm2100.type.storage">[자료실]</span>
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
			<!-- 게시판 속성값이 없을 때 -->
			<input type="hidden" id="stmOptionCnt" name="stmOptionCnt"/>
			<input type="hidden" id="stmNtcYnCd" name="stmNtcYnCd"/>
			<input type="hidden" id="stmPwYnCd" name="stmPwYnCd"/>
			<input type="hidden" id="stmTagYnCd" name="stmTagYnCd"/>
			<input type="hidden" id="stmCmtYnCd" name="stmCmtYnCd"/>
			<input type="hidden" id="stmFileCnt" name="stmFileCnt"/>
			<input type="hidden" id="stmFileStrg" name="stmFileStrg"/>
		</div>
		<div class="kt-portlet__head-toolbar osl-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper" style="">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1000BadTable" data-datatable-action="select" title="게시글 조회" data-title-lang-cd="bad1000.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1000BadTable" data-datatable-action="insert" title="게시글 추가" data-title-lang-cd="bad1000.actionBtn.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
					<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1000BadTable" data-datatable-action="update" title="게시글 수정" data-title-lang-cd="bad1000.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1000BadTable" data-datatable-action="delete" title="게시글 삭제" data-title-lang-cd="bad1000.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
					<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1000BadTable" data-datatable-action="dblClick" title="게시글 상세" data-title-lang-cd="bad1000.actionBtn.detailTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="dblClick" tabindex="5">
					<i class="fa flaticon2-document"></i><span data-lang-cd="bad1000.button.dblClick">상세</span>
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

	 
	 var dataTableId = "bad1000BadTable";
	 
	 
	 var checkStmInfo;
	 
	 var documentSetting = function() {

		 
		 var searchAdd;
		 
		 
		 
		 if($("#stmRootYn").val() == null || $("#stmRootYn").val()==""){
			 
			 getStmInfo();
			 
			 checkStmInfo = false;
			 
			 searchAdd = [
					{field: 'badContent', title:$.osl.lang("bad1000.field.badContent"), searchOrd: 2},
					{field: 'cmtContent', title:$.osl.lang("bad1000.field.cmtContent"), searchOrd: 4},
					{field: 'tagNm', title:$.osl.lang("bad1000.field.tagNm"), searchOrd: 5},
				]
		 }else{
			
			 checkStmInfo = true;
			 
			 searchAdd = [
					{field: 'badContent', title:$.osl.lang("bad1000.field.badContent"), searchOrd: 2},
					{field: 'badNtcCheck', title:$.osl.lang("bad1000.field.badNtcCheck"), searchOrd: 4, searchType:"select", searchCd: "CMM00001"},
					{field: 'delCd', title:$.osl.lang("bad1000.field.delCd"), searchOrd: 5, searchType:"select", searchCd: "CMM00001"},
					{field: 'cmtContent', title:$.osl.lang("bad1000.field.cmtContent"), searchOrd: 6},
					{field: 'tagNm', title:$.osl.lang("bad1000.field.tagNm"), searchOrd: 7},
				];
		 }
		 
		 
		 checkUser();

		 
		 $.osl.datatable.setting(dataTableId, {
			 data: {
				 source: {
					 read: {
						url: "/bad/bad1000/bad1000/selectBad1000ListAjax.do",
						params : {
							stmTypeCd: $("#stmTypeCd").val(),
							menuId: $("#menuId").val(),
							dsTypeCd : $("#stmDsTypeCd").val(),
							stmRootYn : $("#stmRootYn").val(), 
						}
					 }
				 },
				 pageSize : 8,
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
				 	template: function(row){
				 		if(checkStmInfo){
				 			setStmInfo(row);
				 			checkStmInfo = false;
				 		}
				 		return row.badNum;
				 	}
				 },
				 {field: 'badTitle', title: $.osl.lang("bad1000.field.badTitle"), textAlign: 'left', width: 400, autoHide: false, search: true,
					template: function(row){
						var returnStr = "";
						
						if($("#stmRootYn").val() == "Y"){
							if(row.delCd == "01"){
								returnStr += "<span class='kt-badge kt-badge--dark kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1000.label.deleteBadge")+"</span>";
							}
						}
						
						if(row.badNtcCheck == "01"){
							returnStr += "<span class='kt-badge kt-badge--danger kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1000.label.noticeBadge")+"</span>";
						}
						
						returnStr += $.osl.escapeHtml(row.badTitle);
						
						if(row.badCmtCnt > 0){
							returnStr += "<span class='kt-badge kt-badge--metal kt-badge--inline kt-margin-10 kt-padding-10'>"+row.badCmtCnt+"</span>";
						}
						
						if(row.badPw == "01"){
							returnStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
						}
						
						
						return returnStr;
					}, 
				 },
				 {field: 'badHit', title: $.osl.lang("bad1000.field.badHit"), textAlign: 'center', width: 100},
				 {field: 'badFileCnt', title: $.osl.lang("bad1000.field.badFileCnt"), textAlign: 'center', width: 100},
				 {field: 'badUsrId', title: $.osl.lang("bad1000.field.badUsrId"), textAlign: 'left', width: 180,
					template: function (row) {
						var usrData = {
								html: row.badUsrNm + " (" + row.badUsrId + ")",
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
						};
						return $.osl.user.usrImgSet(row.badUsrImgId, usrData);
					},
					onclick: function(row){
						$.osl.user.usrInfoPopup(row.badUsrId);
					}
					, autoHide: false, search: true },
				{field: 'badWtdtm', title:$.osl.lang("bad1000.field.badWtdtm"), textAlign: 'center', width: 150, search: true, searchType:"daterange",
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
				"title" : $.osl.lang("bad1000.actionBtn.title"),
				"width" : 200,
				"click": true,
				"dblClick" : true,
			},
			actionTooltip:{
				"update" : $.osl.lang("bad1000.actionBtn.updateBtn"),
				"delete": $.osl.lang("bad1000.actionBtn.deleteBtn"),
				"dblClick": $.osl.lang("bad1000.actionBtn.dblClick"),
			},
			actionFn:{
				"insert":function(rowData){
					var data = {
							type:"insert",
							menuId : $("#menuId").val(),
							stmNtcYnCd : $("#stmNtcYnCd").val(),
							stmPwYnCd : $("#stmPwYnCd").val(),
							stmTagYnCd : $("#stmTagYnCd").val(),
							stmCmtYnCd : $("#stmCmtYnCd").val(),
							stmFileCnt : $("#stmFileCnt").val(),
							stmFileStrg : $("#stmFileStrg").val(),
							stmOptionCnt : $("#stmOptionCnt").val()
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
						$.osl.alert($.osl.lang("bad1000.notAuthority.insertMessage"), {"type":"warning"});
					}
				},
				"dblClick": function(rowData, datatableId, type, rowNum){
					if(type=="list"){ 
						
						var rowCnt = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords().length;
						if(rowCnt == 0){
							$.osl.alert($.osl.lang("bad1000.selectBadInfoCnt", 0));
							return false;
						}
						if(rowCnt>1){
							$.osl.alert($.osl.lang("bad1000.selectBadInfoCnt", rowCnt));
							return false;
						}
						if(rowCnt == 1){
							
							
							rowData = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords().data("obj");
						}
					}
					
					if(rowData.stmOptionCnt == null || rowData.stmOptionCnt == ""){
						rowData.stmOptionCnt = $("#stmOptionCnt").val();
						rowData.stmNtcYnCd = $("#stmNtcYnCd").val();
						rowData.stmCmtYnCd = $("#stmCmtYnCd").val();
						rowData.stmPwYnCd = $("#stmPwYnCd").val();
						rowData.stmTagYnCd = $("#stmTagYnCd").val();
						rowData.stmFileCnt = $("#stmFileCnt").val();
						rowData.stmFileStrg = $("#stmFileStrg").val();
					}
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
							modalTitle: $.osl.lang("bad1000.title.passwordCheck"),
							closeConfirm: false,
							autoHeight: false,
							modalSize: "sm",
						};
					
					if(okManager == true || okWriter == true || rowData.badUsrId== $.osl.user.userInfo.usrId){
						if(okManager == true || rowData.badUsrId== $.osl.user.userInfo.usrId){
							
							
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
				"update":function(rowData, datatableId, type, rowNum){
					if(rowData.stmOptionCnt == null){
						rowData.stmOptionCnt = $("#stmOptionCnt").val();
						rowData.stmNtcYnCd = $("#stmNtcYnCd").val();
						rowData.stmCmtYnCd = $("#stmCmtYnCd").val();
						rowData.stmPwYnCd = $("#stmPwYnCd").val();
						rowData.stmTagYnCd = $("#stmTagYnCd").val();
						rowData.stmFileCnt = $("#stmFileCnt").val();
						rowData.stmFileStrg = $("#stmFileStrg").val();
					}
					var data = {
							stmDsTypeCd: $("#stmDstypeCd").val(),
							stmNm: $.osl.escapeHtml($("#stmNm").val()),
							stmRootYn: $("#stmRootYn").val(),
							paramRow : JSON.stringify(rowData),
						};
					var options = {
							idKey: "bad1003_"+rowData.badId,
							modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+rowData.badNum,
							closeConfirm: true,
							autoHeight: false,
							modalSize: "xl",
						};
					
					if(okManager == true || rowData.badUsrId == $.osl.user.userInfo.usrId){
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
						if(rowDatas.length>1){
							var num = rowDatas[0].badNum;
							var ect = rowDatas.length-1;
							titleStr = $.osl.lang("bad1000.title.boardCheck.twoStep", num, ect);
						}else{
							titleStr = $.osl.lang("bad1000.title.boardCheck.oneStep", num);
						}
						titleStr +=  " " +$.osl.lang("bad1000.title.deleteReason");
					}
					var options = {
							idKey: "bad1005_"+rowDatas.badId,
							modalTitle: titleStr,
							closeConfirm: false,
							autoHeight: false,
							modalSize: "xl",
						};
					
					var selfCheck = "Y";
					$.each(rowDatas, function(idx, value){
						if(value.badUsrId != $.osl.user.userInfo.usrId){
							selfCheck = "N";
						}
					});
					
					if(okManager == true || (okWriter == true && selfCheck == "Y")){
						
						$.osl.layerPopupOpen('/bad/bad1000/bad1000/deleteBad1000View.do', data, options);
					}else{
						if(okWriter == true && selfCheck == "N"){
							$.osl.alert($.osl.lang("bad1000.notWriter.deleteMessage"), {"type":"warning"});
						}else{
							$.osl.alert($.osl.lang("bad1000.notAuthority.deleteMessage"), {"type":"warning"});
						}
					}
				},
				"click": function(rowData, datatableId, type, rowNum, elem){
					
					
					var targetElem = $(elem).closest("tr").find("label.kt-checkbox").children("input[type=checkbox]");
					if(targetElem.is(":checked")==true){
						targetElem.prop("checked", false);
						$.osl.datatable.list[datatableId].targetDt.setInactive(targetElem);
						
						$(elem).closest("tr").removeClass("osl-datatable__row--selected");
						$(elem).closest("tr").addClass("kt-datatable__row--even");
					}else{
						targetElem.prop("checked", true);
						$.osl.datatable.list[datatableId].targetDt.setActive(targetElem);
					}
				},
			 },
			 theme: {
				 actionBtn:{
					
					 click: " kt-hide"
				 },
				 actionBtnIcon:{
					 "dblClick": "fa flaticon2-document",
				 }
			 }
		 });
		 
		

    		






					 





	 };
	 
	
    
	 var setStmInfo = function(data){
		 var stmOptionCnt = 0;
		 var stmNtcYnCd;
		 var stmPwYnCd;
		 var stmTagYnCd;
		 var stmCmtYnCd;
		 var stmFileCnt;
		 var stmFileStrg;
		 
		stmOptionCnt = 0;
			if(data.stmNtcYnCd == '01'){
				stmOptionCnt++;
			}
			if(data.stmPwYnCd == '01'){
				stmOptionCnt++;
			}
			if(data.stmTagYnCd == '01'){
				stmOptionCnt++;
			}
			if(data.stmCmtYnCd == '01'){
				stmOptionCnt++;
			}
			if(data.stmFileCnt > 0){
				stmOptionCnt++;
			}
			if(data.stmFileStrg > 0){
				stmOptionCnt++;
			}
			
			
			$("#stmOptionCnt").val(stmOptionCnt);
			$("#stmNtcYnCd").val(data.stmNtcYnCd);
			$("#stmPwYnCd").val(data.stmPwYnCd);
			$("#stmTagYnCd").val(data.stmTagYnCd);
			$("#stmCmtYnCd").val(data.stmCmtYnCd);
			$("#stmFileCnt").val(data.stmFileCnt);
			$("#stmFileStrg").val(data.stmFileStrg);
	 }
	 
	 
	
    
	 var getStmInfo = function(){
		
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1000/selectBad1000DsTypeGetAjax.do'/>", "async": false});
	 
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				setStmInfo(data.stmInfo);
				
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
					
				}
				innerHtml += $.osl.escapeHtml(data.stmInfo.stmNm);
				$("#badTitle").append(innerHtml);
				$("#stmTypeCd").val(data.stmInfo.stmTypeCd);
			}
		});
    	
		ajaxObj.send();	
	 };

	 
	 var checkUser = function(){
		 var data = {
				 authGrpId : $.osl.selAuthGrpId,
				 prjGrpId :$.osl.selPrjGrpId,
	   			 prjId : $.osl.selPrjId,
				 menuId : $("#menuId").val(),
				 dsTypeCd : $("#stmDsTypeCd").val(),
		 };
		
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2100UserCheckAjax.do'/>", "async": false}
				, data);
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var result = data.result;
				if(result.resultManager == "Y"){
					okManager = true;	
				}else{
					
					if($("#stmRootYn").val()=='Y'){
						okManager = true;
					}else{
						
						okManager = false;
					}
				}
				
				
				if(result.resultWriter == "Y" || result.resultWriter == "B"){
					okWriter = true;	
				}else{
					okWriter = false;
				}
			}
		});
		
    	
		ajaxObj.send();
	 };
		 
	 return {
		 init: function(){
			 documentSetting();		
		 }, 
		 reload: function(){
			 $("button[data-datatable-id=bad1000BadTable][data-datatable-action=select]").click();
		 },
	 };
 }();
 
 $.osl.ready(function(){
	 OSLBad1000Popup.init();
 });
</script>
<!-- end script -->
