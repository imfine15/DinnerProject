package com.kh.semi.search.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.search.model.service.SearchService;

@WebServlet("/changePwd.se")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePasswordServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestPassword = request.getParameter("password");
		String requestId = request.getParameter("requestId");
		String alertPassword = request.getParameter("alertPassword");
		String[] datas = {requestPassword, requestId};
		
		int result = new SearchService().changePassword(datas);
		
		String page = "";
		if(result > 0) {
			request.setAttribute("msg", "임시 비밀번호" + alertPassword + "로 변경되었습니다.\\n로그인 후 비밀번호를 즉시 변경하는 것을 권장합니다.");
			request.setAttribute("password", alertPassword);
			page = "views/findPwd/findPwdTemp.jsp";
		} else {
			request.setAttribute("msg", "비밀번호 찾기 및 변경에 실패했습니다.<br>증상이 지속되면 고객센터로 문의해주세요.");
			page = "views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
