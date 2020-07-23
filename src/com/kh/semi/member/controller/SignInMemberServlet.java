package com.kh.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		MemberVO requestMember = new MemberVO();
		
		requestMember.setmId(id);
		requestMember.setmPwd(password);
		MemberVO responseMember = new MemberService().loginMember(requestMember);
		
		if(responseMember != null) {
			if(responseMember.getStatus().equals("Y")) {
				// 탈퇴한 유저 로그인 시도
				// db 다녀오면서 30일 지났는지 검사
				request.setAttribute("msg", "탈퇴한 아이디입니다.<br>다시 YUMEET을 이용하시려면 재가입해주세요.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			} else {
				// 로그인 성공
				session.setAttribute("loginUser", responseMember);
				response.sendRedirect(backPage);
			}
		} else if(responseMember == null) {
			// 로그인 실패
			request.setAttribute("msg", "로그인에 실패했습니다.<br>아이디, 비밀번호를 확인해주세요.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
