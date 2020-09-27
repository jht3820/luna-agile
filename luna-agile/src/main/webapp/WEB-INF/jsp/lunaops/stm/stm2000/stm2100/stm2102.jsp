<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__body">
		<form class="kt-form" id="stm2102Info">
			<input type="hidden" id="typeString" name="typeString" value="${param.typeString }"/>
			<input type="hidden" id="menuId" name="menuId" value="${param.menuId }"/>
			<input type="hidden" id="stmDsTypeCd" name="stmDsTypeCd" value="${param.stmDsTypeCd }"/>
			<input type="hidden" id="dataList" name="dataList" value='${param.dataList}'/>
			<div class="row">
				<div class="col-xl-6">
				</div>
				<div class="col-xl-6 kt-margin-b-10">
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
				</div>
			</div>
			<div class="row">
				<div class="col-xl-12">
					<div class="form-group">
						<label><i class="fa flaticon2-group kt-margin-r-5"></i>권한 그룹</label>
						<div class="kt-list ps--active-y form-control kt-padding-5" id="groupList" name="groupList" style="height: 120px; overflow: auto;">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-12">
					<div class="form-group">
						<label><i class="fa flaticon-avatar kt-margin-r-5"></i>사용자</label>
						<div class="kt-list ps--active-y form-control kt-padding-5" id="userList" name="userList" style="height: 120px; overflow: auto;">
						</div>
					</div>
				</div>
			</div>
			<hr class="kt-margin-b-50">
			<div class="row">
				<div class="col-xl-12">
					<div class="form-group">
						<label class="required" name="managerLabel" id="managerLabel"><i class="fa flaticon2-user-1 kt-margin-r-5"></i></label>
						<div class="kt-list ps--active-y form-control kt-padding-5" id="manager" name="manager" style="height: 160px; overflow: auto;" required>
							<div id="manager_auth" name="manager_auth">
							</div>
							<div id="manager_user" name="manager_user">
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-brand" id="stm2102SaveSubmit">수정 완료</button>
	</div>
</div>

