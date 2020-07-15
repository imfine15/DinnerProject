package com.kh.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.MemberVO;

@WebServlet("/signIn.me")
public class SignInMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignInMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		String backPage = (String) session.getAttribute("backPage");
		
		System.out.println(backPage);
		MemberVO requestMember = new MemberVO();
		
		requestMember.setmId(id);
		requestMember.setmPwd(password);
		MemberVO responseMember = new MemberService().loginMember(requestMember);
		
		if(responseMember != null) {
			// 로그인 성공
			System.out.println("responseMember : " + responseMember);
			session.setAttribute("loginUser", responseMember);
			response.sendRedirect(backPage);
			
		} else {
			// 로그인 실패
			System.out.println("로그인 실패");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
