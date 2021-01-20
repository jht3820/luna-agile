<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm9101">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramJenId" id="paramJenId" value="${param.paramJenId}">
	<input type="hidden" name="paramJobId" id="paramJobId" value="${param.paramJobId}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jenkins">JENKINS</span></label>
				<select class="form-control kt-select2" id="jenId" name="jenId" required>
				</select>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.job">JOB ID(NAME)</span></label>
				<select class="form-control kt-select2" id="jobId" name="jobId" required>
				</select>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobRestoreId">원복 JOB ID</span></label>
				<select class="form-control kt-select2" id="jobRestoreId" name="jobRestoreId">
				</select>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="stm9101.label.tokenKey">TOKEN KEY</span></label>
				<input type="password" class="form-control" placeholder="JOB TOKEN KEY" name="jobTok" id="jobTok" maxlength="200" required/>
			</div>
			<div class="form-group">
				<label><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobParameter">JOB 매개변수</span></label>
				<input type="text" class="form-control" placeholder="JOB 매개변수" name="jobParameter" id="jobParameter" maxlength="100" regexstr="^(?=.*?[a-zA-Z])(?=.*?[0-9])|[a-zA-Z]{2,100}$" regexalert="영문, 숫자 조합 또는 영문 2~100자리 까지 입력 가능"/>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobTypeCd">JOB TYPE</span></label>
						<select class="form-control kt-select2" id="jobTypeCd" name="jobTypeCd">
						</select>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobUseCd">사용 유무</span></label>
						<select class="form-control kt-select2" id="useCd" name="useCd">
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobDesc">JOB 설명</span></label>
				<textarea class="form-control osl-min-h-px--130" name="jobDesc" id="jobDesc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm9101SaveSubmit"><span data-lang-cd="stm9001.button.insert">작성 완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>

