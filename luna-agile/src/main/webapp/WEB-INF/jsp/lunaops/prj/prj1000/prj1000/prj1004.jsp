<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<title>OpenSoftLab</title>
<style>
.projectCopyFrame {font-size:10pt;width: 1460px;background-color: #fff;min-height: 705px;max-height:800px;overflow-y:auto;border: 1px solid #ccc;border-radius: 5px;padding: 10px;}
.sw-btn-prev,.sw-btn-next, .prj1000_close{width: 120px;height: 40px;line-height: 36px;text-align: center;font-weight: bold;display: inline-block;border-radius: 5px;box-shadow: 1px 1px 1px #ccd4eb;border: 1px solid #b8b8b8;cursor: pointer;background-color: #fff;color: #000;margin:5px;}
.sw-btn-prev.disabled,.sw-btn-next.disabled{background-color: #d2d2d2;}
div.step-mainLayout {min-height: 580px !important;width: 100%;display: inline-block !important;border-bottom: 1px solid #ddd;border-top: none;max-height: 655px;overflow-y: auto;font-size: 9pt;}
div.step-mainLayout > div {padding: 10px !important;height: 100%;width: 100%;float: left;}
.sw-theme-arrows > ul.step-anchor{border:1px solid #ddd;}
.prj1004_chk {position: relative;width: 38px;text-align: center;float: left;height: 100%;padding-top: 15px;border-right: 1px solid #ccc;}
.prj1004_chk input[type="checkbox"] {margin:0; opacity: 0; position: absolute; z-index: 2; width: 100%;height: 100%;left: 0;top:0;}
.prj1004_chk input[type="checkbox"]+label { display: inline-block; width: 18px; height: 18px; background: url(/images/contents/normal_check.png) no-repeat; font-size: 1em; line-height: 24px; vertical-align: middle; cursor: pointer; z-index: 1; border-radius: 3px;}
.prj1004_chk input[type="checkbox"]:checked+label { display: inline-block; width: 18px; height: 18px; background: url('/images/contents/normal_check_on.png') no-repeat; line-height: 24px; vertical-align: middle; cursor: pointer; }
.prj1004_authGrpChk {position: relative;width: 38px;text-align: left;float: left;height: 100%;padding-top: 10px;padding-left:5px;border-right: 1px solid #ccc;}
.prj1004_authGrpChk input[type="checkbox"] {margin:0; opacity: 0; position: absolute; z-index: 2; width: 100%;height: 100%;left: 0;top:0;}
.prj1004_authGrpChk input[type="checkbox"]+label { display: inline-block; width: 18px; height: 18px; background: url(/images/contents/normal_check.png) no-repeat; font-size: 1em; line-height: 24px; vertical-align: middle; cursor: pointer; z-index: 1; border-radius: 3px;}
.prj1004_authGrpChk input[type="checkbox"]:checked+label { display: inline-block; width: 18px; height: 18px; background: url('/images/contents/normal_check_on.png') no-repeat; line-height: 24px; vertical-align: middle; cursor: pointer; }
div.copyProcess_box {width: 169px !important;float: left;border-bottom:none !important;}
.processListBoxFrame {width: 100%;height: 50px;border-bottom: 1px solid #ccc;}
#projectWizrdComplete{display:none;}
td.copyAuthGrp_titleBox {width: 100%;height: 40px;text-align: center;line-height: 40px;border-bottom: 1px solid #ccc;font-size: 10pt;font-weight: bold;background-color: #848484;color: #fff;}
.authGrpCheckbox{padding:0;background-color: #fff !important;}
.prj1004_doc_leftDiv {float: left;width: 200px;height: 100%;margin-right: 10px;border: 1px solid #ccc;}
.prj1004_docMainTitle {width: 100%;height: 40px;text-align: center;line-height: 40px;border-bottom: 1px solid #ccc;font-size: 10pt;font-weight: bold;background-color: #848484;color: #fff;position: relative;}
.prj1004_prjListBoxFrame{height: 40px;text-align: center;line-height: 40px;border-bottom: 1px solid #ccc;cursor: pointer;}
.prj1004_docPrjSelRadio {width: 30px;border-right: 1px solid #ccc;height: 100%;float: left;}
.prj1004_clsPrjInfo, .prj1004_docPrjInfo {height: 100%;float: left;text-align: center;width: 168px;font-size:9pt;}
.prj1004_clsPrjInfo:hover, .prj1004_docPrjInfo:hover{background-color: #f9f9f9;color: #000;}
.prj1004_clsPrjInfo.active, .prj1004_docPrjInfo.active{background: #4b73eb;color: #fff;}
.prj1004_doc_middleDiv {float: left;width: 300px;margin-right: 10px;}
.prj1004_doc_rightDiv {float: left;width: 900px;}
div.copyProcess_box:hover{background-color: #f9f9f9;color: #000;}
.prj1004_prjListBoxFrame:last-child {border-bottom: none;}
.prj1004_docMenuBox {border: 1px solid #ccc;border-top: none;width: 100%;min-height: 500px;overflow: auto;}
.prj1004_menuBtn{float: left;width: 25px;margin: 7px 5px;padding: 5px;height: 25px;line-height: 10px;display: inline-block;border: 1px solid #fff;cursor: pointer;}
.prj1004_docMenuBtnDiv {position: absolute;right: 0;}
.prj1004_menuBtn:hover {background-color: #414352;}
.prj1004_selDocInfo {width: 100%;min-height: 500px;font-size:9pt;}
textarea[readonly] {background-color: #eee;}
input[type="radio"]+label:before{left:8px !important;border: 1px solid #999999 !important;top: -8px !important;}
.layer_popup_box input[type="radio"]:checked+label:after{top:-4px !important;left:12px !important;}
.prjGrpSelected{display:none;}
</style>

<script type="text/javascript">
//생성 마법사 정보 배열
var wizardFormDataArray;
//프로세스
var $wizardFlowChart;
//zoom
var wizardCurrentZoom = 1;
var wizardProcessJsonList = {};
var selCopyFlowId = null;
//zTree
var prj1004DocZTree;
var prj1004ClsZTree;
// 조회되는 프로젝트 목록을 구분하기 위한 type값
var pageType = '<c:out value="${param.pageType}"/>';

//팝업 guide 제어
globals_guideChkFn = fnPrj1004GuideShow;

$(document).ready(function() {
	/* 	
	*	공통코드 가져올때 한번 트랜잭션으로 여러 코드 가져와서 셀렉트박스에 세팅하는 함수(사용 권장)
	* 	1. 공통 대분류 코드를 순서대로 배열 담기(문자열)
	*	2. 사용구분 저장(Y: 사용중인 코드만, N: 비사용중인 코드만, 그 외: 전체)
	*	3. 공통코드 적용할 select 객체 직접 배열로 저장
	* 	4. 공통코드 가져와 적용할 콤보타입 객체 배열 ( S:선택, A:전체(코드값 A 세팅한 조회조건용), N:전체, E:공백추가, 그 외:없음 )
	*	5. 동기 비동기모드 선택 (true:비동기 통신, false:동기 통신)
	*	마스터 코드 = REQ00001:요구사항 타입, REQ00002:중요도 , CMM00001:
	*/
	var mstCdStrArr = "PRJ00013";
	var strUseYn = 'Y';
	var arrObj = [$("#wizard_prjType")];
	var arrComboType = ["",""];
	getMulticommonCodeDataForm(mstCdStrArr, strUseYn, arrObj, arrComboType , false);
	
	// 프로젝트 유효성
	var prjValidateArr = {"wizard_prjNm":{"type":"length","msg":"프로젝트 명은 200byte까지 입력이 가능합니다.",max:200}
						,"wizard_prjAcrm":{"type":"length","msg":"프로젝트 약어는 10byte까지 입력이 가능합니다.",max:10}
						,"wizard_prjDesc":{"type":"length","msg":"프로젝트 설명은 4000byte까지 입력이 가능합니다.",max:4000}
						,"wizard_ord":{"type":"number"}};
	
	// 프로젝트 약어 영문 숫자여부 체크
	var prjValidateArr2 = {"wizard_prjAcrm":{"type":"english","engOption":"includeNumber"}};
	
	// 프로젝트 유효성 체크
	gfnInputValChk(prjValidateArr);
	gfnInputValChk(prjValidateArr2);
	
	//formData 초기화
	wizardFormDataArray = {};
	
	//단계별 form 초기화
	$("#form-step-0")[0].reset();
	
	/****************************
	******** 프로젝트 정보 세팅
	****************************/
	//단계 버튼 생성
	var btnAccept = $('<div></div>').html("<i class='fa fa-save'></i>&nbsp;완료")
											.attr("id","projectWizrdComplete")
											.attr("guide","projectWizrdComplete")
                                            .addClass('button_complete prj1000_close')
                                            .on('click', projectWizardFrameDone);
	
	var btnCancel = $('<div></div>').html("<i class='fa fa-times'></i>&nbsp;닫기")
											.attr("guide","projectWizrdClose")
                                            .addClass('button_complete prj1000_close')
                                            .on('click', projectWizardFrameClose);
	
	
	// 프로젝트 약어 입력 keyup 이벤트
	$("#wizard_prjAcrm").keyup(function(e){
		 var inputVal = $("#wizard_prjAcrm").val();
		 // 입력된 값을 대문자로 변환
	 	$("#wizard_prjAcrm").val(inputVal.toUpperCase());
	});
	
	/****************************
	******** 프로세스 정보 세팅
	****************************/
	//프로세스 정보 생성
	$wizardFlowChart = $('#processCopyFlowChartDiv');
	//프로세스 목록
	fnProcessWizardListCall();
	
	//작업흐름 그리기
	fnWizardFlowChartDraw();
	
	//zoom setting
	fnWizardFlowChartLayerZoom();
	
	$("#copyFlowTitleBgColor").spectrum({showInput: true,chooseText: "선택",cancelText: "닫기",preferredFormat: "name",color: "#515769"});
	$("#copyFlowTitleColor").spectrum({showInput: true,chooseText: "선택",cancelText: "닫기",preferredFormat: "name",color: "#FFFFFF"});
	$("#copyFlowContentBgColor").spectrum({showInput: true,chooseText: "선택",cancelText: "닫기",preferredFormat: "name",color: "#FFFFFF"});
	$("#copyFlowContentColor").spectrum({showInput: true,chooseText: "선택",cancelText: "닫기",preferredFormat: "name",color: "#515769"});
	
	//추가 항목 관리 목록
	fnCopyFlowOptGridSetting();
	
	//프로세스 조회 버튼
	$("#btn_insert_copyProSelect").click(function(){
		fnProcessWizardListCall();
	});
	
	//역할그룹 조회 버튼
	$("#btn_select_prjAuth").click(function(){
		fnAuthGrpWizardListCall();
	});
	
	/****************************
	******** 역할그룹 정보 세팅
	****************************/
	//역할그룹 목록 세팅
	fnAuthGrpWizardListCall();
	
	/****************************
	******** 개발문서 양식 정보 세팅
	****************************/
	var prjListUrl = "<c:url value='/prj/prj1000/prj1000/selectPrj1000AdminPrjList.do'/>";
	// 전체 프로젝트 생성관리에서 프로젝트 마법사 팝업 호출시
	if(pageType == "systemAdmin"){
		prjListUrl = "<c:url value='/stm/stm4000/stm4000/selectStm4000LicGrpAdminPrjListAjax.do'/>";
	}
	
	//프로젝트 목록 세팅
	fnProjectWizardListCall(prjListUrl);
	
	// 메뉴 관리 전체 열기
	$("#prj1004_menu_expand_all").click(function(){
		if(!gfnIsNull(prj1004DocZTree)){
			prj1004DocZTree.expandAll(true);
		}
	});

	// 메뉴 관리 전체 닫기
	$("#prj1004_menu_collapse_all").click(function(){
		if(!gfnIsNull(prj1004DocZTree)){
			prj1004DocZTree.expandAll(false);
		}
	});
	
	// 메뉴 관리 전체 열기
	$("#prj1004_clsMenu_expand_all").click(function(){
		if(!gfnIsNull(prj1004ClsZTree)){
			prj1004ClsZTree.expandAll(true);
		}
	});

	// 메뉴 관리 전체 닫기
	$("#prj1004_clsMenu_collapse_all").click(function(){
		if(!gfnIsNull(prj1004ClsZTree)){
			prj1004ClsZTree.expandAll(false);
		}
	});
	/****************************
	******** 마법사 세팅
	****************************/
	//단계 선언
	$('#projectCopyFrame').smartWizard({
                   selected: 0,
                   theme: 'arrows',
                   transitionEffect:'fade',
                   keyNavigation:false,
                   backButtonSupport:false,
                   toolbarSettings: {toolbarPosition: 'bottom',
                   					toolbarButtonPosition:'right',
                                     toolbarExtraButtons: [btnAccept,btnCancel]
                                   },
                   lang:{next:"다음 단계&nbsp;<i class='fa fa-arrow-right'></i>", previous:"<i class='fa fa-arrow-left'></i>&nbsp;이전 단계"},
                });
	//단계 제어
	$("#projectCopyFrame").on("leaveStep", function(e, anchorObject, stepNumber, stepDirection) {
		if(stepDirection === 'forward'){
			var elmForm = $("#form-step-" + stepNumber);
			
			//프로젝트
			if(stepNumber == 0 && elmForm){
				//프로젝트 그룹 선택 체크
				if($("#wizard_prjGrpNm_txt").val() == -1){
					jAlert("프로젝트 그룹을 선택해주세요.","알림");
					return false;
				}
				
				/* 필수입력값 체크 공통 호출 */
				var strFormId = "form-step-" + stepNumber;
				var strCheckObjArr = ["wizard_prjNm", "wizard_startDt", "wizard_endDt", "wizard_ord","wizard_prjAcrm"];
				var sCheckObjNmArr = ["프로젝트 명", "시작일자", "종료일자", "정렬 순서","약어"];
					
				//필수 값 확인
				if(gfnRequireCheck(strFormId, strCheckObjArr, sCheckObjNmArr)){
					return false;	
				}

				// 프로젝트 약어 유효성
				var prjArcmValidate = {"wizard_prjAcrm":{"type":"regExp","pattern":/^(?=.*?[A-Z])(?=.*?[0-9])|[A-Z]{3,10}$/ ,"msg":"프로젝트 약어는 영문 대문자 또는 영문 대문자, 숫자 조합으로 3~10자만 사용 가능합니다.", "required":true}};
				
				// 프로젝트 정보 다음단계 이동 전 약어 유효성 검사
				if(!gfnSaveInputValChk(prjArcmValidate)){
					return false;	
				}
				
				// 프로젝트 정보 다음단계 이동 전 유효성 검사
				if(!gfnSaveInputValChk(prjValidateArr)){
					return false;	
				}

				//error있는경우 오류
				if($(".inputError").length > 0){
					jAlert("유효하지 않은 값이 입력된 항목이 존재합니다.<br>항목을 확인해주세요.","알림");
					$(".inputError")[0].focus()
					return false;
				}
				
				//data setting
				var formInfoArray = elmForm.serializeArray();
				
				//jsonArray to json Map
				var formInfo = {};
				$.each(formInfoArray,function(idx, map){
					formInfo[map.name] = map.value;
				});
				
				//그룹 Id넣기
				formInfo["wizrd_prjGrpId"] = $("#wizard_prjGrpNm_txt").val();
				wizardFormDataArray["project"] = formInfo;
			}
			//프로세스
			if(stepNumber == 1){
				//선택 프로세스 객체
				var processChkList = $("input[type=checkbox][id^=PROCHK_]:checked");
				
				//선택 갯수 체크
				if(processChkList.length == 0){
					jConfirm("선택된 프로세스가 없습니다.</br>계속 진행하시겠습니까?","알림",function(result){
						if(result){
							$("#projectCopyFrame").smartWizard("goToNext");
							return true;
						}
					});
					return false;
				}else{
					var jsonInfo = {};
					//체크 프로세스 id와 Data가져오기
					$.each(processChkList,function(idx, map){
						var processId = $(map).attr("processid");
						//프로세스 추가 정보
						var prjId = $(map).attr('prjId');
						var processNm = $(map).attr('processnm');
						var processDesc = $(map).attr('desc');
						var processOrd = $(map).attr('ord');
						
						//jsonInfo[processId] = $.extend({prjId: prjId, processId: processId, processNm: processNm, processDesc: processDesc, processOrd:processOrd},{processJsonData: wizardProcessJsonList[processId]});
						jsonInfo[processId] = $.extend({prjId: prjId, processId: processId, processNm: processNm, processDesc: processDesc, processOrd:processOrd},{processJsonData: wizardProcessJsonList[prjId+"_"+processId]});

					});
					
					wizardFormDataArray["process"] = jsonInfo;
				}
			}
			//역할그룹
			if(stepNumber == 2){
				//선택 역할그룹 객체
				var authGrpChkList = $("input[type=checkbox][id^=AUTHGRPCHK_]:checked");
				
				//선택 갯수 체크
				if(authGrpChkList.length == 0){
					jConfirm("선택된 역할그룹이 없습니다.</br>계속 진행하시겠습니까?","알림",function(result){
						if(result){
							$("#projectCopyFrame").smartWizard("goToNext");
							return true;
						}
					});
					return false;
				}else{
					var jsonInfo = [];
					//체크 역할그룹 id가져오기
					$.each(authGrpChkList,function(idx, map){
						//역할그룹 추가 정보
						var authGrpId = $(map).attr("authgrpid");
						var prjId = $(map).attr('prjId');
						
						jsonInfo.push({prjId: prjId, authGrpId: authGrpId});

					});
					
					wizardFormDataArray["authGrp"] = jsonInfo;
				}
			}
			//개발문서 양식
			if(stepNumber == 3){
				//선택 개발문서 프로젝트
				var docSelId = $("input[type=radio][name=prj1004DocumentRadio]:checked").val();
				
				wizardFormDataArray["document"] = docSelId;
			}
		}
		return true;
	});

	//단계 오픈시
	$("#projectCopyFrame").on("showStep", function(e, anchorObject, stepNumber, stepDirection) {
		//마지막 단계에서만 완료 버튼 생성
		if(stepNumber == 4){
			$("#projectWizrdComplete").css({"display":"inline-block"});
		}else{
			$("#projectWizrdComplete").hide();
		}
		
		//역할그룹 페이지 갱신
		if(stepNumber == 2){
			$(".authGrpSelTr.table_active").removeClass("table_active");
			//기존 조회 정보 모두 제거
    		$("#authTblBody").children().remove();
		}
	});
	
	//단계 초기화
	$('#projectCopyFrame').smartWizard("reset");
});

/* 프로젝트 생성 마법사 창 닫기 */
function projectWizardFrameClose(){
	jConfirm("입력된 정보가 모두 초기화됩니다.</br>마법사를 종료하시겠습니까?","경고",function(result){
		if(result){
			gfnLayerPopupClose();
		}
	});
}

//flowchart 선언
function fnWizardFlowChartDraw(){
	//작업흐름 flowchart 그리기
	$wizardFlowChart.flowchart({
		multipleLinksOnInput:false,
		multipleLinksOnOutput:false,
		canUserEditLinks:false,
		canUserMoveOperators:false,
		distanceFromArrow:1,
		linkWidth:5,
		//작업흐름 선택
		onOperatorSelect:function(selFlwId){
			//선택 작업흐름 Id
			selCopyFlowId = selFlwId;
			
			//데이터 불러오기
			var selFlowData = $wizardFlowChart.flowchart('getOperatorData',selCopyFlowId);
			var selFlowPro = selFlowData.properties;
			
			//선택 작업흐름 정보 세팅
			$("#copyFlowNm").val(selFlowPro.title);
			
			//제목,글씨 색상
			$("#copyFlowTitleBgColor").spectrum({showInput: true,chooseText: "선택",cancelText: "닫기",preferredFormat: "name",color: selFlowPro.flowTitleBgColor});
			$("#copyFlowTitleColor").spectrum({showInput: true,chooseText: "선택",cancelText: "닫기",preferredFormat: "name",color: selFlowPro.flowTitleColor});
			$("#copyFlowContentBgColor").spectrum({showInput: true,chooseText: "선택",cancelText: "닫기",preferredFormat: "name",color: selFlowPro.flowContentBgColor});
			$("#copyFlowContentColor").spectrum({showInput: true,chooseText: "선택",cancelText: "닫기",preferredFormat: "name",color: selFlowPro.flowContentColor});
			
			//체크 박스
			if(selFlowPro.flowEssential == "on"){	//필수
				$("#copyFlowEssential")[0].checked = true;
			}else{
				$("#copyFlowEssential")[0].checked = false;
			}
			if(selFlowPro.flowSign == "on"){		//결재
				$("#copyFlowSign")[0].checked = true;
			}else{
				$("#copyFlowSign")[0].checked = false;
			}
			if(selFlowPro.flowSignStop == "on"){		//결재 반려종료
				$("#copyFlowSignStop")[0].checked = true;
			}else{
				$("#copyFlowSignStop")[0].checked = false;
			}
			if(selFlowPro.flowEnd == "on"){			//종료분기
				$("#copyFlowEnd")[0].checked = true;
			}else{
				$("#copyFlowEnd")[0].checked = false;
			}
			if(selFlowPro.flowWork == "on"){			//작업
				$("#copyFlowWork")[0].checked = true;
			}else{
				$("#copyFlowWork")[0].checked = false;
			}
			if(selFlowPro.flowRevision == "on"){			//리비전
				$("#copyFlowRevision")[0].checked = true;
			}else{
				$("#copyFlowRevision")[0].checked = false;
			}
			if(selFlowPro.flowDpl == "on"){			//배포계획
				$("#copyFlowDpl")[0].checked = true;
			}else{
				$("#copyFlowDpl")[0].checked = false;
			}
			if(selFlowPro.flowAuth == "on"){			//배포계획
				$("#copyFlowAuth")[0].checked = true;
				$(".copyFlw_auth_frame").show();
			}else{
				$("#copyFlowAuth")[0].checked = false;
				$(".copyFlw_auth_frame").hide();
			}
			//추가 항목 목록 불러오기
			fnCopyFlowOptList(selFlwId);
			
			//허용 역할그룹 세팅
			fnCopyAuthListGrid();
			
			//허용 역할그룹 목록
			fnCopyAuthRefresh(selCopyFlowId,'01',copyAuthGrid);
			fnCopyAuthRefresh(selCopyFlowId,'02',copySignAuthGrid);
			
			//마스크 해제
			$("#copyFlowContentMask").hide();
			return true;
		},
		//작업흐름 포커스 잃었을때
		onOperatorUnselect:function(){
			//form 내용 초기화
			$("#processStepFrm")[0].reset();
			
			//마스크 설정
			$("#copyFlowContentMask").show();
			
			selCopyFlowId = null;
			return true;
		},
	});
}

//flowchart zoom
function fnWizardFlowChartLayerZoom(){
	if(!gfnIsNull($wizardFlowChart)){
		var cx = $wizardFlowChart.width() / 2;
	    var cy = $wizardFlowChart.height() / 2;
	    
	    $wizardFlowChart.panzoom();
    
	    // Centering panzoom
	    $wizardFlowChart.panzoom('pan', 0, 0);
	    
	}
}


//flowchart zoom function
function fnCopyFlowChartZoom(type){
	//줌 초기화
	if(type == "reset"){
		wizardCurrentZoom=1;
		$wizardFlowChart.flowchart('setPositionRatio', 1);
		$wizardFlowChart.panzoom('reset');
		return false;
	}
	//줌 가능한 수치
	var possibleZooms = [2,1,0.75,0.5];
	
	//줌인
	if(type == "in"){
		wizardCurrentZoom--;
		if(wizardCurrentZoom < 0){
			wizardCurrentZoom = 0;
		}
	}
	//줌아웃
	else if(type == "out"){
		wizardCurrentZoom++;
		if(wizardCurrentZoom > (possibleZooms.length-1)){
			wizardCurrentZoom = (possibleZooms.length-1);
		}
	}
	
	$wizardFlowChart.flowchart('setPositionRatio', possibleZooms[wizardCurrentZoom]);
	        
    $wizardFlowChart.panzoom('zoom',(possibleZooms[wizardCurrentZoom]), {
        animate: true
    });
}

//프로세스 목록 불러오기
function fnProcessWizardListCall(){
	
	var data = {};
	// 전체 프로젝트 생성관리에서 마법사 팝업 호출시
	// 라이선스 그룹의 모든 프로젝트에서 프로세스를 불러온다.
	if(pageType == "systemAdmin"){
		data = {"selectType":pageType};
	}
	
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/prj/prj1000/prj1100/selectFlw1000ProcessCopyList.do'/>"}, data);
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		/* toast.push(data.message); */
		
		//에러 없는경우
		if(data.errorYN != "Y"){
			//마법사 데이터 초기화
			//wizardFormDataArray["process"] = {};
			
			//기본 프로세스 목록
			var rootProcessList = data.rootProcessList;
			
			//프로세스 목록
			var processCopyList = data.processCopyList;
			
			//프로세스 목록 세팅
			$("#processCopyBoxList").html('');
			
			//form 내용 초기화
			$("#processStepFrm")[0].reset();
			
			//추가 항목 목록 초기화
			//copyFlowOptGrid.setData([]);
			
			//flowchart 생성 된 경우 초기화
			if(!gfnIsNull($wizardFlowChart)){
				//flowchart 그리기
				$wizardFlowChart.flowchart('setData', {});
				//차트 선택 해제
				$wizardFlowChart.flowchart('unselectOperator');
			}
			
			//jsonData 초기화
			wizardProcessJsonList = {};
			
			//기본 프로세스 목록 출력
			$("#processCopyBoxList").append('<div class="copyProject_titleBox">기본 프로세스</div>');
			
			$.each(rootProcessList,function(idx, map){
				//JsonData 적재
				wizardProcessJsonList[map.prjId+"_"+map.processId] = map.processJsonData;
				
				firstClassStr = "";
				/* 
				//첫번째 프로세스 선택
				if(idx == 0){
					firstClassStr = " active";
					
					var jsonData = {};
				
					//jsonData가 null이 아닌경우 세팅
					if(!gfnIsNull(map.processJsonData)){
						jsonData = JSON.parse(map.processJsonData);
					}
					
					//데이터 그리기
					$wizardFlowChart.flowchart('setData', jsonData);
				}
				 */				 
				$("#processCopyBoxList").append(
						'<div class="processListBoxFrame">'
						+'<div class="prj1004_chk"><input type="checkbox" title="'+map.processNm+'" id="PROCHK_'+map.processId+'" name="PROCHK_'+map.processId+'" processid="'+map.processId+'" prjid="'+map.prjId+'" processnm="'+map.processNm+'" desc="'+map.processDesc+'" ord="'+map.processOrd+'"/><label for="PROCHK_'+map.processId+'"></label></div>'						
						+'<div class="copyProcess_box'+firstClassStr+'" id="'+map.processId+'" title="'+decodeURI(map.processDesc)+'" prjid="'+map.prjId+'">'
						+map.processNm+'</div></div>');
			});
			
			var loopPrjId = null;

			//프로세스 목록 loop
			$.each(processCopyList,function(idx, map){
				//JsonData 적재
				// 프로세스 ID가 동일한 경우가 있으므로 프로젝트 ID와 프로세스ID를 조합
				// - 프로세스 ID 동일 케이스 : 서로 다른 프로젝트에서 같은 날 프로세스 생성 시 프로세스 ID가 동일하게됨 
				wizardProcessJsonList[map.prjId+"_"+map.processId] = map.processJsonData;

				if(loopPrjId != map.prjId){
					$("#processCopyBoxList").append('<div class="copyProject_titleBox">'+map.prjNm+'</div>');
				}
				
				$("#processCopyBoxList").append(
						'<div class="processListBoxFrame">'
						+'<div class="prj1004_chk"><input type="checkbox" title="'+map.processNm+'" id="PROCHK_'+map.processId+'" name="PROCHK_'+map.processId+'" processid="'+map.processId+'" prjid="'+map.prjId+'" processnm="'+map.processNm+'" desc="'+map.processDesc+'" ord="'+map.processOrd+'"/><label for="PROCHK_'+map.processId+'"></label></div>'
						+'<div class="copyProcess_box" id="'+map.processId+'" title="'+decodeURI(map.processDesc)+'" prjid="'+map.prjId+'">'
						+map.processNm+'</div></div>');
				loopPrjId = map.prjId;
			});
			
			//click event 제거
			$("#processCopyBoxList .copyProcess_box").off("click");
			
			//프로세스 active 제어
			$("#processCopyBoxList .copyProcess_box").click(function(){
				$(".copyProcess_box.active").removeClass("active");
				$(this).addClass("active");
				
				//선택 프로세스에 해당하는 작업흐름 데이터 가져오기
				var prjid = $(".copyProcess_box.active").attr('prjid');
				var processId = $(".copyProcess_box.active").attr('id');
				
				// 프로세스 ID가 동일한 경우가 있으므로 프로젝트 ID와 프로세스 ID를 조합하여 사용
				// - 프로세스 ID 동일 케이스 : 서로 다른 프로젝트에서 같은 날 프로세스 생성 시 프로세스 ID가 동일하게됨 
				var jsonProcessId = prjid+"_"+processId;
				
				var jsonData = {};
				if(!gfnIsNull(wizardProcessJsonList[jsonProcessId])){
					jsonData = JSON.parse(wizardProcessJsonList[jsonProcessId]);
				}
				
				//flowchart 그리기
				$wizardFlowChart.flowchart('setData', jsonData);
				
				//form 내용 초기화
				$("#processStepFrm")[0].reset();
				
				//차트 선택 해제
				$wizardFlowChart.flowchart('unselectOperator');
				
				return true;
			});
		}
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림");
 	});
	//AJAX 전송
	ajaxObj.send();
}


//추가 항목 불러오기
function fnCopyFlowOptList(selFlwId){
	//선택 작업흐름 프로젝트 id
	var prjId = $(".copyProcess_box.active").attr('prjid');
	
	//선택 프로세스에 해당하는 작업흐름 데이터 가져오기
	var processId = $(".copyProcess_box.active").attr('id');
	
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100OptListAjax.do'/>",loadingShow:false},
			{prjId: prjId, processId: processId, flowId: selFlwId, type:"prj1100"});
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		//에러 없는경우
		if(data.errorYN != "Y"){
			//추가 항목 목록 세팅
			if(!gfnIsNull(data.optList)){
				copyFlowOptGrid.setData(data.optList);
			}else{
				//결과 값 없는 경우 목록 초기화
				copyFlowOptGrid.setData([]);
			}
		}else{
			toast.push(data.message);
		}
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림");
 	});
	//AJAX 전송
	ajaxObj.send();
}

//axisj5 그리드
function fnCopyFlowOptGridSetting(){
	copyFlowOptGrid = new ax5.ui.grid();
 
       copyFlowOptGrid.setConfig({
           target: $('[data-ax5grid="copyFlw-grid"]'),
           sortable:true,
           header: {align:"center",columnHeight: 30},
           columns: [
			{key: "itemEssentialCd", label: "필수", width: 100, align: "center"
			,formatter:function(){return (this.item.itemEssentialCd=="01")?"Y":"N";}},
			{key: "itemModifyCd", label: "수정", width: 100, align: "center"
			,formatter:function(){return (this.item.itemModifyCd=="01")?"Y":"N";}},
            {key: "itemNm", label: "항목 명", width: 200, align: "center"},
            {key: "itemCode", label: "추가 항목 분류", width: 150, align: "center"
			,formatter:function(){
			//02 '공통코드'인경우 해당 공통코드로 공통코드명 가져오기
			var rtnStr = "";
			//공통 코드 인경우
			if(this.item.itemCode == "01"){
				rtnStr = "기타";
			}
			//공통 코드 인경우
			else if(this.item.itemCode == "02"){
				rtnStr = "[공통]"+this.item.itemCommonCodeStr;
			}
			//기타
			else{
				rtnStr = this.item.itemCodeStr;
			}
			return rtnStr;
			}},
			{key: "itemTypeStr", label: "항목 타입", width: 120, align: "center"
            	,formatter:function(){
					//02 '공통코드'인경우 해당 공통코드로 공통코드명 가져오기
					var rtnStr = this.item.itemTypeStr;
					
					//공통 코드 인경우
					if(this.item.itemCode == "02"){
						rtnStr = "콤보 박스(select)";
					}
					//타입 없는경우
					else if(gfnIsNull(rtnStr)){
						rtnStr = this.item.itemCodeStr;
					}
					return rtnStr;
				}},
            {key: "itemRowNumStr", label: "열 넓이", width: 80, align: "center"},
            {key: "itemLength", label: "길이 제한", width: 120, align: "center"}
           ],
           body: {
               align: "center",
               columnHeight: 30
           },
           page:{display:false}
       });
       //그리드 데이터 불러오기
		//fnInGridListSet();
}

//역할 그룹 그리드
function fnCopyAuthListGrid(){
	copyAuthGrid = new ax5.ui.grid();
 
    copyAuthGrid.setConfig({
        target: $('[data-ax5grid="copyAuth-grid"]'),
        sortable:true,
        header: {align:"center",columnHeight: 30},
        columns: [
         {key: "authGrpNm", label: "역할그룹 명", width: 160, align: "center"},
         {key: "usrTypNm", label: "사용자유형", width: 120, align: "center"},
         {key: "authGrpDesc", label: "역할그룹 설명", width: 225, align: "center"},
         {key: "authGrpId", label: "역할그룹 Id", width: 225, align: "center",display:false}
        ],
        body: {
            align: "center",
            columnHeight: 30
        },
        page:{display:false}
    });
    
	copySignAuthGrid = new ax5.ui.grid();
 
    copySignAuthGrid.setConfig({
        target: $('[data-ax5grid="copySignAuth-grid"]'),
        sortable:true,
        header: {align:"center",columnHeight: 30},
        columns: [
         {key: "authGrpNm", label: "역할그룹 명", width: 160, align: "center"},
         {key: "usrTypNm", label: "사용자유형", width: 120, align: "center"},
         {key: "authGrpDesc", label: "역할그룹 설명", width: 225, align: "center"},
         {key: "authGrpId", label: "역할그룹 Id", width: 225, align: "center",display:false}
        ],
        body: {
            align: "center",
            columnHeight: 30
        },
        page:{display:false}
    });
}


//역할그룹 정보 조회
function fnCopyAuthRefresh(flowId,authGrpTargetCd,gridTarget){
	//선택 작업흐름 프로젝트 id
	var prjId = $(".copyProcess_box.active").attr('prjid');
	
	var processId = $(".copyProcess_box.active").attr('id');
	
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100FlowAuthGrpListAjax.do'/>","loadingShow":false},
			{prjId: prjId, processId: processId, flowId: flowId, authGrpTargetCd: authGrpTargetCd});
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		//에러 없는경우
		if(data.errorYN != "Y"){
			gridTarget.setData(data.flowAuthGrpList);
		}else{
			toast.push(data.message);
		}
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림");
 	});
	//AJAX 전송
	ajaxObj.send();
}


//역할그룹 목록 불러오기
function fnAuthGrpWizardListCall(){

	var data = {};
	// 전체 프로젝트 생성관리에서 마법사 팝업 호출시
	// 라이선스 그룹의 모든 프로젝트에서 역할그룹 불러온다.
	if(pageType == "systemAdmin"){
		data = {"selectType":pageType};
	}
	
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/prj/prj2000/prj2000/selectPrj2000AuthGrpCopyList.do'/>"}, data);
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		/* toast.push(data.message); */
		
		//에러 없는경우
		if(data.errorYN != "Y"){
			//기본 역할그룹 목록
			var rootAuthGrpList = data.rootAuthGrpList;
			
			//역할그룹 목록
			var authGrpCopyList = data.authGrpCopyList;
			
			//기존 조회 정보 모두 제거
    		$("#prjAuthGrpList").children().remove();
			
			//기본 역할그룹 목록 출력
			$("#prjAuthGrpList").append('<tr><td colspan="4" class="copyAuthGrp_titleBox">기본 역할그룹</td></tr>');
			
			$.each(rootAuthGrpList,function(idx, map){
				//tr 태그 id 부여하여 생성
	    		var html = "";
	    		html += '<tr class="left_con authGrpSelTr" id="'+map.authGrpId+'" prjid="'+map.prjId+'">';
	    		html += '	<td class="left_con authGrpCheckbox"><div class="prj1004_authGrpChk"><input type="checkbox" title="'+map.authGrpNm+'" id="AUTHGRPCHK_'+map.authGrpId+'" name="AUTHGRPCHK_'+map.authGrpId+'" authgrpid="'+map.authGrpId+'" prjid="'+map.prjId+'" disabled="disabled" checked/><label for="AUTHGRPCHK_'+map.authGrpId+'"></label></div></td>';
	    		html += '	<td class="left_con right_line">'+map.authGrpNm+'</td>';
	    		html += '	<td class="left_con right_line">'+map.usrTypNm+'</td>';
	    		html += '	<td class="left_con ">'+map.acceptUseNm+'</td>';
	    		html += '</tr>';
	    		
	    		$("#prjAuthGrpList").append(html);
			});
			
			var loopPrjId = null;
			//역할그룹 목록 loop
			$.each(authGrpCopyList,function(idx, map){
				if(loopPrjId != map.prjId){
					$("#prjAuthGrpList").append('<tr><td colspan="4" class="copyAuthGrp_titleBox">'+map.prjNm+'</td></tr>');
				}
				var html = "";
	    		html += '<tr class="left_con authGrpSelTr" id="'+map.authGrpId+'" prjid="'+map.prjId+'">';
	    		html += '	<td class="left_con authGrpCheckbox"><div class="prj1004_authGrpChk"><input type="checkbox" title="'+map.authGrpNm+'" id="AUTHGRPCHK_'+map.authGrpId+'" name="AUTHGRPCHK_'+map.authGrpId+'" authgrpid="'+map.authGrpId+'" prjid="'+map.prjId+'"/><label for="AUTHGRPCHK_'+map.authGrpId+'"></label></div></td>';
	    		html += '	<td class="left_con right_line">'+map.authGrpNm+'</td>';
	    		html += '	<td class="left_con right_line">'+map.usrTypNm+'</td>';
	    		html += '	<td class="left_con ">'+map.acceptUseNm+'</td>';
	    		html += '</tr>';
	    		
	    		$("#prjAuthGrpList").append(html);
				loopPrjId = map.prjId;
			});
			
			//click event 제거
			$("#prjAuthGrpList .authGrpSelTr").off("click");
			
			//역할그룹 active 제어
			$("#prjAuthGrpList .authGrpSelTr").click(function(e){
				if($(e.target).attr("type") == "checkbox"){
					return true;
				}
				$(".authGrpSelTr.table_active").removeClass("table_active");
				$(this).addClass("table_active");
				
				//선택 역할그룹에 해당하는 시스템 권한 데이터 가져오기
				var authGrpId = $(".authGrpSelTr.table_active").attr('id');
				var prjId = $(".authGrpSelTr.table_active").attr('prjid');
				
				fnAuthGrpSmallMenuList(authGrpId,prjId);
				return true;
			});
			
		}
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림");
 	});
	//AJAX 전송
	ajaxObj.send();
}


/**
*	권한정보 클릭시 메뉴권한 정보 조회 
**/
function fnAuthGrpSmallMenuList(authGrpId, selPrjId){
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/prj/prj2000/prj2000/selectPrj2000AuthGrpMenuListAjax.do'/>","loadingShow":true}
			,{"authGrpId" : authGrpId, "prjId" : selPrjId});
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
    	
    	//기존 조회 정보 모두 제거
    	$("#authTblBody").children().remove();

    	//rowspan 대상 ID
    	var prevUpupMenuId = '';
    	
    	//메뉴 rowspan 담기
    	var menuIdRowSpan = {};
    	
    	//반복하며 그리기
    	$.each(data.authGrpSmallMenuList,function(idx, data){
    		//시스템 관리자 막기
    	
    		//tr 태그 id 부여하여 생성
    		$("#authTblBody").append("<tr id='tr" + data.menuId + "'>");
			
    		//생성한 tr태그 객체 얻기
    		var trObj = $("#tr" + data.menuId );
    		
    		//각 그룹에서 첫번째 로우이면
    		if(gfnIsNull(prevUpupMenuId) || prevUpupMenuId != data.upupMenuId){
    			trObj.append("<td class='right_con wd_2_1' id='menuRow_"+data.upupMenuId+"' rowspan='1'>" + data.upupMenuNm + "</td>");	
    		}else{
    			//menuId별 rowspan 생성
    			if(gfnIsNull(menuIdRowSpan[data.upupMenuId])){
    				menuIdRowSpan[data.upupMenuId] = 1;
    			}
    			
    			//오류 처리 안함
   				try{
   					//대메뉴 rowspan +1
    				var upObjRowspan = parseInt(menuIdRowSpan[data.upupMenuId]);
    				menuIdRowSpan[data.upupMenuId] = (upObjRowspan+1);
   				}catch(err){console.log(err);}
    		}
    		
    		prevUpupMenuId = data.upupMenuId;
    		
    		trObj.append("<td class='right_con wd_2_2'>" + data.upMenuNm + " &#62; " + data.menuNm + "</td>");
    		
    		//배열로 체크박스 컬럼명 저장하여 반복 루프 처리함.
    		var strArrYn = ["accessYn", "selectYn", "regYn", "modifyYn", "delYn", "excelYn", "printYn"];
    		
			//해당 로우 상태 담기
			trObj.append("<input type='hidden' name='" + "status" + data.menuId + "' id='" + "status" + data.menuId + "' value='" + data.status + "' />");
			var mainYn = data.mainYn; 
			if(data.menuTypeCd == '02'){
				if(mainYn=='Y'){
					selMainMenuId = data.menuId;
					trObj.append("<td class='right_con wd_2_3 prj_chk'><input id='rd_"+data.menuId+ "' type='radio' name='rdMainMenu' value='"+data.menuId+"' checked='checked' disabled='disabled'><label for='rd_"+data.menuId+ "' ></label></td>");
				}else{
					trObj.append("<td class='right_con wd_2_3 prj_chk'></td>");
				}	
			}else{
				trObj.append("<td class='right_con wd_2_3 prj_chk'></td>");
			}
			
    		//메뉴별 권한 체크박스 생성
    		$.each(strArrYn, function(idx, val){
    			var cnt = idx + 4;
    			var strMenuId = data.menuId + val;
    			var hidMenuId = "hidden" + data.menuId + val ;
    			var hidStatus = "status" + data.menuId;	//수정상태인지 그냥 수정전 상태인지 상태값 가진 인풋
    			trObj.append("<td class='right_con wd_2_" + cnt + " prj_chk' style='text-align: center;' ><input type='hidden' name='" + hidMenuId + "' id='" + hidMenuId + "' value='" + eval("data." + val) + "' /> <input type='checkbox' title='체크박스' name='" + strMenuId + "' id='" + strMenuId + "' value='" + eval("data." + val) + "' disabled='disabled'/><label for='" + strMenuId + "'></label></td>");
    		});
    		
    		//밸류값 확인하여 체크 상태 변경
    		$.each(strArrYn, function(idx, val){
    			var objYn = $("#" + data.menuId + val);
        		if($(objYn).val() == 'Y'){
        			$(objYn).prop("checked", true);
        		}
        		else{
        			$(objYn).prop("checked", false);
        		}	
    		});
    		
    		//기존 선택 메인화면
			$prevChkVal = $("input[name=rdMainMenu]:checked");
    		
    		//전체 선택 체크 풀기
    		$("input[id^=prjAuthAll_]").prop("checked",false);
    	});
    	

    	//rowspan 걸기
    	$.each(menuIdRowSpan, function(idx, map){
    		$("#menuRow_"+idx).attr("rowspan",map);
    	});
    	
    	toast.push(data.message);
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림창");
 	});
	
	//AJAX 전송
	ajaxObj.send();
}


/*
 * 프로젝트 목록 불러오기, 개발문서 양식, 분류 프로젝트 목록 세팅
 * 전체 프로젝트 생성관리에서 마법사 호출시 라이선스 그룹의 모든 프로젝트 목록 조회
 * 프로젝트 생성관리에서 마법사 호출시 권한있는프로젝트 목록 조회 
 * @prarm url 프로젝트 목록 조회 url
 */
function fnProjectWizardListCall(url){
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":url});
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		/* toast.push(data.message); */
		
		//에러 없는경우
		if(data.errorYN != "Y"){
			//프로젝트 목록
			var adminPrjList = data.adminPrjList;
			
			//기존 조회 정보 모두 제거
    		$("#prj1004_docPrjList, #prj1004_clsPrjList").html('');
			
			//기본 양식 추가 - 개발문서 양식
			$("#prj1004_docPrjList").append('<div class="prj1004_prjListBoxFrame">'
	    		+'<div class="prj1004_docPrjSelRadio"><input type="radio" name="prj1004DocumentRadio" id="ROOTSYSTEM_PRJ" value="ROOTSYSTEM_PRJ" disabled="disabled" checked/><label for="ROOTSYSTEM_PRJ"></label></div>'
	    		+'<div class="prj1004_docPrjInfo active" prjid="ROOTSYSTEM_PRJ" title="기본 개발문서 양식">기본 개발문서 양식</div></div>');
			fnSearchMenuList("ROOTSYSTEM_PRJ");
			
			//분류 기본 (없음)
			$("#prj1004_clsPrjList").append('<div class="prj1004_prjListBoxFrame">'
	    		+'<div class="prj1004_docPrjSelRadio"><input type="radio" name="prj1004ClassRadio" id="null" value="null" disabled="disabled" checked/><label for="null"></label></div>'
	    		+'<div class="prj1004_clsPrjInfo active" prjid="null" title="분류 없음">분류 없음</div></div>');
			
			//프로젝트 목록
			$.each(adminPrjList,function(idx, map){
				//개발문서 양식
	    		var html = '<div class="prj1004_prjListBoxFrame">'
	    		+'<div class="prj1004_docPrjSelRadio"><input type="radio" name="prj1004DocumentRadio" id="'+map.prjId+'" value="'+map.prjId+'" disabled="disabled"/><label for="'+map.prjId+'"></label></div>'
	    		+'<div class="prj1004_docPrjInfo" prjid="'+map.prjId+'" title="'+map.prjDesc+'">'+map.prjNm
	    		+'</div></div>';
	    		$("#prj1004_docPrjList").append(html);
	    		
	    		//요구사항 분류
	    		var html = '<div class="prj1004_prjListBoxFrame">'
	    		+'<div class="prj1004_docPrjSelRadio"><input type="radio" name="prj1004ClassRadio" id="'+map.prjId+'" value="'+map.prjId+'" disabled="disabled"/><label for="'+map.prjId+'"></label></div>'
	    		+'<div class="prj1004_clsPrjInfo" prjid="'+map.prjId+'" title="'+map.prjDesc+'">'+map.prjNm
	    		+'</div></div>';
	    		$("#prj1004_clsPrjList").append(html);
			});
			
			//click event 제거
			$("#prj1004_docPrjList .prj1004_docPrjInfo,#prj1004_clsPrjList .prj1004_clsPrjInfo").off("click");
			
			//radio button click
			$(".prj1004_docPrjSelRadio").click(function(){
				$(this).next().click();
			});
			
			//프로젝트 active 제어
			$("#prj1004_docPrjList .prj1004_docPrjInfo").click(function(){
				$(".prj1004_docPrjInfo.active").removeClass("active");
				$(this).addClass("active");
				
				//선택 프로젝트에 해당하는 개발문서 양식 데이터 가져오기
				var prjId = $(".prj1004_docPrjInfo.active").attr('prjid');
				
				//선택 라디오
				$(this).siblings().children("input[type=radio]")[0].checked = true
				fnSearchMenuList(prjId);
				
				//form 초기화
				$("#form-step-3")[0].reset();
				return true;
			});
			
			//요구사항 분류 active제어
			$("#prj1004_clsPrjList .prj1004_clsPrjInfo").click(function(){
				$(".prj1004_clsPrjInfo.active").removeClass("active");
				$(this).addClass("active");
				
				//선택 프로젝트에 해당하는 개발문서 양식 데이터 가져오기
				var prjId = $(".prj1004_clsPrjInfo.active").attr('prjid');
				
				//선택 라디오
				$(this).siblings().children("input[type=radio]")[0].checked = true
				fnSearchClsMenuList(prjId);
				
				//form 초기화
				$("#form-step-4")[0].reset();
				return true;
			});
		}
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림");
 	});
	//AJAX 전송
	ajaxObj.send();
}

/**
 * 개발문서 양식 메뉴 리스트 조회 AJAX
 */
function fnSearchMenuList(prjId){
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/prj/prj3000/prj3000/selectPrj3000MenuListAjax.do'/>"}
			,{prjId: prjId});
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		var listSize = data.baseDocList.length;
		
    	// zTree 설정 
	    var setting = {
	        data: {
	        	key: {
					name: "docNm"
				},
	            simpleData: {
	                enable: true,
	                idKey: "docId",
					pIdKey: "upperDocId",
					rootPId: "000"
	            }
	        },
			callback: {
				onClick: function(event, treeId, treeNode){
					//우측 메뉴 정보
					fnGetMenuInfoAjax(treeNode.docId);
				}
			},
			view : {
				fontCss: function(treeId, treeNode){
					return (treeNode.useCd == "02")? {color:"#ddd"} :{};
				},
				showIcon : function(treeId, treeNode) {
					// 트리가 undefined, 노드가 2레벨(뎁스) 미만, isParent 값이 없을경우
					if(typeof prj1004DocZTree != "undefined" && treeNode.level < 2 && !treeNode.isParent){
						// 노드를 부모형 (폴더 아이콘)으로 변경
						if(listSize>1){
							treeNode.isParent = true;
							zTree.updateNode(treeNode);
							zTree.refresh();
						}
					}
					return true;
				}
			}
	    };
    	
	    // zTree 초기화
	    prj1004DocZTree = $.fn.zTree.init($("#prjDocJson"), setting, data.baseDocList);
	  //폴더의 계층구조가 3단계가 아니면  tree전체 펼침 시에 일회적 동작 안함(좋은방법같진않고 임시방편 추후개선)
		prj1004DocZTree.expandAll(false);
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림창");
 	});
	//AJAX 전송
	ajaxObj.send();
}

/**
 * 	좌측 메뉴 선택했을때 메뉴 정보 표시 함수
 */
 function fnGetMenuInfoAjax(docId){
	var prjId = $(".prj1004_docPrjInfo.active").attr("prjid");
	
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/prj/prj3000/prj3000/selectPrj3000MenuInfoAjax.do'/>"}
			,{prjId: prjId, docId:docId } );
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
       	//디테일폼 세팅
       	gfnSetData2Form(data, "form-step-3");
	});
	
	//AJAX 전송
	ajaxObj.send();
}

/**
 * 요구사항 분류 리스트 조회 AJAX
 */
function fnSearchClsMenuList(prjId){
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/req/req4000/req4000/selectReq4000ReqClsListAjax.do'/>"}
			,{prjId: prjId});
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		var listSize = data.reqClsList.length;
		
    	// zTree 설정 
	     var setting = {
		        data: {
		        	key: {
						name: "reqClsNm"
					},
		            simpleData: {
		                enable: true,
		                idKey: "reqClsId",
						pIdKey: "upperReqClsId",
		            }
		        },
				callback: {
					onClick: function(event, treeId, treeNode){
						//우측 메뉴 정보
						fnGetClsMenuInfoAjax(treeNode.reqClsId);
					}
				},
				view : {
					fontCss: function(treeId, treeNode){
						return (treeNode.useCd == "02")? {color:"#ddd"} :{};
					},
					showIcon : function(treeId, treeNode) {
						if(typeof prj1004ClsZTree != "undefined" && treeNode.level != 3 && !treeNode.isParent){
							if(listSize>1){
								treeNode.isParent = true;	
								prj1004ClsZTree.refresh();
							}
							//zTree.updateNode(treeNode);
						}
						return true;
					}
				}
		    };
    	
	    // zTree 초기화
	    prj1004ClsZTree = $.fn.zTree.init($("#prjClsJson"), setting, data.reqClsList);
	  //폴더의 계층구조가 3단계가 아니면  tree전체 펼침 시에 일회적 동작 안함(좋은방법같진않고 임시방편 추후개선)
		prj1004ClsZTree.expandAll(false);
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림창");
 	});
	//AJAX 전송
	ajaxObj.send();
}