<!-- begin page script -->
<script>
 "use strict";
 
 var OSLStm2102Popup = function(){
	var formId="stm2102Info";
	
	 //최종 리스트를 전달할 변수 선언
	var temp = [];

	 // 기본 설정
	var documentSetting = function(){
		//manager div 명칭 설정
		if($("#typeString").val() == 'admin'){
			$("#managerLabel").append('담당자');
		}else{
			$("#managerLabel").append('글 작성 범위');
			$("#managerLabel").removeClass("required");
		}
		setGrpAndUsrList();
		
		//초기 검색 select 안보이게
		$("#searchSelect~span").addClass("osl-datatable-search--hide");
		
		//검색 drop-item 변경 시 이벤트 적용
		$(".selectSearchItem").click(function(){
			$(".selectSearchItem").removeClass("active");
			$(this).addClass("active");
			$("#selectSearchBtn").text($(this).text());
			
			//이전에 검색한 조건으로 인해 리스트 안보이는거 되돌리기
			//이전에 그룹/사용자 목록 hide한것이 있다면 모두 제거
			$("#manager_auth").removeClass("kt-hide");
			$("#manager_user").removeClass("kt-hide");
			$.each($("#groupList").children("div"), function(idx, value){
				$(this).removeClass("kt-hide");
			});
			$.each($("#userList").children("div"), function(idx, value){
				$(this).removeClass("kt-hide");
			});

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
		
		// 권한그룹 선택될 때 이벤트 발생
		$("#searchSelect").change(function(){
			$("#manager").animate({scrollTop:$("#manager_auth").children("div")[0].offsetTop}, 200);
			$("#searchBtn").click();
		});
		
		// 검색어가 입력될 때 이벤트 발생
		$("#subSearchData").on("propertychange paste input", function(){
			$("#searchBtn").click();
		});
		
		//엔터키 막기 - 안막으면 강제종료
		$("#stm2102Info").keydown(function(e){
			if(e.keyCode=='13'){
				e.preventDefault();
				$("#searchBtn").click();
				return;
			}
		});
		
		$("#searchBtn").click(function(){
			var space = $(".selectSearchItem.dropdown-item.active").data("fieldId");
			//검색된 것이 없으면 스크롤 상단에 위치시키기 - 검사후 넣기
// 			if($("#subSearchData").val()==null || $("#subSearchData").val()==""){
// 				$("#manager").animate({scrollTop:$("#manager_auth").children("div")[0].offsetTop}, 200);
// 			}
			if(space == "-1"){
				//이전에 그룹/사용자 목록 hide한것이 있다면 모두 제거
				$.each($("#groupList").children("div"), function(idx, value){
					$(this).removeClass("kt-hide");
				});
				$.each($("#userList").children("div"), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else if(space == "searchAuthGrpNm"){ //select
				var selectedItem = $("#searchSelect option:checked").text();
				$.each($("#groupList").children("div"), function(idx, value){
					if(selectedItem != value.textContent){
						$(this).addClass("kt-hide");
					}else{
						$(this).removeClass("kt-hide");
					}
				});
				$.each($("#manager_auth").children("div"), function(idx, value){
					if(selectedItem == value.textContent){
						var topPos = this.offsetTop;
						$("#manager").animate({scrollTop:topPos}, 200);
						return false;
					}
				});
				$("#manager").animate({scrollTop:$("#manager_auth").children("div")[0].offsetTop}, 200);
			}else if(space == "searchUsrId"){ //text
				var txt = $("#subSearchData").val();
				$.each($("#userList").children("div"), function(idx, value){
					if(value.getAttribute("codeid").indexOf(txt) < 0){
						$(this).addClass("kt-hide");
					}else{
						$(this).removeClass("kt-hide");
					}
				});
				$.each($("#manager_user").children("div"), function(idx, value){
					if(value.textContent.indexOf(txt)>-1){
						var topPos = this.offsetTop;
						$("#manager").animate({scrollTop:topPos}, 200);
						return false;
					}
				});
			}else{ //text
				var txt = $("#subSearchData").val();
				$.each($("#userList").children("div"), function(idx, value){
					if(value.textContent.indexOf(txt) < 0){
						$(this).addClass("kt-hide");
					}else{
						$(this).removeClass("kt-hide");
					}
				});
				$.each($("#manager_user").children("div"), function(idx, value){
					if(value.textContent.indexOf(txt)>-1){
						var topPos = this.offsetTop;
						$("#manager").animate({scrollTop:topPos}, 200);
						return false;
					}
				});
			}
		});

		// +, - 버튼 클릭할 때 이벤트 발생
		$(document).off('click', '.checkBtn').on('click', '.checkBtn', function(){
			// + 버튼 눌렀을 때
			if($(this).val() == '+')
			{
				// 클릭한 div
				var moveTag = $(this).closest("div");
				// 클릭한 div가 속한 div id
				var moveTagTopId = moveTag.parent("div").attr("id");
				// gropuList인 경우 manager_auth div에 옮긴다.
				if(moveTagTopId == "groupList")
				{
					$("#manager_auth").append(moveTag);
				}
				// usrList인경우 manager_user div에 옮긴다.
				else
				{
					$("#manager_user").append(moveTag);
				}
				
				// 해당 버튼 -로 변경
				moveTag.find("input").attr("value", '-');

				//클릭한 div를 제거
				$("#"+moveTagTopId).remove(moveTag);
			}
			// - 버튼 눌렀을 때
			else
			{
				// 클릭한 div
				var moveTag = $(this).closest("div");
				// 클릭한 div가 속한 div id
				var moveTagTopId = moveTag.parent("div").attr("id");
			
				// manager_auth인 경우 gropuList div에 옮긴다.
				if(moveTagTopId =="manager_auth")
				{
					$("#groupList").append(moveTag);
				}
				// manager_user인 경우 userList div에 옮긴다.
				else
				{
					// 사용자 div에 옮긴다.
					$("#userList").append(moveTag);
				}
				
				// 해당 버튼 +로 변경
				moveTag.find("input").attr("value", '+');

				//클릭한 div를 제거
				$("#"+moveTagTopId).remove(moveTag);
			}
		});
		
		// 수정완료 버튼 클릭 시 이벤트 발생
		$("#stm2102SaveSubmit").click(function(){
			//담당자 목록 중 검색으로 인해 hide된 것이 있다면 hide 해제
			$.each($("#manager_auth").children("div"), function(idx, value){
				$(this).removeClass("kt-hide");
			});
			$.each($("#manager_user").children("div"), function(idx, value){
				$(this).removeClass("kt-hide");
			});
			
			//하나도 선택되지 않았을 때
			if($("#manager_auth").children().first().length==0 && $("#manager_user").children().first().length==0){
				if($("#typeString").val() == "admin"){
					$.osl.alert("담당자 지정은 필수입니다.", {"type":"warning"});
					return false;
				}
			}
			$.osl.layerPopupClose();
		});
	}
	
	
	/**
	* function 명 	: sendManagerList
	* function 설명	: 선택한 담당자/글작성범위 리스트를 전달한다.
	* param : elemId 가져올 리스트 div id(#제외)
	* param : divisionCheck div안에 _auth, _user로 구분되어 있는지 확인(true, false)
	* param : passCheck 데이터 넘길 때 num, id외 필요한지 확인(필요 true, 필요 없음false)
	*/
    var sendManagerList = function(elemId, divisionCheck, passCheck){
		var targetId = '#' + elemId;

		// 전달할 리스트 만들기
		if(divisionCheck==true)
		{
			var divList = $(targetId+"_auth").children('div');
			
			$.each(divList, function(index, value){
				var dataOne = {};
				dataOne.managerNum = value.getAttribute("codenum");
				dataOne.managerId = value.getAttribute("codeid");
				dataOne.managerPrjGrpId = value.getAttribute("codeprjgrpid");
				dataOne.managerPrjId = value.getAttribute("codeprjid");
				if(passCheck==true)
				{
					dataOne.managerNm = $.osl.escapeHtml(value.getAttribute("codenm"));
					dataOne.managerImg = value.getAttribute("codeimg");
					dataOne.managerDept = $.osl.escapeHtml(value.getAttribute("codedept"));
					dataOne.managerPrjNm = $.osl.escapeHtml(value.getAttribute("codeprjnm"));
				}
				temp.push(dataOne);
			});

			divList = $(targetId+"_user").children('div');

			$.each(divList, function(index, value){
				var dataOne = {};
				dataOne.managerNum = value.getAttribute("codenum");
				dataOne.managerId = value.getAttribute("codeId");
				dataOne.managerPrjGrpId = value.getAttribute("codeprjgrpid");
				dataOne.managerPrjId = value.getAttribute("codeprjid");
				if(passCheck==true)
				{
					dataOne.managerNm = $.osl.escapeHtml(value.getAttribute("codenm"));
					dataOne.managerImg = value.getAttribute("codeimg");
					dataOne.managerDept = $.osl.escapeHtml(value.getAttribute("codedept"));
					dataOne.managerPrjNm = $.osl.escapeHtml(value.getAttribute("codeprjnm"));
				}
				temp.push(dataOne);
			});
		}
		else
		{
			var divList = $(targetId).children('div');
			
			$.each(divList, function(index, value){
				var dataOne = {};
				dataOne.managerNum = value.getAttribute("codenum");
				dataOne.managerId = value.getAttribute("codeId");
				dataOne.managerPrjGrpId = value.getAttribute("codeprjgrpid");
				dataOne.managerPrjId = value.getAttribute("codeprjid");
				if(passCheck==true)
				{
					dataOne.managerNm = $.osl.escapeHtml(value.getAttribute("codenm"));
					dataOne.managerImg = value.getAttribute("codeimg");
					dataOne.managerDept = $.osl.escapeHtml(value.getAttribute("codedept"));
					dataOne.managerPrjNm = $.osl.escapeHtml(value.getAttribute("codeprjnm"));
				}
				temp.push(dataOne);
			});
		}
		return temp;
    }
    
	/**
	* function 명 	: setGrpAndUsrList
	* function 설명	: 전달 받은 dataList를 체크하여 해당하는 위치에 셋팅
	*/
    var setGrpAndUsrList = function(){
	
		// 모든 목록 가져오기
		// 검색할 메뉴 id
    	var data = {
				"menuId" : $("#menuId").val(),
				"stmDsTypeCd" : $("#stmDsTypeCd").val(),
				"typeString" : $("#typeString").val(),
				};
		
		//AJAX 설정
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2102BadGrpAndUsrListAjax.do'/>"}
				, data);
		
  		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var dataList = JSON.parse($("#dataList").val());

				var infoGrp = data.badGrpList;
				var infoUsr = data.badUsrList;
				
				var listHtml = "";
				
				//상단의 select 박스 option 넣기
				$("#searchSelect").html("");
				$.each(infoGrp, function(idx, val){
					//select에 목록 추가
					var innerHtml = "<option value='"+val.authGrpId+"' data-prj-id='"+val.prjId+"' data-prj-grp-id='"+val.prjGrpId+"'>"+$.osl.escapeHtml(val.authGrpNm)+" ("+$.osl.escapeHtml(val.prjNm)+")</option>";
					$("#searchSelect").append(innerHtml);
				});
				
				// dataList에서 중첩되는 항목은 manager로
				// 중복되지 않는 항목은 각 div로 넣기
				
				var setAuthGrpList = [];
				var setUsrList = [];
				var setManagerList = [];

				// 권한 그룹 전체 목록에서 dataList에 해당하는 목록 확인
				// infoGrp에 있는건 authGrpId, authGrpNm
				// infoUsr에 있는건 usrId, usrNm, usrImgId, deptNm
				// dataList에 있는건 전달받은 codenum, codeid, codeprjid
				$.each(infoGrp, function(idx, val){
					var passKey = false;
					$.each(dataList, function(index, value){
						if((val.authGrpId != null && val.authGrpId != "") && (val.prjId != null && val.prjId != "")){
							if(val.authGrpId.indexOf(value.managerId)>-1 && val.prjId.indexOf(value.managerPrjId)>-1){
								passKey = true;
							}
						}
					});
					if(passKey == true){
						var pushData = {};
						pushData.managerNum = '01';
						pushData.managerId = val.authGrpId;
						pushData.managerPrjGrpId = val.prjGrpId;
						pushData.managerPrjId = val.prjId;
						pushData.managerPrjNm = $.osl.escapeHtml(val.prjNm);
						pushData.managerNm = $.osl.escapeHtml(val.authGrpNm);
						pushData.managerImg = "";
						pushData.managerDept = "";
						setManagerList.push(pushData);
					}// 존재하지 않으면
					else
					{
						var pushData = {};
						pushData.managerNum = '01';
						pushData.managerId = val.authGrpId;
						pushData.managerPrjGrpId = val.prjGrpId;
						pushData.managerPrjId = val.prjId;
						pushData.managerPrjNm = $.osl.escapeHtml(val.prjNm);
						pushData.managerNm = $.osl.escapeHtml(val.authGrpNm);
						pushData.managerImg = "";
						pushData.managerDept = "";
						setAuthGrpList.push(pushData);
					}
				});
				$.each(infoUsr, function(idx, val){
					var passKey = false;
					$.each(dataList, function(index, value){
						if(val.usrId != null && val.usrId != ""){
							if(val.usrId.indexOf(value.managerId)>-1){
								passKey = true;
							}
						}
					});
					if(passKey == true){
						var pushData = {};
						pushData.managerNum = '02';
						pushData.managerId = val.usrId;
						pushData.managerPrjGrpId = "";
						pushData.managerPrjId = "";
						pushData.managerPrjNm = "";
						pushData.managerNm = val.usrNm;
						pushData.managerImg = val.usrImgId;
						pushData.managerDept = $.osl.escapeHtml(val.deptNm);
						setManagerList.push(pushData);
					}// 존재하지 않으면
					else
					{
						var pushData = {};
						pushData.managerNum = '02';
						pushData.managerId = val.usrId;
						pushData.managerPrjGrpId = "";
						pushData.managerPrjId = "";
						pushData.managerPrjNm = "";
						pushData.managerNm = val.usrNm;
						pushData.managerImg = val.usrImgId;
						pushData.managerDept = $.osl.escapeHtml(val.deptNm);
						setUsrList.push(pushData);
					}
				});
				// 그리기
				drawList(setAuthGrpList, "groupList", false);
				drawList(setUsrList, "userList", false);
				drawList(setManagerList, "manager", true);
				
				//사용자 아이콘 클릭 시
				$(".openid").click(function(){
					var usrId = $(this).data("openid");
					$.osl.user.usrInfoPopup(usrId);
				});
			}
		});
  	
		//AJAX 전송
		ajaxObj.send();
	}
	
    /**
	* function 명 : drawList
	* function param : 출력 데이터 정보, 그릴 element Id(#제외), 담당자/글작성범위 목록에 그릴 것인지 확인(true, false)
	* function 설명 : 지정 element에 데이터 출력(kt-list__item)
	*/
	var drawList = function(setData, elemId, managerCheck){
		var formId = '#' + elemId;
		
		var listHtml = "";
		
		$.each(setData, function(index, value){

			listHtml = "<div class='kt-list__item kt-padding-t-0 kt-padding-b-5' codeNum='"+value.managerNum+"' codeId='"+value.managerId+"' codeNm='"+$.osl.escapeHtml(value.managerNm)+"' codeDept='"+$.osl.escapeHtml(value.managerDept)+"' codeImg='"+value.managerImg+"' codeprjid='"+value.managerPrjId+"' codeprjgrpid='"+value.managerPrjGrpId+"'  codeprjnm='"+$.osl.escapeHtml(value.managerPrjNm)+"'>";

			if(managerCheck == true)
			{
				listHtml += "<span><input type='button' class='btn btn-brand kt-margin-r-5 checkBtn' value='-'  /></span>";
				
				if(value.managerNum=='01')
				{
					listHtml += "<div class='col-8'><i class='fa flaticon-users-1 kt-icon-xl kt-margin-l-10 kt-margin-r-10'></i>";
					listHtml += $.osl.escapeHtml(value.managerNm) + " (" + $.osl.escapeHtml(value.managerPrjNm) + ")</div>";
					listHtml += "</div>";
					
					$(formId+"_auth").append(listHtml);
				}
				else
				{
					listHtml += "<div class='col-4 openid' data-openid='"+value.managerId+"'>"+$.osl.user.usrImgSet(value.managerImg, value.managerNm)+"</div>";
					if(value.managerDept == null)
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
				listHtml += "<span><input type='button' class='btn btn-brand kt-margin-r-5 checkBtn' value='+'  /></span>";
				
				if(value.managerNum=='01')
				{
					listHtml += "<div class='col-8'><i class='fa flaticon-users-1 kt-icon-xl kt-margin-l-10 kt-margin-r-10'></i>";
					listHtml += $.osl.escapeHtml(value.managerNm) + " (" + $.osl.escapeHtml(value.managerPrjNm) + ")</div>";
				}
				else
				{
					listHtml += "<div class='col-4 openid' data-openid='"+value.managerId+"'>"+$.osl.user.usrImgSet(value.managerImg, value.managerNm)+"</div>";
					if(value.managerDept == null)
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
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        },
        getDataList: function(){
        	return JSON.stringify(sendManagerList("manager", true, true));
        }
    };
}();

$.osl.ready(function(){
	 OSLStm2102Popup.init();
});
</script>
<!-- end script -->