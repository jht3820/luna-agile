<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- begin page DOM -->
<form class="kt-form" id="frSpr1003">
	<input type="hidden" name="modalId" id="modalId" value="${param.modalId}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramSprId" id="paramSprId" value="${param.paramSprId}">
	<div class="kt-portlet__body">
		<div class="osl-wizard" id="kt_wizard_v3" data-ktwizard-state="step-first">
			<!--begin: Form Wizard Nav -->
			<div class="osl-wizard__nav">
				<!--doc: Remove "osl-wizard__nav-items--clickable" class and also set 'clickableSteps: false' in the JS init to disable manually clicking step titles -->
				<div class="osl-wizard__nav-items osl-wizard__nav-items--clickable">
					<!--begin: 1.회의록 작성 -->
					<div class="osl-wizard__nav-item" href="#" data-ktwizard-type="step" data-ktwizard-state="current">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">1</div>
							<div class="wizard-label">
								<div class="wizard-title">회의록 작성</div>
								<div class="wizard-desc">스프린트 회의록 작성</div>
							</div>
						</div>
					</div>
					<!--end: 1.회의록 작성 -->
					<!--begin: 2.스토리 포인트 입력 -->
					<div class="osl-wizard__nav-item" href="#" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">2</div>
							<div class="wizard-label">
								<div class="wizard-title">스토리 포인트 입력</div>
								<div class="wizard-desc">요구사항 스토리 포인트 입력</div>
							</div>
						</div>
					</div>
					<!--end: 2.스토리 포인트 입력 -->
					<!--begin: 3.담당자 지정 -->
					<div class="osl-wizard__nav-item" href="#" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">3</div>
							<div class="wizard-label">
								<div class="wizard-title">담당자 지정</div>
								<div class="wizard-desc">요구사항 담당자 지정</div>
							</div>
						</div>
					</div>
					<!--end: 3.담당자 지정 -->
					<!--begin: 4.프로세스 배정-->
					<div class="osl-wizard__nav-item" href="#" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">4</div>
							<div class="wizard-label">
								<div class="wizard-title">프로세스 배정</div>
							</div>
						</div>
					</div>
					<!--end: 4.프로세스 배정-->
				</div>
			</div>
			<!--end: Form Wizard Nav -->
			
				<!-- begin:: 1. 회의록 작성 스프린트 회의록 작성 -->
				<div class="osl-wizard__content osl-min-h-px--700 w-100 kt-bg-light kt-padding-20 kt-padding-l-40-desktop kt-padding-r-40-desktop" data-ktwizard-type="step-content" data-ktwizard-state="current">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-12" data-select2-id="42">
							<div class="form-group">
								<label><i class="fa fa-user-friends kt-margin-r-5"></i>참여 인원</label>
								<select class="form-control kt-select2 select2-hidden-accessible" id="sprConferenceUsr" name="state[]" multiple="multiple" data-select2-id="sprConferenceUsr" tabindex="-1" aria-hidden="true">
									<!-- ex)  selected="" 여부 :: 이미 태그가 추가 되어있는 경우 -->
									<option value="1" data-select2-id="a">정형택</option>
									<option value="2" data-select2-id="b">김정환</option>
									<option value="3" data-select2-id="c">진주영</option>
									<option value="4" data-select2-id="d">김민주</option>
									<option value="5" data-select2-id="e">배용진</option>
									<option value="6" data-select2-id="f">노민준</option>
									<option value="7" data-select2-id="g">안지혜</option>
									<option value="8" data-select2-id="h">김정환</option>
									<option value="9" data-select2-id="i">오현경</option>
									<option value="10" data-select2-id="j">최호현</option>
									<option value="11" data-select2-id="k">박현두</option>
								</select>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>회의록 제목</label>
								<input type="text" class="form-control">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="form-group form-group-last">
								<label class="required kt-margin-b-0"><i class="fa fa-edit kt-margin-r-5"></i>회의록 내용</label>
								<textarea class="form-control" name="sprStartText" id="sprStartText"></textarea>
							</div>
						</div>
					</div>
				</div>
				<!-- end:: 1. 회의록 작성 스프린트 회의록 작성 -->
				<!-- begin:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 -->
				<div class="osl-wizard__content osl-min-h-px--700 w-100 kt-bg-light kt-padding-20 kt-padding-l-40-desktop kt-padding-r-40-desktop" data-ktwizard-type="step-content">
					<div class="row kt-margin-t-20">
						<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 kt-margin-b-20">
							<div class="input-group">
								<div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
									<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="sprAssignReqTable">
										<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a>
									</div>
								</div>
								<!-- <select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_sprAssignReqTable" name="searchSelect" aria-hidden="true" data-datatable-id="sprAssignReqTable" style="display: none;"></select> -->
								<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="sprAssignReqTable">
									<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_sprAssignReqTable" id="searchData_sprAssignReqTable" data-datatable-id="sprAssignReqTable">
									<!-- <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
									<input type="hidden" name="searchStartDt" id="searchStartDt_sprAssignReqTable" data-datatable-id="sprAssignReqTable">
									<input type="hidden" name="searchEndDt" id="searchEndDt_sprAssignReqTable" data-datatable-id="sprAssignReqTable"> -->
								</div>
								<div class="input-group-append">
									<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="sprAssignReqTable">
										<i class="fa fa-search"></i><span class=""><span>검색</span></span>
									</button>
								</div>
							</div>
						</div>
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="kt_datatable kt-margin-b-0" id="sprAssignReqTable"></div>
						</div>
					</div>
				</div>
				<!-- end:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 -->
				<!-- begin:: 3. 담당자 지정 요구사항 담당자 지정 -->
				<div class="osl-wizard__content w-100 osl-min-h-px--700 kt-bg-light kt-padding-20 kt-padding-l-40-desktop kt-padding-r-40-desktop" data-ktwizard-type="step-content">
					<div class="row kt-margin-t-20">
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<div class="input-group kt-margin-b-20">
								<div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
									<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="sprAssignReqUsrTable">
										<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a>
									</div>
								</div>
								<!-- <select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_sprAssignReqUsrTable" name="searchSelect" aria-hidden="true" data-datatable-id="sprAssignReqUsrTable" style="display: none;"></select> -->
								<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="sprAssignReqUsrTable">
									<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_sprAssignReqUsrTable" id="searchData_sprAssignReqUsrTable" data-datatable-id="sprAssignReqUsrTable">
									<!-- <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
									<input type="hidden" name="searchStartDt" id="searchStartDt_sprAssignReqUsrTable" data-datatable-id="sprAssignReqUsrTable">
									<input type="hidden" name="searchEndDt" id="searchEndDt_sprAssignReqUsrTable" data-datatable-id="sprAssignReqUsrTable"> -->
								</div>
								<div class="input-group-append">
									<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="sprAssignReqUsrTable">
										<i class="fa fa-search"></i><span class=""><span>검색</span></span>
									</button>
								</div>
							</div>
							<div class="kt_datatable kt-margin-b-0" id="sprAssignReqUsrTable"></div>
						</div>
						<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 osl-mobile-margin-t-20">
							<div class="input-group kt-margin-b-20">
								<div class="input-group-prepend">
									<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0" name="selectSearchBtn" id="selectSearchBtn"><span data-lang-cd="stm2101.button.all">전체</span></button>
									<div class="dropdown-menu">
										<a class="selectSearchItem dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all"><span data-lang-cd="stm2101.button.all">전체</span></a>
										<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchAuthGrpNm" data-opt-type="select"><span data-lang-cd="stm2101.button.authNm">권한그룹 명</span></a>
										<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrId" data-opt-type="text"><span data-lang-cd="stm2101.button.userId">사용자 ID</span></a>
										<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrNm" data-opt-type="text"><span data-lang-cd="stm2101.button.userName">사용자 명</span></a>
									</div>
								</div>
								<!-- <select class="kt-select2 form-control kt-hide" id="searchSelect" name="searchSelect" aria-hidden="true">
								</select> -->
								<input type="text" class="form-control" disabled="disabled" name="subSearchData" id="subSearchData">
								<div class="input-group-prepend">
									<button class="btn btn-brand" type="button" name="searchBtn" id="searchBtn">
										<span class=""><span data-lang-cd="stm2101.button.search">검색</span></span>
									</button>
								</div>
							</div>
							<!--사용자 표출영역-->
							<div class="kt-list ps--active-y form-control kt-margin-t-10 kt-padding-10 overflow-auto osl-min-h-px--365" id="sprUsrList" name="sprUsrList" required>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="kt-widget kt-margin-b-10 kt-widget--general-2 border rounded">
									<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">
										<div class="kt-media kt-media--lg kt-media--circle">
											<i class="fas fa-user-tag"></i>
										</div>
										<div class="kt-widget__wrapper">
											<div class="kt-widget__label">
												<a href="#" class="kt-widget__title">
													오현경
												</a>
												<span class="kt-widget__desc">
													<span>사원</span>/<span>팀장</span>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end:: 3. 담당자 지정 요구사항 담당자 지정  -->
				<!-- begin:: 4. 프로세스 배정 -->
				<div class="osl-wizard__content osl-min-h-px--700  w-100 kt-bg-light kt-padding-20 kt-padding-l-40-desktop kt-padding-r-40-desktop" data-ktwizard-type="step-content">
					<div class="row kt-margin-t-20">
						<!-- begin:: 4-1. 배정 프로세스 데이터 테이블 -->
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-20 kt-padding-r-20 osl-mobile-padding-lr-10">
							<div class="input-group  kt-margin-b-20">
								<div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
									<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="sprAssignProcessTable">
										<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a>
									</div>
								</div>
								<!-- <select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_sprAssignProcessTable" name="searchSelect" aria-hidden="true" data-datatable-id="sprAssignProcessTable" style="display: none;"></select> -->
								<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="sprAssignProcessTable">
									<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_sprAssignProcessTable" id="searchData_sprAssignProcessTable" data-datatable-id="sprAssignProcessTable">
									<!-- <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
									<input type="hidden" name="searchStartDt" id="searchStartDt_sprAssignProcessTable" data-datatable-id="sprAssignProcessTable">
									<input type="hidden" name="searchEndDt" id="searchEndDt_sprAssignProcessTable" data-datatable-id="sprAssignProcessTable"> -->
								</div>
								<div class="input-group-append">
									<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="sprAssignProcessTable">
										<i class="fa fa-search"></i><span class=""><span>검색</span></span>
									</button>
								</div>
							</div>
							<div class="kt_datatable kt-margin-b-0" id="sprAssignProcessTable"></div>
						</div>
						<!-- end:: 4-1. 배정 프로세스 데이터 테이블 -->
						<!-- begin:: 4-2. 미배정 프로세스 데이터 테이블 -->
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-20 kt-padding-r-20 osl-mobile-padding-lr-10 osl-mobile-margin-t-20">
							<div class="input-group kt-margin-b-20">
								<div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
									<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="sprNotAssignProcessTable">
										<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a>
										<a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a>
									</div>
								</div>
								<!-- <select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_sprNotAssignProcessTable" name="searchSelect" aria-hidden="true" data-datatable-id="sprNotAssignProcessTable" style="display: none;"></select> -->
								<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="sprNotAssignProcessTable">
									<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_sprNotAssignProcessTable" id="searchData_sprNotAssignProcessTable" data-datatable-id="sprNotAssignProcessTable">
									<!-- <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
									<input type="hidden" name="searchStartDt" id="searchStartDt_sprNotAssignProcessTable" data-datatable-id="sprNotAssignProcessTable">
									<input type="hidden" name="searchEndDt" id="searchEndDt_sprNotAssignProcessTable" data-datatable-id="sprNotAssignProcessTable"> -->
								</div>
								<div class="input-group-append">
									<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="sprNotAssignProcessTable">
										<i class="fa fa-search"></i><span class=""><span>검색</span></span>
									</button>
								</div>
							</div>
							<div class="kt_datatable kt-margin-b-0" id="sprNotAssignProcessTable"></div>
						</div>
						<!-- end:: 4-2. 미배정 프로세스 데이터 테이블 -->
					</div>
				</div>
				<!-- end:: 4. 프로세스 배정 -->				
				
		</div>
	</div>
