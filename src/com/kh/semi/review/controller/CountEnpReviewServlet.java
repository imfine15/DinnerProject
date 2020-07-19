package com.kh.semi.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.review.model.service.ReviewService;

@WebServlet("/countComment.re")
public class CountEnpReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CountEnpReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enpNo = request.getParameter("enpNo");
		
		int count = new ReviewService().countReview(enpNo);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(count, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
