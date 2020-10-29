<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http:

<form class="kt-form" id="stm2101Info" autocomplete="off" >
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
				<div class="row kt-margin-t-20" id="stmFileOption" name="stmFileOption">
					<div class="col-5 form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>첨부파일 개수</label>
						<input type="text" class="form-control" name="stmFileCnt" id="stmFileCnt" regexstr="^0$|^[1-9]{1}$|^10$" maxlength="2" placeholder="최대 10개 파일" regexalert="최대 숫자 10" required />
						<span class="kt-padding-5" style="font-size: 0.5rem; font-style: italic; color: gray; text-align: end; float: right;">최대 개수 : 10</span>
					</div>
					<div class="col-7 form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>첨부파일 용량 제한(MB)</label>
						<input type="text" class="form-control" name="stmFileStrg" id="stmFileStrg" regexstr="^0$|^[1-9]{1}[0-9]*$" maxlength="10" placeholder="최대 용량(합)"  regexalert="숫자만 가능" required />
						<span class="kt-padding-5" style="font-size: 0.5rem; font-style: italic; color: gray; text-align: end; float: right;" name="stmFileStrgStr" id="stmFileStrgStr">최대 용량 : [자료실] 4GB(4096MB) [영상] 2GB(2048MB) [일반/갤러리] 500MB</span>
					</div>
			</div>
		</div>
		
		<!-- 테스트용 -->
		<div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0" name="selectSearchBtn" id="selectSearchBtn">전체</button>
					<div class="dropdown-menu">
						<a class="selectSearchItem dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
						<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchAuthGrpNm" data-opt-type="select">권한그룹명</a>
						<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrId" data-opt-type="text">사용자ID</a>
						<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrNm" data-opt-type="text">사용자명</a>
					</div>
				</div>
				<select class="kt-select2 form-control kt-hide" id="searchSelect" name="searchSelect" aria-hidden="true">
				</select>
				<input type="text" class="form-control" disabled="disabled" name="subSearchData" id="subSearchData">
				<div class="input-group-prepend">
					<button class="btn btn-brand" type="button" name="searchBtn" id="searchBtn">
						<span class=""><span>검색</span></span>
					</button>
				</div>
			</div>
		</div>
		<div id="stmGroupUsrList">
		</div>
		<!-- 테스트용 끝 -->
		
		<div class="modal-footer">
			<button type="button" class="btn btn-brand" id="stm2101SaveSubmit">수정 완료</button>
			<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
		</div>
	</div>
