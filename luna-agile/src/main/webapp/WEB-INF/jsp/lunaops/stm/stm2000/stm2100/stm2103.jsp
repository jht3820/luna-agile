<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="hidden" name="menuId" id="menuId" value="${param.menuId }" /> 
<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
	<div class="kt-padding-20" id="listDiv" name="listDiv">
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm2103Popup = function () {

	//메뉴 아이디
	var menuId = $("#menuId").val();
    var documentSetting = function () {
    	selectBadChargerList(menuId);
    };

	/**
	* function 명 	: selectBadChargerList
	* function 설명	: 게시판 담당자 정보를 조회하여 팝업에 세팅한다.
	*/
    var selectBadChargerList = function(menuId){
		var data = {"menuId" : menuId};
		
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
				
				var str = "";
				//사용자 목록 표출하기
				$.each(info, function(index, value){
					if(value.stmAdminCd=="01"){
						str += "<div class='row kt-padding-t-5 kt-padding-b-5'>"
									+"<div class='kt-user-card-v2__pic kt-media kt-media--xl kt-media--circle kt-padding-5'>"
										+"<img src=\'/media/users/default.jpg\'/>"
									+"</div>"
									+"<div class='kt-user-card-v2__details kt-padding-5 float-left'>"
										+"<div class='kt-font-boldest kt-margin-b-10'>"
											+ value.prjNm
										+"</div>"
										+"<div>"
											+ value.authGrpNm
										+"</div>"
									+"</div>"
								+"</div>";
					}else{
						str += "<div class='row kt-padding-t-5 kt-padding-b-5 usrInfo' data-user='"+value.stmAdminId+"'>"
									+"<div class='kt-user-card-v2__pic kt-media kt-media--xl kt-media--circle kt-padding-5'>"
										+"<img src='"+$.osl.user.usrImgUrlVal(value.usrImgId)+"' onerror='this.src=\"/media/users/default.jpg\"'/>"
									+"</div>"
									+"<div class='kt-user-card-v2__details kt-padding-5 float-left'>"
										+"<div class='kt-font-boldest kt-margin-b-10'>"
											+ value.usrNm + "("+value.stmAdminId+")"
										+"</div>"
										+"<div class='kt-margin-b-10'>"
											+ value.email
										+"</div>"
										+"<div>"
											+ "<span class='kt-font-sm'>" + value.deptNm +"</span>"
										+"</div>"
									+"</div>"
								+"</div>";
					}
				});
				
				$("#listDiv").html(str);
				
				$(".usrInfo").click(function(){
					$.osl.user.usrInfoPopup($(this).data("user"));
				});
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
    }
	
    return {
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLStm2103Popup.init();
});
</script>