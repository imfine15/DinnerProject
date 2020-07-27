package com.kh.semi.enterprise.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpVO;

/**
 * Servlet implementation class SignInEnterpriseServlet
 */
@WebServlet("/signIn.en")
public class SignInEnterpriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInEnterpriseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		EnpVO requestEnp = new EnpVO();
		requestEnp.setPartnerId(id);
		requestEnp.setPartnerPwd(password);
		
		
		EnpVO loginEnp = new EnpService().loginCheck(requestEnp);
		
		
		if(loginEnp != null) {
			request.getSession().setAttribute("loginEnp", loginEnp);
			request.setAttribute("currentPage", 1);
			request.getRequestDispatcher("selectConfirmRequestList.en?enpId="+loginEnp.getEnpNo()).forward(request, response);
		}else {
			request.setAttribute("msg", "로그인 에러!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
