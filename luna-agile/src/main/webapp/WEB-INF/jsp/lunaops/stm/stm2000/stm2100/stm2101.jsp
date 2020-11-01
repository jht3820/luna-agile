<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="stm2101Info" autocomplete="off" >
	<div class="kt-portlet kt-portlet--mobile osl-stm__portlet kt-margin-b-0">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<div class="kt-portlet__head-label">
				<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
					<c:if test="${param.stmTypeCd eq '01' }">
						<i class="la la-newspaper-o kt-margin-r-5"></i><span data-lang-cd="stm2100.type.normal">[일반]</span>
					</c:if>
					<c:if test="${param.stmTypeCd eq '02' }">
						<i class="la la-server kt-margin-r-5"></i><span data-lang-cd="stm2100.type.storage">[자료실]</span>
					</c:if>
					<c:if test="${param.stmTypeCd eq '03' }">
						<i class="la la-image kt-margin-r-5"></i><span data-lang-cd="stm2100.type.gallery">[갤러리]</span>
					</c:if>
					<c:if test="${param.stmTypeCd eq '04' }">
						<i class="la la-youtube-play kt-margin-r-5"></i><span data-lang-cd="stm2100.type.move">[영상]</span>
					</c:if>
					<c:out value="${param.stmNm }"/>
				</h3>
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-wrapper">
				</div>
			</div>
		</div>
		<div class="kt-portlet__body kt-padding-t-15 kt-padding-b-15">
			<div class="row">
				<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">
					<input type="hidden" id="menuId" name="menuId" value="${param.menuId }"/>
					<input type="hidden" id="paramStmDsTypeCd" name="paramStmDsTypeCd" value="${param.stmDsTypeCd }"/>
					<div class="form-group kt-margin-b-15">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.name">게시판 명</span></label>
						<input type="text" class="form-control" name="stmNm" id="stmNm" disabled="disabled">
					</div>
					<div class="form-group kt-margin-b-15">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.type">유형</span></label>
						<select class="form-control kt-select2" name="stmTypeCd" id="stmTypeCd"></select>
					</div>
					<div class="form-group kt-margin-b-15">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.dsType">게시물 공개 범위</span></label>
						<select class="form-control kt-select2" name="stmDsTypeCd" id="stmDsTypeCd"></select>
					</div>
					<div class="form-group kt-margin-b-15">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.option">옵션</span></label>
						<div class="row kt-margin-10">
						<div class="col-5">
							<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success" style="vertical-align: text-top;">
								<input type="checkbox" name="stmNtcYnCd" id="stmNtcYnCd">
								<span></span>
							</label>
							<span data-lang-cd="stm2101.label.noticeCheck">공지사항 사용</span>
						</div>
						<div class="col-5">
							<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success" style="vertical-align: text-top;">
									<input type="checkbox" name="stmCmtYnCd" id="stmCmtYnCd"><span></span>
								</label>
								<span data-lang-cd="stm2101.label.commentCheck">댓글 사용</span>
							</div>
						</div>
						<div class="row kt-margin-10">
						<div class="col-5">
							<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success" style="vertical-align: text-top;">
								<input type="checkbox" name="stmPwYnCd" id="stmPwYnCd"><span></span>
							</label>
							<span data-lang-cd="stm2101.label.secretCheck">비밀글 사용</span>
						</div>
						<div class="col-5">
							<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success" style="vertical-align: text-top;">
									<input type="checkbox"  name="stmFileYnCd" id="stmFileYnCd"><span></span>
								</label>
								<span data-lang-cd="stm2101.label.attchFileCheck">첨부파일 사용</span>
							</div>
						</div>
						<div class="row kt-margin-10">
							<div class="col-5">
								<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success" style="vertical-align: text-top;">
									<input type="checkbox" name="stmTagYnCd" id="stmTagYnCd"><span></span>
								</label>
								<span data-lang-cd="stm2101.label.tagCheck">태그 사용</span>
							</div>
						</div>
					</div>
					<div class="kt-margin-t-15" id="stmFileOption" name="stmFileOption">
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.fileCount">첨부파일 갯수</span></label>
							<input type="text" class="form-control" name="stmFileCnt" id="stmFileCnt" regexstr="^0$|^[1-9]{1}$|^10$" maxlength="2" placeholder="최대 10개 파일" regexalert="최대 숫자 10" required />
							<span class="kt-padding-5" style="font-size: 0.5rem; font-style: italic; color: gray; text-align: end; float: right;" data-lang-cd="stm2101.label.maxFileCnt">최대 개수 : 10</span>
						</div>
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.limitFileStrg">첨부파일 용량 제한(MB)</span></label>
							<input type="text" class="form-control" name="stmFileStrg" id="stmFileStrg" regexstr="^0$|^[1-9]{1}[0-9]*$" maxlength="10" placeholder="최대 용량(합)"  regexalert="숫자만 가능" required />
							<span class="kt-padding-5" style="font-size: 0.5rem; font-style: italic; color: gray; text-align: end; float: right;" name="stmFileStrgStr" id="stmFileStrgStr" data-lang-cd="stm2101.label.maxFileStrg.basic">최대 용량 : [자료실] 4GB(4096MB) [영상] 2GB(2048MB) [일반/갤러리] 500MB</span>
						</div>
					</div>
				</div>
				<!--담당자, 글작성 범위-->
				<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group kt-margin-b-10">
						<div class="kt-margin-b-10">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.admin">담당자</span></label>
							<span style="float: right;">
								<button type="button" class="btn btn-outline-success btn-sm" id="reset_admin" name="reset_admin" value=""><span data-lang-cd="stm2101.button.reset">초기화</span></button>
							</span>
						</div>
						<div class="form-group kt-margin-b-10">
							<div class="kt-list ps--active-y form-control kt-padding-10" id="stmAdmList" name="stmAdmList" style="height: 240px; overflow: auto;" required>
							</div>
						</div>
					</div>
					<div class="form-group kt-margin-b-0">
						<div class="kt-margin-b-10">
							<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.writer">글 작성 범위</span></label>
							<span style="float: right;">
								<button type="button" class="btn btn-brand btn-sm" id="equalBtn" name="equalBtn" value=""><span data-lang-cd="stm2101.button.equals">담당자 동일</span></button>
								<button type="button" class="btn btn-outline-success btn-sm" id="reset_wt" name="reset_wt" value=""><span data-lang-cd="stm2101.button.reset">초기화</span></button>
							</span>
						</div>
						<div class="form-group kt-margin-b-10">
							<div class="kt-list ps--active-y form-control kt-padding-10" id="stmWtList" name="stmWtList" style="height: 240px; overflow: auto;" required>
							</div>
						</div>
					</div>
				</div>
				<!--미배정 담당자, 미배정 글작성 범위 표출 영역-->
				<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">
					<!--검색 영역-->
					<div class="row kt-margin-0">
						<label><i class="fas fa-user-alt kt-margin-r-5"></i><span data-lang-cd="stm2101.label.nothing">미배정 권한그룹 및사용자</span></label>
						<input type="hidden" id="typeString" name="typeString" value="${param.typeString }"/>
						<input type="hidden" id="dataList" name="dataList" value='${param.dataList}'/>
					</div>
					<div class="row kt-margin-0 kt-margin-t-10">
						<div class="input-group">
							<div class="input-group-prepend">
								<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0" name="selectSearchBtn" id="selectSearchBtn"><span data-lang-cd="stm2101.button.all">전체</span></button>
								<div class="dropdown-menu">
									<a class="selectSearchItem dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all"><span data-lang-cd="stm2101.button.all">전체</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchAuthGrpNm" data-opt-type="select"><span data-lang-cd="stm2101.button.authNm">권한그룹 명</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrId" data-opt-type="text"><span data-lang-cd="stm2101.button.userId">사용자 ID</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrNm" data-opt-type="text"><span data-lang-cd="stm2101.button.userName">사용자 명</span></a>
								</div>
							</div>
							<select class="kt-select2 form-control kt-hide" id="searchSelect" name="searchSelect" aria-hidden="true">
							</select>
							<input type="text" class="form-control" disabled="disabled" name="subSearchData" id="subSearchData">
							<div class="input-group-prepend">
								<button class="btn btn-brand" type="button" name="searchBtn" id="searchBtn">
									<span class=""><span data-lang-cd="stm2101.button.search">검색</span></span>
								</button>
							</div>
						</div>
					</div>
					<!--사용자 표출영역-->
					<div class="kt-list ps--active-y form-control kt-margin-t-10 kt-padding-10" id="stmGroupUsrList" name="stmGroupUsrList" style="height:480px; overflow: auto;" required>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm2101SaveSubmit"><span data-lang-cd="stm2101.button.updateSubmit">수정 완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><span data-lang-cd="modal.close">닫기</span></button>
