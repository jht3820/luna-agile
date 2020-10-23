package egovframework.com.cmm.annotation;


import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME) 
public @interface IncludedInfo {
	String name() default "";		// 컴포넌트의 한글 이름
	String listUrl() default "";	// 컴포넌트의 목록정보조회를 위한 URL
	int order() default 0;			// 자동 생성되는 메뉴 목록에 표시되는 순서
	int gid() default 0;			// 컴포넌트의 Group ID(대분류 구분)
}
