package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.board.model.service.BoardService;
import com.kh.semi.board.model.vo.BoardUpVo;

/**
 * Servlet implementation class SelectOneCourseServlet
 */
@WebServlet("/selectOneCourse")
public class SelectOneCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardNo = request.getParameter("no");
		
		HttpSession session = request.getSession();
		
		BoardUpVo board = new BoardService().selectOneBoard(boardNo);
		ArrayList<HashMap<String, Object>> list2 = null;
		
			
		list2 = new BoardService().selectThumbnailList(boardNo);
		
		ArrayList<BoardUpVo> replyList = new BoardService().selectReplyList(boardNo);
		
		String page = "";
		if(list2 != null) {
			page="views/reviews/courseReview.jsp";
			session.setAttribute("list2", list2);
			session.setAttribute("board", board);
			request.setAttribute("replyList", replyList);
		} else {
			page="views/common/errorPage.jsp";
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
