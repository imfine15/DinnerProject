package com.kh.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;

@WebServlet("/changeMemPwd.ma")
public class ChangeMemPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ChangeMemPwdServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String changePwd = request.getParameter("password");
		String mNo = request.getParameter("mNo");
		System.out.println("password : " + changePwd);
		int result = new MemberService().changePwd(changePwd, mNo);
		
		response.sendRedirect("/semiproject/views/myPage/myPage.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
