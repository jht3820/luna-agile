<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm9002">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9001.label.jenkinsName">JENKINS NAME</span></label>
				<input type="text" class="form-control" placeholder="JENKINS NAME" name="jenNm" id="jenNm" maxlength="250" required/>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm4002SaveSubmit">완료</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>

<script>
"use strict";
var OSLStm9002Popup = function () {
	
	var formId = 'frStm9002';

	var type = $("#type").val();
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	
    // Private functions
    var documentSetting = function () {
    	
    	
    	
    };

    
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

//Initialization
$.osl.ready(function(){
	OSLStm9002Popup.init();
});

	
</script>