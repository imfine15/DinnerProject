package com.kh.semi.enterprise.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;

/**
 * Servlet implementation class InsertExceptionServlet
 */
@WebServlet("/insertException.en")
public class InsertExceptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertExceptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enpNo = request.getParameter("enpNo");
		String enpId = request.getParameter("enpId");
		String reason = request.getParameter("reason");
		String enpName = request.getParameter("partnerName");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String enp = request.getParameter("enpId");

		int result = new EnpService().insertException(enpNo,enpId,reason,enpName,tel,email);
		
		String page ="";
		if(result>0) {
			page = "/selectCalculateList.en?enpId="+enp;
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "이의신청 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
