<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http:
<script src="<c:url value='/js/common/oslFile.js'/>" ></script>
<link rel='stylesheet' href='<c:url value='/css/common/fileUpload.css'/>' type='text/css'>
<html lang="ko">
<head>
<title>OpenSoftLab</title>

<style>

.layer_popup_box .popup {font-size: 0.95em;height: 100%;}
.popup_title_box { width: 100%; height: 44px; padding: 15px;font-weight: bold; color: #fff; background-color: #4b73eb;}


.req4105_req_leftBox {display: inline-block;float: left;width: 80%;height: calc(100% - 44px);min-height: 856px;border: 1px solid #8f95b3;}
.req4105_req_rightBox {display: inline-block;float: left;width: 20%;height: calc(100% - 44px);min-height: 856px;border: 1px solid #8f95b3;overflow-y: auto;border-left: none;position: relative;}
.req4105_nextFlowList {width: 100%;height: 100%;display: inline-block;float:left;}
.req4105_req_topBox {width: 100%;height: 130px;border-bottom: 1px solid #8f95b3;overflow-x: auto;overflow-y: hidden;white-space:nowrap;text-align:right;padding-top: 10px;padding-right: 10px;position:relative;}
.req4105_req_bottomBox {width: 100%;height: calc(100% - 130px);min-height: 714px;}
.req4105_reqBottom_topBox {display: block;width: 100%;height: 614px;min-height: 614px;overflow-y: auto;overflow-x: hidden;border-bottom:1px solid #8f95b3;font-size: 10pt;padding: 10px 15px 150px 15px;}
.req4105_reqBottom_bottomBox {display: block;width: 100%;height: 100px;}
.req4105_optionDiv {
    width: 100%;
    display: block;
    float: left;
    border-right: 1px solid #ccc;
}
div#req4105_reqOptDataList .req4105_default_option {
    border: 1px solid #ccc;
    border-top: none;
    padding: 10px;
    position:relative;
}
.req4105_frameTitleDiv {
    width: 100%;
    height: 45px;
    background-color: #fff;
    color: #414352;
    border: 1px solid #ccc;
    border-radius: .1875rem .1875rem 0 0;
    padding-left: 10px;
    line-height: 40px;
    font-weight: bold;
    float: left;
    display: block;
    margin-top: 10px;
    font-size: 13pt;
}
.req4105_option_title {width: 25%;float: left;height: 45px;padding-left: 10px;line-height: 40px;background-color: #f9f9f9;border: 1px solid #ccc;font-weight: bold;border-top: none;}
.req4105_option_all {float: left;height: 45px;line-height: 30px;width: 75%;border-bottom: 1px solid #ccc;padding: 5px;}
.req4105_option_half {float: left;height: 45px;line-height: 30px;width: 25%;border-bottom: 1px solid #ccc;padding:5px;}
input.req4105_input_text {min-width: 190px;height: 100%;border: 1px solid #ccc;display: block;padding-left: 15px;border-radius: 1px;}
textarea.req4105_textarea {width: 100%;height: 100%;resize: none;padding: 5px;border: 1px solid #ccc;border-radius: 1px;}
input.req4105_input_date {width: 100%;float: left;display: block;border-radius: 1px;height: 100% !important;background-color: #fff !important;border: 1px solid #ccc;text-align: center;}
input.req4105_charger,input.req4105_optCharger,input.req4105_cls,input.req4105_dept,input.req4105_deploy {width: 195px !important;min-width: 100px;display: inline-block;float: left;margin-right: 5px;}
span.req4105_charger,span.req4105_optCharger,span.req4105_cls,span.req4105_dept,span.req4105_deploy{height: 34px;line-height: 30px;width:30px;min-width: 30px;}
input.req4105_input_check {width: 100%;height: 80%;}
textarea.req4105_processBox_bottom[disabled] {background-color: #fff;white-space:normal;}
select.req4105_select {width: 100%;height: 100%;border-radius: 1px;border: 1px solid #ccc;text-align: center;font-size:10pt !important;}
input.req4105_input_text.req4105_readonly, textarea.req4105_textarea.req4105_readonly, select.req4105_select.req4105_readonly
,input.req4105_input_date[disabled]{cursor: default;background-color:#eee !important;}
img.ui-datepicker-trigger{float: left;margin-top: 2px;}
.req4105_option_half input.req4105_input_text
, .req4105_option_half textarea.req4105_textarea
, .req4105_option_half select.req4105_select {width:100%;height:100%;}
.req4105_option_all input.req4105_input_text, .req4105_option_all textarea.req4105_textarea, .req4105_option_all select.req4105_select{width: 100% !important;height:100% !important;}
.req4105_option_all input.req4105_cls,
.req4105_option_all input.req4105_dept,
.req4105_option_all input.req4105_optCharger{width: 695px !important;}
.req4105_desc {height: 100px;}
.req4105_file {height: 150px;}
.req4105_clear{clear:both;}
.req4105_top_line{border-top:1px solid #ccc;}
.req4105_right_line{border-right:1px solid #ccc;}
input.req4105_input_date[disabled] {width: 100%;}
input.req4105_charger[readonly] ,input.req4105_optCharger[readonly] {width: 100% !important;}
.req4105_default_mask {position: absolute;width: 100%;height:100%;background-color:rgba(0, 0, 0, 0);display:none;}
.endPrevStr{display:none;}


.req4105_processBox {width: 150px;display: inline-block;margin: 10px;margin-bottom: 0;border: 1px solid #ccc;border-radius: .1875rem;box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);height: 100px;padding: 5px;cursor: pointer;}
.req4105_processBox_top {width: 100%;height: 20px;line-height: 20px;text-align: center;font-weight: bold;border-bottom: 1px solid #ccc;font-size: 10pt;}
.req4105_processBox_bottom {height: 70px;padding: 2px 5px;font-size: 9pt;width: 138px;resize: none;border: none;overflow: hidden;cursor: pointer;}
.req4105_processBox:hover, .req4105_processBox.active {border: 1px solid #ff5643;}


.req4105_flowBox {position: relative;width: 185px;height: 65px;text-align: center;border-radius: 0 0 10px 10px;border: 3px solid transparent;margin: 30px 10px 0 10px;display:inline-block;background-color: #F0F0F0;color: #000000;}
.req4105_flowOptionDiv {position: absolute;top: -24px;height: 24px;left: -3px;background-color: inherit;padding: 2px;border: 3px solid transparent;border-radius: 5px 5px 0 0;font-size: 10pt;border-bottom: 1px dashed #fff;width: 185px;text-align: left;}
.req4105_flowBox_title {width: 100%;height: 30px;line-height: 20px;font-weight: bold; padding-top: 5px;border-bottom: none;float:left;}
.req4105_flowBox_contents {width: 100%;height: 30px;border-radius: 0 0 8px 8px;line-height: 33px;background-color:#fff;color:#000;float:left;font-size:10pt;}
.req4105_flowBox.topFlowBox:hover, .req4105_flowBox.topFlowBox.flowActive{cursor:pointer;border: 3px solid #4b73eb;}
.req4105_flowBox.topFlowBox:hover .req4105_flowOptionDiv, .req4105_flowBox.topFlowBox.flowActive .req4105_flowOptionDiv{cursor:pointer;border: 3px solid #4b73eb;border-bottom: 1px dashed #fff;}


.req4105_flowFrameBox {position: relative;text-align: center;height: 130px;margin-bottom: 1px;padding-top: 15px;border: 5px solid transparent;}
.req4105_addOptionFrame {
    padding: 10px;
    border: 1px solid #ccc;
    border-top: none;
    float: left;
    width: 100%;
    display: inline-block;
}

.req4105_flowFrameBox.active{display:block;}

.req4105_flowTopArrowBox {position: relative;top: 0px;left: 100px;background: url(/images/right_arrow2.png) center;background-size: 42px 42px;width: 42px;height: 35px;transform: rotate(90deg);}
.req4105_flowBox_contents > span {font-size: 9pt;}
.req4105_flowOptionDiv > li {margin: 0 2px;font-size: 10pt;}
.req4105_flow_topArrowBox {background: url(/images/right_arrow2.png);background-size: 44px 44px;display: inline-block;width: 44px;height: 44px;margin: 40px 10px 0 10px;background-repeat: no-repeat;}


.uploadOverFlow.optFileDiv, #dragandrophandler{width:81%;height:100%;max-height: 100%;overflow-y: auto;border: 1px solid #fff;padding: 5px;float:left;}
.uploadOverFlow.optFileDiv:hover, #dragandrophandler:hover{border:1px solid #fff;cursor: pointer;}

.req4105_option_all.req4105_file {padding: 0;}
.req4105_fileBtn {display: inline-block;width: 17%;height: 93%;line-height: 25px;text-align: center;border-radius: 2px;border: 1px solid #b8b8b8;cursor: pointer;background-color: #fff;color: #353535;margin: 5px 8px 5px 0;float: right;padding: 50px 0;}
.req4105_fileBtn:hover {background-color: #353553;color: #fff;}
.uploadOverFlow.widthAll{width:100% !important;}


.req4105_close{width: 120px;height: 40px;line-height: 36px;text-align: center;font-weight: bold;display: inline-block;border-radius: .1875rem;box-shadow: 1px 1px 1px #ccd4eb;border: 1px solid #b8b8b8;cursor: pointer;background-color: #fff;color: #000;}
.req4105_mdBtn, .req4105_signBtn, .req4105_complete {width: 120px;height: 40px;line-height: 36px;text-align: center;font-weight: bold;display: inline-block;border-radius: .1875rem;box-shadow: 1px 1px 1px #ccd4eb;border: 1px solid #b8b8b8;cursor: pointer;margin-right:20px;background-color: #fff;color: #000;}
.req4105_chargerChgBtn {display:none;width: 140px;height: 40px;line-height: 36px;text-align: center;font-weight: bold;border-radius: .1875rem;box-shadow: 1px 1px 1px #ccd4eb;border: 1px solid #b8b8b8;cursor: pointer;margin-right:20px;background-color: #fff;color: #000;}
.req4105_nextFlowBtn {width: 100px;height: 40px;line-height: 36px;text-align: center;font-weight: bold;display: inline-block;border-radius: .1875rem;box-shadow: 1px 1px 1px #ccd4eb;border: 1px solid #b8b8b8;cursor: pointer;margin:0 10px;background-color: #fff;color: #000;}
.req4105_signBtn{width: 200px;display:none;}
.req4105_mdBtn{display:none;}
.req4105_btnDiv {width: 100%;height: 100px;line-height: 100px;text-align: center;padding-left: 100px;}


.req4105_signBox {float:left;width: 100%;border-right: 1px solid #ccc;display: none;}
.req4105_signBox input.req4105_charger {width: 244px !important;}
.req4105_sign_maskBox {display:none;position: absolute;right: 0;width: 100%;height: 100%;min-height: 745px;background-color: rgba(0, 0, 0, 0.6);z-index: 2;color: #fff;padding-top: 350px;padding-left: 50px;text-align: left;line-height: 30px;}
span#signUsrHtml > img {display: inline-block;padding-left: 75px;width: 135px;height: 60px;}
.req4105_signHistoryDiv {width: 100%;height: 200px;border: 1px solid #ccc;overflow-y: hidden;overflow-x: auto;padding:0 10px;white-space:nowrap;position: relative;}


#req4105_work{display:none;border-right: none;border-bottom: 1px solid #ccc;}
.req4105_work_btnBox {height: 45px;line-height: 45px;border: 1px solid #ccc;border-bottom: none;border-top: none;background-color: #f9f9f9;font-weight: bold;padding-left: 10px;}
.req4105_work_frame {width: 100%;height: 210px;padding: 5px;border: 1px solid #ccc;border-bottom: none;}
div.req4105_work_btn {float: right;margin: 5px 10px;border: 1px solid #b8b8b8;width: 100px;height: 35px;line-height: 35px;text-align: center;box-shadow: 1px 1px 1px #ccd4eb;background-color: #fff;border-radius: .1875rem;cursor:pointer;}


#req4105_revision{display:none;border-right: none;}
.req4105_revision_btnBox {height: 45px;line-height: 45px;border: 1px solid #ccc;border-bottom: none;border-top: none;background-color: #f9f9f9;font-weight: bold;padding-left: 10px;}
.req4105_revision_frame {width: 100%;height: 210px;padding: 5px;border: 1px solid #ccc;}
div.req4105_revision_btn {float: right;margin: 5px 10px;border: 1px solid #b8b8b8;width: 100px;height: 35px;line-height: 35px;text-align: center;box-shadow: 1px 1px 1px #ccd4eb;background-color: #fff;border-radius: .1875rem;cursor:pointer;}


.req4105_dplBox {float:left;width: 100%;border-right: 1px solid #ccc;display: none;}
.req4105_dplBox input.req4105_deploy {width: 244px !important;}


.req4105_flowSelect_maskBox {display:none;width: 100%;height: 856px;position: absolute;left: 0;background-color: rgba(0, 0, 0, 0.6);z-index: 5;}
.req4105_flowSelectBox {display:none;width: 20%;height: 804px;position: absolute;z-index: 6;top: 60px;left: 40%;background-color: #fff;border: 1px solid #ccc;}
.req4105_flowSelectBox_title {width: 100%;height: 44px;padding: 15px;font-weight: bold;color: #fff;background-color: #4b73eb;}
.req4105_flowSelectBox_top {height: 710px;overflow-y: scroll;padding-top: 1px;}
.req4105_flowSelectBox_bottom {height: 50px;text-align: center;border-top: 1px solid #8f95b3;padding: 4px 0;}
.req4105_flowSelectBox_top > .req4105_flowFrameBox:hover{border: 5px solid #4b73eb;}
.req4105_flowSelectBox_top > .req4105_flowFrameBox.active{border: 5px solid #4b73eb;}


.req4105_titleFoldingBtn {
    float: right;
    height: 35px;
    line-height: 32px;
    width: 45px;
    border: 2px solid #fff;
    background-color: rgba(255, 255, 255, 0.1);
    padding: 0 10px;
    cursor: pointer;
    margin: 5px 10px 2px 2px;
    border-radius: 3px;
    text-align: center;
}
.req4105_titleFoldingBtn:hover{background-color: #414352;color: #fff;border-radius: 10px;}
.req4105_titleFoldingContent {font-family: "Font Awesome 5 Free";font-size: 15pt;}
.req4105_titleFoldingContent.down::before{content: "\f107";}
.req4105_titleFoldingContent.up::before{content: "\f106"; }
.req4105_titleFolded{border-radius:5px;border-bottom: 1px solid #ccc;}
.req4105_frameTitleDiv:not(.req4105_titleFolded){border-bottom: none;}

.req_main_box{height: 170px;width: 150px;display: inline-block;float: left;}
.req_top_box{border-left: 1px dotted #a4a7bb;height: 20px;padding-left: 5px;font-size: 9pt;line-height: 20px;display:block;}
.req_bottom_box{height: 150px;border: 1px solid #a4a7bb;border-radius: 0 0 5px 5px;padding: 5px;box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);font-size: 9pt;display:inline-block;width:100%;}
.req_box_title{padding-bottom: 4px;margin-bottom: 1px;text-align: center;}
.req_box_title.signDiv{height: 20px;line-height: 18px;box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);}
.req_box_main{height: 20px;line-height: 15px;text-align: center;padding: 2px 0;position: relative;}
.req_box_main.signRejectDiv{height: 80px;text-align: left;white-space: normal;width: 138px;resize:none;overflow-y: auto;font-size: 10pt;}
.req_box_main.signRejectDiv:hover {cursor: pointer;border: 1px solid #4b73eb;}
.req_box_main.signRejectUsrDiv{height: 30px;line-height: 25px;border: 1px solid #ccc;border-radius: .1875rem;}
.req_box_main.prev{box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);color:#fff;margin-top: 20px;}
.req_box_main.regUsrImg {width: 100%;height: 54px;display: block;text-align: left;clear: both;}
.req_box_main.regUsrImg > img {width: 50px;height: 50px;float: left;}
.req_box_main.regUsrImg > div {float: left;height: 25px;width: calc(100% - 50px);text-align: center;line-height: 25px;}
.req_box_main.signAcceptDiv {height: calc(100% - 20px);padding-top: 10px;}
.req_box_main.signAcceptDiv > div {height: 30px;line-height: 25px;border: 1px solid #ccc;margin-top: 10px;border-radius: .1875rem;}
.req_box_main.signAcceptDiv > img {width: 60px;height: 60px;}
.req_box_main.bottom:nth-child(1){margin-top:5px;}
.req_box_main.bottom{border: 1px solid #ccc;margin-bottom: 1px;}
.historyUsrDiv:hover{background-color:#323a47;color:#fff;cursor:pointer;}
.req4105_signFrame{display: inline-block;}
.req4105_flow_topArrowBox.signArrow{height:100px;}
.req4105_sign_TitleBox {
    height: 45px;
    line-height: 45px;
    border: 1px solid #ccc;
    border-bottom: none;
    border-top: none;
    background-color: #f9f9f9;
    font-weight: bold;
    padding-left: 10px;
    float: left;
    width: 100%;
}
.req4105_revision_TitleBox {
    height: 45px;
    line-height: 45px;
    border: 1px solid #ccc;
    border-top: none;
    background-color: #f9f9f9;
    font-weight: bold;
    padding-left: 10px;
    float: left;
    width: 100%;
}
.req4105_addOption_TitleBox {
    height: 1px;
    border-bottom: 1px solid #ccc;
    float: left;
    width: 100%;
}

.req4105_chk { position: relative;text-align: center;}
.req4105_chk input[type="checkbox"] {margin:0; opacity: 0; position: absolute; z-index: 2; width: 100%;height: 100%;left: 0;}
.req4105_chk input[type="checkbox"]+label { display: inline-block; width: 18px; height: 18px; background: url(/images/contents/normal_check.png) no-repeat; font-size: 1em; line-height: 24px; vertical-align: middle; cursor: pointer; z-index: 1; border-radius: 3px; margin-top: 10px;}
.req4105_chk input[type="checkbox"]:checked+label { display: inline-block; width: 18px; height: 18px; background: url('/images/contents/normal_check_on.png') no-repeat; line-height: 24px; vertical-align: middle; cursor: pointer; }

.req4105_end_maskBox {display: none;position: absolute;right: 0;width: 100%;height: 100%;min-height: 745px;background-color: rgba(0, 0, 0, 0.6);z-index: 2;color: #fff;padding-top: 300px;padding-left: 20px;text-align: left;line-height: 30px;}
</style>
<script>

var reqId = "${reqId}";
var usrId = "${usrId}";


var fd = new FormData();

var fileChk = new Array();
var fileAppendList = new Array();


var reqUsrId;


var processId;


var reqAtchFileId;


var readonlyFileIdList = [];


var essentialCdFileIdList = [];


var strFormId = "req4105InfoForm";
var strCheckObjArr = ["reqStDuDtm","reqEdDuDtm"];
var sCheckObjNmArr = ["작업 시작 예정일자","작업 종료 예정일자"];


var prjStartDt = '${selPrjInfo.startDt}';
var prjEndDt = '${selPrjInfo.endDt}';


var flowInfo;


var work_grid;


var revision_grid;


var signWaitChk = false;


var lastChkInfo;


var selFLowId;
var selFlowNextId;


var authGrpList = [];	
var signAuthGrpList = []; 


var loginUsrAuthGrpId = "${sessionScope.selAuthGrpId}";


var FILE_INFO_MAX_SIZE = "${fileInfoMaxSize}";
var FILE_SUM_MAX_SIZE = "${fileSumMaxSize}";


var arrChkObj = {"reqCompleteRatio":{"type":"number"}
				,"reqFp":{"type":"number"}
				,"reqExFp":{"type":"number"}};


globals_guideChkFn = fnReq4105GuideShow;
$(document).ready(function() {
	
	dndCancel();
	
	
	fnReq4105DataLoad();
	
});


var prevFlowList = [];


var removeEventArr = ["dragenter", "dragover", "drop"];


var processMiddleDoneCd;

function fnReq4105DataLoad(){
	
	var ajaxObj = new gfnAjaxRequestAction({"url":"<c:url value='/req/req4000/req4100/selectReq4105DataLoad.do'/>",loadingShow:false,async:true}
	,{reqId: reqId, dshType:"dsh1000"});
   	gfnShowLoadingBar(true);
    		
	
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
    	if(data.errorYN == 'Y'){
    		toast.push(data.message);
    		return false;
    	} 
    	else{
    		
    		var default_mstCdStrArr = 'REQ00012|CMM00001|REQ00011';
			var default_arrComboType = ["OS","OS","OS"];
			var default_arrObj = [$("#reqTypeCd"),$("#piaCd"),$("#sclCd")];
		
    		
			var strUseYn = 'Y';
			gfnGetMultiCommonCodeDataForm(default_mstCdStrArr, strUseYn, default_arrObj, default_arrComboType , false);
    		
			
			processMiddleDoneCd = data.processMiddleDoneCd;
			
			
			if(processMiddleDoneCd == "01"){
				$(".req4105_mdBtn").css({"display":"inline-block"});
			}
			
    		
    		processId = data.processId;

    		
    		gfnSetData2ParentObj(data.reqInfoMap,"req4105InfoForm");

    		
			reqAtchFileId = data.reqInfoMap.atchFileId;
    		
    		
    		var titleReqNm = data.reqInfoMap.reqNm;
    		$("span#popup_titleReqNm").text(gfnCutStrLen(titleReqNm,100));
    		
    		
    		fnRightFlowDivSetData(data.reqInfoMap.flowId,data.flowList);
    		
    		
    		var flowPushChk = false;
    		$.each((data.flowList).reverse() ,function(idx, map){
    			
    			if(gfnIsNull(map.flowNextId)){
    				return true;
    			}
    			
    			if(flowInfo.flowId == map.flowId){
    				
    				flowPushChk = true;
    				return true;
    			}
    			
    			if(map.flowSignCd == "01"){
    				return false;
    			}
    			if(flowPushChk){
	    			
	    			prevFlowList.push(map);
    			}
    			
    			
    			if(map.flowEssentialCd == "01"){
    				return false;
    			}
    		});
    		
    		
    		var reqTopData = fnTopReqChgDivSetData(data.reqChgList);

    		
    		fnPiaCdChg($("#piaCd")[0]);
    		
    		
    		$("#req4105_reqTopDataList").html(reqTopData);
    		
    		
    		$("#req4105_reqTopDataList").scrollLeft(9999);
    		
    		
    		reqUsrId = data.reqInfoMap.reqChargerId;
    		
    		
    		if(reqUsrId != usrId){
    			
    			$(".req4105_work_btn:not(.req4105_charger_work)").hide();
    			
    			
    			$(".req4105_revision_btn").hide();
    			
    			
    			$(".req4105_complete").hide();
    			
    			
    			$(".req4105_default_mask").show();
    			
    			
   				$("#dragandrophandler").addClass("widthAll");
    			
    			
    			$(".file_dragDrop_info").hide();

   				
				$.each(removeEventArr,function(idx, map){
					$("#dragandrophandler").off(map);
				});

    			
				$("#btn_insert_fileSelect").hide();
				
				
   				$('.btn_select_dplId').hide();
				
   				
	 			$(".req4105_input_text.req4105_deploy").attr("readonly","readonly");
   				
   				
   				$(".req4105_mdBtn").hide();
    		}
    		
    		var reqDplList = data.reqDplList;
    		fnReqDplSetting(reqDplList);
    		
    		
    		var reqChkList = data.reqChkList;
    		
    		
    		if(!gfnIsNull(reqChkList)){
    			fnReqChkSetting(reqChkList);
    		}else{
    			$(".req4105_sign_TitleBox, #req4105_signHistoryDiv").hide();
    		}
    		
    		
    		if(flowInfo.flowSignCd == "01"){
    			
    			if(flowInfo.flowSignStopCd == "01"){
    				
					strCheckObjArr.push("reqStDtm","reqEdDtm");
					sCheckObjNmArr.push("작업 시작 일시","작업 종료 일시");
					
					
					$(".endPrevStr").show();
    			}
    			
    			var signBoxShow = true;
    			
    			
    			if(!gfnIsNull(reqChkList) && reqChkList.length > 0){
	    			
	    			lastChkInfo = reqChkList[reqChkList.length-1];
	    			
	    			
	    			if(lastChkInfo.signCd == "01"){
	    				
	    				signBoxShow = false;
	    				
	    				
	    				selFlowNextId = $(".req4105_flowFrameBox[id="+lastChkInfo.signFlowId+"]").attr("nextid");
	    				
	    				
						var signUsrImgSrc = "/cmm/fms/getImage.do?fileSn=0&atchFileId="+lastChkInfo.signUsrImg;
				
	    				
	    				$("#signUsrHtml").html(
	    						'<br><i class="fa fa-user-check"></i>&nbsp;결재자: '+lastChkInfo.signUsrNm
	    						+'<br><img src="'+signUsrImgSrc+'">');
	    			}
    			}

    			
    			if(signBoxShow){
	    			
	    			$("#signIdSelBox").show();
	    			
	    			
	    			$("#btn_select_signUser").click(function() {
	    				var authData = $('#reqSignNm').val();
					
						
						if(!gfnIsNull(signAuthGrpList)){
							var signAuthGrpIds = [];
							$.each(signAuthGrpList,function(idx, map){
								signAuthGrpIds.push(map.authGrpId);
							});
							
							authData= { "usrNm" :  $('#reqSignNm').val() , authGrpIds : signAuthGrpIds };
						}
						gfnCommonUserPopup(authData,false,function(objs){
							if(objs.length>0){
								$('#reqSignId').val(objs[0].usrId);
								$('#reqSignNm').val(objs[0].usrNm);
							}
						});
					});
					
					$('#reqSignNm').keyup(function(e) {
						if($('#reqSignNm').val()==""){
							$('#reqSignId').val("");
						}
						if(e.keyCode == '13' ){
							$('#btn_select_signUser').click();
						}
					});
					
    			}else{
    				
    				$(".req4105_sign_maskBox").show();
    				
    				signWaitChk = true;
    				
    				$(".req4105_complete").hide();
    				
    				$(".req4105_work_btn").hide();
    				
    				$(".req4105_revision_btn").hide();
    				
    				$(".req4105_default_mask").show();
    				
       				$(".req4105_mdBtn").hide();
    				
    				$(".req4105_input_text.req4105_deploy").attr("readonly","readonly");
    				
    				
   					$("#dragandrophandler").addClass("widthAll");
    				
    				
    				$(".file_dragDrop_info").hide();
    				
    				
    				if(usrId == lastChkInfo.signUsrId){
    					$(".req4105_signBtn").css({"display":"inline-block"});
    				}
    			}
    		}
    		
    		
    		
    		if(flowInfo.flowAuthCd == "01"){
    			var flowAuthGrpList = data.flowAuthGrpList;
    			
    			if(!gfnIsNull(flowAuthGrpList)){
    				$.each(flowAuthGrpList,function(idx, map){
    					if(map.authGrpTargetCd == "01"){	
    						authGrpList.push(map);	
    					}else{	
    						signAuthGrpList.push(map);
    					}
    				});
    			}
    		}
    		
    		
    		
    		fnFlowOptDivSetData(data.optList);
    		
    		
    		if(!gfnIsNull(data.fileList)){
    			if(data.fileList.length > 0){
		        	
		        	$('#dndCancel').show();
		        }
    			
				
			 	$.each(data.fileList, function(idx, fileVo){
			 		fileVo['reqId'] = reqId;
			 		
			 		
			 		var fileAtchFileId = fileVo.atchFileId;
			 		
			 		
			 		var delChk = true;
			 		
			 		
			 		if(reqAtchFileId == fileAtchFileId){
			 			
			 			if(signWaitChk){
			 				delChk = false;
			 			}
			 			
				 		gfnFileListReadDiv(fileVo,"#dragandrophandler", "req",delChk);
			 		}else{
			 			
			 			if(readonlyFileIdList.indexOf(fileAtchFileId) > -1 || signWaitChk){
			 				delChk = false;
			 			}
			 			gfnFileListReadDiv(fileVo,"#fileDiv_"+fileAtchFileId, "req",delChk);
			 		}
			    });
			}
    		
    		
    		if(flowInfo.flowWorkCd == "01"){
    			
    			$("#req4105_work").show();
    			
    			fnWorkGridSetting(flowInfo.flowId);
    			
    			
				fnWorkRefresh(0, flowInfo.flowId);
    		}
    		
    		
    		if(flowInfo.flowRevisionCd == "01"){
    			
    			$("#req4105_revision").show();
    			
    			
    			fnRevisionGridSetting(flowInfo.flowId);
				
    			fnRevisionRefresh(0, flowInfo.flowId);
    		}
    		
    		
    		if(flowInfo.flowDplCd == "01"){
    			
    			$("#dplIdSelBox").show();
    			
   				
	 			if(signWaitChk){
	 				
	   				$('.btn_select_dplId').hide();
	   				
		 			$(".req4105_input_text.req4105_deploy").attr("readonly","readonly");
	 			}
    		}
    		
    		
    		if(gfnIsNull(flowInfo.flowNextId)){
    			
    			$(".req4105_end_maskBox").show();
    			
   				$(".req4105_complete").hide();
   				
   				$(".req4105_work_btn").hide();
   				
   				$(".req4105_revision_btn").hide();
   				
   				$('.btn_select_dplId').hide();
   				
	 			$(".req4105_input_text.req4105_deploy").attr("readonly","readonly");
   				
   				
    			$(".req4105_default_mask").show();
   				
   				
   				$("#dragandrophandler").addClass("widthAll");
   				
   				
    			$(".file_dragDrop_info").hide();
   				
   				
   				$(".file_btn.file_delete").hide();
   				
   				$(".req4105_mdBtn").hide();
    		}
    		
    		
    		if(!signWaitChk && !gfnIsNull(flowInfo.flowNextId)){
				
    			var rangeStartDt = data.reqInfoMap.reqDtm;
    			if(gfnIsNull(rangeStartDt)){
    				rangeStartDt = prjStartDt;
    			}
    			
				
				gfnCalRangeSet("reqStDtm", "reqEdDtm", rangeStartDt, null,true);
				
				
				gfnCalRangeSet("reqStDuDtm", "reqEdDuDtm", prjStartDt);
				
				
				$("#btn_user_select").click(function() {
					var authData = $('#reqChargerNm').val();
					
					
					if(!gfnIsNull(authGrpList)){
						var authGrpIds = [];
						$.each(authGrpList,function(idx, map){
							authGrpIds.push(map.authGrpId);
						});
						
						authData= { "usrNm" :  $('#reqChargerNm').val() , authGrpIds : authGrpIds };
					}
					gfnCommonUserPopup(authData,false,function(objs){
						if(objs.length>0){
							$('#reqChargerId').val(objs[0].usrId);
							$('#reqChargerNm').val(objs[0].usrNm);
						}
					});
				});
				
				$('#reqChargerNm').keyup(function(e) {
					if($('#reqChargerNm').val()==""){
						$('#reqChargerId').val("");
					}
					if(e.keyCode == '13' ){
						$('#btn_user_select').click();
					}
				});
				
				
				$("#btn_cls_select").click(function() {
					gfnCommonClsPopup(function(reqClsId,reqClsNm){
						$("#reqClsId").val(reqClsId);
						$("#reqClsNm").val(reqClsNm);
					});
				});
				
				
				if(reqUsrId == usrId){
					
					var maxFileNum = 30;
					if(maxFileNum==null || maxFileNum==""){
						maxFileNum = 3;
					}
					
					var multi_selector = new MultiSelector( document.getElementById( 'egovFileStatus' ), maxFileNum );
					multi_selector.addElement( document.getElementById( 'egovFileUpload' ) );	
					
					
					$("#dragandrophandler").click(function(){
						document.getElementById('egovFileUpload').click();		
					});
					
					
					if(!gfnIsNull(authGrpList)){
						var authGrpIds = [];
						$.each(authGrpList,function(idx, map){
							authGrpIds.push(map.authGrpId);
						});
						
						
						if(authGrpIds.indexOf(loginUsrAuthGrpId) == -1){							
							
							$(".req4105_chargerChgBtn").css({"display": "inline-block"});
							
			   				$(".req4105_complete").hide();
			   				
			   				$(".req4105_work_btn").hide();
			   				
			   				$(".req4105_revision_btn").hide();
			   				
			   				$('.btn_select_dplId').hide();
			   				
				 			$(".req4105_input_text.req4105_deploy").attr("readonly","readonly");
			   				
			   				
			   				$("#signIdSelBox").hide();
			   				
			   				
			    			$(".req4105_default_mask").show();
			   				
			   				
			   				$("#dragandrophandler").addClass("widthAll");
			   				
			   				
			    			$(".file_dragDrop_info").hide();
			   				
			   				
			   				$(".file_btn.file_delete").hide();
			   				
			   				
			   				$(".req4105_mdBtn").hide();
			   				
			   				var eventArr = removeEventArr.slice();
			   				
			   				eventArr.push("click");
			   				
							$.each(eventArr,function(idx, map){
								$("#dragandrophandler").off(map);
								$(".opt_drop_file").off(map);
							});

							$("#btn_insert_fileSelect").hide();
						}
					}
				}else{
					
					$(".file_btn.file_delete").hide()
					
					$.each(removeEventArr,function(idx, map){
						$("#dragandrophandler").off(map);
						$(".opt_drop_file").off(map);
					});
				}
			}else{
				
				$.each(removeEventArr,function(idx, map){
					$("#dragandrophandler").off(map);
					$(".opt_drop_file").off(map);
				});
				
				$("#btn_insert_fileSelect").hide();
			}
    		
    		
			$("div.req4105_titleFoldingBtn").click(function(){
				
				var $foldBtn = $(this).children(".req4105_titleFoldingContent");
				
				
				var foldNum = $foldBtn.attr("folding");
				
				
				var foldLayoutDown = $foldBtn.hasClass("down");
				
				
				var $foldDiv = $(".req4105_foldDiv[folding="+foldNum+"]");
				
				
				$foldDiv.slideToggle();
				
				
				if(foldLayoutDown){
					$(this).parent(".req4105_frameTitleDiv").removeClass("req4105_titleFolded");
					$foldBtn.removeClass("down").addClass("up");
				}else{
					$(this).parent(".req4105_frameTitleDiv").addClass("req4105_titleFolded");
					$foldBtn.removeClass("up").addClass("down");
				}
			});
    		gfnShowLoadingBar(false);
    	}
	});
	
	
	ajaxObj.setFnError(function(xhr, status, err){
		toast.push("ERROR STATUS("+status+")<br>"+err);
 	});
	
	
	ajaxObj.send();
}


function fnTopReqChgDivSetData(reqChgList){
	var reqTopData = "";
	
	
	$.each(reqChgList,function(idx, map){
		
		var flowOptionStr = "";
 		
	
		
		if(map.chgFlowEssentialCd == "01"){
			flowOptionStr += '<li class="fa fa-key" title="필수"></li>';
		}
		
		if(map.chgFlowSignCd == "01"){
			flowOptionStr += '<li class="fa fa-file-signature" title="결재"></li>';
		}
		
		if(map.chgFlowSignStopCd == "01"){
			flowOptionStr += '<li class="far fa-stop-circle" title="결재 반려 종료"></li>';
		}
		
		if(map.chgFlowEndCd == "01"){
			flowOptionStr += '<li class="fa fa-sign-out-alt" title="종료 분기"></li>';
		}
		
		if(map.chgFlowWorkCd == "01"){
			flowOptionStr += '<li class="fa fa-code-branch" title="작업 분기"></li>';
		}
		
		if(map.chgFlowRevisionCd == "01"){
			flowOptionStr += '<li class="fa fa-code" title="리비전 저장 유무"></li>';
		}
		
		if(map.chgFlowDplCd == "01"){
			flowOptionStr += '<li class="fa fa-puzzle-piece" title="배포계획 저장 유무"></li>';
			
			
			$("#req4105_dplDivFrame").append(
					'<div class="req4105_dplBox" flowid="'+map.chgFlowId+'">'
						+'<div class="req4105_option_title">배포 계획</div>'
						+'<div class="req4105_option_all">'
						+'	<input type="hidden" name="dplId_'+map.chgFlowId+'" id="dplId_'+map.chgFlowId+'" title="배포 계획" opttype="05" opttarget="03" optflowid="'+map.chgFlowId+'"/>'
						+'	<input type="text" title="배포 계획" class="req4105_input_text req4105_deploy" name="dplNm_'+map.chgFlowId+'" id="dplNm_'+map.chgFlowId+'" modifyset="02" flowid="'+map.chgFlowId+'"/>'
						+'	<span class="button_normal2 fl req4105_deploy btn_select_dplId" id="btn_select_dplId" flowid="'+map.chgFlowId+'"><li class="fa fa-search"></li></span>'
						+'</div>'
					+'</div>');
  			
   			$(".btn_select_dplId[flowid="+map.chgFlowId+"]").click(function() {
   				var data = { "dplNm" :  $('#dplNm_'+map.chgFlowId).val() , "dplSts" : "01" }; 
				gfnCommonDplPopup(data ,false,
					function(objs){
						if(objs.length>0){
							$('#dplId_'+map.chgFlowId).val(objs[0].dplId);
							$('#dplNm_'+map.chgFlowId).val(objs[0].dplNm);
						}
				});
			});
			
			$('#dplNm_'+map.chgFlowId).keyup(function(e) {
				if($('#dplNm_'+map.chgFlowId).val()==""){
					$('#dplId_'+map.chgFlowId).val("");
				}
				if(e.keyCode == '13' ){
					$(".btn_select_dplId[flowid="+map.chgFlowId+"]").click();
				}
			});
		}
		
		if(map.chgFlowAuthCd == "01"){
			flowOptionStr += '<li class="fa fa-user-shield" title="허용 역할그룹 제한유무"></li>';
		}
		
		if(map.chgFlowOptCnt > 0){
			flowOptionStr += '<li class="fa fa-list" title="추가 항목"></li>+'+map.chgFlowOptCnt;
		}
	
		
		
			flowOptionStr = '<div class="req4105_flowOptionDiv">'+flowOptionStr+'</div>';
		
		
		
		var topArrowBox = '';
		
		
		if(!gfnIsNull(flowInfo.flowNextId) || flowInfo.flowId != map.chgFlowId){
			
			topArrowBox = '<div class="req4105_flow_topArrowBox"></div>';
		}
		
		
		var flowActive = "";
		
		
		if(reqChgList.length-1 == idx){
			flowActive = " flowActive";
			
			
			if($(".req4105_dplBox[flowid="+map.chgFlowId+"]").length > 0){
				$(".req4105_dplBox[flowid="+map.chgFlowId+"]").show();
			}
		}
		
		reqTopData += 
				'<div class="req4105_flowBox topFlowBox'+flowActive+'" fileid="'+map.atchFileId+'" flowid="'+map.chgFlowId+'" workcd="'+map.chgFlowWorkCd+'" revisioncd="'+map.chgFlowRevisionCd+'" authcd="'+map.chgFlowAuthCd+'" dplcd="'+map.chgFlowDplCd+'" style="background-color: '+map.chgFlowTitleBgColor+';color: '+map.chgFlowTitleColor+';" onclick="fnSelectTopFlow(this)">'
				+flowOptionStr
				+'	<div class="req4105_flowBox_title">'+map.chgFlowNm+'</div>'
				+'	<div class="req4105_flowBox_contents" flowid="'+map.chgFlowId+'" style="background-color: '+map.chgFlowContentBgColor+';color: '+map.chgFlowContentColor+';">'
				+new Date(map.chgDtm).format('yyyy-MM-dd HH:mm:ss')
				+'</div>'
				+'</div>'
				+topArrowBox;
	});
	
	return reqTopData;
}


function fnSelFlowObjHidden(flowId){
	
	$(".req_main_box.req_bottom[prevflowid="+flowId+"]").show();
	$(".req4105_flow_topArrowBox.signArrow[prevflowid="+flowId+"]").show();
	
	
	$(".req_main_box.req_bottom[prevflowid!="+flowId+"]").hide();
	$(".req4105_flow_topArrowBox.signArrow[prevflowid!="+flowId+"]").hide();
	
	
	if($(".req_main_box.req_bottom[prevflowid="+flowId+"]").length == 0){
		$(".req4105_sign_TitleBox, #req4105_signHistoryDiv").hide();
	}else{
		
		$(".req4105_sign_TitleBox, #req4105_signHistoryDiv").show();
	}
	
	
	$("#req4105_add_option .req4105_option_title[optflowid="+flowId+"]").show();
	$("#req4105_add_option .req4105_option_half[optflowid="+flowId+"]").show();
	$("#req4105_add_option .req4105_option_all[optflowid="+flowId+"]").show();
	
	
	$("#req4105_add_option .req4105_option_title[optflowid!="+flowId+"]").hide();
	$("#req4105_add_option .req4105_option_half[optflowid!="+flowId+"]").hide();
	$("#req4105_add_option .req4105_option_all[optflowid!="+flowId+"]").hide();
	
	
	if($("#req4105_add_option > div").eq($("#req4105_add_option > div").length-1).hasClass("req4105_option_half")){
		if($("#req4105_add_option > div.req4105_option_half[optflowid="+flowId+"]").length%2 == 1){
			var descClass = '';
			
			if($("#req4105_add_option > div.req4105_option_half[optflowid="+flowId+"]").hasClass("req4105_desc")){
				descClass = " req4105_desc";
			}
			
			$("#req4105_add_option").append('<div class="req4105_option_title'+descClass+'" optflowid="'+flowId+'"></div><div class="req4105_option_half'+descClass+'" optflowid="'+flowId+'"></div>');
		}
	}
}

function fnSelectTopFlow(thisObj){
	

	
	
	$(".req4105_flowBox.topFlowBox.flowActive").removeClass("flowActive");
	$(thisObj).addClass("flowActive");
	
	var flowId = $(thisObj).attr("flowid");
	var workCd = $(thisObj).attr("workcd");
	var revisionCd = $(thisObj).attr("revisioncd");
	var dplcd = $(thisObj).attr("dplcd");
	
	
	fnSelFlowObjHidden(flowId);
	
	
	if(flowInfo.flowSignCd == "01"){
		
		if(flowId != flowInfo.flowId){
			$("#signIdSelBox").hide();
		}else{
			
			if(!signWaitChk){
				$("#signIdSelBox").show();
			}
		}
	}
	
	
	if(workCd == "01"){
		$("#req4105_work").show('fast',function(){
			
			if(flowId != flowInfo.flowId){
				$(".req4105_work_btn").hide();
			}else{
				
				if(signWaitChk){
					$(".req4105_work_btn").hide();
				}
				
				else if(reqUsrId != usrId){
	    			$(".req4105_charger_work").show();
	    		}else{	
	    			$(".req4105_work_btn").show();	
	    		}
			}
			
			
			fnWorkGridSetting(flowId);
			
			fnWorkRefresh(0, flowId);
		});
	}else{
		$("#req4105_work").hide();
	}
	
	
	if(revisionCd == "01"){
		$("#req4105_revision").show('fast',function(){
			
			if(flowId != flowInfo.flowId){
				$(".req4105_revision_btn").hide();
			}else{
				
				if(signWaitChk){
					$(".req4105_revision_btn").hide();
				}
				
				else if(reqUsrId != usrId){
					$(".req4105_revision_btn").hide();
	    		}else{
		    		$(".req4105_revision_btn").show();	
				}
			}
			
			
			fnRevisionGridSetting(flowId);
			
			
			fnRevisionRefresh(0, flowId);
		});
	}else{
		$("#req4105_revision").hide();
	}
	
	
	
	if(dplcd == "01"){
		$(".req4105_dplBox").hide();
		$(".req4105_dplBox[flowid="+flowId+"]").show('fast');
	}else{
		$(".req4105_dplBox").hide();
	}
}


function fnWorkGridSetting(flowId){
	work_grid = new ax5.ui.grid();
				
	
	work_grid.setConfig({
		target: $('[data-ax5grid="work-grid"]'),
		showLineNumber: true,
		sortable:true,
		header: {align:"center"},
		columns: [
			{key: "flowNm", label: "작업흐름", width: 80, align: "center"},
			{key: "workStatusNm", label: "작업상태", width: 80, align: "center"},
			{key: "workChargerNm", label: "담당자", width: 80, align: "center"},
			{key: "workAdmContent", label: "작업 지시내용", width: 370, align: "left"},
			{key: "workAdmStDtm", label: "작업 시작예정일자", width: 140, align: "center"},
			{key: "workAdmEdDtm", label: "작업 종료예정일자", width: 140, align: "center"},
			{key: "workContent", label: "작업 내용", width: 370, align: "left"},
			{key: "workStDtm", label: "작업 시작일자", width: 140, align: "center"},
			{key: "workEdDtm", label: "작업 종료일자", width: 140, align: "center"},
			{key: "regDtm", label: "생성일자", width: 140, align: "center"},
			{key: "regUsrNm", label: "생성자", width: 80, align: "center"},
			{key: "modifyDtm", label: "수정일자", width: 140, align: "center"},
			{key: "modifyUsrNm", label: "수정자", width: 80, align: "center"},
		],
		body: {
			align: "center",
			columnHeight: 30
		},
		page: {
            navigationItemCount: 9,
            height: 30,
            display: true,
            firstIcon: '<i class="fa fa-step-backward" aria-hidden="true"></i>',
            prevIcon: '<i class="fa fa-caret-left" aria-hidden="true"></i>',
            nextIcon: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
            lastIcon: '<i class="fa fa-step-forward" aria-hidden="true"></i>',
            onChange: function () {
            	fnWorkRefresh(this.page.selectPage, flowId);
            }
        }
	});
}


function fnRightFlowDivSetData(nowFlowId, flowList){
	
 	var reqRightData = "";
 	
	
	var flowEndShowChk = false;
	
	
	var flowEssentialShowChk = false;
	
	
	var flowCheck = false; 
	
	
	var drawFlowCnt = 0;
	
 	
 	if(!gfnIsNull(flowList)){
 		$.each(flowList,function(idx, map){
 			
 			if(!flowCheck){
 				if(map.flowId == nowFlowId){
 					flowCheck = true;
 					
 					
 					flowInfo = map;
 				}
 				return true;
 			}else{
 				
 				drawFlowCnt++;
 			}
 			
 			
 			
 			if(flowEssentialShowChk){
 				
				if(flowInfo.flowEndCd == "01"){
					
					if(!gfnIsNull(map.flowNextId) && map.flowNextId != "null"){
						return true;	
					}
				}else{
	 				return false;
				}
 			}
 			
 			var flowTopArrowBox = '';
 			
 			
 			if(drawFlowCnt > 1){
 				flowTopArrowBox = '<div class="req4105_flowTopArrowBox"></div>';
 			}
 			
 			
 			var moveType = "${param.moveType}";
 			if(!gfnIsNull(moveType) && moveType == "kanban"){
 				var endProcessId = "${param.endProcessId}";
 				var endFlowId = "${param.endFlowId}";
 				
 				
 				if(endProcessId != map.processId || endFlowId != map.flowId){
 					return true;
 				}
 				
 				else if(endProcessId == map.processId && endFlowId == map.flowId){
 					flowTopArrowBox = '';
 				}
 				
 			}
	 		
			var flowOptionStr = "";
 			
			if(gfnIsNull(map.flowNextId) || map.flowNextId == "null"){
				flowOptionStr += "<li class='far fa-stop-circle' title='[종료]최종 완료'></li>&nbsp;";
			} 
			
			if(map.flowEssentialCd == "01"){
				flowOptionStr += '<li class="fa fa-key" title="필수"></li>&nbsp;';
			}
			
			if(map.flowSignCd == "01"){
				flowOptionStr += '<li class="fa fa-file-signature" title="결재"></li>&nbsp;';
			}
			
			if(map.flowEndCd == "01"){
				flowOptionStr += '<li class="fa fa-sign-out-alt" title="종료 분기"></li>&nbsp;';
			}
			
			if(map.flowWorkCd == "01"){
				flowOptionStr += '<li class="fa fa-code-branch" title="작업 분기"></li>&nbsp;';
			}
			
			if(map.flowRevisionCd == "01"){
				flowOptionStr += '<li class="fa fa-code" title="리비전 저장 유무"></li>';
			}
			
			if(map.flowDplCd == "01"){
				flowOptionStr += '<li class="fa fa-puzzle-piece" title="배포계획 저장 유무"></li>';
			}
			
			if(map.flowAuthCd == "01"){
				flowOptionStr += '<li class="fa fa-user-shield" title="허용 역할그룹 제한유무"></li>';
			}
			
			if(map.optCnt > 0){
				flowOptionStr += '<li class="fa fa-list" title="추가 항목"></li>+'+map.optCnt;
			}
		
			
			
				flowOptionStr = '<div class="req4105_flowOptionDiv">'+flowOptionStr+'</div>';
			
			
			
	 		reqRightData += flowTopArrowBox
 								+'<div class="req4105_flowFrameBox" id="'+map.flowId+'" nextid="'+map.flowNextId+'" flownm="'+map.flowNm+'">'
 								+'<div class="req4105_flowBox" style="background-color: '+map.flowTitleBgColor+';color: '+map.flowTitleColor+';">'
								+flowOptionStr
								+'	<div class="req4105_flowBox_title">'+map.flowNm+'</div>'
								+'	<div class="req4105_flowBox_contents" style="background-color: '+map.flowContentBgColor+';color: '+map.flowContentColor+';">'
								+'<span>요구사항: '+map.reqTotalCnt+'</span>'
								+'</div>'
								+'</div>'
							+'</div>';
							
			
 			if(map.flowEndCd == "01"){
 				flowEndShowChk = true;
 			}
			
			
			if(map.flowEssentialCd == "01"){
 				flowEssentialShowChk = true;
 			}
 		});
	}
 	
 	
    $("#req4105_reqRightDataList").html(reqRightData);
 	return true;
}


function fnFlowOptDivSetData(optList){
	var flowOptData = '';
	
	if(!gfnIsNull(optList)){
		
		var optDateDataArr = [];
		
		
		var mstCdStrArr = '';
		var selectObjList = [];
		var arrComboType = [];
		
		
		var commonPopup_charger = [];	
		var commonPopup_cls = [];	
		var commonPopup_dept = [];	
		
		
		var halfCnt = 0;
		
		var halfDivDesc = false;
		
		var hlafFlowId = "";
		
		var rowCnt = 0;
		
		
		var lastFlowId = null;
		
		var authGrpMissChk = false;

		
		var optAtchFileChk = false;
		
		
		if(!gfnIsNull(authGrpList)){
			var authGrpIds = [];
			$.each(authGrpList,function(idx, map){
				authGrpIds.push(map.authGrpId);
			});
			
			
			if(authGrpIds.indexOf(loginUsrAuthGrpId) == -1){	
				authGrpMissChk = true;
			}
		}
		
		
		$.each(optList,function(idx, map){
			
			
			var optionWidthSize = '';
			
			var optionTitleClass = '';
			var optionDefaultWidthSize = '';
			
			
			if(map.itemRowNum == "01"){ 
				optionDefaultWidthSize = "req4105_option_half";
				
				rowCnt++;
				halfCnt++;
				hlafFlowId = map.flowId;
				
			}else if(map.itemRowNum == "02"){ 
				optionDefaultWidthSize = "req4105_option_all";
				optionTitleClass = " req4105_clear";
				rowCnt++;
				halfCnt+=2;
			}
			
			if(map.itemCode == "01"){
				if(map.itemType == "02"){ 
					
					optionWidthSize = " req4105_desc";
					optionTitleClass = " req4105_desc";
				}
			}
			else if(map.itemCode == "03"){ 
				
				optionWidthSize = " req4105_file";
				optionTitleClass = " req4105_file";
			}
			
			
			var flowOptContentData = '';
			
			var itemValue = '';
			var optTarget = "02";
			var optReadOnlyChk = false;
			var optReadOnly = '';
			var optAddClass = '';
			halfDivDesc = false;
			
			
			if(flowInfo.flowId != map.flowId){
				
				if(map.itemModifyCd == "02"){
					optReadOnlyChk = true;
				}
			}
			
			
			if(signWaitChk){
				optReadOnlyChk = true;
			}
			
			
    		if(reqUsrId != usrId){
    			optReadOnlyChk = true;
    		}
			
			
			if($(".req4105_flowFrameBox").length == 0){
				optReadOnlyChk = true;
			}
			
			if(authGrpMissChk){
				optReadOnlyChk = true;
			}
			
			
			if(!gfnIsNull(map.itemValue)){
				itemValue = map.itemValue;
			}
			
			
			if(map.itemCode == "01"){ 
				if(map.itemType == "01"){ 
					if(optReadOnlyChk){
						optReadOnly = 'readonly="readonly"';
						optAddClass += ' req4105_readonly';
					}else{
						
						var checkData = {};
						checkData[map.itemId] =  {"type":"length","msg":"추가 항목 "+map.itemNm+"(은)는 "+map.itemLength+"byte까지 입력이 가능합니다.",max:map.itemLength};
						arrChkObj = $.extend(arrChkObj,checkData);
					}
				
					flowOptContentData = '<input type="text" class="req4105_input_text'+optAddClass+'" title="'+map.itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" maxlength="'+map.itemLength+'" optflowid="'+map.flowId+'" opttarget="'+optTarget+'" value="'+itemValue+'" '+optReadOnly+'/>';
					
				}else if(map.itemType == "02"){ 
					if(optReadOnlyChk){
						optReadOnly = 'readonly="readonly"';
						optAddClass += ' req4105_readonly';
					}else{
						
						var checkData = {};
						checkData[map.itemId] =  {"type":"length","msg":"추가 항목 "+map.itemNm+"(은)는 "+map.itemLength+"byte까지 입력이 가능합니다.",max:map.itemLength};
						arrChkObj = $.extend(arrChkObj,checkData);
					}
				
					
					itemValue = itemValue.replace(/<br>/gi,"\n").replace(/<\/br>/gi,"\n");
					flowOptContentData = '<textarea class="req4105_textarea'+optAddClass+'" title="'+map.itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" optflowid="'+map.flowId+'" opttarget="'+optTarget+'" '+optReadOnly+'>'+itemValue+'</textarea>';
					
					
					optionWidthSize = " req4105_desc";
					optionTitleClass = " req4105_desc";
					
					halfDivDesc = true;
				}else if(map.itemType == "03"){ 
					if(optReadOnlyChk){
						optReadOnly = 'disabled="disabled"';
						optAddClass += ' req4105_readonly';
					}
					var optChkVal = ""
					
					if(map.itemValue == "01"){
						optChkVal = " checked";
					}
					
					flowOptContentData = '<div class="req4105_chk"><input type="checkbox" class="req4105_input_check'+optAddClass+'" title="'+map.itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" optflowid="'+map.flowId+'" opttarget="'+optTarget+'"'+optChkVal+' '+optReadOnly+'/><label></label></div>';
				}else if(map.itemType == "04"){ 
					if(optReadOnlyChk){
						optReadOnly = 'disabled="disabled"';
						optAddClass += ' req4105_readonly';
					}else{
						
						optDateDataArr.push({id:map.itemId,format:'YYYY-MM-DD',options:{drops:"up"}});
					}
					flowOptContentData = '<input type="text" class="req4105_input_date'+optAddClass+'" title="'+map.itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" optflowid="'+map.flowId+'" readonly="readonly" opttarget="'+optTarget+'" value="'+itemValue+'" '+optReadOnly+'/>';
					
					
				}else if(map.itemType == "05"){ 
					if(optReadOnlyChk){
						optReadOnly = 'disabled="disabled"';
						optAddClass += ' req4105_readonly';
					}else{
						
						optDateDataArr.push({id:map.itemId,format:'YYYY-MM-DD HH:mm',options:{timePicker:true,drops:"up"}});
					}
					flowOptContentData = '<input type="text" class="req4105_input_date'+optAddClass+'" title="'+map.itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" optflowid="'+map.flowId+'" readonly="readonly" opttarget="'+optTarget+'" value="'+itemValue+'" '+optReadOnly+'/>';
					
					
				}
			}else if(map.itemCode == "02"){ 
				if(optReadOnlyChk){
						optReadOnly = 'disabled="disabled"';
						optAddClass += ' req4105_readonly';
				}
				flowOptContentData = '<select type="text" class="req4105_select'+optAddClass+'" title="'+map.itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" optflowid="'+map.flowId+'" opttype="02" cmmcode="'+map.itemCommonCode+'" opttarget="'+optTarget+'" OS="'+itemValue+'" '+optReadOnly+'></select>';
				
				
				if(mstCdStrArr.length > 0){
					mstCdStrArr += "|"
				}
				
				
				mstCdStrArr += map.itemCommonCode;
				selectObjList.push(map.itemId);
				arrComboType.push("OS");
			}else if(map.itemCode == "03"){ 
				
				
				optAtchFileChk = true;
				
				
				optionWidthSize += " req4105_file";
				optionTitleClass += " req4105_file";
				
				var fileUploadBtnStr = '';
				var fileUploadWidth = '';
				var fileUploadDesc = '';
				
				
				if(!optReadOnlyChk){
					fileUploadBtnStr = '<div class="req4105_fileBtn" onclick="fnOptFileUpload(this)" id="btn_insert_fileSelect" itemid="'+map.itemId+'" fileid="'+map.itemValue+'">'
										+'<input type="file" style="display: none" id="fileUpload_'+map.itemValue+'" name="fileUpload_'+map.itemValue+'" multiple="multiple" />'
										+'<i class="fa fa-file-upload fa-2x"></i>&nbsp;파일 선택'
									+'</div>';
					
					fileUploadDesc = '<div class="file_dragDrop_info">Drop files here or click to upload.</div>';
				}else{
					
					fileUploadWidth = ' widthAll';
					
					
					readonlyFileIdList.push(map.itemValue);
				}
				
				
				if(map.itemEssentialCd == "01" && !optReadOnlyChk){
					essentialCdFileIdList.push(map.itemValue);
				}
					
				flowOptContentData = '<div class="uploadOverFlow optFileDiv'+fileUploadWidth+' opt_drop_file" id="fileDiv_'+map.itemValue+'" fileid="'+map.itemValue+'" onclick="fnOptFileUpload(this)">'
										+fileUploadDesc+'</div>'
										+fileUploadBtnStr;
				
			}else if(map.itemCode == "04"){ 
				var popupBtnStr = '';
				if(optReadOnlyChk){
					optReadOnly = 'readonly="readonly"';
					optAddClass += ' req4105_readonly';
				}else{
					
					commonPopup_charger.push(map.itemId);
					popupBtnStr = '<span class="button_normal2 fl req4105_optCharger" id="btn_user_select_'+map.itemId+'"><li class="fa fa-search"></li></span>';
				}
				flowOptContentData = '<input type="text" name="'+map.itemId+'" id="'+map.itemId+'" title="'+map.itemNm+'" opttype="03" optflowid="'+map.flowId+'" opttarget="'+optTarget+'" value="'+itemValue+'" style="display:none;"/>'
									+'<input type="text" class="req4105_input_text req4105_optCharger'+optAddClass+'" title="'+map.itemNm+'" name="'+map.itemId+'Nm" id="'+map.itemId+'Nm" modifyset="02" value="'+$.trim(map.itemValueNm)+'"/>'
									+popupBtnStr;
									
				
			}else if(map.itemCode == "05"){ 
				var popupBtnStr = '';
				if(optReadOnlyChk){
					optReadOnly = 'readonly="readonly"';
					optAddClass += ' req4105_readonly';
				}else{
					
					commonPopup_cls.push(map.itemId);
					popupBtnStr = '<span class="button_normal2 fl req4105_cls" id="btn_cls_select_'+map.itemId+'"><li class="fa fa-search"></li></span>';
				}
				flowOptContentData = '<input type="text" name="'+map.itemId+'" id="'+map.itemId+'" title="'+map.itemNm+'" opttype="04" optflowid="'+map.flowId+'" opttarget="'+optTarget+'" value="'+itemValue+'" style="display:none;"/>'
									+'<input type="text" class="req4105_input_text req4105_cls'+optAddClass+'" title="'+map.itemNm+'" name="'+map.itemId+'Nm" id="'+map.itemId+'Nm" modifyset="02" value="'+$.trim(map.itemValueNm)+'" readonly="readonly"/>'
									+popupBtnStr;
			}else if(map.itemCode == "06"){ 
				var popupBtnStr = '';
				if(optReadOnlyChk){
					optReadOnly = 'readonly="readonly"';
					optAddClass += ' req4105_readonly';
				}else{
					
					commonPopup_dept.push(map.itemId);
					popupBtnStr = '<span class="button_normal2 fl req4105_dept" id="btn_dept_select_'+map.itemId+'"><li class="fa fa-search"></li></span>';
				}
				flowOptContentData = '<input type="text" name="'+map.itemId+'" id="'+map.itemId+'" title="'+map.itemNm+'" opttype="06" optflowid="'+map.flowId+'" opttarget="'+optTarget+'" value="'+itemValue+'" style="display:none;"/>'
									+'<input type="text" class="req4105_input_text req4105_dept'+optAddClass+'" title="'+map.itemNm+'" name="'+map.itemId+'Nm" id="'+map.itemId+'Nm" modifyset="02" value="'+$.trim(map.itemValueNm)+'" readonly="readonly"/>'
									+popupBtnStr;
			}
			
			
			if(map.itemEssentialCd == "01" && (map.itemCode == "04" || map.itemCode == "05" || map.itemCode == "06")){
				strCheckObjArr.push(map.itemId+'Nm');
				sCheckObjNmArr.push(map.itemNm);
			}
			
			
			if(map.itemCode != "03" && map.itemEssentialCd == "01"){
				strCheckObjArr.push(map.itemId);
				sCheckObjNmArr.push(map.itemNm);
			}
			
			
			var optNm = map.itemNm;
			
			
			if(map.itemEssentialCd == '01'){
				optNm += '&nbsp;(*)';
			}
			
			flowOptData += '<div class="req4105_option_title'+optionTitleClass+'" optflowid="'+map.flowId+'">'
								+optNm
								+'</div>'
								+'<div class="'+optionDefaultWidthSize + optionWidthSize+'" optflowid="'+map.flowId+'">'
								+flowOptContentData
								+'</div>';
								
			
			lastFlowId = map.flowId
		});
	}

	
	$("#req4105_add_option").html(flowOptData);


	
	var targetElem = $("#req4105_add_option > div.req4105_option_title");
	
	var flowOptItemArr = {};
	
	
	$.each(targetElem,function(idx, map){

		
		var curtFlowId = $(map).attr("optflowid");
		
		var currentFlowOptElem = $("#req4105_add_option > div.req4105_option_title[optflowid="+curtFlowId+"]");
		
		if(gfnIsNull(flowOptItemArr[curtFlowId])){
			flowOptItemArr[curtFlowId] = [];
		}
		
		flowOptItemArr[curtFlowId].push(map);
	});
	
	
	$.each(flowOptItemArr,function(optFlowId, map){
		
		
		var halfCnt = 0;
		
		var optItemCnt = map.length;
		
		
		$.each(map, function(idx, optMap){
			
			
			var $nextDiv = $(optMap).next("div[optflowid="+ optFlowId +"]");
			
			var $nextNextDiv  = $nextDiv.next("div[optflowid="+ optFlowId +"]").next("div[optflowid="+ optFlowId +"]");
			
			
			
			var optionAll = $nextDiv.hasClass("req4105_option_all");
			
			var optionDesc = $(optMap).hasClass("req4105_desc");
			
			
			var nextOptionAll = $nextNextDiv.hasClass("req4105_option_all");
			
			var nextDesc = $nextDiv.next("div[optflowid="+ optFlowId +"]").hasClass("req4105_desc");
			
			
			if(!optionAll){
				
				halfCnt += 1;
				
				
				if(optionDesc){
					
					if(halfCnt%2 == 1){
						
						if( nextOptionAll || (!nextOptionAll && !nextDesc) ){
							
							$nextDiv.after('<div class="req4105_option_title req4105_desc" optflowid="'+optFlowId+'"></div>'
										+'<div class="req4105_option_half req4105_desc" optflowid="'+optFlowId+'"></div>');
							
							
							halfCnt += 1;
						}
					}
					
				
				}else{
					
					if(halfCnt%2 == 1){
						
						if( nextOptionAll || (!nextOptionAll && nextDesc) ){
							
							$nextDiv.after('<div class="req4105_option_title" optflowid="'+optFlowId+'"></div>'
										+'<div class="req4105_option_half" optflowid="'+optFlowId+'"></div>');
							
							
							halfCnt += 1;
						}
					}
				}
			}
			
			
			if( optItemCnt == (idx+1)){
				
				if(halfCnt%2 == 1){	
					
					if(optionDesc){
						
						$nextDiv.after('<div class="req4105_option_title req4105_desc" optflowid="'+optFlowId+'"></div>'
									+'<div class="req4105_option_half req4105_desc" optflowid="'+optFlowId+'"></div>');
						halfCnt += 1;
					
					
					}else{
						
						$nextDiv.after('<div class="req4105_option_title" optflowid="'+optFlowId+'"></div>'
									+'<div class="req4105_option_half" optflowid="'+optFlowId+'"></div>');
						halfCnt += 1;
					}
				}
				return false;
			}
		});
	});


	
	if(optAtchFileChk){
		
		var dragAndDropList =[{auth:"opt", obj:$(".opt_drop_file"), rtnFunc:fnReq4105OptFileUploadList}];
		fnDragAndDropEventSet(dragAndDropList);	
	}
	
	
	var removeArr = removeEventArr.slice();
	
	removeArr.push("click");
	
	$.each(readonlyFileIdList,function(idx, fileId){
		
		$.each(removeArr,function(arrIdx, delEvent){
			
			$(".opt_drop_file[fileid="+fileId+"]").off(delEvent);
		});
	});
	
	
	
	
	if(!gfnIsNull(optDateDataArr)){
		$.each(optDateDataArr,function(idx, map){
			gfnCalendarSet(map.format,[map.id],map.options);
		});
	}
	
	
	var flowId = flowInfo.flowId; 
	$("#req4105_add_option .req4105_option_title[optflowid!="+flowId+"]").hide();
	$("#req4105_add_option .req4105_option_half[optflowid!="+flowId+"]").hide();
	$("#req4105_add_option .req4105_option_all[optflowid!="+flowId+"]").hide();
	
	
	if(!gfnIsNull(selectObjList)){
		var arrObj = [];
		
		
		$.each(selectObjList,function(idx, map){
			arrObj.push($("#"+map+""));
		});
		
		
		var strUseYn = 'Y';
		gfnGetMultiCommonCodeDataForm(mstCdStrArr, strUseYn, arrObj, arrComboType , false);
	}
	
	if(!gfnIsNull(arrChkObj) && Object.keys(arrChkObj).length > 0){
		
		gfnInputValChk(arrChkObj);
	}
	
	
	if(!gfnIsNull(commonPopup_charger)){
		
		$.each(commonPopup_charger,function(idx, map){
			$("#btn_user_select_"+map).click(function() {
				gfnCommonUserPopup( $('#'+map+'Nm').val() ,false,function(objs){
					if(objs.length>0){
						$('#'+map).val(objs[0].usrId);
						$('#'+map+'Nm').val(objs[0].usrNm);
					}
				});
			});
			
			$('#'+map+'Nm').keyup(function(e) {
				if($('#'+map+'Nm').val()==""){
					$('#'+map).val("");
				}
				if(e.keyCode == '13' ){
					$("#btn_user_select_"+map).click();
				}
			});
		});
	}
	if(!gfnIsNull(commonPopup_cls)){
		
		$.each(commonPopup_cls,function(idx, map){
			$("#btn_cls_select_"+map).click(function() {
				gfnCommonClsPopup(function(reqClsId,reqClsNm){
					$('#'+map).val(reqClsId);
					$('#'+map+'Nm').val(reqClsNm);
				});
			});
		});
	}
	
	if(!gfnIsNull(commonPopup_dept)){
		
		$.each(commonPopup_dept,function(idx, map){
			var inputDeptName = $('#'+map+'Nm').val();
			
			$("#btn_dept_select_"+map).click(function() {
				gfnCommonDeptPopup(inputDeptName, function(deptId,deptNm){
					$('#'+map).val(deptId);
					$('#'+map+'Nm').val(deptNm);
				});
			});
		});
	}
}


function fnWorkPopupOpen(type){
	var workId = "";
	
	
	if(type == "update"){
		
		
		if(Object.keys(work_grid.focusedColumn).length == 0){
			jAlert("수정할 작업을 선택해주세요.","알림");
			return false;
		}
		
		var item = work_grid.list[work_grid.focusedColumn[Object.keys(work_grid.focusedColumn)].doindex];
		
		if(item.workStatusCd == "02"){
			jAlert("종료된 작업은 수정이 불가능 합니다.","알림");
			return false;
		}
		else{
			workId = item.workId;
		}
	}
	
	
	var data = {"type":type,reqId: reqId,processId: processId, flowId: flowInfo.flowId, workId: workId};
	gfnLayerPopupOpen("/req/req4000/req4100/selectReq4107View.do", data, '700', '430','scroll');
}


function fnWorkDelete(){
	
	if(Object.keys(work_grid.focusedColumn).length == 0){
		jAlert("삭제할 작업을 선택해주세요.","알림");
		return false;
	}
	var item = work_grid.list[work_grid.focusedColumn[Object.keys(work_grid.focusedColumn)].doindex];
	var workId = item.workId;

	
	if(item.workStatusCd == "02"){
		jAlert("종료된 작업은 삭제가 불가능합니다.","알림");
		return false;
	}
	
	jConfirm("작업 내용을 삭제 하시겠습니까?", "알림", function( result ) {
		if( result ){
			
			var ajaxObj = new gfnAjaxRequestAction(
					{"url":"<c:url value='/req/req4000/req4400/deleteReq4400ReqWorkInfoAjax.do'/>"},
					{reqId: reqId,processId: processId, flowId: flowInfo.flowId, workId: workId});
			
			ajaxObj.setFnSuccess(function(data){
				data = JSON.parse(data);
				
				toast.push(data.message);
				
				
				if(data.errorYN != "Y"){
					
					fnWorkRefresh(work_grid.page.currentPage, flowInfo.flowId);
				}
			});
			
			
			ajaxObj.setFnError(function(xhr, status, err){
				data = JSON.parse(data);
				jAlert(data.message, "알림");
		 	});
			
			ajaxObj.send();
		}
	});
}


function fnWorkRefresh(_pageNo, flowId){
	
	if(gfnIsNull(flowId)){
		flowId = flowInfo.flowId;
	}
	
	var ajaxParam ="";
	
	
 	if(!gfnIsNull(_pageNo)){
 		ajaxParam += "&pageNo="+_pageNo;
 	}else if(typeof work_grid.currentPage != "undefined"){
 		ajaxParam += "&pageNo="+work_grid.page.currentPage;
 	}
	
 	ajaxParam += "&reqId="+reqId+"&processId="+processId+"&flowId="+flowId;
	
	
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/req/req4000/req4400/selectReq4400ReqWorkListAjax.do'/>","loadingShow":false},
			ajaxParam);
	
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		
		if(data.errorYN != "Y"){
			
			var list = data.list;
			
			var page = data.page;
			
			work_grid.setData({
	             	list:list,
	             	page: {
	                  currentPage: _pageNo || 0,
	                  pageSize: page.pageSize,
	                  totalElements: page.totalElements,
	                  totalPages: page.totalPages
	              }
    		});
			
		}else{
			toast.push(data.message);
		}
	});
	
	
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림");
 	});
	
	ajaxObj.send();
}

function fnReqHalfSave(){
	
	if(usrId != reqUsrId){
		jAlert("담당자가 아닌경우 처리가 불가능합니다.","경고");
		return false;
	}
	
	
	$(".inputError").removeClass("inputError");
	
	
	var chkRtn = gfnRequireCheck("req4105InfoForm", strCheckObjArr, sCheckObjNmArr);
	
	
	var fileRtn = fnFileRequireCheck();
	
	
	if(chkRtn || !fileRtn){
		return false;
	}
	
	
	if($(".inputError").length > 0){
		jAlert("유효하지 않은 값이 입력된 항목이 존재합니다.<br>항목을 확인해주세요.","알림");
		$(".inputError")[0].focus();
		return false;
	}
	var signStr = '';
	
	if(flowInfo.flowSignCd == "01"){
		signStr += "<br>결재는 진행되지 않습니다.";
	}
	
	var fileListStr = fnFileUploadStrData();
	
	
	if(!gfnSaveInputValChk(arrChkObj)){
		return false;	
	}
	
	jConfirm("임시 저장하시겠습니까?"+signStr+fileListStr, "알림", function( result ) {
		if( result ){
			
			fnFileUploadAppendData();
			
			
			fd.append("reqId",reqId);
			fd.append("processId",processId);
			fd.append("flowId",flowInfo.flowId);
			fd.append("preReqUsrId",reqUsrId);
			
			
			gfnFormDataAutoJsonValue("req4105InfoForm",fd);
			
			
			var ajaxObj = new gfnAjaxRequestAction(
					{"url":"<c:url value='/req/req4000/req4100/saveReq4100ReqFlowChgAjax.do'/>"
						,"contentType":false
						,"processData":false
						,"cache":false},
					fd);
			
			ajaxObj.setFnSuccess(function(data){
				data = JSON.parse(data);
				
				
				
				if(data.errorYn != "Y"){
					toast.push(data.message);
					
					
					gfnLayerPopupClose();
				}else{
					
					jAlert(data.message, '알림창', function( result ) {
						if( result ){
							gfnLayerPopupClose();
						}
					});
				}
			});
			
			
			ajaxObj.setFnError(function(xhr, status, err){
				data = JSON.parse(data);
				jAlert(data.message, "알림");
		 	});
			
			ajaxObj.send();
		}
	});	
}


function fnReqFlowChgBeforeSucc(){
	
	if(usrId != reqUsrId){
		jAlert("담당자가 아닌경우 처리가 불가능합니다.","경고");
		return false;
	}
	
	
	var tmp_strCheckObjArr = strCheckObjArr.slice();
	var tmp_sCheckObjNmArr = sCheckObjNmArr.slice();
	
	
	if(flowInfo.flowSignCd == "01"){
		
		tmp_strCheckObjArr.push("reqSignNm","reqSignId");
		tmp_sCheckObjNmArr.push("결재자","결재자");
	}
	
	var chkRtn = gfnRequireCheck("req4105InfoForm", tmp_strCheckObjArr, tmp_sCheckObjNmArr);
	
	
	var fileRtn = fnFileRequireCheck();
	
	
	if(chkRtn || !fileRtn){
		return false;
	}
	
	
	if(!gfnSaveInputValChk(arrChkObj)){
		return false;	
	}
	
	
	if($(".inputError").length > 0){
		jAlert("유효하지 않은 값이 입력된 항목이 존재합니다.<br>항목을 확인해주세요.","알림");
		$(".inputError")[0].focus();
		return false;
	}
	
	
	var flowWorkChk = true;
	
	
	if(flowInfo.flowWorkCd == "01"){
		
		flowWorkChk = false;
		
		
		if(work_grid.list.length == 0){
			jConfirm("작업 생성이 완료되지 않았습니다.<br>그대로 진행하시겠습니까?", "알림", function( result ) {
				if( result ){
					innerFnNextFlowPopupOpen();
				}
			});	
		}else{
			
			var workStatusChk = true;
			$.each(work_grid.list,function(idx, map){
				if(map.workStatusCd == "01"){
					workStatusChk = false;
					jAlert("완료되지 않은 작업이 존재합니다.","경고");
					return false;
				}
			});
			
			if(workStatusChk){
				
				flowWorkChk = true;
			}
		}
	}
	
	
	if(flowWorkChk){
		innerFnNextFlowPopupOpen();
	}
	
	
	
	function innerFnNextFlowPopupOpen(){
		
		if($("#req4105_reqRightDataList .req4105_flowFrameBox").length == 1){
			selFLowId = $("#req4105_reqRightDataList .req4105_flowFrameBox").attr("id");
			selFlowNextId = $("#req4105_reqRightDataList .req4105_flowFrameBox").attr("nextid");
			
			if(fnEndFlowCheck(selFlowNextId)){
				fnReqFlowChgSucc();
			}
			return false;
		}
		
		
		$(".req4105_flowSelect_maskBox").show();
		$(".req4105_flowSelectBox").show();
		$(".req4105_flowSelectBox_top").html($("#req4105_reqRightDataList").html());
		
		$(".req4105_flowSelectBox_top > .req4105_flowFrameBox").click(function(){
			$(".req4105_flowSelectBox_top > .req4105_flowFrameBox.active").removeClass("active");
			$(this).addClass("active");
			
			
			selFLowId = $(".req4105_flowSelectBox_top > .req4105_flowFrameBox.active").attr("id");
			selFlowNextId = $(".req4105_flowSelectBox_top > .req4105_flowFrameBox.active").attr("nextid");
		});
	}
}

function fnEndFlowCheck(selFlowNextId){
	
	if(gfnIsNull(selFlowNextId) || selFlowNextId == "null"){
		
		var reqStDtmChk = $("#reqStDtm").val();
		var reqEdDtmChk = $("#reqEdDtm").val();
		
		
		if(gfnIsNull(reqStDtmChk) || gfnIsNull(reqEdDtmChk)){
			jAlert("요구사항 최종완료 단계에는<br>작업 시작일자, 작업 종료일자 항목이 필수 입니다.","알림창");
			fnReqFlowChgCancle();
			return false;
		}else{
			return true;
		}
	}
	return true;
}

function fnReqFlowChgCancle(){
	$(".req4105_flowSelectBox_top > .req4105_flowFrameBox").off("click");
	$(".req4105_flowSelect_maskBox").hide();
	$(".req4105_flowSelectBox").hide();
	selFLowId = null;
	selFlowNextId = null;
}


function fnReqFlowChgSucc(){
	
	if(gfnIsNull(selFLowId)){
		jAlert("다음 작업흐름 목록에서<br>작업흐름을 선택해주세요.", "알림");
		return false;
	}
	
	if(fnEndFlowCheck(selFlowNextId)){
		
		fnReqFlowChgSuccAction();
	}
}


function fnReqFlowChgSuccAction(){
	
	var flowNextId = selFLowId;
	
	
	var flowNextNextId = selFlowNextId;
	
	var signStr = "";
	
	
	if(flowInfo.flowSignCd == "01"){
		signStr += "<br>결재 대기 상태에서는 항목 수정이 불가능합니다.";
	}
	
	
	if(gfnIsNull(flowNextId)){
		jAlert("작업흐름 선택이 완료되지 않았습니다.","경고");
		return false;
	}
	
	var fileListStr = fnFileUploadStrData();
	
	jConfirm("항목 입력을 완료하고 작업흐름을 변경하시겠습니까?"+signStr+fileListStr, "알림", function( result ) {
		if( result ){
			
			fnFileUploadAppendData();
			
			
			fd.append("reqId",reqId);
			fd.append("processId",processId);
			fd.append("flowId",flowInfo.flowId);
			fd.append("flowNextId",flowNextId);
			fd.append("flowNextNextId",flowNextNextId);
			fd.append("flowSignCd",flowInfo.flowSignCd);
			fd.append("preReqUsrId",reqUsrId);
			
			
			gfnFormDataAutoJsonValue("req4105InfoForm",fd);
			
			
			
			var ajaxObj = new gfnAjaxRequestAction(
					{"url":"<c:url value='/req/req4000/req4100/saveReq4100ReqFlowChgAjax.do'/>"
						,"contentType":false
						,"processData":false
						,"cache":false},
					fd);
			
			ajaxObj.setFnSuccess(function(data){
				data = JSON.parse(data);
				
				
				
				if(data.errorYn != "Y"){
					
					
					
					
					gfnLayerPopupClose();
					
					
		    		if(typeof fnDashBoardSetting == "function"){
		    			fnDashBoardSetting();
		    		}
				}else{
					
					jAlert(data.message, '알림창', function( result ) {
						if( result ){
							
							gfnLayerPopupClose();
						}
					});
				}
			});
			
			
			ajaxObj.setFnError(function(xhr, status, err){
				data = JSON.parse(data);
				jAlert(data.message, "알림");
		 	});
			
			ajaxObj.send();
		}
	});	
}


function fnWorkComplete(){
	
	if(Object.keys(work_grid.focusedColumn).length == 0){
		jAlert("종료할 작업을 선택해주세요.","알림");
		return false;
	}
	
	var item = work_grid.list[work_grid.focusedColumn[Object.keys(work_grid.focusedColumn)].doindex];
	
	
	if(item.workStatusCd == "02"){
		jAlert("이미 종료된 작업입니다.","알림");
		return false;
	}
	
	else if(item.workChargerId != usrId){
		jAlert("작업 종료는 담당자만 가능합니다.","알림");
		return false;
	}
	
	
	
	var data = {reqId: reqId,processId: processId, flowId: flowInfo.flowId, workId: item.workId, type:"req4105"};
	gfnLayerPopupOpen("/req/req4000/req4100/selectReq4109View.do", data, '600', '430','scroll');
}


function fnReqSignAction(type){
	
	var reqNm = $("#reqNm").val();
	
	
	if(type == "accept"){
		jConfirm("결재 승인하시겠습니까?", "알림", function( result ) {
			if( result ){
				
				var flowNextNextId = selFlowNextId;
				
				var rtnData = {reqId: reqId, reqNm: reqNm, processId: processId, signFlowId: lastChkInfo.signFlowId, signUsrId: usrId, signCd: "02", preFlowId: flowInfo.flowId, flowNextNextId: flowNextNextId, signRegUsrId: lastChkInfo.regUsrId};
				fnReqSignComplete(rtnData);
			}
		});
	}
	
	else if(type == "reject"){
		
		var data = {"type":"reject","flowSignStopCd":flowInfo.flowSignStopCd,"preFlowId":flowInfo.flowId};
		gfnLayerPopupOpen("/req/req4000/req4100/selectReq4108View.do", data, '500', '290','scroll');
	}
}


function fnReqSignComplete(rtnData){
	
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/req/req4000/req4900/insertReq4900SignActionAjax.do'/>"},
			rtnData);
	
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		
		if(data.errorYN != "Y"){
			jAlert(data.message,"알림");
			
    		if(typeof fnDashBoardSetting == "function"){
    			fnDashBoardSetting();
    		}
			
			
			gfnLayerPopupClose();
		}
		else{
			toast.push(data.message);
		}
	});
	
	
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림");
 	});
	
	ajaxObj.send();
	
}


function fnReqChkSetting(reqChkList){
	
	$.each(reqChkList,function(idx, map){
		var signRejectCmnt = map.signRejectCmnt;
		if(!gfnIsNull(signRejectCmnt)){
			signRejectCmnt = signRejectCmnt.replace(/&nbsp;&nbsp;&nbsp;&nbsp;/gi,"</br>");
		}
		
		reqViewStr = "";
		
		var today = new Date(map.signDtm).format('yyyy-MM-dd HH:mm:ss');
		
		
		var reqNm = $("#reqNm").val();
		
		
		if(map.signCd == '01'){
			
			var regUsrImgSrc = "/cmm/fms/getImage.do?fileSn=0&atchFileId="+map.regUsrImg;
			
			
			var signUsrImgSrc = "/cmm/fms/getImage.do?fileSn=0&atchFileId="+map.signUsrImg;
			
			reqViewStr = '<div class="req_box_title signDiv" style="background-color:'+map.signFlowTitleBgColor+';color:'+map.signFlowTitleColor+'">[결재 요청]</div>' 
						+'<div class="req_box_main regUsrImg">'
							+'<img src="'+regUsrImgSrc+'">'
							+'<div>[요청자]</div>'
							+'<div class="historyUsrDiv" title="'+map.regUsrNm+'" onclick="gfnAlarmOpen(\''+map.regUsrId+'\',\''+map.reqId+'\',\''+reqNm+'\',\'${prjId}\',\'${prjGrpId}\')"><i class="fa fa-user-edit"></i>&nbsp;'+map.regUsrNm+'</div>'
						+'</div>'
						+'<div class="req_box_main arrow" style="height: 10px;"><li class="fa fa-angle-double-down fa-lg"></li></div>'
						+'<div class="req_box_main regUsrImg">'
							+'<img src="'+signUsrImgSrc+'">'
							+'<div>[결재자]</div>'
							+'<div class="historyUsrDiv" title="'+map.signUsrNm+'" onclick="gfnAlarmOpen(\''+map.signUsrId+'\',\''+map.reqId+'\',\''+reqNm+'\',\'${prjId}\',\'${prjGrpId}\')"><i class="fa fa-user-check"></i>&nbsp;'+map.signUsrNm+'</div>'
						+'</div>';
		}
		
		else if(map.signCd == '02'){
			
			var signUsrImgSrc = "/cmm/fms/getImage.do?fileSn=0&atchFileId="+map.signUsrImg;
			
			reqViewStr = '<div class="req_box_title signDiv" style="background-color:'+map.signFlowTitleBgColor+';color:'+map.signFlowTitleColor+'">[결재 승인]</div>' 
						+'<div class="req_box_main signAcceptDiv">'
							+'<img src="'+signUsrImgSrc+'">'
							+'<div class="historyUsrDiv" title="'+map.regUsrNm+'" onclick="gfnAlarmOpen(\''+map.regUsrId+'\',\''+map.reqId+'\',\''+reqNm+'\',\'${prjId}\',\'${prjGrpId}\')"><i class="fa fa-file-signature"></i>&nbsp;'+map.regUsrNm+'</div>'
						+'</div>'
		}
		
		else if(map.signCd == '03'){
			reqViewStr = '<div class="req_box_title signDiv" style="background-color:'+map.signFlowTitleBgColor+';color:'+map.signFlowTitleColor+'">[결재 반려]</div>'
						+'<div class="req_box_main bottom signRejectDiv" readonly="readonly" title="'+map.signRejectCmnt+'" onclick="signRejectPopupOpen(this)">사유: '+signRejectCmnt+'</div>'
						+'<div class="req_box_main bottom historyUsrDiv signRejectUsrDiv" onclick="gfnAlarmOpen(\''+map.signUsrId+'\',\''+map.reqId+'\',\''+reqNm+'\',\'${prjId}\',\'${prjGrpId}\')"><i class="fa fa-user-times"></i>'+map.signUsrNm+'</div>';
		}
		
		
		viewStr =	'<div class="req4105_signFrame"><div class="req_main_box req_bottom reqSeq_'+map.signId+'" id="'+map.reqId+'" signflowid="'+map.signFlowId+'" prevflowid="'+map.prevFlowId+'">'
						+'<div class="req_top_box">'
						+today
						+'</div>'
						+'<div class="req_bottom_box">'
						+reqViewStr
						+'</div>'
					+'</div></div>';
					
		
		if(idx < reqChkList.length-1){
			viewStr += '<div class="req4105_flow_topArrowBox signArrow" signflowid="'+map.signFlowId+'" prevflowid="'+map.prevFlowId+'"></div>';
		}
		$('#req4105_signHistoryDiv').append(viewStr);
	});
	
	
	$(".req_main_box.req_bottom[prevflowid!="+flowInfo.flowId+"]").hide();
	$(".req4105_flow_topArrowBox.signArrow[prevflowid!="+flowInfo.flowId+"]").hide();
	
	
	if($(".req_main_box.req_bottom[prevflowid="+flowInfo.flowId+"]").length == 0){
		$(".req4105_sign_TitleBox, #req4105_signHistoryDiv").hide();
	}else{
		
		$(".req4105_sign_TitleBox, #req4105_signHistoryDiv").show();
	}
}


function signRejectPopupOpen(thisObj){
	var data = {"type":"view","comment":$(thisObj).html()};
	gfnLayerPopupOpen("/req/req4000/req4100/selectReq4108View.do", data, '500', '290','scroll');
}
 
function isValidFileExt(files){
	for(var idx = 0; idx < files.length; idx++) {
		
		var ext = files[idx].name.split(".").pop().toLowerCase();
		
		if(!gfnFileCheck(ext)){
			toast.push("확장자가 [ " +ext + " ] 인 파일은 첨부가 불가능 합니다.");
			return false
		};
	};
	return true;
}
 

function fnOptFileUpload(thisObj){
	
	var atchFileId = $(thisObj).attr("fileid");
	var oslUpload_btn = document.getElementById("fileUpload_"+atchFileId);
	
	
	if(!gfnIsNull(oslUpload_btn)){
		oslUpload_btn.value = '';
		oslUpload_btn.click();
		fnOslDocUpload(oslUpload_btn,atchFileId);
	}
}


function fnOslDocUpload(ele,atchFileId){
	ele.onchange = function() {
		var files = ele.files;

		
		fnReq4105OptFileUploadList(files, atchFileId);
	};
}




function fnReq4105OptFileUploadList(files, atchFileId){
	
	
	var sumFileSize = 0;
	
	
	var fileUploadList = "";
	
	
	var fileUploadChk = false;
	
	
	$.each(files,function(idx, map){
		
		var ext = map.name.split(".").pop().toLowerCase();
		var fileName = gfnCutStrLen(map.name,45);
		
		if(map.size > FILE_INFO_MAX_SIZE){
			var fileInfoMaxSizeStr = gfnByteCalculation(FILE_INFO_MAX_SIZE);
			fileUploadList += '<i class="fa fa-file"></i>&nbsp;<s>'+fileName+'</s> ('+fileInfoMaxSizeStr+' 용량 초과)</br>';
		}else if(sumFileSize > FILE_SUM_MAX_SIZE){
			var fileSumMaxSizeStr = gfnByteCalculation(FILE_SUM_MAX_SIZE);
			fileUploadList += '<i class="fa fa-file"></i>&nbsp;<s>'+fileName+'</s> ('+fileSumMaxSizeStr+' 전체 용량 초과)</br>';
		}else if(!gfnFileCheck(ext)){
			fileUploadList += '<i class="fa fa-file"></i>&nbsp;<s>'+fileName+'</s> ([ ' +ext + ' ] 확장자 불가)</br>';
		}else if(!gfnIsNull(fileChk.getObj(map.name+":"+map.size).index) && fileChk.getObj(map.name+":"+map.size).index != idx){
			fileUploadList += '<i class="fa fa-file"></i>&nbsp;<s>'+fileName+'</s> (중복 파일)</br>';
		}else if(map.size <= 0){
			fileUploadList += '<i class="fa fa-file"></i>&nbsp;<s>'+fileName+'</s> (0 Byte인 파일)</br>';
		}else{
			fileUploadList += '<i class="far fa-file"></i>&nbsp;'+gfnCutStrLen(map.name,90)+"</br>";
			sumFileSize += map.size;
			fileUploadChk = true;
		}
	});
	
	
	if(!fileUploadChk){
		jAlert("업로드 할 수 있는 파일이 없습니다.</br></br>[업로드 파일 목록] <div id='popup_fileList'>"+fileUploadList+"</div>","경고");
		return false;
	}else{
		jConfirm("추가 항목의 파일 첨부는 서버에 즉시 업로드됩니다.</br>계속 진행하시겠습니까?</br></br>[업로드 파일 목록] <div id='popup_fileList'>"+fileUploadList+"</div>", "경고", function( result ) {
			if( result ){
				
				fnReq4105FileAjaxUpload(files,atchFileId);
			}
		});
	}
	
}



function fnReq4105FileAjaxUpload(files,atchFileId) {
	
	$('#fileDiv_'+atchFileId).removeClass("inputError");
	
	
	var beforeSendTime;
	
	var sendTime;
	
	
	var optFileFormData = new FormData();
	
	optFileFormData.append('reqId',reqId);
	optFileFormData.append('atchFileId',atchFileId);
	
	
	upFileObj = [];
	
	
	var sumFileSize = 0;
	
	
	var trueIdx = 0;
	
	$.each(files,function(idx, map){
		
		var ext = files[idx].name.split(".").pop().toLowerCase();
		
		if(map.size > FILE_INFO_MAX_SIZE){
			return true;
		}else if(sumFileSize > FILE_SUM_MAX_SIZE){
			return true;
		}else if(!gfnFileCheck(ext)){
			return true;
		}else if(!gfnIsNull(fileChk.getObj(map.name+":"+map.size).index) && fileChk.getObj(map.name+":"+map.size).index != idx){
			return true;
		}else if(map.size <= 0){
			return true;
		}else{
			sumFileSize += map.size;
		
			optFileFormData.append('file', map);
			
			var fileVo = {};
			var fileName = map.name;
			var fileExtsn = fileName.substring(fileName.lastIndexOf('.')+1);
		
			fileVo.orignlFileNm = fileName;
			fileVo.fileExtsn = fileExtsn;
			fileVo.fileMg = map.size;
			fileVo["atchFileId"] = atchFileId;
			fileVo['reqId'] = reqId;
			
			
			upFileObj[trueIdx] = gfnFileListReadDiv(fileVo,'#fileDiv_'+atchFileId,'req');
			
			$(upFileObj[trueIdx]).children('.file_progressBar').children('div').css({width:0});
			
			trueIdx++;
		}
	});
	
	
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/req/req4000/req4100/insertReq4105FileUploadAjax.do'/>"
				,"contentType":false
				,"processData":false
				,"cache":false
				,"async":true
				,loadingShow:true}
			,optFileFormData);
	
	ajaxObj.setFnbeforeSend(function(){
		beforeSendTime = new Date().getTime();
 	});
	
	
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
    	
    	if(data.saveYN == 'N'){
    		toast.push(data.message);
    		innerFail();
    		return false;
    	} 
    	else{
    		
    		if(data.firstInsert == 'Y' && gfnIsNull(atchFileId)){
    			atchFileId = data.addFileId;
    		}
    		sendTime = (new Date().getTime())-beforeSendTime;
    		toast.push("업로드 완료 "+(sendTime/1000)+"초");
    		
    		
    		$.each(upFileObj, function(idx, map){
    			$(map).children().children('.file_contents').attr('fileSn',(data.addFileSn+idx));
    		});
    	}
	});
	
	
	ajaxObj.setFnError(function(xhr, status, err){
		toast.push("ERROR STATUS("+status+")<br>"+err);
    	innerFail();
 	});
	
	
	
	ajaxObj.setFnComplete(function(xhr, status, err){
		
   		$.each(upFileObj, function(idx, map){
   			
   			$(map).children('.file_progressBar').children('div').css('width','100%');
   		});
 	});
	
	
	ajaxObj.send();
	
	function innerFail(){
		var pgBarObj = $(upFileObj).children('.file_progressBar');
		pgBarObj.stop().animate({width:'100%'},500,function(){
    		pgBarObj.css('background-color','#FE5454');
    	});
	}
}


function fnPiaCdChg(thisObj){
	
	if(thisObj.value == "01"){
		$("#labInp").removeClass("req4105_readonly");
		$("#labInp").removeAttr("readonly");
	}else{
		
		$("#labInp").addClass("req4105_readonly");
		$("#labInp").attr("readonly","readonly");
		$("#labInp").val(0);
	}
}


function fnFileRequireCheck(){
	var checkVal = true;
	
	if(!gfnIsNull(essentialCdFileIdList)){
		$.each(essentialCdFileIdList,function(idx, map){
			
			if(gfnIsNull($(".file_contents[atchid="+map+"]")) || $(".file_contents[atchid="+map+"]").length == 0){
				$(".uploadOverFlow.optFileDiv[fileid="+map+"]").addClass("inputError");
				checkVal = false;
				return false;
			}
		});
	}
	
	if(!checkVal){
		jAlert("필수 항목에 파일이 첨부되지 않았습니다.","알림");
	}
	return checkVal;
}



function fnRevisionInsert(){
	gfnSvnRevisionPopup('${sessionScope.selPrjId}',"", true,function(data){
		var selRepNumFd = new FormData();
		
		selRepNumFd.append("reqId",reqId);
		selRepNumFd.append("processId",processId);
		selRepNumFd.append("flowId",flowInfo.flowId);
		
		
		for(var i=0; i<data.length; i++){
			selRepNumFd.append("selRepNum",JSON.stringify({svnRepId: data[i].svnRepId, revisionNum: data[i].revision, revisionComment: data[i].comment}));
		}
		
		
		selRepNumFd.append("selRepNumCnt",data.length);
		
		
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1100/insertPrj1100RevisionNumList.do'/>"
					,"contentType":false
					,"processData":false
					,"cache":false},
				selRepNumFd)
		
		
		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
			
			
			if(data.errorYN != "Y"){
				
				fnRevisionRefresh(0, flowInfo.flowId);
			}
			jAlert(data.message,"알림");
		});
		
		
		ajaxObj.setFnError(function(xhr, status, err){
			data = JSON.parse(data);
			jAlert(data.message, "알림");
	 	});
		
		ajaxObj.send();
	});
}


function fnRevisionGridSetting(flowId){
	revision_grid = new ax5.ui.grid();
				
	
	revision_grid.setConfig({
		target: $('[data-ax5grid="revision-grid"]'),
		showLineNumber: true,
		showRowSelector: true,
		sortable:true,
		header: {align:"center"},
		columns: [
			
			{key: "svnRepNm", label: "Repository", width: 120, align: "center"},
			{key: "revisionNum", label: "리비전 번호", width: 110, align: "center"},
			{key: "revisionComment", label: "리비전 내용", width: 420, align: "center"},
			{key: "svnRepUrl", label: "Repository Url", width: 270, align: "center"},
		],
		body: {
			align: "center",
			columnHeight: 30
		},
		page: {
            navigationItemCount: 9,
            height: 30,
            display: true,
            firstIcon: '<i class="fa fa-step-backward" aria-hidden="true"></i>',
            prevIcon: '<i class="fa fa-caret-left" aria-hidden="true"></i>',
            nextIcon: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
            lastIcon: '<i class="fa fa-step-forward" aria-hidden="true"></i>',
            onChange: function () {
            	fnRevisionRefresh(this.page.selectPage, flowId);
            }
        }
	});
}


function fnRevisionRefresh(_pageNo, flowId){
	
	
	if(gfnIsNull(flowId)){
		flowId = flowInfo.flowId;
	}
	
	var ajaxParam ="";
	
	
 	if(!gfnIsNull(_pageNo)){
 		ajaxParam += "&pageNo="+_pageNo;
 	}else if(typeof revision_grid.currentPage != "undefined"){
 		ajaxParam += "&pageNo="+revision_grid.page.currentPage;
 	}
	
 	ajaxParam += "&reqId="+reqId+"&processId="+processId+"&flowId="+flowId;
	
	
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100ReqRepRevisionListAjax.do'/>","loadingShow":false},
			ajaxParam);
	
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		
		if(data.errorYN != "Y"){

			
			var list = data.reqRevisionList;
			
			var page = data.page;
			
			revision_grid.setData({
	             	list:list,
	             	page: {
	                  currentPage: _pageNo || 0,
	                  pageSize: page.pageSize,
	                  totalElements: page.totalElements,
	                  totalPages: page.totalPages
	              }
    		});
			
		}else{
			toast.push(data.message);
		}
	});
	
	
	ajaxObj.setFnError(function(xhr, status, err){
		data = JSON.parse(data);
		jAlert(data.message, "알림");
 	});
	
	ajaxObj.send();
}


function fnRevisionDelete(){
	var chkList = revision_grid.getList('selected');
		
	if(gfnIsNull(chkList)){
		jAlert("선택한 리비전이 없습니다.","알림창");
		return false;
	}
	
	var selRepNumFd = new FormData();
	
	selRepNumFd.append("reqId",reqId);
	selRepNumFd.append("processId",processId);
	selRepNumFd.append("flowId",flowInfo.flowId);
	
	
	$.each(chkList,function(idx, map){
		selRepNumFd.append("selRepNum",JSON.stringify({svnRepId: map.svnRepId, revisionNum: map.revisionNum}));
	});
	
	
	selRepNumFd.append("selRepNumCnt",chkList.length);
	
	
	var ajaxObj = new gfnAjaxRequestAction(
			{"url":"<c:url value='/prj/prj1000/prj1100/deletePrj1100RevisionNumList.do'/>"
				,"contentType":false
				,"processData":false
				,"cache":false},
			selRepNumFd)
	
	
	ajaxObj.setFnSuccess(function(data){
		data = JSON.parse(data);
		
		
		if(data.errorYN != "Y"){
			
			fnRevisionRefresh(revision_grid.page.currentPage, flowInfo.flowId);
		}
		jAlert(data.message,"알림");
	});
	
	
	ajaxObj.send();
}


 
function fnReqDplSetting(reqDplList){
	$.each(reqDplList,function(idx, map){
		$('#dplId_'+map.flowId).val(map.dplId);
		$('#dplNm_'+map.flowId).val(map.dplNm);
	});
}


function fnReqChargerChg(){
	
	if(!gfnIsNull(authGrpList)){
		var authGrpIds = [];
		$.each(authGrpList,function(idx, map){
			authGrpIds.push(map.authGrpId);
		});
		
		authData= { "usrNm" :  "" , authGrpIds : authGrpIds };
	}
	gfnCommonUserPopup(authData,false,function(objs){
		if(objs.length>0){
			jConfirm("담당자를 이관하시겠습니까? </br>이관 대상 담당자: "+objs[0].usrNm, "알림", function( result ) {
				if( result ){
					
					fnFileUploadAppendData();
					
					
					fd.append("reqId",reqId);
					fd.append("reqNm",$('#reqNm').val());
					fd.append("reqChargerId",objs[0].usrId);
					
					$('#reqChargerId').val(objs[0].usrId);
					$('#reqChargerNm').val(objs[0].usrNm);
					
					var ajaxObj = new gfnAjaxRequestAction(
							{"url":"<c:url value='/req/req4000/req4000/updateReq4105ReqChargerChgAjax.do'/>"
								,"contentType":false
								,"processData":false
								,"cache":false},
							fd);
					
					ajaxObj.setFnSuccess(function(data){
						data = JSON.parse(data);
						
						
						if(data.errorYn != "Y"){
							toast.push(data.message);
							
				    		if(typeof fnDashBoardSetting == "function"){
				    			fnDashBoardSetting();
				    		}
							
							
							gfnLayerPopupClose();
						}else{
							
							jAlert(data.message, '알림창', function( result ) {
								if( result ){
									gfnLayerPopupClose();
								}
							});
						}
					});
					
					
					ajaxObj.setFnError(function(xhr, status, err){
						data = JSON.parse(data);
						jAlert(data.message, "알림");
				 	});
					
					ajaxObj.send();
				}
			});	
		}
	});
}


function fnMiddleDoneAction(){
	
	if(!gfnIsNull(processMiddleDoneCd) && processMiddleDoneCd == "01"){
		jConfirm("요구사항을 중간 종료 하시겠습니까?</br>현재 입력된 항목은 저장되지 않습니다.", "알림", function( result ) {
			if( result ){
				
				var data = {"preFlowId":flowInfo.flowId};
				gfnLayerPopupOpen("/req/req4000/req4100/selectReq4111View.do", data, '580', '290','scroll');
			}
		});
	}
}


function fnReq4105GuideShow(){
	var mainObj = $(".popup");
	
	
	if(mainObj.length == 0){
		return false;
	}
	
	var guideBoxInfo = globals_guideContents["req4105"];
	gfnGuideBoxDraw(true,mainObj,guideBoxInfo);
}
</script>
</head>
<body>
<div class="popup">
<form id="req4105InfoForm" onsubmit="return false;" style="width:100%;height:100%;">
	<div class="popup_title_box"><span>[${targetprjGrpNm} > ${targetPrjNm}]</span> : <span id="popup_titleReqNm"></span></div>
	<div class="req4105_flowSelect_maskBox"></div>
	<div class="req4105_flowSelectBox">
		<div class="req4105_flowSelectBox_title">다음 작업흐름 선택</div>
		<div class="req4105_flowSelectBox_top"></div>
		<div class="req4105_flowSelectBox_bottom">
			<div class="button_complete req4105_nextFlowBtn" onclick="fnReqFlowChgSucc()"><i class="fa fa-check"></i>&nbsp;완료</div>
			<div class="button_complete req4105_nextFlowBtn" onclick="fnReqFlowChgCancle()"><i class="fa fa-times"></i>&nbsp;취소</div>
		</div>
	</div>
	<div class="req4105_req_leftBox">
		<div class="req4105_req_topBox" id="req4105_reqTopDataList" title="작업흐름 변경이력" guide="req4105TopFlowList">

		</div>
		<div class="req4105_req_bottomBox">
			<div class="req4105_reqBottom_topBox" id="req4105_reqOptDataList">
				<div class="req4105_frameTitleDiv">
					기본 항목 정보
					<div class="req4105_titleFoldingBtn"><span class="req4105_titleFoldingContent up" folding="0"></span></div>
				</div>
				<div class="req4105_optionDiv req4105_default_option req4105_foldDiv" folding="0">
					<div class="req4105_default_mask"></div>
					<div class="req4105_option_title req4105_top_line">
						프로세스
					</div>
					<div class="req4105_option_half req4105_top_line">
						<input type="text" class="req4105_input_text req4105_readonly" title="프로세스" id="processNm" name="processNm" readonly="readonly" modifyset="02"/>
					</div>
					<div class="req4105_option_title req4105_top_line">
						처리 상태
					</div>
					<div class="req4105_option_half req4105_top_line req4105_right_line">
						<input type="text" class="req4105_input_text req4105_readonly" title="처리 상태" id="reqProTypeNm" name="reqProTypeNm" readonly="readonly" modifyset="02"/>
					</div>
					<div class="req4105_option_title">
						현재 작업흐름
					</div>
					<div class="req4105_option_half">
						<input type="text" class="req4105_input_text req4105_readonly" title="현재 작업흐름" id="flowNm" name="flowNm" readonly="readonly" modifyset="02"/>
					</div>
					<div class="req4105_option_title">
						접수 유형
					</div>
					<div class="req4105_option_half req4105_right_line">
						<input type="text" class="req4105_input_text req4105_readonly" title="접수 유형" id="reqNewTypeNm" name="reqNewTypeNm" readonly="readonly" modifyset="02"/>
					</div>
					<div class="req4105_option_title">
						요구사항 명
					</div>
					<div class="req4105_option_all req4105_right_line">
						<input type="text" class="req4105_input_text req4105_readonly" title="요구사항 명" id="reqNm" name="reqNm" readonly="readonly" modifyset="02"/>
					</div>
					<div class="req4105_option_title">
						요청자
					</div>
					<div class="req4105_option_half">
						<input type="text" class="req4105_input_text req4105_readonly" title="요청자" id="reqUsrNm" name="reqUsrNm" readonly="readonly" modifyset="02"/>
					</div>
					<div class="req4105_option_title">
						연락처
					</div>
					<div class="req4105_option_half req4105_right_line">
						<input type="text" class="req4105_input_text req4105_readonly" title="연락처" id="reqUsrNum" name="reqUsrNum" readonly="readonly" modifyset="02"/>
					</div>
					<div class="req4105_option_title">
						요청일자
					</div>
					<div class="req4105_option_half">
						<input type="text" class="req4105_input_text req4105_readonly" title="요청일자" id="reqDtm" name="reqDtm" readonly="readonly" modifyset="02"/>
					</div>
					<div class="req4105_option_title">
						이메일
					</div>
					<div class="req4105_option_half req4105_right_line">
						<input type="text" class="req4105_input_text req4105_readonly" title="이메일" id="reqUsrEmail" name="reqUsrEmail" readonly="readonly" modifyset="02"/>
					</div>
					<div class="req4105_option_title">
						요청자 소속
					</div>
					<div class="req4105_option_all req4105_right_line">
						<input type="text" class="req4105_input_text req4105_readonly" title="요청자 소속" id="reqUsrDeptNm" name="reqUsrDeptNm" readonly="readonly" modifyset="02"/>
					</div>
					<div class="req4105_option_title">
						작업 시작일시<span class="endPrevStr">(*)</span>
					</div>
					<div class="req4105_option_half">
						<input type="text" class="req4105_input_date req4105_readonly" title="시작일자" id="reqStDtm" name="reqStDtm" readonly="readonly" value=""/>
					</div>
					<div class="req4105_option_title">
						작업 시작 예정 일자(*)
					</div>
					<div class="req4105_option_half req4105_right_line">
						<input type="text" class="req4105_input_date req4105_readonly" title="작업 시작 예정 일자" id="reqStDuDtm" name="reqStDuDtm" readonly="readonly" value=""/>
					</div>
					<div class="req4105_option_title">
						작업 종료일시<span class="endPrevStr">(*)</span>
					</div>
					<div class="req4105_option_half">
						<input type="text" class="req4105_input_date req4105_readonly" title="종료일자" id="reqEdDtm" name="reqEdDtm" readonly="readonly" value=""/>
					</div>
					<div class="req4105_option_title">
						작업 종료 예정 일자(*)
					</div>
					<div class="req4105_option_half req4105_right_line">
						<input type="text" class="req4105_input_date req4105_readonly" title="작업 종료 예정 일자" id="reqEdDuDtm" name="reqEdDuDtm" readonly="readonly" value=""/>
					</div>
					<div class="req4105_option_title">
						진척률(%)
					</div>
					<div class="req4105_option_half">
						<input type="number" class="req4105_input_text" title="진척률" id="reqCompleteRatio" name="reqCompleteRatio" value="0" min="0" max="100"/>
					</div>
					<div class="req4105_option_title">
						담당자
					</div>
					<div class="req4105_option_half req4105_right_line">
						<input type="hidden" name="reqChargerId" id="reqChargerId" title="담당자" opttype="03"/>
						<input type="text" title="담당자" class="req4105_input_text req4105_charger" name="reqChargerNm" id="reqChargerNm" modifyset="02"/>
						<span class="button_normal2 fl req4105_charger" id="btn_user_select"><li class="fa fa-search"></li></span>
					</div>
					<div class="req4105_option_title">
						예상 FP
					</div>
					<div class="req4105_option_half">
						<input type="number" class="req4105_input_text" title="예상 FP" id="reqExFp" name="reqExFp" value="0" min="0"/>
					</div>
					<div class="req4105_option_title">
						최종 FP
					</div>
					<div class="req4105_option_half req4105_right_line">
						<input type="number" class="req4105_input_text" title="최종 FP" id="reqFp" name="reqFp" value="0" min="0"/>
					</div>
					<div class="req4105_option_title">
						요구사항 분류
					</div>
					<div class="req4105_option_half">
						<input type="hidden" name="reqClsId" id="reqClsId"/>
						<input type="text" title="요구사항 분류" class="req4105_input_text req4105_cls" name="reqClsNm" id="reqClsNm" style="width: 190px !important;" readonly="readonly" />
						<span class="button_normal2 fl req4105_cls" id="btn_cls_select"><li class="fa fa-search"></li></span>
					</div>
					<div class="req4105_option_title">
						요구사항 유형
					</div>
					<div class="req4105_option_half req4105_right_line">
						<select type="text" class="req4105_select" title="요구사항 유형" id="reqTypeCd" name="reqTypeCd" opttype="02" cmmcode="REQ00012"></select>
					</div>
					<div class="req4105_option_title">
						성능 개선활동 여부
					</div>
					<div class="req4105_option_half">
						<select type="text" class="req4105_select" title="성능 개선활동 여부" id="piaCd" name="piaCd" OS="02" opttype="02" cmmcode="CMM00001" onchange="fnPiaCdChg(this)"></select>
					</div>
					<div class="req4105_option_title">
						투입인력
					</div>
					<div class="req4105_option_half req4105_right_line">
						<input type="number" class="req4105_input_text req4105_readonly" title="투입인력" id="labInp" name="labInp" value="0" min="0" readonly="readonly"/>
					</div>
					<div class="req4105_option_title">
						시스템 구분
					</div>
					<div class="req4105_option_half">
						<select type="text" class="req4105_select" title="시스템 구분" id="sclCd" name="sclCd" opttype="02" cmmcode="REQ00011"></select>
					</div>
					<div class="req4105_option_title">
						
					</div>
					<div class="req4105_option_half req4105_right_line">
						
					</div>
					<div class="req4105_desc_file">
						<div class="req4105_option_title req4105_desc">
							접수 의견
						</div>
						<div class="req4105_option_all req4105_desc req4105_right_line">
							<textarea class="req4105_textarea req4105_readonly" title="접수 의견" id="reqAcceptTxt" name="reqAcceptTxt" readonly="readonly" modifyset="02"></textarea>
						</div>
						<div class="req4105_option_title req4105_desc">
							설명
						</div>
						<div class="req4105_option_all req4105_desc req4105_right_line">
							<textarea class="req4105_textarea req4105_readonly" title="설명" id="reqDesc" name="reqDesc" readonly="readonly" modifyset="02"></textarea>
						</div>
						<div class="req4105_option_title req4105_file">
							<input type="hidden" id="atchFileId" name="atchFileId"/>
							<input type="hidden" id="fileCnt" name="fileCnt"/>
							<input type="hidden" id="insertFileCnt" name="insertFileCnt"/>
							첨부파일
						</div>
						<div class="req4105_option_all req4105_file req4105_right_line">
							<div class="uploadOverFlow pop_file" id="dragandrophandler">
								<div class="file_dragDrop_info">Drop files here or click to upload.</div>
							</div>
							<div class="req4105_fileBtn" onclick="document.getElementById('egovFileUpload').click();" id="btn_insert_fileSelect">
								<input type="file" style="display: none" id="egovFileUpload" name="uploadFileList" multiple="multiple" />
								<i class="fa fa-file-upload fa-2x"></i>&nbsp;파일 선택
							</div>
						</div>
					</div>
				</div>
				
				<div class="req4105_frameTitleDiv">
					추가 항목 정보
					<div class="req4105_titleFoldingBtn"><span class="req4105_titleFoldingContent up" folding="1"></span></div>
				</div>
				<div class="req4105_addOptionFrame req4105_foldDiv" folding="1">
					<div class="req4105_addOption_TitleBox"></div>
					<div id="req4105_dplDivFrame"></div>
					<div class="req4105_signBox" id="signIdSelBox">
						<div class="req4105_option_title">
							결재자 (*)
						</div>
						<div class="req4105_option_all">
							<input type="hidden" name="reqSignId" id="reqSignId" title="결재자"/>
							<input type="text" title="결재자" class="req4105_input_text req4105_charger" name="reqSignNm" id="reqSignNm" modifyset="02"/>
							<span class="button_normal2 fl req4105_charger" id="btn_select_signUser"><li class="fa fa-search"></li></span>
						</div>
					</div>
					<div class="req4105_sign_TitleBox">
						결재 이력
					</div>
					<div class="req4105_signHistoryDiv" id="req4105_signHistoryDiv">
					</div>
					<div class="req4105_optionDiv" id="req4105_work">
						<div class="req4105_work_btnBox">
							작업 관리
							<div class="req4105_work_btn req4105_charger_work" id="btn_update" onclick="fnWorkComplete();"><li class="fa fa-user-check"></li>&nbsp;작업 종료</div>
							<div class="req4105_work_btn" id="btn_delete" onclick="fnWorkDelete();"><li class="fa fa-times"></li>&nbsp;작업 삭제</div>
							<div class="req4105_work_btn" id="btn_update" onclick="fnWorkPopupOpen('update');"><li class="fa fa-edit"></li>&nbsp;작업 수정</div>
							<div class="req4105_work_btn" id="btn_insert" onclick="fnWorkPopupOpen('insert');"><li class="fa fa-plus"></li>&nbsp;작업 추가</div>
							<div class="req4105_work_btn" id="btn_select" onclick="fnWorkRefresh();"><li class="fa fa-redo"></li>&nbsp;작업 조회</div>
						</div>
						<div class="req4105_work_frame">
							<div data-ax5grid="work-grid" data-ax5grid-config="{}" style="height: 200px;"></div>	
						</div>
					</div>
					<div class="req4105_optionDiv" id="req4105_revision">
						<div class="req4105_revision_btnBox">
							리비전 관리
							<div class="req4105_revision_btn" id="btn_delete" onclick="fnRevisionDelete();"><li class="fa fa-times"></li>&nbsp;리비전 삭제</div>
							<div class="req4105_revision_btn" id="btn_insert" onclick="fnRevisionInsert();"><li class="fa fa-plus"></li>&nbsp;리비전 추가</div>
							<div class="req4105_revision_btn" id="btn_select" onclick="fnRevisionRefresh();"><li class="fa fa-redo"></li>&nbsp;리비전 조회</div>
						</div>
						<div class="req4105_revision_frame">
							<div data-ax5grid="revision-grid" data-ax5grid-config="{}" style="height: 200px;"></div>	
						</div>
					</div>
					<div class="req4105_optionDiv" id="req4105_add_option">
						<!-- 작업흐름 입력해야하는 추가 항목 -->
					</div>
				</div>
			</div>
			<div class="req4105_reqBottom_bottomBox" id="req4105_reqBtnSign">
				<div class="req4105_btnDiv">
					<div class="button_complete req4105_mdBtn" onclick="fnMiddleDoneAction()" guide="req4105MiddleDone"><i class="fa fa-sign-out-alt"></i>&nbsp;중간 종료</div>
					<div class="button_complete req4105_signBtn" onclick="fnReqSignAction('accept')" guide="req4105SignAccept"><i class="fa fa-check-double"></i>&nbsp;결재 승인</div>
					<div class="button_complete req4105_signBtn" onclick="fnReqSignAction('reject')" guide="req4105SignReject"><i class="fa fa-undo-alt"></i>&nbsp;결재 반려</div>
					<div class="button_complete req4105_chargerChgBtn" onclick="fnReqChargerChg()" guide="req4105AuthUserChg"><i class="fa fa-user-tag"></i>&nbsp;담당자 이관</div>
					<div class="button_complete req4105_complete" onclick="fnReqHalfSave()" guide="req4105HlafSave"><i class="fa fa-clock"></i>&nbsp;임시 저장</div>
					<div class="button_complete req4105_complete" onclick="fnReqFlowChgBeforeSucc()" guide="req4105FlowNext"><i class="fa fa-check"></i>&nbsp;다음</div>
					<div class="button_complete req4105_close" onclick="gfnLayerPopupClose()" guide="req4105Close"><i class="fa fa-times"></i>&nbsp;닫기</div>
				</div>
			</div>
		</div>
	</div>
	<div class="req4105_req_rightBox">
		<div class="req4105_sign_maskBox"><li class="fa fa-file-signature" title="결재"></li>&nbsp;결재 대기중입니다.<span id="signUsrHtml"></span></div>
		<div class="req4105_end_maskBox"><li class="far fa-stop-circle" title="최종 완료"></li>&nbsp;최종 완료된 요구사항입니다.</div>
		<div class="req4105_nextFlowList" id="req4105_reqRightDataList" guide="req4105RightFlowList">
		
		</div>
	</div>
</form>
</div>
</body>
</html>