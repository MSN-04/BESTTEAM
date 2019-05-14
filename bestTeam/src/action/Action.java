package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public interface Action {
	/*
	 * XXXAction 클래스로부터 요청이 들어올 때, 서로 다른 클래스들의 요청이지만
	 * 부모 타입인 Action 인터페이스를 상속받은 상태이므로
	 * 각 요청을 받아들일 execute() 메서드를 강제하기 위해 추상메서드를 정의한 인터페이스 Action 을 설계하고
	 * XXXAction 클래스에서 Action 인터페이스를 구현하도록 한다!
	 * => XXXAction 클래스들을 다형성을 활용하여 처리하기 위한 Action 인터페이스를 통해 추상메서드 제공
	 *      => 리턴타입 ActionForward 클래스 지정
	 *      => 매개변수로 HTTP 요청을 위한 HttpServletRequest 객체와 HTTP 응답을 위한 HttpServletResponce 객체를 전달받음
	 *      => 인터페이스 내에서 예외 처리가 불가능하므로 throws 키워드를 사용하여 외부로 예외(Exception)를 던짐
	 */
	ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
