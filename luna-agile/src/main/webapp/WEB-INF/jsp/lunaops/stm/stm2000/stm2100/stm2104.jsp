<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h3>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" id="selectBtn" name="selectBtn" data-datatable-id="stm2100StmTable" data-datatable-action="select" title="데이터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span>조회</span>
				</button>
				<!-- 엑셀 출력 버튼 넣기 -->
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-5 col-md-6 col-sm-6">
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-prepend">
							<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0" name="selectSearchBtn" id="selectSearchBtn">전체</button>
							<div class="dropdown-menu">
								<a class="selectSearchItem dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
								<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="stmTypeNm" data-opt-type="select">유형</a>
								<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="stmNm" data-opt-type="text">게시판명</a>
							</div>
						</div>
						<select class="kt-select2 form-control kt-hide" id="searchSelect" name="searchSelect" aria-hidden="true">
						</select>
						<input type="text" class="form-control searchInput" aria-label="검색어를 입력해주세요" disabled="disabled" name="subSearchData" id="subSearchData">
						<div class="input-group-append">
							<button class="btn btn-brand" type="button" name="searchBtn" id="searchBtn">
								<span class=""><i class="fa fa-search"></i><span>검색</span></span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-7 col-md-6 col-sm-6">
				<div class="kt-align-right">
					<button type="button" class="btn btn-bold kt-padding-5 kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="그리드형" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" name="menuGrid" id="menuGrid" onclick="location.href='/stm/stm2000/stm2100/selectStm2100View.do'"><i class="fa flaticon2-indent-dots kt-font-brand"></i></button>
					<button type="button" class="btn btn-bold kt-padding-5 kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="카드형" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" name="menuCard" id="menuCard"><i class="fa flaticon-squares-1 kt-font-brand"></i></button>
				</div>
			</div>
		</div>
		<div name="stmList" id="stmList"></div>
	</div>
