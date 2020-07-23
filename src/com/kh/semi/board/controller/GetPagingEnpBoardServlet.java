package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.board.model.service.BoardService;
import com.kh.semi.board.model.vo.BoardVO;
import com.kh.semi.board.model.vo.PageInfo;

@WebServlet("/getEnpBoard.bo")
public class GetPagingEnpBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetPagingEnpBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sort = request.getParameter("sort");
		
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
    	limit = 3;
    	
    	// 전체 목록 갯수 조회
    	int listCount = new BoardService().getEnpBoardCount();
    	
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
    	
    	ArrayList<BoardVO> enpBoardList = new BoardService().selectEnpBoard(sort, pi);
    	
    	ArrayList<Object> temp = new ArrayList<>();
    	temp.add(enpBoardList);
    	temp.add(pi);
    	
    	if(enpBoardList != null) {
    		response.setContentType("application/json");
    		response.setCharacterEncoding("UTF-8");
    		
    		new Gson().toJson(temp, response.getWriter());
    	} else {
    		request.setAttribute("msg", "조회 실패");
    		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
    	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
