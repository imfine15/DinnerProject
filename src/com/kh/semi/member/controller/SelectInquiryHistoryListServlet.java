package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.MemberVO;
import com.kh.semi.question.model.vo.QuestionVO;

@WebServlet("/selectInquiryList.py")
public class SelectInquiryHistoryListServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
    
    public SelectInquiryHistoryListServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		String mNo = m.getmNo();
				
		int currentPage = 1;	// 현재페이지
		int limit;			// 한 페이지당 보여지는 갯수
		int maxPage;		// 페이지갯수 max
		int startPage;		// 시작페이지
		int endPage;		// 마지막페이지
		
		currentPage = Integer.parseInt(request.getParameter("curval"));	
		limit = 10;
		
		int listCount = new MemberService().getInquiryListCount(mNo);
		
		maxPage = (int)((double)listCount / limit + 0.9);
	      startPage = ( ( (int)( (double)currentPage / 10 + 0.9) ) -1) *10 + 1;
	      endPage = startPage + 10 - 1;
	      
	      if(maxPage < endPage) {
	         endPage = maxPage;
	      }
	      
	    PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	    ArrayList<QuestionVO> qlist = new MemberService().selectInqHistoryList(pi, mNo);
	    
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
