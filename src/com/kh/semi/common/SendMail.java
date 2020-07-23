package com.kh.semi.common;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public static void main(String[] args) {

		/*PORT = 25:non-ssl, 465:ssl, 587:tls */
		Properties props = System.getProperties();
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "25");
		props.put("defaultEncoding", "utf-8");
		props.put("mail.smtp.auth", "true");
		System.out.println(System.getProperties());

		final String userId = "dydxkr113";
		final String userPw = "wjddydxkr";

		try {
			String sender = "dydxkr113@naver.com"; //보내는사람 메일주소. ex) mailSender@naver.com
			String subject = "메일 테스트"; //메일 제목
			String body = "ㅁ ㅏ 메일 받아라 !!"; //메일 본문

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String un=userId;
				String pw=userPw;
				
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					System.out.println(un);
					System.out.println(pw);
					return new javax.mail.PasswordAuthentication(un, pw);
				}
			});
			

			session.setDebug(false); //Debug 모드 설정.

			Message mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress(sender)); 

			// 받는 사람 이메일주소 세팅
			InternetAddress[] toAddr = new InternetAddress[1];
			toAddr[0] = new InternetAddress ("thespiae81@gmail.com");

			mimeMessage.setRecipient(Message.RecipientType.TO, toAddr[0] ); //수신자 셋팅

			mimeMessage.setSubject(subject); //제목 세팅
			mimeMessage.setText(body); //본문 세팅

			//메일 발송
			Transport.send(mimeMessage);

			System.out.println("메일 발송 성공!!");
		} catch (Exception e) {
			System.out.println("메일보내기 오류 : "+ e.getMessage());
		}
	}

}