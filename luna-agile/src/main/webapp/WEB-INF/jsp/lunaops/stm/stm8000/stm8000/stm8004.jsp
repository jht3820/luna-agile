<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
<input type="hidden" name="filePath" id="filePath" value="<c:out value='${param.path}'/>">
<input type="hidden" name="fileName" id="fileName" value="<c:out value='${param.name}'/>">
<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
	<div class="kt-portlet__head">
		<div class="kt-portlet__head-label kt-portlet__head--lg">
			<h5 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="">파일 리비전 목록</span>
			</h5>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-group">
				<input type="text" class="osl-outline--secondary rounded col-lg-3 col-md-3 col-sm-3 col-3" id="searchStNum" name="searchStNum" value="<c:out value='${param.searchStNum}'/>">
				<span class="osl-h-px-38 osl-line-height__width-38">&nbsp;-&nbsp;</span>
				<input type="text" class="osl-outline--secondary rounded col-lg-3 col-md-3 col-sm-3 col-3" id="searchEdNum" name="searchEdNum" value="<c:out value='${param.searchEdNum}'/>">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8004FileTable" data-datatable-action="select" title="파일 리비전 조회" data-title-lang-cd="stm8004.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8004FileTable" data-datatable-action="diff" title="Diff" data-title-lang-cd="stm8004.actionBtn.diffTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="diff" tabindex="2">
					<i class="fa fa-list"></i><span data-lang-cd="">Diff</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body kt-padding-15">
		<div class="col-lg-7 col-md-12 col-sm-12 col-12">
			<div class="osl-datatable-search" data-datatable-id="stm8004FileTable"></div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="stm8004FileTable"></div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm8004Popup = function() {
	var type = $("#type").val();
	var strgRepId = $("#strgRepId").val();
	var filePath = $("#filePath").val();
	var fileName = $("#fileName").val();
	var searchStNum = $("#searchStNum").val();
	var searchEdNum = $("#searchEdNum").val();
	
	var datatableId = "stm8004FileTable";

	//기본 설정
	 var documentSetting = function() {
		
		//해당하는 파일의 버전별 리비전 정보 가져오기
		 $.osl.datatable.setting(datatableId,{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000FileRevisionListAjax.do",
							params : {
								type : type,
								strgRepId : strgRepId,
								filePath : filePath,
								searchStNum :searchStNum,
								searchEdNum :searchEdNum,
							}
						}
					},
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'revision', title: '리비전', textAlign: 'center', width: 40, autoHide: false, sortable: false},
					{field: 'comment', title: '내용', textAlign: 'left', width: 240, sortable: false, search:true},
					{field: 'author', title: '등록자', textAlign: 'center', width: 80, sortable: false, search:true},
					{field: 'logDate', title: '등록일', textAlign: 'center', width: 80, sortable: false, search:true, searchType:"daterange",
						template : function(row){
							var paramDatetime = new Date(row.logDate);
			                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
			                return agoTimeStr.agoString;
						},
					},
				],
				rows:{
					clickCheckbox: true
				},
				actionBtn:{
					"title" : "선택",
					"widht" : 30,
					"insert" : false,
					"update" : false,
					"delete" : false,
					"diff" : true,
				},
				actionTooltip:{
					"diff" : "소스코드 비교"
				},
				actionFn:{
					"select": function(datatableId, elem, datatable){
						//검색 대상 가져오기
						var searchTypeTarget = $(".osl-datatable-search__dropdown[data-datatable-id="+datatableId+"] > .dropdown-item.active");
						
						//검색 값
						var searchData = $("#searchData_"+datatableId);

						//대상 정보 가져오기
						var searchFieldId = searchTypeTarget.data("field-id");
						var searchType = searchTypeTarget.data("opt-type");
						var searchCd = $(this).data("opt-mst-cd");
						
						//입력된 검색값 초기화
						datatable.setDataSourceQuery({});
						
						//시작, 종료 리비전 넣기
						searchStNum = $("#searchStNum").val();
						searchEdNum = $("#searchEdNum").val();
						
						datatable.setDataSourceParam("searchStNum", searchStNum);
						datatable.setDataSourceParam("searchEdNum", searchEdNum);						

						//전체가 아닌경우 해당 타입으로 검색
						if(searchType != "all"){
							var searchDataValue = searchData.val();
							
							//공통코드인경우 select값 가져오기
							if(searchType == "select"){
								searchDataValue = $("#searchSelect_"+datatableId).val();
							}
							datatable.search(searchDataValue,searchFieldId);
							
						}else{
							datatable.search();
						}
						
						//데이터 테이블 재호출
 						datatable.reload();
					},
					"diff": function(rowDatas, datatableId, type, rowNum, elem){
						//리스트인 경우
						if(type == "list"){
							if(rowNum != 2){
								$.osl.alert("두개만 선택, 현재 : " + rowNum, {"type":"warning"});
							}else{
								var data = {
									type : type,
									strgRepId : strgRepId,
									filePath : filePath,
									fileName : fileName,
									diffRevision01 : rowDatas[0].revision,
									diffRevision02 : rowDatas[1].revision,
								};
								var options = {
									idKey:"stm8004_diff",
									modalTitle: "["+fileName+"] DIFF",
									modalSize: "xl",
									autoHeight: false	
								};
								
								$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8005View.do',data,options);
							}
						}else{
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
						}
					}
				},
				theme:{
					 actionBtn:{
						 "diff": ""
					 },
					 actionBtnIcon:{
						 "diff" : "fa flaticon2-check-mark"
	    			}
				},
				callback:{
					initComplete: function(evt, config){
					},
					ajaxDone: function(evt, list){
					}
				}
			}
		);
	};

	return {
		init: function(){
			documentSetting();
		}
	};
 }();
 
 $.osl.ready(function(){
	 OSLStm8004Popup.init();
 });
</script>
