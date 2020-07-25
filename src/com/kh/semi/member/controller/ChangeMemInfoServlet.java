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

@WebServlet("/changeMemInfo.me")
public class ChangeMemInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ChangeMemInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		HttpSession session = request.getSession();
		
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		MemberVO changeMember = new MemberVO();
		changeMember.setmNickname(nickName);
		changeMember.setmPhone(phone);
		changeMember.setmEmail(email);
		changeMember.setmName(name);
		changeMember.setmNo(m.getmNo());
		
		int result = new MemberService().updateMemInfo(changeMember);
		if(result > 0) {
			m.setmNickname(nickName);
			m.setmPhone(phone);
			m.setmEmail(email);
			m.setmName(name);
			session.setAttribute("loginUser", m);
			response.sendRedirect("views/myPage/changeMyProfile.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
