<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" id="paramUsrNm" name="paramUsrNm" value="<c:out value='${param.usrNm}' escapeXml='false'/>" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__body">
		<div class="col-lg-8 col-md-8 col-sm-12 m-auto kt-margin-t-15">
			<div class="osl-datatable-search" data-datatable-id="req3003ReqTable"></div>
		</div>
		<div class="kt-datatable" id="req3003ReqTable"></div>
		<button type="button" class="btn btn-sm kt-margin-0 kt-padding-0 osl-width-0 invisible" id="selectUsr"/>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLReq3003Popup = function () {
	var temp;
    var documentSetting = function () {
		var datatableId = "req3003ReqTable";
    	var name = $.osl.escapeHtml($("#paramUsrNm").val());
    	
    	//데이터 테이블 셋팅
    	$.osl.datatable.setting(datatableId,{
    		data : {
    			source:{
    				read:{
    					url:"/req/req3000/req3000/selectReq3003UsrListAjax.do",
    					params:{
    						searchDataTxt : name
    					}
    				}
    			}
    		},
    		columns:[
    			{field:'rn', title:'No.', textAlign:'center', width: 50},
    			{field:'usrNm', title:'사용자명', textAlign:'left', width: 120, autoHide:false, search:true,
    				template: function (row){
    					var usrData = {
								html: row.usrNm,
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
						};
						return $.osl.user.usrImgSet(row.usrImgId, usrData);
    				},
					onclick: function(row){
						$.osl.user.usrInfoPopup(row.usrId);
					}
    			},
    			{field:'usrId', title:'아이디', textAlign:'left', width: 180, search:true},
    			{field:'email', title:'이메일', textAlign:'left', width: 240, search:true},
    			{field:'telno', title:'연락처', textAlign:'left', width: 180, search:true},
    			{field:'deptName', title:'소속', textAlign:'left', width: 240, autoHide:false, search:true}
    		],
    		actionBtn:{
    			title : $.osl.lang("req3000.actionBtn.title"),
    			width : 80,
    			"update" : false,
    			"delete" : false,
    			"click": true,
    		},
    		actionTooltip:{
    			"click": $.osl.lang("req3000.actionBtn.clickBtn"),
    		},
    		actionFn:{
    			"click":function(rowData){
    				temp = rowData;
    				$("#selectUsr").click();
    			}
    		},
    		theme:{
    			actionBtnIcon:{
    				"click": "fa flaticon2-check-mark",
    			}
    		}
    	});
    	
    	//초기 한번 - 넘어온 값이 있는 경우
    	if(name != ""){
    		//드롭다운 메뉴 선택 활성화 취소 및 재선택
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=usrNm]").attr("class", "dropdown-item active");
			//검색 메뉴 버튼 변경
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text($.osl.lang("req4103.field.usrNm"));
		
			//select 감추기
			$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
			$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
			//input 보이기
			$("#searchData_"+datatableId).removeAttr("disabled");
			//input에 이름넣기
			$("#searchData_"+datatableId).val(name);

			//파라메터 초기화
			var detailDataTable = $.osl.datatable.list[datatableId].targetDt;
			detailDataTable.setDataSourceParam("searchDataTxt","");
    	}
    	
    	$("#searchData_"+datatableId).on("keypress", function(e){
    		if(e.key == "Enter"){
    			//검색
    			$(".osl-datatable-search__button[data-datatable-id="+datatableId+"]").click();	
    		}
    	});
    	
    	$("#selectUsr").click(function(){
    		$.osl.layerPopupClose();
    	});
    };
    
    return {
        // public functions
        init: function() {
        	documentSetting();
        },
        getUsrInfo: function(){
        	return JSON.stringify(temp);//선택한 사용자 정보
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLReq3003Popup.init();
});

	
</script>