</div>
<!-- begin page script -->
<script>
 "use strict";
 
 var OSLStm2101Popup = function(){
	var formId="stm2101Info";
	
	//문구 세팅 
	$("#stm2101SaveSubmit > span").text($.osl.lang("stm2101.button.updateSubmit"));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//담당자/글작성 범위 목록 되돌리기를 위한 변수 선언
	var oriAdmin;
	var oriWriter;
	
	// 기본 설정
	var documentSetting = function(){
  		
    	//해당 게시판 정보 가져오기
    	selectBadInfo(); // 게시판 속성
    	selectBadChargerList(); // 게시판 담당자
    	selectBadWriterList(); // 게시판 글 작성 범위
    	setGrpAndUsrList(oriAdmin, oriWriter); //전체 사용자 및 권한그룹 목록을 담당자와 글작성범위로 분류
    	
    	//초기 검색 select 안보이게
		$("#searchSelect~span").addClass("osl-datatable-search--hide");
		
		//검색 drop-item 변경 시 이벤트 적용
		$(".selectSearchItem").click(function(){
			$(".selectSearchItem").removeClass("active");
			$(this).addClass("active");
			$("#selectSearchBtn").text($(this).text());
			
			//이전에 검색한 조건으로 인해 리스트 안보이는거 되돌리기
			//이전에 그룹/사용자 목록 hide한것이 있다면 모두 제거
			$.each($("#stmGroupUsrList").children(), function(idx, value){
				$(this).removeClass("kt-hide");
			});

			//검색 선택에 따른 select, input 설정 + 스크롤 위치넣기
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
				
				$("#searchBtn").click();
			 }else{
				//kt-hide 처리하기 - select
				$("#searchSelect").addClass("kt-hide");
				$("#searchSelect~span").addClass("osl-datatable-search--hide");
				//kt-hide 지우기 - input
				$("#subSearchData").removeClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", false);
				
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					//사용자 id, 명 검색은 keypress 이벤트가 적용되므로
					//해당 input으로 변경되었을 당시에 권한그룹 감추기
					//권한그룹 목록은 숨기기
					if(value.getAttribute("codenum")=='01'){
						$(this).addClass("kt-hide");
					}else{ //사용자 목록은 보이기
						$(this).removeClass("kt-hide");
					}
				});
			 }
		});
		
		// 권한그룹 선택될 때 이벤트 발생
		$("#searchSelect").change(function(){
			if("all" == $("#searchSelect").val()){
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else{
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					if($("#searchSelect").val() != value.getAttribute("opt-index")){
						$(this).addClass("kt-hide")
					}else{
						$(this).removeClass("kt-hide");
					}
				});
			}
		});
		
		// 검색어가 입력될 때 이벤트 발생
		$("#subSearchData").on("propertychange paste input", function(){
			$("#searchBtn").click();
		});
		
		//엔터키 막기 - 안막으면 강제종료
		$("#"+formId).keydown(function(e){
			if(e.keyCode=='13'){
				e.preventDefault();
				$("#searchBtn").click();
				return;
			}
		});
		
		$("#searchBtn").click(function(){
			var space = $(".selectSearchItem.dropdown-item.active").data("fieldId");
			if(space == "-1"){
				//이전에 그룹/사용자 목록 hide한것이 있다면 모두 제거
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else if(space == "searchAuthGrpNm"){ //select
				//이전에 그룹/사용자 목록 hide한것이 있다면 모두 제거
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					//권한그룹 목록은 나타내기
					if(value.getAttribute("codenum")=='01'){
						$(this).removeClass("kt-hide");
						if($("#searchSelect").val() != "all"){
							//검색한 조건에 맞지 않는 목록은 숨기기
							if($("#searchSelect").val() != value.getAttribute("opt-index")){
								$(this).addClass("kt-hide")
							}else{
								$(this).removeClass("kt-hide");
							}
						}
					}else{ //사용자 목록은 감추기
						$(this).addClass("kt-hide");
					}
				});
			}else if(space == "searchUsrId") { //text - 사용자 id
				//검색어
				var txt = $("#subSearchData").val();
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					if(value.getAttribute("codenum")=="02" && value.getAttribute("codeid").indexOf(txt) > -1){
						$(this).removeClass("kt-hide");
					}else{
						$(this).addClass("kt-hide");
					}
				});
			}else{ //text - 사용자명
				//검색어
				var txt = $("#subSearchData").val();
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					if(value.getAttribute("codenum")=="02" && value.getAttribute("codenm").indexOf(txt) > -1){
						$(this).removeClass("kt-hide");
					}else{
						$(this).addClass("kt-hide");
					}
				});
			}
		});
		
		// 게시판 유형 변경 시 이벤트 발생
		$("#stmTypeCd").change(function(){
			// 첨부파일 용량 제한 placeholder 변경
			var typeCd = document.getElementById("stmTypeCd").value;
			
			// 자료실인 경우 최대 파일 용량(총 합) 4GB
			if(typeCd == '02')
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.storage"));
			}
			// 영상인 경우 최대 파일 용량(총 합) 2GB
			else if(typeCd == '04')
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.movie"));
			}
			else
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.normal"));
			}
		});
		
		 // 파일 첨부 옵션 체크박스가 클릭 될 때 이벤트 발생 
		$("#stmFileYnCd").click(function(){
			// 체크박스 on인경우 첨부파일 옵션 보이기
			if($("#stmFileYnCd").is(":checked")==true)
			{
				$("#stmFileOption").removeClass("kt-hide");
			}// 체크박스 off인경우 첨부파일 옵션 숨기기
			else
			{
				$("#stmFileOption").addClass("kt-hide");
			}
		});


		/*담당자 drag&drop sortable*/
		new Sortable($('#stmAdmList')[0], {
			group: {
				//그룹 이름
				name: 'stmAdmList',
	            //들어 올 수 있는  group의 name
	            put:['stmGroupUsrList']
	        },
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
 	        onMove:function(evt,originalEvent){
 				evt.related.setAttribute("codeadmin", "N");
 				
 				var UserAgent = navigator.userAgent;
				//모바일 일때 이동 중지
 				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
 					return false;
 				}else{
  					return true;
 				}
 			},
 	      	//해당 div로 이동될 대상의 동작(들어온)
 			onAdd:function(evt){
 				var moveDiv = $(evt.item);
				$(moveDiv).children('.osl-right-arrow-group').removeClass('osl-arrow-group--hide');
				$(moveDiv).children('.osl-left-arrow-group').addClass('osl-arrow-group--hide');
 				/*추가 동작은 이쪽에서 구현하시면 됩니다*/
				//들어온 아이템이 이미 담당자에 배정되어 있던 경우
				if(evt.item.getAttribute("codeadmin")=="Y"){
					//복사 중지
					evt.item.remove();
					//이미 배정되어 있다고 알림창 띄우기
					//$.osl.alert("이미 담당자에 배정되어 있습니다.");
				}else{
					//복사
					//담당자에게 배정
					evt.item.setAttribute("codeadmin", "Y");
					evt.clone.setAttribute("codeadmin", "Y");
					//$.osl.alert("담당자에 배정하였습니다.");
					//원본 아이템의 정보 확인
					if(evt.clone.getAttribute("codeadmin")=="Y" && evt.clone.getAttribute("codewriter")=="Y"){
						evt.clone.remove();
						var codeNum = evt.item.getAttribute("codenum");
						var codeId = evt.item.getAttribute("codeid");
						var codePrjGrpId = evt.item.getAttribute("codeprjgrpid");
						var codePrjId = evt.item.getAttribute("codeprjid");
						
						//글작성범위에 있는 동일 객체 정보 변경
						var otherItems = $("#stmWtList").children();
						$.each(otherItems, function(idx, value){
							if(value.getAttribute("codenum")==codeNum && value.getAttribute("codeid")==codeId
									&& value.getAttribute("codeprjgrpid")==codePrjGrpId && value.getAttribute("codeprjid")==codePrjId){
								value.setAttribute("codeadmin", "Y");
								value.setAttribute("codewriter", "Y");
							}
						});
					}
				}//else end
 			} 
	    });
		
		/*글 작성 범위 drag&drop sortable*/
		new Sortable($('#stmWtList')[0], {
			group: {
				//그룹 이름
				name: 'stmWtList',
	            //들어 올 수 있는  group의 name
	            put:['stmGroupUsrList']
	        },
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
 	        onMove:function(evt,originalEvent){
 				evt.related.setAttribute("codewriter", "N");
 				
 				var UserAgent = navigator.userAgent;
 				//모바일 일때 이동 중지
 				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
 					return false;
 				}else{
 					return true;
 				}
 			}, 
 	      	//해당 div로 이동될 대상의 동작(들어온)
 			 onAdd:function(evt){
  				var moveDiv = $(evt.item);
 				$(moveDiv).children('.osl-right-arrow-group').removeClass('osl-arrow-group--hide');
 				$(moveDiv).children('.osl-left-arrow-group').addClass('osl-arrow-group--hide');
				/*추가 동작은 이쪽에서 구현하시면 됩니다*/
				//들어온 아이템이 이미 글작성범위에 배정되어 있던 경우
				if(evt.item.getAttribute("codewriter")=="Y"){
					//복사 중지
					evt.item.remove();
					//이미 배정되어 있다고 알림창 띄우기
					//$.osl.alert("이미 글작성 범위에 배정되어 있습니다.");
				}else{
					//복사
					//담당자에게 배정
					evt.item.setAttribute("codewriter", "Y");
					evt.clone.setAttribute("codewriter", "Y");
					//$.osl.alert("글작성범위에 배정하였습니다.");
					//원본 아이템의 정보 확인
					if(evt.clone.getAttribute("codeadmin")=="Y" && evt.clone.getAttribute("codewriter")=="Y"){
						evt.clone.remove();
						var codeNum = evt.item.getAttribute("codenum");
						var codeId = evt.item.getAttribute("codeid");
						var codePrjGrpId = evt.item.getAttribute("codeprjgrpid");
						var codePrjId = evt.item.getAttribute("codeprjid");
						
						//담당자에 있는 동일 객체 정보 변경
						var otherItems = $("#stmAmdList").children();
						$.each(otherItems, function(idx, value){
							if(value.getAttribute("codenum")==codeNum && value.getAttribute("codeid")==codeId
									&& value.getAttribute("codeprjgrpid")==codePrjGrpId && value.getAttribute("codeprjid")==codePrjId){
								value.setAttribute("codeadmin", "Y");
								value.setAttribute("codewriter", "Y");
							}
						});
					}
				}//else end
 			} 
	    });
		
		/*미배정 drag&drop sortable*/
		new Sortable($('#stmGroupUsrList')[0], {
	        group: {
				//그룹 이름
	        	name: 'stmGroupUsrList',
	            //이동시 복사의 형태
	            pull: 'clone',
	            //들어 올 수 있는  group의 name
	            put:['stmWtList','stmAdmList']
	        },
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
 	        onMove:function(evt,originalEvent){
 				var UserAgent = navigator.userAgent;
 				//모바일 일때 이동 중지
 				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
 					return false;
				}else{
					return true;
				}
 			},
 	      	//해당 div로 이동될 대상의 동작(들어온)
 			onAdd:function(evt){
 				var moveDiv = $(evt.item);
				$(moveDiv).children('.osl-right-arrow-group').addClass('osl-arrow-group--hide');
				$(moveDiv).children('.osl-left-arrow-group').removeClass('osl-arrow-group--hide');
				/*추가 동작은 이쪽에서 구현하시면 됩니다*/
				//동일 객체가 있는지 확인
				var codeNum = evt.item.getAttribute("codenum");
				var codeId = evt.item.getAttribute("codeid");
				var codePrjGrpId = evt.item.getAttribute("codeprjgrpid");
				var codePrjId = evt.item.getAttribute("codeprjid");
				
				var otherItems = $("#stmGroupUsrList").children();
				$.each(otherItems, function(idx, value){
					//기존에 객체 있는지 확인
					if(value.getAttribute("codenum")==codeNum && value.getAttribute("codeid")==codeId
							&& value.getAttribute("codeprjgrpid")==codePrjGrpId && value.getAttribute("codeprjid")==codePrjId){
						//있으면 복사안함, 기존 객체 정보 수정
						evt.item.remove();
						//어디서 들어왔는지 확인
						if($(evt.from).attr("id")=="stmAdmList"){
							//담당자 목록에서 들어온 경우
							value.setAttribute("codeadmin", "N");
						}else{
							value.setAttribute("codewriter", "N");
							//stmWtList 글작성 범위에서 들어온 경우
						}
					}else{
						//없다가 들어온 객체
						//어디서 들어왔는지 확인
						//다른 확정 리스트에서 정보 수정
						if($(evt.from).attr("id")=="stmAdmList"){
							//담당자 목록에서 들어온 경우
							//글작성 범위 리스트에 남아있는 동일 객체 정보 수정
							evt.item.setAttribute("codeadmin", "N");
							$.each($("#stmWtList").children(), function(index, items){
								if(items.getAttribute("codenum")==codeNum && items.getAttribute("codeid")==codeId
										&& items.getAttribute("codeprjgrpid")==codePrjGrpId && items.getAttribute("codeprjid")==codePrjId){
									items.setAttribute("codeadmin", "N");
								}
							});
						}else{
							evt.item.setAttribute("codewriter", "N");
							//stmWtList 글작성 범위에서 들어온 경우
							//담당자 리스트에 남아있는 동일 객체 정보 수정
							$.each($("#stmAdmList").children(), function(index, items){
								if(items.getAttribute("codenum")==codeNum && items.getAttribute("codeid")==codeId
										&& items.getAttribute("codeprjgrpid")==codePrjGrpId && items.getAttribute("codeprjid")==codePrjId){
									items.setAttribute("codewriter", "N");
								}
							});
						}
					}//else end
				});
 			} 
	    });
		
		// 담당자 목록과 동일하게 적용하기 위한 검색 버튼 클릭 시 이벤트 발생
		$("#equalBtn").click(function(){
 			// 담당자 목록 가져오기
 			var keepList = addJsonList("stmAdmList",true);
 			$("#stmAdmList").empty();
			$("#stmWtList").empty();
			setGrpAndUsrList(keepList, keepList);
		});
		
		//담당자_초기화 버튼 클릭 시
		$("#reset_admin").click(function(){
			//글작성 범위 목록 리스트
			var keepList = addJsonList("stmWtList",false);
			$("#stmAdmList").empty();
			$("#stmWtList").empty();
			setGrpAndUsrList(oriAdmin, keepList);
		});
		
		//글작성범위_초기화 버튼 클릭 시
		$("#reset_wt").click(function(){
			//글작성 범위 목록 리스트
			var keepList = addJsonList("stmAdmList",true);
			$("#stmAdmList").empty();
			$("#stmWtList").empty();
			setGrpAndUsrList(keepList, oriWriter);
		});
		
		// 수정완료 버튼 클릭 될 때 이벤트 발생 
		$("#stm2101SaveSubmit").click(function(){
			// 첨부파일 기능 사용할 경우에만 폼 유효값 체크
			if($("#stmFileYnCd").is(":checked")==true){
				 
				// form validate 주입
				var formValidate = $.osl.validate(formId);
				
				//폼 유효 값 체크
	    		if (!$("#"+formId).valid()) {
	    			return;
	    		}
			}
			submitBadOption();
		});
	};
	
	/**
	* function 명 	: selectBadInfo
	* function 설명	: 게시판 정보를 조회하여 팝업에 세팅한다.
	*/
    var selectBadInfo = function(){
	
		var data = {"menuId" : $("#menuId").val()};
		
		//AJAX 설정
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadInfoAjax.do'/>", "async": false}
				, data);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var info = data.badInfo;
				
				// 공통코드 해당 데이터 선택으로 세팅
				$("#stmTypeCd").attr("data-osl-value", info.stmTypeCd);
				$("#stmDsTypeCd").attr("data-osl-value", info.stmDsTypeCd);
				
		    	// adm2001 팝업 공통코드 select 세팅
				var commonCodeArr = [
					{mstCd: "STM00001", useYn: "Y", targetObj: "#stmTypeCd", comboType:"OS"}, // 게시판 유형 공통코드 가져오기
					{mstCd: "STM00002", useYn: "Y", targetObj: "#stmDsTypeCd", comboType:"OS"}, 	// 게시물 공개 범위 공통코드 가져오기
				];
		  		//공통코드 채우기
				$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
				
				// 게시판 명, 옵션 세팅
				// 게시판 명
				$("#stmNm").attr("value", info.stmNm);

				// 옵션 - 공지사항 사용
				if(info.stmNtcYnCd == "01")
				{
					$("#stmNtcYnCd").attr("checked", true);
				}else{
					$("#stmNtcYnCd").attr("checked", false);
				}
				// 옵션 - 댓글 사용
				if(info.stmCmtYnCd == "01")
				{
					$("#stmCmtYnCd").attr("checked", true);
				}else{
					$("#stmCmtYnCd").attr("checked", false);
				}
				// 옵션 - 비밀글 사용
				if(info.stmPwYnCd == "01")
				{
					$("#stmPwYnCd").attr("checked", true);
				}else{
					$("#stmPwYnCd").attr("checked", false);
				}
				// 옵션 - 태그 사용
				if(info.stmTagYnCd == "01")
				{
					$("#stmTagYnCd").attr("checked", true);
				}else{
					$("#stmTagYnCd").attr("checked", false);
				}
				// 게시판 유형에 따라 파일첨부 최대용량 라벨 변경
				// 첨부파일 용량 제한 placeholder 변경
				var typeCd = document.getElementById("stmTypeCd").value;
				// 자료실인 경우 최대 파일 용량(총 합) 4GB
				if(typeCd == '02')
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.storage"));
				}
				// 영상인 경우 최대 파일 용량(총 합) 2GB
				else if(typeCd == '04')
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.movie"));
				}
				else
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.normal"));
				}
				// 옵션 - 파일 첨부 사용
				if(info.stmFileCnt > 0)
				{
					$("#stmFileYnCd").attr("checked", true);
					//파일 첨부 사용 시 첨부파일 개수 및 용량 제한 입력 div 보이기
					$("#stmFileOption").removeClass("kt-hide");
					// 옵션 - 첨부파일 개수
					$("#stmFileCnt").attr("value", info.stmFileCnt);
					// 옵션 - 첨부파일 용량 제한
					$("#stmFileStrg").attr("value", info.stmFileStrg);
				}else{
					//파일 첨부 사용 시 첨부파일 개수 및 용량 제한 입력 div 보이기
					$("#stmFileOption").addClass("kt-hide");
				}
				
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
    }
	
	/**
	* function 명 	: selectBadChargerList
	* function 설명	: 게시판 담당자 정보를 조회하여 팝업에 세팅한다.
	*/
    var selectBadChargerList = function(){
		var data = {"menuId" : $("#menuId").val()};
		
		//AJAX 설정
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadChargerListAjax.do'/>", "async": false}
				, data);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var info = data.badChargerList;
				//ori 정보 가지고 있기
				oriAdmin = info;
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
    }
	
	/**
	* function 명 	: selectBadWriterList
	* function 설명	: 게시판 글 작성자 범위 정보를 조회하여 팝업에 세팅한다.
	*/
    var selectBadWriterList = function(){
		var data = {"menuId" : $("#menuId").val()};
		
		//AJAX 설정
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadWriterListAjax.do'/>", "async": false}
				, data);
		
  		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var info = data.badWriterList;
				
				//ori 정보 가지고 있기
				oriWriter = info;
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
    }
	
    /**
	* function 명 	: setGrpAndUsrList
	* function 설명	: 전체 권한그룹 및 사용자 정보 가져와 미배정 리스트에 출력
	*/
    var setGrpAndUsrList = function(adminData, writerData){
		var allList = [];
		
		// 모든 목록 가져오기
		// 검색할 메뉴 id
    	var data = {
				"menuId" : $("#menuId").val(),
				"stmDsTypeCd" : $("#paramStmDsTypeCd").val(),
				};
		//AJAX 설정
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadGrpAndUsrListAjax.do'/>"}
				, data);
		
  		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{

				var infoGrp = data.badGrpList;
				var infoUsr = data.badUsrList;
				
				var listHtml = "";
				
				//상단의 select 박스 option 넣기
				$("#searchSelect").html("");
				//select에 목록 추가
				var innerHtml = "<option value='all'>전체</option>";
				$("#searchSelect").append(innerHtml);
				$.each(infoGrp, function(idx, val){
					//select에 목록 추가
					var innerHtml = "<option value='"+idx+"' data-prj-id='"+val.prjId+"' data-prj-grp-id='"+val.prjGrpId+"'>"+$.osl.escapeHtml(val.authGrpNm)+" ("+$.osl.escapeHtml(val.prjNm)+")</option>";
					$("#searchSelect").append(innerHtml);
				});
				
				//불러온 전체 항목 중 담당자, 글작성자 범위 모두에 있는 항목은 제외
				//해당 div, 담당자 : stmAdmList 글작성범위 : stmWtList 미배정 : stmGroupUsrList
				// infoGrp에 있는건 authGrpId, authGrpNm
				// infoUsr에 있는건 usrId, usrNm, usrImgId, deptNm
				//DB에 담당자가 지정되어있지 않은 경우
				
				//처음 담당자 등록하는 경우 담당자가 비어 있을 때
				if(oriAdmin.length==0){
					//현재 사용자를 담당자로 지정
					var dataOne={};
					dataOne.codeNum = '02';
					dataOne.id = $.osl.user.userInfo.usrId;
					dataOne.name = $.osl.user.userInfo.usrNm;
					dataOne.prjGrpId = $.osl.selPrjGrpId;
					dataOne.prjId = $.osl.selPrjId;
					dataOne.ImgId = $.osl.user.userInfo.usrImgId;
					dataOne.deptNm = $.osl.user.userInfo.deptName;
					dataOne.admin = 'Y';
					dataOne.writer = 'N';
					
					oriAdmin.push(dataOne);
				}

				//전체 권한그룹
				$.each(infoGrp, function(index, value){
					var passKey_admin = false;
					var passKey_writer = false;

					//담당자 리스트로부터 중복되는 항목이 있는지 확인
					$.each(adminData, function(idx, items){
						if(value.authGrpId != null && value.authGrpId != "" && value.prjId != null && value.prjId != ""){
							if((value.authGrpId==items.stmAdminId || value.authGrpId==items.id) && value.prjId == items.prjId){
								passKey_admin = true;
							}
						}
					});
					//글작성 범위 리스트로부터 중복되는 항목이 있는지 확인
					$.each(writerData, function(idx, items){
						if(value.authGrpId != null && value.authGrpId != "" && value.prjId != null && value.prjId != ""){
							if((value.authGrpId==items.stmWtId || value.authGrpId==items.id) && value.prjId == items.prjId){
								passKey_writer = true;
							}
						}
					});
					
					var pushData = {};
					pushData.codeNum = '01';
					pushData.id = value.authGrpId;
					pushData.prjGrpId = value.prjGrpId;
					pushData.prjId = value.prjId;
					pushData.managerPrjNm = $.osl.escapeHtml(value.prjNm);
					pushData.name = $.osl.escapeHtml(value.authGrpNm);
					pushData.ImgId = "";
					pushData.deptNm = "";
					
					//담당자 값이 존재하면
					if(passKey_admin == true){
						pushData.admin = 'Y';
					}else // 존재하지 않으면
					{
						pushData.admin = 'N';
					}
					//글작성범위 값이 존재하면
					if(passKey_writer == true){
						pushData.writer = 'Y';
					}else // 존재하지 않으면
					{
						pushData.writer = 'N';
					}
					allList.push(pushData);
				});
				//전체 사용자
				$.each(infoUsr, function(index, value){
					var passKey_admin = false;
					var passKey_writer = false;
					
					//담당자 리스트로부터 중복되는 항목이 있는지 확인
					$.each(adminData, function(idx, items){
						if(value.usrId != null && value.usrId != ""){
							if(value.usrId==items.stmAdminId|| value.usrId==items.id ){
								passKey_admin = true;
							}
						}
					});
					//글작성 범위 리스트로부터 중복되는 항목이 있는지 확인
					$.each(writerData, function(idx, items){
						if(value.usrId != null && value.usrId != ""){
							if(value.usrId==items.stmWtId|| value.usrId==items.id ){
								passKey_writer = true;
							}
						}
					});
					
					var pushData = {};
					pushData.codeNum = '02';
					pushData.id = value.usrId;
					pushData.prjGrpId = "";
					pushData.prjId = "";
					pushData.managerPrjNm = "";
					pushData.name = value.usrNm;
					pushData.ImgId = value.usrImgId;
					pushData.deptNm = $.osl.escapeHtml(value.deptNm);
					
					//담당자 값이 존재하면
					if(passKey_admin == true){
						pushData.admin = 'Y';
					}else // 존재하지 않으면
					{
						pushData.admin = 'N';
					}
					//글작성범위 값이 존재하면
					if(passKey_writer == true){
						pushData.writer = 'Y';
					}else // 존재하지 않으면
					{
						pushData.writer = 'N';
					}
					allList.push(pushData);
				});
				// 그리기
				drawList(allList, "stmAdmList", "stmWtList", "stmGroupUsrList");
			}
		});
  	
		//AJAX 전송
		ajaxObj.send();
	}
	
	/**
	* function 명 	: addJsonList
	* function 설명	: 선택한 담당자/글작성범위 리스트를 전달한다.
	* param : elemId 가져올 리스트 div id(#제외)
	* param : defaultCheck 넘길 리스트가 null일 때 현재 사용자 정보 넣을지 확인(필요 true, 필요 없음false)
	*/
    var addJsonList = function(elemId, defaultCheck){
		var targetId = '#' + elemId;
		var dataList = [];

		var divList = $(targetId).children();
		
		$.each(divList, function(index, value){
			var dataOne = {};
			dataOne.codeNum = value.getAttribute("codenum");
			dataOne.id = value.getAttribute("codeId");
			dataOne.prjId = value.getAttribute("codeprjid");
			dataOne.name = value.getAttribute("codenm");
			dataOne.ImgId = value.getAttribute("codeimg");
			dataOne.deptNm = value.getAttribute("codedept");
			dataOne.prjGrpId = value.getAttribute("codeprjgrpid");
			dataOne.managerPrjNm = value.getAttribute("codeprjnm");
			dataOne.admin = value.getAttribute("codeadmin");
			dataOne.writer = value.getAttribute("codewriter");
			dataList.push(dataOne);
		});
		
		
		//DB에 담당자가 지정되어있지 않은 경우
		//처음 담당자 등록하는 경우
		if(defaultCheck==true && dataList.length==0){
			//현재 사용자를 담당자로 지정
			var dataOne={};
			dataOne.codeNum = '02';
			dataOne.id = $.osl.user.userInfo.usrId;
			dataOne.name = $.osl.user.userInfo.usrNm;
			dataOne.prjGrpId = $.osl.selPrjGrpId;
			dataOne.prjId = $.osl.selPrjId;
			dataOne.ImgId = $.osl.user.userInfo.usrImgId;
			dataOne.deptNm = $.osl.user.userInfo.deptName;
			dataOne.admin = "Y";
			
			dataList.push(dataOne);
		}
		
		return dataList;
    }

	/**
     * function 명 : drawList
     * function param : 출력 데이터 정보, 그릴 element Id(#제외), 담당자/글작성범위 목록에 그릴 것인지 확인(true, false)
     * function 설명 : 지정 element에 데이터 목록 div 출력
     */
     var drawList = function(setData, adminElemId, writerElemId, otherElemId){
 		var listHtml_left = ""; //왼쪽 아이콘 보이도록
 		var listHtml_right = ""; //오른쪽 아이콘 보이도록
 		var listHtml_com = ""; //공통
 		var listHtml = ""; //최종
 		var num = 0;
 		
 		//초기화
 		$("#"+adminElemId).empty();
 		$("#"+writerElemId).empty();
 		$("#"+otherElemId).empty();
 		
 		$.each(setData, function(index, value){
 			num++;
 			//전체 틀 시작
 			//왼쪽 아이콘 보이기, 오른쪽 아이콘 보이기
 			listHtml_left = "<div class='card kt-margin-b-10 flex-flow--row flex-flow--row--reverse' opt-index='"+index+"' codeNum='"+value.codeNum+"' codeId='"+value.id+"' codeNm='"+$.osl.escapeHtml(value.name)+"' codeDept='"+$.osl.escapeHtml(value.deptNm)+"' codeImg='"+value.ImgId+"' codeprjid='"+value.prjId+"' codeprjgrpid='"+value.prjGrpId+"'  codeprjnm='"+$.osl.escapeHtml(value.managerPrjNm)+"' codeAdmin='"+value.admin+"' codeWriter='"+value.writer+"'>"
 								+"<div class='dropdown osl-left-arrow-group'>";
			listHtml_right = "<div class='card kt-margin-b-10 flex-flow--row flex-flow--row--reverse' opt-index='"+index+"' codeNum='"+value.codeNum+"' codeId='"+value.id+"' codeNm='"+$.osl.escapeHtml(value.name)+"' codeDept='"+$.osl.escapeHtml(value.deptNm)+"' codeImg='"+value.ImgId+"' codeprjid='"+value.prjId+"' codeprjgrpid='"+value.prjGrpId+"'  codeprjnm='"+$.osl.escapeHtml(value.managerPrjNm)+"' codeAdmin='"+value.admin+"' codeWriter='"+value.writer+"'>"
								+"<div class='dropdown osl-left-arrow-group osl-arrow-group--hide'>";
			//공통	
			listHtml_com = "<div class='btn dropdown-toggle' id='dropdownMenuButton"+num+"' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"
 									
 								+"</div>"		
 								+"<div class='dropdown-menu osl-dropdown-menu--position' aria-labelledby='dropdownMenuButton"+num+"'>"
 									+"<a class='dropdown-item stmAdmListMovebtn'>"+$.osl.lang("stm2101.label.admin")+"</a>"
 									+"<a class='dropdown-item stmWtListMovebtn'>"+$.osl.lang("stm2101.label.writer")+"</a>"
 								+"</div>"
 							+"</div>"
 							// 컨텐츠 전체영역 시작
 							+"<div class='osl-content-group'>"
 								//타이틀 시작			
 								+"<div class='card-title left-user-group kt-margin-b-0'>";
 			
 			//담당자, 글작성 범위에 모두 들어간 항목인 경우
 			if(value.admin=="Y" && value.writer=="Y"){
 				//담당자 리스트, 글작성 범위 리스트에만 작성
 				listHtml = listHtml_right + listHtml_com;
 				//담당자 리스트 그리기
				//확정 권한그룹
 				if(value.codeNum=='01'){
 					listHtml += "<span class='groupuser-icon'>"
 									+"<i class='fas fa-user-tag'></i>"
 								+"</span>"
 								+$.osl.escapeHtml(value.name)
 								+"<span class='badge badge-success osl-margin-left--auto'>"+$.osl.lang("stm2101.label.authGrp")+"</span>"
 							+"</div>"
 							//타이틀 종료							
 							//내용 시작
 							+"<div class='osl-card__prjnm'>"
 								+$.osl.escapeHtml(value.managerPrjNm)
 							+"</div>";
 							//내용 종료
 				}
 				//확정 사용자
 				else{	
 				    var paramData = {
 							html: "<span class='osl-user-card-flex'><span>"+value.name +"</span><span>("+value.id+")</span></span>",
 		    				imgSize: "sm",
 							class:{
 								cardBtn: "osl-bad__fit-content",
 							}
 						};
 				    
 				  listHtml += "<div class='' data-openid='"+value.id+"'>"
 										+ $.osl.user.usrImgSet(value.ImgId, paramData )
 								+"</div>"
 								+"<span class='badge badge-info osl-margin-left--auto'>"+$.osl.lang("stm2101.label.user")+"</span>"
 							+"</div>";
 							//타이틀 종료
 					//소속 시작
 					if(value.deptNm == null){
 						listHtml += "<div class=''>-</div>";
 					}
 					else{
 						listHtml += "<div class='osl-card__prjnm'>"
 										+$.osl.escapeHtml(value.deptNm)
 									+"</div>";
 					}
 					//소속 종료
 				}
 				// 컨텐츠 전체영역 종료
				listHtml += "</div>"
					//우측 이동 버튼 시작, 종료
					+"<div class='osl-right-arrow-group'></div>"
					+"</div>";
				//전체 틀 종료
 				$("#"+adminElemId).append(listHtml);
 				$("#"+writerElemId).append(listHtml);
 			}else{
 				//한군데만 들어가거나 안들어간 항목인 경우
 				//담당자에 배정된 항목인 경우(글작성 범위 미배정)
 				listHtml = listHtml_right + listHtml_com;
				//담당자 리스트 그리기
 				if(value.admin=="Y" && value.writer=="N"){
 					//확정 권한그룹
 	 				if(value.codeNum=='01'){
 	 					listHtml += "<span class='groupuser-icon'>"
 	 									+"<i class='fas fa-user-tag'></i>"
 	 								+"</span>"
 	 								+$.osl.escapeHtml(value.name)
 	 								+"<span class='badge badge-success osl-margin-left--auto'>"+$.osl.lang("stm2101.label.authGrp")+"</span>"
 	 							+"</div>"
 	 							//타이틀 종료							
 	 							//내용 시작
 	 							+"<div class='osl-card__prjnm'>"
 	 								+$.osl.escapeHtml(value.managerPrjNm)
 	 							+"</div>";
 	 							//내용 종료
 	 				}
 	 				//확정 사용자
 	 				else{	
 	 				    var paramData = {
 	 							html: "<span class='osl-user-card-flex'><span>"+value.name +"</span><span>("+value.id+")</span></span>",
 	 		    				imgSize: "sm",
 	 							class:{
 	 								cardBtn: "osl-bad__fit-content",
 	 							}
 	 						};
 	 				    
 	 				  listHtml += "<div class='' data-openid='"+value.id+"'>"
 	 										+ $.osl.user.usrImgSet(value.ImgId, paramData )
 	 								+ "</div>"
 	 								+ "<span class='badge badge-info osl-margin-left--auto'>"+$.osl.lang("stm2101.label.user")+"</span>"
 	 							+ "</div>";
 	 							//타이틀 종료
 	 					//소속 시작
 	 					if(value.deptNm == null){
 	 						listHtm += "<div class=''>-</div>";
 	 					}
 	 					else{
 	 						listHtml += "<div class='osl-card__prjnm'>"
 	 										+ $.osl.escapeHtml(value.deptNm)
 	 									+ "</div>";
 	 					}
 	 					//소속 종료
 	 				}
 	 				// 컨텐츠 전체영역 종료
 					listHtml+="</div>"
 						//우측 이동 버튼 시작, 종료
 						+"<div class='osl-right-arrow-group'></div>"
 						+"</div>";
 					//전체 틀 종료
 	 				$("#"+adminElemId).append(listHtml);
 				}else if(value.admin=="N" && value.writer=="Y"){
	 				//글작성 범위에 배정된 항목인 경우(담당자 미배정)
 					listHtml = listHtml_right + listHtml_com;
 					//글작성 범위 리스트 그리기
 					if(value.codeNum=='01'){
 						listHtml += "<span class='groupuser-icon'>"
 	 									+"<i class='fas fa-user-tag'></i>"
 	 								+"</span>"
 	 								+$.osl.escapeHtml(value.name)
 	 								+"<span class='badge badge-success osl-margin-left--auto'>"+$.osl.lang("stm2101.label.authGrp")+"</span>"
 	 							+"</div>"
 	 							//타이틀 종료							
 	 							//내용 시작
 	 							+"<div class='osl-card__prjnm'>"
 	 								+$.osl.escapeHtml(value.managerPrjNm)
 	 							+"</div>";
 	 							//내용 종료
 	 				}
 	 				//확정 사용자
 	 				else{	
 	 				    var paramData = {
 	 							html: "<span class='osl-user-card-flex'><span>"+value.name +"</span><span>("+value.id+")</span></span>",
 	 		    				imgSize: "sm",
 	 							class:{
 	 								cardBtn: "osl-bad__fit-content",
 	 							}
 	 						};
 	 				    
 	 				  listHtml += "<div class='' data-openid='"+value.id+"'>"
 	 										+ $.osl.user.usrImgSet(value.ImgId, paramData )
 	 								+"</div>"+
 	 								+"<span class='badge badge-info osl-margin-left--auto'>"+$.osl.lang("stm2101.label.user")+"</span>"
 	 							+"</div>";
 	 							//타이틀 종료
 	 					//소속 시작
 	 					if(value.deptNm == null){
 	 						listHtml += "<div class=''>-</div>";
 	 					}
 	 					else{
 	 						listHtml += "<div class='osl-card__prjnm'>"
 	 										+ $.osl.escapeHtml(value.deptNm)
 	 									+"</div>";
 	 					}
 	 					//소속 종료
 	 				}
 	 				// 컨텐츠 전체영역 종료
 					listHtml +="</div>"
 						//우측 이동 버튼 시작, 종료
 						+"<div class='osl-right-arrow-group'></div>"
 						+"</div>";
 					//전체 틀 종료
 	 				$("#"+writerElemId).append(listHtml);
 				}
 				
 				//공통 : 미배정 리스트에 그리기
 				//미배정 권한그룹
 				listHtml = listHtml_left + listHtml_com;
 				if(value.codeNum=='01'){
 					listHtml += "<span class='groupuser-icon'>"
 									+"<i class='fas fa-user-tag'></i>"
 								+"</span>"
 								+$.osl.escapeHtml(value.name)
 								+"<span class='badge badge-success osl-margin-left--auto'>"+$.osl.lang("stm2101.label.authGrp")+"</span>"
 							+"</div>"
 							//타이틀 종료
 							//내용 시작
 							+"<div class='osl-card__prjnm'>"
 								+$.osl.escapeHtml(value.managerPrjNm)
 							+"</div>";
 							//내용 종료"
 				//미배정 사용자
 				}else{
 				    var paramData = {
 							html: "<span class='osl-user-card-flex'><span>"+value.name +"</span><span>("+value.id+")</span></span>",
 				    		imgSize: "sm",
 							class:{
 								cardBtn: "osl-bad__fit-content",
 							}
 						};
 				    
 					listHtml += "<div class='' data-openid='"+value.id+"'>"
 									+$.osl.user.usrImgSet(value.ImgId, paramData)
 								+"</div>"
 								+"<span class='badge badge-info osl-margin-left--auto'>"+$.osl.lang("stm2101.label.user")+"</span>"
 							+"</div>";
 							//타이틀 종료
 					//소속 시작
 					if(value.deptNm == null){
 						listHtml += "<div class='osl-card__prjnm'>-</div>";
 					}else{
 						listHtml += "<div class='osl-card__prjnm'>"
 										+ $.osl.escapeHtml(value.deptNm)
 									+"</div>";
 					}
 					//소속 종료
 				}
 				// 컨텐츠 전체영역 종료
				listHtml += "</div>"
 						//우측 이동 버튼 시작, 종료
 						+"<div class='osl-right-arrow-group osl-arrow-group--hide'></div>"
					+"</div>";
 				//전체 틀 종료
 				$("#"+otherElemId).append(listHtml);
 			}
 		});
 		
 		//그리고 난 후에 function 적용
 		//사용자 아이콘 클릭 시 사용자 정보 팝업
		$(".kt-user-card-v2.btn.osl-bad__fit-content").click(function(){
			var usrId = $(this).parent().data("openid");
			$.osl.user.usrInfoPopup(usrId);
		});
		
		$('.osl-right-arrow-group').click(function(){
			//이동할 객체
			var moveCard =  $(this).parent();
			//객체가 있던 곳
			var formId = moveCard.parent().attr("id");

			//담당자 목록에 있던 경우
			if(formId=="stmAdmList"){
				//속성 변경
				moveCard[0].setAttribute("codeadmin", "N");
				//글작성 범위에도 있는 경우
				if(moveCard[0].getAttribute("codewriter")=="Y"){
					var codeNum = moveCard[0].getAttribute("codenum");
					var codeId = moveCard[0].getAttribute("codeid");
					var codePrjGrpId = moveCard[0].getAttribute("codeprjgrpid");
					var codePrjId = moveCard[0].getAttribute("codeprjid");
					
					//글작성범위에 있는 동일 객체 정보 변경
					var otherItems = $("#stmWtList").children();
					$.each(otherItems, function(idx, value){
						if(value.getAttribute("codenum")==codeNum && value.getAttribute("codeid")==codeId
								&& value.getAttribute("codeprjgrpid")==codePrjGrpId && value.getAttribute("codeprjid")==codePrjId){
							value.setAttribute("codeadmin", "N");
						}
					});
				}
			}else{
				//글작성자 목록에 있던 경우
				//속성 변경
				moveCard[0].setAttribute("codewriter", "N");
				//담당자 범위에도 있는 경우
				if(moveCard[0].getAttribute("codeadmin")=="Y"){
					var codeNum = moveCard[0].getAttribute("codenum");
					var codeId = moveCard[0].getAttribute("codeid");
					var codePrjGrpId = moveCard[0].getAttribute("codeprjgrpid");
					var codePrjId = moveCard[0].getAttribute("codeprjid");
					
					//글작성범위에 있는 동일 객체 정보 변경
					var otherItems = $("#stmAdminList").children();
					$.each(otherItems, function(idx, value){
						if(value.getAttribute("codenum")==codeNum && value.getAttribute("codeid")==codeId
								&& value.getAttribute("codeprjgrpid")==codePrjGrpId && value.getAttribute("codeprjid")==codePrjId){
							value.setAttribute("codewriter", "N");
						}
					});
				}
			}//else end
			
			//미배정 목록에 있는지 확인
			var otherItems = $("#stmGroupUsrList").children();
			var result = true;
			$.each(otherItems, function(idx, value){
				if(value.getAttribute("codenum")==codeNum && value.getAttribute("codeid")==codeId
						&& value.getAttribute("codeprjgrpid")==codePrjGrpId && value.getAttribute("codeprjid")==codePrjId){
					//미배정 목록에 같은 객체 있는 경우
					//담당자 정보만 변경
					if(formId=="stmAdmList"){
						value.setAttribute("codeadmin", "N");
					}else{
						//글작성 범위 정보만 변경
						value.setAttribute("codewriter", "N");
					}
					//미배정 목록에 있으면 복사 안함
					result = false;
				}
			});
			
			//미배정 목록에 있으면 복사 안함, 미배정 목록에 없을 때만 복사
			if(result){
				//미배정 목록에 없을 경우
				//객체이동
				$('#stmGroupUsrList').prepend(moveCard);
				//아이콘 오른방향 감추기, 왼방향 나타내기
				$(this).addClass('osl-arrow-group--hide');
				$(this).parent().children('.osl-left-arrow-group').removeClass('osl-arrow-group--hide');
				
			}
		});
		
		$('.stmAdmListMovebtn').click(function(){
			//드롭다운 버튼 감추기
			$(this).parent().removeClass("show");
			//원 객체
			var oriCard = $(this).parent().parent().parent();
			//이동할 객체
			var moveCard = oriCard.clone(true);
			//속성 변경
			moveCard[0].setAttribute("codeadmin", "Y");
			oriCard[0].setAttribute("codeadmin", "Y");
			
			//이미 담당자에게 배정이 되어 있는지 확인
			var toList = $("#stmAdmList").children();
			var toListResult = true;
			$.each(toList, function(idx, value){
				if(value.getAttribute("codenum")==moveCard[0].getAttribute("codenum") && value.getAttribute("codeid")==moveCard[0].getAttribute("codeid")
						&& value.getAttribute("codeprjgrpid")==moveCard[0].getAttribute("codeprjgrpid") && value.getAttribute("codeprjid")==moveCard[0].getAttribute("codeprjid")){
					toListResult = false;							
				}
			});
			//담당자에게 배정이 되어 있지 않은 경우에만 실행
			if(toListResult){
				//객체 복사
				$('#stmAdmList').prepend(moveCard);
				//아이콘 오른방향 나타내기, 왼방향 감추기
				moveCard.children('.osl-right-arrow-group').removeClass('osl-arrow-group--hide');
				moveCard.children(".osl-left-arrow-group").addClass('osl-arrow-group--hide');

				//$.osl.alert("담당자에 배정하였습니다.");
				
				//원본 아이템의 정보 확인
				if(oriCard[0].getAttribute("codeadmin")=="Y" && oriCard[0].getAttribute("codewriter")=="Y"){
					var codeNum = oriCard[0].getAttribute("codenum");
					var codeId = oriCard[0].getAttribute("codeid");
					var codePrjGrpId = oriCard[0].getAttribute("codeprjgrpid");
					var codePrjId = oriCard[0].getAttribute("codeprjid");
					
					//글작성범위에 있는 동일 객체 정보 변경
					var otherItems = $("#stmWtList").children();
					$.each(otherItems, function(idx, value){
						if(value.getAttribute("codenum")==codeNum && value.getAttribute("codeid")==codeId
								&& value.getAttribute("codeprjgrpid")==codePrjGrpId && value.getAttribute("codeprjid")==codePrjId){
							value.setAttribute("codeadmin", "Y");
							value.setAttribute("codewriter", "Y");
						}
					});
					
					//미배정에 있던 객체 제거
					oriCard.remove();
				}
			}
		});
		$('.stmWtListMovebtn').click(function(){
			//드롭다운 버튼 감추기
			$(this).parent().removeClass("show");
			//원 객체
			var oriCard = $(this).parent().parent().parent();
			//이동할 객체
			var moveCard = oriCard.clone(true);
			//속성 변경
			moveCard[0].setAttribute("codewriter", "Y");
			oriCard[0].setAttribute("codewriter", "Y");
			
			//글작성 범위에 이미 등록이 되어 있는 객체인지 확인
			var toList = $("#stmWtList").children();
			var toListResult = true;
			$.each(toList, function(idx, value){
				if(value.getAttribute("codenum")==moveCard[0].getAttribute("codenum") && value.getAttribute("codeid")==moveCard[0].getAttribute("codeid")
						&& value.getAttribute("codeprjgrpid")==moveCard[0].getAttribute("codeprjgrpid") && value.getAttribute("codeprjid")==moveCard[0].getAttribute("codeprjid")){
					toListResult = false;							
				}
			});
			//글작성 범위에게 배정이 되어 있지 않은 경우에만 실행
			if(toListResult){
				//객체 복사
				$('#stmWtList').prepend(moveCard);
				//아이콘 오른방향 나타내기, 왼방향 감추기
				moveCard.children('.osl-right-arrow-group').removeClass('osl-arrow-group--hide');
				moveCard.children(".osl-left-arrow-group").addClass('osl-arrow-group--hide');

				//$.osl.alert("글작성 범위에 배정하였습니다.");

				//원본 아이템의 정보 확인
				if(oriCard[0].getAttribute("codeadmin")=="Y" && oriCard[0].getAttribute("codewriter")=="Y"){
					var codeNum = oriCard[0].getAttribute("codenum");
					var codeId = oriCard[0].getAttribute("codeid");
					var codePrjGrpId = oriCard[0].getAttribute("codeprjgrpid");
					var codePrjId = oriCard[0].getAttribute("codeprjid");
					
					//담당자에 있는 동일 객체 정보 변경
					var otherItems = $("#stmAdmList").children();
					$.each(otherItems, function(idx, value){
						if(value.getAttribute("codenum")==codeNum && value.getAttribute("codeid")==codeId
								&& value.getAttribute("codeprjgrpid")==codePrjGrpId && value.getAttribute("codeprjid")==codePrjId){
							value.setAttribute("codeadmin", "Y");
							value.setAttribute("codewriter", "Y");
						}
					});
					
					oriCard.remove();
				}
			}
		});
     }
	
    /**
	* function 명 	: submitBadOption
	* function 설명	: 게시판 속성 정보 수정 완료
	*/
    var submitBadOption = function(){
		//넘길 데이터 정리
		//게시판 id
		var menuId = $("#menuId").val();
		//게시판 유형
		var stmTypeCd = $("#stmTypeCd").val();
		//게시판 담당자
		var stmAdmList = JSON.stringify(addJsonList("stmAdmList", true));
		//게시판 글 작성 범위
		var stmWtList = JSON.stringify(addJsonList("stmWtList", false));
		//게시물 공개 범위
		var stmDsTypeCd = $("#stmDsTypeCd").val();
		
		//옵션
		var stmNtcYnCd = "02";
		var stmCmtYnCd = "02";
		var stmPwYnCd = "02";
		var stmTagYnCd = "02";
		var stmFileYnCd = "02";
		
		if($("#stmNtcYnCd").is(":checked")==true)
		{
			stmNtcYnCd = "01";
		}
		if($("#stmCmtYnCd").is(":checked")==true)
		{
			stmCmtYnCd = "01";
		}
		if($("#stmPwYnCd").is(":checked")==true)
		{
			stmPwYnCd = "01";
		}
		if($("#stmTagYnCd").is(":checked")==true)
		{
			stmTagYnCd = "01";
		}
		if($("#stmFileYnCd").is(":checked")==true)
		{
			stmFileYnCd = "01";
		}

		var stmFileCnt = $("#stmFileCnt").val();
		var stmFileStrg = $("#stmFileStrg").val();
		
		//첨부파일을 사용하면
		if(stmFileYnCd == "01"){
			//입력한 파일 갯수가 0이하일 때
			if(stmFileCnt <= 0)
			{
				//첨부파일 갯수를 0 이하로 설정한 경우
				//첨부파일 갯수를 1로 자동 변경
				stmFileCnt = 1;
				$("#stmFileCnt").val(1);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileCntMessage"));
				return false;
			}
			else if(stmFileCnt > 10)
			{
				//첨부파일 갯수가 10개를 넘어가는지 확인
				$("#stmFileCnt").val(10);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxCntMessage"), {type:'error'});
				return false;
			}
			
			//게시판 유형 최대 용량 파일을 넘기면 최대 값으로 수정
			var defaultStrg = 0;
			//최대용량을 0 이하로 한 경우 defalult로 지정
			if(stmFileStrg <= 0)
			{
				//첨부파일 용량은 default로 지정
				//자료실인 경우 최대 파일 용량(총합) 4GB
				if(stmTypeCd == "02")
				{
					defaultStrg = 4096;
				}
				// 영상인 경우 최대 파일 용량(총 합) 2GB
				else if(stmTypeCd == "04")
				{
					defaultStrg = 2048;
				}
				// 그 외 500MB
				else
				{
					defaultStrg = 500;
				}
				$("#stmFileStrg").val(defaultStrg);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgMessage"));
				return false;
			}
			//첨부파일 용량이 존재 할 경우
			else
			{
				//게시판 유형에 따라 파일 용량 최대 검사
				//최대 용량을 넘길 때만 최대 용량 값으로 변경
				//자료실인 경우 최대 파일 용량(총합) 4GB
				if(stmTypeCd == '02')
				{
					defaultStrg = 4096;
					if(stmFileStrg > defaultStrg)
					{
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
						$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "4GB"));
						return false;
					}
				}
				// 영상인 경우 최대 파일 용량(총 합) 2GB
				else if(stmTypeCd == '04')
				{
					defaultStrg = 2048;
					if(stmFileStrg > defaultStrg)
					{
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
						$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "2GB"));
						return false;
					}
				}
				// 그 외 500MB
				else
				{
					defaultStrg = 500;
					if(stmFileStrg > defaultStrg)
					{
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
						$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "500MB"));
						return false;
					}
				}
			}
		}
		else
		{
			$("#stmFileCnt").val(0);
			$("#stmFileStrg").val(0);
			stmFileCnt = 0;
			stmFileStrg = 0;
		}

		$.osl.confirm($.osl.lang("stm2101.update"),null,function(result){
			if(result.value){
				//AJAX 설정
				var data = {
						"menuId" : menuId ,
						"stmTypeCd" : stmTypeCd ,
						"stmAdmList" : stmAdmList ,
						"stmWtList" : stmWtList ,
						"stmDsTypeCd" : stmDsTypeCd ,
						"stmNtcYnCd" : stmNtcYnCd ,
						"stmCmtYnCd" : stmCmtYnCd ,
						"stmPwYnCd" : stmPwYnCd ,
						"stmTagYnCd" : stmTagYnCd ,
						"stmFileCnt" : stmFileCnt ,
						"stmFileStrg" : stmFileStrg * (1024*1024),
					};

				var ajaxObj = new $.osl.ajaxRequestAction(
						{"url":"<c:url value='/stm/stm2000/stm2100/updateStm2100BadTypeAjax.do'/>"}
						, data);
				
		  		//AJAX 전송 성공 함수
				ajaxObj.setFnSuccess(function(data){
					if(data.errorYn == "Y"){
						$.osl.alert(data.message,{type: 'error'});
						//모달 창 닫기
						$.osl.layerPopupClose();
					}else{
						$.osl.toastr(data.message,{type: 'success'});
						//모달 창 닫기
						$.osl.layerPopupClose();
						
						//datatable 조회
		   				$("button[data-datatable-id=stm2100StmTable][data-datatable-action=select]").click();
					}
				});
				
				//AJAX 전송
				ajaxObj.send();
			};
		});
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        },
    };
}();

$.osl.ready(function(){
	 OSLStm2101Popup.init();
});

 </script>
<!-- end script -->