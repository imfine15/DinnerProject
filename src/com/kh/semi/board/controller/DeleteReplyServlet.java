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
 * Servlet implementation class DeleteReplyServlet
 */
@WebServlet("/deleteReply.bo")
public class DeleteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyNo = request.getParameter("replyNo");
		String boardNo = request.getParameter("boardNo");
		
		System.out.println("boardNo : " + boardNo);
		
		BoardUpVo reply = new BoardUpVo();
		reply.setReplyNo(replyNo);
		
		System.out.println("reply : " + reply);
		
		int result = new BoardService().deleteReply(reply);
		
		HttpSession session = request.getSession();
		
		BoardUpVo board = new BoardService().selectOneBoard(boardNo);
		ArrayList<HashMap<String, Object>> list2 = null;
		
			
		list2 = new BoardService().selectThumbnailList(boardNo);
		
		ArrayList<BoardUpVo> replyList = new BoardService().selectReplyList(boardNo);
		
		
		
		
		String page = "";
		if(result > 0) {
			//page="views/admin/reviewConfirm/reviewConfirmDetail.jsp";
			session.setAttribute("list2", list2);
			session.setAttribute("board", board);
			session.setAttribute("boardNo", boardNo);
			request.setAttribute("replyList", replyList);
			request.setAttribute("reply", reply);
			response.sendRedirect("/semiproject/selectOneBoard.up?no="+boardNo);
		} else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
