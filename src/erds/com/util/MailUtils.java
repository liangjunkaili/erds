package erds.com.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

/**
 * 发送邮件工具类
 * 
 * @author seawind
 * 
 */
public class MailUtils {
	private static String targetSMTP = "smtp.163.com";// SMTP服务器地址
	private static String user = "wusiedu@163.com"; // 发件账户
	private static String pass = "Ws15326955163"; // 发件密码

	// 创建邮件服务器链接会话
	public static Session createSession() {
		Properties properties = new Properties();
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.host", targetSMTP);
		properties.put("mail.smtp.auth", "true");// 连接认证
		properties.put("mail.debug", "true");// 在控制台显示连接日志信息
		Session session = Session.getInstance(properties);// 与邮件服务器连接会话

		return session;
	}

	// 发送邮件
	public static void sendMail(Session session, Message message)
			throws Exception {
		Transport transport = session.getTransport();
		transport.connect(user, pass);
		transport.sendMessage(message, message.getAllRecipients());
	}
	
	
	public static void main(String[] args) throws MessagingException {
		Session session = MailUtils.createSession();
		MimeMessage message = new MimeMessage(session);
		message.setFrom("wusiedu@163.com");
		message.setRecipients(Message.RecipientType.TO, "m18550442795@163.com");
		message.setContent("zheshiyigeduanxin", "text/html;charset=GB2312");
		try {
			sendMail(session,message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
