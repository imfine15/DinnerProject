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

		MemberVO requestMember = new MemberVO();
		
		requestMember.setmId(id);
		requestMember.setmPwd(password);
		requestMember.setmName(name);
		requestMember.setmEmail(email);
		requestMember.setmPhone(phone);
		requestMember.setmGender(gender);
		requestMember.setmNickname(nickName);
		
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
