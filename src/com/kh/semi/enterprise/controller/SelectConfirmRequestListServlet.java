package com.kh.semi.enterprise.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.enterprise.model.vo.PageInfo;
import com.kh.semi.payment.model.vo.ReservationVO;

/**
 * Servlet implementation class SelectConfirmRequestListServlet
 */
@WebServlet("/selectConfirmRequestList.en")
public class SelectConfirmRequestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectConfirmRequestListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;	//현재 페이지를 표시할 변수
		int limit;	//한 페이지에 게시글이 몇 개 보여질 것인지 표시
		int maxPage;	//전체 페이지에서 가장 마지막 페이지
		int startPage;	//한 번에 표시될 페이지가 시작할 페이지
		int endPage;	//한 번에 표시될 페이지가 끝나는 페이지
		
		
		//게시판은 1페이지부터 시작
		currentPage = 1;
		
		//전달받은 리퀘스트가 있다면 전달받은 값으로 덮어씀
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		String enp = request.getParameter("enpId");
		//한 페이지에 보여질 목록 갯수
		limit = 5;
		
		//전체 목록 갯수 조회
		int listCount = new EnpService().getListCount();
		System.out.println(listCount);
		
		//총 페이지 수 계산
		//예를 들면 목록 갯수가 123개면
		//총 필요한 페이지 수는 13개
		maxPage = (int)((double) listCount / limit + 0.9);
		
		//현재 페이지에 보여줄 시작 페이지 수 (10개씩 보여지게 할 경우)
		//아래 쪽 페이지 수가 10개씩 보여진다면
		//1, 11 , 21,.... 
		startPage = (((int)((double)currentPage/10 +0.9))-1)*10 +1;
		
		//목록 아래쪽에 보여질 마지막 페이지 수 (10,20,30...)
		endPage = startPage + 10- 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<ReservationVO> list = new EnpService().selectCRList(pi,enp);
		
		String page = "";
		
		if(list != null) {
			page = "views/enterprise/confirmRequest/confirmRequest.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
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
