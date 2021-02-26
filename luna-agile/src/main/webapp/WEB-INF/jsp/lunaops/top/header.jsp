<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
	<!-- begin::Head -->
	<head>
		<base href="">
		<meta charset="utf-8" />
		<title>Open Soft Lab - Luna™OPS</title>
		<meta name="description" content="Latest updates and statistic charts">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />

		<!--begin::Fonts -->
		<link href="<c:url value='/css/style.font.css'/>" rel="stylesheet" type="text/css" />
		<!--end::Fonts -->

		<!--begin::Page Vendors Styles(used by this page) -->
		<link href="<c:url value='/plugins/jquery-loading/css/app.css'/>" rel="stylesheet">
		<link href="<c:url value='/plugins/custom/uppy/uppy.bundle.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/plugins/custom/jstree/jstree.bundle.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/plugins/apexcharts/apexcharts.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/plugins/dragula/dragula.css'/>" rel="stylesheet" type="text/css" />
		
		<!--end::Page Vendors Styles -->

		<!--begin::Global Theme Styles(used by all pages) -->

		<!--end::Global Theme Styles -->

		<!--begin::Layout Skins(used by all pages) -->

		<!--end::Layout Skins -->
		<link rel="shortcut icon" href="<c:url value='/media/logos/favicon.ico'/>" />

		<!-- OSL Custom Css -->
		<link href="<c:url value='/css/style.osl.css'/>" rel="stylesheet" type="text/css" />
		<!-- 언어 데이터 스크립트는 core보다 먼저 선언 -->
		<script src="<c:url value='/js/osl/osl-lang.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/js/osl/osl-core.js'/>" type="text/javascript"></script>
		<!-- Vanilla JS - DOM보다 먼저 선언 -->
		<script src="<c:url value='/plugins/draggable/draggabilly.pkgd.js'/>" type="text/javascript"></script>
