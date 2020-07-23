package com.kh.semi.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Pattern;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail { 
	protected Session session = null;
	protected List<Map<String, String>> recievers = new ArrayList<>();
	protected List<Map<String, String>> ccs = new ArrayList<>();
	protected List<Map<String, String>> bccs = new ArrayList<>();
	public String sender;
	public String senderDescription;
	public String subject;
	public String content;
	
	public SendMail() throws Exception { 

	}
	
	public void sendTest() { 
		Properties props = new Properties();
		props.put("mail.smtp.host", MailConfig.HOST);
		props.put("mail.smtp.port", MailConfig.PORT);
		
		if (MailConfig.AUTH != null && MailConfig.AUTH.equalsIgnoreCase("true")) { 
			props.put("mail.smtp.protocol", MailConfig.PROTOCOL);
			props.put("mail.smtp.auth", MailConfig.AUTH);
			
			if (MailConfig.HOST != null && MailConfig.HOST.indexOf("gmail") > -1) { 
				props.put("mail.smtp.starttls.enable", "true"); 
				props.setProperty("javax.net.ssl.SSLSocketFactory", "mail.smtp.socketFactory.class");
			}
		} 
		
		Authenticator auth = null;
		
		if (MailConfig.AUTH != null && MailConfig.AUTH.equalsIgnoreCase("true")) { 
			auth = new DefaultAuthenitcator(MailConfig.USER, MailConfig.PASSWORD);
		}
		
		this.session = Session.getInstance(props, auth);
		
		try { 
			MimeMessage message = new MimeMessage(this.session);
			message.setFrom((Address)new InternetAddress(this.sender, this.senderDescription));
			
			for (Map<String, String> reciever : this.recievers) { 
				boolean check = Pattern.matches("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+", reciever.get("reciever"));
				
				if (check) { 
					message.addRecipient(Message.RecipientType.TO, (Address)new InternetAddress(reciever.get("reciever"), reciever.get("desc")));
				}
			}
			
			for (Map<String, String> reciever : this.ccs) { 
				boolean check = Pattern.matches("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+", reciever.get("reciever"));
				
				if (check) { 
					message.addRecipient(Message.RecipientType.CC, (Address)new InternetAddress(reciever.get("reciever"), reciever.get("desc")));
				}
				
			}
			
			for (Map<String, String> reciever : this.bccs) { 
				boolean check = Pattern.matches("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+", reciever.get("reciever"));
				
				if (check) { 
					message.addRecipient(Message.RecipientType.BCC, (Address)new InternetAddress(reciever.get("reciever"), reciever.get("desc")));
				}
			} 
			
			message.setSubject(subject, "UTF-8");
			message.setText(content, "UTF-8");
			message.setHeader("content-Type", "text/html;charset=UTF-8");
			Transport.send((Message)message);
		}
		catch (Exception ex) { 
			ex.printStackTrace();
		}
		
	}
	
	public void addRecievers(String reciever, String recieverDesc) { 
		Map<String, String> map = new HashMap<>();
		map.put("reciever", reciever);
		map.put("desc", recieverDesc);
		this.recievers.add(map);
	}
	
	public void addRecievers(List<Map<String, String>> recievers) { 
		this.recievers.addAll(recievers);
	}
	
	public void addCCRecievers(String reciever, String recieverDesc) { 
		Map<String, String> map = new HashMap<>();
		map.put("reciever", reciever);
		map.put("desc", recieverDesc);
		this.ccs.add(map);
	}
	
	public void addCCRecievers(List<Map<String, String>> recievers) { 
		this.ccs.addAll(recievers);
	}
	
	public void addCarbonCopys(String reciever, String recieverDesc) { 
		Map<String, String> map = new HashMap<>();
		map.put("reciever", reciever);
		map.put("desc", recieverDesc);
		this.ccs.add(map);
	}
	
	public void addCarbonCopys(List<Map<String, String>> recievers) { 
		this.ccs.addAll(recievers);
	}
	
	public void addBCCRecievers(String reciever, String recieverDesc) { 
		Map<String, String> map = new HashMap<>();
		map.put("reciever", reciever);
		map.put("desc", recieverDesc);
		this.bccs.add(map);
	}
	
	public void addBCCRecievers(List<Map<String, String>> recievers) { 
		this.bccs.addAll(recievers);
	}
	
	public void addBlindCarbonCopys(String reciever, String recieverDesc) { 
		Map<String, String> map = new HashMap<>();
		map.put("reciever", reciever);
		map.put("desc", recieverDesc);
		this.bccs.add(map);
	}
	
	public void addBlindCarbonCopys(List<Map<String, String>> recievers) { 
		this.bccs.addAll(recievers);
	}
	
	public void setSender(String sender, String senderDescription) { 
		this.sender = sender;
		this.senderDescription = senderDescription;
	}
	
	public void setSubject(String subject) { 
		this.subject = subject;
	}
	
	public void setContent(String content) { 
		this.content = content;
	}
	
	public static void main(String[] args) { 
		try { 
			SendMail test = new SendMail();
			test.setSubject("메일 테스트 제목입니다");
			test.setContent("메일 내용 입니다");
			test.setSender("hong@domain.com", "홍길동");
			test.addRecievers("lee@domain.com", "이순신");
			// test.addBCCRecievers("lee@domain.com", "이순신");
			// test.addCCRecievers("lee@domain.com", "이순신");
			test.sendTest();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}

class DefaultAuthenitcator extends Authenticator { 
	protected String id = null;
	protected String pw = null;
	
	public DefaultAuthenitcator(String id, String pw) { 
		this.id = id; this.pw = pw;
	}
	
	public void setUserID(String id) { 
		this.id = id;
	}
	
	public void setPassword(String pw) { 
		this.pw = pw;
	}
	
	protected PasswordAuthentication getPasswordAuthentication() {
		return (this.id != null && !this.id.equals("") && this.pw != null && !this.pw.equals("")) ? new PasswordAuthentication(this.id, this.pw) : null;
	}
	
}

class MailConfig { 
	public static final String MAIL_AUTH = "mail.smtp.auth";
	public static final String MAIL_PROTOCOL = "mail.smtp.protocol";
	public static final String MAIL_USER = "mail.smtp.id"; 
	public static final String MAIL_PASSWORD = "mail.smtp.pw";
	public static final String MAIL_SENDER = "mail.smtp.sender";
	public static final String MAIL_HOST = "mail.smtp.host";
	public static final String MAIL_PORT = "mail.smtp.port";
	public static final String MAIL_GOOGLE_TLS = "mail.smtp.starttls.enable"; 
	public static final String MAIL_GOOGLE_FACTORY = "javax.net.ssl.SSLSocketFactory";
	public static final String MAIL_THROW_EXCEPTION = "mail.exception";
	public static final String AUTH = "true";
	public static final String PROTOCOL = "smtp";
	public static final String USER = "user";
	public static final String PASSWORD = "password"; 
	public static final String HOST = "mail.domain.com";
	public static final String PORT = "587";
	public static final String GOOGLE_TLS = "true";
	public static final String GOOGLE_FACTORY = "mail.smtp.socketFactory.class";
}