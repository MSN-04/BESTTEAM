package vo;

public class ActionForward {
	/*
	 * 포워딩 정보를 저장하는 클래스
	 * - 서블릿에서 클라이언트 요청을 받아 처리한 후, View 페이지로 포워딩할 때
	 *   이동할 View 페이지의 주소와 포워딩 방식(Dispatch 또는 Redirect) 을 다루기 위한 클래스
	 * - URL 주소를 저장할 변수(path)와 포워딩 방식을 저장할 변수(isRedirect) 선언 및 Getter/Setter 정의
	 */
	private String path; // 서블릿 요청 처리 후 포워딩 할 view 페이지의 URL 저장할 변수
	private boolean isRedirect; // 포워딩 방식 저장할 변수(true : Redirect 방식, false : Dispatch)
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
}
