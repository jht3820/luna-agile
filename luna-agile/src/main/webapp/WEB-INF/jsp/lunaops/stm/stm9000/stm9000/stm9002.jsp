<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm9002">
	<input type="hidden" name="paramJenId" id="paramJenId" value="${param.paramJenId}">
	<div class="row">
		<div class="col-lg-6">
			<div class="kt-portlet kt-portlet--mobile">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm9002.label.leftTitle">JENKINS 정보</span>
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-id-badge kt-margin-r-5"></i><span data-lang-cd="stm9002.label.jenkinsName">JENKINS NAME</span></label>
								<input type="text" class="form-control" name="jenNm" id="jenNm" value="<c:out value='${param.paramJenNm}' />" readonly/>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-id-badge kt-margin-r-5"></i><span data-lang-cd="stm9002.label.jenkinsUserId">JENKNS USER ID</span></label>
								<input type="text" class="form-control"name="jenUsrId" id="jenUsrId" readonly/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-id-badge kt-margin-r-5"></i><span data-lang-cd="stm9002.label.jenkinsUse">사용 유무</span></label>
								<input type="text" class="form-control" name="useNm" id="useNm" readonly/>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-id-badge kt-margin-r-5"></i><span data-lang-cd="stm9002.label.mode">mode</span></label>
								<input type="text" class="form-control"name="mode" id="mode" readonly/>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9002.label.jenkinsUrl">JENKINS URL</span></label>
						<input type="text" class="form-control" name="url" id="url" readonly />
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9002.label.jenkinsClass">_class</span></label>
						<input type="text" class="form-control" name="_class" id="_class" readonly/>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9002.label.jenkinsDescription">description</span></label>
						<input type="text" class="form-control" name="description" id="description" readonly/>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9002.label.jenkinsNodeName">nodeName</span></label>
						<input type="text" class="form-control" name="nodeNm" id="nodeNm" readonly/>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9002.label.jenkinsNodeDesc">nodeDescription</span></label>
						<input type="text" class="form-control" name="nodeDescription" id="nodeDescription" readonly/>
					</div> 
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="kt-portlet kt-portlet--mobile">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm9002.label.rightTitle">JOB 정보</span>
						</h5>
					</div>
				</div>
				<!-- begin::job 목록 영역 -->
				<div class="kt-portlet__body kt-pl15 kt-pr15 kt-pb-10">
					<div class="kt-scroll" id="jobListInfo">
					</div>
				</div>
				<!-- end::job 목록 영역 -->
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>

