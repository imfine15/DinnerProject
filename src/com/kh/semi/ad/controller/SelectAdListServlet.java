package com.kh.semi.ad.controller;

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
import com.kh.semi.enterprise.model.vo.EnpUpVo;

/**
 * Servlet implementation class SelectAdListServlet
 */
@WebServlet("/selectAdList.ad")
public class SelectAdListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		int listCount = new AdService().getListCount();
		
		System.out.println("listCount : " + listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage / 10 + 0.9)) -1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<AdVO> list = new AdService().selectList(pi);
		
		System.out.println("list : " + list);
		
		HttpSession session = request.getSession();
		
		String page = "";
		
		if(list != null) {
			page ="views/admin/adQuestion/adQuestionList.jsp";
			request.setAttribute("list", list);	
			request.setAttribute("pi", pi);
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
