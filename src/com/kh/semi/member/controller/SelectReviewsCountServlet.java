package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.board.model.vo.BoardVO;
import com.kh.semi.member.model.service.MemberService;

@WebServlet("/selectReviews.me")
public class SelectReviewsCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SelectReviewsCountServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mNo = request.getParameter("mNo");
		
		int currentPage = 1;	// 현재페이지
		int limit;			// 한 페이지당 보여지는 갯수
		int maxPage;		// 페이지갯수 max
		int startPage;		// 시작페이지
		int endPage;		// 마지막페이지
		
		if(request.getParameter("curval") != null) {
			currentPage = Integer.parseInt(request.getParameter("curval"));	
		}
		
		limit = 10;
		
		int listCount = new MemberService().getBoardPostListCount(mNo);
		
		maxPage = (int)((double)listCount / limit + 0.9);
	      startPage = ( ( (int)( (double)currentPage / 10 + 0.9) ) -1) *10 + 1;
	      endPage = startPage + 10 - 1;
	      
	      if(maxPage < endPage) {
	         endPage = maxPage;
	      }
	      
	    PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<BoardVO> blist = new MemberService().selectPostList(mNo, pi);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
