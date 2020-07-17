package com.kh.semi.search.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.BoardService;
import com.kh.semi.board.model.vo.BoardVO;
import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.search.model.service.SearchService;

@WebServlet("/searchEnp.se")
public class SearchEnpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchEnpServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		
		List<EnpVO> enpList = new SearchService().searchEnp(search);
		List<HashMap<String, Integer>> enpMenus = new SearchService().getMenus(enpList);
		List<BoardVO> viewSortBoardList = new BoardService().viewSortBoard();
		List<BoardVO> dateSortBoardList = new BoardService().dateSortBoard();
		List<BoardVO> rateSortBoardList = new BoardService().rateSortBoard();
		
		String page = "views/searchResult/searchResult.jsp";
		request.getSession().setAttribute("search", search);
		request.getSession().setAttribute("enpList", enpList);
		request.getSession().setAttribute("enpMenus", enpMenus);
		request.getSession().setAttribute("viewSortBoardList", viewSortBoardList);
		request.getSession().setAttribute("dateSortBoardList", dateSortBoardList);
		request.getSession().setAttribute("rateSortBoardList", rateSortBoardList);
		response.sendRedirect(page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
