<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	</head>
	<!-- end::Head -->
	
	<!-- begin::Body -->
	<body class="kt-quick-panel--right kt-demo-panel--right kt-offcanvas-panel--right kt-header--fixed kt-header-mobile--fixed kt-subheader--fixed kt-subheader-mobile--fixed kt-aside--enabled kt-aside--left kt-aside--fixed kt-aside--offcanvas-default kt-page--loading">
		<form name="hideAuthForm" method="post">
			<input type="hidden" name="url">
			<input type="hidden" name="prjId">
			<input type="hidden" name="authGrpId">
		</form>
		<form name="hideMoveForm" method="post">
			<input type="hidden" name="menuUrl">
			<input type="hidden" name="menuId">
			<input type="hidden" name="menuNm">
			<input type="hidden" name="prjGrpId">
			<input type="hidden" name="prjId">
			<input type="hidden" name="authGrpId">
			<input type="hidden" name="moveType">
		</form>
		<!-- begin:: Page -->

		<!-- begin:: Header Mobile -->
		<div id="kt_header_mobile" class="kt-header-mobile  kt-header-mobile--fixed ">
			<div class="kt-header-mobile__logo">
				<a href="javascript:$.osl.goAuthGrp('${sessionScope.selPrjGrpId}', '${sessionScope.selPrjId}','${sessionScope.selAuthGrpId}');">
					<img alt="Logo" src="/media/logos/logo_S_osl.png"/>
				</a>
			</div>
			<div class="kt-header-mobile__toolbar">
				<button class="kt-header-mobile__toolbar-toggler" id="kt_header_mobile_toggler"><span></span></button>
				<button class="kt-header-mobile__toolbar-topbar-toggler" id="kt_header_mobile_topbar_toggler"><i class="flaticon-more"></i></button>
			</div>
		</div>

		<!-- end:: Header Mobile -->
		<div class="kt-grid kt-grid--hor kt-grid--root">
			<div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--ver kt-page">
				<div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper" id="kt_wrapper">

					<!-- begin:: Header -->
					<div id="kt_header" class="kt-header kt-grid__item kt-grid kt-grid--ver  kt-header--fixed ">

						<!-- begin:: Brand -->
						<div class="kt-header__brand   kt-grid__item" id="kt_header_brand">
							<a href="javascript:$.osl.goAuthGrp('${sessionScope.selPrjGrpId}', '${sessionScope.selPrjId}','${sessionScope.selAuthGrpId}');">
								<img alt="Logo" src="/media/logos/logo_S_osl.png" />
							</a>
						</div>

						<!-- end:: Brand -->
						
						<!-- begin: Header Menu -->
						<button class="kt-header-menu-wrapper-close" id="kt_header_menu_mobile_close_btn"><i class="la la-close"></i></button>
						<div class="kt-header-menu-wrapper kt-grid__item" id="kt_header_menu_wrapper">
							<div id="kt_header_menu" class="kt-header-menu kt-header-menu-mobile ">
								<ul class="kt-menu__nav" id="globalsTopMenuUl">
									<!-- 즐겨찾기 메뉴 -->
									<li class="kt-menu__item kt-menu__item--submenu kt-menu__item--rel kt-menu__item--open" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
										<a href="javascript:;" class="kt-menu__link kt-menu__toggle" data-toggle="kt-tooltip" data-skin="brand" title="즐겨찾기">
											<i class="kt-menu__link-icon flaticon-star osl-favorites--active"></i>
											<span class="kt-menu__link-text">즐겨 찾기</span>
											<i class="kt-menu__hor-arrow la la-angle-down"></i>
											<i class="kt-menu__ver-arrow la la-angle-right"></i>
										</a>
										<div class="kt-menu__submenu  kt-menu__submenu--fixed kt-menu__submenu--left" style="min-width:920px;">	
											<div class="kt-menu__subnav">
												<ul class="kt-menu__content">
													<li class="kt-menu__item kt-scroll osl-top__menu--height" data-scroll="true">
														<h4 class="kt-menu__heading kt-menu__toggle">
															<span class="kt-menu__link-text">메뉴</span>
															<i class="kt-menu__ver-arrow la la-angle-right"></i>
														</h4>
														<ul class="kt-menu__inner" id="fvrListType01">
														</ul>
													</li>
													<li class="kt-menu__item kt-scroll osl-top__menu--height" data-scroll="true">
														<h4 class="kt-menu__heading kt-menu__toggle">
															<span class="kt-menu__link-text">프로젝트 그룹</span>
															<i class="kt-menu__ver-arrow la la-angle-right"></i>
														</h4>
														<ul class="kt-menu__inner" id="fvrListType02">
														</ul>
													</li>
													<li class="kt-menu__item kt-scroll osl-top__menu--height" data-scroll="true">
														<h4 class="kt-menu__heading kt-menu__toggle">
															<span class="kt-menu__link-text">프로젝트</span>
															<i class="kt-menu__ver-arrow la la-angle-right"></i>
														</h4>
														<ul class="kt-menu__inner" id="fvrListType03">
														</ul>
													</li>
													<li class="kt-menu__item kt-scroll osl-top__menu--height" data-scroll="true">
														<h4 class="kt-menu__heading kt-menu__toggle">
															<span class="kt-menu__link-text">권한 그룹</span>
															<i class="kt-menu__ver-arrow la la-angle-right"></i>
														</h4>
														<ul class="kt-menu__inner" id="fvrListType04">
														</ul>
													</li>
												</ul>
											</div>
										</div>
									</li>
									
									
								</ul>
							</div>
						</div>

						<div id="kt_header_pc" class="kt-header-pc  kt-header-pc--fixed">
							<div class="kt-header-pc__toolbar">
								<button class="kt-header-pc__toolbar-topbar-toggler" id="kt_header_pc_topbar_toggler" data-toggle="kt-tooltip" data-placement="left" data-skin="brand" title="추가 기능 바"><i class="flaticon-more"></i></button>
							</div>
						</div>
						
						<!-- end: Header Menu -->
						<!-- begin:: Header Topbar -->
						<div class="kt-header__topbar kt-grid__item kt-grid__item--fluid">
							<!--begin: Search -->
							<div class="kt-header__topbar-item kt-header__topbar-item--search dropdown" data-toggle="kt-tooltip" data-skin="brand" title="검색">
								<div class="kt-header__topbar-wrapper" id="kt_offcanvas_toolbar_search_toggler_btn">
									<span class="kt-header__topbar-icon"><i class="flaticon2-search"></i></span>
								</div>
							</div>

							<!--end: Search -->
							
							<!--begin: MyPage -->
							<div class="kt-header__topbar-item">
								<div class="kt-header__topbar-wrapper" id="kt_offcanvas_toolbar_mypage_toggler_btn" data-toggle="kt-tooltip" data-skin="brand" title="마이페이지" onclick="$.osl.user.usrMyPagePopUp('${sessionScope.loginVO.usrId}');">
									<span class="kt-header__topbar-icon"><i class="flaticon2-user"></i></span>
								</div>
							</div>
							<!--end: MyPage -->
							
							<!--begin: Message -->
							<div class="kt-header__topbar-item">
								<div class="kt-header__topbar-wrapper" id="kt_offcanvas_toolbar_message_toggler_btn" data-toggle="kt-tooltip" data-skin="brand" title="메시지" onclick="$.osl.layerPopupOpen('/arm/arm1000/arm1000/selectArm1000View.do',null,{modalSize:'xl', modalTitle:'MESSAGE'})">
									<span class="kt-header__topbar-icon"><i class="flaticon-email-black-circular-button"></i></span>
								</div>
							</div>
							<!--end: Message -->
							
							<!--begin: Notifications -->
							<div class="kt-header__topbar-item">
								<div class="kt-header__topbar-wrapper pulse pulse-success" id="kt_offcanvas_toolbar_notifications_toggler_btn" data-toggle="kt-tooltip" data-skin="brand" title="알림">
									<span class="kt-header__topbar-icon"><i class="flaticon2-notification"></i></span>
									<span class="pulse-ring"></span>
									<span class="kt-badge kt-badge--brand"></span>
								</div>
							</div>

							<!--end: Notifications -->

							<!--begin: Quick actions -->
							<div class="kt-header__topbar-item">
								<div class="kt-header__topbar-wrapper" id="kt_offcanvas_toolbar_quick_actions_toggler_btn" data-toggle="kt-tooltip" data-skin="brand" title="개인 설정">
									<span class="kt-header__topbar-icon"><i class="flaticon2-settings"></i></span>
								</div>
							</div>

							<!--end: Quick actions -->

							<!--begin: Quick panel toggler -->
							<div class="kt-header__topbar-item">
								<div class="kt-header__topbar-wrapper" id="kt_quick_panel_toggler_btn" data-toggle="kt-tooltip" data-skin="brand" title="담당 요구사항">
									<span class="kt-header__topbar-icon" id="kt_quick_panel_toggler_btn"><i class="flaticon2-menu"></i></span>
								</div>
							</div>

							<!--end: Quick panel toggler -->

							<!--begin: Language bar -->
							<div class="kt-header__topbar-item kt-header__topbar-item--langs" data-toggle="kt-tooltip" data-skin="brand" title="언어 변경">
								<div class="kt-header__topbar-wrapper" data-toggle="dropdown" data-offset="10px,0px">
									<span class="kt-header__topbar-icon" id="usrCurrentLangCd">
										<img class="" src="/media/flags/094-south-korea.svg" alt="" />
									</span>
								</div>
								<div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround">
									<ul class="kt-nav kt-margin-t-10 kt-margin-b-10" id="usrLangCdList">
										<li class="kt-nav__item active">
											<a href="#" class="kt-nav__link" value="01" id="usrLangCd_ko" data-mst-cd="OPT00004" data-sub-cd="ko" data-sub-cd-ref1="한국어" data-sub-cd-ref2="094-south-korea.svg" onclick="$.osl.user.usrOptLangChg(this);">
												<span class="kt-nav__link-icon"><img src="/media/flags/094-south-korea.svg" alt="" /></span>
												<span class="kt-nav__link-text">한국어</span>
											</a>
										</li>
										<li class="kt-nav__item">
											<a href="#" class="kt-nav__link" value="02" id="usrLangCd_en" data-mst-cd="OPT00004" data-sub-cd="en" data-sub-cd-ref1="English" data-sub-cd-ref2="226-united-states.svg" onclick="$.osl.user.usrOptLangChg(this);">
												<span class="kt-nav__link-icon"><img src="/media/flags/226-united-states.svg" alt="" /></span>
												<span class="kt-nav__link-text">English</span>
											</a>
										</li>
									</ul>
								</div>
							</div>


							<!--end: Language bar -->
							<!--begin: User bar -->
							<div class="kt-header__topbar-item kt-header__topbar-item--user" id="kt_offcanvas_toolbar_profile_toggler_btn" data-toggle="kt-tooltip" data-skin="brand" title="개인 정보">
								<div class="kt-header__topbar-username">
									${sessionScope.loginVO.usrNm}
								</div>
								<div class="kt-header__topbar-wrapper">
									<img alt="Pic" src="/cmm/fms/getImage.do?fileSn=0&atchFileId=${sessionScope.loginVO.usrImgId}" onerror="this.src='/media/users/default.jpg'"/>
								</div>
							</div>
							<!--end: User bar -->
						</div>

						<!-- end:: Header Topbar -->
						<!-- begin:: Subheader -->
						<div id="kt_subheader" class="kt-subheader kt-grid__item ">
							<div class="kt-container  kt-container--fluid ">
	
								<!-- begin:: Subheader Title -->
								<div class="kt-subheader__title">
									<button class="kt-subheader__toggler kt-subheader__toggler--left" id="kt_aside_toggler" data-toggle="kt-tooltip" data-skin="brand" title="프로젝트 및 권한그룹 선택"><span></span></button>
									<div class="kt-subheader__breadcrumbs" id="kt-subheader__breadcrumbs">
										<a href="#" class="kt-subheader__breadcrumbs-link osl-subheader__menuNm--upup osl-link--disabled osl-word__break osl-word__break--w150" title="<c:out value="${sessionScope.strUpupMenuNm}"/>"><c:out value="${sessionScope.strUpupMenuNm}"/></a>
										<span class="kt-subheader__breadcrumbs-separator osl-subheader__menuNm--upup "></span>
										<a href="#" class="kt-subheader__breadcrumbs-link osl-subheader__menuNm--up osl-link--disabled osl-word__break osl-word__break--w150" title="<c:out value="${sessionScope.strUpMenuNm}"/>"><c:out value="${sessionScope.strUpMenuNm}"/></a>
										<span class="kt-subheader__breadcrumbs-separator osl-subheader__menuNm--up"></span>
										<a href="#" class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--home osl-subheader__menuNm osl-link--disabled osl-word__break osl-word__break--w200" title="<c:out value="${sessionScope.selMenuNm}"/>"><c:out value="${sessionScope.selMenuNm}"/></a>
									</div>
								</div>
								<!-- end:: Subheader Title -->
	
								<!-- begin:: Sub-header toolbar -->
								<div class="kt-subheader__toolbar">
									<div class="kt-subheader__toolbar-wrapper">
										<div class="dropdown dropdown-inline" data-toggle="kt-tooltip" data-skin="brand" title="프로젝트 그룹 선택" data-placement="top">
											<a href="#" class="btn btn-default btn-bold btn-upper btn-sm" data-toggle="dropdown" data-offset="0,5px" aria-haspopup="true" aria-expanded="false" id="submenu-prjGrp-sel" data-target-id="${sessionScope.selPrjGrpId}">
											</a>
											<div class="dropdown-menu dropdown-menu-md dropdown-menu-right dropdown-menu-anim kt-padding-t-0">
												<div class="kt-head" style="background-image: url(/media/misc/head_bg_sm.jpg)">
													<h4 class="kt-head__title kt-font-boldest">프로젝트 그룹</h4>
													<!-- <div class="kt-head__sub"><span class="kt-head__desc">권한있는 프로젝트 그룹 목록</span></div> -->
												</div>
												<div class="dropdown-divider"></div>
												<ul class="kt-nav kt-nav--active-bg kt-nav--v3  ps ps--active-y" data-ktmenu-vertical="1" data-ktmenu-scroll="1" id="submenu-prjGrp-sel_opt" role="tablist">
													
												</ul>
											</div>
										</div>
										<div class="dropdown dropdown-inline" data-toggle="kt-tooltip" data-skin="brand" title="프로젝트 선택" data-placement="top">
											<a href="#" class="btn btn-default btn-bold btn-upper btn-sm" data-toggle="dropdown" data-offset="0,5px" aria-haspopup="true" aria-expanded="false" id="submenu-prj-sel" data-target-id="${sessionScope.selPrjId}">
											</a>
											<div class="dropdown-menu dropdown-menu-md dropdown-menu-right dropdown-menu-anim kt-padding-t-0">
												<div class="kt-head" style="background-image: url(/media/misc/head_bg_sm.jpg)">
													<h4 class="kt-head__title kt-font-boldest">프로젝트</h4>
													<!-- <div class="kt-head__sub"><span class="kt-head__desc">권한있는 프로젝트 그룹 목록</span></div> -->
												</div>
												<div class="dropdown-divider"></div>
												<ul class="kt-nav kt-nav--active-bg kt-nav--v3" id="submenu-prj-sel_opt" role="tablist">
													
												</ul>
											</div>
										</div>
										<div class="dropdown dropdown-inline" data-toggle="kt-tooltip" data-skin="brand" title="권한그룹 선택" data-placement="top">
											<a href="#" class="btn btn-default btn-bold btn-upper btn-sm" data-toggle="dropdown" data-offset="0,5px" aria-haspopup="true" aria-expanded="false" id="submenu-authGrp-sel" data-target-id="${sessionScope.selAuthGrpId}">
											</a>
											<div class="dropdown-menu dropdown-menu-md dropdown-menu-right dropdown-menu-anim kt-padding-t-0">
												<div class="kt-head" style="background-image: url(/media/misc/head_bg_sm.jpg)">
													<h4 class="kt-head__title kt-font-boldest">권한 그룹</h4>
													<!-- <div class="kt-head__sub"><span class="kt-head__desc">권한있는 프로젝트 그룹 목록</span></div> -->
												</div>
												<div class="dropdown-divider"></div>
												<ul class="kt-nav kt-nav--active-bg kt-nav--v3" id="submenu-authGrp-sel_opt" role="tablist">
													
												</ul>
											</div>
										</div>
										<div class="dropdown dropdown-inline" data-toggle="kt-tooltip" title="로그아웃" data-placement="top" data-skin="brand">
											<a href="javascript:$.osl.user.logout();" class="btn btn-outline-danger btn-icon" aria-haspopup="true" aria-expanded="false">
												<i class="fa fa-sign-out-alt"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- end:: Sub-header toolbar -->
							</div>
						</div>
						<!-- end:: Subheader -->
					</div>

					<!-- end:: Header -->
					<!-- begin::Offcanvas Toolbar Quick Actions -->
					<div id="kt_offcanvas_toolbar_quick_actions" class="kt-offcanvas-panel">
						<div class="kt-offcanvas-panel__head">
							<h4 class="kt-offcanvas-panel__title kt-font-boldest">
								사용자 설정
							</h4>
							<a href="#" class="kt-offcanvas-panel__close" id="kt_offcanvas_toolbar_quick_actions_close"><i class="flaticon2-delete"></i></a>
						</div>
						<div class="kt-offcanvas-panel__body">
							<form class="kt-form" id="userSettingForm" name="userSettingForm">
								<div class="kt-heading kt-heading--space-sm">Header</div>
								<div class="form-group form-group-xs row" data-toggle="kt-tooltip" data-html="true" title="[상단 메뉴 타입]</br>전체 펼침: 대 메뉴 하위 메뉴 전체 펼침 표시  </br>계층 펼침: 대 메뉴 부터 하위 메뉴를 계층적으로 표시" data-placement="top" data-skin="brand">
									<label class="col-6 col-form-label">
										<span class="badge badge-dark badge-pill kt-font-sm kt-font-bolder osl-aside__badge flaticon2-settings kt-margin-r-10"></span>
										상단 메뉴 타입
									</label>
									<div class="col-6 kt-align-right">
										<span class="kt-switch kt-switch--sm kt-switch--success">
											<select class="form-control" id="usrOpt_OPT00001" name="usrOpt_OPT00001" data-osl-value="" data-mst-cd="OPT00001" onchange="$.osl.user.usrOptChg(this);">
											</select>
										</span>
									</div>
								</div>
								<div class="form-group form-group-xs row" data-toggle="kt-tooltip" data-html="true" title="상단 추가 기능바 항상 보이기/선택 보이기" data-placement="top" data-skin="brand">
									<label class="col-6 col-form-label">
										<span class="badge badge-dark badge-pill kt-font-sm kt-font-bolder osl-aside__badge flaticon2-settings kt-margin-r-10"></span>
										상단 추가 기능 바
									</label>
									<div class="col-6 kt-align-right">
										<span class="kt-switch kt-switch--sm kt-switch--success">
											<select class="form-control" id="usrOpt_OPT00002" name="usrOpt_OPT00002" data-osl-value="" data-mst-cd="OPT00002" onchange="$.osl.user.usrOptChg(this);">
											</select>
										</span>
									</div>
								</div>
								<div class="kt-separator kt-separator--space-md kt-separator--border-dashed"></div>
								<div class="kt-heading kt-heading--space-sm">Etc</div>
								<div class="form-group form-group-xs row" data-toggle="kt-tooltip" data-html="true" title="프로젝트 및 권한그룹 전환 시 메인 페이지 선택" data-placement="top" data-skin="brand">
									<label class="col-6 col-form-label">
										<span class="badge badge-dark badge-pill kt-font-sm kt-font-bolder osl-aside__badge flaticon2-settings kt-margin-r-10"></span>
										메인페이지 설정
									</label>
									<div class="col-6 kt-align-right">
										<span class="kt-switch kt-switch--sm kt-switch--success">
											<select class="form-control" id="usrOpt_OPT00003" name="usrOpt_OPT00003" data-osl-value="" data-mst-cd="OPT00003" onchange="$.osl.user.usrOptChg(this);">
											</select>
										</span>
									</div>
								</div>
							</form>
						</div>
					</div>
					
					<!-- end::Scrolltop -->
					<!-- end::Offcanvas Toolbar Quick Actions -->
					
					<!-- begin::Offcanvas Toolbar Quick Panel -->
					<div id="kt_quick_panel" class="kt-offcanvas-panel">
						<div class="kt-offcanvas-panel__head">
							<h4 class="kt-offcanvas-panel__title kt-font-boldest">
								담당 요구사항
							</h4>
							<a href="#" class="kt-offcanvas-panel__close" id="kt_quick_panel_close_btn"><i class="flaticon2-delete"></i></a>
						</div>
						<div class="kt-offcanvas-panel__body">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<div class="osl-datatable-search" data-datatable-id="chargeReqTable"></div>
								</div>
							</div>
							<div id="chargeReqCardTable"></div>
							<div class="kt_datatable" id="chargeReqTable"></div>
							
						</div>
					</div>
					<!-- end::Offcanvas Toolbar Quick Panel -->
					
					
					<!-- begin::Offcanvas Toolbar Quick Notifications -->
					<div id="kt_offcanvas_toolbar_notifications" class="kt-offcanvas-panel">
						<div class="kt-offcanvas-panel__head">
							<h4 class="kt-offcanvas-panel__title kt-font-boldest">
								알림
								<small id="newNtfMsg"></small>
							</h4>
							<a href="#" class="kt-offcanvas-panel__close" id="kt_offcanvas_toolbar_notifications_close"><i class="flaticon2-delete"></i></a>
						</div>
						<div class="kt-notification-v2">
							<div id="notificationsCardTable">
							</div>
							<div class="kt_datatable" id="notificationsTable"></div>
							
						</div>
					</div>
					<!-- end::Offcanvas Toolbar Quick Notifications -->
					
					<div class="kt-content  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor" id="kt_content">

						<!-- begin:: Content -->
						<div class="kt-container kt-container--fluid  kt-grid__item kt-grid__item--fluid">
	