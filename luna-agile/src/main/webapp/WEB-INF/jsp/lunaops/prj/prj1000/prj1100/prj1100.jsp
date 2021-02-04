<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-grid kt-grid--desktop kt-grid--ver-desktop  kt-inbox" id="kt_inbox">
	<div class="kt-grid__item kt-portlet kt-inbox__aside" id="kt_inbox_aside">
		<div type="button" class="btn btn-brand  btn-upper btn-bold  kt-inbox__compose" data-toggle="modal" data-target="#kt_inbox_compose">
			<i class="fa fa-layer-group"></i><span>프로세스 생성</span>
		</div>
		<div class="kt-inbox__nav">
			<ul class="kt-nav">
				<li class="kt-nav__item kt-nav__item--active">
					<a href="#" class="kt-nav__link" data-action="list" data-type="inbox">
						<i class="kt-nav__link-icon flaticon-star osl-favorites--active"></i>
						<span class="kt-nav__link-text">Inbox</span>
						<span class="kt-nav__link-badge">
							<span class="kt-badge kt-badge--unified-success kt-badge--md kt-badge--rounded kt-badge--boldest">3</span>
						</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link" data-action="list" data-type="marked">
						<i class="kt-nav__link-icon flaticon-star osl-favorites--active"></i>
						<span class="kt-nav__link-text">Marked</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link" data-action="list" data-type="draft">
						<i class="kt-nav__link-icon flaticon-star osl-favorites--active"></i>
						<span class="kt-nav__link-text">Draft</span>
						<span class="kt-nav__link-badge">
							<span class="kt-badge kt-badge--unified-warning kt-badge--md kt-badge--rounded kt-badge--boldest">1</span>
						</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link" data-action="list" data-type="sent">
						<i class="kt-nav__link-icon flaticon-star"></i>
						<span class="kt-nav__link-text">Sent</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link" data-action="list" data-type="trash">
						<i class="kt-nav__link-icon flaticon-star"></i>
						<span class="kt-nav__link-text">Trash</span>
					</a>
				</li>
				<li class="kt-nav__item kt-margin-t-30">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa fa-genderless kt-font-warning"></i>
						<span class="kt-nav__link-text">전체 프로세스</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa fa-genderless kt-font-success"></i>
						<span class="kt-nav__link-text">확정 프로세스</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa fa-genderless kt-font-info"></i>
						<span class="kt-nav__link-text">폐기 프로세스</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa flaticon2-plus"></i>
						<span class="kt-nav__link-text">프로세스 분류 생성</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="kt-grid__item kt-grid__item--fluid kt-portlet kt-inbox__list kt-inbox__list--shown" id="kt_inbox_list">
		<div class="kt-portlet__head">
			<div class="kt-inbox__toolbar kt-inbox__toolbar--extended">
				<div class="kt-inbox__actions kt-inbox__actions--expanded">
					<div class="kt-inbox__panel">
						<button type="button" class="kt-inbox__icon" data-toggle="kt-tooltip" title="Reload list">
							<i class="flaticon2-refresh-button"></i>
						</button>
						<button class="kt-inbox__icon" data-toggle="kt-tooltip" title="Archive">
							<i class="flaticon2-layers-1"></i>
						</button>
						<button class="kt-inbox__icon" data-toggle="kt-tooltip" title="Spam">
							<i class="flaticon2-information"></i>
						</button>
						<button class="kt-inbox__icon" data-toggle="kt-tooltip" title="Delete">
							<i class="flaticon2-rubbish-bin"></i>
						</button>
						<button class="kt-inbox__icon" data-toggle="kt-tooltip" title="Mark as read">
							<i class="flaticon2-writing"></i>
						</button>
						<button class="kt-inbox__icon" data-toggle="kt-tooltip" title="Move">
							<i class="flaticon2-expand"></i>
						</button>
						<button class="kt-inbox__icon" data-toggle="kt-tooltip" title="Move">
							<i class="flaticon2-add-square"></i>
						</button>
					</div>
				</div>
				<div class="kt-inbox__search d-flex">
					<button class="kt-inbox__icon osl-inbox__aside-menu-bar" id="osl-inbox__aside-menu-bar" data-toggle="kt-tooltip" title="Aside Menu">
						<i class="fa fa-bars"></i>
					</button>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search">
						<div class="input-group-append">
							<span class="input-group-text">
								<i class="flaticon2-magnifier-tool"></i>
							</span>
						</div>
					</div>
				</div>
				<div class="kt-inbox__controls">
					<div class="btn-group" data-toggle="kt-tooltip" title="Settings">
						<button type="button" class="kt-inbox__icon" data-toggle="dropdown">
							<i class="flaticon-more-1"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right dropdown-menu-fit dropdown-menu-md">

							<!--begin::Nav-->
							<ul class="kt-nav">
								<li class="kt-nav__head">
									Export Options
									<i class="flaticon2-information" data-toggle="kt-tooltip" data-placement="right" title="Click to learn more..."></i>
								</li>
								<li class="kt-nav__separator"></li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-drop"></i>
										<span class="kt-nav__link-text">Users</span>
									</a>
								</li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-calendar-8"></i>
										<span class="kt-nav__link-text">Reports</span>
										<span class="kt-nav__link-badge">
											<span class="kt-badge kt-badge--bold kt-badge--danger">9</span>
										</span>
									</a>
								</li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-drop"></i>
										<span class="kt-nav__link-text">Statements</span>
									</a>
								</li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-new-email"></i>
										<span class="kt-nav__link-text">Customer Support</span>
									</a>
								</li>
								<li class="kt-nav__separator"></li>
								<li class="kt-nav__foot">
									<a class="btn btn-label-brand btn-bold btn-sm" href="#">Proceed</a>
									<a class="btn btn-clean btn-bold btn-sm" href="#" data-toggle="kt-tooltip" data-placement="right" title="Click to learn more...">Learn more</a>
								</li>
							</ul>

							<!--end::Nav-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
"use strict";
var OSLPrj1100Popup = function () {
	//private functions
	var documentSetting = function(){
		//사이드바에 프로세스 목록 이벤트
		new KTOffcanvas($("#kt_inbox_aside")[0], {
            overlay: true,  
            baseClass: 'kt-inbox__aside',
            toggleBy: 'osl-inbox__aside-menu-bar'
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
	OSLPrj1100Popup.init();
});
</script>
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
