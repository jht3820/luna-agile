
var OSLCoreLangSetting = function () {
	
	var lang = {};
	
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
			close: "닫기",
			insert:{
				saveBtnString: "등록 완료"
			},
			update:{
				saveBtnString: "수정 완료"
			}
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
		            doy : 4  
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
				},
				auth:{
					saveMsg: "${1}명의 사용자가 배정되었습니다.",
					saveDupleMsg: "이미 배정된 ${1}명의 사용자 제외",
					saveAllDupleMsg: "이미 배정중인 사용자입니다. (${1}명)",
					allUsrInsert:"${1}건의 사용자를 배정하시겠습니까?",
					allUsrInDelete:"${1}건의 사용자를 배정 제외하시겠습니까?"
				}
			},
			error:{
				sessionInvalid:"세션이 만료되어 로그인 페이지로 이동합니다.",
				nonAuth:"해당 요청의 권한이 없습니다.",
				popup:"팝업 페이지에서 오류가 발생했습니다.",
				modalDuple: "해당 기능 팝업은 중복으로 동작 할 수 없습니다."
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
			},
			modal:{
				closeAlert: "팝업 창을 닫으시겠습니까?"
			}
		},
		
		cmm16000:{
			label:{
				title : "MESSAGE",
				get : "받은 메시지",
				send: "보낸 메시지",
				alone: "나에게 보낸 메시지"
			},
			button :{
				tooltip : {
					selectBtn : "메시지 조회",
					insertBtn : "메시지 보내기",
					reInsertBtn : "메시지 답장",
					checkBtn : "메시지 읽음 처리",
					deleteBtn : "메시지 삭제",
					dblClickBtn :"메시지 상세 조회"
				},
				reInsertBtn : "답장",
				checkBtn : "읽음",
			},
			
			field: {
				sendUsrId : "보낸 사람 ID",
				sendUsrEmail : "보낸 사람 e-mail",
				usrNm : "받는 사람",
				usrId : "받는 사람 ID",
				usrEmail :"받는 사람 e-mail",
				armContent : "내용"
			},
			actionBtn : {
				title : "삭제 / 상세 / 답장",
				insertTitle : "메시지 쓰기",
				reInsertTitle :"메시지 답장",
				dblClickTitle : "메시지 상세",
			},
			alert :{
				message : {
					selectMessage : "답장할 메시지를 선택하세요.",
					selectOneMessage : "1개의 메시지만 선택하세요.<br/>${1}개의 메시지가 선택되었습니다.",
				}
			}
		},
		cmm16001:{
			label : {
				to : "받는 사람",
				title : "제목",
				content : "내용",
				attachments: "파일 첨부", 
			},
			placeholder :{
				title : "제목",
				content : "내용",
				select2 : "선택 또는 입력"
			},
			message :{
				inputToUser : "받는 사람을 입력하세요.",
				send : "메시지를 보내시겠습니까?",
			},
			button : {
				submit : "보내기"
			}
		},
		cmm16002 : {
			label : {
				attachments: "첨부 파일", 
			},
			button : {
				reSend : "답장"
			},
			title :"메시지 답장"
		},
		dpl1100:{
			title : {
				deploy : "배포계획 목록",
				assignment : "요구사항 배정 목록",
				unassigned : "요구사항 미배정 목록",
			},
			button:{
				removeBtn: "제외",
				addBtn:"배정"
			},
			actionBtn :{
				title :{
					selectBtn : "선택",
					removeBtn :"제외",
					addBtn :"배정",
					dplSelect : "배포계획 조회",
					assSelect : "요구사항 배정 조회",
					nonSelect : "요구사항 미배정 조회",
				},
				tooltip :{
					clickToolTip : "배포계획 선택",
					removeToolTip :"요구사항 배정 제외",
					addToolTip :"요구사항 배정",
				},
			}
		},
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
			},
			datatable:{
				action:{
					dblClick: "상세 정보",
					update: "프로젝트 그룹 수정",
					delete: "프로젝트 그룹 삭제"
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
				projectDetail: "상세 정보",
				recordDelete: "완전 삭제",
				projectRedo: "프로젝트 복구"
			},
			confirm:{
				prjRedo: "${1}건의 프로젝트를 복구하시겠습니까?",
				prjDelete: "${1}건의 프로젝트를 완전 삭제하시겠습니까?</br>삭제된 프로젝트는 복구 할 수 없습니다."
			}
		},
		prj1002:{
			complete: "완료",
			insert:{
				title: "신규 프로젝트 그룹 생성",
				saveString: "신규 프로젝트 그룹을 생성하시겠습니까?",
				saveBtnString: "등록 완료",
				saveMsg: "${1}명의 사용자가 배정되었습니다.",
				saveDupleMsg: "이미 배정된 ${1}명의 사용자 제외",
				saveAllDupleMsg: "이미 배정중인 사용자입니다. (${1}명)"
			},
			update:{
				title: "프로젝트 그룹 수정",
				saveString: "프로젝트 그룹을 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			}
		},
		prj1003:{
			title: "프로젝트 그룹 상세정보",
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
		prj1004:{
			complete: "완료",
			insert:{
				title: "신규 프로젝트 생성",
				saveString: "신규 프로젝트를 생성하시겠습니까?",
				saveBtnString: "등록 완료",
				saveMsg: "${1}명의 사용자가 배정되었습니다.",
				saveDupleMsg: "이미 배정된 ${1}명의 사용자 제외",
				saveAllDupleMsg: "이미 배정중인 사용자입니다. (${1}명)"
			},
			update:{
				title: "프로젝트 수정",
				saveString: "프로젝트를 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			}
		},
		prj1201:{
			title: "프로젝트 설정 수정",
			complete: "완료",
			update:{
				saveString: "프로젝트 설정을 수정하시겠습니까?",
				saveBtnString: "수정 완료",
			},
			actionBtn : {
				updateBtn : "프로젝트 설정 수정"
			},
			label : {
				prjSetNm: "설정명",
				prjSetDesc: "설정 설명",
				prjSetTarget: "설정 대상",
				valType: "설정 값 타입",
				prjSetVal: "설정값",
				useCd: "사용유무"
			}
		},
		prj2100:{
			allUsrInsert:"${1}건의 사용자를 배정하시겠습니까?",
			allUsrInDelete:"${1}건의 사용자를 배정 제외하시겠습니까?"
		},
		prj5000:{
			button:{
				title:{
					insert: "일정 등록",
					local: 'ko',
					today: '오늘',
					fourDay: '4일',
					dataSelect: '일정 데이터 조회',
					insert: '일정 등록'
				}
			}
		},
		prj5001:{
			complete: "완료",
			insert:{
				title: "프로젝트 일정 저장",
				saveString: "신규 프로젝트 일정을 생성하시겠습니까?",
				saveBtnString: "등록 완료",
			},
			delete:{
				deleteString: "프로젝트 일정을 삭제하시겠습니까?",
				deleteBtnString: "삭제",
			},
			update:{
				title: "프로젝트 일정 수정",
				saveString: "프로젝트 일정을 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			},
			view:{
				title: "일정 상세정보"
			},
			actionBtn : {
				insertBtn : "프로젝트 일정 저장",
				updateBtn : "프로젝트 일정 수정"
			},
			label : {
				evtNm: "일정명",
				evtRange: "일정 일자",
				evtDesc: "일정 설명",
				evtBgColor: "일정 배경 색상",
				evtColor: "일정 색상",
				guideColor: "가이드 색상",
			}
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
			reqPw: {
				title : "요구사항 잠금",
				password : "PW",
				passwordCheck :"PW 확인",
				placeholder : {
					password : "알파벳, 숫자 4-12자 이내",
					nullPassword : "공백인 경우 기존 비밀번호 사용",
				}
			},
			attachments: "파일 첨부", 
			complete: "완료",
			insert:{
				saveString: "신규 요구사항을 요청하시겠습니까?",
				saveBtnString: "작성 완료"
			},
			update:{
				saveString: "요구사항 정보를 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			},
			formCheck:{
				passwordMessage : "비밀글에 사용할 비밀번호를 입력해주세요.",
				passwordMatching : "입력된 비밀번호가 서로 다릅니다.",
			},
		},
		req4100:{
			button:{
				copyBtn : "복사"
			},
			field:{
				
				prjGrpNm: "프로젝트 그룹명",
			},
			actionBtn:{
				title : "수정 / 삭제 / 상세 / 복사",
				updateBtn : "요구사항 수정",
				deleteBtn : "요구사항 삭제",
				detailBtn : "요구사항 상세",
				copyBtn : "요구사항 복사",
				selectTooltip : "요구사항 조회",
				insertTooltip : "요구사항 추가",
				updateTooltip : "요구사항 수정",
				deleteTooltip : "요구사항 삭제",
				detailTooltip : "요구사항 상세",
				copyTooltip : "요구사항 복사"
			},
			title:{
				insertTitle : "신규 요구사항 등록",
				updateTitle : "요구사항 수정",
				detailTitle : "요구사항 확인"
			},
			alert:{
				updateMsg : "접수 요청중인 요구사항만 수정 가능합니다.",
				multiPwMsg : "패스워드 확인이 필요한 요구사항이 ${1}건 있습니다.<br/> 잠금된 요구사항을 제외 후 삭제 또는 잠금 요구사항은 단건 삭제하세요.",
				selectData : "데이터를 선택하세요",
				LockData : "잠긴 요구사항은 복사할 수 없습니다.",
				selectCopyData : "복사는 1건에 대해서만 가능합니다. 현재 ${1}건 선택되었습니다.",
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
				group:{
					groupReqInfo : "그룹 요구사항 정보",
					groupReq : "그룹 요구 사항",
					groupReqDesc : "그룹 요구사항 내용",
				},
				prjNm : "프로젝트",
				reqDtm : "요청일",
				reqNm : "요청 제목",
				reqDesc : "요청 내용",
				reqPw : "요구사항 잠금",
				password : "PW",
				passwordCheck : "PW 확인",
				attachments : "파일 첨부",
				requestDefaultOptNm : "접수 기본항목 입력"
			},
			placeholder:{
				usrNm : "요청자 이름",
				email : "요청자 e-mail",
				deptNm : "요청자 소속",
				tel : "요청자 연락처",
				selectGroup : "그룹 요구사항을 선택하세요.",
				reqDtm : "요청일",
				reqNm : "요청 제목",
				password : "알파벳, 숫자 4-12자 이내",
				nullPassword : "공백인 경우 기존 비밀번호 사용",
			},
			regex:{
				password : "알파벳, 숫자 4-12자 이내",
			},
			modalTitle : {
				userSearch : "요청자 검색"
			},
			button :{
				deleteResetBtn : "삭제 초기화",
				insertBtn : "등록",
				updateBtn : "수정 완료",
				copyBtn : "복사 완료",
				searchBtn : "검색",
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
				},
			},
			formCheck:{
				passwordMessage : "비밀글에 사용할 비밀번호를 입력해주세요.",
				passwordMatching : "입력된 비밀번호가 서로 다릅니다.",
			},
		},
		req4103:{
			field: {
				
				usrNm : "사용자명",
			},
			actionBtn : {
				title : "선택",
				clickBtn : "선택",
			},
		},
		req4104:{
			text: "잠긴 요구사항입니다.<br/> 비밀번호를 입력하세요.",
			button:{
				submit : "확인",
			}
		},
		spr1000:{
			nonSelect: "스프린트를 선택해주세요.",
			manySelect: "1건의 스프린트만 선택해주세요.",
			sprTypeWaitMsg: "대기 중인 스프린트만 시작 할 수 있습니다.",
			sprTypeStartMsg: "시작 중인 스프린트만 종료 할 수 있습니다.", 
			startDate: "시작일",
			endDate: "종료일",
			completedRatio: "진척률",
			projectCnt: "등록 프로젝트",
			requestAll: "전체 요구사항",
			requestInProgress: "진행 중",
			requestDone: "최종 완료",
			menu:{
				update: "스프린트 수정",
				delete: "스프린트 삭제",
				sprintStart: "스프린트 시작",
				sprintEnd: "스프린트 종료",
				sprintDetail: "스프린트 상세정보",
				sprintMeetList: "스프린트  회의록 목록",
				sprintResultList: "스프린트 회고록 목록",
				sprintReport: "보고서 출력"
			},
			button:{
				title:{
					sprStart: "시작",
					sprEnd: "종료"
				}
			},
			confirm:{
				prjGrpRedo: "${1}건의 프로젝트 그룹을 복구하시겠습니까?",
				prjGrpDelete: "${1}건의 프로젝트 그룹을 완전 삭제하시겠습니까?</br>삭제된 프로젝트 그룹은 복구 할 수 없습니다."
			},
			datatable:{
				action:{
					update: "스프린트 수정",
					delete: "스프린트 삭제",
					dblClick: "스프린트 상세 정보"
				}
			}
		},
		spr1002:{
			complete: "완료",
			insert:{
				title: "신규 스프린트 생성",
				saveString: "신규 스프린트를 등록하시겠습니까?",
				saveBtnString: "등록 완료",
			},
			update:{
				title: "스프린트 수정",
				saveString: "스프린트를 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			}
		},
		spr1003:{
			wizard:{
				main:{
					mmtTitle: "회의록 작성",
					mmtDesc: "스프린트 회의록 작성",
					sprPtTitle: "스토리 포인트 입력",
					sprPtDesc: "요구사항 스토리 포인트 입력",
					chargerTitle: "담당자 지정",
					chargerDesc: "요구사항 담당자 지정",
					processTitle: "프로세스 배정"
				},
				info:{
					mmt: "* 스프린트 시작 전 회의록을 작성하세요.",
					sprPt: "* 요구사항에 스토리 포인트를 입력하세요.",
					charger: "* 사용자를 클릭하고 담당자 입력 상자 클릭으로 담당자를 배정하세요.",
					process: "* 배정된 프로세스가 칸반 보드에 표시됩니다."
				},
				btn:{
					prev: "이전",
					submit: "완료",
					next: "다음"
				}
			},
			lebel:{
				mmtUsrList: "참여 인원",
				mmtTitle: "회의록 제목",
				mmtDesc: "회의록 내용"
			},
			alert:{
				reqSprPoint: "모든 요구사항의 스토리포인트를 입력해주세요.</br>미 입력 요구사항 ${1}건"
			}
		},
		spr1100:{
			title : {
				sprint : "스프린트 목록",
				assignment : "요구사항 배정 목록",
				unassigned : "요구사항 미배정 목록",
			},
			button:{
				removeBtn: "제외",
				addBtn:"배정"
			},
			actionBtn :{
				title :{
					selectBtn : "선택",
					removeBtn :"제외",
					addBtn :"배정",
					sprSelect : "스프린트 조회",
					assSelect : "요구사항 배정 조회",
					nonSelect : "요구사항 미배정 조회",
				},
				tooltip :{
					clickToolTip : "스프린트 선택",
					removeToolTip :"요구사항 배정 제외",
					addToolTip :"요구사항 배정",
				},
			}
		},
		spr2000:{
			title :"회의록 목록",
			button:{
				detailBtn : "상세",
			},
			actionBtn:{
				title : "수정 / 삭제 / 상세",
				selectTooltip : "회의록 조회",
				insertTooltip : "회의록 추가",
				updateTooltip : "회의록 수정",
				deleteTooltip : "회의록 삭제",
				detailTooltip : "회의록 상세",
			},
			message : {
				selectMsg : "스프린트를 선택하세요.",
			},
			title : {
				insertTitle : "스프린트 회의록 등록",
				updateTitle : "스프린트 회의록 수정",
				detailTitle : "스프린트 회의록 상세",
			}
		},
		spr2001:{
			submit: "완료",
			label : {
				sprNm : "스프린트명",
				rptMem: "참여 인원",
				rptNm :"회의록 제목",
				rptDesc : "회의록 내용",
			},
			button : {
				insertBtn : "등록",
				updateBtn : "수정 완료",
			},
			placeholder:{
				rptNm : "제목",
				select2 : "선택 또는 입력"
			},
			message : {
				select2 : "없을 경우 작성자가 자동으로 추가됩니다."
			}
		},
		spr2100:{
			title :"회고록 목록",
			button:{
				detailBtn : "상세",
			},
			actionBtn:{
				title : "수정 / 삭제 / 상세",
				selectTooltip : "회고록 조회",
				insertTooltip : "회고록 추가",
				updateTooltip : "회고록 수정",
				deleteTooltip : "회고록 삭제",
				detailTooltip : "회고록 상세",
			},
			message : {
				selectMsg : "스프린트를 선택하세요.",
			},
			title : {
				insertTitle : "스프린트 회고록 등록",
				updateTitle : "스프린트 회고록 수정",
				detailTitle : "스프린트 회고록 상세",
			}
		},
		spr2101:{
			submit: "완료",
			label : {
				sprNm : "스프린트명",
				mmrMem: "참여 인원",
				mmrNm :"회고록 제목",
				mmrDesc : "회고록 내용",
			},
			button : {
				insertBtn : "등록",
				updateBtn : "수정 완료",
			},
			placeholder:{
				mmrNM : "제목",
			}
		},
		stm2100:{
			selectStmInfoCnt : "1건의 게시판만 선택하세요.<br/> ${1}건의 게시판이 선택되었습니다." ,
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
				chargerTitle : "담당자 목록 확인"
			},
			type:{
				normal:"[일반]",
				gallery:"[갤러리]",
				movie:"[영상]",
				storage:"[자료실]",
			},
			label:{
				summery : "통계",
			},
			chart:{
				noData : "데이터 없음",
				newPost : "등록 게시글",
				deletePost : "삭제 게시글"
			}
		},
		stm2101:{
			update: "게시판 정보를 수정하시겠습니까?",
			formCheck:{
				fileCntMessage : "첨부파일 갯수는 최소 1부터 10까지 가능합니다<br/> 첨부파일 갯수를 최솟값인 1로 변경합니다.",
				fileMaxCntMessage : "첨부파일 가능한 갯수를 초과합니다.<br/> 최대 수로 적용됩니다.",
				fileMaxStrgMessage : "게시판 유형에 따라<br/> 최대 첨부파일 용량으로 지정됩니다.",
				fileMaxStrgOutMessage : "최대 첨부파일 용량을 초과합니다<br/> 최대용량(${1})으로 변경됩니다.",
			},
			label:{
				name: "게시판 명",
				type : "유형",
				dsType : "게시물 공개 범위",
				option : "옵션",
				noticeCheck : "공지사항 사용",
				commentCheck : "댓글 사용",
				secretCheck : "비밀글 사용",
				attachFileCheck : "첨부파일 사용",
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
				attachFile : "첨부파일",
			}
		},
		stm2200:{
			title:{
				authGrpList: "시스템권한 그룹 ",
				authList: "시스템 메뉴 권한",
				insert: "신규 시스템 권한 그룹 등록",
				update: "시스템 권한 그룹 수정",
				view: "시스템 권한 그룹 상세보기",
			},
			actionBtn : {
				updateBtn : "시스템 권한 그룹 수정",
				deleteBtn : "시스템 권한 그룹 삭제",
				clickBtn  : "시스템 메뉴 권한 조회",
				dblClickBtn : "시스템 권한 그룹 상세보기"
			},
			button:{
				title:{
					insert: "시스템 권한 그룹 추가",
					update: "시스템 권한 그룹 수정",
					delete: "시스템 권한 그룹 삭제",
					select: "시스템 권한 그룹 조회",
				}
			},
		},
		stm2201:{
			complete: "완료",
			insert:{
				saveString: "시스템 권한 그룹을 등록하시겠습니까?",
				saveBtnString: "등록 완료",
			},
			update:{
				saveString: "시스템 권한 그룹을  수정하시겠습니까?",
				saveBtnString: "수정 완료",
			},
			label : {
				authGrpNm: "권한그룹 명",
				ord: "순번",
				usrTyp: "사용자 유형",
				acceptUseCd: "접수권한 사용유무",
				useCd: "사용유무",
				authGrpDesc: "비고"
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
				jenkinsManagement : "JENKINS 관리"
			},
			button:{
				common:{
					selectConnection:"선택 접속 확인",
					allConnection:"전체 접속 확인"
				},
				jenkins:{
					selectTooltip: "Jenkins 조회",
					insertTooltip: "Jenkins 추가",
					updateTooltip: "Jenkins 수정",
					deleteTooltip: "Jenkins 삭제",
					selectConnectionTooltip: "선택 Jenkins 접속 확인",
					allConnectionTooltip: "전체 Jenkins 접속 확인"
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
			},
			message:{
				jenkins:{
					nonSelect:"접속 확인할 Jenkins를 선택해주세요.",
					connectSuccess:" 접속 성공"
				}
			}
		},
		stm9001:{
			label:{
				jenkinsName : "JENKINS NAME",
				jenkinsUrl : "JENKINS URL",
				jenkinsUserId : "USER ID",
				tokenKey: "TOKEN KEY",
				jenkinsUseCd : "사용여부",
				jenkinsDesc : "JENKINS 설명",
			},
			button:{
				insert : "작성 완료",
				update : "수정 완료"
			},
			message:{
				confirm:{
					insert:"신규 JENKINS를 등록하시겠습니까?",
					update:"JENKINS 정보를 수정하시겠습니까?"
				}
			}
		},
		stm9002:{
			label:{
				leftTitle: "JENKINS 정보",
				rightTitle: "JOB 정보",
				jenkinsName : "JENKINS NAME",
				jenkinsUrl : "JENKINS URL",
				jenkinsUserId : "JENKNS USER ID",
				tokenKey: "TOKEN KEY",
				jenkinsUse : "사용 유무",
				mode : "mode",
				jenkinsClass : "_class",
				jenkinsDescription : "description",
				jenkinsNodeName : "nodeName",
				jenkinsNodeDesc : "nodeDescription",
				statusLable :"상태",
				systemRegisterLabel :"시스템 등록 유무",
				systemRegister : "등록",
				notSstemRegister : "미등록",
				jobClass : "_class",
				jobStatusEtc : "ETC",
				jobStatusSuccess : "SUCCESS",
				jobStatusFail : "FAIL",
				jobStatusAborted : "ABORTED",
				jobStatusNotBuilt : "NOT BUILT"
			},
			button:{
				jobUpdate : "수정",
				jobDelete : "삭제",
				jobDetail : "상세 정보",
				jobInsert : "신규 JOB 등록",
				moveJobList : "JOB 목록 이동"
			},
			message:{
				confirm:{
					deleteMessage :"를 삭제하시겠습니까?"
				}
			}
		},
		stm9100: {
			title : {
				jobManagement : "JOB 관리"
			},
			button:{
				common:{
					selectConnection:"선택 접속 확인",
					allConnection:"전체 접속 확인"
				},
				job:{
					selectTooltip: "Job 조회",
					insertTooltip: "Job 추가",
					updateTooltip: "Job 수정",
					deleteTooltip: "Job 삭제"	,
					selectConnectionTooltip: "선택 Job 접속 확인",
					allConnectionTooltip: "전체 Job 접속 확인"
				}
			},
			actionBtn:{
				job:{
					updateBtn:"Job 수정",
					deleteBtn:"Job 삭제",
					dblClickBtn:"Job 상세보기",
					detailJenkins:"Jenkins 상세보기"
				}
			},
			modal:{
				job:{
					insertJob:"신규 Job 설정 등록",
					updateJob:"Job 설정 수정",
					detailJob:"상세 정보"
				}
			},
			message:{
				job:{
					nonSelect:"접속 확인할 Job을 선택해주세요.",
					connectSuccess:" 접속 성공"
				}
			}
		},
		stm9101:{
			label:{
				jenkins : "JENKINS",
				job : "JOB",
				jobRestoreId : "원복 JOB ID",
				tokenKey: "TOKEN KEY",
				jobParameter: "JOB 매개변수",
				jobTypeCd : "JOB TYPE",
				jobUseCd : "사용 유무",
				jobDesc : "JOB 설명"
			},
			button:{
				insert : "작성 완료",
				update : "수정 완료"
			},
			message:{
				noExistJenkins : "JENKINS 등록이 필요합니다.",
				confirm:{
					insert:"신규 JOB을 등록하시겠습니까?",
					update:"JOB 정보를 수정하시겠습니까?"
				}
			}
		},
		stm9102:{
			label:{
				leftTitle : "JOB 빌드 목록",
				rightTitle : "콘솔 로그",
				jenkinsNm : "JENKINS NAME",
				jobId : "JOB ID",
				minute : "분",
				second : "초"
			},
			message:{
				selectBuildInfo: "좌측 빌드 정보를 선택해주세요.",
				notConsoleLog: "콘솔 로그가 없습니다."
			}
		},
		stm9200:{
			common:{
				assign : "배정",
				notAssign : "제외"
			},
			title:{
				allPrjList : "전체 프로젝트 목록",
				assignJobList : "JOB 배정 목록",
				notAssignJobList : "JOB 미배정 목록"
			},
			button:{
				dplAuthSetting : "배포 실행 권한 설정"
			},
			toolTip:{
				searchAssignJob:"JOB 배정 목록 조회",
				searchNotAssignJob:"JOB 미배정 목록 조회",
				jobAssign :"JOB 배정",
				jobDelete : "JOB 배정 제외",
			},
			message:{
				alert:{
					treeNodeSelect : "왼쪽 트리에서 프로젝트를 선택해주세요.",
					assignJobSelect : "프로젝트에 배정된 JOB을 선택해주세요.",
					selectOneJob : "프로젝트에 배정된 JOB을 1개만 선택하세요."
				},
				toastr:{
					projectSelect : "프로젝트 그룹이 아닌 프로젝트를 선택해주세요."
				},
				confirm:{
					selJobAssign : "선택한 JOB을 배정하시겠습니까?",
					selJobNotAssign : "선택한 JOB을 배정 제외하시겠습니까?",
				}
			}
		},
		stm9300:{
			button:{
				toolTil:{
					prjAssignJobSearch:"프로젝트 배정 JOB 조회"
				}
			},
			search:{
				jenkinsDesc : "Jenkins 설명",
				jobDesc : "Job 설명"
			},
			actionBtn:{
				jenkinsDetail:"Jenkins 상세보기",
				jobDetail:"Job 상세보기"
			},
			modal:{
				title:{
					detail :"상세보기"
				}
			}
		},
		bad1000:{
			selectBadInfoCnt : "1건의 게시글을 선택하세요.<br/> ${1}건의 게시글이 선택되었습니다." ,
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
			label:{
				deleteBadge: "삭제",
				noticeBadge: "공지",
			},
			field:{
				
				tagNm:"태그",
				
				badContent: "내용",
				badNtcCheck : "공지유무",
				delCd:"삭제유무",
				cmtContent:"댓글내용",
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
				attachFile : "파일 첨부",
				tag: "태그",
				comment:"댓글",
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
				attachFile : "파일 첨부",
				tag : "태그",
			},
			button:{
				insertSubmit:"등록",
				submit : "등록",
			},
			placeholder:{
				badTitle : "제목",
				badContent : "내용",
				password : "알파벳, 숫자 4-12자 이내",
				nullPassword : "공백인 경우 기존 비밀번호 사용",
			},
			regex:{
				password : "알파벳, 숫자 4-12자 이내",
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
				attachFile : "파일 첨부",
				tag : "태그",
			},
			button:{
				deleteResetBtn:"삭제 초기화",
				updateSubmit : "수정 완료",
				submit : "등록",
			}
		},
		bad1004:{
			passwordMiss : "비밀번호가 틀렸습니다.<br/> 다시 입력하세요.",
			title:{
				detail:"게시글 상세보기",
			},
			text : "이 글은 비밀글입니다.<br/> 비밀번호를 입력하세요.",
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
			
			cmm16000CmmTable:{
				sendUsrNm : "From User Name",
				armTitle : "Title",
				sendDtm : "Date",
			},
			bad1000BadTable:{
				badContent: "Content",
				badNtcCheck : "Notice",
				delCd:"Delete",
				cmtContent:"Comment",
				tagNm:"Tag",
				badTitle:"Title",
				badHit: "Hit",
				badFileCnt: "Attachments Count",
				badUsrId: "Writer",
				badWtdtm: "Write Date",
			},
			bad1001CmtTable:{
				writer : "Writer",
				content:"Comment",
				writeDate : "Date"
			},
			dpl1000DplTable:{
				dplStsNm:"Deploy Status",
				dplNm:"Deploy Title",
				dplDt:"Deploy Date",
				dplVer:"Deploy Version",
				dplTypeNm:"Deploy Type",
				dplDesc:"Deploy Desciption",
			},
			req1000ReqTable:{
				prjNm: "Project Name",
				prjGrpNm: "Prject Group Name",
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
			req1100AssTable:{
				reqNm: "Request Name",
				reqOrd : "Request Number",
				reqProTypeNm :"Processing Status",
				reqDtm : "Request Date",
			},
			req1100NonTable:{
				reqNm: "Request Name",
				reqOrd : "Request Number",
				reqProTypeNm :"Processing Status",
				reqDtm : "Request Date",
			},
			req4100ReqTable:{
				prjGrpNm: "Project Group Name",
				prjNm: "Project Name",
				reqOrd: "Request Number",
				reqProTypeNm: "Processing Status",
				reqNm: "Title",
				reqDtm: "Request Date",
				regDtm: "Write Date",
				reqUsrNm: "Requester",
				reqUsrEmail: "Requester E-mail",
				reqUsrDeptNm: "Requester Department",
				reqUsrNum: "Requester Contact",
				reqKey: "Request Key"
			},
			prepListTable:{
				reqProTypeNm : "Processing Status",
				reqOrd : "Request Number",
				prjNm : "Project Name",
				reqNm : "Title",
				reqDtm : "Request Date"
			},
			req4103ReqTable:{
				usrNm : "User Name",
				usrId : "Id",
				email : "E-mail",
				tel : "Contact",
				deptName: "Department",
			},
			prj1000PrjTable:{
				prjNm: "Project Group Name",
				startDt: "Start Date",
				endDt: "End Date",
				prjChildCnt: "Project Count",
				reqAllCnt: "Request All",
				reqInProgressCnt: "Request In Porgress",
				reqDoneCnt: "Request Done",
			},
			prj1200PrjTable:{
				prjSetTargetNm: "Setting Target",
				prjSetNm: "Setting Name",
				prjSetDesc : "Setting Desciption",
				prjSetValNm:"Setting Value",
				modifyDtmDay:"Modify Date",
				modifyUsrNm:"Final Modifier",
			},
			spr1000SprTable:{
				sprTypeNm : "Type",
				sprNm : "Sprint Title",
				sprStdtm : "Start Date",
				sprEddtm : "End Date",
				sprDesc : "Sprint Desciption",
				sprDtm :"Date Range",
			},
			spr2000RptTable:{
				rptNm : "Meeting Log Title",
				rptMemCnt : "Meeting Members",
				rptUsrId : "Writer",
				rptDtm : "Write Date",
			},
			spr2100RptTable:{
				sprNm:"Sprint Title",
				mmrNm:"Memoirs Title",
				mmrUsrId : "Wirter",
				mmrDtm :"Write Date",
			},
			stm2200AuthTable:{
				authGrpNm: "Auth Group Name",
				ord: "Ord",
				usrTypNm : "User Type",
				acceptUseNm:"Accept Use",
				useNm:"Use Name",
				authGrpDesc:"Auth Group Desc"
			},
			stm9000JenkinsTable:{
				result : "Connection check",
				jenNm: "Jenkins Name",
				jenUrl: "Jenkins Url",
				jenUsrId: "Jenkins User Id",
				useNm:"Jenkins Use",
				jenDesc:"Jenkins Description"
			},
			stm9100JobTable:{
				jenNm:"Jenkins Name",
				jobTypeNm:"Job Type",
				jobId:"Job Id",
				jobRestoreId:"Restore Job Id",
				jobParameter:"Job Parameter",
				useNm:"Jenkins Use",
				jobDesc:"Job Description"
			},
			stm9102JobBuildTable:{
				bldNum: "Build Number",
				bldResult: "Build Result",
				bldStartDtm: "Build Start Time",
				bldDurationTm: "Duration Time",
				regUsrNm: "Distributor"
			},
			stm9200AssignJobTable:{
				prjNm: "Project Name",
				jenNm: "Jenkins Name",
				jenUrl: "Jenkins URL",
				jobId: "Job Id",
				jobTypeNm: "Job Type",
				jobRestoreId: "Restore Job Id",
				jobParameter: "Job Parameter"
			},
			stm9200NotAssignJobTable:{
				jenNm: "Jenkins Name",
				jenUrl: "Jenkins URL",
				jobId: "Job Id",
				jobTypeNm: "Job Type",
				jobRestoreId: "Restore Job Id",
				jobParameter: "Job Parameter"
			},
			stm9300PrjJobTable:{
				prjNm: "Project Name",
				jenNm: "Jenkins Name",
				jenUrl: "Jenkins URL",
				jobId: "Job Id",
				jobTypeNm: "Job Type",
				jobRestoreId: "Restore Job Id",
				jobParameter: "Job Parameter",
				useNm: "Jenkins Use"
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
		            doy : 4  
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
		
		cmm16000:{
			label:{
				title : "MESSAGE",
				get : "Received Message",
				send: "Sent Message",
				alone: "Sent To Me"
			},
			button :{
				tooltip : {
					selectBtn : "Select Message",
					insertBtn : "Send Message",
					reInsertBtn : "Reply Message",
					checkBtn : "Read Check Message",
					deleteBtn : "Delete Message",
					dblClickBtn :"Detail Message"
				},
				reInsertBtn : "Reply",
				checkBtn : "Read Check"
			},
			
			field: {
				sendUsrId : "From User Id",
				sendUsrEmail : "From User E-mail",
				usrNm : "To User Name",
				usrId : "To User Id",
				usrEmail :"To User E-mail",
				armContent : "Content"
			},
			actionBtn : {
				title : "Del / Det / Rep",
				insertTitle : "Write Message",
				reInsertTitle :"Reply Message",
				dblClickTitle : "Detail Message",
			},
			alert :{
				message : {
					selectMessage : "Select a message to reply to.",
					selectOneMessage : "Please select only 1 message.<br/>${1} messages have been selected.",
				}
			}
		},
		cmm16001:{
			label : {
				to : "To",
				title : "Title",
				content : "Content",
				attachments: "Attachments", 
			},
			placeholder :{
				title : "Title",
				content : "Content",
				select2 : "Click or Search Text"
			},
			message :{
				inputToUser : "Please enter the recipient.",
				send : "Would you like to send a message?",
			},
			button : {
				submit : "Send"
			}
		},
		cmm16002 : {
			label : {
				attachments: "Attachments", 
			},
			button : {
				reSend : "Reply"
			},
			title :"Reply Message"
		},
		dpl1100:{
			title : {
				deploy : "Deploy List",
				assignment : "Assignment Request List",
				unassigned : "Unassigned Request List",
			},
			button:{
				removeBtn: "Remove",
				addBtn:"Add"
			},
			actionBtn :{
				title :{
					selectBtn : "Select",
					removeBtn :"Remove",
					addBtn :"Add",
					dplSelect : "Select Deploy List",
					assSelect : "Select Assignment Request",
					nonSelect : "Select Unassigned Request",
				},
				tooltip :{
					clickToolTip : "Select Sprint",
					removeToolTip :"Remove Request",
					addToolTip :"Add Request",
				},
			}
		},
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
		prj1201:{
			title: "Project Setting Modify",
			complete: "Complete",
			update:{
				saveString: "프로젝트 설정을 수정하시겠습니까?",
				saveBtnString: "Update Action",
			},
			actionBtn : {
				updateBtn : "Project Setting Update"
			},
			label : {
				prjSetNm: "Setting Name",
				prjSetDesc: "Setting description",
				prjSetTarget: "Setting Target",
				valType: "Value Type",
				prjSetVal: "Setting Value",
				useCd: "Setting Use"
			}
		},
		prj2100:{
			allUsrInsert:"Do you want to allocate ${1} users?",
			allUsrInDelete:"Are you sure you want to exclude ${1} users?"
		},
		prj5000:{
			button:{
				title:{
					insert: "일정 등록",
					local: 'ko',
					today: '오늘',
					fourDay: '4일',
					dataSelect: '일정 데이터 조회',
					insert: '일정 등록'
				}
			}
		},
		prj5001:{
			complete: "완료",
			insert:{
				title: "프로젝트 일정 저장",
				saveString: "신규 프로젝트 일정을 생성하시겠습니까?",
				saveBtnString: "등록 완료",
			},
			delete:{
				deleteString: "프로젝트 일정을 삭제하시겠습니까?",
				deleteBtnString: "삭제",
			},
			update:{
				title: "프로젝트 일정 수정",
				saveString: "프로젝트 일정을 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			},
			view:{
				title: "일정 상세정보"
			},
			actionBtn : {
				insertBtn : "프로젝트 일정 저장",
				updateBtn : "프로젝트 일정 수정"
			},
			label : {
				evtNm: "일정명",
				evtRange: "일정 일자",
				evtDesc: "일정 설명",
				evtBgColor: "일정 배경 색상",
				evtColor: "일정 색상",
				guideColor: "가이드 색상",
			}
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
			reqPw:{
				title : "Request Lock",
				password : "PW",
				passwordCheck : "PW Check",
				placeholder : {
					password : "4 to 12 letters of alphabet and number combination.",
					nullPassword : "If blank, the old password is used.",
				}
			},
			attachments: "Attachments",
			requestDefaultOptNm: "Request Default Option Name",
			complete: "Complete",
			formCheck:{
				passwordMessage : "You must write password for secret request.",
				passwordMatching : "The entered passwords are different.",
			},
		},
		req4100:{
			button:{
				copyBtn : "Copy"
			},
			field:{
				
				prjGrpNm: "Project Group Name",
			},
			actionBtn:{
				title : "Udp / Del / Det / Cop",
				updateBtn : "Request Update",
				deleteBtn : "Request Delete",
				detailBtn : "Request Detail",
				copyBtn : "Request Copy",
				selectTooltip : "Select Request",
				insertTooltip : "Insert Request",
				updateTooltip : "Update Request",
				deleteTooltip : "Delete Request",
				detailTooltip : "Detail Request",
				copyTooltip : "Copy Request"
			},
			title:{
				insertTitle : "Insert New Request",
				updateTitle : "Update Request",
				detailTitle : "Detail Request"
			},
			alert:{
				updateMsg : "You can only modify requirements whose processing status is being requested.",
				multiPwMsg : "There are ${1} requirements that require password verification.<br/> You can delete locked requirements after excluding them, or you can delete locked requirements as a single item.",
				selectData : "Choose your data.",
				LockData : "Locked requirements cannot be copied.",
				selectCopyData : "Copying is only possible for 1 copy. Currently ${1} are selected.",
			}
		},
		req4101:{
			complete : "Complete",
			saveString :{
				insertStr : "Would you like to register your requirements?",
				updateStr : "Would you like to modify your requirements?",
			},
			label : {
				reqUser : {
					title : "Requester Information",
					usrNm : "Name",
					email : "E-mail",
					deptNm : "Department",
					telNo : "Contact",
				},
				group:{
					groupReqInfo : "Group Request Information",
					groupReq : "Group Request",
					groupReqDesc : "Group Request Content",
				},
				prjNm : "Project",
				reqDtm : "Request Date",
				reqNm : "Title",
				reqDesc : "Content",
				reqPw : "Request Lock",
				password : "PW",
				passwordCheck : "PW Check",
				attachments : "Attachments",
				requestDefaultOptNm : "Enter basic items for application"
			},
			placeholder:{
				usrNm : "Name",
				email : "E-mail",
				deptNm : "Department",
				tel : "Contact",
				selectGroup : "Select Group Request",
				reqDtm : "Request Date",
				reqNm : "Title",
				password : "4 to 12 letters of alphabet and number combination.",
				nullPassword : "If blank, the old password is used.",
			},
			regex:{
				password : "4 to 12 letters of alphabet and number combination.",
			},
			modalTitle : {
				userSearch : "User Search"
			},
			button :{
				deleteResetBtn : "Delete Reset",
				insertBtn : "Insert Request",
				updateBtn : "Update Request",
				copyBtn : "Copy Request",
				searchBtn : "Search"				
			},
			prepData : {
				title : "Previous Knowledge",
				reqNm : "Title",
				result : "Have the following concatenation result : ",
				notResult : "No Result",
				total : "Total",
				count : "Request",
				tooltip : {
					selectTooltip : "Select Previous Knowledge",
					detailTooltip : "Detail Request",
					card : "Card",
					grid : "Grid",
				},
				button : {
					detailBtn : "Detail",
				},
			},
			formCheck:{
				passwordMessage : "You must write password for secret request.",
				passwordMatching : "The entered passwords are different.",
			},
		},
		req4103:{
			field: {
				
				usrNm : "User Name",
			},
			actionBtn : {
				title : "Select",
				clickBtn : "Select",
			},
		},
		req4104:{
			text: "This is secret request.<br/> You must entered password.",
			button:{
				submit : "Submit",
			}
		},
		spr1100:{
			title : {
				sprint : "Sprint List",
				assignment : "Assignment Request List",
				unassigned : "Unassigned Request List",
			},
			button:{
				removeBtn: "Remove",
				addBtn:"Add"
			},
			actionBtn :{
				title :{
					selectBtn : "Select",
					removeBtn :"Remove",
					addBtn :"Add",
					sprSelect : "Select Sprint",
					assSelect : "Select Assignment Request",
					nonSelect : "Select Unassigned Request",
				},
				tooltip :{
					clickToolTip : "Select Sprint",
					removeToolTip :"Remove Request",
					addToolTip :"Add Request",
				},
			}
		},
		spr2000:{
			title :"Meeting Log List",
			button:{
				detailBtn : "Detail",
			},
			actionBtn:{
				title : "Upd / Del / Det",
				selectTooltip : "Select Meeting Log",
				insertTooltip : "Insert Meeting Log",
				updateTooltip : "Update Meeting Log",
				deleteTooltip : "Delete Meeting Log",
				detailTooltip : "Detail Meeting Log",
			},
			message : {
				selectMsg : "Please, select 1 sprint.",
			},
			title : {
				insertTitle : "Insert Meeting Log",
				updateTitle : "Update Meeting Log",
				detailTitle : "Detail Meeting Log",
			}
		},
		spr2001:{
			submit: "Complete",
			label : {
				sprNm : "Sprint Title",
				rptMem: "Meeting Members",
				rptNm :"Title",
				rptDesc : "Desciption",
			},
			button : {
				insertBtn : "Insert Meeting Log",
				updateBtn : "Update Meeting Log",
			},
			placeholder:{
				rptNm : "Title",
				select2 : "Click or Search Text"
			},
			message : {
				select2 : "If not, the writer is automatically added."
			}
		},
		spr2100:{
			title :"Memoris List",
			button:{
				detailBtn : "Detail",
			},
			actionBtn:{
				title : "Upd / Del / Det",
				selectTooltip : "Select Memoris",
				insertTooltip : "Insert Memoris",
				updateTooltip : "Update Memoris",
				deleteTooltip : "Delete Memoris",
				detailTooltip : "Detail Memoris",
			},
			message : {
				selectMsg : "Please, select 1 sprint.",
			},
			title : {
				insertTitle : "Insert Memoris",
				updateTitle : "Update Memoris",
				detailTitle : "Detail Memoris",
			}
		},
		spr2101:{
			submit: "Complete",
			label : {
				sprNm : "Sprint Title",
				mmrNm :"Title",
				mmrDesc : "Desciption",
			},
			button : {
				insertBtn : "Insert Memoris",
				updateBtn : "Update Memoris",
			},
			placeholder:{
				mmrNM : "Title",
			}
		},
		stm2100:{
			selectStmInfoCnt : "Please, select only 1 board.<br/> ${1} boards have been selected." ,
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
				title : "Upd / Mng / Set",
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
				chargerTitle : "Board Manager List"
			},
			type:{
				normal:"[Normal]",
				gallery:"[Gallery]",
				movie:"[Movie]",
				storage:"[Storage]",
			},
			label:{
				summery : "Summery",
			},
			chart:{
				noData : "No Data",
				newPost : "New Post",
				deletePost : "Delete Post"
			}
		},
		stm2101:{
			update: "Would you like to update this board setting?",
			formCheck:{
				fileCntMessage : "The number of attachments is 1 to 10.<br/> Change to minimum 1.",
				fileMaxCntMessage : "The number of attachments is over.<br/> Change to maximum 10.",
				fileMaxStrgMessage : "Change to maximum storage by board type.",
				fileMaxStrgOutMessage : "Maximum storage is over.<br/> Change to maximum storage(${1}).",
			},
			label:{
				name: "Board Name",
				type : "Type",
				dsType : "Disclosure Scope",
				option : "Option",
				noticeCheck : "Notice",
				commentCheck : "Comment",
				secretCheck : "Secret Post",
				attachFileCheck : "Attachments",
				tagCheck : "Tag",
				fileCount : "Attachments Count",
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
				fileAllCntY: "Total Attachments : ${1}",
				fileAllCntN: "Total Attachments : -",
				fileAllSizeY: "Total Attachments Storage : ${1}",
				fileAllSizeN: "Total Attachments Storage : -",
			},
			label:{
				notice : "Notice",
				comment : "Comment",
				board : "Post",
				tag : "Tag",
				attachFile : "Attachments",
			}
		},
		stm2200:{
			title:{
				authGrpList: "시스템권한 그룹 ",
				authList: "시스템 메뉴 권한",
				insert: "신규 시스템 권한 그룹 등록",
				update: "시스템 권한 그룹 수정",
				view: "시스템 권한 그룹 상세보기",
			},
			actionBtn : {
				updateBtn : "시스템 권한 그룹 수정",
				deleteBtn : "시스템 권한 그룹 삭제",
				clickBtn  : "시스템 메뉴 권한 조회",
				dblClickBtn : "시스템 권한 그룹 상세보기"
			},
			button:{
				title:{
					insert: "시스템 권한 그룹 추가",
					update: "시스템 권한 그룹 수정",
					delete: "시스템 권한 그룹 삭제",
					select: "시스템 권한 그룹 조회",
				}
			},
		},
		stm2201:{
			complete: "완료",
			insert:{
				saveString: "시스템 권한 그룹을 등록하시겠습니까?",
				saveBtnString: "등록 완료",
			},
			update:{
				saveString: "시스템 권한 그룹을  수정하시겠습니까?",
				saveBtnString: "수정 완료",
			},
			label : {
				authGrpNm: "권한그룹 명",
				ord: "순번",
				usrTyp: "사용자 유형",
				acceptUseCd: "접수권한 사용유무",
				useCd: "사용유무",
				authGrpDesc: "비고"
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
				common:{
					selectConnection:"Select connection check",
					allConnection:"Check all connections"
				},
				jenkins:{
					selectTooltip: "Jenkins Select",
					insertTooltip: "Jenkins Insert",
					updateTooltip: "Jenkins Update",
					deleteTooltip: "Jenkins Delete",
					selectConnectionTooltip: "Selected Jenkins connection check",
					allConnectionTooltip: "All Jenkins connection check"
				},
				job:{
					selectTooltip: "Job Select",
					insertTooltip: "Job Insert",
					updateTooltip: "Job Update",
					deleteTooltip: "Job Delete",
					selectConnectionTooltip: "Selected Job connection check",
					allConnectionTooltip: "All Job connection check"
				}
			},
			actionBtn:{
				jenkins:{
					updateBtn:"Jenkins Update",
					deleteBtn:"Jenkins Delete",
					dblClickBtn:"Jenkins Detail Info"
				},
				job:{
					updateBtn:"Job Update",
					deleteBtn:"Job Delete",
					dblClickBtn:"Job Detail Info"
				}
			},
			modal:{
				jeknins:{
					insertJenkins:"Register new Jenkins settings",
					updateJenkins:"Modify Jenkins settings",
					detailJenkins:"Detail Info"
				},
				job:{
					insertJob:"Register new Job settings",
					updateJob:"Modify Job settings",
					detailJob:"Detail Info"
				}
			}
		},
		stm9001:{
			label:{
				jenkinsName : "JENKINS NAME",
				jenkinsUrl : "JENKINS URL",
				jenkinsUserId : "USER ID",
				tokenKey: "TOKEN KEY",
				jenkinsUseCd : "JENKINS Use",
				jenkinsDesc : "JENKINS Description",
			},
			button:{
				insert : "Complete",
				update : "Update completed"
			},
			message:{
				confirm:{
					insert:"Would you like to register a new jenkins?",
					update:"Would you like to edit the jenkins information?"
				}
			}
		},
		bad1000:{
			selectBadInfoCnt : "Please, select only 1 post.<br/> ${1} posts have been selected" ,
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
			label:{
				deleteBadge: "Delete",
				noticeBadge: "Notice",
			},
			field:{
				tagNm:"Tag",
				
				badContent: "Content",
				badNtcCheck : "Notice",
				delCd:"Delete",
				cmtContent:"Comment",
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
				attachFile : "Attachments",
				tag: "Tag",
				comment:"Comment",
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
				fileCntMessage : "The number of attachments possible is ${1}.",
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
				attachFile : "Attachments",
				tag : "Tag",
			},
			button:{
				insertSubmit:"Insert Submit",
				submit : "Submit",
			},
			placeholder:{
				badTitle : "Title",
				badContent : "Content",
				password : "4 to 12 letters of alphabet and number combination.",
				nullPassword : "If blank, the old password is used.",
			},
			regex:{
				password : "4 to 12 letters of alphabet and number combination.",
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
				attachFile : "Attachments",
				tag : "Tag",			
			},
			button:{
				deleteResetBtn:"Delete Reset",
				updateSubmit : "Update Request",
				submit : "Submit",
			}
		},
		bad1004:{
			passwordMiss : "It doesn’t match the password for this post.<br/> Please try again.",
			title:{
				detail:"Detail Post",
			},
			text : "This is secret post.<br/> You must entered password.",
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
        
        init: function() {
        	
    		var langList = ["ko","en"];
    		
    		
    		var langData = {};
    		
    		$.each(langList, function(idx, map){
    			langData[map] = lang[map];
    		});
    		
    		$.osl.langData = langData;
    		
    		
    		$.osl.date.init();
        }
    };
}();