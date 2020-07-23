package com.kh.semi.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.board.model.vo.BoardVO;
import com.kh.semi.search.model.service.SearchService;

@WebServlet("/getBestCourseReview.se")
public class GetBestCourseReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetBestCourseReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<BoardVO> bestCourse = new SearchService().getBestCourse();
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(bestCourse, response.getWriter());

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
