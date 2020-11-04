<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					<!-- end:: Content -->
					</div>
				</div>
				<!-- begin:: Footer -->
					<div class="kt-footer kt-grid__item" id="kt_footer">
						<div class="kt-container kt-container--fluid">
							<div class="kt-footer__copyright">
								Copyright ⓒ <a href="http://opensoftlab.kr" target="_blank" class="kt-link">Open Soft Lab Corp. </a> All Rights Reserved
							</div>
							<div class="kt-footer__menu">
								<!-- <a href="/" target="_self" class="kt-link">Link1</a>
								<a href="/" target="_self" class="kt-link">Link2</a> -->
								<a href="/" target="_self" class="kt-link">Luna™OPS 2.0</a>
							</div>
						</div>
					</div>
				<!-- end:: Footer -->
			</div>
		</div>
		
		<!-- begin::Scrolltop -->
		<div id="kt_scrolltop" class="kt-scrolltop">
			<i class="fa fa-arrow-up"></i>
		</div>

		<!-- end::Scrolltop -->
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
				},
				"tools":{
					"toggle":{
						"expand":"테스트"
					}
				}
			};
		</script>

		<!-- end::Global Config -->

		<!--begin::Global Theme Bundle(used by all pages) -->
		<script src="<c:url value='/js/common/modalPopup.js'/>" type="text/javascript"></script>
		<!--end::Global Theme Bundle -->

		<!--begin::Page Vendors(used by this page) -->
		<script src="<c:url value='/plugins/jquery-loading/js/app.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/plugins/custom/uppy/uppy.bundle.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/plugins/custom/uppy/locales/ko_KR.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/js/lang/summernote/summernote-ko-KR.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/plugins/custom/jstree/jstree.bundle.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/plugins/apexcharts/apexcharts.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/plugins/dragula/dragula.min.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/plugins/sortable/Sortable.js'/>" type="text/javascript"></script>
		<!--end::Page Vendors -->

		<iframe id="fileDownFrame" name="fileDownFrame" src="/com/fms/FileDown.do" style="width:0;height:0;display:none;"></iframe>
	</body>

	<!-- end::Body -->
</html>