package com.kh.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.MemberVO;

@WebServlet("/signUp.me")
public class SignUpMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignUpMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String nickName = request.getParameter("nickName");
		String name = request.getParameter("name").replace(" ", ""); // 모든 공백 제거
		String gender = request.getParameter("gender"); // male/female
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String admit = request.getParameter("admit"); // 동의했을경우 on
		String termsAdmit = "0";
		if(admit.equals("on")) {
			termsAdmit = "1"; // 비동의시 0, 동의시 1
		}
		
		MemberVO requestMember = new MemberVO();
		
		requestMember.setId(id);
		requestMember.setPassword(password);
		requestMember.setName(name);
		requestMember.setEmail(email);
		requestMember.setPhone(phone);
		requestMember.setGender(gender);
		requestMember.setNickName(nickName);
		requestMember.setTermsAdmit(termsAdmit);
		
		int result = new MemberService().insertMember(requestMember);
		
		if(result > 0) {
			System.out.println("회원 정보 입력에 성공했습니다.");
		} else {
			System.out.println("회원 정보 입력에 실패했습니다.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