</form>
<!-- begin page script -->
<script>
 "use strict";
 
 var OSLStm2101Popup = function(){
	var formId="stm2101Info";
	
	
	var oriAdmin = [];
	var oriWriter = [];
	
	
	var documentSetting = function(){
  		
    	
    	selectBadInfo(); 
    	selectBadChargerList(); 
    	selectBadWriterList(); 
    	setGrpAndUsrList(); 
    	
    	
		$("#searchSelect~span").addClass("osl-datatable-search--hide");
		
		
		$(".selectSearchItem").click(function(){
			$(".selectSearchItem").removeClass("active");
			$(this).addClass("active");
			$("#selectSearchBtn").text($(this).text());
			
			
			
			$("#manager_auth").removeClass("kt-hide");
			$("#manager_user").removeClass("kt-hide");
			$.each($("#groupList").children("div"), function(idx, value){
				$(this).removeClass("kt-hide");
			});
			$.each($("#userList").children("div"), function(idx, value){
				$(this).removeClass("kt-hide");
			});

			
			if($(this).data("opt-type")=="all"){
				
				$("#searchSelect").addClass("kt-hide");
				$("#searchSelect~span").addClass("osl-datatable-search--hide");
				
				$("#subSearchData").removeClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", true);
				
				$("#searchBtn").click();
			 }else if($(this).data("opt-type")=="select"){
				
				$("#searchSelect").removeClass("kt-hide");
				$("#searchSelect~span").removeClass("osl-datatable-search--hide");
				
				$("#subSearchData").addClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", true);
			 }else{
				
				$("#searchSelect").addClass("kt-hide");
				$("#searchSelect~span").addClass("osl-datatable-search--hide");
				
				$("#subSearchData").removeClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", false);
			 }
		});
		
		
		$("#searchSelect").change(function(){
			console.log("권한그룹 선택 이벤트")
		});
		
		
		$("#subSearchData").on("propertychange paste input", function(){
			$("#searchBtn").click();
		});
		
		
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
			}else if(space == "searchAuthGrpNm"){ 
			}else if(space == "searchUsrId"){ 
			}else{ 
			}
		});
    	
		
		$("#stmTypeCd").change(function(){
			
			var typeCd = document.getElementById("stmTypeCd").value;
			
			
			if(typeCd == '02')
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.storage"));
			}
			
			else if(typeCd == '04')
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.movie"));
			}
			else
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.normal"));
			}
		});
		
		 
		$("#stmFileYnCd").click(function(){
			
			if($("#stmFileYnCd").is(":checked")==true)
			{
				$("#stmFileOption").removeClass("kt-hide");
			}
			else
			{
				$("#stmFileOption").addClass("kt-hide");
			}
		});
		 
		 
		$("#updateBtn_admin").click(function(){
			callUserSettingPopup("admin");
		});
		 
		
		$("#updateBtn_wt").click(function(){
			callUserSettingPopup("writer");
		});
		
		
		$("#equalBtn").click(function(){
			
			var dataList = JSON.stringify(sendManagerList("stmAdmList", false, true, true));
			
			
			$("#stmWtList").empty();
        	drawList(JSON.parse(dataList), "stmWtList", false, true);
		});
		
		
		$("#notUpdateBtn_admin").click(function(){
			
			$("#stmAdmList").empty();
			if(oriAdmin != null && oriAdmin != ""){
	        	drawList(JSON.parse(oriAdmin), "stmAdmList", false, true);
			}
		});
		
		$("#notUpdateBtn_wt").click(function(){
			
			$("#stmWtList").empty();
			if(oriWriter != null && oriWriter != ""){
	        	drawList(JSON.parse(oriWriter), "stmWtList", false, true);
			}
		});
		
		
		$(document).on("click", ".openid", function(){
				var usrId = $(this).data("openid");
				$.osl.user.usrInfoPopup(usrId);
		});
		
		
		$("#stm2101SaveSubmit").click(function(){
			
			if($("#stmFileYnCd").is(":checked")==true){
				 
				
				var formValidate = $.osl.validate(formId);
				console.log(formValidate);
				
				
	    		if (!$("#"+formId).valid()) {
	    			return;
	    		}
			}
			submitBadOption();
		});
	};

	
    var sendManagerList = function(elemId, divisionCheck, passCheck, defaultCheck){
		var targetId = '#' + elemId;
		var dataList = [];

		
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
		
		
		
		if(defaultCheck==true && dataList.length==0){
			
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
	
	
    var addJsonList = function(elemId, defaultCheck){
		var targetId = '#' + elemId;
		var dataList = [];

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
		
		
		
		if(defaultCheck==true && dataList.length==0){
			
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
	
	
	var callUserSettingPopup = function(opt){		

		
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
					modalTitle: $.osl.lang("stm2101.title.admin"),
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
					modalTitle: $.osl.lang("stm2101.title.writer"),
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
	
	
    var selectBadInfo = function(){
	
		var data = {"menuId" : $("#menuId").val()};
		
		
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadInfoAjax.do'/>", "async": false}
				, data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var info = data.badInfo;
				
				
				$("#stmTypeCd").attr("data-osl-value", info.stmTypeCd);
				$("#stmDsTypeCd").attr("data-osl-value", info.stmDsTypeCd);
				
		    	
				var commonCodeArr = [
					{mstCd: "STM00001", useYn: "Y", targetObj: "#stmTypeCd", comboType:"OS"}, 
					{mstCd: "STM00002", useYn: "Y", targetObj: "#stmDsTypeCd", comboType:"OS"}, 	
				];
		  		
				$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
				
				
				
				$("#stmNm").attr("value", info.stmNm);

				
				if(info.stmNtcYnCd == "01")
				{
					$("#stmNtcYnCd").attr("checked", true);
				}else{
					$("#stmNtcYnCd").attr("checked", false);
				}
				
				if(info.stmCmtYnCd == "01")
				{
					$("#stmCmtYnCd").attr("checked", true);
				}else{
					$("#stmCmtYnCd").attr("checked", false);
				}
				
				if(info.stmPwYnCd == "01")
				{
					$("#stmPwYnCd").attr("checked", true);
				}else{
					$("#stmPwYnCd").attr("checked", false);
				}
				
				if(info.stmTagYnCd == "01")
				{
					$("#stmTagYnCd").attr("checked", true);
				}else{
					$("#stmTagYnCd").attr("checked", false);
				}
				
				
				var typeCd = document.getElementById("stmTypeCd").value;
				
				if(typeCd == '02')
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.storage"));
				}
				
				else if(typeCd == '04')
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.movie"));
				}
				else
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.normal"));
				}
				
				if(info.stmFileCnt > 0)
				{
					$("#stmFileYnCd").attr("checked", true);
					
					$("#stmFileOption").removeClass("kt-hide");
					
					$("#stmFileCnt").attr("value", info.stmFileCnt);
					
					$("#stmFileStrg").attr("value", info.stmFileStrg);
				}else{
					
					$("#stmFileOption").addClass("kt-hide");
				}
				
			}
		});
		
		
		ajaxObj.send();
    }
	
	
    var selectBadChargerList = function(){
	
		var data = {"menuId" : $("#menuId").val()};
		
		
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadChargerListAjax.do'/>"}
				, data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var info = data.badChargerList;
				$.each(info, function(index, value){
					if(value.stmAdminCd == "01"){
						value.managerNum = '01';
						value.managerId = value.authGrpId;
						value.managerPrjGrpId = value.prjGrpId;
						value.managerPrjId = value.prjId;
						value.managerPrjNm = $.osl.escapeHtml(value.prjNm);
						value.managerNm = $.osl.escapeHtml(value.authGrpNm);
						value.managerImg = "";
						value.managerDept = "";
						value.managerAdmin="Y";
					}else{
						value.managerNum = '02';
						value.managerId = value.authGrpId;
						value.managerPrjGrpId = value.prjGrpId;
						value.managerPrjId = value.prjId;
						value.managerPrjNm = $.osl.escapeHtml(value.prjNm);
						value.managerNm = $.osl.escapeHtml(value.authGrpNm);
						value.managerImg = "";
						value.managerDept = "";
						value.managerAdmin="Y";
					}
				});

				
				drawList(info, "stmAdmList", false);
				
				oriAdmin = JSON.stringify(sendManagerList("stmAdmList", false, true, true));
			}
		});
		
		
		ajaxObj.send();
    }
	
	
    var selectBadWriterList = function(){
	
		var data = {"menuId" : $("#menuId").val()};
		
		
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadWriterListAjax.do'/>"}
				, data);
		
  		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var info = data.badWriterList;
				
				$.each(info, function(index, value){
					if(value.stmWtCd == "01"){
						value.managerNum = '01';
						value.managerId = value.authGrpId;
						value.managerPrjGrpId = value.prjGrpId;
						value.managerPrjId = value.prjId;
						value.managerPrjNm = $.osl.escapeHtml(value.prjNm);
						value.managerNm = $.osl.escapeHtml(value.authGrpNm);
						value.managerImg = "";
						value.managerDept = "";
						value.managerWriter="Y";
					}else{
						value.managerNum = '02';
						value.managerId = value.authGrpId;
						value.managerPrjGrpId = value.prjGrpId;
						value.managerPrjId = value.prjId;
						value.managerPrjNm = $.osl.escapeHtml(value.prjNm);
						value.managerNm = $.osl.escapeHtml(value.authGrpNm);
						value.managerImg = "";
						value.managerDept = "";
						value.managerWriter="Y";
					}
				});

				
				drawList(info, "stmWtList", false);
				
				oriWriter = JSON.stringify(sendManagerList("stmWtList", false, true, false));
			}
		});
		
		
		ajaxObj.send();
    }
	
    
    var setGrpAndUsrList = function(){
	
		var adminList = addJsonList("stmAdmList", true);
		var writerList = addJsonList("stmWtList", true);
		var allList = [];
		
		
		
    	var data = {
				"menuId" : $("#menuId").val(),
				"stmDsTypeCd" : $("#paramStmDsTypeCd").val(),
				};
		
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2102BadGrpAndUsrListAjax.do'/>"}
				, data);
		
  		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{

				var infoGrp = data.badGrpList;
				var infoUsr = data.badUsrList;
				
				var listHtml = "";
				
				
				$("#searchSelect").html("");
				$.each(infoGrp, function(idx, val){
					
					var innerHtml = "<option value='"+val.authGrpId+"' data-prj-id='"+val.prjId+"' data-prj-grp-id='"+val.prjGrpId+"'>"+$.osl.escapeHtml(val.authGrpNm)+" ("+$.osl.escapeHtml(val.prjNm)+")</option>";
					$("#searchSelect").append(innerHtml);
				});
				
				
				
				
				
				
				$.each(infoGrp, function(index, value){
					var passKey_admin = false;
					var passKey_writer = false;
					$.each(adminList, function(idx, items){
						if((value.authGrpId != null && value.authGrpId != "") && (value.prjId != null && value.prjId != "")){
							if(value.authGrpId.indexOf(items.managerId)>-1 && value.prjId.indexOf(items.managerPrjId)>-1){
								passKey_admin = true;
							}
						}
					});
					$.each(writerList, function(idx, items){
						if((value.authGrpId != null && value.authGrpId != "") && (value.prjId != null && value.prjId != "")){
							if(value.authGrpId.indexOf(items.managerId)>-1 && value.prjId.indexOf(items.managerPrjId)>-1){
								passKey_writer = true;
							}
						}
					});
					
					var pushData = {};
					pushData.managerNum = '01';
					pushData.managerId = value.authGrpId;
					pushData.managerPrjGrpId = value.prjGrpId;
					pushData.managerPrjId = value.prjId;
					pushData.managerPrjNm = $.osl.escapeHtml(value.prjNm);
					pushData.managerNm = $.osl.escapeHtml(value.authGrpNm);
					pushData.managerImg = "";
					pushData.managerDept = "";
					
					
					if(passKey_admin == true){
						pushData.managerAdmin = 'Y';
					}else 
					{
						pushData.managerAdmin = 'N';
					}
					
					if(passKey_writer == true){
						pushData.managerWriter = 'Y';
					}else 
					{
						pushData.managerWriter = 'N';
					}
					allList.push(pushData);
				});
				
				$.each(infoUsr, function(index, value){
					var passKey_admin = false;
					var passKey_writer = false;
					$.each(adminList, function(idx, items){
						if(value.usrId != null && value.usrId != ""){
							if(value.usrId.indexOf(items.managerId)>-1){
								passKey_admin = true;
							}
						}
					});
					$.each(writerList, function(idx, items){
						if(value.usrId != null && value.usrId != ""){
							if(value.usrId.indexOf(items.managerId)>-1){
								passKey_writer = true;
							}
						}
					});
					
					var pushData = {};
					pushData.managerNum = '02';
					pushData.managerId = value.usrId;
					pushData.managerPrjGrpId = "";
					pushData.managerPrjId = "";
					pushData.managerPrjNm = "";
					pushData.managerNm = value.usrNm;
					pushData.managerImg = value.usrImgId;
					pushData.managerDept = $.osl.escapeHtml(value.deptNm);
					
					
					if(passKey_admin == true){
						pushData.managerAdmin = 'Y';
					}else 
					{
						pushData.managerAdmin = 'N';
					}
					
					if(passKey_writer == true){
						pushData.managerWriter = 'Y';
					}else 
					{
						pushData.managerWriter = 'N';
					}
					allList.push(pushData);
				});
				
				
				drawList(allList, "stmGroupUsrList", false);
			}
		});
  	
		
		ajaxObj.send();
	}
	
    
     var drawList = function(setData, elemId, managerCheck){
        var formId = '#' + elemId;
        
        var listHtml = "";
        var num = 0;
        
        $.each(setData, function(index, value){
           num++;
              
           listHtml = "<div class='card kt-margin-b-10 flex-flow--row' codeNum='"+value.managerNum+"' codeId='"+value.managerId+"' codeNm='"+$.osl.escapeHtml(value.managerNm)+"' codeDept='"+$.osl.escapeHtml(value.managerDept)+"' codeImg='"+value.managerImg+"' codeprjid='"+value.managerPrjId+"' codeprjgrpid='"+value.managerPrjGrpId+"'  codeprjnm='"+$.osl.escapeHtml(value.managerPrjNm)+"'>"
                       +"<div class='dropdown'>"
                          +"<div class='btn osl-left-arrow-group dropdown-toggle' id='dropdownMenuButton"+num+"' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"
                             +"<i class='fas fa-arrow-alt-circle-left'></i>"
                          +"</div>"      
                          +"<div class='dropdown-menu osl-dropdown-menu--position' aria-labelledby='dropdownMenuButton"+num+"'>"
                             +"<a class='dropdown-item'>담당자</a>"
                             +"<a class='dropdown-item'>글 작성 범위</a>"
                          +"</div>"
                       +"</div>"
                       +"<div class='osl-content-group'>"
                       
                       +"<div class='card-title left-user-group kt-margin-b-0'>";
           
           if(managerCheck == true){
              
              
              
              if(value.managerNum=='01'){
                 listHtml += "<span class='groupuser-icon'>"
                             +"<i class='fas fa-user-tag'></i>"
                          +"</span>"
                          +$.osl.escapeHtml(value.managerNm)
                          +"<span class='badge badge-success osl-margin-left--auto'>권한그룹</span>"+
                       +"</div>"
                       
                       
                       +"<div class='osl-card__prjnm'>"
                          +$.osl.escapeHtml(value.managerPrjNm)
                       +"</div>"
                       
                    +"</div>"
              }
              
              else{   

                  var paramData = {
                       html: "<span class='osl-user-card-flex'><span>"+value.managerNm +"</span><span>("+value.managerId+")</span></span>",
                        imgSize: "sm",
                       class:{
                          cardBtn: "osl-bad__fit-content",
                       }
                    };
                  
                 listHtml += "<div class='' data-openid='"+value.managerId+"'>"+
                                $.osl.user.usrImgSet(value.managerImg, paramData )+
                          "</div>"+
                          "<span class='badge badge-info osl-margin-left--auto'>사용자</span>"+
                       "</div>";
                       
                 
                 if(value.managerDept == null){
                    listHtml += "<div class=''>-</div>";
                 }
                 else{
                    listHtml += "<div class='osl-card__prjnm'>"+
                                $.osl.escapeHtml(value.managerDept)+
                             "</div>";
                 }
                 
                 
              }
                 listHtml+="</div></div>";
              
              $(formId).append(listHtml);
              
              
           
           }else{
              
              
              if(value.managerNum=='01'){
                 listHtml += "<span class='groupuser-icon'>"+
                             "<i class='fas fa-user-tag'></i>"+
                          "</span>"+
                          $.osl.escapeHtml(value.managerNm)+
                          "<span class='badge badge-success osl-margin-left--auto'>권한그룹</span>"+
                       "</div>"+
                       
                       
                       "<div class='osl-card__prjnm'>"+
                          $.osl.escapeHtml(value.managerPrjNm)+
                       "</div>";
                       
                       
                 
              
              }else{

                  var paramData = {
                       html: "<span class='osl-user-card-flex'><span>"+value.managerNm +"</span><span>("+value.managerId+")</span></span>",
                        imgSize: "sm",
                       class:{
                          cardBtn: "osl-bad__fit-content",
                       }
                    };
                  
                 listHtml += "<div class='' data-openid='"+value.managerId+"'>"+
                             $.osl.user.usrImgSet(value.managerImg, paramData)+
                          "</div>"+
                          "<span class='badge badge-info osl-margin-left--auto'>사용자</span>"+
                       "</div>";
                       
                       
                 if(value.managerDept == null){
                    listHtml += "<div class='osl-card__prjnm'>-</div>";
                 }else{
                    listHtml += "<div class='osl-card__prjnm'>"+
                                $.osl.escapeHtml(value.managerDept)+
                             "</div>";
                 }
                 
              }
              listHtml += "</div></div>";
              
              $(formId).append(listHtml);
           }
        });
     }
	
    
    var submitBadOption = function(){
		
		
		var menuId = $("#menuId").val();
		
		var stmTypeCd = $("#stmTypeCd").val();
		
		var stmAdmList = JSON.stringify(sendManagerList("stmAdmList", false, false, true));
		
		var stmWtList = JSON.stringify(sendManagerList("stmWtList", false, false, false));
		
		var stmDsTypeCd = $("#stmDsTypeCd").val();
		
		
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
		
		
		if(stmFileYnCd == "01"){
			
			if(stmFileCnt <= 0)
			{
				
				
				stmFileCnt = 1;
				$("#stmFileCnt").val(1);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileCntMessage"));
				return false;
			}
			else if(stmFileCnt > 10)
			{
				
				$("#stmFileCnt").val(10);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxCntMessage"), {type:'error'});
				return false;
			}
			
			
			var defaultStrg = 0;
			
			if(stmFileStrg <= 0)
			{
				
				
				if(stmTypeCd == "02")
				{
					defaultStrg = 4096;
				}
				
				else if(stmTypeCd == "04")
				{
					defaultStrg = 2048;
				}
				
				else
				{
					defaultStrg = 500;
				}
				$("#stmFileStrg").val(defaultStrg);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgMessage"));
				return false;
			}
			
			else
			{
				
				
				
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
				
		  		
				ajaxObj.setFnSuccess(function(data){
					if(data.errorYn == "Y"){
						$.osl.alert(data.message,{type: 'error'});
						
						$.osl.layerPopupClose();
					}else{
						$.osl.toastr(data.message,{type: 'success'});
						
						$.osl.layerPopupClose();
						
						
		   				$("button[data-datatable-id=stm2100StmTable][data-datatable-action=select]").click();
					}
				});
				
				
				ajaxObj.send();
			};
		});
	};
	
	return {
        
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