package com.kh.semi.enterprise.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;

/**
 * Servlet implementation class InsertCmCommentServlet
 */
@WebServlet("/insertComment.en")
public class InsertCmCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCmCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comment = request.getParameter("commentTextArea");
		String reviewNum = request.getParameter("rn");
		String enpNo = request.getParameter("enpNo");
		
		int result = 0;
		
		result = new EnpService().insertComment(reviewNum,comment,enpNo);
		
		
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectCML.en?enpId=" + enpNo);
			page="views/enterprise/commentManage/commentManage.jsp";
		}else {
			response.sendRedirect(request.getContextPath() + "/selectCML.en?enpId=" + enpNo);
		}
		//response.sendRedirect(page);
		//request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