<script>
"use strict";
var OSLStm9002Popup = function () {
	
	var formId = 'frStm9002';

	// 버튼 문구 주입
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
    // Private functions
    var documentSetting = function () {
    	
    	// 오른쪽 job 목록 영역퍼펙트 스크롤 적용
    	KTUtil.scrollInit($("#jobListInfo")[0], {
	        disableForMobile: true, 
	        resetHeightOnDestroy: true, 
	        handleWindowResize: true, 
	        height: 645
	    });
    	
    	// jenkins 상세 정보 조회
    	fnSelectJenkinsDetailInfo();
    	
	    // job 드랍다운 버튼 클릭
	   $(".dropdown-item[data-job-expans=dropdown]").on("click", function(){
		   	var jenId = $("#paramJenId").val();
	    	var jobId = $(this).data("job-id");
	    	// 각 드랍다운의 action
	    	var action = $(this).data("job-action");
	    	
	    	// action 실행
	    	fnDropdownActionExecute(jenId, jobId, action);
	   });
    };

    
    // Jenkins 상세 정보 조회
    // 상세 정보 조회시 job 정보도 같이 조회한다.
	var fnSelectJenkinsDetailInfo = function() {
    	
    	var jenId = $("#paramJenId").val();
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm9000/stm9000/selectStm9003JenkinsDetailInfoAjax.do'/>", "async": false}
				,{"jenId": jenId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.resultCode == "JENKINS_FAIL"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				
				// jenkins 정보
				var jenkinsInfo = data.jenkinsInfo;
				// jenkins 서버에 생성되어 있는 job 목록
				var jobList = data.jobList;
				// db에 등록된 job 목록
				var dbJobList = data.dbJobList;

				// jenkins 정보 세팅
		    	$.osl.setDataFormElem(jenkinsInfo,"frStm9002", ["jenNm", "url", "jenUsrId", "useNm", "mode", "_class", "description", "nodeDescription"]);
				
		    	// nodeName은 별도 세팅
		    	$("#nodeNm").val(jenkinsInfo.nodeName);
				
				// job 목록 초기화
				$("#jobListInfo").html("");
				
				// jenkins job 목록이 존재 시
				if(!$.osl.isNull(jobList) && jobList.length > 0){
					
					// job loop
					$.each(jobList, function(idx, jobMap){
						
						var jenJobId = jobMap.name;
						jobMap["dbRegisteYn"] = "N";
						
						// DB에 등록된 job 목록 loop
						$.each(dbJobList, function(idx2, dbJobMap){
							
							var dbjobId = dbJobMap.jobId;
							// DB 등록유무 값 추가
							dbJobMap["dbRegisteYn"] = "Y";
							
							// jenkins 서버에 생성된 job과 db에 등록된 job 정보 일치할 경우
							if(jenJobId == dbjobId){
								// 데이터 병합
								jobMap = $.extend(true, jobMap, dbJobMap);
								return false;
							}
						});
					});
					
					// job 목록 세팅 html 문자열
					var jobInfoStr = '';
					
					// job 목록 loop하며 화면에 세팅
					$.each(jobList, function(idx, map){
						
						// DB에 JOB 등록 유무
						var dbRegisteYn = map.dbRegisteYn;
						// job 상태
						var jobStatus = map.color;
						
						// DB 등록유무
						var dbRegisteHtmlStr = '<span class="badge badge-danger">'+$.osl.lang("stm9002.label.notSstemRegister")+'</span>';
						// job 상태
						var jobStatusHtmlStr = '<span class="badge badge-warning kt-font-light osl-min-width-85">'+$.osl.lang("stm9002.label.jobStatusEtc")+'</span>';
						// job 타입
						var jobTypeHtmlStr = "";
						
						// DB 등록유무에 따라 표시 변경
						if(dbRegisteYn == "Y"){
							dbRegisteHtmlStr = '<span class="badge badge-primary">'+$.osl.lang("stm9002.label.systemRegister")+'</span>';
							// 등록된 job의 타입 추가
							jobTypeHtmlStr = '<span class="badge badge-primary kt-margin-r-10" >'+ map.jobTypeNm +'</span>';
						}
						
						// job 상태에 따라 html 세팅
						if(jobStatus == "blue"){
							jobStatusHtmlStr = '<span class="badge badge-success osl-min-width-85">'+$.osl.lang("stm9002.label.jobStatusSuccess")+'</span>';
						}else if(jobStatus == "red"){
							jobStatusHtmlStr = '<span class="badge badge-danger osl-min-width-85">'+$.osl.lang("stm9002.label.jobStatusFail")+'</span>';
						}else if(jobStatus == "aborted"){
							jobStatusHtmlStr = '<span class="badge badge-warning kt-font-light osl-min-width-85 ">'+$.osl.lang("stm9002.label.jobStatusAborted")+'</span>';
						}else if(jobStatus == "notbuilt"){
							jobStatusHtmlStr = '<span class="badge badge-dark osl-min-width-85">'+$.osl.lang("stm9002.label.jobStatusNotBuilt")+'</span>';
						}
						
						// DB에 Job 등록유무에 따른 드롭다운 메뉴
						var JobDbRegisteMenuList = {
								// DB에 등록
								"Y":[
									'<div class="dropdown-item" data-job-expans="dropdown" data-job-action="update" data-job-id="'+ map.jobId +'"><i class="fa fa-edit kt-font-primary"></i>수정</div>',
									'<div class="dropdown-item" data-job-expans="dropdown" data-job-action="delete" data-job-id="'+ map.jobId +'" data-job-type="'+ map.jobTypeCd +'"><i class="fa fa-trash kt-font-primary"></i>삭제</div>',
									'<div class="dropdown-item" data-job-expans="dropdown" data-job-action="jobListMove"><i class="fa fa-list-alt kt-font-primary"></i>'+$.osl.lang("stm9002.button.moveJobList")+'</div>',
									'<div class="dropdown-divider"></div>',
									'<div class="dropdown-item" data-job-expans="dropdown" data-job-action="detail" data-job-id="'+ map.jobId +'"><i class="fa fa-info-circle kt-font-primary"></i>'+$.osl.lang("stm9002.button.jobDetail")+'</div>'
								],
								// 미등록
								"N":[
									'<div class="dropdown-item" data-job-expans="dropdown" data-job-action="insert" data-job-id="'+ map.name +'"><i class="fa fa-plus kt-font-primary"></i>'+$.osl.lang("stm9002.button.jobInsert")+'</div>',
									'<div class="dropdown-item" data-job-expans="dropdown" data-job-action="jobListMove"><i class="fa fa-list-alt kt-font-primary"></i>'+$.osl.lang("stm9002.button.moveJobList")+'</div>'
								]
						};
						
						jobInfoStr +='<div class="col-lg-12 col-md-12 col-sm-12 kt-padding-l-0 kt-padding-r-0 kt-mb-15" style="border: 1px solid #e2e5ec;">'
										+'<div class="kt-portlet kt-portlet--mobile kt-mb-0">'
											+'<div class="kt-portlet__head kt-portlet__head--lg">'
												+'<div class="kt-portlet__head-label">'
													+'<h5 class="kt-font-boldest">'
														+ jobTypeHtmlStr
														+'<span class="badge badge-primary kt-margin-r-10" title="Job Name : '+ $.osl.escapeHtml(map.name) +'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" >'+ $.osl.escapeHtml(map.name) +'</span>'
													+'</h5>'
												+'</div>'
												+'<div class="kt-portlet__head-toolbar">'
													+'<div class="kt-portlet__head-wrapper">'
														+'<button type="button" class="btn btn-outline-primary btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" >'
															+'<i class="fa fa-bars osl-padding-r0"></i>'
														+'</button>'
														+'<div class="dropdown-menu dropdown-menu-right">'
															+JobDbRegisteMenuList[dbRegisteYn].join('')
														+'</div>'
													+'</div>'
												+'</div>'
											+'</div>'
											+'<div class="kt-portlet__body kt-padding-b-15">'
												+'<div class="row">'
													+'<div class="col-lg-6 col-md-6 col-sm-12">'
														+'<div class="row">'
															+'<div class="col-lg-6 col-md-6 col-sm-12 kt-pl25">'
																+'<div class="kt-pull-left">'
																	+'<div class="osl-margin-b-1rm"><i class="fa fa-cog kt-font-brand kt-margin-r-5"></i><span>'+$.osl.lang("stm9002.label.statusLable")+'</span></div>'
																	+'<h5>'+ jobStatusHtmlStr +'</h5>'
																+'</div>'
															+'</div>'
															+'<div class="col-lg-6 col-md-6 col-sm-12 kt-pl15">'
																+'<div class="kt-pull-left">'
																	+'<div class="osl-margin-b-1rm"><i class="fa fa-coins kt-font-brand kt-margin-r-5"></i><span>'+$.osl.lang("stm9002.label.systemRegisterLabel")+'</span></div>'
																	+'<h5>'+ dbRegisteHtmlStr +'</h5>'
																+'</div>'
															+'</div>'
														+'</div>'
													+'</div>'
													+'<div class="kt-padding-l-40 kt-padding-b-15 col-lg-6 col-md-6 col-sm-12">'
														+'<div class="osl-margin-b-1rm"><i class="fa fa-tag kt-font-brand kt-margin-r-5"></i><span>'+$.osl.lang("stm9002.label.jobClass")+'</span></div>'
														+'<span class="text-muted text-truncate" title="'+$.osl.escapeHtml(map._class)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">'+$.osl.escapeHtml(map._class)+'</span>'
													+'</div>'
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>';
						
					});
				}
				
				// job 목록 추가
				$("#jobListInfo").html(jobInfoStr);
				
				// 툴팁 재호출
				KTApp.initTooltips();
			}	
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
	
	// dropAction 실행
	var fnDropdownActionExecute = function(jenId, jobId, action){

		// job 등록&수정 팝업 전달 데이터
    	var data = {
    			paramJenId : jenId,
    			paramJobId: jobId,
    			callView: "stm9002"
    	};
    	
    	// 각 action별 처리
    	if(action == "insert"){
    		
    		data["type"] = "insert";
    		
			var options = {
				idKey: jenId+"_"+jobId+"_insert",
				modalTitle: $.osl.lang("stm9100.modal.job.insertJob"),
				closeConfirm: false
			};
			
			$.osl.layerPopupOpen('/stm/stm9000/stm9100/selectStm9101View.do',data,options);
    		
    	}else if(action == "update"){
    		
    		// 타입값 추가
    		data["type"] = "update";
    		
			var options = {
					idKey: jenId+"_"+jobId+"_update",
					modalTitle: $.osl.lang("stm9100.modal.job.updateJob"),
					closeConfirm: false
				};
			
			$.osl.layerPopupOpen('/stm/stm9000/stm9100/selectStm9101View.do',data,options);
    		
    	}else if(action == "delete"){
    		
    		var sendData = [{"jenId":jenId, "jobId":jobId}];
    		
    		// job 삭제 confirm
    		$.osl.confirm(jobId + $.osl.lang("stm9002.message.confirm.deleteMessage"),null,function(result) {
		        if (result.value) {
		        	// 선택 job 삭제
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/stm/stm9000/stm9100/deleteStm9100JobInfoAjax.do'/>"}
							,{deleteDataList: JSON.stringify(sendData)});
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
			   				$.osl.alert(data.message,{type: 'error'});
			   			}else{
			   				//삭제 성공
			   				$.osl.toastr(data.message);
			   				
			   				// 삭제 성공 후 job 목록 재조회
			   				fnSelectJenkinsDetailInfo();
			   			}
					});
					
					//AJAX 전송
					ajaxObj.send();	
		        }
    		});
    		
    	// job 상세보기	
    	}else if(action == "detail"){
    		
    	}else if(action == "jobListMove"){
    		
			//form 생성
			var newForm = $("<form></form>");
			newForm.attr("name","jobListMoveForm");
			newForm.attr("method","post");
			newForm.attr("action","/stm/stm9000/stm9100/selectStm9100View.do");
			newForm.attr("target","_self");
			newForm.appendTo("body");
			
			// JENKINS JOB 생성관리로 이동
			newForm.submit();
    	}
	};
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        },
        // jenkins job 조회
        selectJenkinsDetailInfo: function(){
        	fnSelectJenkinsDetailInfo();
        }
    };
}();

//Initialization
$.osl.ready(function(){
	OSLStm9002Popup.init();
});

	
</script>