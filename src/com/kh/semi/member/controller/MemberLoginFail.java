package com.kh.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.MemberVO;

@WebServlet("/memberLoginFail.me")
public class MemberLoginFail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberLoginFail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberVO requestMember = new MemberVO();
		
		requestMember.setmId(id);
		requestMember.setmPwd(password);
		
		MemberVO responseMember = new MemberService().loginMember(requestMember);
		
		if(responseMember == null) {
			String loginFail = "fail";
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			new Gson().toJson(loginFail, response.getWriter());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
