package com.kh.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.enterprise.model.vo.EnpUpVo;

/**
 * Servlet implementation class SelectOneEnterpriseServlet
 */
@WebServlet("/selectOneEnt.up")
public class SelectOneEnterpriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneEnterpriseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enpNo = request.getParameter("no");
		
		HttpSession session = request.getSession();
		
		EnpUpVo enpUp = new AdminService().selectOneEnp(enpNo);
		EnpAttachment ea = new AdminService().selectOneEnpFile(enpNo);
		
		
		String page ="";
		
		if(enpUp != null && ea != null) {
			page = "views/admin/restaurant/restaurantUploadCheck.jsp";
			session.setAttribute("enpUp", enpUp);
			session.setAttribute("ea", ea);
			
		} else {
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
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
