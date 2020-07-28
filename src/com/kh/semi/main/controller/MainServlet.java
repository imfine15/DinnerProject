package com.kh.semi.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.main.model.service.MainService;
import com.kh.semi.board.model.*;
import com.kh.semi.board.model.vo.BoardUpVo;
/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/ma")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<BoardUpVo> boardList = new MainService().selectBoardList();
		ArrayList<BoardUpVo> courseList = new MainService().selectCourseList();
		
		request.setAttribute("boardList", boardList);
		//request.setAttribute("courseList", courseList);
		
		request.getRequestDispatcher("views/main/main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
