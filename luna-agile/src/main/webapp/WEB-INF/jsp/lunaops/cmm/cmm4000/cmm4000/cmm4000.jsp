<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/jsp/lunaops/top/header.jsp" %>
	<!--begin::Page Custom Styles(used by this page) -->
	<link href="<c:url value='/css/login/login-v2.css'/>" rel="stylesheet" type="text/css" />

	<!--end::Page Custom Styles -->
	</head>
	<!-- end::Head -->
	<!-- begin::Body -->
	<body class="kt-login-v2--enabled kt-quick-panel--right kt-demo-panel--right kt-offcanvas-panel--right kt-header--fixed kt-header-mobile--fixed kt-subheader--fixed kt-subheader-mobile--fixed kt-aside--enabled kt-aside--left kt-aside--fixed kt-aside--offcanvas-default kt-page--loading">

		<!-- begin:: Page -->
		<div class="kt-grid kt-grid--ver kt-grid--root">
			<div class="kt-grid__item   kt-grid__item--fluid kt-grid  kt-grid kt-grid--hor kt-login-v2 osl-login" id="kt_login_v2">

				<!--begin::Item-->
				<div class="kt-grid__item  kt-grid--hor">

					<!--begin::Heade-->
					<div class="kt-login-v2__head">
						<div class="kt-login-v2__logo">
							<a href="#">
								<img src="<c:url value='/media/logos/login_logo2.png'/>" alt="" />
							</a>
						</div>
						<div class="kt-login-v2__signup">
							<span>Don't have an account?</span>
							<a href="#" class="kt-link kt-font-brand">Join</a>
						</div>
					</div>

					<!--begin::Head-->
				</div>

				<!--end::Item-->

				<!--begin::Item-->
				<div class="kt-grid__item  kt-grid  kt-grid--ver  kt-grid__item--fluid">

					<!--begin::Body-->
					<div class="kt-login-v2__body osl-login-v2__body">
					
						<!--begin::Image-->
						<div class="kt-login-v2__image osl-login__image">
							<img src="/media/osl/main/login-main.png" />
						</div>

						<!--begin::Image-->

						<!--begin::Wrapper-->
						<div class="kt-login-v2__wrapper osl-login-v2__wrapper"> 
							<div class="kt-login-v2__container osl-login-v2__container">
								<div class="osl-login__text">LOGIN</div>
								<form class="kt-login-v2__form kt-form" action="" autocomplete="off" name="kt_login_form" id="kt_login_form" method="post">
									<div class="form-group osl-login-form-group osl-login-form-group__id">
										<c:choose>
											<c:when test="${loginType == 'email' }">
												<label class="osl-login-form-control__label">Email</label>
												<input class="form-control osl-login-form-control__input" type="text" name="email" id="email" label="사용자 이메일" regexstr="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$" required>
												<input type="hidden" name="usrId" id="usrId">
											</c:when>
											<c:otherwise>
												<label class="osl-login-form-control__label">User Id</label>
												<input class="form-control osl-login-form-control__input" type="text" name="usrId" id="usrId" autocomplete="off" label="사용자 아이디" regexstr="^[a-z0-9_-]{5,20}$" regexerrorstr="소문자,숫자, 특수 문자('_','-'), 5~20 글자까지 허용" required>
												<input type="hidden" name="email" id="email">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="form-group osl-login-form-group osl-login-form-group__password">
										<label class="osl-login-form-control__label">Password</label>
										<input class="form-control osl-login-form-control__input" type="password" name="usrPw" id="usrPw" autocomplete="off" label="비밀번호" required>
									</div>
	
									<!--begin::Action-->
									<div class="kt-login-v2__actions">
										<a href="#" class="kt-link kt-link--brand" id="pwFindLink">
											Forgot Password ?
										</a>
										<button type="submit" class="btn btn-brand btn-elevate btn-pill" id="kt_login_submit">Log In</button>
									</div>
	
									<!--end::Action-->
								</form>
								<form id="kt_hidden_param_form">
									<input type="hidden" name="loginType" id="loginType" value="<c:out value='${requestScope.loginType}'/>">
									<input type="hidden" name="loginYn" id="loginYn" value="<c:out value='${requestScope.loginYn}'/>">
									<input type="hidden" name="isPrjYn" id="isPrjYn" value="<c:out value='${requestScope.isPrjYn}'/>">
									<input type="hidden" name="logoutYn" id="logoutYn" value="<c:out value='${requestScope.logoutYn}'/>">
									<input type="hidden" name="message" id="message" value="<c:out value='${requestScope.message}'/>">
									<input type="hidden" name="sessionYn" id="sessionYn" value="<c:out value='${requestScope.sessionYn}'/>">
									<input type="hidden" name="iniYn" id="iniYn" value="<c:out value='${requestScope.iniYn}'/>">
									<input type="hidden" name="exprYn" id="exprYn" value="<c:out value='${requestScope.exprYn}'/>">
									<input type="hidden" name="loginSessionYn" id="loginSessionYn" value="<c:out value='${requestScope.loginSessionYn}'/>">
									<input type="hidden" name="paramUsrId" id="paramUsrId" value="<c:out value='${requestScope.paramUsrId}'/>">
									<input type="hidden" name="paramEmail" id="paramEmail" value="<c:out value='${requestScope.paramEmail}'/>">
									<input type="hidden" name="paramUsrPw" id="paramUsrPw" value="<c:out value='${requestScope.paramUsrPw}'/>">
									<input type="hidden" name="licGrpId" id="licGrpId" value="<c:out value='${requestScope.licGrpId}'/>">
								</form>
							</div>
						</div>

						<!--end::Wrapper-->

					</div>

					<!--begin::Body-->
				</div>

				<!--end::Item-->

				<!--begin::Item-->
				<div class="kt-grid__item">
					<div class="kt-login-v2__footer">
						<div class="kt-login-v2__link">
							<!-- <a href="#" class="kt-link kt-font-brand">Privacy</a>
							<a href="#" class="kt-link kt-font-brand">Legal</a> -->
							<a href="#" class="kt-link kt-font-brand">Luna™OPS 2.0</a>
						</div>
						<div class="kt-login-v2__info">
							Copyright ⓒ <a href="http://opensoftlab.kr" target="_blank" class="kt-link">Open Soft Lab Corp. </a> All Rights Reserved
						</div>
					</div>
				</div>

				<!--end::Item-->
			</div>
		</div>

		<!-- end:: Page -->

		<!-- begin::Global Config(global config for global JS sciprts) -->
		<script>
			var KTAppOptions = {
				"colors": {
					"state": {
						"brand": "#1cac81",
						"metal": "#c4c5d6",
						"light": "#ffffff",
						"accent": "#00c5dc",
						"primary": "#5867dd",
						"success": "#34bfa3",
						"info": "#36a3f7",
						"warning": "#ffb822",
						"danger": "#fd3995",
						"focus": "#9816f4"
					},
					"base": {
						"label": [
							"#b9bdc1",
							"#aeb2b7",
							"#414b4c",
							"#343d3e"
						],
						"shape": [
							"#eef4f3",
							"#e0e9e6",
							"#80c3af",
							"#41675c"
						]
					}
				}
			};
		</script>

		<!-- end::Global Config -->
		
		<!--begin::Global Theme Bundle(used by all pages) -->
		<script src="<c:url value='/plugins/global/plugins.bundle.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/js/scripts.bundle.js'/>" type="text/javascript"></script>
		<!-- 언어 데이터 스크립트는 core보다 먼저 선언 -->
		<script src="<c:url value='/js/osl/osl-lang.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/js/osl/osl-core.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/js/common/modalPopup.js'/>" type="text/javascript"></script>
		<!--end::Global Theme Bundle -->

		<!--begin::Page Scripts(used by this page) -->
		<script src="<c:url value='/js/login/login.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/plugins/jquery-loading/js/app.js'/>" type="text/javascript"></script>
		
		<!--end::Page Scripts -->
	</body>

	<!-- end::Body -->
</html>