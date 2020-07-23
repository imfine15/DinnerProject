package com.kh.semi.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.review.model.service.ReviewService;

@WebServlet("/checkVisit.re")
public class CheckVisitReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckVisitReservationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mNo = request.getParameter("mNo");
		String enpNo = request.getParameter("enpNo");
		
		String[] datas = new ReviewService().checkVisit(mNo, enpNo);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(datas, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
