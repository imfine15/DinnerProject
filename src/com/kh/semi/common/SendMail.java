package com.kh.semi.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public static void naverMailSend() {
       
		String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		final String user = "yumeet505"; //발신자의 이메일 아이디를 입력
		final String password = "whatdinner!";         //발신자 이메일의 패스워드를 입력
		int port = 465;

        // SMTP 서버 정보를 설정한다.
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com"); 
		prop.put("mail.smtp.port", 587); 
		prop.put("mail.smtp.auth", "true"); 
//		prop.put("mail.smtp.ssl.enable", "true"); 
//		prop.put("mail.smtp.ssl.trust", "smtp.naver.com");
        
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

		 try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));

	            //수신자메일주소
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress("hjin_94@naver.com")); 

	            // Subject
	            message.setSubject("제목을 입력하세요"); //메일 제목을 입력

	            // Text
	            message.setText("내용을 입력하세요");    //메일 내용을 입력

	            // send the message
	            Transport.send(message); ////전송
	            System.out.println("message sent successfully...");
	        } catch (AddressException e) {
	        	System.out.println("에러");
	        	e.printStackTrace();
	        } catch (MessagingException e) {
	        	System.out.println("에러");
	            e.printStackTrace();
	        }
    }

}