package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	//명시한 이름, 값, 유지 기간 조건으로 새로운 쿠키를 생성
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
		Cookie cookie = new Cookie(cName,cValue);
		cookie.setPath("/");
		cookie.setMaxAge(cTime);
		response.addCookie(cookie);		
	}
	
	//명시한 이름의 쿠키를 찾아 그 값을 반환
	public static String readCookie(HttpServletRequest request, String cName) {
		Cookie[] cookies = request.getCookies();
		String cookieValue="";
		for(Cookie c : cookies) {
			String name = c.getName();
			if(cName.equals(name)) {
				cookieValue = c.getValue();
				return cookieValue;
			}
		}
		return cookieValue;
	}
	
	//명시한 이름의 쿠키 삭제
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response,cName,"",0);
	}
}
