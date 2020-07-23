package com.kh.semi.enterprise.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;

/**
 * Servlet implementation class UpdateConfirmRequestServlet
 */
@WebServlet("/updateRequest.en")
public class UpdateConfirmRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateConfirmRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enp = request.getParameter("enpId");
		String rno = request.getParameter("rno");
		
		System.out.println("enpId : : : : " + enp);
		System.out.println("rno  : : : : :" + rno);
		
		int result = new EnpService().updateCrList(rno);
		
		
		String page = "";
		if(result > 0 ) {
			page = "selectConfirmRequestList.en";
			request.setAttribute("enp", enp);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "조회 실패");
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