</form>
<!-- begin:: modal-footer -->	
<div class="modal-footer">
	<!--begin: Form Actions -->
	<div class="osl-form__actions kt-padding-l-25">
		<button class="btn btn-outline-brand" data-ktwizard-type="action-prev">
			<i class="fas fa-chevron-circle-left"></i><span>이전</span>
		</button>
		<button class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-submit">
			<span class="kt-margin-r-5">완료</span><i class="fas fa-check-circle kt-padding-r-0"></i>
		</button>
		<button class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-next">
			<span class="kt-margin-r-5">다음</span><i class="fas fa-chevron-circle-right kt-padding-r-0"></i>
		</button>
	</div>
	<!--end: Form Actions -->
	<button class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end:: modal-footer -->	

<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLSpr1003Popup = function () {	
	var documentSetting = function(){
		var formId = 'frSpr1003'
		//edit 목록
		var formEditList = [];
		//form validate 주입
		var formValidate = $.osl.validate(formId);
		
		//edit 세팅
    	formEditList.push($.osl.editorSetting("sprStartText", {formValidate: formValidate, 'minHeight': 300, disableResizeEditor: false}));
		
		function userImgFormatState(state){
			console.log(state);
			  var $state = $(
					'<div class="kt-user-card-v2 btn">'
						+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
			    			+'<img src="/media/users/100_1.jpg" class="">'
			    		+'</div>'
			    		+'<div class="kt-user-card-v2__details">'
			    			+'<span class="kt-user-card-v2__name float-left">'+ state.text +'</span>'
			    			+'<span class="kt-user-card-v2__email float-left kt-margin-l-10 osl-line-height-rem-1_5">email@email</span>'
			    		+'</div>'
		    		+'</div>'
			  );
			  return $state;
		}
		function userImgTagFormatState (state) {
			 var $state = $(
						'<div class="kt-user-card-v2 d-inline-block">'
							+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle float-left">'
				    			+'<img src="/media/users/100_1.jpg" class="">'
				    		+'</div>'
				    		+'<div class="kt-user-card-v2__details float-left">'
				    			+'<span class="kt-user-card-v2__name">'+ state.text +'</span>'
				    			+'<span class="kt-user-card-v2__email">email@email</span>'
				    		+'</div>'
			    		+'</div>'
				  );
			 
			  // Use .text() instead of HTML string concatenation to avoid script injection issues
			  //$state.find("span").text(state.text);
			  //$state.find("img").attr("src", baseUrl + "/" + state.element.value.toLowerCase() + ".png");

			  return $state;
		};
		
		//modalId
		var modalId = $("#modalId").val();
		
    	$('#sprConferenceUsr').select2({
    		//select세팅
    		templateResult: userImgFormatState,
    		//tag세팅
    		templateSelection: userImgTagFormatState,
    	});
		
		// begin :: sortable
		//스프린트 시작 > 담당자 지정 drag이벤트 
		var usrSortable = new Sortable($('#sprUsrList')[0], {
			group: {
				//그룹 이름
				name: 'stmWtList'
	        },
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "osl-usr-sortable-chosen",
	      //이동될 div(나갈)
 	        onMove:function(evt,originalEvent){
 	        	console.log('이동 이벤트 작성하시면 됩니다.')
 	        }
		});
		// end :: sortable 
		
		
		
		// begin :: 마법사
		//마법사 세팅
		var wizard = new KTWizard('frSpr1003', {
			startStep: 1, 
			clickableSteps: true		
		});

		//마법사 각 단계탭 클릭시 변경 이벤트
		wizard.on('change', function(wizardObj) {
			//마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
			initWizard(wizard);
		});

		//마법사 이전 버튼
		$('[data-ktwizard-type="action-prev"]').click(function(){
			//이전 페이지로 이동
			wizard.goPrev();
			//마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
			initWizard(wizard);
			
		});
		
		//마법사 다음 버튼
		$('[data-ktwizard-type="action-next"]').click(function(){
			//다음 페이지로 이동
			wizard.goNext();
			//마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
			initWizard(wizard);
		});
		//end :: 마법사
		
		
	};
	
	var tagremove = function(){
		$('.osl-tagify__tag__removeBtn').click(function(){
			$(this).parent().remove();
		});
	}
	
	var datatableSetting2 = function(){
		// begin:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 데이터테이블
		$.osl.datatable.setting("sprAssignReqTable",{
			data: {
				source: {
					read: {
						//경로 삭제 시 오류로 인해 임시로 url 넣었습니다. 제거하시고 url 기제하시면 됩니다.
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				 pageSize : 10,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100]
					 }
				 }
			},
			columns: [
				{field: 'rn', title: '프로젝트 명', textAlign: 'center', width: 200},
				{field: '', title: '순번', textAlign: 'center', width: 50},
				{field: '', title: '요청 제목', textAlign: 'center', width: 200},
				{field: '', title: '요청일', textAlign: 'center', width: 100},
				{field: '', title: '요청자', textAlign: 'center', width: 70},
				{field: '', title: '등록일', textAlign: 'center', width: 100},
				{field: '', title: '스토리 포인트', textAlign: 'center', width: 50}
			],
			actionBtn:{
				"dblClick": true
			},
			actionTooltip:{
				"update": "수정",
				"delete": "삭제",
				"dblClick": "상세보기"
			}
		});
		// end:: 2. 스토리 포인트 입력 요구사항 스토리 포인트 입력 데이터테이블
	}
	var datatableSetting3 = function(){
		// begin:: 3. 담당자 지정 요구사항 담당자 지정 데이터테이블
		$.osl.datatable.setting("sprAssignReqUsrTable",{
			data: {
				source: {
					read: {
						//경로 삭제 시 오류로 인해 임시로 url 넣었습니다. 제거하시고 url 기제하시면 됩니다.
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				 pageSize : 5,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						//페이지 그룹단위 변경
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					 }
				 }
			 },
			columns: [
				{field: '', title: '순번', textAlign: 'center', width: 50},
				{field: '', title: '요청제목', textAlign: 'center', width: 70},
				{field: '', title: '스토리 포인트', textAlign: 'center', width: 100},
				{field: '', title: '담당자', textAlign: 'center', width: 70},
			],
			actionBtn:{
				"dblClick": false
			}
		});
		// end:: 3. 담당자 지정 요구사항 담당자 지정 데이터테이블
	}
	var datatableSetting4 = function(){
		// begin:: 4-1. 배정 프로세스 데이터 테이블 
		$.osl.datatable.setting("sprAssignProcessTable",{
			data: {
				source: {
					read: {
						//경로 삭제 시 오류로 인해 임시로 url 넣었습니다. 제거하시고 url 기제하시면 됩니다.
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				 pageSize : 5,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						//페이지 그룹단위 변경
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					 }
				 }
			 },
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 10, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 50, autoHide: false, sortable: false},
				{field: '', title: '프로세스 명', textAlign: 'center', width: 70}
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true
			},
			actionTooltip:{
				"dblClick": "프로세스 배정 제외"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var data = {
					};
					var options = {
							modalTitle: "프로세스 상세",
							autoHeight: false
						};
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1006View.do',data,options);
			
					//var rowDatas = [];
					//rowDatas.push(rowData);
					//사용자 배정 처리
					//fnAllUsrDelete(rowDatas);
				},
				//선택 사용자 배정 제외
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					//var rowDatas = rowData;
					//선택 레코드 없는 경우
					//if(rowDatas.length == 0){
						//$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						//return true;
					//}
					
					//$.osl.confirm($.osl.lang("prj2100.allUsrInDelete",rowDatas.length),{html:true}, function(result){
						//if (result.value) {
							//사용자 배정 제외 처리
							fnAllUsrDelete(rowDatas);
						//}
					//});
				}
			}
		});
		// end:: 4-1. 배정 프로세스 데이터 테이블
		
		// begin:: 4-2. 미배정 프로세스 데이터테이블 
		$.osl.datatable.setting("sprNotAssignProcessTable",{
			data: {
				source: {
					read: {
						//경로 삭제 시 오류로 인해 임시로 url 넣었습니다. 제거하시고 url 기제하시면 됩니다.
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				 pageSize : 5,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						//페이지 그룹단위 변경
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					 }
				 }
			 },
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 10, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 50, autoHide: false, sortable: false},
				{field: '', title: '프로세스 명', textAlign: 'center', width: 70}
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick": "프로세스 배정"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-left",
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var data = {
					};
					var options = {
							modalTitle: "프로세스 상세",
							autoHeight: false
						};
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1006View.do',data,options);
			
					/*var rowDatas = [];
					rowDatas.push(rowData);
					//사용자 배정 처리
					fnAllUsrInsert(rowDatas);*/
				},
				//선택 사용자 배정 제외
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					/*var rowDatas = rowData;
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj2100.allUsrInDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							//사용자 배정 제외 처리
							fnAllUsrInsert(rowDatas);
						}
					});*/
				}
			}
		});
		// end:: 4-2. 미배정 프로세스 데이터테이블
	}
	

	// begin :: 마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
	var initWizard = function(wizard){
		//전체 단계 수
		var totalStep = wizard.totalSteps;
		//현재 단계
		var checkThis = wizard.currentStep;
		//전체 단계-현재 단계
		var checking = totalStep - checkThis;
		
		//마지막 단계
		if(checking==0){
			$('[data-ktwizard-type="action-prev"]').css('display','inline-block');
			$('[data-ktwizard-type="action-next"]').css('display','none');
			$('[data-ktwizard-type="action-submit"]').css('display','inline-block');
		//중간 단계
		}else if(checking<totalStep-1){
			$('[data-ktwizard-type="action-prev"]').css('display','inline-block');
			$('[data-ktwizard-type="action-next"]').css('display','inline-block');
			$('[data-ktwizard-type="action-submit"]').css('display','none');
		//첫번째 단계
		}else{
			$('[data-ktwizard-type="action-next"]').css('display','inline-block');
			$('[data-ktwizard-type="action-prev"]').css('display','none');
			$('[data-ktwizard-type="action-submit"]').css('display','none');
		}
		
		//단계탭 변환 시 데이터 테이블 로드
		if(checkThis==2){
			datatableSetting2();
		}else if(checkThis==3){
			datatableSetting3();
		}else if(checkThis==4){
			datatableSetting4();
		}
		
	};
	// end :: 마법사 단계 이동 시 버튼 표출 여부 , 데이터 테이블 세팅
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1003Popup.init();
});
</script>
<!-- end script -->
