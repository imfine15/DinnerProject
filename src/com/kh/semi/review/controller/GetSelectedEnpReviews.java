package com.kh.semi.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.review.model.service.ReviewService;
import com.kh.semi.review.model.vo.ReviewVO;

@WebServlet("/getEnpReviews.re")
public class GetSelectedEnpReviews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetSelectedEnpReviews() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enpNo = ((EnpVO)(request.getSession().getAttribute("selectedEnp"))).getEnpNo();
		List<ReviewVO> visitReviews = new ReviewService().getSelectedEnpVisitReviews(enpNo);
		List<ReviewVO> normalReviews = new ReviewService().getSelectedEnpNormalReviews(enpNo);
		
		request.getSession().setAttribute("visitReviews", visitReviews);
		request.getSession().setAttribute("normalReviews", normalReviews);
		
		response.sendRedirect("views/restaurantInfo/restaurantInfo.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
