package com.kh.semi.enterprise.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.ForCmVO;



/**
 * Servlet implementation class SelectCommentManageListServlet
 */
@WebServlet("/selectCML.en")
public class SelectCommentManageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectCommentManageListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String enp = request.getParameter("enpId");
		System.out.println("enpId : " + enp);
		
		ArrayList<ForCmVO> list = new EnpService().selectCmList(enp);
		
		
		
		String page = "";
		if(list != null) {
			page = "views/enterprise/commentManage/commentManage.jsp";
			request.setAttribute("cmList", list);
			request.setAttribute("asd", 3);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);

		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
