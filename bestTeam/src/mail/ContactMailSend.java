package mail;

import static db.JdbcUtil.getConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.UserDAO;
import vo.ActionForward;

@WebServlet("/mailsend")
public class ContactMailSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactMailSend() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Random r =new Random();
		StringBuffer buf =new StringBuffer();
		for(int i=0;i<11;i++){
		    // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.
		    if(r.nextBoolean()){
		        buf.append((char)((int)(r.nextInt(26))+97));
		    }else{
		        buf.append((r.nextInt(10)));
		    }
		}
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		Action action = null;
		ActionForward forward = null;
		
		request.setCharacterEncoding("UTF-8");
		String receiver = "bestTeamEver@bestTeamEver.com";
		String sender = request.getParameter("email");
		System.out.println(receiver);
		System.out.println(buf);
		System.out.println(buf.toString());
		String subject = "[TINKERVELL 문의] "+request.getParameter("subject");
		String content = request.getParameter("content");
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.port", "587"); //gmail 포트
			Authenticator auth = new GoogleAuthentication();
			Session s = Session.getDefaultInstance(properties,auth);
			Message message = new MimeMessage(s);
			Address sender_address = new InternetAddress(sender);
			Address receiver_address = new InternetAddress(receiver);
			message.setHeader("content-type", "text/html; charset=UTF-8");
			message.setFrom(sender_address);
			message.addRecipient(Message.RecipientType.TO, receiver_address);
			message.setSubject(subject);
			message.setContent(content,"text/html; charset=UTF-8");
			message.setSentDate(new java.util.Date());
			Transport.send(message);
		} catch (Exception e) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('SMTP 서버가 잘못 설정되었거나, 서비스에 문제가 있습니다.')");
			out.println("history.back()");
			out.println("</script>");
			e.printStackTrace();
		}
	}
}
