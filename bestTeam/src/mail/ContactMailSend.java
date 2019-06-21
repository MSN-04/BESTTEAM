package mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
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
		request.setCharacterEncoding("UTF-8");

		String receiver = "tinkervell0624@gmail.com";
		String sender = request.getParameter("sender");
		String subject = "[TINKERVELL 문의] "+request.getParameter("subject");
		String content = request.getParameter("content") + "보낸사람 : " + sender;
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
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('메일이 발송 되었습니다')");
			out.println("history.back()");
			out.println("</script>");
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
