package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.board.model.service.BoardService;
import com.kh.semi.board.model.vo.BoardUpVo;

@WebServlet("/selectReply.pa")
public class SelectReplayListWithPagingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SelectReplayListWithPagingServlet() {
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
		
		String bNo = request.getParameter("no");
		
		int listCount = new BoardService().getReplyListCount(bNo);
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
		ArrayList<BoardUpVo> replyList = new BoardService().selectReplyList(bNo, pi);
		ArrayList<Object> rlist = new ArrayList<>();
		rlist.add(replyList);
		rlist.add(pi);
		System.out.println("replyList : " + rlist);
		System.out.println("===========");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(rlist, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
