/**
 	* function 명 	: OSLCoreLangSetting
	* function 설명	: core에서 사용되는 언어 데이터를 세팅한다.
	*/
var OSLCoreLangSetting = function () {
	//언어 세팅 데이터
	var lang = {};
	//한국어
	lang["ko"] = {
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
				delete: "삭제"
			},
			action:{
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
				projectDetail: "상세 정보"
			}
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
		},
		stm2100:{
			selectStmInfoCnt : "1건의 게시판만 선택하세요.\n${1}건의 게시판이 선택되었습니다." ,
			notAuthority : {
					basic : "해당 게시판에 대한 권한이 없습니다.",
			},
		},
		bad1000:{
			selectBadInfoCnt : "1건의 게시글만 선택하세요.\n${1}건의 게시글이 선택되었습니다." ,
			notAuthority : {
					basic : "해당 게시글에 대한 권한이 없습니다.",
					insertMessage : "게시글 등록 권한이 없습니다.",
					selectMessage : "해당 게시글에 대한 읽기 권한이 없습니다.",
					updateMessage : "해당 게시글에 대한 수정 권한이 없습니다.",
					deleteMessage : "해당 게시글에 대한 삭제 권한이 없습니다.",
			},
			notWriter : {
				deleteMessage : "본인이 작성한 게시글만 삭제 가능합니다.",
			}
		},
		bad1001:{
			notAuthority : {
				restoreMessage : "해당 댓글에 대한 복원 권한이 없습니다.",
				deleteMessage : "해당 게시글에 대한 삭제 권한이 없습니다.",
				deleteCmtMessage : "해당 댓글에 대한 삭제 권한이 없습니다.",
			},
			notCmtWriter : {
				deleteMessage : "본인이 작성한 댓글만 삭제 가능합니다.",
			}
		},
		bad1002:{
			formCheck : {
				fileCntMessage : "첨부파일 가능한 개수는 ${1}개입니다.",
				passwordMessage : "비밀글에 사용할 비밀번호를 입력해주세요.",
				passwordMatching : "입력된 비밀번호가 서로 다릅니다.",
				tagMatching : "태그값이 중복됩니다.",
			}
		},
		bad1004:{
			passwordMiss : "비밀번호가 틀렸습니다.\n다시입력하세요.",
		}
	};
	
	//영어
	lang["en"] = {
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
				title:{
					select: "Data Select",
					insert: "Data Insert",
					update: "Data Update",
					delete: "Data Delete",
				}
			},
			action:{
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