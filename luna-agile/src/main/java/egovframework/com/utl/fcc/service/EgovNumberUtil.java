/**
 * @Class Name  : EgovNumberUtil.java
 * @Description : 숫자 데이터 처리 관련 유틸리티
 * @Modification Information
 *
 *     수정일         수정자                   수정내용
 *     -------          --------        ---------------------------
 *   2009.02.13       이삼섭                  최초 생성
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 02. 13
 * @version 1.0
 * @see
 *
 */

package egovframework.com.utl.fcc.service;

import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EgovNumberUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovNumberUtil.class);

    
    public static int getRandomNum(int startNum, int endNum) {
		int randomNum = 0;

		// 랜덤 객체 생성
		SecureRandom rnd = new SecureRandom();

		do {
			// 종료숫자내에서 랜덤 숫자를 발생시킨다.
			randomNum = rnd.nextInt(endNum + 1);
		} while (randomNum < startNum); // 랜덤 숫자가 시작숫자보다 작을경우 다시 랜덤숫자를 발생시킨다.

		return randomNum;
    }

    
    public static Boolean getNumSearchCheck(int sourceInt, int searchInt) {
    	String sourceStr = String.valueOf(sourceInt);
		String searchStr = String.valueOf(searchInt);

		// 특정숫자가 존재하는지 하여 위치값을 리턴한다. 없을 시 -1
		if (sourceStr.indexOf(searchStr) == -1) {
			return false;
		} else {
			return true;
		}
    }

    
    public static String getNumToStrCnvr(int srcNumber) {
		String rtnStr = null;

		rtnStr = String.valueOf(srcNumber);

		return rtnStr;
    }


    
    public static String getNumToDateCnvr(int srcNumber) {

		String pattern = null;
		String cnvrStr = null;

		String srcStr = String.valueOf(srcNumber);

		// Date 형태인 8자리 및 14자리만 정상처리
		if (srcStr.length() != 8 && srcStr.length() != 14) {
			throw new IllegalArgumentException("Invalid Number: " + srcStr + " Length=" + srcStr.trim().length());
		}

		if (srcStr.length() == 8) {
			pattern = "yyyyMMdd";
		} else if (srcStr.length() == 14) {
			pattern = "yyyyMMddhhmmss";
		}

		SimpleDateFormat dateFormatter = new SimpleDateFormat(pattern, Locale.KOREA);

		Date cnvrDate = null;

		try {
			cnvrDate = dateFormatter.parse(srcStr);
		} catch (ParseException e) {
			LOGGER.error("ERROR parsing", e.getMessage());
		}

		cnvrStr = String.format("%1$tY-%1$tm-%1$td", cnvrDate);

		return cnvrStr;

    }

    
	public static Boolean getNumberValidCheck(String checkStr) {

		int i;
		//String sourceStr = String.valueOf(sourceInt);

		int checkStrLt = checkStr.length();

		for (i = 0; i < checkStrLt; i++) {

			// 아스키코드값( '0'-> 48, '9' -> 57)
			if (checkStr.charAt(i) > 47 && checkStr.charAt(i) < 58) {
				continue;
			} else {
				return false;
			}
		}

		return true;
    }

    

    public static int getNumberCnvr(int srcNumber, int cnvrSrcNumber, int cnvrTrgtNumber) {

		// 입력받은 숫자를 문자열로 변환
		String source = String.valueOf(srcNumber);
		String subject = String.valueOf(cnvrSrcNumber);
		String object = String.valueOf(cnvrTrgtNumber);

		StringBuffer rtnStr = new StringBuffer();
		String preStr = "";
		String nextStr = source;

		// 원본숫자에서 변환대상숫자의 위치를  찾는다.
		while (source.indexOf(subject) >= 0) {
			preStr = source.substring(0, source.indexOf(subject)); // 변환대상숫자 위치까지 숫자를 잘라낸다
			nextStr = source.substring(source.indexOf(subject) + subject.length(), source.length());
			source = nextStr;
			rtnStr.append(preStr).append(object); // 변환대상위치 숫자에 변환할 숫자를 붙여준다.
		}
		rtnStr.append(nextStr); // 변환대상 숫자 이후 숫자를 붙여준다.

	return Integer.parseInt(rtnStr.toString());
    }

    
    public static int checkRlnoInteger(double srcNumber) {

	// byte 1바이트 		▶소수점이 없는 숫자로, 범위 -2^7 ~ 2^7 -1
	// short 2바이트		▶소수점이 없는 숫자로, 범위 -2^15 ~ 2^15 -1
	// int 4바이트 		▶소수점이 없는 숫자로, 범위 -2^31 ~ 2^31 - 1
	// long 8바이트 		▶소수점이 없는 숫자로, 범위 -2^63 ~ 2^63-1

	// float 4바이트		▶소수점이 있는 숫자로, 끝에 F 또는 f 가 붙는 숫자 (예:3.14f)
	// double 8바이트	▶소수점이 있는 숫자로, 끝에 아무것도 붙지 않는 숫자 (예:3.14)
	//							▶소수점이 있는 숫자로, 끝에 D 또는 d 가 붙는 숫자(예:3.14d)

		String cnvrString = null;

		if (srcNumber < 0) {
			return -1;
		} else {
			cnvrString = String.valueOf(srcNumber);

			if (cnvrString.indexOf(".") == -1) {
				return 0;
			} else {
				return 1;
			}
		}
	}
}
