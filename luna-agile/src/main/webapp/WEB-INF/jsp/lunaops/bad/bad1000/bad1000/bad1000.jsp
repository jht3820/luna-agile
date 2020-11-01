<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	 //담당자/글작성범위 해당 여부(Y/N)를 담을 변수 선언
	 var okManager;
	 var okWriter;

	 //데이터 테이블 아이디
	 var dataTableId = "bad1000BadTable";
	 
	 //데이터 insert 할 때 게시판 속성 옵션 필요. 해당 정보가 row에 있는지 확인
	 var checkStmInfo;
	 
	 var documentSetting = function() {

		 //시스템 관리 게시판에서 접근하는 경우 검색 조건 '삭제유무', '댓글' 추가
		 var searchAdd;
		 
		 //시스템 관리 게시판에서 넘오는 것이 아니라 일반 메뉴로 들어올 경우
		 //메뉴id와 게시판 유형, 게시판명을 받아 저장
		 if($("#stmRootYn").val() == null || $("#stmRootYn").val()==""){
			 //게시판 속성 정보 가져와 셋팅
			 getStmInfo();
			 //stmInfo 체크할 필요 없으므로
			 checkStmInfo = false;
			 //검색항목 추가
			 searchAdd = [
					{field: 'badContent', title:$.osl.lang("bad1000.field.badContent"), searchOrd: 2},
					{field: 'cmtContent', title:$.osl.lang("bad1000.field.cmtContent"), searchOrd: 4},
					{field: 'tagNm', title:$.osl.lang("bad1000.field.tagNm"), searchOrd: 5, 
						searchKeyCode: "-1", //spacebar 클릭 시 이벤트 실행
						searchKeyEvt : function(e, datatableInfo, searchDataTarget){
							// SpaceBar 시 빈공간이 생기지 않도록 방지
                            e.preventDefault(); 
							if(e.key=="Enter" || e.keyCode == 32){
								//검색
								$("button[data-datatable-id="+dataTableId+"][data-datatable-action=select]").click();
							}else{
								var txt = $("#searchData_"+dataTableId).val() + e.key;
								txt = txt.replace(/#/g,"");
								$("#searchData_"+dataTableId).val(txt);
							}
						},		
					}
				]
		 }else{
			//insert에 필요한 stmInfo 체크해야 하므로
			 checkStmInfo = true;
			 //검색항목 추가
			 searchAdd = [
					{field: 'badContent', title:$.osl.lang("bad1000.field.badContent"), searchOrd: 2},
					{field: 'badNtcCheck', title:$.osl.lang("bad1000.field.badNtcCheck"), searchOrd: 4, searchType:"select", searchCd: "CMM00001"},
					{field: 'delCd', title:$.osl.lang("bad1000.field.delCd"), searchOrd: 5, searchType:"select", searchCd: "CMM00001"},
					{field: 'cmtContent', title:$.osl.lang("bad1000.field.cmtContent"), searchOrd: 6},
					{field: 'tagNm', title:$.osl.lang("bad1000.field.tagNm"), searchOrd: 7,
						searchKeyCode: "-1", //spacebar 클릭 시 이벤트 실행
						searchKeyEvt : function(e, datatableInfo, searchDataTarget){
							// SpaceBar 시 빈공간이 생기지 않도록 방지
                            e.preventDefault(); 
							if(e.key=="Enter" || e.keyCode == 32){
								//검색
								$("button[data-datatable-id="+dataTableId+"][data-datatable-action=select]").click();
							}else{
								var txt = $("#searchData_"+dataTableId).val() + e.key;
								txt = txt.replace(/#/g,"");
								$("#searchData_"+dataTableId).val(txt);
							}
						},		
					},
				];
		 }
		 
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
						// 삭제된 게시글인 경우
						if($("#stmRootYn").val() == "Y"){
							if(row.delCd == "01"){
								returnStr += "<span class='kt-badge kt-badge--dark kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1000.label.deleteBadge")+"</span>";
							}
						}
						// 공지사항인 경우
						if(row.badNtcCheck == "01"){
							returnStr += "<span class='kt-badge kt-badge--danger kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1000.label.noticeBadge")+"</span>";
						}
						// 제목
						returnStr += $.osl.escapeHtml(row.badTitle);
						// 댓글이 있는 경우
						if(row.badCmtCnt > 0 && row.stmCmtYnCd == '01'){
							returnStr += "<span class='kt-badge kt-badge--metal kt-badge--inline kt-margin-10 kt-padding-10'>"+row.badCmtCnt+"</span>";
						}
						// 비밀번호가 걸린 글인 경우
						if(row.badPw == "01" && row.stmPwYnCd == '01'){
							returnStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
						}
						
						//returnStr = "<span class='badTitleSpan' style='word-break: break-word;'>"+returnStr+"</span>";
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
					//담당자 또는 글작성범위에 해당하는 회원만 글등록
					if(okManager == true || okWriter == true){
						$.osl.layerPopupOpen('/bad/bad1000/bad1000/insertBad1002View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("bad1000.notAuthority.insertMessage"), {"type":"warning"});
					}
				},
				"dblClick": function(rowData, datatableId, type, rowNum){
					if(type=="list"){ //상단의 상세 버튼 클릭
						//선택된 rowDatas 갯수
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
							//선택된 row데이터로 rowData 지정
							//이걸 안하면 rowData.stmOptionCnt 항목이 없다.
							rowData = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords().data("obj");
						}
					}
					//1개의 list만 선택하거나 row의 상세버튼을 클릭한 경우
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
					//담당자 또는 글작성범위에 해당하는 회원 또는 본인이 작성한 글인경우 글 보기 가능
					if(okManager == true || okWriter == true || rowData.badUsrId== $.osl.user.userInfo.usrId){
						if(okManager == true || rowData.badUsrId== $.osl.user.userInfo.usrId){
							//담당자는 비밀번호 없이도 게시글 확인 가능
							//작성자는 비밀번호 없이도 게시글 확인 가능
							$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1001View.do',data,options);
						}else{
							if(rowData.badPw == "01" && row.stmPwYnCd == '01'){
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
					//담당자 또는 해당 게시글을 작성한 회원만 수정 가능
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
					//담당자 외 삭제 선택한 글 중 본인 외 글이 포함된 경우인지 확인
					var selfCheck = "Y";
					$.each(rowDatas, function(idx, value){
						if(value.badUsrId != $.osl.user.userInfo.usrId){
							selfCheck = "N";
						}
					});
					//담당자 또는 글작성범위에 해당하면서 자기 게시글만 삭제 가능
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
				"click": function(rowData, datatableId, type, rowNum, elem){
					//클릭한 row(tr)에서 label 태그 kt-checkbox 클래스를 찾고
					//그 안에 있는 체크박스를 체크
					var targetElem = $(elem).closest("tr").find("label.kt-checkbox").children("input[type=checkbox]");
					if(targetElem.is(":checked")==true){
						targetElem.prop("checked", false);
						$.osl.datatable.list[datatableId].targetDt.setInactive(targetElem);
						//선택된것처럼 row 컬러가 그대로 남아있으므로
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
					//btn-"string"이기 때문에 kt-hide를 적용하려면 앞에 공백 추가
					 click: " kt-hide"
				 },
				 actionBtnIcon:{
					 "dblClick": "fa flaticon2-document",
				 }
			 }
		 });
		 
		//데이터 테이블 렌더링 업데이트 및 테이블 크기 조정 시 이벤트 발생
//     	$("#"+dataTableId).on("kt-datatable--on-layout-updated", function(){
    		
//   			searchData_bad1000BadTable
//     		//검색 버튼 클릭하면
//     		 $(".btn.btn-brand.osl-datatable-search__button[data-datatable-id="+dataTableId+"]").click(function(){
//     			 if(selectActiveTxt == $.osl.lang("bad1000.field.tagTxt")){
//     				 //var tagTxt = $(".osl-datatable-search[data-datatable-id=bad1000BadTable]").children().children().children("div>.osl-datatable-search__input").children().val();
// 					 //이벤트
					 
//     				 $.osl.alert("dddd");
//     				 return false;
//     			 }
//     		 });
//     	});
	 };
	 
	// 게시판 옵션 가져오기
    /**
	* function 명 	: setStmInfo
	* param : data - 게시판 옵션 정보가 담긴 json
	* function 설명	: 게시판 옵션을 가져와 옵션 개수 체크 및 변수에 저장
	*/
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
			
			//게시판 옵션 담기
			$("#stmOptionCnt").val(stmOptionCnt);
			$("#stmNtcYnCd").val(data.stmNtcYnCd);
			$("#stmPwYnCd").val(data.stmPwYnCd);
			$("#stmTagYnCd").val(data.stmTagYnCd);
			$("#stmCmtYnCd").val(data.stmCmtYnCd);
			$("#stmFileCnt").val(data.stmFileCnt);
			$("#stmFileStrg").val(data.stmFileStrg);
	 }
	 
	 
	// 게시판 옵션 가져오기
    /**
	* function 명 	: getStmInfo
	* function 설명	: 게시판 옵션을 가져와 옵션 개수 체크 및 변수에 저장
	*/
	 var getStmInfo = function(){
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
				//게시판 옵션 정보 넣기
				setStmInfo(data.stmInfo);
				//게시판 정보 넣기
				$("#menuId").val(data.menuId);
				$("#stmDsTypeCd").val(data.stmInfo.stmDsTypeCd);
				$("#stmNm").val(data.stmInfo.stmNm);
				
				//게시판 명 및 유형 넣기
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
					//시스템게시판 관리자로 들어오면 무조건 관리자
					if($("#stmRootYn").val()=='Y'){
						okManager = true;
					}else{
						//시스템게시판 관리로 들어오지도 않고 담당자목록에도 없을 때
						okManager = false;
					}
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