<script>
"use strict";
var OSLStm9101Popup = function () {
	
	var formId = 'frStm9101';
	var type = $("#type").val();
	
	// 데이터테이블에서 넘어온 jenId, jobId
	var paramJenId = $("#paramJenId").val();
	var paramJobId = $("#paramJobId").val();
	
	// 기존 job 토큰
	var nowJobTok = "";
	//기존 jobType
	var beforeJobTypeCd ="";
	
	// 버튼 문구 세팅
	$("#stm9101SaveSubmit > span").text($.osl.lang("stm9101.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
    // Private functions
    var documentSetting = function () {
    	
    	// stm9101 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "DPL00002", useYn: "Y",targetObj: "#jobTypeCd", comboType:"OS"}, // job type
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} // 사용유무
		];
    	
		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);

		// textarea 자동 사이즈 조절 설정
    	autosize($("#jobDesc"));
    	
		// 팝업 로드 시 jenkins, job, 원복 job 콤보박스에 선택 문구 추가
		var selectOptionHtml = "<option value=''>"+$.osl.lang("common.name.select")+"</option>";
    	$("#jenId").html(selectOptionHtml);
    	$("#jobId").html(selectOptionHtml);
    	$("#jobRestoreId").html(selectOptionHtml);
    	
		// 등록된 Jenkins 목록 조회하여 select2에 세팅
		fnSelectJenkinsList(type, paramJenId);
		
    	//수정인경우
    	if(type == "update"){
    		// Job 정보 조회
    		selectJobInfo(paramJenId, paramJobId);
    	}
    	
    	// jenkins 선택 변경
    	$("#jenId").change(function(){
    		fnSelectJobList();
    	});
    	
    	// 등록&수정버튼 클릭
    	$("#stm9101SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
			
        	// job 등록&수정
        	submitSaveAction();
    	});
    	
    };

    // Jenkins 목록 조회
    var fnSelectJenkinsList = function(type, paramJenId){
    	
    	//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm9000/stm9000/selectStm9000JenkinsNormalListAjax.do'/>", "loadingShow": false});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			// Jenkins 목록 조회 실패
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				
				// jenkins 목록
				var jenList = data.jenList;
				var jenAppendStr = "";
				
				// 조회된 jenkins 목록이 없을 경우
				if($.osl.isNull(jenList) || jenList.length == 0){
					// jenkins 등록 필요하다는 문구 추가
					jenAppendStr += "<option value=''>"+$.osl.lang("stm9101.message.noExistJenkins")+"</option>";
				}else{
					//선택 한줄 추가
	    			jenAppendStr += "<option value=''>"+$.osl.lang("common.name.select")+"</option>";
					
					// jenkins 목록 추가
					$.each(jenList, function(idx, jenMap){
						
						var selectStr = "";
						// 수정일 경우
						if(type == "update"){
							// 현재 수정대상 job의 jenkins 만 목록에 표시
							if(jenMap.jenId == paramJenId){
								jenAppendStr = "<option value='" + jenMap.jenId + "' selected data-jen-usr-id='"+jenMap.jenUsrId+"' data-jen-usr-tok='"+jenMap.jenUsrTok+"'data-jen-url='"+jenMap.jenUrl+"' >" + jenMap.jenNm + " (" + jenMap.jenUrl + ")" + "</option>";
							}
						}else{
							jenAppendStr += "<option value='" + jenMap.jenId + "' data-jen-usr-id='"+jenMap.jenUsrId+"' data-jen-usr-tok='"+jenMap.jenUsrTok+"'data-jen-url='"+jenMap.jenUrl+"' >" + jenMap.jenNm + " (" + jenMap.jenUrl + ")" + "</option>";
						}
					});
				}
				
				// 조회한 목록을 select2에 세팅한다.
				$("#jenId").html(jenAppendStr);
			}	
		});
		
		//AJAX 전송
		ajaxObj.send();
    }
    
     // Job 정보 단건 조회
	var selectJobInfo = function(paramJenId, paramJobId) {
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm9000/stm9100/selectStm9100JobDetailAjax.do'/>", "async": true}
				,{"jenId": paramJenId, "jobId":paramJobId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				
				var jobInfo = data.jobInfo;
				
				// job 정보 세팅
		    	$.osl.setDataFormElem(jobInfo,"frStm9101", ["jobTok", "jobParameter", "jobDesc"]);
				
				// combobox selected setting
		    	$("#jobTypeCd").val(jobInfo.jobTypeCd).trigger('change.select2');
   				$("#useCd").val(jobInfo.useCd).trigger('change.select2');
		    	
				// 기존 토큰 정보 세팅
		    	nowJobTok = jobInfo.jobTok;
				// 기존 jobType 세팅
				beforeJobTypeCd = jobInfo.jobTypeCd;
				
				// textarea 입력된 내용에 따라 size 조정
				autosize.update($("#jobDesc"));
				
				// job 선택
				fnSelectJobList(jobInfo);
			}	
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
    
  	// job 등록, 수정
    var submitSaveAction = function(){
    	
    	var form = $('#'+formId);
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("stm9101.message.confirm."+type),null,function(result) {
	        if (result.value) {
	        	
	        	// 선택한 jenkins의 정보를 가져온다.
	    		var targetJenkins = $("#jenId > option:selected");
	    		var jenUrl = targetJenkins.data("jen-url");
	    		var jenUsrId = targetJenkins.data("jen-usr-id");
	    		var jenUsrTok = targetJenkins.data("jen-usr-tok");
	        	
	        	var formDataArray = form.serializeArray();
	        	formDataArray.push({name:"jenUrl", value:jenUrl});
	        	formDataArray.push({name:"jenUsrId", value:jenUsrId});
	        	formDataArray.push({name:"jenUsrTok", value:jenUsrTok});
	        	formDataArray.push({name:"nowJobTok", value:nowJobTok});
	        	formDataArray.push({name:"beforeJobTypeCd", value:beforeJobTypeCd});
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm9000/stm9100/saveStm9101JobInfoAjax.do'/>"
	    			, "loadingShow": true}, formDataArray);

	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			
	    			// 등록, 수정 시 jenkins, job 연결 체크 결과 - 연결 체크 오류 발생시 서버에서 코드값이 전달된다.
	    			var connectCheckCode = data.resultCode;
	    			
	    			// jenkins 연결 체크 시 오류 발생
	    			if(!$.osl.isNull(connectCheckCode)){
	    				// 오류내용 alert를 띄우고 팝업은 닫지 않는다.
	    				$.osl.alert(data.resultMessage,{type: 'error'});
	    			
	    			// 등록&수정 실패
	    			}else if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				//모달 창 닫기
						$.osl.layerPopupClose();
	    				
    				// 등록&수정 성공
	    			}else{
	    				$.osl.toastr(data.message);
	    				//모달 창 닫기
	    				$.osl.layerPopupClose();
	    				
	    				if(type == "insert"){
		    				//datatable 조회 - 등록일 경우
		    				$("button[data-datatable-id=stm9100JobTable][data-datatable-action=select]").click();
	    				}else{
	    					// 수정시 현재페이지 유지한채로 재조회
	    					$.osl.datatable.list["stm9100JobTable"].targetDt.reload();	
	    				}
	    			}
	    		});
	    		
	    		//AJAX 전송
	    		ajaxObj.send();
	        }
	    });
		
    };
    
    // jenkins에 등록된 job 목록 조회
    var fnSelectJobList = function(paramJobInfo){
    	
    	var selectJenId = $("#jenId").val();
    	// job 수정일 경우
    	if(!$.osl.isNull(paramJobInfo)){
    		selectJenId = paramJobInfo.jenId;
    	}
    	
    	var target = $('#'+formId);
    	
    	// 선택된 jenkins Id가 없을 경우
    	if($.osl.isNull(selectJenId)){
    		// 입력영역 모두 disable, 버튼 disable
    		target.find("input").attr("readonly", true);
    		target.find("select").attr("disabled", true);
    		$("#stm9101SaveSubmit").attr("disabled", true);
    		
    		// jenkins 선택만 활성화
    		target.find("select#jenId").attr("disabled", false);
    	}else{
    		
    		// 비활성화된 입력영역 활성화
    		target.find("input").attr("readonly", false);
    		target.find("select").attr("disabled", false);
    		$("#stm9101SaveSubmit").attr("disabled", false);
    		
    		// 선택한 jenkins의 정보를 가져온다.
    		var targetJenkins = $("#jenId > option:selected");
    		var jenUrl = targetJenkins.data("jen-url");
    		var jenUsrId = targetJenkins.data("jen-usr-id");
    		var jenUsrTok = targetJenkins.data("jen-usr-tok");

    		// job 수정일 경우 jenkins 정보 세팅
    		if(!$.osl.isNull(paramJobInfo)){
    			jenUrl = paramJobInfo.jenUrl;
   				jenUsrId = paramJobInfo.jenUsrId;
				jenUsrTok = paramJobInfo.jenUsrTok;
    		}
    		
    		// 조회 파라미터
    		var param = {
    				"jenId" : selectJenId
    				,"jenUrl" : jenUrl 
    				,"jenUsrId" : jenUsrId
    				,"jenUsrTok" : jenUsrTok
			};
    		
    		// 선택 jenkins의 job 목록 및 원복 job 목록가져오기
    		//AJAX 설정
    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm9000/stm9000/selectStm9000URLConnect.do'/>"
    			, "loadingShow": false}, param);

    		//AJAX 전송 성공 함수
    		ajaxObj.setFnSuccess(function(data){
    			
    			// jenkins 연결 결과값
    			var jenConnectCheckCode = data.resultCode;
    			
    			var appendStr = "<option value=''>"+$.osl.lang("common.name.select")+"</option>";;
    			// job 목록에 선택 추가
    			var jobAppendStr = appendStr;
    			var restoreAppendStr = appendStr;
    			
    			// jenkins 연결 체크 시 오류 발생
    			if(jenConnectCheckCode == "JENKINS_FAIL"){
    				// 오류내용 alert를 띄우고 팝업은 닫지 않는다.
    				$.osl.alert(data.resultMessage,{type: 'error'});
    			
				// jenkins 연결 성공
    			}else if(jenConnectCheckCode == "JENKINS_OK"){
    				
    				// job list
    				var jobList = data.jobList;
    				// 원복 job list
    				var jobRestoreList = data.jobRestoreList;
    				
    				//jobId, jobRestoreId담을 변수
    				var jobArray = [];
    				var jobRestoreArray = [];
    				
    				// 원복 job 세팅
    				if(!$.osl.isNull(jobRestoreList)){
    					
    					// job 목록 loop
    					$.each(jobRestoreList,function(idx, map){
    						// Id담기
    						jobArray.push(map.jobId); // 이미 등록된 job인지 체크하기 위한 값
    						jobRestoreArray.push(map.jobRestoreId);
    					});
    					
    					// 원복 job loop
    					$.each(jobRestoreList, function(idx, map){
    						
    						// 원복 job일 경우
    						if(map.jobTypeCd == "03"){
    							var selectStr = "";
    							//현재 선택된 JOB ID를 제외
    							if(paramJobInfo.jobRestoreId != map.jobId){
    								//이미 원복 ID로 지정된 JOB은 제외
    								if(jobRestoreArray.indexOf(map.jobId) != -1){
    									return true;
    								}
    							}else{
    								selectStr = "selected";
    							}
    							
    							restoreAppendStr += '<option value="'+$.osl.escapeHtml(map.jobId)+'" '+selectStr+'>'+map.jobId+'</option>';
    						}
    					});
    					
    					// 원복 job 목록 추가
    					$("#jobRestoreId").html(restoreAppendStr);
    				}
    				
    				// job list 세팅
    				if(!$.osl.isNull(jobList)){
    					
    					// job 목록 추가
    					$.each(jobList, function(idx, map){
    						
    						// 수정일 경우
    						if(type == "update"){
    							if(map.name == paramJobId){
	    							// 현재 job 만 표시되도록
	    							jobAppendStr = '<option value="'+$.osl.escapeHtml(map.name)+'">'+$.osl.escapeHtml(map.name)+'</option>';
	    							return false;
    							}
    						}else{
    							// 이미 등록된 JOB일 경우 제외한다.
    							if(jobArray.indexOf(map.name) != -1){
    								return true;
    							}
	    						jobAppendStr += '<option value="'+$.osl.escapeHtml(map.name)+'">'+$.osl.escapeHtml(map.name)+'</option>';
    						}
    					});
    				}
    			}
    			
    			// 조회한 job 목록을 select2에 세팅한다.
				$("#jobId").html(jobAppendStr);
    			
    		});
    		
    		//AJAX 전송
    		ajaxObj.send();
    	}
    	
    };
    
    // 입력영역 및 버튼 활성&비활성
    var fnElementActivate = function(isActive){
    	
    }
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

//Initialization
$.osl.ready(function(){
	OSLStm9101Popup.init();
});

	
</script>