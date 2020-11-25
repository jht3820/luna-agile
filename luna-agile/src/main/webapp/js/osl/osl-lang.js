/**
 	* function 명 	: OSLCoreLangSetting
	* function 설명	: core에서 사용되는 언어 데이터를 세팅한다.
	*/
var OSLCoreLangSetting = function () {
	//언어 세팅 데이터
	var lang = {};
	//한국어
	lang["ko"] = {
		fromValidate:{
			messages: {
				required: "필수 값 입니다.",
				remote: "값을 수정해주세요.",
				email: "유효한 이메일 주소를 입력해주세요.",
				url: "유효한 URL을 입력해주세요.",
				date: "유효한 날짜를 입력해주세요.",
				dateISO: "유효한 날짜를 입력해주세요. (ISO)",
				number: "유효한 번호를 입력해주세요.",
				digits: "숫자만 입력 가능합니다.",
				equalTo: "값을 다시 입력해주세요. (값이 동일하지 않음)",
				maxlength: "{0}자 이하로 입력해주세요.",
				minlength: "최소 {0}자 이상 입력해주세요.",
				rangelength: "{0}에서 {1}자 사이에 값을 입력해주세요.",
				range: "{0}에서 {1}사이의 값을 입력해주세요.",
				max: "{0} 보다 작거나 같은 값을 입력해주세요..",
				min: "{0} 보다 크거나 같은 값을 입력해주세요..",
				step: "{0}의 배수를 입력해주세요.",
				regexstr: "입력 값이 형식에 맞지 않습니다."
			}
		},
		modal:{
			close: "닫기"
		},
		portlet:{
			tools: {
				toggle: {
					collapse: '접기',
					expand: '펼치기'
				},
				reload: '새로 고침',
				remove: '제거'
			}
		},
		tree:{
			label:{
				contextmenu:{
					allNodeOpen:"전체 펼치기",
					allNodeClose:"전체 접기",
					selNodeOpen:"선택 펼치기",
					selNodeClose:"선택 접기"
				}
			},
			search:{
				title: "검색",
				placeholder: "입력 후 엔터 키를 입력해주세요"
			},
			error:{
				handler:"트리 메뉴 제어 중 오류가 발생했습니다."
			}
		},
		file:{
			fileCnt:"${1}개의 파일",
			error:{
				downloadWait: "파일 데이터를 세팅중입니다. </br>다시 시도해주세요.",
				fileReadonly: "업로드가 불가능합니다."
			}
		},
		datatable:{
			button:{
				select: "조회",
				insert: "추가",
				update: "수정",
				delete: "삭제",
				redo: "복구",
				recordDelete: "완전삭제",
				prev: "돌아가기"
			},
			action:{
				functionNm: "기능 버튼",
				update:{
					nonSelect: "수정하려는 데이터를 선택해주세요",
					manySelect: "1건의 데이터만 선택해주세요.</br> ${1}건의 데이터가 선택되었습니다."
				},
				delete:{
					nonSelect:"삭제하려는 데이터를 선택해주세요",
					confirm: "${1}건의 데이터를 삭제하시겠습니까?"
				}
			},
			translate:{
				records:{
					processing: "데이터 조회 중 입니다.",
					noRecords: "데이터가 없습니다.",
					nonSelect: "선택된 데이터가 없습니다.",
				},
				toolbar:{
					pagination:{
						items:{
							first: "처음",
							prev: "이전",
							next: "다음",
							last: "마지막",
							more: "더 보기",
							input: "페이지 번호",
							select: "목록 크기",
							info: "현재 {{start}} - {{end}} / {{total}} 건"
						}
					}
				}
			},
			search:{
				title: "검색",
				placeholder: "검색어를 입력해주세요",
				allTitle: "전체"
			},
			sort:{
				fieldNotMatch: "잘못된 정렬 데이터입니다."
			}
		},
		date:{
			datepicker:{
				days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
				daysShort: ["일", "월", "화", "수", "목", "금", "토"],
				daysMin: ["일", "월", "화", "수", "목", "금", "토"],
				months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				today: "오늘",
				monthsTitle: "일자 선택",
				clear: "다시 선택",
				weekStart: 0,
				format: "yyyy-mm-dd",
			},
			moment:{
				months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		        monthsParseExact : true,
		        weekdays : ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
		        weekdaysShort : ["일", "월", "화", "수", "목", "금", "토"],
		        weekdaysMin : ["일", "월", "화", "수", "목", "금", "토"],
		        weekdaysParseExact : true,
		        longDateFormat : {
		            LT : 'HH:mm',
		            LTS : 'HH:mm:ss',
		            L : 'YYYY-MM-DD',
		            LL : 'YYYY MMMM D',
		            LLL : 'YYYY MMMM D HH:mm',
		            LLLL : 'YYYY MMMM D dddd HH:mm'
		        },
		        calendar : {
		            sameDay : '오늘',
		            nextDay : '다음',
		            nextWeek : '다음 주',
		            lastDay : '어제',
		            lastWeek : '마지막 주',
		            sameElse : ''
		        },
		        relativeTime : {
		            future : 'dans %s',
		            past : 'il y a %s',
		            s : '초',
		            ss : '%d 초',
		            m : '분',
		            mm : '%d 분',
		            h : '시',
		            hh : '%d 시',
		            d : '일',
		            dd : '%d 일',
		            M : '월',
		            MM : '%d 월',
		            y : '년',
		            yy : '%d 년'
		        },
		        dayOfMonthOrdinalParse: /\d{1,2}(er|)/,
		        week : {
		            dow : 0,
		            doy : 4  // The week that contains Jan 4th is the first week of the year.
		        }
		    },
		    agoTime:{
				suffixAgo: "전",
				justNow: "방금",
				s : "${1}초",
	            m : "${1}분",
	            h : "${1}시간",
	            d : "${1}일",
	            M : "${1}개월",
	            y : "${1}년",
			}
		},
		common:{
			logout:{
				confirm:"로그아웃 하시겠습니까?",
				button:"로그 아웃"
			},
			user:{
				pwChange:"",
				validate:{
					usrId: "아이디를 입력해주세요.",
					usrPw: "비밀번호를 입력해주세요.",
					usrPwIndexOfUsrId: "비밀번호에는 사용자 아이디를 포함할 수 없습니다.",
					usrPwContinue: "비밀번호는 같은 문자를 3번 이상 연속해서<br/> 사용하실 수 없습니다.",
					usrPwContinueMatch: "비밀번호는 연속된 문자열(123, abc 등)을<br/> ${1}자 이상 사용 할 수 없습니다.",
				},
				myPage:{
					title:"개인정보 수정",
					error:"사용자 정보가 없으므로 개인정보 수정 화면으로 이동할 수 없습니다."
				}
			},
			error:{
				sessionInvalid:"세션이 만료되어 로그인 페이지로 이동합니다.",
				nonAuth:"해당 요청의 권한이 없습니다."
			},
			menu:{
				top: "최상위",
				upper: "상위",
				name: "메뉴 명",
			},
			name:{
				prjGrp: "그룹 명",
				prj: "프로젝트 명",
				authGrp: "권한그룹 명",
				all: "전체",
				select: "선택"
			},
			alert:{
				title: "알림",
				ok: "확인",
				cancel: "취소"
			}
		},
		/* 페이지 언어 */
		prj1000:{
			startDate: "시작일",
			endDate: "종료일",
			completedRatio: "진척률",
			projectCnt: "등록 프로젝트",
			requestAll: "전체 요구사항",
			requestInProgress: "진행 중",
			requestDone: "최종 완료",
			menu:{
				modify: "수정",
				trashMove: "휴지통 이동(삭제)",
				projectListMove: "프로젝트 목록 이동",
				createProject: "신규 프로젝트 추가",
				projectDetail: "상세 정보",
				recordDelete: "완전 삭제",
				projectRedo: "프로젝트 그룹 복구"
			},
			button:{
				title:{
					insert: "신규 프로젝트 그룹 등록",
					update: "프로젝트 그룹 수정",
					delete: "프로젝트 그룹 휴지통 이동(삭제)",
					trash: "프로젝트 그룹 휴지통 목록",
					redo: "프로젝트 그룹 복구",
					recordDelete: "프로젝트 그룹 완전 삭제",
					prev: "프로젝트 목록으로 이동"
				}
			},
			confirm:{
				prjGrpRedo: "${1}건의 프로젝트 그룹을 복구하시겠습니까?",
				prjGrpDelete: "${1}건의 프로젝트 그룹을 완전 삭제하시겠습니까?</br>삭제된 프로젝트 그룹은 복구 할 수 없습니다."
			}
		},
		prj1001:{
			startDate: "시작일",
			endDate: "종료일",
			completedRatio: "진척률",
			requestAll: "전체",
			requestInProgress: "진행 중",
			requestDone: "완료",
			menu:{
				modify: "수정",
				trashMove: "휴지통 이동(삭제)",
				projectDetail: "상세 정보"
			}
		},
		prj1002:{
			title: "신규 프로젝트 그룹 생성",
			complete: "완료",
			insert:{
				saveString: "신규 프로젝트 그룹을 생성하시겠습니까?",
				saveBtnString: "등록 완료",
				saveMsg: "${1}명의 사용자가 배정되었습니다.",
				saveDupleMsg: "이미 배정된 ${1}명의 사용자 제외",
				saveAllDupleMsg: "이미 배정중인 사용자입니다. (${1}명)"
			},
			update:{
				saveString: "프로젝트 그룹을 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			}
		},
		prj1003:{
			title: "프로젝트 그룹 상세정보"
		},
		prj2100:{
			allUsrInsert:"${1}건의 사용자를 배정하시겠습니까?",
			allUsrInDelete:"${1}건의 사용자를 배정 제외하시겠습니까?"
		},
		req1001:{
			title: "신규 요구사항 요청",
			reqUser:{
				title: "요청자 정보",
				usrNm: "요청자 이름",
				email: "요청자 이메일",
				deptNm: "요청자 소속",
				telNo: "요청자 연락처"
			},
			prjNm: "프로젝트",
			reqDtm: "요청 일자",
			reqNm: "요청 제목",
			reqDesc: "요청 내용",
			attachments: "파일 첨부", 
			complete: "완료",
			insert:{
				saveString: "신규 요구사항을 요청하시겠습니까?",
				saveBtnString: "작성 완료"
			},
			update:{
				saveString: "요구사항 정보를 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			}
		},
		req4100:{
			field:{
				prjGrpNm: "프로젝트 그룹명",
				prjNm: "프로젝트명",
				reqOrd: "요청 번호",
				reqProTypeNm: "처리유형",
				reqNm: "요청 제목",
				reqDtm: "요청일",
				regDtm: "등록일",
				reqUsrNm: "요청자",
				reqUsrEmail: "요청자 e-mail",
				reqUsrDeptNm: "요청자 조직",
				reqUsrNum: "요청자 연락처",
				reqKey: "요구사항 key"
			},
			actionBtn:{
				title : "수정 / 삭제 / 상세",
				updateBtn : "요구사항 수정",
				deleteBtn : "요구사항 삭제",
				detailBtn : "요구사항 상세",
				selectTooltip : "요구사항 조회",
				insertTooltip : "요구사항 추가",
				updateTooltip : "요구사항 수정",
				deleteTooltip : "요구사항 삭제",
				detailTooltip : "요구사항 상세"
			},
			title:{
				insertTitle : "신규 요구사항 등록",
				updateTitle : "요구사항 수정",
				detailTitle : "요구사항 확인"
			},
			alert:{
				updateMsg : "접수 요청중인 요구사항만 수정 가능합니다.",
			}
		},
		req4101:{
			complete : "완료",
			saveString :{
				insertStr : "요구사항을 등록하시겠습니까?",
				updateStr : "요구사항 수정을 완료하시겠습니까?",
			},
			label : {
				reqUser : {
					title : "요청자 정보",
					usrNm : "요청자 이름",
					email : "요청자 e-mail",
					deptNm : "요청자 소속",
					telNo : "요청자 연락처",
				},
				prjNm : "프로젝트",
				reqDtm : "요청 일자",
				reqNm : "요청 제목",
				reqDesc : "요청 내용",
				reqPw : "요구사항 잠금",
				password : "PW",
				passwordCheck : "PW 확인",
				attchments : "파일 첨부",
				requestDefaultOptNm : "접수 기본항목 입력"
			},
			button :{
				deleteReset : "삭제 초기화",
				insertBtn : "등록",
				updateBtn : "수정 완료",
			},
			prepData : {
				title : "선행처리 지식확인",
				reqNm : "요구사항명",
				result : "다음과 같은 연관 결과가 있습니다.",
				notResult : "연관 결과가 없습니다.",
				total : "총",
				count : "건",
				tooltip : {
					selectTooltip : "선행지식 조회",
					detailTooltip : "요구사항 상세",
					card : "카드형",
					grid : "그리드형",
				},
				button : {
					detailBtn : "상세 조회",
				}
			}
		},
		stm2100:{
			selectStmInfoCnt : "1건의 게시판만 선택하세요.\n${1}건의 게시판이 선택되었습니다." ,
			notAuthority : {
					basic : "해당 게시판에 대한 권한이 없습니다.",
			},
			field:{
				stmTypeNm: "유형",
				stmNm: "게시판명",
				stmDsTypeNm: "공개범위",
				cnt: "전체글 수",
				badCnt: "유효글 수",
				delCnt: "삭제글 수",
			},
			actionBtn:{
				title : "수정 / 관리 / 통계",
				updateBtn : "게시판 속성",
				detailBtn : "게시글 관리",
				summeryBtn : "통계보기",
				selectTooltip : "게시판 조회",
				updateTooltip : "게시판 속성 수정",
				managmentTooltip : "게시글 관리",
				summeryTooltip : "게시판 통계"
			},
			button:{
				card : "카드형",
				grid : "그리드형",
				detail:"관리",
				summery:"통계",
			},
			title:{
				updateTitle : "게시판 속성",
				detailTitle : "게시글 관리",
				summeryTitle : "통계보기",
			},
			type:{
				normal:"[일반]",
				gallery:"[갤러리]",
				movie:"[영상]",
				storage:"[자료실]",
			},
			label :{
				summery : "옵션 별 통계",
			}
		},
		stm2101:{
			update: "게시판 정보를 수정하시겠습니까?",
			formCheck:{
				fileCntMessage : "첨부파일 갯수는 최소 1부터 10까지 가능합니다\n첨부파일 갯수를 최솟값인 1로 변경합니다.",
				fileMaxCntMessage : "첨부파일 가능한 갯수를 초과합니다.\n최대 수로 적용됩니다.",
				fileMaxStrgMessage : "게시판 유형에 따라\n최대 첨부파일 용량으로 지정됩니다.",
				fileMaxStrgOutMessage : "최대 첨부파일 용량을 초과합니다\n최대용량(${1})으로 변경됩니다.",
			},
			label:{
				name: "게시판 명",
				type : "유형",
				dsType : "게시물 공개 범위",
				option : "옵션",
				noticeCheck : "공지사항 사용",
				commentCheck : "댓글 사용",
				secretCheck : "비밀글 사용",
				attchFileCheck : "첨부파일 사용",
				tagCheck : "태그 사용",
				fileCount : "첨부파일 갯수",
				maxFileCnt : "최대 갯수 : 10",
				limitFileStrg : "첨부파일 용량 제한(MB)",
				maxFileStrg:{
					basic : "최대 용량 : [자료실] 4GB(4096MB) [영상] 2GB(2048MB) [일반/갤러리] 500MB",
					normal: "최대 500MB",
					movie: "최대 2048MB(2GB)",
					storage: "최대 4096MB(4GB)"
				},
				admin : "담당자",
				writer : "글 작성 범위",
				nothing : "미배정 권한그룹 및 사용자",
				user : "사용자",
				authGrp : "권한그룹",
				otherAdmin : "그 외 담당자",
			},
			title:{
				admin: "담당자 지정",
				writer: "글 작성 범위 지정"
			},
			button : {
				reset : "초기화",
				equals : "담당자 동일",
				all : "전체",
				authNm : "권한그룹 명",
				userId : "사용자 ID",
				userName : "사용자 명",
				search : "검색",
				updateSubmit : "수정 완료",
			}
		},
		stm2102:{
			summery:{
				noticeCntY: "공지사항 수 : ${1} 건",
				noticeCntN: "공지사항 수 : 없음",
				ntcCurrentY: "최신 공지일 : ${1}",
				ntcCurrentN: "최신 공지일 : 없음",
				cmtAllCntY: "전체 댓글 수 : ${1} 건",
				cmtAllCntN: "전체 댓글 수 : 없음",
				cmtMaxInfoY: "최다 댓글 수 : ${1} 건",
				cmtMaxInfoN: "최다 댓글 수 : 없음",
				badAllCntY: "전체 게시글 수 : 등록 ${1} 건 / 삭제 ${2} 건",
				badAllCntN: "전체 게시글 수 : 없음",
				badHitInfoY: "최다 조회 수 : ${1} 회",
				badHitInfoN: "최다 조회 수 : 없음",
				badPwCntY: "비밀글 수 : ${1} 건",
				badPwCntN: "비밀글 수 : 없음",
				tagLabelY: "사용 TOP ${1} : # ${2}",
				tagLabelN: "사용 태그 없음",
				fileAllCntY: "전체 첨부파일 수 : ${1} 건",
				fileAllCntN: "전체 첨부파일 수 : 없음",
				fileAllSizeY: "전체 첨부파일 크기 : ${1}",
				fileAllSizeN: "전체 첨부파일 없음 : 없음",
			},
			label:{
				notice : "공지사항",
				comment : "댓글",
				board : "게시글",
				tag : "태그",
				attchFile : "첨부파일",
			}
		},
		stm6000:{
			button:{
				selectTooltip: "조직 조회",
				insertTooltip: "조직 추가",
				updateTooltip: "조직 수정",
				deleteTooltip: "조직 삭제"
			},
			label:{
				upperDeptId : "상위 조직 ID",
				upperDeptNm : "상위 조직 명",
				deptId : "조직 ID",
				deptNm : "조직 명",
				deptOrd : "순번",
				deptUseCd : "사용유무",
				deptEtc : "비고",
			},
			title:{
				deptList:"조직 목록",
				deptInfo:"조직 정보"
			},
			message:{
				alert:{
					treeSelect:"왼쪽 트리에서 조직을 선택해주세요.",
					notUsedDept:"미사용 조직에는 하위 조직을 추가할 수 없습니다.",
					notRootDelete:"최상위 조직(ROOT)은 삭제할 수 없습니다."
				},
				confirm:{
					deleteDept:"조직 삭제 시 선택한 조직 및 하위 조직이 모두 삭제됩니다. 선택한 조직을 삭제 하시겠습니까?"
				}
			},
			modal:{
				title:{
					insertDept:"신규 조직 등록",
					updateDept:"조직 수정"
				}
			}
		},
		stm6001:{
			label:{
				upperDeptId : "상위 조직 ID",
				upperDeptNm : "상위 조직 명",
				deptId : "조직 ID",
				deptNm : "조직 명",
				deptOrd : "순번",
				deptUseCd : "사용유무",
				deptEtc : "비고",
			},
			button:{
				insert : "작성 완료",
				update : "수정 완료"
			},
			message:{
				confirm:{
					insert:"신규 조직을 등록하시겠습니까?",
					update:"조직 정보를 수정하시겠습니까?"
				}
			}
		},
		stm9000: {
			title : {
				jenkinsManagement : "JENKINS 관리",
				jobManagement : "JENKINS 관리"
			},
			button:{
				jenkins:{
					selectTooltip: "Jenkins 조회",
					insertTooltip: "Jenkins 추가",
					updateTooltip: "Jenkins 수정",
					deleteTooltip: "Jenkins 삭제"
				},
				job:{
					selectTooltip: "Job 조회",
					insertTooltip: "Job 추가",
					updateTooltip: "Job 수정",
					deleteTooltip: "Job 삭제"	
				}
			},
			field:{
				jenkins:{
					connectCheck: "접속 확인 결과",
					jenkinsNm: "Jenkins 명",
					jenkinsUrl: "Jenkins Url",
					useNm: "사용 유무",
					JenkinsUsrId: "Jenkins User Id"
				}
			},
			actionBtn:{
				jenkins:{
					updateBtn:"Jenkins 수정",
					deleteBtn:"Jenkins 삭제",
					dblClickBtn:"Jenkins 상세보기"
				}
			},
			modal:{
				jeknins:{
					insertJenkins:"신규 Jenkins 설정 등록",
					updateJenkins:"Jenkins 설정 수정",
					detailJenkins:"상세 정보"
				}
			}
		},
		bad1000:{
			selectBadInfoCnt : "1건의 게시글을 선택하세요.\n${1}건의 게시글이 선택되었습니다." ,
			notAuthority : {
					basic : "해당 게시글에 대한 권한이 없습니다.",
					insertMessage : "게시글 등록 권한이 없습니다.",
					selectMessage : "해당 게시글에 대한 읽기 권한이 없습니다.",
					updateMessage : "해당 게시글에 대한 수정 권한이 없습니다.",
					deleteMessage : "해당 게시글에 대한 삭제 권한이 없습니다.",
			},
			notWriter : {
				deleteMessage : "본인이 작성한 게시글만 삭제 가능합니다.",
			},
			field:{
				badContent: "내용",
				badNtcCheck : "공지유무",
				delCd:"삭제유무",
				cmtContent:"댓글내용",
				tagNm:"태그",
				badTitle:"제목",
				badHit: "조회수",
				badFileCnt: "첨부파일 수",
				badUsrId: "작성자",
				badWtdtm: "작성일",
			},
			label:{
				deleteBadge: "삭제",
				noticeBadge: "공지",
			},
			button:{
				dblClick : "상세",
			},
			actionBtn:{
				title: "수정 / 삭제 / 상세",
				updateBtn:"게시글 수정",
				deleteBtn:"게시글 삭제",
				dblClick:"게시글 상세보기",
				selectTooltip:"게시글 조회",
				insertTooltip:"게시글 추가",
				updateTooltip:"게시글 수정",
				deleteTooltip:"게시글 삭제",
				detailTooltip:"게시글 상세",
			},
			title:{
				passwordCheck:"비밀번호 확인",
				boardCheck:{
					oneStep: "[ NO.${1} ] 게시글",
					twoStep: "[ NO.${1} ] 게시글 외 ${2} 건"
				},
				deleteReason: "삭제 사유",
			}
		},
		bad1001:{
			notAuthority : {
				updateMessage : "해당 게시글에 대한 수정 권한이 없습니다.",
				restoreMessage : "해당 게시글에 대한 복원 권한이 없습니다.",
				deleteMessage : "해당 게시글에 대한 삭제 권한이 없습니다.",
				deleteCmtMessage : "해당 댓글에 대한 삭제 권한이 없습니다.",
			},
			notCmtWriter : {
				deleteMessage : "본인이 작성한 댓글만 삭제 가능합니다.",
			},
			button:{
				restore : "복구",
				submit : "등록",
			},
			label:{
				writeDate : "작성일시",
				attchFile : "파일 첨부",
				tag: "태그",
				comment:"댓글",
			},
			field:{
				comment:{
					writer : "작성자",
					content:"내용",
					writeDate : "작성일"
				}
			},
			actionBtn:{
				title : "삭제",
				updateTooltip : "게시글 수정",
				deleteTooltip : "게시글 삭제",
				restoreTooltip : "게시글 복구",
				selectComment : "댓글 조회",
				deleteComment : "댓글 삭제",
			},
			title:{
				boardCheck:{
					oneStep: "[ NO.${1} ] 게시글",
				},
				deleteReason: "삭제 사유",
			}
		},
		bad1002:{
			insert: "글 작성을 완료하시겠습니까?",
			formCheck : {
				fileCntMessage : "첨부파일 가능한 개수는 ${1}개입니다.",
				passwordMessage : "비밀글에 사용할 비밀번호를 입력해주세요.",
				passwordMatching : "입력된 비밀번호가 서로 다릅니다.",
				tagMatching : "태그값이 중복됩니다.",
			},
			label:{
				title:"제목",
				content:"내용",
				noticeCheck:"공지사항 사용",
				noticeDate:"공지 기간",
				noticeDateIgnore:"공지 기간 무시",
				secretCheck:"비밀글 사용",
				password:"PW",
				passwordCheck:"PW 확인",
				commentCheck:"댓글 허용",
				attchFile : "파일 첨부",
				tag : "태그",
			},
			button:{
				insertSubmit:"등록",
				submit : "등록",
			},
		},
		bad1003:{
			update: "글 수정을 완료하시겠습니까?",
			label:{
				title:"제목",
				content:"내용",
				noticeCheck:"공지사항 사용",
				noticeDate:"공지 기간",
				noticeDateIgnore:"공지 기간 무시",
				secretCheck:"비밀글 사용",
				password:"PW",
				passwordCheck:"PW 확인",
				commentCheck:"댓글 허용",
				attchFile : "파일 첨부",
				tag : "태그",
			},
			button:{
				deleteResetBtn:"삭제 초기화",
				updateSubmit : "수정 완료",
				submit : "등록",
			}
		},
		bad1004:{
			passwordMiss : "비밀번호가 틀렸습니다.\n다시 입력하세요.",
			title:{
				detail:"게시글 상세보기",
			},
			text : "이 글은 비밀글입니다.\n비밀번호를 입력하세요.",
			button:{
				submit: "확인",
			}
		},
		bad1005:{
			label:{
				deleteType : "삭제 유형",
				deleteReason: "삭제 사유"
			},
			button:{
				submit : "삭제",
			}
		}
	};
	
	//영어
	lang["en"] = {
		fromValidate:{
			messages: {
				required: "This field is required.",
				remote: "Please fix this field.",
				email: "Please enter a valid email address.",
				url: "Please enter a valid URL.",
				date: "Please enter a valid date.",
				dateISO: "Please enter a valid date (ISO).",
				number: "Please enter a valid number.",
				digits: "Please enter only digits.",
				equalTo: "Please enter the same value again.",
				maxlength: "Please enter no more than {0} characters.",
				minlength: "Please enter at least {0} characters.",
				rangelength: "Please enter a value between {0} and {1} characters long.",
				range: "Please enter a value between {0} and {1}.",
				max: "Please enter a value less than or equal to {0}.",
				min: "Please enter a value greater than or equal to {0}.",
				step: "Please enter a multiple of {0}.",
				regexstr: "The input value does not fit the format."
			}
		},
		modal:{
			close: "Close"
		},
		portlet:{
			tools: {
				toggle: {
					collapse: 'Collapse',
					expand: 'Expand'
				},
				reload: 'Refresh',
				remove: 'Remove'
			}
		},
		tree:{
			label:{
				contextmenu:{
					allNodeOpen:"Expand All",
					allNodeClose:"Collapse All",
					selNodeOpen:"Expand Selection",
					selNodeClose:"Collapse Selection"
				}
			},
			search:{
				title: "Search",
				placeholder: "After entering, please press enter key"
			},
			error:{
				handler:"An error occurred while controlling the tree menu."
			}
		},
		file:{
			error:{
				downloadWait: "File data is being set. </br> Please try again."
			}
		},
		datatable:{
			button:{
				select: "Select",
				insert: "Insert",
				update: "Update",
				delete: "Delete",
				trash: "Trash",
				title:{
					select: "Data Select",
					insert: "Data Insert",
					update: "Data Update",
					delete: "Data Delete",
				}
			},
			action:{
				functionNm: "Function Button",
				update:{
					nonSelect: "Please select the data you want to modify",
					manySelect: "Please select only one data. </br> ${1} data was selected."
				},
				delete:{
					nonSelect:"Please select the data you want to delete",
					confirm: "Are you sure you want to delete ${1} data?"
				}
			},
			translate:{
				records:{
					processing: "Data is being retrieved.",
					noRecords: "There is no data.",
				},
				toolbar:{
					pagination:{
						items:{
							first: "first",
							prev: "previous",
							next: "Next",
							last: "Last",
							more: "More",
							input: "Page Number",
							select: "List Size",
							info: "Currently  {{start}} - {{end}} / {{total}}"
						}
					}
				}
			},
			search:{
				title: "Search",
				placeholder: "After entering, please press enter key",
				allTitle: "All"
			},
			/* 추가된 datatable별로 언어 지정 */
			req1000ReqTable:{
				prjNm: "Project Name",
				reqOrd: "Order",
				reqProTypeNm: "Process Type",
				reqNm: "Request Name",
				reqDtm: "Request Date",
				reqUsrNm: "Request User Name",
				regDtmDay: "Registration Date",
				reqUsrEmail: "Request User Email",
				reqUsrDeptNm: "Request Department Name",
				reqUsrNum: "Request User Number",
				reqKey: "Request Key",
			},
			prj1000PrjTable:{
				prjNm: "Project Group Name",
				startDt: "Start Date",
				endDt: "End Date",
				prjChildCnt: "Project Count",
				reqAllCnt: "Request All",
				reqInProgressCnt: "Request In Porgress",
				reqDoneCnt: "Request Done",
			}
		},
		date:{
			datepicker:{
				days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
				daysShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
				daysMin: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
				months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
				monthsShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				today: "Today",
				monthsTitle: "day select",
				clear: "Clear",
				weekStart: 0,
				format: "yyyy-mm-dd",
			},
			moment:{
				months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
				monthsShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
		        weekdays : ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
		        weekdaysShort : ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
		        weekdaysMin : ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
		        longDateFormat : {
		            LT : 'HH:mm',
		            LTS : 'HH:mm:ss',
		            L : 'YYYY-MM-DD',
		            LL : 'YYYY MMMM D',
		            LLL : 'YYYY MMMM D HH:mm',
		            LLLL : 'YYYY MMMM D dddd HH:mm'
		        },
		        calendar : {
		            sameDay : 'Today',
		            nextDay : 'Next day',
		            nextWeek : 'Next week',
		            lastDay : 'yesterday',
		            lastWeek : 'Last week',
		            sameElse : ''
		        },
		        relativeTime : {
		            future : 'dans %s',
		            past : 'il y a %s',
		            s : 'second',
		            ss : '%d second',
		            m : 'minute',
		            mm : '%d minute',
		            h : 'hour',
		            hh : '%d hour',
		            d : 'day',
		            dd : '%d day',
		            M : 'month',
		            MM : '%d month',
		            y : 'year',
		            yy : '%d year'
		        },
		        dayOfMonthOrdinalParse: /\d{1,2}(er|)/,
		        week : {
		            dow : 0,
		            doy : 4  // The week that contains Jan 4th is the first week of the year.
		        }
		    },
		    agoTime:{
				suffixAgo: "ago",
				justNow: "Just now",
	            s : '${1} second',
	            m : '${1} minute',
	            h : '${1} hour',
	            d : '${1} day',
	            M : '${1} month',
	            y : '${1} year',
			}
		},
		common:{
			logout:{
				confirm:"Are you sure you want to log out?",
				button:"Log Out"
			},
			user:{
				pwChange:"",
				validate:{
					usrId: "Please enter your ID.",
					usrPw: "Please enter your password.",
					usrPwIndexOfUsrId: "Your password cannot contain your user ID.",
					usrPwContinue: "You can't use the same character <br/> more than 3 times consecutively in the same password.",
					usrPwContinueMatch: "Password cannot use more than <br/> ${1} characters in consecutive strings (123, abc, etc.)",
				},
				myPage:{
					title:"Update personal information",
					error:"Since there is no user information,<br/> you cannot go to the personal information modification screen."
				}
			},
			error:{
				sessionInvalid:"The session has expired and you will be taken to the login page.",
				nonAuth:"ou are not authorized to do so."
			},
			menu:{
				top: "top",
				upper: "upper",
				name: "menu name",
			},
			name:{
				prjGrp: "Group Name",
				prj: "Project Name",
				authGrp: "AuthGroup Name",
				all: "All",
				select: "Select"
			},
			alert:{
				title: "Alarm",
				ok: "Ok",
				cancel: "Cancel"
			}
		},
		/* 페이지 언어 */
		prj1000:{
			startDate: "Start Date",
			endDate: "End Date",
			completedRatio: "Completed Ratio",
			projectCnt: "Register Project",
			requestAll: "All Request",
			requestInProgress: "In Progress",
			requestDone: "Done",
			menu:{
				modify: "Modify",
				trashMove: "Move Trash (delete)",
				projectListMove: "Move Project List",
				createProject: "Add New Prject",
				projectDetail: "Details"
			},
			button:{
				title:{
					select: "Project Group Select",
					insert: "New Project Group Insert",
					update: "Project Group Update",
					delete: "Project Group Delete",
					trash: "Project Group Trash List",
					card: "List View Card Type",
					grid: "List View Grid Type"
				}
			}
		},
		prj1001:{
			startDate: "시작일",
			endDate: "종료일",
			completedRatio: "진척률",
			requestAll: "전체",
			requestInProgress: "진행 중",
			requestDone: "완료",
			menu:{
				modify: "수정",
				trashMove: "휴지통 이동(삭제)",
				projectDetail: "상세 정보"
			}
		},
		prj1002:{
			title: "New Project Group Insert",
			complete: "Complete",
			insert:{
				saveString: "신규 프로젝트 그룹을 생성하시겠습니까?",
				saveBtnString: "Insert Action"
			},
			update:{
				saveString: "프로젝트 그룹을 수정하시겠습니까?",
				saveBtnString: "Update Action"
			}
		},
		prj2100:{
			allUsrInsert:"Do you want to allocate ${1} users?",
			allUsrInDelete:"Are you sure you want to exclude ${1} users?"
		},
		req1001:{
			title:"Request new requirements",
			reqUser:{
				title: "Requester Information",
				usrNm: "Name",
				email: "Email",
				deptNm: "Department Name",
				telNo: "Telephone number"
			},
			prjNm: "Project",
			reqDtm: "Request Date",
			reqNm: "Request Title",
			reqDesc: "Request description",
			attachments: "Attachments",
			requestDefaultOptNm: "Request Default Option Name",
			complete: "Complete",
		},
		stm2100:{
			selectStmInfoCnt : "Please, select only 1 board.\n${1} boards have been selected." ,
			notAuthority : {
					basic : "You don’t have authority for that this board",
			},
			field:{
				stmTypeNm: "Type",
				stmNm: "Name",
				stmDsTypeNm: "Disclosure Scope",
				cnt: "Total Count",
				badCnt: "Valid Count",
				delCnt: "Deleted Count",
			},
			actionBtn:{
				title : "U / M / S",
				updateBtn : "Board Option",
				detailBtn : "Post Management",
				summeryBtn : "Board Summery",
				selectTooltip : "Select Board",
				updateTooltip : "Update Board Option",
				managmentTooltip : "Management Post",
				summeryTooltip : "Summery Board"
			},
			button:{
				card : "Card",
				grid : "Grid",
				detail:"Management",
				summery:"Summery",
			},
			title:{
				updateTitle : "Board Setting",
				detailTitle : "Board Management",
				summeryTitle : "Board Summery",
			},
			type:{
				normal:"[Normal]",
				gallery:"[Gallery]",
				movie:"[Movie]",
				storage:"[Storage]",
			},
		},
		stm2101:{
			update: "Would you like to update this board setting?",
			formCheck:{
				fileCntMessage : "The number of attchments is 1 to 10.\nChange to minimum 1.",
				fileMaxCntMessage : "The number of attachments is over.\nChange to maximum 10.",
				fileMaxStrgMessage : "Change to maximum storage by board type.",
				fileMaxStrgOutMessage : "Maximum storage is over.\nChange to maximum storage(${1}).",
			},
			label:{
				name: "Board Name",
				type : "Type",
				dsType : "Disclosure Scope",
				option : "Option",
				noticeCheck : "Notice",
				commentCheck : "Comment",
				secretCheck : "Secret Post",
				attchFileCheck : "Attchments",
				tagCheck : "Tag",
				fileCount : "Attchments Count",
				maxFileCnt : "Max File Count : 10",
				limitFileStrg : "Limit File Storage(MB)",
				maxFileStrg:{
					basic : "Max : [Storage] 4096MB [Movie] 2048MB [Normal/Gallery] 500MB",
					normal: "Maximum 500MB",
					movie: "Maximum 2048MB(2GB)",
					storage: "Maximum 4096MB(4GB)"
				},
				admin : "Assign Admin",
				writer : "Assign Writer",
				nothing : "Others",
				user : "User",
				authGrp : "Authority",
				otherAdmin : "Others Assign Admin",
			},
			title:{
				admin: "Assign Admin",
				writer: "Assign Writer"
			},
			button : {
				reset : "Reset",
				equals : "Equals Admin",
				all : "All",
				authNm : "Authority Group Name",
				userId : "User ID",
				userName : "User Name",
				search : "Search",
				updateSubmit : "Update Setting",
			}
		},
		stm2102:{
			summery:{
				noticeCntY: "Notice Count : ${1}",
				noticeCntN: "Notice Count : -",
				ntcCurrentY: "Recent Notice Date : ${1}",
				ntcCurrentN: "Recent Notice Date : -",
				cmtAllCntY: "Total Comment : ${1}",
				cmtAllCntN: "Total Comment : -",
				cmtMaxInfoY: "Most Comment : ${1} 건",
				cmtMaxInfoN: "Most Comment : -",
				badAllCntY: " Total Post : Insert ${1} / Delete ${2}",
				badAllCntN: "Total Post : -",
				badHitInfoY: "Most Hit : ${1}",
				badHitInfoN: "Most Hit : -",
				badPwCntY: "Secret Post : ${1}",
				badPwCntN: "Secret Post : -",
				tagLabelY: "Hashtag TOP ${1} : #${2}",
				tagLabelN: "No Hashtag",
				fileAllCntY: "Total Attchments : ${1}",
				fileAllCntN: "Total Attchments : -",
				fileAllSizeY: "Total Attchments Storage : ${1}",
				fileAllSizeN: "Total Attchments Storage : -",
			},
			label:{
				notice : "Notice",
				comment : "Comment",
				board : "Post",
				tag : "Tag",
				attchFile : "Attchments",
			}
		},
		stm6000:{
			button:{
				selectTooltip: "Department Select",
				insertTooltip: "Department Insert",
				updateTooltip: "Department Update",
				deleteTooltip: "Department Delete"
			},
			label:{
				upperDeptId : "Upper department ID",
				upperDeptNm : "Upper department Name",
				deptId : "Department ID",
				deptNm : "Department Name",
				deptOrd : "Department Order",
				deptUseCd : "Department Use",
				deptEtc : "Department description"
			},
			title:{
				deptList:"Department List",
				deptInfo:"Department Information"
			},
			message:{
				alert:{
					treeSelect:"Select a department in the tree on the left.",
					notUsedDept:"Sub-departments cannot be added to unused departments.",
					notRootDelete:"The top-level department(ROOT) cannot be deleted."
				},
				confirm:{
					deleteDept:"When deleting a department, the selected department and all sub-departments are deleted. Do you want to delete the selected department?"
				}
			},
			modal:{
				title:{
					insertDept:"New department registration",
					updateDept:"Department modification"
				}
			}
		},
		stm6001:{
			label:{
				upperDeptId : "Upper department ID",
				upperDeptNm : "Upper department Name",
				deptId : "Department ID",
				deptNm : "Department Name",
				deptOrd : "Department Order",
				deptUseCd : "Department Use",
				deptEtc : "Department description"
			},
			button:{
				insert : "Complete",
				update : "Update completed"
			},
			message:{
				confirm:{
					insert:"Would you like to register a new department?",
					update:"Would you like to edit the department information?"
				}
			}
		},
		stm9000:{
			title:{
				jenkinsManagement : "JENKINS Management",
				jobManagement : "JENKINS Management"
			},
			button:{
				jenkins:{
					selectTooltip: "Jenkins Select",
					insertTooltip: "Jenkins Insert",
					updateTooltip: "Jenkins Update",
					deleteTooltip: "Jenkins Delete"					
				},
				job:{
					selectTooltip: "Job Select",
					insertTooltip: "Job Insert",
					updateTooltip: "Job Update",
					deleteTooltip: "Job Delete"	
				}
			},
			field:{
				jenkins:{
					connectCheck: "Connection check result",
					jenkinsNm: "Jenkins Name",
					jenkinsUrl: "Jenkins Url",
					useNm: "Jenkins Use",
					JenkinsUsrId: "Jenkins User Id"
				}
			},
			actionBtn:{
				jenkins:{
					updateBtn:"Jenkins Update",
					deleteBtn:"Jenkins Delete",
					dblClickBtn:"Jenkins Detail Info"
				}
			},
			modal:{
				jeknins:{
					insertJenkins:"Register new Jenkins settings",
					updateJenkins:"Modify Jenkins settings",
					detailJenkins:"Detail Info"
				}
			}
		},
		bad1000:{
			selectBadInfoCnt : "Please, select only 1 post.\n${1} posts have been selected" ,
			notAuthority : {
					basic : "You don’t have authority for that this post",
					insertMessage : "You don’t have authority for insert the post.",
					selectMessage : "You don’t have authority for read the post.",
					updateMessage : "You don’t have authority for update the post.",
					deleteMessage : "You don’t have authority for delete the post.",
			},
			notWriter : {
				deleteMessage : "Only posts written by you can be deleted.",
			},
			field:{
				badContent: "Content",
				badNtcCheck : "Notice",
				delCd:"Delete",
				cmtContent:"Comment",
				tagNm:"Tag",
				badTitle:"Title",
				badHit: "Hit",
				badFileCnt: "Attchments Count",
				badUsrId: "Writer",
				badWtdtm: "Write Date",
			},
			label:{
				deleteBadge: "Delete",
				noticeBadge: "Notice",
			},
			button:{
				dblClick : "Detail",
			},
			actionBtn:{
				title: "Upd / Del / Det",
				updateBtn:"Update Post",
				deleteBtn:"Delete Post",
				dblClick:"Detail Post",
				selectTooltip:"Selete Posts",
				insertTooltip:"Insert Post",
				updateTooltip:"Update Post",
				deleteTooltip:"Delete Post",
				detailTooltip:"Detail Post",
			},
			title:{
				passwordCheck:"Password Check",
				boardCheck:{
					oneStep: "[ NO.${1} ] Post",
					twoStep: "[ NO.${1} ] Post and ${2} others."
				},
				deleteReason: "Delete Reason",
			}
		},
		bad1001:{
			notAuthority : {
				updateMessage : "You don’t have authority for update the post.",
				restoreMessage : "You don’t have authority for restore the post.",
				deleteMessage : "You don’t have authority for delete the post.",
				deleteCmtMessage : "You don’t have authority for delete the comment.",
			},
			notCmtWriter : {
				deleteMessage : "Only comments written by you can be deleted.",
			},
			button:{
				restore : "Restore",
				submit : "Submit",
			},
			label:{
				writeDate : "Date",
				attchFile : "Attchments",
				tag: "Tag",
				comment:"Comment",
			},
			field:{
				comment:{
					writer : "Writer",
					content:"Comment",
					writeDate : "Date"
				}
			},
			actionBtn:{
				title : "Delete",
				updateTooltip : "Update Post",
				deleteTooltip : "Delete Post",
				restoreTooltip : "Restore Post",
				selectComment : "Select Comment",
				deleteComment : "Delete Comment",
			},
			title:{
				boardCheck:{
					oneStep: "[ NO.${1} ] Post",
				},
				deleteReason: "Delete Reason",
			}
		},
		bad1002:{
			insert: "Would you like to finish writing?",
			formCheck : {
				fileCntMessage : "The number of attchments possible is ${1}.",
				passwordMessage : "You must write password for secret post.",
				passwordMatching : "The entered passwords are different.",
				tagMatching : "The tag value is duplicated.",
			},
			label:{
				title:"Title",
				content:"Contnet",
				noticeCheck:"Notice",
				noticeDate:"Notice Date",
				noticeDateIgnore:"Notice Date Ignore",
				secretCheck:"Secret Post",
				password:"PW",
				passwordCheck:"PW Check",
				commentCheck:"Allow Comment",
				attchFile : "Attchments",
				tag : "Tag",
			},
			button:{
				insertSubmit:"Insert Submit",
				submit : "Submit",
			},
		},
		bad1003:{
			update: "Would you like to finish update?",
			label:{
				title:"Title",
				content:"Contnet",
				noticeCheck:"Notice",
				noticeDate:"Notice Date",
				noticeDateIgnore:"Notice Date Ignore",
				secretCheck:"Secret Post",
				password:"PW",
				passwordCheck:"PW Check",
				commentCheck:"Allow Comment",
				attchFile : "Attchments",
				tag : "Tag",			
			},
			button:{
				deleteResetBtn:"Delete Reset",
				updateSubmit : "Update Finish",
				submit : "Submit",
			}
		},
		bad1004:{
			passwordMiss : "It doesn’t match the password for this post.\nPlease try again.",
			title:{
				detail:"Detail Post",
			},
			text : "This is secret Post.\nYou must entered password.",
			button:{
				submit: "Submit",
			}
		},
		bad1005:{
			label:{
				deleteType : "Delete Type",
				deleteReason: "Delte Reason"
			},
			button:{
				submit : "Delete",
			}
		}
	};
    return {
        // public functions
        init: function() {
        	//언어팩 목록
    		var langList = ["ko","en"];
    		
    		//언어 데이터
    		var langData = {};
    		
    		$.each(langList, function(idx, map){
    			langData[map] = lang[map];
    		});
    		
    		$.osl.langData = langData;
    		
    		//datepicker 언어 처리
    		$.osl.date.init();
        }
    };
}();