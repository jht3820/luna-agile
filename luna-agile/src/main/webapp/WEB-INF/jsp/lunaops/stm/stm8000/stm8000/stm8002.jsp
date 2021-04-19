<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
<div class="row">
	<div class="col-lg-4 col-md-4 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label kt-portlet__head--lg">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="">리비전 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
						<input type="text" class="osl-outline--secondary rounded col-lg-3 col-md-3 col-sm-3 col-3" id="searchStNum" name="searchStNum">
						<span class="osl-h-px-38 osl-line-height__width-38">&nbsp;-&nbsp;</span>
						<input type="text" class="osl-outline--secondary rounded col-lg-3 col-md-3 col-sm-3 col-3" id="searchEdNum" name="searchEdNum">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8002RepTable" data-datatable-action="select" title="리비전 조회" data-title-lang-cd="stm8002.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body kt-padding-15">
				<!-- 
				리비전 범위 검색
				<div class="row osl-display__flex">
					<div class="col-lg-8 col-md-8 col-sm-8 col-8">
						<div class="form-group osl-display__flex">
							<label class="osl-min-width-85 osl-h-px-38 osl-line-height__width-38 kt-align-right kt-padding-r-10">리비전 범위</label>
							<input type="text" class="form-control" id="searchStNum" name="searchStNum">
							<span class="osl-h-px-38 osl-line-height__width-38">&nbsp;-&nbsp;</span>
							<input type="text" class="form-control" id="searchEdNum" name="searchEdNum">
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-4">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8002RepTable" data-datatable-action="select" title="리비전 조회" data-title-lang-cd="stm8002.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
					</div>
				</div>
				 -->
				<!-- 리비전 검색 -->
				<div class="row">
					<div class="col-lg-7 col-md-12 col-sm-12 col-12">
						<div class="osl-datatable-search" data-datatable-id="stm8002RepTable"></div>
					</div>
				</div>
				<!-- 리비전 목록 -->
				<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="stm8002RepTable"></div>
			</div>
		</div>
	</div>
	<div class="col-lg-8 col-md-8 col-sm-12 col-12">
		<div class="kt-portlet kt-margin-b-10">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span id="revisionNum"></span><span data-lang-cd="">파일 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6 col-6">
				<div class="kt-portlet kt-margin-b-0">
					<div class="kt-portlet__head">
						<div class="kt-portlet__head-label">
							<div class="osl-tree-search" data-tree-id="stm8002RevisionFileTreeDiv"></div>
						</div>
						<div class="kt-portlet__head-toolbar">
							<div class="kt-portlet__head-group">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="stm8002RevisionFileTreeDiv" data-tree-action="select" title="리비전 파일 목록 조회" data-original-title="리비전 파일 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-list"></i><span>조회</span>
								</button>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body kt-padding-10">
						<div class="osl-margin-left--auto">
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-title-lang-cd="tree.label.contextmenu.allNodeOpen" data-tree-id="stm8002RevisionFileTreeDiv" data-tree-action="allNodeOpen">
								<i class="fa fa-plus"></i>
							</a>
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-title-lang-cd="tree.label.contextmenu.allNodeClose" data-tree-id="stm8002RevisionFileTreeDiv" data-tree-action="allNodeClose">
								<i class="fa fa-minus"></i>
							</a>
						</div>
						<!-- 트리구조 -->
						<div class="kt-scroll position-relative">
							<div class="osl-div-cover osl-width--100-p osl-height--100-p">
								<span data-lang-cd="">리비전을 선택하세요.</span>
							</div>
							<div class="osl-tree kt-scroll" data-height="480" id="stm8002RevisionFileTreeDiv"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-6">
				<div class="kt-portlet kt-margin-b-0">
					<div class="kt-portlet__head">
						<div class="kt-portlet__head-label">
							<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="stm8002RevisionFileTable"></div>
						</div>
						<div class="kt-portlet__head-toolbar">
							<div class="kt-portlet__head-group">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8002RevisionFileTable" data-datatable-action="select" title="파일 조회" data-title-lang-cd="stm8002.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
								</button>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8002RevisionFileTable" data-datatable-action="diff" title="Diff" data-title-lang-cd="stm8002.actionBtn.diffTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="diff" tabindex="2">
									<i class="fa fa-list"></i><span data-lang-cd="">Diff</span>
								</button>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body  kt-padding-10">
						<!-- 파일목록 -->
						<div class="kt_datatable osl-datatable-footer__divide" id="stm8002RevisionFileTable"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm8002Popup = function() {
	var strgRepId = $("#strgRepId").val();
	//저장소 유형
	var strgTypeCd;
	//저장소 url
	var linkUrl;
	//저장소 접근 id
	var linkId;
	//저장소 접근 pw 또는 token key
	var linkPw;
	//저장소 명
	var linkRepo;
	//선택한 리비전
	var revision;
	//리비전 시작 종료 번호
	var searchStNum;
	var searchEdNum;
	// 파일 tree 세팅
	var treeObj;
	//데이터 테이블 아이디
	var datatableId = "stm8002RepTable";
	var treetableId = "stm8002RevisionFileTreeDiv";
	var treeDatatableId = "stm8002RevisionFileTable";
	
	//기본 설정
	 var documentSetting = function() {
		//strgRepId가 가진 저장소 유형, 저장소 url, 저장소 id/pw 또는 id/token 가져오기
		getStrgRepInfo();

		//파일 목록 출력 datatable 세팅
		$.osl.datatable.setting(treeDatatableId,{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000FileListAjax.do",
							params : {
								selectFileDirType : "file",
								revision : revision,
								strgRepId : strgRepId
							}
						}
					},
					pageSize: 8
				},
				toolbar:{
					items:{
						pagination:{
							pageSizeSelect : [8, 10, 20, 30, 50, 100],
							pages:{
								desktop: {
									layout: 'default',
									pagesNumber: 1
								},
								tablet:{
									layout: 'default',
									pagesNumber: 1
								},
								mobile:{
									layout: 'default',
									pagesNumber: 1
								}
							}
						}
					}
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'type', title: '유형', textAlign: 'center', width: 80, autoHide: false, sortable: false},
					{field: 'name', title: '파일명', textAlign: 'left', width: 200, autoHide: false, search: true},
				],
				rows:{
					clickCheckbox: true
				},
				actionBtn:{
					"title": "상세",
					"width": 30,
					"insert" : false,
					"update" : false,
					"delete" : false,
					"dblClick" : true,
					"diff" : true,
				},
				actionTooltip:{
					"dblClick" : "파일 소스보기",
					"diff" : "Diff"
				},
				actionFn:{
					"dblClick": function(rowData){
						var data = {
							type : strgTypeCd,
							path: rowData.path,
							revision : revision,
							strgRepId : strgRepId
						};
						var options = {
							idKey:"stm8002_"+revision,
							modalTitle: "[Revision "+revision+"] "+ rowData.name,
							autoHeight: false
						};
						$.osl.layerPopupOpen('/stm/smt8000/stm8000/selectStm8003View.do',data,options);
					},
					"diff":function(rowDatas, datatableId, type, rowNum){
						var rowData;
						
						//리스트인 경우
						if(type == "list"){
							if(rowNum != 1){
								$.osl.alert("한개만 선택, 현재 : " + rowNum, {"type":"warning"});
							}else{
								rowData = rowDatas[0];
							}
						}else{
							//인포인 경우
							rowData = rowDatas;
						}
						
						var data = {
							type : strgTypeCd,
							path: rowData.path,
							revision : revision,
							strgRepId : strgRepId,
							searchStNum : $("#searchStNum").val(),
							searchEdNum : $("#searchEdNum").val(),
							name : rowData.name,
						};
						var options = {
							idKey:"stm8002_diff",
							modalTitle: rowData.name,
							//modalSize: "fs"
							autoHeight: false
						};
						
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8004View.do',data,options);
					}
				},
				theme:{
					 actionBtn:{
						 "click": "",
						 "diff" : "",
					 },
					 actionBtnIcon:{
	    				"click": "fa flaticon2-check-mark",
	    				"diff": "fa flaticon2-check-mark",
	    			}
				}
			}
		);
		
		var params;
		if(strgTypeCd == "01"){
			params = {
					type : strgTypeCd,
					linkUrl : linkUrl,
					linkId : linkId,
					linkPw : linkPw,
			};
		}else{
			params = {
					type : strgTypeCd,
					linkUrl : linkUrl,
					linkId : linkId,
					linkPw : linkPw,
					linkRepo : linkRepo,
			};
		}

		//일반 리비전 목록 출력 datatable 세팅
		$.osl.datatable.setting(datatableId,{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000RevisionListAjax.do",
							params : params
						}
					},
					pageSize: 6,
				},
				toolbar:{
					items:{
						pagination:{
							pageSizeSelect : [6, 10, 20, 30, 50, 100],
							pages:{
								desktop: {
									layout: 'default',
									pagesNumber: 1
								},
								tablet:{
									layout: 'default',
									pagesNumber: 1
								},
								mobile:{
									layout: 'default',
									pagesNumber: 1
								}
							}
						}
					}
				},
				columns: [
					{field: 'revision', title: '리비전', textAlign: 'center', width: 40, autoHide: false, sortable: false},
					{field: 'comment', title: '내용', textAlign: 'left', width: 200, sortable: false, search:true},
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
					"title": "선택",
					"width": 30,
					"insert" : false,
					"update" : false,
					"delete" : false,
					"click" : true,
				},
				actionTooltip:{
					"click" : "리비전 선택"
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

							//검색한 경우 기존 선택 항목 초기화
							revision = "";
							$("#revisionNum").text("");
							
							//트리구조 재호출
							treeLoad();
							//파일구조 재호출
							fileLoad();
						}
						
						//데이터 테이블 재호출
 						datatable.reload();
					},
					"click": function(rowData){
						revision = rowData.revision;
						$("#revisionNum").text("["+revision+"] ");
						//트리 재조회
	    				treeLoad();
						//파일 목록 재조회
						fileLoad();
						//selectBtnClick();
					}
				},
				theme:{
					 actionBtn:{
						 "click": ""
					 },
					 actionBtnIcon:{
	    				"click": "fa flaticon2-check-mark",
	    			}
				},
				callback:{
					initComplete: function(evt, config){
						//트리구조 세팅
						dirTreeSetting();
					},
					ajaxDone: function(evt, list){
						$("#searchStNum").val($.osl.datatable.list[datatableId].targetDt.lastResponse.meta.searchStNum);
						$("#searchEdNum").val($.osl.datatable.list[datatableId].targetDt.lastResponse.meta.searchEdNum);
						//시작, 종료 리비전 넣기
						searchStNum = $("#searchStNum").val();
						searchEdNum = $("#searchEdNum").val();
					}
				}
			}
		);
		
		//퍼펙트 스크롤 적용
		KTUtil.scrollInit($("#"+treetableId)[0], {
	        disableForMobile: true, 
	        resetHeightOnDestroy: true, 
	        handleWindowResize: true, 
	        height: 480
	    });
	}
	
	 /**
	* function 명 	: dirTreeSetting
	* function 설명	: 폴더 트리세팅
	*/
	var dirTreeSetting = function(){
		treeObj = $.osl.tree.setting(treetableId,{
			data:{
				url:"<c:url value='/stm/stm8000/stm8000/selectStm8000DirListAjax.do'/>",
				key: "currentKey",
				/* 부모 key 값 */
				pKey: "parentKey",
				/* 출력 text key */
				labelKey: "name",
				param:{
					selectFileDirType : "dir",
					revision : revision,
					strgRepId : strgRepId
				}
			},
			search:{
				//대소문자 구분
				case_insensitive : true,
				//검색 결과 노드만 표시
				show_only_matches: true,
				//show_only_matches: true 일때 하위 노드도 같이 표시 할건지
				show_only_matches_children: true,
			},
			callback:{
				init: function(treeObj, data){
					treeContent();
				},
				onclick: function(treeObj, selNode){
					//클릭한 경로에 해당하는 파일만 가져오기
					fileLoad(selNode.original.key);
				}
			}
		});
	};
	
	/**
	* function 명 	: treeContent
	* function 설명	: 리비전 선택에 따라 cover 적용
	*/
	var treeContent = function(){
		//리비전이 없을 경우 리비전을 선택하라는 문구 출력
		if($.osl.isNull(revision)){
			$('.osl-div-cover').css('display','');
			$('.osl-div-cover').text('리비전을 선택하세요.');
			$("#"+treetableId).children("ul").addClass("kt-hide");
		}else{
			$('.osl-div-cover').css('display','none');
			$("#"+treetableId).children("ul").removeClass("kt-hide");
		}
	};
	
	/**
	* function 명 	: getStrgRepInfo
	* function 설명	: 저장소 정보가져오기
	*/
	var getStrgRepInfo = function(){
		var data = {
				strgRepId : strgRepId
		};
		
		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000ServerInfoAjax.do'/>", "async":false}
   				, data);
		
   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				strgTypeCd = data.repInfo.strgTypeCd;
   		  		linkUrl = data.repInfo.strgRepUrl;
   		  		linkId = data.repInfo.strgUsrId;
   		  		//저장소 유형에 따라 password, token 선택하여 가져오기
   		  		if(strgTypeCd == "01"){
   		  			//svn인 경우
   		  			linkPw = data.repInfo.strgUsrPw;
   		  		}else{
   		  			//git인 경우
	   		  		linkPw = data.repInfo.strgKey;
	   		  		linkRepo = data.repInfo.strgRepNm;
   		  		}
   			}
   		});
  	 	//AJAX 전송
   		ajaxObj.send();
	};
	 
	/**
	* function 명 	: treeload
	* function 설명	: 선택한 리비전에 따라 트리 구조 호출
	*/
	var treeLoad = function(){
		//revision 여부에 따라 cover 적용
		treeContent();
		
		//리비전 주입
		treeObj.jstree().settings.data.param = {
			selectFileDirType : "dir",
			revision : revision,
			strgRepId : strgRepId,
			searchStNum : searchStNum,
			searchEdNum : searchEdNum,
		};
		
		//트리 재조회
		treeObj.jstree().refresh();
		$("button[data-tree-id="+treetableId+"][data-tree-action=select]").click();
		
	};
	
	/**
	* function 명 	: fileload
	* function 설명	: 선택한 리비전에 따라 파일 호출
	* param : pathKey 파일 트리에서 선택한 파일 경로
	*/
	var fileLoad = function(pathKey){
		//param 주입
		$.osl.datatable.list[treeDatatableId].targetDt.setDataSourceParam("selectFileDirType", "file");
		$.osl.datatable.list[treeDatatableId].targetDt.setDataSourceParam("revision", revision);
		$.osl.datatable.list[treeDatatableId].targetDt.setDataSourceParam("strgRepId", strgRepId);
		$.osl.datatable.list[treeDatatableId].targetDt.setDataSourceParam("filePath", pathKey);
		
		//파일 목록 재조회
		$("button[data-datatable-id="+treeDatatableId+"][data-datatable-action=select]").click(); 
	};
	
	
	var selectBtnClick = function(){
		searchStNum = $("#searchStNum").val();
		searchEdNum = $("#searchEdNum").val();
		//리비전 범위 검색은 param에 강제 세팅
		$.osl.datatable.list[datatableId].targetDt.setDataSourceParam("searchStNum", searchStNum);
		$.osl.datatable.list[datatableId].targetDt.setDataSourceParam("searchEdNum", searchEdNum);						
		$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
	};
	
	return {
		init: function(){
			documentSetting();
		}
	};
 }();
 
 
 $.osl.ready(function(){
	 OSLStm8002Popup.init();
 });
</script>
