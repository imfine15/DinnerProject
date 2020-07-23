package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.board.model.service.BoardService;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.MemberVO;
import com.kh.semi.payment.model.vo.PointVO;

@WebServlet("/selectPointList.py")
public class SelectPointListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectPointListServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;	// 현재페이지
		int limit;			// 한 페이지당 보여지는 갯수
		int maxPage;		// 페이지갯수 max
		int startPage;		// 시작페이지
		int endPage;		// 마지막페이지
		
		currentPage = Integer.parseInt(request.getParameter("curval"));	
		limit = 10;
		
		HttpSession session = request.getSession();
		
		String mNo = request.getParameter("mNo");
		
		int listCount = new MemberService().getPointListCount(mNo);
		
		maxPage = (int)((double)listCount / limit + 0.9);
	      startPage = ( ( (int)( (double)currentPage / 10 + 0.9) ) -1) *10 + 1;
	      endPage = startPage + 10 - 1;
	      
	      if(maxPage < endPage) {
	         endPage = maxPage;
	      }
	      System.out.println("currentPage : " + currentPage);
			System.out.println("maxPage : " + maxPage);
			System.out.println("startPage : " + startPage);
			System.out.println("endPage : " + endPage);
			System.out.println("=========================");
	      
	    PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList<PointVO> pointVO = new MemberService().selectPointHisList(mNo, pi);
		System.out.println("pointVO : " + pointVO);
		System.out.println("pi : " + pi);
		ArrayList<Object> plist = new ArrayList<>();
		plist.add(pointVO);
		plist.add(pi);
		
		String page = "views/myPage/myPoint.jsp";
		String papp = "/semiproject/views/payment/paymentCancel.jsp";
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(plist, response.getWriter());
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
