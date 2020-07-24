package com.kh.semi.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.search.model.service.SearchService;
import com.kh.semi.search.model.vo.PageInfo;

@WebServlet("/searchEnp.se")
public class SearchEnpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchEnpServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		
		int currentPage; // 현재 페이지를 표시할 변수
    	int limit; // 한 페이지에서 게시글이 몇 개 보여질 것인지 표시할 변수
    	int maxPage; // 전체 페이지에서 가장 마지막 페이지
    	int startPage; // 한 번에 표시될 페이지가 시작할 페이지
    	int endPage; // 한 번에 표시될 페이지가 끝나는 페이지
    	
    	// 게시판은 보통 1페이지부터 시작한다
    	currentPage = 1;
    	
    	if(request.getParameter("currentPage") != null) {
    		currentPage = Integer.parseInt(request.getParameter("currentPage"));
    	}
    	
    	// 한 페이지에 보여질 목록 갯수
    	limit = 6;
    	
    	// 전체 목록 갯수 조회
    	int listCount = new SearchService().getEnpCount(search);
    	
    	// 총 페이지 수 계산
    	maxPage = (int) ((double)listCount / limit + 0.9);
    	
    	// 현재 페이지에 보여줄 시작 페이지 수(10개씩 보여지게 할 경우)
    	// 아래 쪽 페이지 수가 10개씩 보여진다면
    	// 1, 11, 21, 31, ...
    	startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1) * 10 + 1;
    	
    	// 목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, ...)
    	endPage = startPage + 10 - 1;
    	
    	if(maxPage < endPage) {
    		endPage = maxPage;
    	}
    	
    	PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
    	
    	ArrayList<EnpVO> enpList = new SearchService().searchEnp(pi, search);
    	
    	String page = "";
    	if(enpList != null) {
    		page = "views/searchResult/searchResult.jsp";
    		request.setAttribute("enpList", enpList);
    		request.setAttribute("pi", pi);
    		request.setAttribute("search", search);
    	} else {
    		page = "views/common/errorPage.jsp";
    		request.setAttribute("msg", "검색 실패");
    	}
    	
    	request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