/**
 * 	좌측 메뉴 선택했을때 메뉴 정보 표시 함수
 */
 function fnGetClsMenuInfoAjax(reqClsId){
	var prjId = $(".prj1004_clsPrjInfo.active").attr("prjid");
	
	//AJAX 설정
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/req/req4000/req4000/selectReq4000ReqClsInfoAjax.do'/>"}
			,{prjId: prjId, reqClsId: reqClsId } );
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
       	//디테일폼 세팅
       	gfnSetData2Form(data, "form-step-4");
	});
	
	//AJAX 전송
	ajaxObj.send();
}

/* 프로젝트 생성 마법사 완료 */
function projectWizardFrameDone(){
	jConfirm("프로젝트 마법사를 완료하시겠습니까?","경고",function(result){
		if(result){
			//선택 분류 프로젝트
			var clsSelId = $("input[type=radio][name=prj1004ClassRadio]:checked").val();
			
			//분류 없음이 아닌경우
			if(clsSelId != "null"){
				wizardFormDataArray["class"] = clsSelId;
			}
			//AJAX 설정
			var ajaxObj = new gfnAjaxRequestAction(
					{"url":"<c:url value='/prj/prj1000/prj1000/insertPrj1000WizardPrjInfo.do'/>"}
					,{wizardData: JSON.stringify(wizardFormDataArray)});
			//AJAX 전송 성공 함수
			ajaxObj.setFnSuccess(function(data){
				data = JSON.parse(data);
				
				if(data.errorYn == "N"){
					toast.push(data.message);
		
					//상단 콤보박스 정보 변경
					fnHeaderHandle(data.prjInfo,"insert");
			
					//프로젝트 목록 조회
					fnSelectPrjList();
					
					gfnLayerPopupClose();
				}else{
					jAlert(data.message,"경고");
					return false;
				}
			});
			
			//AJAX 전송 오류 함수
			ajaxObj.setFnError(function(xhr, status, err){
				data = JSON.parse(data);
				jAlert(data.message, "알림창");
		 	});
			//AJAX 전송
			ajaxObj.send();
		}
	});
}

