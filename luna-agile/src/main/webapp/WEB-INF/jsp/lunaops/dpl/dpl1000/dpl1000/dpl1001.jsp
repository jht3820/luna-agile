<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<!-- begin :: form -->
<form class="kt-form" id="dpl1001">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
		<div class="kt-portlet__body">
			<!-- begin :: 내용 영역 -->
			<div class="row">
				<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12">
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 상태</label>
						<div class="col-8">
							<input class="form-control" type="text" id="">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 버전</label>
						<div class="col-8">
							<input class="form-control" type="text" id="">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 명</label>
						<div class="col-8">
							<input class="form-control" type="text" id="">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 일자</label>
						<div class="col-8">
							<input class="form-control" type="date" id="dpldate">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포자</label>
						<div class="col-8">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="요청자 이름" name="" id="">
								<button type="button" class="btn btn-brand input-group-append search-usr__nm__btn" id="" name=""><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>결재자</label>
						<div class="col-8">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="요청자 이름" name="" id="">
								<button type="button" class="btn btn-brand input-group-append search-usr__nm__btn" id="" name=""><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 리비전</label>
						<div class="col-8">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="리비전 검색 후 선택" name="" id="">
								<button type="button" class="btn btn-brand input-group-append" id="" name=""><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 방법</label>
						<div class="col-8">
							<select class="form-control" id="">
								<option value="1">자동</option>
								<option value="1">수동</option>
							</select>
						</div>
					</div>		
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>실패 후 처리</label>
						<div class="col-8">
							<select class="form-control" id="">
								<option value="1">수동</option>
								<option value="1">마침</option>
							</select>
						</div>
					</div>
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>자동 실행 시간</label>
						<div class="col-8">
							<input class="form-control" type="text" id="">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>원복 타입</label>
						<div class="col-8">
							<select class="form-control" id="">
								<option value="1">원복 중지</option>
								<option value="1">전체 원복</option>
								<option value="1">실패 부분만 원복</option>
							</select>
						</div>
					</div>
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>결재요청 의견</label>
						<div class="col-8">
							<textarea class="form-control" type="text" id=""></textarea>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-4 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
						<div class="col-8">
							<textarea class="form-control" type="text" id=""></textarea>
						</div>
					</div>		
				</div>
				<div class="col-lg-7 col-lg-7 col-md-12 col-sm-12 col-12">
					
				</div>
			</div>
			
			
				
			<!-- end :: 내용 영역 -->
			
			<!-- begin :: 배포 진행률 -->
			
			
			<!-- end :: 배포 진행률 -->
		</div>
	</div>
</form>
<!-- end :: form -->
<!-- begin :: modal-footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand"
		data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end :: modal-footer -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLDpl1001Popup = function () {
	var documentSetting = function(){
	
	
		$("#dpldate").data("daterangepicker");
		
		//요청자 명 검색버튼 클릭 시
    	$(".search-usr__nm__btn").click(function(){
    		
    		var data = {
    				usrNm : $("#usrNm").val()
    		};
    		var options = {
    				idKey: "searchUsr",
					modalTitle: "사용자 조회",
					closeConfirm: true,
					autoHeight:false
    		};
    		$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4103View.do',data,options);
    	});
	};
	
	
	
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl1001Popup.init();
});
</script>
<!-- end script -->
