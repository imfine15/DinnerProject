package com.kh.semi.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.vo.BoardUpVo;

/**
 * Servlet implementation class UpdateBoardServlet
 */
@WebServlet("/updateBoard.bo")
public class UpdateBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardNo = request.getParameter("boardNo");
		String boardTitle = request.getParameter("boardTitle");
		String hashtags = request.getParameter("hashtags");
		String[] content = request.getParameterValues("content"); 
		String boardContent = "";
		
		for(int i = 0; i <content.length;i++) {
			if(content.length-1==i) {
				boardContent+=content[i];
			} else {
				boardContent+=content[i]+"$$$";
				
			}
		}
		
		System.out.println("boardNo : " + boardNo);
		System.out.println("boardTitle : " + boardTitle);
		System.out.println("hashtags : " + hashtags);
		System.out.println("boardContent : " + boardContent);
		
		BoardUpVo board = new BoardUpVo();
		board.setBoardTitle(boardTitle);
		board.setBoardNo(boardNo);
		board.setHashTags(hashtags);
		board.setBoardContent(boardContent);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