//프로젝트 그룹 변경시 기간 넣기
function fnPrjGrpSel(thisObj){
	//프로젝트 그룹 선택 option 있는 경우 제거
	if($(thisObj).children("option[value=-1]").length > 0){
		//프로젝트 입력창 보이기
		$(".prjGrpSelected").slideDown();
		
		$(thisObj).children("option[value=-1]").remove();
	}
	var $option = $(thisObj).children("option:selected");
	var prjGrpStartDt = $option.attr("startdt");
	var prjGrpEndDt = $option.attr("enddt");
	$("#wizard_prjGrpDt_txt").val(prjGrpStartDt + " ~ " + prjGrpEndDt);
	
	/* 달력 세팅(시작일, 종료일) */
	gfnCalRangeSet("wizard_startDt", "wizard_endDt", prjGrpStartDt, prjGrpEndDt);	
}

function fnPrj1004GuideShow(){
	var mainObj = $(".popup");
	
	//mainObj가 없는경우 false return
	if(mainObj.length == 0){
		return false;
	}
	//guide box setting
	var guideBoxInfo = globals_guideContents["prj1004"];
	gfnGuideBoxDraw(true,mainObj,guideBoxInfo);
}
</script>

<div class="popup">
	<div class="pop_title">프로젝트 생성 마법사</div>
	<div class="pop_sub">
		<div class="projectCopyFrame" id="projectCopyFrame">
			<ul guide="wizardStepMenu">
				<li><a href="#step-project">① 프로젝트</a></li>
				<li><a href="#step-process">② 프로세스</a></li>
				<li><a href="#step-authGrp">③ 업무역할</a></li>
				<li><a href="#step-document">④ 개발문서 양식</a></li>
				<li><a href="#step-class">⑤ 요구사항 분류</a></li>
			</ul>
			<div class="step-mainLayout">
				<div id="step-project" class="step-box">
				<form id="form-step-0" name="form-step-0">
					<div class="menu_row">
						<div class="menu_col1 prjGrpNameSpan">프로젝트 그룹</div>
						<div class="menu_col2 prjGrpNameSpan">
							<select name="wizard_prjGrpNm_txt" id="wizard_prjGrpNm_txt" title="프로젝트 그룹" value="-1" onchange="fnPrjGrpSel(this)">
								<option value="-1">프로젝트 그룹 선택</option>
								<c:if test="${!empty prjList }">
									<c:forEach items="${prjList}" var="map" varStatus="status">
											<option value="${map.prjId}" startdt="${map.startDt}" enddt="${map.endDt}">${map.prjNm}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="menu_row">
						<div class="menu_col1 prjGrpNameSpan">프로젝트 그룹 기간</div>
						<div class="menu_col2 prjGrpNameSpan">
							<input type="text" id="wizard_prjGrpDt_txt" name="wizard_prjGrpDt_txt" class="dt_txt" readonly="readonly" title="프로젝트 그룹 기간"/>
						</div>
					</div>
					<div class="menu_row prjGrpSelected">
						<div class="menu_col1">프로젝트 명<span class="required_info">&nbsp;*</span></div>
						<div class="menu_col2">
							<input type="text" title="프로젝트 명" class="input_txt" id="wizard_prjNm" name="wizard_prjNm">
						</div>
					</div>
					<div class="menu_row prjGrpSelected">
						<div class="menu_col1">프로젝트 기간<span class="required_info">&nbsp;*</span></div>
						<div class="menu_col2">
							<div class="dateFrame"><input type="text" id="wizard_startDt" name="wizard_startDt" class="calendar_input" readonly="readonly" title="프로젝트 시작일"/></div>
							<div class="calendar_bar fl" style="margin-right: 20px;">~</div>
							<div class="dateFrame"><input type="text" id="wizard_endDt" name="wizard_endDt" class="calendar_input" readonly="readonly" title="프로젝트 종료일"/></div>
						</div>
					</div>
					<div class="menu_row prjGrpSelected">
						<div class="menu_col1 prjTypeDiv">프로젝트 유형<span class="required_info">&nbsp;*</span> </div>
						<div class="menu_col2 prjTypeDiv">
							<select class="search_select" title="프로젝트 유형" id="wizard_prjType" name="wizard_prjType" style="height: 100%;">
									</select>
						</div>
					</div>
					<div class="menu_row prjGrpSelected">
						<div class="menu_col1 popPrjAcrmDiv">프로젝트 약어<span class="required_info">&nbsp;*</span> </div>
						<div class="menu_col2 popPrjAcrmDiv">
							<input id="wizard_prjAcrm" type="text"  name="wizard_prjAcrm" maxlength="10" />
						</div>
					</div>
					<div class="menu_row prjGrpSelected">
						<div class="menu_col_textarea">
							<div class="menu_col1">프로젝트 설명</div>
							<div class="menu_col2">
								<textarea title="설명" id="wizard_prjDesc" name="wizard_prjDesc"></textarea>
							</div>
						</div>
					</div>
					<div class="menu_row prjGrpSelected">
						<div class="menu_col1 bottom_line">정렬 순서<span class="required_info">&nbsp;*</span></div>
						<div class="menu_col2 bottom_line">
							<input type="number" min="1" id="wizard_ord" name="wizard_ord" value="1" title="정렬 순서"/>	<!-- 기본적인 한줄           input에선 class 없음 -->
						</div>
					</div>
				</form>
				</div>
				<div id="step-process" class="step-box">
					<div class="zoomBtn" guide="zoom">
						<span class="button_normal2" onclick="fnCopyFlowChartZoom('reset')"><i class="fa fa-undo-alt"></i></span>
						<span class="button_normal2" onclick="fnCopyFlowChartZoom('in')"><i class="fa fa-plus"></i></span>
						<span class="button_normal2" onclick="fnCopyFlowChartZoom('out')"><i class="fa fa-minus"></i></span>
					</div>
					<div class="flw_box flw_main_leftBox">
						<div class="flw_box copyFlw_left_topBox">
							<span class="button_normal2" id="btn_insert_copyProSelect">조회</span>
						</div>
						<div class="flw_box copyFlw_left_bottomBox" id="processCopyBoxList">
							
						</div>
					</div>
					<div class="flw_box flw_main_rightBox" id="processCopyFlowParentDiv" style="width: 1195px;">
						<div id="processCopyFlowChartDiv">
						
						</div>
					</div>
					<div class="flw_box_clear"></div>
					<div class="flw_box flw_main_bottomBox">
						<form id="processStepFrm" name="processStepFrm" method="post">
						<div class="flw_content_mask" id="copyFlowContentMask">작업흐름을 선택해주세요.</div>
						<div class="flw_sub_box flw_bottom_leftBox" style="height: auto;">
							 <div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right">
								작업흐름 명
							</div>
							<div class="flw_sub_box flw_sub3">
								<input type="text" name="copyFlowNm" id="copyFlowNm" readonly="readonly" style="border:1px solid #ccc;"/>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right" title="선택 작업흐름을 필수 단계로 지정합니다.">
								필수
							</div>
							<div class="flw_sub_box flw_sub1 flw_line_right">
								<div class="flw_chk"> 
									<input type="checkbox" title="체크박스" name="copyFlowEssential" id="copyFlowEssential" disabled="disabled"/><label></label>
								</div>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right">
								제목 배경 색상
							</div>
							<div class="flw_sub_box flw_sub1">
								<input type="color" name="copyFlowTitleBgColor" id="copyFlowTitleBgColor" value="#515769" disabled="disabled"/>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right" title="다음 작업흐름 변경시 결재를 받도록 지정합니다.">
								결재 요청
							</div>
							<div class="flw_sub_box flw_sub1 flw_line_right">
								<div class="flw_chk"> 
									<input type="checkbox" title="체크박스" name="copyFlowSign" id="copyFlowSign" disabled="disabled"/><label></label>
								</div>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right">
								제목 글씨 색상
							</div>
							<div class="flw_sub_box flw_sub1">
								<input type="color" name="copyFlowTitleColor" id="copyFlowTitleColor" value="#FFFFFF" disabled="disabled"/>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right" title="결재 반려시 최종완료 작업흐름으로 변경되도록 합니다.">
								결재 반려시 종료
							</div>
							<div class="flw_sub_box flw_sub1 flw_line_right">
								<div class="flw_chk"> 
									<input type="checkbox" title="체크박스" name="copyFlowSignStop" id="copyFlowSignStop" disabled="disabled"/><label></label>
								</div>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right">
								내용 배경 색상
							</div>
							<div class="flw_sub_box flw_sub1">
								<input type="color" name="copyFlowContentBgColor" id="copyFlowContentBgColor" value="#FFFFFF" disabled="disabled"/>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right" title="다음 작업흐름 변경시 바로 최종완료 작업흐름으로 변경이 가능하도록 합니다.">
								종료 분기
							</div>
							<div class="flw_sub_box flw_sub1 flw_line_right">
								<div class="flw_chk"> 
									<input type="checkbox" title="체크박스" name="copyFlowEnd" id="copyFlowEnd" disabled="disabled"/><label></label>
								</div>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right">
								내용 글씨 색상
							</div>
							<div class="flw_sub_box flw_sub1">
								<input type="color" name="copyFlowContentColor" id="copyFlowContentColor" value="#515769" disabled="disabled"/>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right" title="현재 작업흐름에서 리비전 번호를 입력 받도록 지정합니다.">
								리비전 저장
							</div>
							<div class="flw_sub_box flw_sub1 flw_line_right">
								<div class="flw_chk"> 
									<input type="checkbox" title="체크박스" name="copyFlowRevision" id="copyFlowRevision" disabled="disabled"/><label></label>
								</div>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right">
								배포 계획 저장
							</div>
							<div class="flw_sub_box flw_sub1">
								<div class="flw_chk"> 
									<input type="checkbox" title="체크박스" name="copyFlowDpl" id="copyFlowDpl" disabled="disabled"/><label></label>
								</div>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right" title="현재 작업흐름에서 리비전 번호를 입력 받도록 지정합니다.">
								허용 역할
							</div>
							<div class="flw_sub_box flw_sub1 flw_line_right">
								<div class="flw_chk"> 
									<input type="checkbox" title="체크박스" name="copyFlowAuth" id="copyFlowAuth" disabled="disabled"/><label></label>
								</div>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_line_right" title="현재 작업흐름에서 작업을 추가 할 수 있도록 지정합니다.">
								작업
							</div>
							<div class="flw_sub_box flw_sub1">
								<div class="flw_chk"> 
									<input type="checkbox" title="체크박스" name="copyFlowWork" id="copyFlowWork" disabled="disabled"/><label></label>
								</div>
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_sub_desc copyFlw_auth_frame">
								담당자</br>허용 역할 목록
							</div>
							<div class="flw_sub_box flw_sub3 flw_sub_desc flw_line_bottom_none copyFlw_auth_frame">
								<div data-ax5grid="copyAuth-grid" data-ax5grid-config="{}" style="height: 100px;"></div>	
							</div>
						</div>
						<div class="flw_sub_box flw_bottom_rightBox" style="height: auto;">
							<div class="flw_sub_box flw_sub_title flw_sub4 flw_line_left">
								추가 항목 내용
							</div>
							<div class="flw_sub_box flw_sub4" style="height: 240px;">
								<div data-ax5grid="copyFlw-grid" data-ax5grid-config="{}" style="height: 240px;"></div>	
							</div>
							<div class="flw_sub_box flw_sub_title flw_sub1 flw_sub_desc flw_line_left copyFlw_auth_frame">
								결재자</br>허용 역할 목록
							</div>
							<div class="flw_sub_box flw_sub3 flw_sub_desc flw_line_bottom_none copyFlw_auth_frame">
								<div data-ax5grid="copySignAuth-grid" data-ax5grid-config="{}" style="height: 100px;"></div>	
							</div>
						</div>
					</form>
					</div>
				</div>
				<div id="step-authGrp" class="step-box">
					<div class="left_div">
						<div class="left_title">역할 그룹
							<span class="button_normal2" id="btn_select_prjAuth">조회</span>
						</div>
						<table class="left_table">
							<caption>역할 그룹</caption>
							<thead>
								<tr>
									<th class="left_sub_title" style="width: 38px;"></th>
									<th class="left_sub_title right_line" style="width: 48%;">그룹 명</th>
									<th class="left_sub_title right_line" style="width: 20%;">사용자<br/>유형</th>
									<th class="left_sub_title" style="width: 20%;">접수권한<br/>유무</th>
								</tr>
							</thead>
							<tbody id="prjAuthGrpList" >
							</tbody>
						</table>
					</div>
					<div class="right_div">
						<div class="right_title">시스템 권한
						</div>
						<form id="menuAuthFrm" name="menuAuthFrm">		
							<input type="hidden" id="menuAuthGrpId" name="menuAuthGrpId" >
							<input type="hidden" id="mainMenuId" name="mainMenuId" >
							
							<table class="right_table">
								<caption>시스템 권한</caption>
								<thead>
									<tr class="auth_table_title">
										<th class="right_sub_title wd_2_1" style="text-align: center;">대 메뉴명</th>
										<th class="right_sub_title wd_2_2 sub_two" style="text-align: center;">중 메뉴명 > 소 메뉴명</th>
										<th class="right_sub_title wd_2_3">메인</th>
										<th class="right_sub_title wd_2_4" >
											<div class="prj_chk"> 
												<span class="title_align">접근</span>
											</div>
										</th>
										<th class="right_sub_title wd_2_5">
											<div class="prj_chk">
												<span class="title_align">조회</span>
											</div>
										</th>
										<th class="right_sub_title wd_2_6">
											<div class="prj_chk">
												<span class="title_align">등록</span>
											</div>
										</th>
										<th class="right_sub_title wd_2_7">
											<div class="prj_chk">
												<span class="title_align">수정</span>
											</div>
										</th>
										<th class="right_sub_title wd_2_8">
											<div class="prj_chk">
												<span class="title_align">삭제</span>
											</div>
										</th>
										<th class="right_sub_title wd_2_9">
											<div class="prj_chk">
												<span class="title_align">엑셀</span>
											</div>
										</th>
										<th class="right_sub_title wd_2_10">
											<div class="prj_chk">
												<span class="title_align">출력</span>
											</div>
										</th>
									</tr>
								</thead>
								
								<tbody id="authTblBody">
									<!-- 테이블 바디 내용 들어감 AJAX로 조회시 삽입됨.  -->
									
								</tbody>
							</table>
						</form>
					</div>
				</div>
				<div id="step-document" class="step-box">
					<div class="prj1004_doc_leftDiv">
						<div class="prj1004_docMainTitle">프로젝트 목록</div>
						<div class="prj1004_docPrjList" id="prj1004_docPrjList"></div>
					</div>
					<div class="prj1004_doc_middleDiv">
						<div class="prj1004_docMainTitle">
							<div class="prj1004_docMenuBtnDiv">
								<div class="prj1004_menuBtn" id="prj1004_menu_expand_all"><i class="fa fa-plus"></i></div>
								<div class="prj1004_menuBtn" id="prj1004_menu_collapse_all"><i class="fa fa-minus"></i></div>
							</div>
						개발문서 양식 메뉴</div>
						<div class="prj1004_docMenuBox"><ul id="prjDocJson" class="ztree"></ul></div>
						
					</div>
					<div class="prj1004_doc_rightDiv">
						<div class="prj1004_docMainTitle" style="border-bottom:none;">선택 개발문서 정보</div>
						<div class="prj1004_selDocInfo">
							<form id="form-step-3" name="form-step-3">
							<div class="menu_row">
								<div class="menu_col1">개발문서 ID</div>
								<div class="menu_col2">
										<input type="text" id="docId" name="docId" readonly="readonly" title="개발문서 ID"/>
								</div>
							</div>
							<div class="menu_row">
								<div class="menu_col1">상위 개발문서 ID</div>
								<div class="menu_col2">
										<input type="text" id="upperDocId" name="upperDocId" readonly="readonly" title="상위 개발문서 ID"/>
								</div>
							</div>
							<div class="menu_row">
								<div class="menu_col1">개발문서 명</div>
								<div class="menu_col2">
										<input type="text" id="docNm" name="docNm" readonly="readonly" title="개발문서 명"/>
								</div>
							</div>
							<div class="menu_row">
								<div class="menu_col1">개발문서 마감일</div>
								<div class="menu_col2">
										<input type="text" id="docEdDtm" name="docEdDtm" readonly="readonly" title="개발문서 마감일"/>
								</div>
							</div>
							<div class="menu_row">
								<div class="menu_col_textarea">
									<div class="menu_col1">개발문서 설명</div>
									<div class="menu_col2">
										<textarea title="설명" id="docDesc" name="docDesc" readonly="readonly"></textarea>
									</div>
								</div>
							</div>
							<div class="menu_row">
								<div class="menu_col1 bottom_line">정렬 순서<span class="required_info">&nbsp;*</span></div>
								<div class="menu_col2 bottom_line">
									<input type="number" min="1" id="ord" name="ord" title="정렬 순서" readonly="readonly"/>
								</div>
							</div>
						</form>
						</div>
					</div>
				</div>
				<div id="step-class" class="step-box">
					<div class="prj1004_doc_leftDiv">
						<div class="prj1004_docMainTitle">프로젝트 목록</div>
						<div class="prj1004_clsPrjList" id="prj1004_clsPrjList"></div>
					</div>
					<div class="prj1004_doc_middleDiv">
						<div class="prj1004_docMainTitle">
							<div class="prj1004_docMenuBtnDiv">
								<div class="prj1004_menuBtn" id="prj1004_clsMenu_expand_all"><i class="fa fa-plus"></i></div>
								<div class="prj1004_menuBtn" id="prj1004_clsMenu_collapse_all"><i class="fa fa-minus"></i></div>
							</div>
						요구사항 분류</div>
						<div class="prj1004_docMenuBox"><ul id="prjClsJson" class="ztree"></ul></div>
					</div>
					<div class="prj1004_doc_rightDiv">
						<div class="prj1004_docMainTitle" style="border-bottom:none;">선택 분류 정보</div>
						<div class="prj1004_selDocInfo">
							<form id="form-step-4" name="form-step-4">
							<div class="menu_row">
								<div class="menu_col1">분류 ID</div>
								<div class="menu_col2">
										<input type="text" id="reqClsId" name="reqClsId" readonly="readonly" title="프로젝트 그룹 명"/>
								</div>
							</div>
							<div class="menu_row">
								<div class="menu_col1">상위 분류 ID</div>
								<div class="menu_col2">
										<input type="text" id="upperReqClsId" name="upperReqClsId" readonly="readonly" title="프로젝트 그룹 명"/>
								</div>
							</div>
							<div class="menu_row">
								<div class="menu_col1">분류 명</div>
								<div class="menu_col2">
										<input type="text" id="reqClsNm" name="reqClsNm" readonly="readonly" title="프로젝트 그룹 명"/>
								</div>
							</div>
							<div class="menu_row">
								<div class="menu_col1 bottom_line">정렬 순서<span class="required_info">&nbsp;*</span></div>
								<div class="menu_col2 bottom_line">
									<input type="number" min="1" id="ord" name="ord" title="정렬 순서" readonly="readonly"/>
								</div>
							</div>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</html>