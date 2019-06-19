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

/*
 * Servlet implementation class MailSendServlet
 * 
 */
	@WebServlet("/mailSend")
	public class MailSendServlet extends HttpServlet{
		private static final long serialVersionUID = 1L;
		/*
		 * @see HttpServlet#HttpServlet()
		 */
		public MailSendServlet() {
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
			String sender = "bestTeamEver@bestTeamEver.com";
			String receiver = request.getParameter("email");
			System.out.println(receiver);
			System.out.println(buf);
			System.out.println(buf.toString());
			String subject = "[CAFE THINKERVELL]임시비밀번호 발송";
//			String content = request.getParameter("content");
			String content = "임시비밀번호 입니다."+ buf;
			response.setContentType("text/html;charset=UTF-8");
			
			PrintWriter out = response.getWriter();
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
				Connection con = getConnection();
				UserDAO userDAO = UserDAO.getInstance();
				userDAO.setConnection(con);
				int result = userDAO.passUpdate(buf.toString(),receiver);
				if(result==1) {
					con.commit();
					out.println("<script>");
					out.println("alert('메일로 임시비밀번호가 발송되었습니다.')");
					out.println("history.back()");
					out.println("</script>");
					forward = new ActionForward();
					forward.setPath("/member/forgotAccount.jsp");
				}else {
					con.rollback();
					out.println("<script>");
					out.println("alert('오류발생')");
					out.println("history.back()");
					out.println("</script>");
				}
//				out.println("<h3>메일이 정상적으로 전송되었습니다.</h3>");
				System.out.println(result);
			} catch (Exception e) {
				out.println("SMTP 서버가 잘못 설정되었거나, 서비스에 문제가 있습니다.");
				e.printStackTrace();
			}
		}
	
	}
	
	