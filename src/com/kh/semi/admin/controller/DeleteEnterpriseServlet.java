package com.kh.semi.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.enterprise.model.vo.EnpUpVo;

/**
 * Servlet implementation class DeleteEnterpriseServlet
 */
@WebServlet("/deleteEnt.up")
public class DeleteEnterpriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEnterpriseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enpNo = request.getParameter("enpNo");
		
		
		EnpUpVo enpUp = new EnpUpVo();
		enpUp.setEnpNo(enpNo);
		
		int currentPage;	
		int limit;			
		int maxPage;		
		int startPage;		
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new AdminService().getListCount();
		
		System.out.println("listCount : " + listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage / 10 + 0.9)) -1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		
		int result = new AdminService().deleteEnterprise(enpUp);
		
		ArrayList<EnpUpVo> list = new AdminService().selectList(pi);
		System.out.println("list : " + list);
		System.out.println("result : " + result);
		
		//HttpSession session = request.getSession();
		
		String page ="";
		
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
//
//		PrintWriter out = response.getWriter();
//
//		out.println("게시글을 삭제"); 
//		out.close();

		if(result > 0) {
			if(list != null) {
				//page="views/admin/restaurant/restaurantUpload.jsp";
				request.setAttribute("list", list);
				request.setAttribute("pi", pi);
				response.sendRedirect("/semiproject/selectEntList.up");
			} else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "게시글 조회 실패");
				request.getRequestDispatcher(page).forward(request, response);

			}
		} else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 삭제 실패");
			request.getRequestDispatcher(page).forward(request, response);
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
