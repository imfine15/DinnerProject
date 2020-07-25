package com.kh.semi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.ad.model.service.AdService;
import com.kh.semi.ad.model.vo.AdVO;
import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.board.model.vo.BoardVO;
import com.kh.semi.notice.model.vo.AdminNoticeVO;

/**
 * Servlet implementation class SelectAdminMainServlet
 */
@WebServlet("/select.ma")
public class SelectAdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdminMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage;	
		int limit;			
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 5;
		
		int listAdminCount = new AdminService().getListAdminCount();
		int listBCount = new AdminService().getListBCount();
				
		PageInfo pi = new PageInfo(currentPage, listAdminCount, limit);
		PageInfo piB = new PageInfo(currentPage, listBCount, limit);
		
		ArrayList<AdminNoticeVO> list = new AdminService().selectMainList(pi);	
		ArrayList<BoardVO> listB = new AdminService().selectMainbList(piB);
		
		HttpSession session = request.getSession();
		
		String page = "";
		
		if(list != null) {
			page ="views/admin/main/mainAdmin.jsp";
			request.setAttribute("list", list);	
			request.setAttribute("listB", listB);
			request.setAttribute("pi", pi);
			request.setAttribute("piB", piB);
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
