<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="kt-portlet__head-wrapper">`
				
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
	
		<!-- // begin:: 권한그룹 Folding 영역 -->
		<div class="kt-portlet kt-portlet--mobile" id="stm2200PrjAuthInfo">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<div class="osl-font-lg kt-font-boldest kt-font-brand kt-margin-l-0 kt-margin-r-10 kt-margin-t-10 kt-margin-b-10" id="authGrp-content__title">
						<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="stm2200.title.authGrpList">시스템 권한 그룹</span>
					</div>
					<!-- // begin:: Folding 영역 권한그룹 목록 -->
					<div class="osl-collapsed__content" id="authGrp-content__authList" style="display:none;">
						<ul class="nav nav-pills kt-margin-l-0 kt-margin-r-10 kt-margin-t-10 kt-margin-b-10" role="tablist">
		                </ul>
					</div>
					<!-- // end:: Folding 영역 권한그룹 목록 -->
				</div>
				<div class="kt-portlet__head-toolbar">
					<!-- // begin:: 권한그룹 버튼 영역 -->
					<div class="kt-portlet__head-wrapper kt-margin-r-10" id="authGrp-table-btn">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2200AuthTable" data-datatable-action="select" title="시스템 권한 그룹 조회" data-title-lang-cd="datatable.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2200AuthTable" data-datatable-action="insert" title="시스템 권한 그룹 추가" data-title-lang-cd="datatable.button.title.insert" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
							<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2200AuthTable" data-datatable-action="update" title="시스템 권한 그룹 수정" data-title-lang-cd="datatable.button.title.update" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
							<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2200AuthTable" data-datatable-action="delete" title="시스템 권한 그룹 삭제" data-title-lang-cd="datatable.button.title.delete" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
							<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
						</button>
					</div>
					<!-- // end:: 권한그룹 버튼 영역  -->
					
					<!-- // begin::Folding 버튼(▽) 영역 --> 
					<div class="kt-portlet__head-group">
						<div class="kt-portlet__head-group">
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md on" id="authFoldingBtn"><i class="la la-angle-down"></i></a>
						</div>
					</div>
					<!-- // end::Folding 버튼(▽) 영역 --> 
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="osl-datatable-search" data-datatable-id="stm2200AuthTable"></div>
					</div>
				</div>
				<div class="kt_datatable" id="stm2200AuthTable"></div>
			</div>
		</div>
		<!-- // end:: 권한그룹 Folding 영역 -->
		
		<!-- // begin:: 시스템 메뉴 권한 영역 -->
		<div class="kt-portlet kt-portlet--mobile">
			<!-- // begin:: 시스템 메뉴 권한 header -->
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<div class="osl-font-lg kt-font-boldest kt-font-brand kt-margin-l-0 kt-margin-r-10 kt-margin-t-10 kt-margin-b-10">
						<i class="fa fa-stream kt-margin-r-10"></i><span id="authGrpNameTitle"></span> <span data-lang-cd="stm2200.title.authList">시스템 메뉴 권한</span>
					</div>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper kt-margin-r-5">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="메뉴 권한 저장" data-title-lang-cd="datatable.button.title.insert" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" tabindex="5" data-auth-button="update" id="authGrp-menu-save">
							<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">저장</span>
						</button>
					</div>
				</div>
			</div>
			<!-- // end:: 시스템 메뉴 권한 header -->
			<div class="kt-portlet__body">
				<!-- // begin::table-responsive -->
				<div class="table-responsive">
					<form id="frStm2200StmMenuAuth" name="frStm2200StmMenuAuth">
						<input type="hidden" id="authGrpId" name="authGrpId" >
						<!-- // begin:: 시스템 메뉴 권한 table -->
						<table class="table table-bordered kt-align-center">
							<thead>
								<tr>
									<th class="osl-min-width--6rem font-weight-bold">대 메뉴명</th>
									<th class="osl-min-width--11rem font-weight-bold">중 메뉴명 > 소 메뉴명</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-accessYn">
											<input type="checkbox" title="전체 체크" name="accessYn" id="menuAuthAll-accessYn"/>
											<span></span>
										</label>
										<span>접근</span>
									</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-selectYn">
											<input type="checkbox" title="전체 체크" name="selectYn" id="menuAuthAll-selectYn"/>
											<span></span>
										</label>
										<span>조회</span>
									</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-regYn">
											<input type="checkbox" title="전체 체크" name="regYn" id="menuAuthAll-regYn"/>
											<span></span>
										</label>
										<span>등록</span>
									</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-modifyYn">
											<input type="checkbox" title="전체 체크" name="modifyYn" id="menuAuthAll-modifyYn"/>
											<span></span>
										</label>
										<span>수정</span>
									</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-delYn">
											<input type="checkbox" title="전체 체크" name="delYn" id="menuAuthAll-delYn"/>
											<span></span>
										</label>
										<span>삭제</span>
									</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-excelYn">
											<input type="checkbox" title="전체 체크" name="excelYn" id="menuAuthAll-excelYn"/>
											<span></span>
										</label>
										<span>엑셀</span>
									</th>
									<th class="osl-min-width-5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-printYn">
											<input type="checkbox" title="전체 체크" name="printYn" id="menuAuthAll-printYn"/>
											<span></span>
										</label>
										<span>출력</span>
									</th>
									<th>전체 체크</th>
								</tr>
							</thead>
							<!-- // begin:: 시스템 메뉴 권한 체크박스 영역 -->
							<tbody id="menuAuth-list">
							</tbody>
							<!-- // end:: 시스템 메뉴 권한 체크박스 영역 -->
						</table>
						<!-- end:: 시스템 메뉴 권한 table -->
					</form>
				</div>
				<!-- end::table-responsive -->
			</div>
		</div>
		<!-- end:: 시스템 메뉴 권한 영역 -->
		
	</div>
</div>

<script>
"use strict";
var OSLStm2200 = function () {

	// Private functions
	var documentSetting = function () {
		var portlet = new KTPortlet('stm2200PrjAuthInfo', $.osl.lang("portlet"));
		
		// 권한그룹 datatable 세팅
		$.osl.datatable.setting("stm2200AuthTable",{
			
			data: {
				source: {
					read: {
						url: "/stm/stm2000/stm2200/selectStm2200StmAuthGrpListAjax.do"
					}
				},
				pageSize: 5, // 권한그룹은 데이터 수가 많지 않으므로 페이지 사이즈 5로 조정
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100] // 페이지 사이즈가 5이므로  목록 수 최소 5부터 시작
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30},
				{field: 'authGrpNm', title: '권한그룹 명', textAlign: 'left', width: 200, autoHide: false, search: true},
				{field: 'ord', title: '우선순위', textAlign: 'center', width: 100,
					template: function (row) {return !$.osl.isNull(row.ord) ? row.ord.toString() : "0"; }
				},
				{field: 'usrTypNm', title: '사용자 유형', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00004", searchField:"usrTyp"},
				{field: 'acceptUseNm', title: '접수권한 유무', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "CMM00001", searchField:"acceptUseCd"},
				{field: 'useNm', title: '사용 유무', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd"},
				{field: 'authGrpDesc', title: '비고', textAlign: 'left', width: 480, search: true}
			],
			actionBtn:{
				"click": true,
				"dblClick": true
			},
			actionTooltip:{
				"update": $.osl.lang("stm2200.actionBtn.updateBtn"),
				"delete": $.osl.lang("stm2200.actionBtn.deleteBtn"),
				"click": $.osl.lang("stm2200.actionBtn.clickBtn"),
				"dblClick": $.osl.lang("stm2200.actionBtn.dblClickBtn")
			},
			actionFn:{
				"insert":function(datatableId){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("stm2200.title.insert"),
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm2000/stm2200/selectStm2201View.do',data,options);
				},
				"update":function(rowData){
					var data = {
							type:"update",
							paramAuthGrpId: rowData.authGrpId
						};
					var options = {
							idKey: rowData.authGrpId,
							modalTitle: $.osl.lang("stm2200.title.update"),
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm2000/stm2200/selectStm2201View.do',data,options);
				},
				"delete":function(rowDataList){
					
					var delChk = false;
					$.each(rowDataList, function(idx, authData){
						if(authData.authGrpId == "AUT0000000000001"){
							delChk = true;
							return false;
						}
					});
					
					// 사업담당자 권한 삭제 체크
					if(delChk){
						$.osl.alert("사업 담당자 권한은 관리자 필수 권한입니다.</br>삭제 할 수 없습니다.", {type:"warning"});
						return false;
					}
					
					//AJAX 설정
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/stm/stm2000/stm2200/deleteStm2200StmAuthGrpInfoAjax.do'/>"}
								,{deleteDataList: JSON.stringify(rowDataList)});
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
				    	
						// 에러시 alert
						if(data.errorYn == "Y"){
							$.osl.alert(data.message, {type:"error"});
						}else{
							$.osl.toastr(data.message);
							// 삭제 성공시 데이터 테이블 reload, 현재 페이지 유지
							$.osl.datatable.list["stm2200AuthTable"].targetDt.reload();
							
							// Folding 영역 권한그룹 목록 재조회
							authListSetting();
						}
					});
					
					//AJAX 전송
					ajaxObj.send();
				},
				"click":function(rowData){
					
					var foldingAuthGrpTarget = $("#authGrp-content__authList").children('ul');
					
					// folding 영역에 있는 권한그룹 목록 active 제거
					foldingAuthGrpTarget.find("a").removeClass("active");
					// 클릭한 권한그룹 active 추가
					foldingAuthGrpTarget.find(".nav-item[data-authGrp-id='"+rowData.authGrpId+"'] a").addClass("active");
					
					// 클릭한 권한의 메뉴 데이터 조회
					selAuthGrpMenuListSetting(rowData.authGrpId, rowData.authGrpNm);
				},
				"dblClick":function(rowData){
					// 상세보기 팝업 호출
					var data = {
							type:"view",
							paramPrjId: rowData.prjId,
							paramAuthGrpId: rowData.authGrpId,
						};
					var options = {
							idKey: rowData.authGrpId,
							modalTitle: $.osl.lang("stm2200.title.view"),
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm2000/stm2200/selectStm2201View.do',data,options);
				}
			}
		});
		
		// folding 영역 권한그룹 목록 조회 및 세팅
		authListSetting();
		
		// 권한영역 folding 버튼클릭
		$("#authFoldingBtn").click(function(){
			$(this).toggleClass("on");
			// 권한그룹 영역 열려있을 경우
			if($(this).hasClass("on")){
				$("#authGrp-content__title").show(); 	// Folding 영역 타이틀
				$("#authGrp-content__authList").hide(); // Folding 영역 권한그룹 목록
				$("#authGrp-table-btn").show(); 		// datatable 버튼영역
			}else{
				$("#authGrp-content__title").hide();
				$("#authGrp-content__authList").show();
				$("#authGrp-table-btn").hide();
			}
		});
		
		// 그룹메뉴명 전체 체크/전체 해제 이벤트 처리
		// 전체체크박스는 form에 담지 않기 위해 밸류값을 변경하지 않는다.
		$("input[type='checkbox']").click(function() {
			var allChkId = $(this).attr("id");
			
			if(allChkId.indexOf("menuAuthAll") > -1){
				if ($(this).is(':checked')) {
					//start with selector는 ^= , end with selector는 $=
					var allName = $(this).attr("name");
					$("input[name$=" + allName + "]").prop("checked", true);
					$("input[name$=" + allName + "]").val("Y");
					$("input[name^=status]").val("U");
				} else {
					//start with selector는 ^= , end with selector는 $=
					var allName = $(this).attr("name");
					$("input[name$=" + allName + "]").prop("checked", false);
					$("input[name$=" + allName + "]").val("N");
					$("input[name^=status]").val("U");
					
					//접근권한 체크해제인경우 메인화면 해제
					if(allName == "accessYn"){
						$('input[id^=rd]:checked').prop("checked",false);
					}
				}
				
				//전체선택 체크박스 값을 초기화 하지 않으면 오류 발생함. substring으로 자를수 없기 때문
				$("[id^=menuAuthAll-]").val("");
			}
		});
		
		// 시스템 메뉴 권한 저장버튼 클릭
		$("#authGrp-menu-save").click(function(){
			$.osl.confirm("시스템 메뉴 권한을 저장하시겠습니까?",null,function(result) {
		        if (result.value) {
					saveAuthGrpMenuAuthList();
		        }
		    });
			
		});
		
	};
	
	
	
	 // function 명 	: authListSetting
	 // function 설명	: 시스템 기본 권한목록을 조회하여 folding 영역에 세팅한다.
	var authListSetting = function() {
		
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2200/selectStm2200StmAuthGrpNoPagingListAjax.do'/>", "async": false});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				var target = $("#authGrp-content__authList").children('ul');
				// folding 상단 권한그룹 영역 초기화
				target.html("");
				
				var activeAuthInfo = {};
				
				// 권한그룹 목록 세팅
				$.each(data.stmAuthGrpList, function(idx, map){
					
					var activeStr = "";
					// 조회한 권한목록이 첫번쨰이면 active
					if(idx == 0){
						activeStr = "active";
						activeAuthInfo = map;
					}
					
					target.append(
							'<li class="nav-item kt-margin-5" onclick="OSLStm2200.selectAuthMenuList(\''+map.authGrpId+'\', \''+$.osl.escapeHtml(map.authGrpNm)+'\' )" data-authGrp-id="'+map.authGrpId+'" >'
								+'<a href="#" class="btn btn-default btn-sm btn-elevate btn-elevate-air '+ activeStr +'" data-toggle="tab" role="tab" aria-selected="true">'
									+'<span class="nav-link-title"><i class="kt-menu__link-icon fa fa-user-tie"></i>'+ $.osl.escapeHtml(map.authGrpNm) +'</span>' 
								+'</a>'
							+'</li> '		
					);
				});
				
				// active된 권한 그룹 목록이 있을 경우
				if(!$.isEmptyObject(activeAuthInfo)){
					// active된 권한그룹 조회
					selAuthGrpMenuListSetting(activeAuthInfo.authGrpId, $.osl.escapeHtml(activeAuthInfo.authGrpNm));
				}
			}	
		}); 
		
		//AJAX 전송
		ajaxObj.send();
	};
	
	
	 // function 명 	: selAuthGrpMenuListSetting
	 // function 설명	: 권한그룹별 메뉴 권한 목록 조회 
	 // @param authGrpId : 권한그룹 ID
	 // @param authGrpNm : 권한그룹명, 상단 시스템 메뉴 권한 앞에 권한그룹 명을 표시하기 위해 사용한다.
	var selAuthGrpMenuListSetting = function(authGrpId, authGrpNm){
		
		if(!$.osl.isNull(authGrpNm)){
			// 시스템 메뉴 권한 제목영역에 선택한 권한그룹 명 세팅
			$("#authGrpNameTitle").text("["+authGrpNm+"]");
		}
		
		$("#authGrpId").val(authGrpId);
		
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2200/selectStm2200AuthGrpMenuListAjax.do'/>"},
				{"authGrpId":authGrpId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				$.osl.toastr(data.message);
				
				// 메뉴목록을 세팅할 target tbody
				var target = $("#menuAuth-list");
				// 메뉴 권한영역 초기화
				target.html("");
				
				// rowspan 대상 대메뉴 ID
		    	var prevUpupMenuId = '';
		    	// 대메뉴 rowspan
		    	var largeMenuRowSpan = {};

		    	// 메뉴 권한 그리기
		    	$.each(data.menuAuthList,function(idx, data){
		    	
		    		var status = data.status; // 메뉴 상태값
		    		var menuTypeCd = data.menuTypeCd; // 메뉴 타입 
		    		
		    		// 메뉴정보
		    		var menuId = $.osl.escapeHtml(data.menuId);
		    		var menuNm = $.osl.escapeHtml(data.menuNm);
		    		var upperMenuId = $.osl.escapeHtml(data.upperMenuId);
		    		var upMenuNm = $.osl.escapeHtml(data.upMenuNm);
		    		var upupMenuId = $.osl.escapeHtml(data.upupMenuId);
		    		var upupMenuNm = $.osl.escapeHtml(data.upupMenuNm);
		    		
		    		//배열로 체크박스 컬럼명 저장하여 반복 루프 처리함.
		    		var strArrYn = ["accessYn", "selectYn", "regYn", "modifyYn", "delYn", "excelYn", "printYn"];
		    		
		    		//tr 태그 id 부여하여 생성
		    		target.append("<tr id='tr" + menuId + "'>");
					
		    		//생성한 tr태그 객체 얻기
		    		var trObj = $("#tr" + menuId);
		    		
		    		//새로운 대 메뉴인경우
		    		if($.osl.isNull(prevUpupMenuId) || prevUpupMenuId != upupMenuId){
		    				trObj.append("<td class='osl-valign-middle--imp osl-align-center--imp' id='largeMenuRow_"+upupMenuId+"' rowspan='1'>" + upupMenuNm + "</td>");	
		    		}else{
		    			// 대메뉴 menu id별 rowspan 생성
		    			if($.osl.isNull(largeMenuRowSpan[upupMenuId])){
		    				largeMenuRowSpan[upupMenuId] = 1;
		    			}
		    			
		    			//오류 처리 안함
		   				try{
		   					// 대메뉴 rowspan +1
		    				var upUpObjRowspan = parseInt(largeMenuRowSpan[upupMenuId]);
		    				largeMenuRowSpan[upupMenuId] = (upUpObjRowspan+1);
		   				}catch(err){
		   					console.log(err);
		   				}
		    		}
		    		prevUpupMenuId = upupMenuId;
		    		
	   				// 중메뉴, 소메뉴 붙이기
		    		trObj.append("<td class='osl-align-left--imp'>" + upMenuNm + " &#62; " + menuNm + "</td>");
					//해당 로우 상태 담기
					trObj.append("<input type='hidden' name='" + "status" + menuId + "' id='" + "status" + menuId + "' value='" + status + "' />");
					
		    		// 메뉴별 권한 체크박스 생성
		    		$.each(strArrYn, function(idx, val){
		    			
		    			var strMenuId = menuId + val; 
		    			var hidMenuId = "hidden" + menuId + val ;
		    			var hidStatus = "status" + menuId;	//수정상태인지 그냥 수정전 상태인지 상태값 가진 인풋
		    			 
		    			trObj.append(
		    				"<td>"
		    					+"<label class='kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0' for='" + strMenuId + "'>"
		    						+"<input type='hidden' name='" + hidMenuId + "' id='" + hidMenuId + "' value='" + eval("data." + val) + "' />"
		    						+"<input type='checkbox' title='체크박스' onclick='OSLStm2200.changeChkValue(this,"+idx+");' data-action='"+ val +"' name='" + strMenuId + "' id='" + strMenuId + "' value='" + eval("data." + val) + "' />"
		    						+"<span></span>"
		    					+"</label>"
		    				+"</td>"
		    			);
		    			
		    		});
		    		
		    		// 가로로 전체 체크가능한 체크박스 
		    		trObj.append(
	    				"<td>"
	    					+"<label class='kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0' for='"+menuId+"_authHorizon'>"
	    						+"<input type='checkbox' title='체크박스' name='"+menuId+"_authHorizon' id='"+menuId+"_authHorizon' onclick='OSLStm2200.authHorizonCheck(this);' value />"
	    						+"<span></span>"
	    					+"</label>"
	    				+"</td>"
		    		);
		    		
		    		// value값 확인하여 체크 상태 변경
		    		$.each(strArrYn, function(idx, val){
		    			var authCheckBox = $("#" + menuId + val);
		        		if($(authCheckBox).val() == 'Y'){
		        			$(authCheckBox).prop("checked", true);
		        		}else{
		        			$(authCheckBox).prop("checked", false);
		        		}	
		    		});

		    		//전체 선택 체크 풀기
		    		$("input[id^=menuAuthAll-]").prop("checked",false); 
		    		
		    	});
		    	
		    	// 대메뉴 rowspan 걸기
		    	$.each(largeMenuRowSpan, function(idx, map){
		    		$("#largeMenuRow_"+idx).attr("rowspan",map);
		    	});
				
			}	
		});
		
		//AJAX 전송
		ajaxObj.send();
	};


	 // function 명 	: changeValueToCheck
	 // function 설명	: 권한관리 체크박스 클릭시 체크상태를 확인하여 밸류값을 변환 
	 // @param chkObj : 체크박스 object
	 // @param index : 체크박스 인덱스값
	 //                접근:0, 조회:1, 등록:2, 수정:3, 삭제:4, 엑셀:5, 출력:6
	var changeValueToCheck = function(chkObj, index){
		 
		// 체크박스에 세팅된 메뉴 Id값
		var strMenuId = $(chkObj).attr("id").substring(0,12);
		
		// 만약 체크 상태가 체크이면 value에 Y 세팅, 상태를 수정모드로 변경
		if(	$(chkObj).prop('checked')){
			$(chkObj).val("Y");
			$("#hidden" + $(chkObj).attr("id")).val("Y");
			$("#status" + strMenuId).val("U");
		}
		//체크 상태가 아니라면 value에 N 세팅, 상태를 수정모드로 변경
		else{
			
			// 체크 상태가 아닐때 세로 전체체크에 체크되어있다면 체크해제한다.
			var action = $(chkObj).data("action"); // action값 : selectYn, delYn 등
			if($("#menuAuthAll-"+action).is(":checked")){
				$("#menuAuthAll-"+action).prop('checked',false);
			}
			
			// 체크상태가 아닐 때 가로 전체체크에 체크되어있다면 체크해제한다.
			var horizonChkbox = $("#"+strMenuId+"_authHorizon");
			if(horizonChkbox.is(":checked")){
				horizonChkbox.prop('checked',false);
			}
			
			// 메인의 radio에 체크되어있고, 현재 체크박스가 접근일 경우
			if($('#rd_'+strMenuId).prop("checked") && index== 0 ){
				
				$.osl.confirm("메인화면으로 지정되있는 화면의 접근권한을 해제시 메인화면으로 지정상태가 해제됩니다. 계속 진행하시겠습니까?",null,function(result) {
	    	        if(result.value) {
	    	        	// 라디오버튼 체크해제
	    	        	$('#rd_'+strMenuId).prop("checked",false);
						// access 값을 모두 N으로 변경, 상태값을 U(수정)로 변경 
	    	        	$(chkObj).val("N");
						$("#hidden" + $(chkObj).attr("id")).val("N");
						$("#status" + strMenuId).val("U");
	    	        }else{
						$(chkObj).prop('checked',true);
	    	        }
	    		});
				
			// 메인의 radio에 체크되어있지 않을 경우	
			}else{
				$(chkObj).val("N");
				$("#hidden" + $(chkObj).attr("id")).val("N");
				$("#status" + strMenuId).val("U");	
			}
		}
	}


	
	 // function 명 	: menuAuthHorizonCheck
	 // function 설명	: 가로 전체체크 클릭 시 접근, 조회, 수정, 삭제, 엑셀, 출력에 모두 체크&체크해제 한다.
	 // @param chkObj : 가로 전체체크 체크박스 object
	var menuAuthHorizonCheck = function(chkObj){
		 
		// 체크박스의 ID를 가져온다
		var horizonChkId = $(chkObj).attr("id"); 
		// 체크박스 ID에서 메뉴 ID를 추출
		var horizonMenuId = horizonChkId.split("_")[0];
		
		// 가로 전체체크 할 경우
		if($(chkObj).is(':checked')){
			$("input[name^=" + horizonMenuId + "]").prop("checked", true);
			$("input[name^=" + horizonMenuId + "]").val("Y");
			$("input[name^=hidden" + horizonMenuId + "]").val("Y");
			$("input[name^=status" + horizonMenuId + "]").val("U");
		// 가로 전체 체크해제 할 경우	
		}else{
			$("input[name^=" + horizonMenuId + "]").prop("checked", false);
			$("input[name^=" + horizonMenuId + "]").val("N");
			$("input[name^=hidden" + horizonMenuId + "]").val("N");
			$("input[name^=status" + horizonMenuId + "]").val("U");
			
			// 접근 체크박스인지 체크할 ID값
			var accessChkId = $("input[name^=" + horizonMenuId + "]").attr("id");
			
			//접근권한 체크해제인경우 메인화면 해제
			if(accessChkId.indexOf("accessYn") != -1){
				$('input[id^=rd_'+horizonMenuId+']:checked').prop("checked",false);
			}
		}
	}


	 // function 명 	: saveAuthGrpMenuAuthList
	 // function 설명	: 권한그룹의 메뉴권한 정보들을 저장한다. 
	var saveAuthGrpMenuAuthList = function(){ 
		
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2200/saveStm2200AuthGrpMenuAuthListAjax.do'/>","loadingShow":true}
				,$("#frStm2200StmMenuAuth").serialize());
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				// 메뉴 권한 저장 성공
				$.osl.toastr(data.message);
			}
		});

		//AJAX 전송
		ajaxObj.send();
	}

	return {
		  // public functions
		  init: function() {
		  	documentSetting();
		  },
		  // folding 영역에 세팅될 권한그룹 목록 조회
		  selectFoldingAuthList:function(){
			  authListSetting();
		  },
		  // 선택한 권한그룹의 메뉴 권한 조회
		  selectAuthMenuList: function(authGrpId, authGrpNm){
			  selAuthGrpMenuListSetting(authGrpId, authGrpNm);  
		  },
		  // 메인 라디오 버튼 체크
		  mainMenuRadioCheck : function(radioObj, menuId){
			  mainRadioCheck(radioObj ,menuId);
		  },
		  // 체크박스 체크시 value값 변경
		  changeChkValue : function(checkBoxObj, index){
			  changeValueToCheck(checkBoxObj, index);
		  },
		  // 가로 전체 체크
		  authHorizonCheck : function(checkBoxObj){
			  menuAuthHorizonCheck(checkBoxObj);
		  }
	};
}();

//Initialization
$.osl.ready(function(){
	OSLStm2200.init();
});

</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />