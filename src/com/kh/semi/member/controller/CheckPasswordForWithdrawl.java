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

@WebServlet("/pwdCheck.me")
public class CheckPasswordForWithdrawl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckPasswordForWithdrawl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String result = "fail";
		
		MemberVO requestMember = new MemberVO();
		requestMember.setmId(id);
		requestMember.setmPwd(password);
		
		int count = new MemberService().checkPassword(requestMember);
		
		if(count != 0) {
			result = "success";
		} else if(count == 0) {
			result = "fail";
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(result, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
