<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
				<c:if test="${param.stmTypeCd eq '01' }">
					<i class="la la-newspaper-o kt-margin-r-5"></i>[일반]
				</c:if>
				<c:if test="${param.stmTypeCd eq '02' }">
					<i class="la la-server kt-margin-r-5"></i>[자료실]
				</c:if>
				<c:if test="${param.stmTypeCd eq '03' }">
					<i class="la la-image kt-margin-r-5"></i>[갤러리]
				</c:if>
				<c:if test="${param.stmTypeCd eq '04' }">
					<i class="la la-youtube-play kt-margin-r-5"></i>[영상]
				</c:if>
				<c:out value="${param.stmNm }"/>
			</h3>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<form class="kt-form" id="stm2101Info">
			<input type="hidden" id="menuId" name="menuId" value="${param.menuId }"/>
			<input type="hidden" id="paramStmDsTypeCd" name="paramStmDsTypeCd" value="${param.stmDsTypeCd }"/>
			<div class="row">
				<div class="col-6">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>게시판 명</label>
						<input type="text" class="form-control" name="stmNm" id="stmNm" disabled="disabled">
					</div>
				</div>		
				<div class="col-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>유형</label>
						<select class="form-control kt-select2" name="stmTypeCd" id="stmTypeCd">
						</select>
					</div>
				</div>		
			</div>
			<div class="row">
				<div class="col-12">
					<div class="form-group">
						<div class="kt-margin-b-10">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>담당자</label>
							<span style="float: right;">
								<input type="button" class="btn btn-outline-success btn-sm" id="notUpdateBtn_admin" name=""notUpdateBtn_admin"" value="수정취소"/>
								<input type="button" class="btn btn-brand btn-sm" id="updateBtn_admin" name="updateBtn_admin" value="수정"/>
							</span>
						</div>
						<div class="kt-list ps--active-y form-control kt-padding-t-10 kt-padding-b-10" id="stmAdmList" name="stmAdmList" style="height: 120px; overflow: auto;">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="form-group">
						<div class="kt-margin-b-10">
							<label><i class="fa fa-edit kt-margin-r-5"></i>글 작성 범위</label>
							<span style="float: right;">
								<input type="button" class="btn btn-outline-success btn-sm" id="equalBtn" name="equalBtn" value="담당자 동일"/>
								<input type="button" class="btn btn-outline-success btn-sm" id="notUpdateBtn_wt" name="notUpdateBtn_wt" value="수정취소"/>
								<input type="button" class="btn btn-brand btn-sm" id="updateBtn_wt" name="updateBtn_wt" value="수정"/>
							</span>
						</div>
						<div class="kt-list ps--active-y form-control kt-padding-t-10 kt-padding-b-10" id="stmWtList" name="stmWtList" style="height: 120px; overflow: auto;">
						</div>
					</div>
				</div>
			</div>
			<div class="row" >
				<div class="col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>게시물 공개 범위</label>
						<select class="form-control kt-select2" name="stmDsTypeCd" id="stmDsTypeCd">
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<label><i class="fa fa-edit kt-margin-r-5"></i>옵션</label>
				</div>
				<div class="row col-12 kt-padding-l-30">
					<div class="col-4"><label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="stmNtcYnCd" id="stmNtcYnCd"> 공지사항 사용<span></span></label></div>
					<div class="col-4"><label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="stmCmtYnCd" id="stmCmtYnCd"> 댓글 사용<span></span></label></div>
					<div class="col-4"><label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="stmPwYnCd" id="stmPwYnCd"> 비밀글 사용<span></span></label></div>
				</div>
				<div class="row col-12 kt-padding-l-30">
					<div class="col-4"><label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="stmTagYnCd" id="stmTagYnCd"> 태그 사용<span></span></label></div>
					<div class="col-4"><label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox"  name="stmFileYnCd" id="stmFileYnCd"> 파일첨부 사용<span></span></label></div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="form-group row kt-margin-t-20 kt-hide" id="stmFileOption" name="stmFileOption">
						<div class="col-5">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>첨부파일 개수</label>
							<input type="text" class="form-control" name="stmFileCnt" id="stmFileCnt" autocomplete="off" regexstr="^0$|^[1-9]{1}$|^10$" maxlength="2" placeholder="최대 10개 파일" regexalert="최대 숫자 10" required />
							<span class="kt-padding-5" style="font-size: 0.5rem; font-style: italic; color: gray; text-align: end; float: right;">최대 개수 : 10</span>
						</div>
						<div class="col-7">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>첨부파일 용량 제한(MB)</label>
							<input type="text" class="form-control" name="stmFileStrg" id="stmFileStrg" autocomplete="off" regexstr="^0$|^[1-9]{1}[0-9]*$" maxlength="10" regexalert="숫자만 가능" required />
							<span class="kt-padding-5" style="font-size: 0.5rem; font-style: italic; color: gray; text-align: end; float: right;">최대 용량 : [자료실] 4GB(4096MB) [영상] 2GB(2048MB) [일반/갤러리] 500MB</span>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-brand" id="stm2101SaveSubmit">수정 완료</button>
		<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
	</div>
