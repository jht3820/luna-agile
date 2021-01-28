<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<form class="kt-form" id="">
	<textarea  name="sprResult" id="sprResult"></textarea>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="">
		<i class="fa fa-save"></i><span>등록</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLSpr1005Popup = function () {
	var documentSetting = function(){
		var formId = 'frSpr1005'
		//edit 목록
		var formEditList = [];
		
		//form validate 주입
		var formValidate = $.osl.validate(formId);
		
		//edit 세팅
    	formEditList.push($.osl.editorSetting("sprResult", {formValidate: formValidate,height:300, 'minHeight': 300, 'maxHeight': 300}));
		
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1005Popup.init();
});
</script>
<!-- end script -->
