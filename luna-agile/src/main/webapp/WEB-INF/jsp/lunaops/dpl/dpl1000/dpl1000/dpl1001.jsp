<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<!-- begin :: form -->
<form class="kt-form" id="dpl1001">
	<!-- begin :: 내용 영역 -->
	<div class="row">
		<!-- begin :: 내용 입력 영역 -->
		<div class="col-xl-5 col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__body">
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 상태</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<input class="form-control" type="text" id="">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 버전</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<input class="form-control" type="text" id="">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 명</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<input class="form-control" type="text" id="">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 일자</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<input class="form-control" type="date" id="dpldate">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포자</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="배포자 이름" name="" id="">
								<button type="button" class="btn btn-brand input-group-append search-usr__nm__btn" id="" name=""><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>결재자</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="결재자 이름" name="" id="">
								<button type="button" class="btn btn-brand input-group-append search-usr__nm__btn" id="" name=""><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 리비전</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="리비전 검색 후 선택" name="" id="">
								<button type="button" class="btn btn-brand input-group-append" id="" name=""><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 방법</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control" id="">
								<option value="1">자동</option>
								<option value="1">수동</option>
							</select>
						</div>
					</div>		
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>실패 후 처리</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control" id="">
								<option value="1">수동</option>
								<option value="1">마침</option>
							</select>
						</div>
					</div>
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>자동 실행 시간</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<input class="form-control" type="text" id="">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>원복 타입</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control" id="">
								<option value="1">원복 중지</option>
								<option value="1">전체 원복</option>
								<option value="1">실패 부분만 원복</option>
							</select>
						</div>
					</div>
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>결재요청 의견</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<textarea class="form-control" type="text" id=""></textarea>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<textarea class="form-control" type="text" id=""></textarea>
						</div>
					</div>	
				</div>
			</div>	
		</div>
		<!-- end :: 내용 입력 영역 -->
		<!-- begin :: 등록된 svn 표출-->
		<div class="col-xl-7 col-lg-6 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label"></div>
					<div class="kt-portlet__head-toolbar">
						<!-- begin :: 버튼 영역 -->
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" id="btn_update_job_up" data-datatable-id="dpl1001Table" data-datatable-action="up" title="JOB 순서 위로" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="up" tabindex="5">
							<i class="fas fa-arrow-up"></i><span>위로</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" id="btn_update_job_down" data-datatable-id="dpl1001Table" data-datatable-action="down" title="JOB 순서 아래로" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="down" tabindex="6">
							<i class="fas fa-arrow-down"></i><span>아래로</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air osl-jop-append" data-datatable-id="dpl1001Table" data-datatable-action="insert" title="JOB 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="7">
							<i class="fa fa-plus"></i><span>등록</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1001Table" data-datatable-action="delete" title="JOB 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8">
							<i class="fa fa-trash-alt"></i><span>삭제</span>
						</button>
						<!-- end :: 버튼 영역 -->
					</div>
				</div>
				<div class="kt-portlet__body">
					<div id="dpl1001CardTable">
						<!-- svn 카드 1 -->
						<div class="kt-portlet border">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0"><input type="checkbox">&nbsp;<span></span></label>
									<span class="osl-badge-brand osl-jenkins-card__num">No.<span class="dplStartOrdCell" ord="1">1</span></span>
									<span class="osl-badge-brand osl-badge-brand-outline osl-cursor-pointer" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" title="job type">빌드</span>
									<h5 class="kt-portlet__head-title kt-margin-l-10">
										<p class="kt-margin-b-0 kt-font-dark kt-font-sm">MAIN_JENKINS</p>JBEMS-build
									</h5>
								</div>
							</div>
							<div class="kt-portlet__body kt-padding-t-10 kt-padding-b-10">
								<div class="row">
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>JENKINS URL</label>
										<p class="kt-margin-b-0">http://www.oslab.kr:7081/jenkins</p>
									</div>
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>원복 JOB ID</label>
										<p class="kt-margin-b-0">-</p>
									</div>
								</div>
							</div>
						</div>
						<!-- svn 카드 2 -->
						<div class="kt-portlet border">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0"><input type="checkbox">&nbsp;<span></span></label>
									<span class="osl-badge-brand osl-jenkins-card__num">No.<span class="dplStartOrdCell" ord="2">2</span></span>
									<span class="osl-badge-brand osl-badge-brand-outline osl-cursor-pointer" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" title="job type">빌드</span>
									<h5 class="kt-portlet__head-title kt-margin-l-10">
										<p class="kt-margin-b-0 kt-font-dark kt-font-sm">SW_JENKINS</p>SECMS_build
									</h5>
								</div>
							</div>
							<div class="kt-portlet__body kt-padding-t-10 kt-padding-b-10">
								<div class="row">
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>JENKINS URL</label>
										<p class="kt-margin-b-0">http://oslab.kr:7081/jenkins</p>
									</div>
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>원복 JOB ID</label>
										<p class="kt-margin-b-0">MIS-build</p>
									</div>
								</div>
							</div>
						</div>
						<!-- svn 카드 3 -->
						<div class="kt-portlet border">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0"><input type="checkbox">&nbsp;<span></span></label>
									<span class="osl-badge-brand osl-jenkins-card__num">No.<span class="dplStartOrdCell" ord="3">3</span></span>
									<span class="osl-badge-brand osl-badge-brand-outline osl-cursor-pointer" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" title="job type">빌드</span>
									<h5 class="kt-portlet__head-title kt-margin-l-15">
										<p class="kt-margin-b-0 kt-font-dark kt-font-sm">T_JOB</p>T_JOB
									</h5>
								</div>
							</div>
							<div class="kt-portlet__body kt-padding-t-10 kt-padding-b-10">
								<div class="row">
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>JENKINS URL</label>
										<p>http://www.oslab.kr:7081/jenkins</p>
									</div>
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>원복 JOB ID</label>
										<p class="kt-margin-b-0">MIS-build</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end :: 등록된 svn 표출-->
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
	
		//datapicker세팅
		$("#dpldate").data("daterangepicker");
		
		//배포자, 결재자 검색버튼 클릭 시 사용자 조회 팝업 실행
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
		
		//jop등록 버튼 클릭시 job등록 팝업 실행
		$('.osl-jop-append').click(function(){
			var data = {
    				
    		};
    		var options = {
    				idKey: "",
					modalTitle: "JOB 등록",
					closeConfirm: true,
					autoHeight:false
    		};
    		$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1003View.do',data,options);
		});
		//job ord up
		$("#btn_update_job_up").click(function(){
			//실행순서 변경
			fnJobInfoOrdMove("up");
		});
		
		//job ord down
		$("#btn_update_job_down").click(function(){
			//실행순서 변경
			fnJobInfoOrdMove("down");
		});
		
		
		
		/*확정파일 영역 drag&drop sortable*/
		new Sortable($('#dpl1001CardTable')[0], {
			group:'shared',
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
	        onEnd:function(evt){
	        	//변경된 index
				var newIndex = evt.newIndex;
				var oldIndex = evt.oldIndex;
				//debugger;
				//변경된 index가 제자리인경우 중지
				
				if(newIndex == oldIndex){
					return false;
				}
				
				//실행 순서 변경 적용
				fnJobDivOrdModify(evt.item, newIndex, oldIndex);
			}
	    });
		
		// 툴팁 재호출
		KTApp.initTooltips();
	};
	
	
	//JOB 실행순서 변경
	function fnJobInfoOrdMove(type){
		//전체 JOB 갯수
		var jobList = $(".dpl_middle_row.dpl_job_row").length;
		
		//선택 JOB INFO 가져오기
		var $chkInfo = $("input[type=checkbox][name=addJobDelChk]:checked");
		
		//1개만 선택
		if($chkInfo.length > 1){
			jAlert("1개의 JOB만 선택해주세요.");
			return false;
		}
		
		//jenId, jobId
		var jenId = $chkInfo.attr("jenid");
		var jobId = $chkInfo.attr("jobid");
		
		//선택 JOB 부모 div
		var $chkJobInfo = $(".dpl_middle_row.dpl_job_row[jenid="+jenId+"][jobid="+jobId+"]");
		
		//선택 JOB ord
		var jobOrd = parseInt($chkJobInfo.attr("ord"));
		if(type == "up"){
			//실행순서가 1일경우 위로 불가능
			if(jobOrd == 1){
				return false;
			}
			
			//변경 ord
			var chgJobOrd = jobOrd-1;
			
			//선택 JOB 하위 JOB
			var $targetObj = $(".dpl_middle_row.dpl_job_row[ord="+chgJobOrd+"]");
			$targetObj.before($chkJobInfo);
		
			//변경된 object ord변경
			$chkJobInfo.attr("ord",chgJobOrd);
			$chkJobInfo.children(".dplStartOrdCell").attr("ord",chgJobOrd);
			$chkJobInfo.children(".dplStartOrdCell").text(chgJobOrd);
		
			//변경된 object ord변경
			$targetObj.attr("ord",jobOrd);
			$targetObj.children(".dplStartOrdCell").attr("ord",jobOrd);
			$targetObj.children(".dplStartOrdCell").text(jobOrd);
		}
		else if(type == "down"){
			//실행순서가 마지막일경우 위로 불가능
			if(jobOrd == jobList){
				return false;
			}
			
			//변경 ord
			var chgJobOrd = jobOrd+1;
			
			//선택 JOB 하위 JOB
			var $targetObj = $(".dpl_middle_row.dpl_job_row[ord="+chgJobOrd+"]");
			$targetObj.after($chkJobInfo);
		
			//변경된 object ord변경
			$chkJobInfo.attr("ord",chgJobOrd);
			$chkJobInfo.children(".dplStartOrdCell").attr("ord",chgJobOrd);
			$chkJobInfo.children(".dplStartOrdCell").text(chgJobOrd);
		
			//변경된 object ord변경
			$targetObj.attr("ord",jobOrd);
			$targetObj.children(".dplStartOrdCell").attr("ord",jobOrd);
			$targetObj.children(".dplStartOrdCell").text(jobOrd);
		}else{
			jAlert("알 수 없는 명령 입니다.");
			return false;
		}
	}
	
	//실행 순서 변경 적용
	function fnJobDivOrdModify(item, newIndex, oldIndex){
			//debugger;
			//ord 변경하기
			$.each($(".dplStartOrdCell"),function(idx, map){
				//현재 ord가져오기
				var targetOrd = parseInt($(map).attr("ord"));
				//var newOrd = targetOrd; 
				
				//아래에서 위
				if(oldIndex > newIndex){
					//new ~ old
					if(idx < newIndex || idx > oldIndex){
						return true;
					}else{
						targetOrd = targetOrd+1;
					}
				}
				//위에서 아래
				else if(oldIndex < newIndex){
					//old ~ new
					if(idx > newIndex || idx < oldIndex){
						return true;
					}else{
						targetOrd = targetOrd-1;
					}
				}
				
				//ord 적용
				$(map).attr("ord",targetOrd);
				$(map).text(targetOrd);
				$(map).parent(".dpl_middle_row.dpl_job_row").attr("ord",targetOrd);
			});
			
			//변경된 object ord변경
			var $chgObj = $(item).find('.dplStartOrdCell');
			$chgObj.attr("ord",newIndex+1);
			$chgObj.parent(".dpl_middle_row.dpl_job_row").attr("ord",newIndex+1);
			$chgObj.text(newIndex+1);
	}
	
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
