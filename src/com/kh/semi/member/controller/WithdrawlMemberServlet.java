package com.kh.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.MemberVO;

@WebServlet("/withdrawl.me")
public class WithdrawlMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WithdrawlMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberVO requestMember = new MemberVO();
		requestMember.setmId(id);
		requestMember.setmPwd(pwd);
		
		int result1 = new MemberService().withdrawalMember(requestMember); // 회원 테이블 
		int result2 = new MemberService().withdrawalHistory(requestMember); // 탈퇴내역 테이블
		int result = result1 + result2;
		
		String page = "";
		if(result > 1) {
			page = "views/main/main.jsp";
			request.getSession().setAttribute("loginUser", null);
			response.sendRedirect(page);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 탈퇴에 실패했습니다.<br>다시 한번 시도해보세요.<br>증상이 지속된다면, 문의를 남겨주세요.");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