</div>
<!-- begin page script -->
<script>
 "use strict";
 
 var OSLStm2101Popup = function(){
	var formId="stm2101Info";
	 
	// form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//담당자/글작성 범위 목록 되돌리기를 위한 변수 선언
	var oriAdmin = [];
	var oriWriter = [];
	
	// 기본 설정
	var documentSetting = function(){
  		
    	//해당 게시판 정보 가져오기
    	selectBadInfo(); // 게시판 속성
    	selectBadChargerList(); // 게시판 담당자
    	selectBadWriterList(); // 게시판 글 작성 범위
    	
		// 게시판 유형 변경 시 이벤트 발생
		$("#stmTypeCd").change(function(){
			// 첨부파일 용량 제한 placeholder 변경
			var typeCd = document.getElementById("stmTypeCd").value;
			
			// 자료실인 경우 최대 파일 용량(총 합) 4GB
			if(typeCd == '02')
			{
				$("#stmFileStrg").attr('placeholder', '최대 4096MB');
			}
			// 영상인 경우 최대 파일 용량(총 합) 2GB
			else if(typeCd == '04')
			{
				$("#stmFileStrg").attr('placeholder', '최대 2048MB');
			}
			else
			{
				$("#stmFileStrg").attr('placeholder', '최대 500MB');
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
		 
		 // 담당자 등록을 위한 수정 버튼 클릭 시 이벤트 발생
		$("#updateBtn_admin").click(function(){
			callUserSettingPopup("admin");
		});
		 
		// 글 작성 범위 등록을 위한 수정 버튼 클릭 시 이벤트 발생
		$("#updateBtn_wt").click(function(){
			callUserSettingPopup("writer");
		});
		
		// 담당자 목록과 동일하게 적용하기 위한 검색 버튼 클릭 시 이벤트 발생
		$("#equalBtn").click(function(){
			// 담당자 목록 가져오기
			var dataList = JSON.stringify(sendManagerList("stmAdmList", false, true, true));
			
			// 그대로 뿌리기
			$("#stmWtList").empty();
        	drawList(JSON.parse(dataList), "stmWtList", false, true);
		});
		
		//담당자_수정취소 버튼 클릭 시
		$("#notUpdateBtn_admin").click(function(){
			// 그대로 뿌리기
			$("#stmAdmList").empty();
			if(oriAdmin != null && oriAdmin != ""){
	        	drawList(JSON.parse(oriAdmin), "stmAdmList", false, true);
			}
		});
		//글작성범위_수정취소 버튼 클릭 시
		$("#notUpdateBtn_wt").click(function(){
			// 그대로 뿌리기
			$("#stmWtList").empty();
			if(oriWriter != null && oriWriter != ""){
	        	drawList(JSON.parse(oriWriter), "stmWtList", false, true);
			}
		});
		
		//사용자 아이콘 클릭 시
		$(document).on("click", ".openid", function(){
				var usrId = $(this).data("openid");
				$.osl.user.usrInfoPopup(usrId);
		});
		
		// 수정완료 버튼 클릭 될 때 이벤트 발생 
		$("#stm2101SaveSubmit").click(function(){
			// 첨부파일 기능 사용할 경우에만 폼 유효값 체크
			if($("#stmFileYnCd").is(":checked")==true){
				var form = $('#'+formId);    		
	        	
	    		//폼 유효 값 체크
	    		if (!form.valid()) {
	    			return;
	    		}
			}
			// 사용 안할 땐 알아서 0으로 세팅    		
			//동작
// 			$.osl.confirm($.osl.lang("stm2101.update"),null,function(result){
// 				if(result.value){
					submitBadOption();
// 				}
// 			});
		});
	};

	/**
	* function 명 	: sendManagerList
	* function 설명	: 선택한 담당자/글작성범위 리스트를 전달한다.
	* param : elemId 가져올 리스트 div id(#제외)
	* param : divisionCheck div안에 _auth, _user로 구분되어 있는지 확인(true, false)
	* param : passCheck 데이터 넘길 때 num, id외 필요한지 확인(필요 true, 필요 없음false)
	* param : defaultCheck 넘길 리스트가 null일 때 현재 사용자 정보 넣을지 확인(필요 true, 필요 없음false)
	*/
    var sendManagerList = function(elemId, divisionCheck, passCheck, defaultCheck){
		var targetId = '#' + elemId;
		var dataList = [];

		// 전달할 리스트 만들기
		if(divisionCheck==true)
		{
			var divList = $(targetId+"_auth").children('div');
			
			$.each(divList, function(index, value){
				var dataOne = {};
				dataOne.managerNum = value.getAttribute("codenum");
				dataOne.managerId = value.getAttribute("codeid");
				dataOne.managerPrjId = value.getAttribute("codeprjid");
				if(passCheck==true)
				{
					dataOne.managerNm = value.getAttribute("codenm");
					dataOne.managerImg = value.getAttribute("codeimg");
					dataOne.managerDept = value.getAttribute("codedept");
					dataOne.managerPrjGrpId = value.getAttribute("codeprjgrpid");
					dataOne.managerPrjNm = value.getAttribute("codeprjnm");
				}
				dataList.push(dataOne);
			});

			divList = $(targetId+"_user").children('div');

			$.each(divList, function(index, value){
				var dataOne = {};
				dataOne.managerNum = value.getAttribute("codenum");
				dataOne.managerId = value.getAttribute("codeId");
				dataOne.managerPrjId = value.getAttribute("codeprjid");
				if(passCheck==true)
				{
					dataOne.managerNm = value.getAttribute("codenm");
					dataOne.managerImg = value.getAttribute("codeimg");
					dataOne.managerDept = value.getAttribute("codedept");
					dataOne.managerPrjGrpId = value.getAttribute("codeprjgrpid");
					dataOne.managerPrjNm = value.getAttribute("codeprjnm");
				}
				dataList.push(dataOne);
			});
		}
		else
		{
			var divList = $(targetId).children('div');
			
			$.each(divList, function(index, value){
				var dataOne = {};
				dataOne.managerNum = value.getAttribute("codenum");
				dataOne.managerId = value.getAttribute("codeId");
				dataOne.managerPrjId = value.getAttribute("codeprjid");
				if(passCheck==true)
				{
					dataOne.managerNm = value.getAttribute("codenm");
					dataOne.managerImg = value.getAttribute("codeimg");
					dataOne.managerDept = value.getAttribute("codedept");
					dataOne.managerPrjGrpId = value.getAttribute("codeprjgrpid");
					dataOne.managerPrjNm = value.getAttribute("codeprjnm");
				}
				dataList.push(dataOne);
			});
		}
		
		//DB에 담당자가 지정되어있지 않은 경우
		//처음 담당자 등록하는 경우
		if(defaultCheck==true && dataList.length==0){
			//현재 사용자를 담당자로 지정
			var dataOne={};
			dataOne.managerNum = '1';
			dataOne.managerId = $.osl.user.userInfo.usrId;
			dataOne.managerNm = $.osl.user.userInfo.usrNm;
			dataOne.managerPrjGrpId = $.osl.selPrjGrpId;
			dataOne.managerPrjId = $.osl.selPrjId;
			dataOne.managerImg = $.osl.user.userInfo.usrImgId;
			dataOne.managerDept = $.osl.user.userInfo.deptName;
			
			dataList.push(dataOne);
		}
		
		return dataList;
    }
	
	/**
	* function 명 	: callUserSettingPopup
	* function 설명	: 게시판 담당자/글작성범위 목록 지정을 위한 팝업 호출
	*/
	var callUserSettingPopup = function(opt){		

		//담당자
		if(opt == 'admin')
		{
			var data = {
					menuId : $("#menuId").val(),
					typeString : "admin",
					stmDsTypeCd : $("#paramStmDsTypeCd").val(),
					dataList : JSON.stringify(sendManagerList("stmAdmList", false, true, true)),
				};
			var options = {
					idKey: "sub_"+$("#menuId").val(),
					modalTitle: "담당자 지정",
					closeConfirm: false,
					callback:[{
						targetId: "stm2102SaveSubmit",
						actionFn: function(thisObj){
							var temp = OSLStm2102Popup.getDataList();
							if(temp != null && temp.length != 0){
								OSLStm2101Popup.setManager(temp, data.typeString);
							}
						}
					}]
				};
		}
		//글 작성 범위
		else
		{
			var data = {
					menuId : $("#menuId").val(),
					typeString : "writer",
					stmDsTypeCd : $("#paramStmDsTypeCd").val(),
					dataList : JSON.stringify(sendManagerList("stmWtList", false, true, false)),
				};
			var options = {
					idKey: "sub_"+$("#menuId").val(),
					modalTitle: "글 작성 범위 지정",
					closeConfirm: false,
					callback:[{
						targetId: "stm2102SaveSubmit",
						actionFn: function(thisObj){
							var temp = OSLStm2102Popup.getDataList();
							OSLStm2101Popup.setManager(temp, data.typeString);
						}
					}]
				};
		}
		$.osl.layerPopupOpen('/stm/stm2000/stm2100/selectStm2102BadUsrListView.do',data,options);
	}
	
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
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadChargerListAjax.do'/>"}
				, data);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var info = data.badChargerList;
				
				var listHtml = "";
				
				$("#stmAdmList").empty();
				$.each(info, function(index, value){
					if(value.stmAdminCd == "01")
					{
						listHtml = "<div class='kt-list__item kt-padding-t-0 kt-padding-b-5' codeNum='"+value.stmAdminCd+"' codeId='"+value.stmAdminId+"' codeNm='"+value.authGrpNm+"' codeDept='' codeImg='' codePrjGrpId = '"+value.prjGrpId+"' codePrjId='"+value.prjId+"' codePrjNm='"+value.prjNm+"'>";
						listHtml += "<div class='col-12'><i class='fa flaticon-users-1 kt-icon-xl kt-margin-l-10 kt-margin-r-10'></i>";
						listHtml += value.authGrpNm +" ("+value.prjNm+")</div>";
					}else{
						listHtml = "<div class='kt-list__item kt-padding-t-0 kt-padding-b-5' codeNum='"+value.stmAdminCd+"' codeId='"+value.stmAdminId+"' codeNm='"+value.usrNm+"' codeDept='"+value.deptNm+"' codeImg='"+value.usrImgId+"' codePrjGrpId= ' codePrjId='' codePrjNm=''>";
						listHtml += "<div class='col-4 openid' data-openid='"+value.stmAdminId+"'>"+$.osl.user.usrImgSet(value.usrImgId, value.usrNm)+"</div>";
						if(value.deptNm == null)
						{
							listHtml += "<div class='col-7'></div>";
						}
						else
						{
							listHtml += "<div class='col-7'>"+value.deptNm+"</div>";
						}
					}
					listHtml += "</div>";
					
					$("#stmAdmList").append(listHtml);
				});
				
				//ori 정보 가지고 있기
				oriAdmin = JSON.stringify(sendManagerList("stmAdmList", false, true, true));
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
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadWriterListAjax.do'/>"}
				, data);
		
  		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var info = data.badWriterList;
				
				var listHtml = "";
				
				$("#stmWtList").empty();
				$.each(info, function(index, value){
					if(value.stmWtCd == "01")
					{
						listHtml = "<div class='kt-list__item kt-padding-t-0 kt-padding-b-5' codeNum='"+value.stmWtCd+"' codeId='"+value.stmWtId+"' codeNm='"+$.osl.escapeHtml(value.authGrpNm)+"' codeDept='' codeImg=''  codePrjGrpId = '"+$.osl.escapeHtml(value.prjGrpId)+"' codePrjId='"+value.prjId+"' codePrjNm='"+$.osl.escapeHtml(value.prjNm)+"'>";
						listHtml += "<div class='col-12'><i class='fa flaticon-users-1 kt-icon-xl kt-margin-l-10 kt-margin-r-10'></i>";
						listHtml += $.osl.escapeHtml(value.authGrpNm) +" ("+$.osl.escapeHtml(value.prjNm)+")</div>";
					}else{
						listHtml = "<div class='kt-list__item kt-padding-t-0 kt-padding-b-5' codeNum='"+value.stmWtCd+"' codeId='"+value.stmWtId+"' codeNm='"+$.osl.escapeHtml(value.usrNm)+"' codeDept='"+$.osl.escapeHtml(value.deptNm)+"' codeImg='"+value.usrImgId+"'codePrjGrpId= ' codePrjId='' codePrjNm=''>";
						listHtml += "<div class='col-4 openid' data-openid='"+value.stmWtId+"'>"+$.osl.user.usrImgSet(value.usrImgId, value.usrNm)+"</div>";
						if(value.deptNm == null)
						{
							listHtml += "<div class='col-7'></div>";
						}
						else
						{
							listHtml += "<div class='col-7'>"+$.osl.escapeHtml(value.deptNm)+"</div>";
						}
					}
					listHtml += "</div>";
					
					$("#stmWtList").append(listHtml);
				});
				
				//ori 정보 가지고 있기
				oriWriter = JSON.stringify(sendManagerList("stmWtList", false, true, false));
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
    }
	
    /**
	* function 명 : drawList
	* function 설명 : 지정 element에 데이터 출력(kt-list__item)
	* param : setData 출력 데이터 정보
	* param : elemId 그릴 element Id(#제외)
    * param : managerCheck 통합 목록 중 권한그룹과 사용자 목록 나눠 그릴 것인지 확인(true, false)
	*/
	var drawList = function(setData, elemId, managerCheck){
		var formId = '#' + elemId;
		
		var listHtml = "";
		
		$.each(setData, function(index, value){
			listHtml = "<div class='kt-list__item kt-padding-t-0 kt-padding-b-5' codeNum='"+value.managerNum+"' codeId='"+value.managerId+"' codeNm='"+$.osl.escapeHtml(value.managerNm)+"' codeDept='"+$.osl.escapeHtml(value.managerDept)+"' codeImg='"+value.managerImg+"' codePrjGrpId='"+value.managerPrjGrpId+"' codePrjId='"+value.managerPrjId+"' codePrjNm='"+$.osl.escapeHtml(value.managerPrjNm)+"'>";
			
			if(managerCheck == true)
			{
				if(value.managerNum=="01")
				{
					listHtml += "<div class='col-8'><i class='fa flaticon-users-1 kt-icon-xl kt-margin-l-10 kt-margin-r-10'></i>";
					listHtml += $.osl.escapeHtml(value.managerNm) + "(" +$.osl.escapeHtml(value.managerPrjNm) + ")</div>";
					listHtml += "</div>";
					
					$(formId+"_auth").append(listHtml);
				}
				else
				{
					listHtml += "<div class='col-4 openid' data-openid='"+value.managerId+"'>"+$.osl.user.usrImgSet(value.managerImg, $.osl.escapeHtml(value.managerNm))+"</div>";
					if($.osl.escapeHtml(value.managerDept) == null || $.osl.escapeHtml(value.managerDept)=="")
					{
						listHtml += "<div class='col-7'></div>";
					}
					else
					{
						listHtml += "<div class='col-7'>"+$.osl.escapeHtml(value.managerDept)+"</div>";
					}
					
					listHtml += "</div>";

					$(formId+"_user").append(listHtml);
				}
			}
			else
			{
				if(value.managerNum=="01")
				{
					listHtml += "<div class='col-8'><i class='fa flaticon-users-1 kt-icon-xl kt-margin-l-10 kt-margin-r-10'></i>";
					listHtml += $.osl.escapeHtml(value.managerNm) + "(" +$.osl.escapeHtml(value.managerPrjNm) + ")</div>";
				}
				else
				{
					listHtml += "<div class='col-4 openid' data-openid='"+value.managerId+"'>"+$.osl.user.usrImgSet(value.managerImg, $.osl.escapeHtml(value.managerNm))+"</div>";
					if($.osl.escapeHtml(value.managerDept) == null || $.osl.escapeHtml(value.managerDept) == "" || $.osl.escapeHtml(value.managerDept) == "null")
					{
						listHtml += "<div class='col-7'></div>";
					}
					else
					{
						listHtml += "<div class='col-7'>"+$.osl.escapeHtml(value.managerDept)+"</div>";
					}
					
				}
				listHtml += "</div>";
				
				$(formId).append(listHtml);
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
		var stmAdmList = JSON.stringify(sendManagerList("stmAdmList", false, false, true));
		//게시판 글 작성 범위
		var stmWtList = JSON.stringify(sendManagerList("stmWtList", false, false, false));
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

		var stmFileCnt = 0;
		var stmFileStrg = 0;
		
		if(stmFileYnCd == "01"){
			if(stmFileCnt <= 0)
			{
				//첨부파일 갯수를 0 이하로 설정한 경우
				//첨부파일 갯수를 1로 자동 변경
				stmFileCnt = 1;
			}
			else if(stmFileCnt > 10)
			{
				//첨부파일 갯수가 10개를 넘어가는지 확인
				//$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxCntMessage"), {type:'error'});
				$("#stmFileCnt").val(10);
			}
			
			//게시판 유형 최대 용량 파일을 넘기면 최대 값으로 수정
			var defaultStrg = 0;
			
			if(stmFileStrg <= 0)
			{
				//$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgMessage"));
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
						//$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "4GB"));
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
					}
				}
				// 영상인 경우 최대 파일 용량(총 합) 2GB
				else if(stmTypeCd == '04')
				{
					defaultStrg = 2048;
					if(stmFileStrg > defaultStrg)
					{
						//$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "2GB"));
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
					}
				}
				// 그 외 500MB
				else
				{
					defaultStrg = 500;
					if(stmFileStrg > defaultStrg)
					{
						//$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "500MB"));
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
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
        setManager: function(temp, typeString){
        	//세부 팝업에서 받은 temp를 가져와 담당자/글작성 목록을 세팅
        	if(typeString == "admin")
       		{
        		$("#stmAdmList").empty();
	        	drawList(JSON.parse(temp), "stmAdmList", false);
       		}
        	else
       		{
        		$("#stmWtList").empty();
	        	drawList(JSON.parse(temp), "stmWtList", false);
       		}
        }
    };
}();

$.osl.ready(function(){
	 OSLStm2101Popup.init();
});

 </script>
<!-- end script -->