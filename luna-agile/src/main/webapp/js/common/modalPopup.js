
var modalCount = 0;

//모달창 닫기 이벤트 중복 방지
var modalCloseFlag = false;

//alert 중복 방지
var modalCloseAlert = false;

$(document).on('shown.bs.modal', '.modal', function () {
	//zIndex 계산
    var zIndex = 1040 + (10 * modalCount);
	
	//최근 열린 모달 z-index 설정
    $(this).css('z-index', zIndex);
	
	//모달 애니메이션 동작
    setTimeout(function() {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);
	
	$(this).find(".kt-select2").select2({width: '100%'});
	
	//portlet
	if($(this).find(".kt-portlet[data-ktportlet=true]").length > 0){
		$.each($(this).find(".kt-portlet[data-ktportlet=true]"), function(idx, map){
			new KTPortlet($(map).attr("id"));
		});
	}
	
	//모달 포커싱
	$(this).focus();
	
	//모달 카운트 추가
    modalCount = modalCount + 1;
});

//멀티 모달창의경우 모달창 닫힐때 스크롤바 생기는 오류 수정
$(document).on('hidden.bs.modal', '.modal', function () {
	//열린 모달창이 존재하는 경우
	if($('.modal:visible').length > 0){
		//모달창 오픈 상태로 변경
		$(document.body).addClass('modal-open');
	}
	
	//해당 모달창 제거
	$(this).remove();
	
	//모달 카운트
	modalCount = modalCount - 1;
});


//모달창 닫는 경우 경고메시지 출력
$(document).on('hide.bs.modal', '.modal', function () {
	if(event){
		//중복 이벤트 중지
		event.cancelable = true;
		event.stopPropagation();
		event.preventDefault();
		event.returnValue = false;
	}
	
	//alert창 떠 있는경우 이벤트 중지
	if(modalCloseAlert){
		return false;
	}
	//모달 object
	var that = this;
	
	//모달 창  닫는경우
	if(modalCloseFlag){
		modalCloseFlag = false;
		return true;
	}
	
	//경고창 없는경우 바로 닫기
	if(!$(that).data("closeconfirm")){
		modalCloseFlag = false;
		return true;
	}
	
	//alert flag
	modalCloseAlert = true;
	
	$.osl.confirm("팝업 창을 닫으시겠습니까?",null,function(result) {
    	modalCloseAlert = false;
        if (result.value) {
        	//모달창 닫기
        	modalCloseFlag = true;
        	
        	//모달창 닫기 이벤트
        	$(that).modal('hide');
        }
    });

	
	//모달창 닫기 이벤트 중지
	return false;
});

var modal_popup = function(url, data, opts){
	var options;
	var opts = opts;
	
	//기본 옵션
	var defaultOptions = {
			modalSize: 'lg',
			backdrop: true,
			keyboard: true, 
			showLoading: true,
			closeConfirm: true,
			idKeyDuple: false,
			focus: false,
			autoHeight: true,
			'class': {
				
				"header": "",
				"body": "",
				"footer": ""
			}
	};
	
	//options 적용
	options = $.extend(true, defaultOptions, opts, opts);
	
	//같은 모달 중복 방지 체크
	if(!options.idKeyDuple){
		if($(".modal[data-idkeyduple=false]").length > 0 && $(".modal[data-idkeyduple=false]").data("idkey") == options.idKey){
			$.osl.alert("해당 기능 팝업은 중복으로 동작 할 수 없습니다.");
			return false;
		}
	}
	
	//중복 모달 구분 id
	var layerIndex = $(".modal").length;
	var layerBoxDivId = "lpx"+layerIndex;
	
	//모달 타입에 따른 class 지정 (default)
	var modalContentClass = '';
	var modalSize = "modal-"+options.modalSize;
	
	//모달 제목
	var modalTitle = '';
	if(options.hasOwnProperty("modalTitle")){
		modalTitle = $.osl.escapeHtml(options.modalTitle);
	}

	//모달 footer button 채우기
	var footerBtnStr = '';
	if(options.hasOwnProperty("footerBtn")){
		footerBtnStr = options.footerBtn.join("");
	}
	
	var classHeader = options.class.header;
	var classHeaderTitle = classHeaderBtn = "";
	
	//header css 분기(String, object)
	if(typeof options.class.header == "object"){
		if(options.class.header.hasOwnProperty("header")){
			classHeader = options.class.header.header;
		}
		if(options.class.header.hasOwnProperty("headerTitle")){
			classHeaderTitle = options.class.header.headerTitle;
		}
		if(options.class.header.hasOwnProperty("headerBtn")){
			classHeaderBtn = options.class.header.headerBtn;
		}
	}
	
	$("body").prepend(
		'<div class="modal '+modalSize+'" id="'+layerBoxDivId+'" role="dialog" tabIndex="-1" aria-labelledby="'+layerBoxDivId+'" aria-hidden="true" data-backdrop="'+options.backdrop+'" data-keyboard="'+options.keyboard+'" data-closeconfirm="'+options.closeConfirm+'" data-idkeyduple="'+options.idKeyDuple+'" data-idkey="'+options.idKey+'" data-focus="'+options.focus+'">'
			+'<div class="modal-dialog modal-dialog-centered '+modalSize+'" role="document">'
				+'<div class="modal-content">'
					+'<div class="modal-header clearfix '+classHeader+'">'
						+'<h5 class="modal-title kt-font-boldest '+classHeaderTitle+'">'+modalTitle+'</h5>'
						+'<button type="button" class="close '+classHeaderBtn+'" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i></button>&nbsp;'
					+'</div>'
					+'<div class="modal-body '+options.class.body+'" data-height="200">'
						
					+'</div>'
				+'</div>'
			+'</div>'
		+'</div>'
	);
	
	//로딩 바
	var loadingShowVal = options.showLoading;
	
	//AJAX 설정
	var ajaxObj = new $.osl.ajaxRequestAction(
			{"url":url,async:true, loadingShow: loadingShowVal}
			,data);
	//AJAX 전송 성공 함수
	ajaxObj.setFnSuccess(function(data, textStatus, xhr){
		$.osl.deferred= $.Deferred();
		
		//모달 창 오픈
		$("#"+layerBoxDivId).modal('show');
		
		//모달 창 내용 넣기
		$("#"+layerBoxDivId+" .modal-body").html(data);

		//모달 footer 이동
		var modalFooter = $("#"+layerBoxDivId+" .modal-body").find(".modal-footer");
		modalFooter.addClass(options.class.footer);
		
		if(modalFooter.length > 0){
			$("#"+layerBoxDivId+" .modal-body").after(modalFooter);
		}else{
			$("#"+layerBoxDivId+" .modal-body").after(
					'<div class="modal-footer'+options.class.footer+'">'
						+'<button type="button" class="btn btn-outline-brand" data-dismiss="modal">'+$.osl.lang("modal.close")+'</button>'
					+'</div>'
			);
		}
		
		//자동 사이즈 맞춤 함수
		var fnAutoHeight = function(){
			var height = parseInt(KTUtil.getViewPort().height);
            return parseInt(height*0.8);
		}
		
		//자동 사이즈 조절 안하는경우
		if(!options.autoHeight){
			fnAutoHeight = $.noop;
		}
		
		//퍼펙트 스크롤 적용
		KTUtil.scrollInit($("#"+layerBoxDivId).find(".modal-body")[0], {
	        disableForMobile: true, 
	        resetHeightOnDestroy: true, 
	        handleWindowResize: true, 
	        height: fnAutoHeight
	    });
		
		//callback 함수 적용
		if(options.hasOwnProperty("callback")){
			$.each(options.callback, function(idx, map){
				var targetId = map.targetId;
				var actionFn = map.actionFn;
				var targetElem = $("#"+targetId);
				
				if(targetElem.length > 0 && typeof actionFn == "function"){
					targetElem.click(function(){
						actionFn(this);
					});
				}
				
			});
		}
		//실행 완료 호출
		$.osl.deferred.resolve();
		return $.osl.deferred.promise();
	});
	
	//AJAX 전송 오류 함수
	ajaxObj.setFnError(function(xhr, status, err){
		if(xhr.status == '999'){
    		$.osl.alert('세션이 만료되어 로그인 페이지로 이동합니다.');
    		document.location.href="/cmm/cmm4000/cmm4000/selectCmm4000View.do"
    		return;
    	}
		if(xhr.status == '404'){
			console.log(err);
			$.osl.alert('팝업 페이지에서 오류가 발생했습니다.');
    		$.osl.showLoadingBar(false);
    		
    		//모달 창 즉시 닫기
    		modalCloseFlag = true;
    		$("#"+layerBoxDivId).modal("hide");
    		return;
    	}
		if(xhr.status == '401'){
			$.osl.alert('권한이 부족합니다.');
			$.osl.showLoadingBar(false);
    		
    		//모달 창 즉시 닫기
    		modalCloseFlag = true;
    		$("#"+layerBoxDivId).modal("hide");
    		return;
    	}
	});
	
	//AJAX 전송
	ajaxObj.send();
	
	
	return layerBoxDivId;
}
