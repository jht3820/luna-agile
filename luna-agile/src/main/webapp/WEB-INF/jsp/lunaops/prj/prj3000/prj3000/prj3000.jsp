<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}" />
			</h4>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<!-- begin:: 산출물 메뉴 목록  -->
			<div class="col-xl-4">
				<div class="kt-portlet osl-content__border--light kt-margin-b-20" id="prj3000DocTreeMenu">
					<div class="kt-portlet__head kt-portlet__head--lg">
						<div class="kt-portlet__head-label">
							<h5 class="kt-font-boldest kt-font-brand">
								<i class="fas fa-copy kt-margin-r-5"></i>산출물 메뉴 목록
							</h5>
						</div>
						<!-- begin:: 산출물 메뉴 목록 button -->
						<div class="kt-portlet__head-toolbar">
							<div class="kt-portlet__head-wrapper">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="prj3000DocTree" data-tree-action="select" title="산출물 메뉴 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1" data-original-title="산출물 메뉴 목록 조회">
									<i class="fa fa-list"></i><span>조회</span>
								</button>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="prj3000DocTree" data-tree-action="insert" title="산출물 메뉴 목록 추가" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2" data-original-title="산출물 메뉴 목록 추가">
									<i class="fa fa-plus"></i><span>등록</span>
								</button>
							</div>
							<div class="kt-portlet__head-group">
								<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-tree-id="prj3000DocTree" data-tree-action="allNodeOpen"><i class="fa fa-plus"></i></a> 
								<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-tree-id="prj3000DocTree" data-tree-action="allNodeClose"> <i class="fa fa-minus"></i> </a> 
								<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
							</div>
						</div>
						<!-- end:: 산출물 메뉴 목록 button -->
					</div>

					<div class="kt-portlet__body">
						<div class="row">
							<div class="col-12">
								<div class="osl-tree-search" data-tree-id="prj3000DocTree"></div>
							</div>
						</div>
						<div class="row kt-margin-t-20">
							<div class="col-12">
								<div class="osl-tree kt-scroll" data-height="410" id="prj3000DocTree"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end:: 산출물 메뉴 목록  -->
			<!-- begin:: 산출물 양식 정보 + 산출물 양식 파일 관리 영역 + 산출물 연결 관리  -->
			<div class="col-xl-8">
				<!-- begin:: 산출물 양식 정보  -->
				<div class="kt-portlet--contain osl-content__border--light">
					<div class="kt-blog-grid">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fas fa-file-signature kt-margin-r-5"></i>산출물 양식 정보
								</h5>
							</div>
							<!-- begin:: 산출물 양식 정보 button -->
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-wrapper">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="prj3000DocTree" data-tree-action="selectDocInfo" title="데이터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="selectDocInfo" tabindex="1" data-original-title="산출물 양식 정보 조회">
										<i class="fa fa-list"></i><span>조회</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="prj3000DocTree" data-tree-action="update" title="데이터 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3" data-original-title="산출물 양식 정보 수정">
										<i class="fa fa-edit"></i><span>수정</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="prj3000DocTree" data-tree-action="delete" title="데이터 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4" data-original-title="산출물 양식 정보 삭제">
										<i class="fa fa-trash-alt"></i><span>삭제</span>
									</button>
								</div>
							</div>
							<!-- end:: 산출물 양식 정보 button -->
						</div>

						<div class="kt-portlet__body">
							<form class="kt-form" id="frPrj3000" enctype="multipart/form-data">
								<input type="hidden" id="docFormFileId" name="docFormFileId">
								<input type="hidden" id="docFormConfFileId" name="docFormConfFileId"> 
								<input type="hidden" id="docAtchFileId" name="docAtchFileId"> 
								<input type="hidden" id="docWaitFileId" name="docWaitFileId">
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj3000.label.docId">산출물 ID</span></label> 
											<input type="text" class="form-control" placeholder="산출물 ID" name="docId" id="docId" readonly="readonly">
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3000.label.docNm">산출물 명</span></label> 
											<input type="text" class="form-control" placeholder="산출물 명" name="docNm" id="docNm" readonly="readonly">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj3000.label.docUseCd">사용유무</span></label> 
											<input type="text" class="form-control" placeholder="사용유무" name="useNm" id="useNm" readonly="readonly">
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="prj3000.label.docOrd">순번</span></label> 
											<input type="text" class="form-control" placeholder="순번" name="ord" id="ord" readonly="readonly">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label><i class="fas fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="prj3000.label.docEdDtm">산출물 마감일</span></label> 
											<input type="text" class="form-control" placeholder="산출물 마감일" name="docEdDtm" id="docEdDtm" readonly="readonly">
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="prj3000.label.signUseCd">결재 사용 유무</span></label> 
											<input type="text" class="form-control" placeholder="결재 사용 유무" name="signUseNm" id="signUseNm" readonly="readonly">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3000.label.docDesc">비고</span></label>
											<div class="form-control h-100 osl-min-height--12rem" id="docDesc"></div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- end:: 산출물 양식 정보  -->
				<!-- begin:: 산출물 양식 파일 관리  -->
				<div class="kt-portlet--contain osl-content__border--light kt-margin-t-20">
					<div class="kt-blog-grid">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fas fa-clipboard-list kt-margin-r-5"></i>산출물 양식 파일 관리
								</h5>
							</div>
							<!-- begin:: 산출물 양식 파일 관리 조회 button -->
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-wrapper">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="prj3000DocTree" data-tree-action="selectFiles" title="산출물 양식 파일 관리 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="selectFiles" tabindex="1" data-original-title="산출물 양식 파일 관리 조회">
										<i class="fa fa-list"></i><span>조회</span>
									</button>
								</div>
							</div>
							<!-- end:: 산출물 양식 파일 관리 조회 button -->
						</div>

						<div class="kt-portlet__body">
							<div class="row">
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
									<div class="kt-portlet--contain">
										<div class="kt-portlet__head kt-portlet__head--lg border osl-border-bottom--none">
											<div class="kt-portlet__head-label">
												<h5 class="kt-font-boldest kt-font-brand">확정 파일</h5>
											</div>
											<!-- begin:: 산출물 확정 파일 등록 button -->
											<div class="kt-portlet__head-toolbar">
												<div class="kt-portlet__head-wrapper">
													<input type="file" class="kt-hide" id="confFileBtn" multiple="multiple" name="confFileBtn">
													<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="prj3000DocTree" data-tree-action="insertConfFile" title="확정 파일 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insertConfFile" tabindex="1" data-original-title="확정 파일 등록">
														<i class="fa fa-plus"></i><span>등록</span>
													</button>
												</div>
											</div>
											<!-- end:: 산출물 확정 파일 등록 button -->
										</div>


										<div class="kt-portlet__body kt-padding-0 kt-scroll border osl-radius-bottom" data-height="350" id="confirmation-list"></div>
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 osl-mobile-margin-t-20">
									<div class="kt-portlet--contain">
										<div class="kt-portlet__head border osl-border-bottom--none">
											<div class="kt-portlet__head-label">
												<h5 class="kt-font-boldest kt-font-brand">확정 대기 파일</h5>
											</div>
											<!-- begin:: 산출물 확정 대기 파일 등록  button -->
											<div class="kt-portlet__head-toolbar">
												<div class="kt-portlet__head-wrapper">
													<input type="file" class="kt-hide" id="fileBtn" multiple="multiple" name="fileBtn">
													<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="prj3000DocTree" data-tree-action="insertFile" title="확정 대기 파일 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insertFile" tabindex="1" data-original-title="확정 대기 파일 등록">
														<i class="fa fa-plus"></i><span>등록</span>
													</button>
												</div>
											</div>
											<!-- end:: 산출물 확정 대기 파일 등록  button -->
										</div>
										<div class="kt-portlet__body kt-padding-0 kt-scroll border osl-radius-bottom" data-height="350" id="wait-confirmation-list"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end:: 산출물 양식 파일 관리  -->
				<!-- begin:: 산출물 연결 관리  -->
				<div class="kt-portlet--contain osl-content__border--light kt-margin-t-20">
					<div class="kt-blog-grid">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fas fa-file-signature kt-margin-r-5"></i>산출물 연결 관리
								</h5>
							</div>
							<!-- begin:: 산출물 연결 관리 button -->
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-wrapper">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj3200PrjTable" data-datatable-action="select" title="산출물 연결 관리 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1" data-original-title="산출물 연결 관리 조회">
										<i class="fa fa-list"></i><span>조회</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj3200PrjTable" data-datatable-action="insert" title="산출물 연결 관리 연결" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3" data-original-title="산출물 연결 관리 연결">
										<i class="fa fa-edit"></i><span>연결</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj3200PrjTable" data-datatable-action="delete" title="산출물 연결 관리 연결 제거" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4" data-original-title="산출물 연결 관리 연결 제거">
										<i class="fa fa-trash-alt"></i><span>연결 제거</span>
									</button>
								</div>
							</div>
							<!-- end:: 산출물 연결 관리 button -->
						</div>

						<div class="kt-portlet__body">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-12">
									<div class="osl-datatable-search"
										data-datatable-id="prj3200PrjTable"></div>
								</div>
							</div>
							<div class="kt_datatable" id="prj3200PrjTable"></div>
						</div>
					</div>
				</div>
				<!-- end:: 산출물 연결 관리  -->
			</div>
			<!-- end:: 산출물 양식 정보 + 산출물 양식 파일 관리 영역 + 산출물 연결 관리 -->
		</div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLPrj3000Popup = function () {
	
	var prj3200PrjTable = "prj3200PrjTable";
	
	var formId = "frPrj3000";
	
	//산출물 아이디
	var docId = '';
	
	var treeObj = null;
	
	//파일 타입 (확정파일인지 대기파일인지)
	var fileType = ''; 
	
	//atchfileId
	var atchFileId = '';
	
	var documentSetting = function(){
		
		//파일 드래그앤 드랍 펑션
		fileDropDown();
		
		//Portlet 세팅
		new KTPortlet('prj3000DocTreeMenu', $.osl.lang("portlet"));
		
		/**************************************/
		/* 트리 메뉴 및 관련 메서드 시작                                      */
		/**************************************/
		// 조직 tree 세팅
		treeObj = $.osl.tree.setting("prj3000DocTree",{
			data:{
				url:"<c:url value='/prj/prj3000/prj3000/selectPrj3000DocListAjax.do'/>",
				key: "docId",
				pKey: "upperDocId",
				labelKey: "docNm"
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
				onclick: function(treeObj,selNode){
					// 산출물 정보 단건 조회
					selectDocInfo(selNode.original);
					
					//파일 정보 조회
					selectFormFileList();
				},
				init: function(treeObj,data){
					//console.log(treeObj,data); 
				}
			},
			contextmenu: {
				display: ["allNodeOpen","allNodeClose","selNodeOpen","selNodeClose","insert","update","delete"],
				items: {
            		insert : {
            			"separator_before": true,
            			"separator_after": false,
            			"label": $.osl.lang("prj3000.contextmenu.insert"),
            			"title": $.osl.lang("prj3000.contextmenu.insert"),
            			"actionFn": "insert"
            		},
            		update : {
            			"separator_before": false,
            			"separator_after": false,
            			"label": $.osl.lang("prj3000.contextmenu.update"),
            			"title": $.osl.lang("prj3000.contextmenu.update"),
            			"actionFn": "update"
            		},
            		delete : {
            			"separator_before": false,
            			"separator_after": true,
            			"label": $.osl.lang("prj3000.contextmenu.delete"),
            			"title": $.osl.lang("prj3000.contextmenu.delete"),
            			"actionFn": "delete"
            		},
            	}
			},
			actionFn : {
				//산출물 양식 정보 추가
				"insert" : function(obj){
					
					//선택한 트리 노드 없으면 튕기기
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj3000.message.alert.treeSelect"));
						return false;
					}
					
					// 선택노드
					var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
					var nodeData = selectNode.original;
					
					// 등록 팝업 호출
					var data = {
							type:"insert",
							upperDocId : nodeData.docId,
							upperDocNm : nodeData.docNm,
							lvl : nodeData.lvl,
							dtParamPrjId : nodeData.prjId
					};
					var options = {
							idKey: nodeData.docId,
							modalTitle:  $.osl.lang("prj3000.modal.title.insertDoc"),
							autoHeight:false,
							closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/prj/prj3000/prj3000/selectPrj3001View.do',data,options);
				},
				//산출물 양식 정보 수정
				"update" : function(obj){
					
					//선택한 트리 노드 없으면 튕기기
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj3000.message.alert.treeSelect"));
						return false;
					}
					
					// 선택노드
					var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
					var nodeData = selectNode.original;
					
					// 수정 팝업 호출
					var data = {
							type:"update",
							docId : docId,
							dtParamPrjId : nodeData.prjId
					};
					var options = {
							idKey: nodeData.docId,
							modalTitle: $.osl.lang("prj3000.modal.title.updateDoc"),  
							closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/prj/prj3000/prj3000/selectPrj3001View.do',data,options);
				},
				//산출물 삭제, 하위 노드 존재한다면 모두 삭제
				"delete" :function(obj){
					
					var children = $("#confirmation-list").children('div');
					console.log(children)
					
					//선택한 트리 노드 없으면 튕기기
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj3000.message.alert.treeSelect"));
						return false;
					}
					
					// 선택노드
					var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
					var nodeData = selectNode.original;
					
					// root 삭제불가
					if(nodeData.lvl == 0 || $.osl.isNull(nodeData.upperDocId)){
						$.osl.alert($.osl.lang("prj3000.message.alert.notRootDelete"));
					}else{
						
						// 산출물 삭제
						deleteDocList(nodeData, selectNode.children_d);
					}
				},
				//선택 단일 산출물 정보 조회
				"selectDocInfo" : function(obj){
					
					//선택한 트리 노드 없으면 튕기기
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj3000.message.alert.treeSelect"));
						return false;
					}
					
					// 선택노드
					var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
					var nodeData = selectNode.original;
					
					// 산출물 정보 단건 조회
					selectDocInfo(nodeData);
					
					//파일 정보 조회
					selectFormFileList();
				},
				//확정 산출물 양식 파일 등록
				"insertConfFile" : function(obj){
					//선택한 트리 노드 없으면 튕기기
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj3000.message.alert.treeSelect"));
						return false;
					}
					
					var insertConfFile = $("#confFileBtn");
					insertConfFile.trigger("click");
					
				},
				//확정 대기 산출물 양식 파일 등록
				"insertFile" : function(obj){
					//선택한 트리 노드 없으면 튕기기
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj3000.message.alert.treeSelect"));
						return false;
					}
					
					var insertFile = $('#fileBtn');
					insertFile.trigger("click");
					
				},
				//선택 산출물 양식 파일 리스트 조회
				"selectFiles" : function(obj){
					
					
					
					//선택한 트리 노드 없으면 튕기기
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj3000.message.alert.treeSelect"));
						return false;
					}
					
					//그림 다시그리기
					selectFormFileList();
				}
			}
		});
		
		/**
		 * function 명 	: selectDocInfo
		 * function 설명	: 선택한 산출물의 상세정보를 조회하여 화면에 세팅한다.
		 * @param docId : 선택한 산출물 ID
		 */
		var selectDocInfo = function(nodeData) {
	    	
			//AJAX 설정
			var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/prj/prj3000/prj3000/selectPrj3000DocInfoAjax.do'/>", "async": false}
					,{"docId": nodeData.docId, "dtParamPrjId" : nodeData.prjId});
			
			//AJAX 전송 성공 함수
			ajaxObj.setFnSuccess(function(data){
				
				if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
				}else{
					$("#"+formId)[0].reset();
					
					// 산출물 정보 세팅
			    	$.osl.setDataFormElem(data.docInfoMap,"frPrj3000", ["docId", "docNm", "useNm", "ord", "docEdDtm", "signUseNm", "docFormFileId", "docFormConfFileId", "docAtchFileId", "docWaitFileId"]);
				
					//비고칸 비우기
			    	$("#docDesc").html('');
					
			    	var docDesc = data.docInfoMap.docDesc;
					
					// 산출물 마감일 없을 경우
					if($.osl.isNull(data.docInfoMap.docEdDtm)){
						$("#docEdDtm").val("-");
					}
					
					if(!$.osl.isNull(docDesc)){
						docDesc =  $.osl.escapeHtml(docDesc);
				    	// 비고 값 div영역에 세팅
						$("#docDesc").html(docDesc.replace(/\n/g, '<br/>'));
					}
					
					//입력된 검색값 초기화 (보류)
					//$("#searchData_prj3200PrjTable").val('');
					
					//데이터 테이블 정보 세팅
					selectDocConInfo();
				}
			});
			
			//AJAX 전송
			ajaxObj.send();
		};
		
		
		
		 /**
		 * function 명 	: deleteDocList
		 * function 설명	: 선택한 산출물 및 하위 산출물을 모두 삭제한다.
		 * @param selectNodeData : 선택한 산출물 노드 데이터
		 * @param childrenIds : 선택한 산출물 노드의 자식 노드 id 배열
		 */
		var deleteDocList = function(selectNodeData, childrenIds){
			
			// 삭제할 산출물 목록
			var delDocList = [];
			var delFileList = [];
			
			// 선택한 산출물 정보 추가
			delDocList.push({"docId":selectNodeData.docId, "upperDeptId":selectNodeData.upperDocId, "docNm":selectNodeData.docNm, "prjId" : selectNodeData.prjId,
						 "docFormFileId":selectNodeData.docFormFileId, "docFormConfFileId":selectNodeData.docFormConfFileId, "docAtchFileId":selectNodeData.docAtchFileId, "docWaitFileId":selectNodeData.docWaitFileId});
			// 자식 노드 loop
			$.each(childrenIds, function(idx, treeNodeId){
				// 삭제시 필요한 정보 세팅
				var childNodeData = treeObj.jstree().get_node(treeNodeId).original;
				delDocList.push({"docId":childNodeData.docId, "upperDocId":childNodeData.upperDocId, "docNm":childNodeData.docNm, "prjId" : selectNodeData.prjId,
						 "docFormFileId":childNodeData.docFormFileId, "docFormConfFileId":childNodeData.docFormConfFileId, "docAtchFileId":childNodeData.docAtchFileId, "docWaitFileId":childNodeData.docWaitFileId});
			});
			
			$.osl.confirm($.osl.lang("prj3000.message.confirm.deleteDoc"),null,function(result) {
		        if (result.value) {
		        	
		    		//AJAX 설정
		    		var ajaxObj = new $.osl.ajaxRequestAction(
						{"url":"<c:url value='/prj/prj3000/prj3000/deletePrj3000DocInfoAjax.do'/>"}
						,{deleteDataList: JSON.stringify(delDocList)});
	
		    		//AJAX 전송 성공 함수
		    		ajaxObj.setFnSuccess(function(data){
		    			if(data.errorYn == "Y"){
		    				$.osl.alert(data.message,{type: 'error'});
		    			}else{
		    				//삭제 성공
		    				$.osl.toastr(data.message);
		    				
		    				// 삭제 후 우측 상세정보 초기화
		    				$("#"+formId)[0].reset();
		    				
		    				//비고칸 비우기
					    	$("#docDesc").html('');
		    				
		    				//트리 재조회
		    				$("button[data-tree-id=prj3000DocTree][data-tree-action=select]").click();
		    				
		    				//파일 리스트 비우기
		    				$("#confirmation-list").empty();
		    				$("#wait-confirmation-list").empty();
		    			}
		    		});
		    		
		    		//AJAX 전송
		    		ajaxObj.send();
		        }
		    });
			 
		}
		/**************************************/
		/* 트리 메뉴 및 관련 메서드 종료                                      */
		/**************************************/
		
		
		
		/**************************************/
		/*   파일 관련 스크립트 시작                                          */
		/**************************************/
		
		//확정 대기 파일 업로드 버튼 클릭 이벤트
		$('#fileBtn').change(function(){
			console.log($('#fileBtn'))
			fileType = 'waitFile';
			fnFileAjaxUpload($('#fileBtn')[0].files , fileType);
			$('#fileBtn').val('');
		});
		
		//확정 파일 업로드 버튼 클릭 이벤트
		$('#confFileBtn').change(function(){
			fileType = 'confFile';
			fnFileAjaxUpload($('#confFileBtn')[0].files , fileType);
			$('#confFileBtn').val('');
		});
		
		
		/*
		 * function명 : fnFileAjaxUpload
		 * function설명 : 파일 업로드를 위한 메소드
		 * @param files : 업로드할 파일의 정보들
		 * @param fileType : 확정 파일인지 확정 대기파일인지 (확정파일 = confFile, 확정대기파일 = waitFile)
		 */
		var fnFileAjaxUpload = function(files,fileType) {
			 
			var fd = $.osl.formDataToJsonArray(formId);
			
			//확장자 체크
			var extChk = true;
			
			//다중 파일 모두 넣기
			$.each(files, function(idx, file){
				
				//확장자 가져오기
				var ext = file.name.split(".").pop().toLowerCase();
				
				if(!fileWhiteList(ext)){
					//lang
					//$.osl.toastr("확장자가 [ " + ext + " ] 인 파일은 첨부가 불가능 합니다.");
					$.osl.alert($.osl.lang("prj3000.message.alert.fileExtChk",ext));
					extChk = false;
					return false;
				}
				fd.append('file', file);
			});
			
			//false면 리턴
			if(!extChk){
				return;
			}
			
			fd.append('fileType', fileType);
			
			//확정파일이면  확정 파일 아이디 가져오기
			if(fileType == 'confFile'){
				atchFileId = $('#docFormConfFileId').val();
				
			//확정 대기파일이면 
			}else if(fileType == 'waitFile'){
				atchFileId = $('#docFormFileId').val();
			}
			
			fd.append('atchFileId', atchFileId);
			
			//AJAX 설정
			var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/prj/prj3000/prj3000/insertPrj3000FormFileUploadAjax.do'/>", "async": false, "contentType":false,"processData":false ,"cache":false}
					,fd);
			
			//AJAX 전송 성공 함수
			ajaxObj.setFnSuccess(function(data){
				
				if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
				}else{
					$.osl.toastr(data.message);
					
					//파일 정보 조회
					selectFormFileList();
				}
			});
			
			//AJAX 전송
			ajaxObj.send();
		};
		
		
		
		/*
		 * function명 : fileDropDown
		 * function설명 : 파일 드래그앤 드랍 이벤트
		 */
        function fileDropDown() {
            var confirmation = $("#confirmation-list");
            //Drag기능 
            confirmation.on('dragenter', function(e) {
            	console.log("11")
                e.stopPropagation();
                e.preventDefault();
                // 드롭다운 영역 css
                confirmation.addClass('osl-border-brand');
            });
            confirmation.on('dragleave', function(e) {
                e.stopPropagation();
                e.preventDefault();
                // 드롭다운 영역 css
                confirmation.removeClass('osl-border-brand');
            }); 
            confirmation.on('dragover', function(e) {
            	e.stopPropagation(); 
                e.preventDefault();
                // 드롭다운 영역 css  
                 confirmation.addClass('osl-border-brand');
            });
            confirmation.on('drop', function(e) {
            	e.preventDefault();
                // 드롭다운 영역 css
                confirmation.removeClass('osl-border-brand');

                var files = e.originalEvent.dataTransfer.files;
                
                if (files != null) {
                    if (files.length < 1) {
                       
                        return;
                    } else {
                    	//선택한 트리 노드 없으면 튕기기
        				var selectNodeIds = treeObj.jstree("get_selected");
        				if($.osl.isNull(selectNodeIds)){
        					$.osl.alert($.osl.lang("prj3000.message.alert.treeSelect"));
        					return false;
        				}

                        fileType = 'confFile';
                    	fnFileAjaxUpload(files, fileType);
                    }
                }
            });
            
            var waitConfirmation = $("#wait-confirmation-list");
            //Drag기능 
            waitConfirmation.on('dragenter', function(e) {
            	console.log("11")
                e.stopPropagation();
                e.preventDefault();
                // 드롭다운 영역 css
                waitConfirmation.addClass('osl-border-brand');
            });
            waitConfirmation.on('dragleave', function(e) {
                e.stopPropagation();
                e.preventDefault();
                // 드롭다운 영역 css
                waitConfirmation.removeClass('osl-border-brand');
            });
            waitConfirmation.on('dragover', function(e) {
            	e.stopPropagation(); 
                e.preventDefault();
                // 드롭다운 영역 css  
                waitConfirmation.addClass('osl-border-brand');
            });
            waitConfirmation.on('drop', function(e) {
            	
            	e.preventDefault();
                // 드롭다운 영역 css
                waitConfirmation.removeClass('osl-border-brand');

                var files = e.originalEvent.dataTransfer.files;
                
                if (files != null) {
                    if (files.length < 1) {
                        return;
                    } else {
						
                    	//선택한 트리 노드 없으면 튕기기
        				var selectNodeIds = treeObj.jstree("get_selected");
        				if($.osl.isNull(selectNodeIds)){
        					$.osl.alert($.osl.lang("prj3000.message.alert.treeSelect"));
        					return false;
        				}

                        fileType = 'waitFile';
                        
                    	fnFileAjaxUpload(files, fileType);
                    }
                }
            });
        }
		
		
        /*
		 * function명 : selectFormFileList
		 * function설명 : 가져온 파일 리스트 그리기
		 * @param data : 가져온 파일 데이터
		 */
		var selectFormFileList = function(){
			
			 //확정 산출물 양식
			var docFormConfFileId = $('#docFormConfFileId').val();
			
			 //확정 대기 산출물 양식
			var docFormFileId = $('#docFormFileId').val();
			
			//AJAX 설정
			var ajaxObj1 = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/prj/prj3000/prj3000/selectPrj3000FormFileListAjax.do'/>", "async": true, "loadingShow": false}
					,{'docFormConfFileId': docFormConfFileId, 'docFormFileId':docFormFileId});
						
			
			//AJAX 전송 성공 함수
			ajaxObj1.setFnSuccess(function(data){
				
				if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
				}else{
					
					//가져온 데이터로 그림그리기
					drawList(data);
				}
			});
			
			//AJAX 전송
			ajaxObj1.send();			
			
		}
		
		 /*
		 * function명 : drawList
		 * function설명 : 가져온 파일 리스트 그리기
		 * @param data : 가져온 파일 데이터
		 */
		var drawList = function(data){
			
			//파일 리스트 비우기
			$("#confirmation-list").empty();
			$("#wait-confirmation-list").empty();
			
			var atchFileList = data.formConfFileList;
			
			var waitFileList = data.formFileList;
			
			
			//확정 산출물 파일 리스트 돌기
			$.each(atchFileList, function(idx, fileData){
				var fileVolume =Math.round($.osl.escapeHtml(fileData.fileMg) / 1024) + ' KB';
				var iconPath = '';
				var iconClass = '';
				var iconColor = '';
    			 
				//사진 확장자
				var imgExt = ['jpg','jpeg','png','gif'];
				
				//파일 종류에 따라 이미지 다르게 설정
				if(fileData.fileExtsn == 'pdf'){
					iconPath =	'<path d="M9.766 8.295c-.691-1.843-.539-3.401.747-3.726 1.643-.414 2.505.938 2.39 3.299-.039.79-.194 1.662-.537 3.148.324.49.66.967 1.055 1.51.17.231.382.488.629.757 1.866-.128 3.653.114 4.918.655 1.487.635 2.192 1.685 1.614 2.84-.566 1.133-1.839 1.084-3.416.249-1.141-.604-2.457-1.634-3.51-2.707a13.467 13.467 0 0 0-2.238.426c-1.392 4.051-4.534 6.453-5.707 4.572-.986-1.58 1.38-4.206 4.914-5.375.097-.322.185-.656.264-1.001.08-.353.306-1.31.407-1.737-.678-1.059-1.2-2.031-1.53-2.91zm2.098 4.87c-.033.144-.068.287-.104.427l.033-.01-.012.038a14.065 14.065 0 0 1 1.02-.197l-.032-.033.052-.004a7.902 7.902 0 0 1-.208-.271c-.197-.27-.38-.526-.555-.775l-.006.028-.002-.003c-.076.323-.148.632-.186.8zm5.77 2.978c1.143.605 1.832.632 2.054.187.26-.519-.087-1.034-1.113-1.473-.911-.39-2.175-.608-3.55-.608.845.766 1.787 1.459 2.609 1.894zM6.559 18.789c.14.223.693.16 1.425-.413.827-.648 1.61-1.747 2.208-3.206-2.563 1.064-4.102 2.867-3.633 3.62zm5.345-10.97c.088-1.793-.351-2.48-1.146-2.28-.473.119-.564 1.05-.056 2.405.213.566.52 1.188.908 1.859.18-.858.268-1.453.294-1.984z"></path>';
					iconClass = 'osl-uppy-pdf-bg';
					iconColor = '#E2514A';
				}else if(fileData.fileExtsn == 'zip'){
					iconPath = '<path d="M10.45 2.05h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5V2.55a.5.5 0 0 1 .5-.5zm2.05 1.024h1.05a.5.5 0 0 1 .5.5V3.6a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5v-.001zM10.45 0h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5V.5a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.024a.5.5 0 0 1 .5-.5zm-2.05 3.074h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.024a.5.5 0 0 1 .5-.5zm-2.05 1.024h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm-2.05 1.025h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.024a.5.5 0 0 1 .5-.5zm-1.656 3.074l-.82 5.946c.52.302 1.174.458 1.976.458.803 0 1.455-.156 1.975-.458l-.82-5.946h-2.311zm0-1.025h2.312c.512 0 .946.378 1.015.885l.82 5.946c.056.412-.142.817-.501 1.026-.686.398-1.515.597-2.49.597-.974 0-1.804-.199-2.49-.597a1.025 1.025 0 0 1-.5-1.026l.819-5.946c.07-.507.503-.885 1.015-.885zm.545 6.6a.5.5 0 0 1-.397-.561l.143-.999a.5.5 0 0 1 .495-.429h.74a.5.5 0 0 1 .495.43l.143.998a.5.5 0 0 1-.397.561c-.404.08-.819.08-1.222 0z"></path>';
					iconClass = 'osl-uppy-archive-bg';
					iconColor = '#00C469';
				}else{
					iconPath = '<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path><path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>';
					iconClass = 'osl-uppy-file-bg';
					iconColor = '#A7AFB7';
				}
				
				var fileDivbefore = 	'<div class="osl-uppy-file osl-uppy-file--fullsize">'
										+	'<div class="osl-uppy__btn osl-uppy__arrow-btn osl-uppy__right-btn osl-uppy__right kt-margin-r-10"></div>';
										
				var fileDivCenter = '';
				
				//사진 확장자가 아닐 때
				if($.inArray(fileData.fileExtsn, imgExt) == -1){
					fileDivCenter +=		'<div class="osl-uppy-file-sumnail '+ iconClass +'">'
											+	'<div class="osl-uppy-file-sumnail-bg"></div>'
											+	'<span class="osl-uppy-iconFile">'
												+	'<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">'
													+	'<g fill="'+iconColor +'" fill-rule="nonzero">'
														+	iconPath
													+	'</g>'
												+	'</svg>'
											+	'</span>'
											+	'<div class="osl-uppy-list-dashboardItem-action--download" aria-label="파일 다운로드">'
												+	'<i class="fas fa-arrow-circle-down"></i>'
											+	'</div>'
				//사진 확장자일 때
				}else{
					fileDivCenter +=		'<div class="osl-uppy-file-sumnail">'
											+ 	'<img src="'+ "/cmm/fms/getImage.do?fileSn="+fileData.fileSn+"&atchFileId="+fileData.atchFileId+'">'
											+	'<div class="osl-uppy-list-dashboardItem-action--download" aria-label="파일 다운로드">'
											+		'<i class="fas fa-arrow-circle-down"></i>'
											+	'</div>'
				}
				var fileDivAfter = 			'</div>'
										+	'<div class="osl-uppy-file-info-group">'
											+	'<div class="osl-uppy-file-name" title="'+$.osl.escapeHtml(fileData.orignlFileNm)+ '">'+$.osl.escapeHtml(fileData.orignlFileNm) +'</div>'
											+	'<div class="osl-uppy-file-volume">'+fileVolume+'</div>'
										+	'</div>'
										+	'<div class="osl-uppy__btn osl-uppy__right kt-margin-r-10">'
											+	'<i class="fa fa-times-circle"></i>'
										+	'</div>'
										+	'<input type="hidden" name="fileSn" id="fileSn'+idx+'" value="'+fileData.fileSn +'">'
									+	'</div>'; 
										
				var fileDiv = fileDivbefore + fileDivCenter + fileDivAfter;
							
				$('#confirmation-list').append(fileDiv);
				
			});
			
			//확정 대기 산출물 양식 리스트 돌기
			$.each(waitFileList, function(idx, fileData){
				var fileVolume =Math.round($.osl.escapeHtml(fileData.fileMg) / 1024) + ' KB';
				var iconPath = '';
				var iconTitle = '';
				var iconClass = '';
				var iconColor = '';
				
				//사진 확장자
				var imgExt = ['jpg','jpeg','png','gif'];
				
				//파일 종류에 따라 이미지 다르게 설정
				if(fileData.fileExtsn == 'pdf'){
					iconPath =	'<path d="M9.766 8.295c-.691-1.843-.539-3.401.747-3.726 1.643-.414 2.505.938 2.39 3.299-.039.79-.194 1.662-.537 3.148.324.49.66.967 1.055 1.51.17.231.382.488.629.757 1.866-.128 3.653.114 4.918.655 1.487.635 2.192 1.685 1.614 2.84-.566 1.133-1.839 1.084-3.416.249-1.141-.604-2.457-1.634-3.51-2.707a13.467 13.467 0 0 0-2.238.426c-1.392 4.051-4.534 6.453-5.707 4.572-.986-1.58 1.38-4.206 4.914-5.375.097-.322.185-.656.264-1.001.08-.353.306-1.31.407-1.737-.678-1.059-1.2-2.031-1.53-2.91zm2.098 4.87c-.033.144-.068.287-.104.427l.033-.01-.012.038a14.065 14.065 0 0 1 1.02-.197l-.032-.033.052-.004a7.902 7.902 0 0 1-.208-.271c-.197-.27-.38-.526-.555-.775l-.006.028-.002-.003c-.076.323-.148.632-.186.8zm5.77 2.978c1.143.605 1.832.632 2.054.187.26-.519-.087-1.034-1.113-1.473-.911-.39-2.175-.608-3.55-.608.845.766 1.787 1.459 2.609 1.894zM6.559 18.789c.14.223.693.16 1.425-.413.827-.648 1.61-1.747 2.208-3.206-2.563 1.064-4.102 2.867-3.633 3.62zm5.345-10.97c.088-1.793-.351-2.48-1.146-2.28-.473.119-.564 1.05-.056 2.405.213.566.52 1.188.908 1.859.18-.858.268-1.453.294-1.984z"></path>';
					iconClass = 'osl-uppy-pdf-bg';
					iconColor = '#E2514A';
				}else if(fileData.fileExtsn == 'zip'){
					iconPath = '<path d="M10.45 2.05h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5V2.55a.5.5 0 0 1 .5-.5zm2.05 1.024h1.05a.5.5 0 0 1 .5.5V3.6a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5v-.001zM10.45 0h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5V.5a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.024a.5.5 0 0 1 .5-.5zm-2.05 3.074h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.024a.5.5 0 0 1 .5-.5zm-2.05 1.024h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm-2.05 1.025h1.05a.5.5 0 0 1 .5.5v.025a.5.5 0 0 1-.5.5h-1.05a.5.5 0 0 1-.5-.5v-.025a.5.5 0 0 1 .5-.5zm2.05 1.025h1.05a.5.5 0 0 1 .5.5v.024a.5.5 0 0 1-.5.5H12.5a.5.5 0 0 1-.5-.5v-.024a.5.5 0 0 1 .5-.5zm-1.656 3.074l-.82 5.946c.52.302 1.174.458 1.976.458.803 0 1.455-.156 1.975-.458l-.82-5.946h-2.311zm0-1.025h2.312c.512 0 .946.378 1.015.885l.82 5.946c.056.412-.142.817-.501 1.026-.686.398-1.515.597-2.49.597-.974 0-1.804-.199-2.49-.597a1.025 1.025 0 0 1-.5-1.026l.819-5.946c.07-.507.503-.885 1.015-.885zm.545 6.6a.5.5 0 0 1-.397-.561l.143-.999a.5.5 0 0 1 .495-.429h.74a.5.5 0 0 1 .495.43l.143.998a.5.5 0 0 1-.397.561c-.404.08-.819.08-1.222 0z"></path>';
					iconClass = 'osl-uppy-archive-bg';
					iconColor = '#00C469';
				}else{
					iconPath = '<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path><path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>';
					iconClass = 'osl-uppy-file-bg';
					iconColor = '#A7AFB7';
				}
				
				var fileDivbefore = 	'<div class="osl-uppy-file osl-uppy-file--fullsize">'
										+	'<div class="osl-uppy__btn osl-uppy__arrow-btn osl-uppy__left-btn osl-uppy__left kt-margin-r-10"></div>';
										
				var fileDivCenter = '';
				
				//사진 확장자가 아닐 때
				if($.inArray(fileData.fileExtsn, imgExt) == -1){
					fileDivCenter +=		'<div class="osl-uppy-file-sumnail '+ iconClass +'">'
											+	'<div class="osl-uppy-file-sumnail-bg"></div>'
											+	'<span class="osl-uppy-iconFile">'
												+	'<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">'
													+	'<g fill="'+iconColor +'" fill-rule="nonzero">'
														+	iconPath
													+	'</g>'
												+	'</svg>'
											+	'</span>'
											+	'<div class="osl-uppy-list-dashboardItem-action--download" aria-label="파일 다운로드">'
												+	'<i class="fas fa-arrow-circle-down"></i>'
											+	'</div>'
				//사진 확장자일 때
				}else{
					fileDivCenter +=		'<div class="osl-uppy-file-sumnail">'
											+ 	'<img src="'+ "/cmm/fms/getImage.do?fileSn="+fileData.fileSn+"&atchFileId="+fileData.atchFileId+'">'
											+	'<div class="osl-uppy-list-dashboardItem-action--download" aria-label="파일 다운로드">'
											+		'<i class="fas fa-arrow-circle-down"></i>'
											+	'</div>'
				}
				var fileDivAfter = 			'</div>'
										+	'<div class="osl-uppy-file-info-group">'
											+	'<div class="osl-uppy-file-name" title="'+$.osl.escapeHtml(fileData.orignlFileNm)+ '">'+$.osl.escapeHtml(fileData.orignlFileNm) +'</div>'
											+	'<div class="osl-uppy-file-volume">'+fileVolume+'</div>'
										+	'</div>'
										+	'<div class="osl-uppy__btn osl-uppy__right kt-margin-r-10">'
											+	'<i class="fa fa-times-circle"></i>'
										+	'</div>'
										+	'<input type="hidden" name="fileSn" id="fileSn'+idx+'" value="'+fileData.fileSn +'">'
									+	'</div>'; 
										
				var fileDiv = fileDivbefore + fileDivCenter + fileDivAfter;
				$('#wait-confirmation-list').append(fileDiv);
			});
			
			//파일 이동 버튼 이벤트, 삭제버튼, 다운버튼 이벤트 걸기
			fileMoveBtnEvt();
			deleteFileBtnEvt();
			fileDownBtnEvt();
		}
        
        
		
        /*
		 * function명 : fileDownBtnEvt
		 * function설명 : 파일 다운로드 이벤트
		 */
		var fileDownBtnEvt = function(){
			
			$('.osl-uppy-list-dashboardItem-action--download').click(function(){
				
				var type = $(this).parent().parent().children('div:first-child');
				var fileSn = $(this).parent().parent().children('input[name=fileSn]').val();
				var atchFileId = '';
				
				var form = $("#"+formId)[0];
				var fd = $.osl.formDataToJsonArray(formId);
				
				//확정 파일이면
				if(type.hasClass('osl-uppy__right')){
					
					atchFileId = $('#docFormConfFileId').val();
				
				//확정 대기 파일이면
				}else if(type.hasClass('osl-uppy__left')){
					
					atchFileId = $('#docFormFileId').val();
					
				}
				
				//파일 다운
				$.osl.file.fileDownload(atchFileId,fileSn);
				
			});
		}
        
        
		 /*
		 * function명 : fileMoveBtnEvt
		 * function설명 : 파일 리스트 화살표 버튼 클릭 이벤트
		 */
		var fileMoveBtnEvt = function(){
			$('.osl-uppy__arrow-btn').click(function(){
				//클릭된 화살표의 부모(첨부파일 전체) 박스
				var target = $(this).parent();
				var fileSn = target.children('input[name=fileSn]').val();
				console.log(target)
				var fileType = '';
				//버튼모양 여부로 판단
				//좌측 버튼이 있을때(확정 대기 파일 버튼)
				if($(this).hasClass('osl-uppy__left-btn')){
					//확정 파일로 이동
					$('#confirmation-list').prepend(target);
					//아이콘 변경(방향,아이콘 모양)
					$(this).addClass('osl-uppy__right-btn osl-uppy__right');
					$(this).removeClass('osl-uppy__left-btn osl-uppy__left');
					
					//확정 대기 파일
					fileType = 'formFile';
				//우측 버튼이 있을때
				}else{ 
					//확정 대기 파일로 이동(확정 파일 버튼)
					$('#wait-confirmation-list').prepend(target);
					//아이콘 변경(방향,아이콘 모양)
					$(this).addClass('osl-uppy__left-btn osl-uppy__left');
					$(this).removeClass('osl-uppy__right-btn osl-uppy__right');

					//확정 파일
					fileType = 'formConfFile';
				}
				
				//파일 타입 바꾸기
				updateFileType(fileType,fileSn);
			});
		}
		
		 /*
		 * function명 : deleteFileBtnEvt
		 * function설명 : 파일 리스트 삭제 버튼 클릭 이벤트
		 */
		var deleteFileBtnEvt = function(){
			
			$('.fa-times-circle').click(function(){
				
				var targetType = $(this).parent().parent().children('div:first-child');
				console.log(targetType)
				
				var fileSn = targetType.parent().children('input[name=fileSn]').val();
				//부모객체에 오른쪽 클래스가 있다면 확정 대기 파일
				if(targetType.hasClass("osl-uppy__left")){
					atchFileId = $('#docFormFileId').val();
				
				//부모객체에 왼쪽 클래스가 있다면 확정 파일
				}else if(targetType.hasClass("osl-uppy__right")){ 
					atchFileId = $('#docFormConfFileId').val();	
				}
				
				
				//파일 삭제 확인창
				$.osl.confirm($.osl.lang("prj3000.message.confirm.deleteFormFile"),null,function(result) {
			        if (result.value) {
			        	
			    		//AJAX 설정
			    		var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/prj/prj3000/prj3000/deletePrj3000FileAjax.do'/>"}
							,{"atchFileId":atchFileId, "fileSn":fileSn});
		
			    		//AJAX 전송 성공 함수
			    		ajaxObj.setFnSuccess(function(data){
			    			if(data.errorYn == "Y"){
			    				$.osl.alert(data.message,{type: 'error'});
			    			}else{
			    				//삭제 성공
			    				$.osl.toastr(data.message);
			    				
			    				//트리 재조회
			    				$("button[data-tree-id=prj3000DocTree][data-tree-action=selectFiles]").click();
			    			}
			    		});
			    		
			    		//AJAX 전송
			    		ajaxObj.send();
			        }
			    });
					
			});
			
		}
		
		/*확정파일 영역 drag&drop sortable*/
		new Sortable($('#confirmation-list')[0], {
			group:'shared',
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
	        onMove:function(evt,originalEvent){
	        	console.log("33")
				var UserAgent = navigator.userAgent;

				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
					return false;
				}else{
					return true;
				}
			},
	      	//해당 div로 이동될 대상의 동작(들어온)
			onAdd:function(evt){
				console.log("44")
				//아이콘 부모박스 
				var moveDiv = $(evt.item).children('.osl-uppy__left-btn:first-child');
				
				//아이콘 변경(방향,아이콘 모양)
				moveDiv.addClass('osl-uppy__right-btn osl-uppy__right');
				moveDiv.removeClass('osl-uppy__left-btn osl-uppy__left');
				
				/*추가 동작은 이쪽에서 구현하시면 됩니다*/
				
				var fileSn = moveDiv.parent().children('input[name=fileSn]').val();
				var fileType = 'formFile';
				//파일 타입 바꾸기
				updateFileType(fileType,fileSn);
			}
	    });

		
		/*확정 대기파일 drag&drop sortable*/
		new Sortable($('#wait-confirmation-list')[0], {
	        group:'shared',
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
	        onMove:function(evt,originalEvent){
	        	console.log("11")
	        	
				var UserAgent = navigator.userAgent;

				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
					return false;
				}else{
					return true;
				}
			},
	      	//해당 div로 이동될 대상의 동작(들어온)
			onAdd:function(evt){
				console.log("22")
				//아이콘 부모박스 
				var moveDiv = $(evt.item).children('.osl-uppy__right-btn:first-child');
				//아이콘 변경(방향,아이콘 모양)
				moveDiv.addClass('osl-uppy__left-btn osl-uppy__left');
				moveDiv.removeClass('osl-uppy__right-btn osl-uppy__right');
				
				/*추가 동작은 이쪽에서 구현하시면 됩니다*/
				var fileSn = moveDiv.parent().children('input[name=fileSn]').val();
				var fileType = 'formConfFile';
				
				//파일 타입 바꾸기
				updateFileType(fileType,fileSn);
			}
	    });
		
		 /**
		 * function 명 	: updateFileType
		 * function 설명	: 선택한 파일을 확정 혹은 확정대기로 바꾼다
		 * @param fileType : 확정파일인지 확정 대기 파일인지 구분
		 */
		var updateFileType = function(fileType, fileSn){
			
			//원래 파일 아이디
			var beforeFileId = '';
			
			//변경 후 바뀔 파일 아이디
			var afterFileId = '';
			
			//확정 예정 파일일 경우
			if(fileType == 'formFile'){
				
				//확정 예정 파일 아이디에서 확정 파일 아이디로
				beforeFileId = $('#docFormFileId').val();
				afterFileId = $('#docFormConfFileId').val();
				
			//확정 파일일 경우
			}else if(fileType == 'formConfFile'){
				
				//확정 파일 아이디에서 확정 예정 파일 아이디로
				beforeFileId = $('#docFormConfFileId').val();
				afterFileId = $('#docFormFileId').val();
				
			}
			//AJAX 설정
			var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/prj/prj3000/prj3000/updatePrj3000FileTypeAjax.do'/>", "async": false}
					,{"docId": docId, "beforeFileId":beforeFileId, "afterFileId":afterFileId, "fileSn":fileSn});
			
			//AJAX 전송 성공 함수
			ajaxObj.setFnSuccess(function(data){
				
				if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
					
					//파일 리스트 초기화하기
    				$("button[data-tree-id=prj3000DocTree][data-tree-action=selectFiles]").click();
				}else{
					
					$.osl.toastr(data.message);
					
					//파일 리스트 다시 그리기
					selectFormFileList();
				}
			});
			
			//AJAX 전송
			ajaxObj.send();
		}
        
		
		var fileWhiteList = function( fileExt ){
			// 화이트 리스트가 아니라면 중지 업로드 중지.
			if( $.inArray(fileExt, ['doc','docx','hwp','pdf','ppt','pptx','xls','xlsx','zip','jpg','jpeg','png','gif','eml','cell','show']) == -1) {
				return false;
		   }
			return true;
			
		}
		/**************************************/
		/*   파일 관련 스크립트 종료                                         */
		/**************************************/
		
		
		/**************************************/
		/*  산출물 연결관리 관련 스크립트 시작                            */
		/**************************************/
		//데이터 테이블 세팅
		$.osl.datatable.setting("prj3200PrjTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj3000/prj3200/selectPrj3200DocConListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'targetTypeNm', title: '구분', textAlign: 'left', width: 80, search: false},
				{field: 'targetNm', title: '대상 명', textAlign: 'left', width: 180, search: true, autoHide: false},
				{field: 'regUsrNm', title: '등록자', textAlign: 'center', width: 80, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.regUsrId, row.regUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.regUsrId);
					}
				},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 80, search: true, searchType:"date"}
				
			],
			searchColumns:[
				{field: 'targetCd', title: '구분', searchOrd: 0, searchType:"select", searchCd:"PRJ00022"}
			],
			rows:{
				clickCheckbox: true
			},
			actionBtn:{
				"title": "연결 제거",
				"update": false
			},
			actionTooltip:{
				"delete": "연결 제거"
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					
					//선택된 산출물 없다면 튕기기
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj3000.message.alert.treeSelect"));
						return false;
					}
					
					// 선택노드
					var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
					var nodeData = selectNode.original;
					
					var data = {docId: docId,
								dtParamPrjId : nodeData.prjId};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("prj3000.modal.title.insertDocCon"),
							closeConfirm: false,
							modalSize: "xl"
						};
					
					$.osl.layerPopupOpen('/prj/prj3000/prj3200/selectPrj3200View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					//AJAX 설정
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/prj/prj3000/prj3200/deletePrj3200DocConInfoAjax.do'/>"}
							,{deleteDataList: JSON.stringify(rowDatas)});
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
			   				$.osl.alert(data.message,{type: 'error'});
			   			}else{
			   				//삭제 성공
			   				$.osl.toastr(data.message);
			   				
			   				//datatable 조회
			   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			   			}
					});
					
					//AJAX 전송
					ajaxObj.send();
				}
			}
		});
		
		/**
		 * function 명 	: selectDocConInfo
		 * function 설명	: 선택한 산출물의 연결 정보를 조회하여 화면에 세팅한다.
		 * @param docId : 선택한 산출물 ID
		 */
		var selectDocConInfo = function(){
			docId = $("#docId").val();
			$.osl.datatable.list[prj3200PrjTable].targetDt.setDataSourceParam("docId", docId);
			$("button[data-datatable-id="+prj3200PrjTable+"][data-datatable-action=select]").click();
			 
		}
		/**************************************/
		/*  산출물 연결관리 관련 스크립트 종료                            */
		/**************************************/
       
	
		
		
		/*스크롤 세팅*/
		//산출물 트리 스크롤 세팅
		ktScrollInit("#prj3000DocTree", "410");
		//확정 파일 스크롤 세팅
		ktScrollInit("#confirmation-list", "350");
		//확정 대기 파일 스크롤 세팅
		ktScrollInit("#wait-confirmation-list", "350");	
		
		
		 
		
		/*
		 * function명 : ktScrollInit
		 * function설명 : 스크롤 세팅 및 반응형 될 때 세로크기값을 계산해준다
		 * @param targetName : 스크롤 세팅할 대상 class, id
		 * @param targetHeight : 스크롤의 세로 사이즈
		 */
		function ktScrollInit (targetName, targetHeight) {
			KTUtil.scrollInit($(targetName)[0], {
		   		//모바일 스크롤 바 마우스 제어 비활성화
		         disableForMobile: true, 
		         //반응형 시 스크롤 유지 여부
		         resetHeightOnDestroy: true, 
		         //브라우저 창의 크기를 조정할 때 크기를 자동으로 조절 여부
		         handleWindowResize: true, 
		         //세로 사이즈
		         height: targetHeight
		    });
		}
		
		
	}
	
	return {
	       // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLPrj3000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