</div>
<!-- begin page script -->
<script>
 "use strict";
 var okManager;
 var okWriter;
 var subInnerHtml;
 var OSLStm2100Popup = function() {
	 var targetId;
	 var targetType;
	 var targetData;
	 var searchTargetData;
	 
	 var documentSetting = function() {
		 
		//select box 세팅
	   	var commonCodeArr=[
	   		{mstCd: "STM00001", useYn: "Y", comboType: "OS", targetObj: "#searchSelect"}
	   	];
	   	$.osl.getMulticommonCodeDataForm(commonCodeArr, false);
	   	
		//초기 검색 select 안보이게
		$("#searchSelect~span").addClass("osl-datatable-search--hide");
		
		//검색 drop-item 변경 시 이벤트 적용
		$(".selectSearchItem").click(function(){
			$(".selectSearchItem").removeClass("active");
			$(this).addClass("active");
			$("#selectSearchBtn").text($(this).text());
			
			//검색 선택에 따른 select, input 설정
			if($(this).data("opt-type")=="all"){
				//kt-hide 처리하기 - select
				$("#searchSelect").addClass("kt-hide");
				$("#searchSelect~span").addClass("osl-datatable-search--hide");
				//kt-hide 지우기 - input
				$("#subSearchData").removeClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", true);
				
				$("#searchBtn").click();
			 }else if($(this).data("opt-type")=="select"){
				//kt-hide 지우기 - select
				$("#searchSelect").removeClass("kt-hide");
				$("#searchSelect~span").removeClass("osl-datatable-search--hide");
				//kt-hide 처리하기 - input
				$("#subSearchData").addClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", true);
			 }else{
				//kt-hide 처리하기 - select
				$("#searchSelect").addClass("kt-hide");
				$("#searchSelect~span").addClass("osl-datatable-search--hide");
				//kt-hide 지우기 - input
				$("#subSearchData").removeClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", false);
			 }
		});
		
		 //검색 버튼 클릭 시
		 $("#searchBtn").click(function(){
			targetId = $(".selectSearchItem.dropdown-item.active").data("field-id");
			targetType = $(".selectSearchItem.dropdown-item.active").data("opt-type");
			if(targetType == "all"){
				targetData = null;
			}else{
				targetData = $(".searchInput").val();
			}
			if(targetType == "select"){
				targetData = $("#searchSelect").val();
			}

			//리스트 조회때는 searchTargetData 안의 값만 전달
			//상세 목록때는 searchTargetData array로 전달
			searchTargetData = [{
				"searchTargetId" : targetId,
				"searchTargetType" : targetType,
				"searchTargetData" : targetData
			}];
			
			$("#stmList").empty();
			selectStmList();
		 });
		 
		 //검색어 입력후 엔터 칠 경우
		 $("#subSearchData").on("keypress", function(e){
	   		if(e.key == "Enter"){
	   			$("#searchBtn").click();		
	   		}
	   	});
		 
		 $("#selectBtn").click(function(){
			 $("#stmList").empty();
			 selectStmList();
		 });
		
		 selectStmList();
	 };
	 
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
		 };
		 
		 
		/**
		* function 명 	: selectStmList
		* function 설명	: 게시판 리스트 조회하여 그리기
		*/
		var selectStmList = function(){
			// 전달할 데이터 세팅
			var data={
					searchTargetId : targetId,
					searchTargetType : targetType,
					searchTargetData : targetData,
	    	}
			//ajax 설정
			var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2100ListAjax.do'/>"}
					, data);
			//ajax 전송 성공 함수
	    	ajaxObj.setFnSuccess(function(data){
	    		if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
					//모달 창 닫기
					$.osl.layerPopupClose();
				}else{
					var list = data.data;
					
					//리스트 그리기
					var innerHtml ="";
					$.each(list, function(idx, value){
						innerHtml = "<div class='row card kt-margin-5'>";
						innerHtml += "<div class='card-header kt-font-bolder text-truncate'>";
						innerHtml += "<div class='row'><div class='col-7'><label class='kt-checkbox kt-checkbox--bold kt-checkbox--brand'>";
						innerHtml += "<input type='checkbox' class='checkBoxInput'>&nbsp;";
						innerHtml += "<span></span>";
						innerHtml += "</label>";
						if(value.stmTypeCd=="01"){
							innerHtml += "<i class='la la-newspaper-o kt-margin-r-5'></i>[일반]";
						}else if(value.stmTypeCd=="02"){
							innerHtml += "<i class='la la-server kt-margin-r-5'></i>[자료실]";
						}else if(value.stmTypeCd=="03"){
							innerHtml += "<i class='la la-image kt-margin-r-5'></i>[갤러리]";
						}else{
							innerHtml += "<i class='la la-youtube-play kt-margin-r-5'></i>[영상]";
						}
						innerHtml += "<span>"+$.osl.escapeHtml(value.stmNm)+"</span></div>";
						innerHtml += "<div class='col-4'><i class='flaticon-user kt-margin-r-5'></i><span>담당자</span>";
						//담당자 목록 넣기
						innerHtml += "<span>...담당자 목록 리스트...</span></div>";
						innerHtml += "</div></div>";
						innerHtml += "<div class='card-body'>";
						//차트로 넣기
						//우선 텍스트로...
						selectStm2103(value.menuId);
						innerHtml += subInnerHtml;
						innerHtml += "</div>";
						innerHtml += "<div class='card-footer text-muted kt-align-right'>";
						innerHtml += "<input type='button' class='btn btn-outline-brand btn-sm btn-font-sm kt-margin-r-5 updateBtn' value='수정' data-stmTypeCd='"+value.stmTypeCd+"' data-stmNm='"+$.osl.escapeHtml(value.stmNm)+"' data-menuId='"+value.menuId+"' data-stmDsTypeCd='"+value.stmDsTypeCd+"'>";
						innerHtml += "<input type='button' class='btn btn-outline-brand btn-sm btn-font-sm kt-margin-r-5 settingBtn' value='관리' data-stmTypeCd='"+value.stmTypeCd+"' data-stmNm='"+$.osl.escapeHtml(value.stmNm)+"' data-menuId='"+value.menuId+"' data-stmDsTypeCd='"+value.stmDsTypeCd+"'>";
						innerHtml += "</div>";
						$("#stmList").append(innerHtml);
					});
					
					$(".updateBtn").click(function(){
						var data = {
								menuId: $(this).data("menuid"),
								stmTypeCd: $(this).data("stmtypecd"),
								stmNm: $(this).data("stmnm"),
								stmDsTypeCd : $(this).data("stmdstypecd"),
						};
						var options = {
								idKey: $(this).data("menuid"),
								modalTitle: "게시판 속성",
								closeConfirm: false
							};
						checkUser($(this).data("menuid"), $(this).data("stmdstypecd"));
						if(okManager == true){
							$.osl.layerPopupOpen('/stm/stm2000/stm2100/selectStm2101View.do',data,options);
						}else{
							$.osl.alert("해당 게시판에 대한 접근 권한이 없습니다.", {"type":"warning"});
						}
					});
					$(".settingBtn").click(function(){
						var data = {
								menuId: $(this).data("menuid"),
								stmTypeCd: $(this).data("stmtypecd"),
								stmNm: $(this).data("stmnm"),
								//시스템 게시판에서 접근 시 라이센스 범위로 보기 위해 01로 지정
								stmDsTypeCd : "01",
						};
						var options = {
								idKey: $(this).data("menuid"),
								modalTitle: "게시판 관리",
								closeConfirm: false,
								modalSize: "xl",
							};
						checkUser($(this).data("menuid"), $(this).data("stmdstypecd"));
						if(okManager == true || okWriter == true){
							if($(this).data("stmtypecd") == "01" || $(this).data("stmtypecd") == "02"){
								$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1000View.do',data,options);
							}else{
								$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1006View.do',data,options);
							}
						}else{
							$.osl.alert("해당 게시판에 대한 접근 권한이 없습니다.", {"type":"warning"});
						}
					});
				}
	    	});
	    	//AJAX 전송
			ajaxObj.send();
		};
		
		 /**
		* function 명 	: selectStm2103
		* function 설명	: 해당 게시판 통계자료 가져오기
		*/
		 var selectStm2103 = function(menuId){
			 //조회할 메뉴 아이디 전달
			 var data = {
					 menuId : menuId,
			 }
			 //AJAX 설정
			 var ajaxObj = new $.osl.ajaxRequestAction(
		    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2103BadSummeryInfoAjax.do'/>", "async": false}
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
					
					//가져온 데이터로 세팅하기
					subInnerHtml = "";
					subInnerHtml += "<div class='row kt-padding-b-20'>";
					subInnerHtml += "<div class='col-6'>";
					subInnerHtml += "<div class='kt-font-bolder'>";
					subInnerHtml += "<i class='fa flaticon-exclamation-1 kt-margin-r-5'></i> 공지사항</div>";
					if(ntcInfo != "N"){
						subInnerHtml += "<div class='kt-padding-l-15' name='ntcCnt' id='ntcCnt'>";
						subInnerHtml += "공지사항 수 : " + ntcInfo.cnt +" 건</div>";
						subInnerHtml += "<div class='kt-padding-l-15' name='ntcCurrent' id='ntcCurrent' data-badId='"+ntcInfo.badId+"' data-prjGrpId='"+ntcInfo.prjGrpId+"' data-prjId='"+ntcInfo.prjId+"'>";
						subInnerHtml += "최신 공지일 : " + ntcInfo.badNtcStdtm + "</div>";
					}else{
						subInnerHtml += "<div class='kt-padding-l-15' name='ntcCnt' id='ntcCnt'>";
						subInnerHtml += "공지사항 수 : 없음</div>";
						subInnerHtml += "<div class='kt-padding-l-15' name='ntcCurrent' id='ntcCurrent' data-badId='' data-prjGrpId='' data-prjId=''>";
						subInnerHtml += "최신 공지일 : 없음</div>";
					}
					subInnerHtml += "</div>";
					subInnerHtml += "<div class='col-6'>";
					subInnerHtml += "<div class='kt-font-bolder'>";
					subInnerHtml += "<i class='fa flaticon-chat-1 kt-margin-r-5'></i> 댓글</div>";
					if(badCmtInfo != "N"){
						subInnerHtml += "<div class='kt-padding-l-15' name='cmtAllCnt' id='cmtAllCnt'>";
						subInnerHtml += "전체 댓글 수 : " + badCmtInfo.allCnt +" 건</div>";
						subInnerHtml += "<div class='kt-padding-l-15' name='cmtMaxInfo' id='cmtMaxInfo' data-badId='"+ badCmtInfo.badId+"' data-prjGrpId='"+ badCmtInfo.prjGrpId+"' data-prjId='"+ badCmtInfo.prjId+"'>";
						subInnerHtml += "최다 댓글 수 : " + badCmtInfo.cnt + " 건</div>";
					}else{
						subInnerHtml += "<div class='kt-padding-l-15' name='cmtAllCnt' id='cmtAllCnt'>";
						subInnerHtml += "전체 댓글 수 : 없음</div>";
						subInnerHtml += "<div class='kt-padding-l-15' name='cmtMaxInfo' id='cmtMaxInfo' data-badId='' data-prjGrpId='' data-prjId=''>";
						subInnerHtml += "최다 댓글 수 : 없음</div>";
					}
					subInnerHtml += "</div></div>";
					subInnerHtml += "<div class='row kt-padding-b-20'>";
					subInnerHtml += "<div class='col-6'>";
					subInnerHtml += "<div class='kt-font-bolder'>";
					subInnerHtml += "<i class='fa flaticon-edit-1 kt-margin-r-5'></i> 게시글</div>";
					if(badCntInfo != "N"){
						subInnerHtml += "<div class='kt-padding-l-15' name='badAllCnt' id='badAllCnt'>";
						subInnerHtml += "전체 게시글 수 : 등록 "+badCntInfo.badCntAll+" 건 / 삭제 "+badCntInfo.badCntDel+" 건</div>";
					}else{
						subInnerHtml += "<div class='kt-padding-l-15' name='badAllCnt' id='badAllCnt'>";
						subInnerHtml += "전체 게시글 수 : 없음</div>";
					}
					if(badHitInfo != "N"){
						subInnerHtml += "<div class='kt-padding-l-15' name='badHitInfo' id='badHitInfo' data-badId='"+badHitInfo.badId+"' data-prjGrpId='"+badHitInfo.prjGrpId+"' data-prjId='"+badHitInfo.prjId+"'>";
						subInnerHtml += "최다 조회 수 : "+badHitInfo.badHit+" 회</div>";
					}else{
						subInnerHtml += "<div class='kt-padding-l-15' name='badHitInfo' id='badHitInfo' data-badId='' data-prjGrpId='' data-prjId=''>";
						subInnerHtml += "최다 조회 수 : 없음</div>";
					}
					if(pwCnt != 0){
						subInnerHtml += "<div class='kt-padding-l-15' name='badPwCnt' id='badPwCnt'>";
						subInnerHtml += "비밀글 수 : " + pwCnt + " 건</div>";
					}else{
						subInnerHtml += "<div class='kt-padding-l-15' name='badPwCnt' id='badPwCnt'>";
						subInnerHtml += "비밀글 수 : 없음</div>";
					}	
					subInnerHtml += "</div>";
					subInnerHtml += "<div class='col-6'>";
					subInnerHtml += "<div class='kt-font-bolder'>";
					subInnerHtml += "<i class='fa flaticon-interface-9 kt-margin-r-5'></i> 태그</div>";
					if(tagInfo != null && tagInfo != "" && tagInfo != "N"){
						$.each(tagInfo, function(idx, value){
							if(idx < 3){ //sql 조회 top 5
								subInnerHtml += "<div class='kt-padding-l-15'>사용 TOP " + (idx + 1) + " : #" + $.osl.escapeHtml(value.tagNm)+ "</div>";
							}
						});
					}else{
						subInnerHtml += "<div class='kt-padding-l-15'>사용 태그 없음</div>";
					}
					subInnerHtml += "</div></div>";
					subInnerHtml += "<div class='row kt-padding-b-20'>";
					subInnerHtml += "<div class='col-6'>";
					subInnerHtml += "<div class='kt-font-bolder'>";
					subInnerHtml += "<i class='fa flaticon-tool-1 kt-margin-r-5'></i> 첨부파일</div>";
					if(fileSummery != "N"){
						subInnerHtml += "<div class='kt-padding-l-15' name='fileAllCnt' id='fileAllCnt'>";
						subInnerHtml += "전체 첨부파일 수 : " +parseInt(fileSummery.fileTotalCnt) + " 건</div>";
						subInnerHtml += "<div class='kt-padding-l-15' name='fileAllSize' id='fileAllSize'>";
						subInnerHtml += "전체 첨부파일 크기 : " + $.osl.byteCalc(parseInt(fileSummery.fileTotalSize))+"</div>";
					}else{
						subInnerHtml += "<div class='kt-padding-l-15' name='fileAllCnt' id='fileAllCnt'>";
						subInnerHtml += "전체 첨부파일 수 : 없음</div>";
						subInnerHtml += "<div class='kt-padding-l-15' name='fileAllSize' id='fileAllSize'>";
						subInnerHtml += "전체 첨부파일 크기 : 없음</div>";
					}
					subInnerHtml += "</div></div>";
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
	 OSLStm2100Popup.init();
 });
</script>
<!-- end script -->

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />