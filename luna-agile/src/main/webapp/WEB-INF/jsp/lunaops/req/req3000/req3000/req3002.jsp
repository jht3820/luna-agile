<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- begin page DOM -->
<form class="kt-form" id="frReq3002">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="prjId" id="prjId" value="${param.paramPrjId}">
	<input type="hidden" name="prjGrpId" id="prjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="reqGrpUsrId" id="reqGrpUsrId" value="${param.paramReqGrpUsrId}">
	<input type="hidden" name="reqGrpChargerId" id="reqGrpChargerId" value="${param.paramReqGrpChargerId}">
	<input type="hidden" name="reqGrpId" id="reqGrpId" value="${param.paramReqGrpId}">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<input type="hidden" name="oriAtchFileId" id="oriAtchFileId">
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20" id="req3000ReqGrpWrap">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="req3000ReqGrpInfo">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa flaticon2-layers-1 kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">그룹 요구사항 정보</span>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<div class="kt-portlet__head-group">
								<a href="#" id="hideAndShowReqGrpInfo"  data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-up"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="col-lg-12 col-md-12 col-sm-12 col-12 kt-padding-r-20">
						<div class="row">
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label><i class="fas fa-sort-amount-down kt-margin-r-5"></i>그룹 요구사항 번호</label>
									<input type="text" class="form-control" id="reqGrpNo" name="reqGrpNo">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label><i class="fa fa-user kt-margin-r-5"></i>요청자</label>
									<div class="input-group">
										<input type="text" class="form-control" id="reqGrpUsrNm" name="reqGrpUsrNm" readonly="readonly" required="required">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
								<div class="form-group">
									<label><i class="fa fa-user kt-margin-r-5"></i>그룹 요구사항 담당자</label>
									<div class="input-group">
										<input type="text" class="form-control" id="reqGrpChargerNm" name="reqGrpChargerNm" readonly="readonly" required="required">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i>그룹 요구사항 제목</label>
									<input type="text" class="form-control" id="reqGrpNm" name="reqGrpNm" required="required">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i>그룹 요구사항 내용</label>
									<textarea  name="reqGrpDesc" id="reqGrpDesc" required="required"></textarea>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<i class="fa fa-file-upload kt-margin-r-5"></i>파일첨부
									<div class="kt-uppy" id="req3001FileUpload">
										<div class="kt-uppy__dashboard"></div>
										<div class="kt-uppy__progress"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20" id="req3000GrpLinkWrap">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="req3000GrpLinkInfo">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa flaticon2-layers-1 kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">연결된 요구사항 정보</span>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="col-lg-12 col-md-12 col-sm-12 col-12">
						<label class="kt-padding-l-10 kt-padding-r-10"><i class="fas fa-stream kt-margin-r-5"></i>연결 요구사항 처리 유형별 현황</label>
						<div class="col-lg-12 col-md-12 col-sm-12 card">
							<div class="osl-widget kt-padding-l-15">
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqAll.png"></div>
									<div class="osl-widget-info__item-info">
										<a href="#" class="osl-widget-info__item-title">전체</a>
										<div class="osl-widget-info__item-desc">2</div>
									</div>
								</div>
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqInProgress.png"></div>
									<div class="osl-widget-info__item-info">
										<a href="#" class="osl-widget-info__item-title">진행</a>
										<div class="osl-widget-info__item-desc">1</div>
									</div>
								</div>
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqDone.png"></div>
									<div class="osl-widget-info__item-info">
										<a href="#" class="osl-widget-info__item-title">완료</a>
										<div class="osl-widget-info__item-desc">1</div>
									</div>
								</div>
							</div>
						</div>				
						<label class="kt-padding-l-10 kt-padding-r-10 kt-margin-t-20"><i class="fas fa-stream kt-margin-r-5"></i>연결 요구사항 정보</label>
						<div class="col-lg-12 col-md-12 col-sm-12 card">
							<div class="col-lg-12 col-md-12 col-sm-12 card">
								<div class="col-lg-12 col-md-12 col-sm-12 card-hader">
									<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
										<div class="kt-portlet__head">
											<div class="kt-portlet__head-label">
												<span data-lang-cd="">접수 요청</span>
											</div>
											<div class="kt-portlet__head-toolbar">
												<span data-lang-cd="">인사 공통 코드 조회 기능 구현</span>
											</div>
										</div>
										<div class="kt-portlet__body">
											<div class="row">
												<div class="col-lg-4">
													<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
														<div class="kt-portlet__head">
															<div class="kt-portlet__head-label">
															</div>
														</div>
														<div class="kt-portlet__body">
															<div class="row osl-align-center--imp">
																접수요청
															</div>
															<div class="row osl-align-center--imp">
																정형택
															</div>
														</div>
														<div class="kt-portlet__footer">
															<div class="osl-align-center--imp">
																2020-10-22 04:16
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand"	data-dismiss="modal">
		<span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";

//파일업로드 셋팅
var fileUploadObj;
var OSLReq3002Popup = function () {
	var formId = 'frReq3002'
	
	//edit 목록
	var formEditList = [];
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	var documentSetting = function(){
		
		//포틀릿셋팅
		var portlet = new KTPortlet('req3000ReqGrpInfo', $.osl.lang("portlet"));
		portlet.expand();
		//edit 세팅
    	formEditList.push($.osl.editorSetting("reqGrpDesc", {formValidate: formValidate}));
    	
    	//파일 업로드 세팅
    	fileUploadObj = $.osl.file.uploadSet("req3001FileUpload",{
    		
    		url: '/req/req3000/req3000/insertReq3001ReqAtchFileInfo.do',
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": atchFileId, "fileSn": 0},
    		maxNumberOfFiles:20,
    		
    	});
    	
    	//그룹 요구사항 정보 조회
    	selectReqGrpInfo();
    	
	}
	
	/**
	 * 	그룹 요구사항 정보 조회
	*/
    var selectReqGrpInfo = function(){
    	var data = {
    			prjGrpId: $("#prjGrpId").val(),
    			prjId: $("#prjId").val(),
    			reqGrpId: $("#reqGrpId").val()
    	}
    	//Ajax 설정
    	var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req3000/req3000/selectReq3000ReqInfoAjax.do'/>", "async":"true"}
				,data);
    	//Ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
				
			}else{
				
				//요구사항 정보 세팅
		    	$.osl.setDataFormElem(data.reqInfoMap,"frReq3000");
				
				//그룹요구사항 정보 세팅
		    	$("#reqGrpChargerNm").val(data.reqInfoMap.reqGrpChargerNm);
		    	$("#reqGrpUsrNm").val(data.reqInfoMap.reqGrpUsrNm);
		    	$("#reqGrpNo").val(data.reqInfoMap.reqGrpNo);
		    	$("#reqGrpDesc").val(data.reqInfoMap.reqGrpDesc);
		    	$("#reqGrpNm").val(data.reqInfoMap.reqGrpNm);
		    	
		    	
		    	//edit 세팅
		    	formEditList.push($.osl.editorSetting("reqGrpDesc", {formValidate: formValidate, disableResizeEditor: false}));
		    	
		    	//파일Sn넣기
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	//파일 목록 세팅
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
		    	
			}
    	});
		
		//AJAX 전송
		ajaxObj.send();
    };
    
    
    $("#hideAndShowReqGrpInfo").click(function(){
    	
    	var portlet = new KTPortlet('req3000ReqGrpInfo', $.osl.lang("portlet"));
    	
	    if($("#req3000ReqGrpInfo > .kt-portlet__body").css("display") == "none"){
	    	
	    	$("#req3000ReqGrpWrap").attr("class", "col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20");
	    	$("#req3000GrpLinkWrap").removeClass("col-lg-12");
	    	$("#req3000GrpLinkWrap").removeClass("osl-margin-t-1rm");
	    	$("#req3000GrpLinkWrap").addClass("col-lg-6");
	    	$("#hideReqGrpInfo > i").attr("class","la la-angle-up");
	    	
	    	
	    }else{
	    	
	    	$("#req3000ReqGrpWrap").attr("class", "col-lg-6");
	    	$("#req3000ReqGrpWrap").addClass("col-lg-12");
	    	$("#req3000GrpLinkWrap").addClass("col-lg-12");
	    	$("#req3000GrpLinkWrap").addClass("osl-margin-t-1rm");
	    	$("#hideReqGrpInfo > i").attr("class","la la-angle-down");
	    	
	    }
	    
	    
   	});
		
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
    
}();

$.osl.ready(function(){
	OSLReq3002Popup.init();
});
</script>
<!-- end script -->
